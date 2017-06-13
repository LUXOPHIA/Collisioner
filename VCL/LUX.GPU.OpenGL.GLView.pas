unit LUX.GPU.OpenGL.GLView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Winapi.OpenGL, Winapi.OpenGLext,
  LUX, LUX.M4, LUX.GPU.OpenGL, LUX.GPU.OpenGL.VCL, LUX.GPU.OpenGL.Buffer.Unif, LUX.GPU.OpenGL.Camera;

type
  TGLView = class(TFrame)
  private
    { Private 宣言 }
    ///// メソッドU
    procedure WMPaint( var Message_:TWMPaint ); message WM_PAINT;
    procedure WMEraseBkgnd( var Message_:TWmEraseBkgnd ); message WM_ERASEBKGND;
  protected
    _DC     :HDC;
    _Viewer :TGLBufferU<TSingleM4>;
    _Camera :TGLCamera;
    ///// イベント
    _OnPaint :TProc;
    ///// メソッド
    procedure Resize; override;
    procedure CreateWnd; override;
    procedure DestroyWnd; override;
    procedure CreateDC;
    procedure DestroyDC;
  public
    { Public 宣言 }
    constructor Create( AOwner_:TComponent ); override;
    destructor Destroy; override;
    ///// プロパティ
    property DC     :HDC       read _DC                  ;
    property Camera :TGLCamera read _Camera write _Camera;
    ///// イベント
    property OnPaint :TProc read _OnPaint write _OnPaint;
    ///// メソッド
    procedure RecreateDC;
    procedure BeginGL;
    procedure EndGL;
    procedure BeginRender;
    procedure EndRender;
  end;

implementation //############################################################### ■

{$R *.dfm}

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLView.WMEraseBkgnd( var Message_:TWmEraseBkgnd );
begin
     ///// 背景描画を無効化
end;

procedure TGLView.WMPaint( var Message_:TWMPaint );
begin
     inherited;

     BeginRender;

       glViewport( 0, 0, ClientWidth, ClientHeight );

       if Assigned( _Camera ) then _Camera.Render;

       _OnPaint;

     EndRender;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLView.Resize;
begin
     inherited;

     if not( csDestroying in ComponentState ) then
     begin
          if Height < Width then _Viewer[ 0 ] := TSingleM4.Scale( Height / Width, 1, 1 )
                            else
          if Width < Height then _Viewer[ 0 ] := TSingleM4.Scale( 1, Width / Height, 1 )
                            else _Viewer[ 0 ] := TSingleM4.Identify;

          Self.Repaint;
     end;
end;

//------------------------------------------------------------------------------

procedure TGLView.CreateWnd;
begin
     inherited;

     CreateDC;
end;

procedure TGLView.DestroyWnd;
begin
     DestroyDC;

     inherited;
end;

//------------------------------------------------------------------------------

procedure TGLView.CreateDC;
begin
     _DC := GetDC( Handle );

     _OpenGL_.ApplyPixelFormat( _DC );
end;

procedure TGLView.DestroyDC;
begin
     ReleaseDC( Handle, _DC );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLView.Create( AOwner_:TComponent );
begin
     inherited;

     _OnPaint := procedure begin end;

     CreateDC;

     _Viewer := TGLBufferU<TSingleM4>.Create( GL_DYNAMIC_DRAW );
     _Viewer.Count := 1;
end;

destructor TGLView.Destroy;
begin
     _Viewer.DisposeOf;

     DestroyDC;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLView.RecreateDC;
begin
     Self.RecreateWnd;
end;

//------------------------------------------------------------------------------

procedure TGLView.BeginGL;
begin
     _OpenGL_.EndGL;

       wglMakeCurrent( _DC, _OpenGL_.RC );
end;

procedure TGLView.EndGL;
begin
       wglMakeCurrent( _DC, 0 );

     _OpenGL_.BeginGL;
end;

//------------------------------------------------------------------------------

procedure TGLView.BeginRender;
begin
     BeginGL;

       glClearColor( 0, 0, 0, 0 );

       glClear( GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT );

       _Viewer.Use( 2{BinP} );
end;

procedure TGLView.EndRender;
begin
       _Viewer.Unuse( 2{BinP} );

       glFlush;

       SwapBuffers( _DC );

     EndGL;
end;

end. //######################################################################### ■
