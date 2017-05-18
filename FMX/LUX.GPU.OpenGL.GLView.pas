unit LUX.GPU.OpenGL.GLView;

interface //#################################################################### ■

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Winapi.Windows, Winapi.OpenGL, FMX.Platform.Win,
  LUX, LUX.GPU.OpenGL;

type
  TGLView = class(TFrame)
  private
    { private 宣言 }
    procedure _OnMouseDown( Sender_:TObject; Button_:TMouseButton; Shift_:TShiftState; X_,Y_:Single ); inline;
    procedure _OnMouseMove( Sender_:TObject; Shift_:TShiftState; X_,Y_:Single ); inline;
    procedure _OnMouseUp( Sender_:TObject; Button_:TMouseButton; Shift_:TShiftState; X_,Y_:Single ); inline;
    procedure _OnMouseWheel( Sender_:TObject; Shift_:TShiftState; WheelDelta_:Integer; var Handled_:Boolean ); inline;
  protected
    _Form :TCommonCustomForm;
    _WND  :HWND;
    _DC   :HDC;
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
    property Form :TCommonCustomForm read _Form;
    property WND  :HWND              read _WND ;
    property DC   :HDC               read _DC  ;
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

{$R *.fmx}

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLView._OnMouseDown( Sender_:TObject; Button_:TMouseButton; Shift_:TShiftState; X_,Y_:Single );
begin
     MouseDown( Button_, Shift_, X_, Y_ );
end;

procedure TGLView._OnMouseMove( Sender_:TObject; Shift_:TShiftState; X_,Y_:Single );
begin
     MouseMove( Shift_, X_, Y_ );
end;

procedure TGLView._OnMouseUp( Sender_:TObject; Button_:TMouseButton; Shift_:TShiftState; X_,Y_:Single );
begin
     MouseUp( Button_, Shift_, X_, Y_ );
end;

procedure TGLView._OnMouseWheel( Sender_:TObject; Shift_:TShiftState; WheelDelta_:Integer; var Handled_:Boolean );
begin
     MouseWheel( Shift_, WheelDelta_, Handled_ );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLView.GetRootForm :TForm;
begin
     Result := Self.Root.GetObject as TForm;
end;

function TGLView.GetRootWND :HWND;
begin
     Result := WindowHandleToPlatform( GetRootForm.Handle ).Wnd;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLView.DoAbsoluteChanged;
begin
     inherited;

     FitWindow;
end;

procedure TGLView.ParentChanged;
begin
     inherited;

     _Form.Visible := Self.ParentedVisible;
end;

procedure TGLView.Paint;
begin
     BeginRender;

       glViewport( 0, 0, Round( _Form.Width  * Scene.GetSceneScale ),
                         Round( _Form.Height * Scene.GetSceneScale ) );

       _OnPaint;

     EndRender;
end;

procedure TGLView.Resize;
begin
     inherited;

     if not ( csLoading in Self.ComponentState ) then FitWindow;
end;

procedure TGLView.AncestorVisibleChanged( const Visible_: Boolean );
begin
     inherited;

     _Form.Visible := Visible_;
end;

//------------------------------------------------------------------------------

procedure TGLView.CreateWindow;
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

     Winapi.Windows.SetParent( _WND, GetRootWND );
end;

procedure TGLView.FitWindow;
var
   R :TRectF;
begin
     R := TRectF.Create( LocalToAbsolute( TPointF.Zero ) * Scene.GetSceneScale, Width, Height );

     _Form.Bounds := R.Round;
end;

//------------------------------------------------------------------------------

procedure TGLView.CreateDC;
begin
     _DC := GetDC( _WND );

     _OpenGL_.ApplyPixelFormat( _DC );
end;

procedure TGLView.DestroyDC;
begin
     ReleaseDC( _WND, _DC );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLView.Create( AOwner_:TComponent );
begin
     inherited;

     _OnPaint := procedure begin end;

     CreateWindow;

     CreateDC;
end;

destructor TGLView.Destroy;
begin
     DestroyDC;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLView.RecreateDC;
begin
     DestroyDC;

     _Form.RecreateResources;

     CreateDC;
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
end;

procedure TGLView.EndRender;
begin
       glFlush;

       SwapBuffers( _DC );

     EndGL;
end;

end. //######################################################################### ■
