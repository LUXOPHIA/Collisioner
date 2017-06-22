unit LUX.GPU.OpenGL.Viewer;

interface //#################################################################### ■

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Platform.Win,
  Winapi.Windows, Winapi.OpenGL, Winapi.OpenGLext,
  LUX, LUX.M4, LUX.GPU.OpenGL, LUX.GPU.OpenGL.FMX, LUX.GPU.OpenGL.Buffer.Unifor, LUX.GPU.OpenGL.Camera;

type
  TGLViewer = class(TFrame)
  private
    { private 宣言 }
    procedure _OnMouseDown( Sender_:TObject; Button_:TMouseButton; Shift_:TShiftState; X_,Y_:Single ); inline;
    procedure _OnMouseMove( Sender_:TObject; Shift_:TShiftState; X_,Y_:Single ); inline;
    procedure _OnMouseUp( Sender_:TObject; Button_:TMouseButton; Shift_:TShiftState; X_,Y_:Single ); inline;
    procedure _OnMouseWheel( Sender_:TObject; Shift_:TShiftState; WheelDelta_:Integer; var Handled_:Boolean ); inline;
  protected
    _Form   :TCommonCustomForm;
    _WND    :HWND;
    _DC     :HDC;
    _Viewer :TGLUnifor<TSingleM4>;
    _Camera :TGLCamera;
    ///// イベント
    _OnPaint :TProc;
    ///// アクセス
    function GetRootForm :TForm;
    function GetRootWND :HWND;
    ///// メソッド
    procedure DoAbsoluteChanged; override;
    procedure ParentChanged; override;
    procedure Paint; override;
    procedure Resize; override;
    procedure AncestorVisibleChanged( const Visible_: Boolean ); override;
    procedure FitWindow;
    procedure CreateWindow;
    procedure CreateDC;
    procedure DestroyDC;
  public
    { public 宣言 }
    constructor Create( AOwner_:TComponent ); override;
    destructor Destroy; override;
    ///// プロパティ
    property Form   :TCommonCustomForm read _Form                ;
    property WND    :HWND              read _WND                 ;
    property DC     :HDC               read _DC                  ;
    property Camera :TGLCamera         read _Camera write _Camera;
    ///// イベント
    property OnPaint :TProc read _OnPaint write _OnPaint;
    ///// メソッド
    procedure Repaint;
    procedure RecreateDC;
    procedure BeginGL;
    procedure EndGL;
    procedure BeginRender;
    procedure EndRender;
  end;

implementation //############################################################### ■

{$R *.fmx}

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLViewer._OnMouseDown( Sender_:TObject; Button_:TMouseButton; Shift_:TShiftState; X_,Y_:Single );
begin
     _Form.MouseCapture;

     MouseDown( Button_, Shift_, X_, Y_ );
end;

procedure TGLViewer._OnMouseMove( Sender_:TObject; Shift_:TShiftState; X_,Y_:Single );
begin
     MouseMove( Shift_, X_, Y_ );
end;

procedure TGLViewer._OnMouseUp( Sender_:TObject; Button_:TMouseButton; Shift_:TShiftState; X_,Y_:Single );
begin
     MouseUp( Button_, Shift_, X_, Y_ );

     _Form.ReleaseCapture;
end;

procedure TGLViewer._OnMouseWheel( Sender_:TObject; Shift_:TShiftState; WheelDelta_:Integer; var Handled_:Boolean );
begin
     MouseWheel( Shift_, WheelDelta_, Handled_ );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLViewer.GetRootForm :TForm;
begin
     Result := Self.Root.GetObject as TForm;
end;

function TGLViewer.GetRootWND :HWND;
begin
     Result := WindowHandleToPlatform( GetRootForm.Handle ).Wnd;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLViewer.DoAbsoluteChanged;
begin
     inherited;

     FitWindow;
end;

procedure TGLViewer.ParentChanged;
begin
     inherited;

     _Form.Visible := Self.ParentedVisible;
end;

procedure TGLViewer.Paint;
begin
     BeginRender;

       glViewport( 0, 0, Round( _Form.Width  * Scene.GetSceneScale ),
                         Round( _Form.Height * Scene.GetSceneScale ) );

       if Assigned( _Camera ) then _Camera.Render;

       _OnPaint;

     EndRender;
end;

procedure TGLViewer.Resize;
begin
     inherited;

     if not ( csLoading in Self.ComponentState ) then FitWindow;
end;

procedure TGLViewer.AncestorVisibleChanged( const Visible_: Boolean );
begin
     inherited;

     _Form.Visible := Visible_;
end;

//------------------------------------------------------------------------------

procedure TGLViewer.CreateWindow;
begin
     _Form := TCommonCustomForm.Create( Self );

     with _Form do
     begin
          BorderStyle := TFmxFormBorderStyle.None;

          OnMouseDown  := _OnMouseDown ;
          OnMouseMove  := _OnMouseMove ;
          OnMouseUp    := _OnMouseUp   ;
          OnMouseWheel := _OnMouseWheel;

          HandleNeeded;

          _WND := WindowHandleToPlatform( Handle ).Wnd;
     end;

     SetWindowLong( _WND, GWL_STYLE, WS_CHILD or WS_CLIPSIBLINGS );

     Winapi.Windows.SetParent( _WND, GetRootWND );
end;

procedure TGLViewer.FitWindow;
var
   R :TRectF;
begin
     R := TRectF.Create( LocalToAbsolute( TPointF.Zero ) * Scene.GetSceneScale, Width, Height );

     _Form.Bounds := R.Round;

     if Height < Width then _Viewer[ 0 ] := TSingleM4.Scale( Height / Width, 1, 1 )
                       else
     if Width < Height then _Viewer[ 0 ] := TSingleM4.Scale( 1, Width / Height, 1 )
                       else _Viewer[ 0 ] := TSingleM4.Identify;

end;

//------------------------------------------------------------------------------

procedure TGLViewer.CreateDC;
begin
     _DC := GetDC( _WND );

     _OpenGL_.ApplyPixelFormat( _DC );
end;

procedure TGLViewer.DestroyDC;
begin
     ReleaseDC( _WND, _DC );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLViewer.Create( AOwner_:TComponent );
begin
     inherited;

     HitTest := False;

     _OnPaint := procedure begin end;

     CreateWindow;

     CreateDC;

     _Viewer := TGLUnifor<TSingleM4>.Create( GL_DYNAMIC_DRAW );
     _Viewer.Count := 1;
end;

destructor TGLViewer.Destroy;
begin
     _Viewer.DisposeOf;

     DestroyDC;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLViewer.Repaint;
begin
     Paint;
end;

//------------------------------------------------------------------------------

procedure TGLViewer.RecreateDC;
begin
     DestroyDC;

     _Form.RecreateResources;

     CreateDC;
end;

//------------------------------------------------------------------------------

procedure TGLViewer.BeginGL;
begin
     _OpenGL_.EndGL;

       wglMakeCurrent( _DC, _OpenGL_.RC );
end;

procedure TGLViewer.EndGL;
begin
       wglMakeCurrent( _DC, 0 );

     _OpenGL_.BeginGL;
end;

//------------------------------------------------------------------------------

procedure TGLViewer.BeginRender;
begin
     BeginGL;

       glClearColor( 0, 0, 0, 0 );

       glClear( GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT );

       _Viewer.Use( 0{BinP} );
end;

procedure TGLViewer.EndRender;
begin
       _Viewer.Unuse( 0{BinP} );

       glFlush;

       SwapBuffers( _DC );

     EndGL;
end;

end. //######################################################################### ■
