unit LUX.GPU.OpenGL.Viewer;

interface //#################################################################### ■

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Platform.Win,
  Winapi.Windows, Winapi.OpenGL, Winapi.OpenGLext,
  LUX, LUX.D3, LUX.D4, LUX.M4, LUX.FMX.Forms,
  LUX.GPU.OpenGL,
  LUX.GPU.OpenGL.Window,
  LUX.GPU.OpenGL.Atom.Buffer.Unifor,
  LUX.GPU.OpenGL.Scener,
  LUX.GPU.OpenGL.Camera;

type
  TGLViewer = class(TFrame)
  private
    { private 宣言 }
    procedure GoMouseClick( Sender_:TObject; Button_:TMouseButton; Shift_:TShiftState; X_,Y_:Single );
    procedure GoMouseDown( Sender_:TObject; Button_:TMouseButton; Shift_:TShiftState; X_,Y_:Single ); inline;
    procedure GoMouseMove( Sender_:TObject; Shift_:TShiftState; X_,Y_:Single ); inline;
    procedure GoMouseUp( Sender_:TObject; Button_:TMouseButton; Shift_:TShiftState; X_,Y_:Single ); inline;
    procedure GoMouseWheel( Sender_:TObject; Shift_:TShiftState; WheelDelta_:Integer; var Handled_:Boolean ); inline;
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
    function GetPixSiz :System.Types.TSize;
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
    property Form   :TCommonCustomForm  read   _Form                ;
    property WND    :HWND               read   _WND                 ;
    property DC     :HDC                read   _DC                  ;
    property PixSiz :System.Types.TSize read GetPixSiz              ;
    property Camera :TGLCamera          read   _Camera write _Camera;
    ///// イベント
    property OnPaint :TProc read _OnPaint write _OnPaint;
    ///// メソッド
    procedure Repaint;
    procedure RecreateDC;
    procedure BeginGL;
    procedure EndGL;
    procedure BeginRender;
    procedure EndRender;
    function MakeScreenShot :FMX.Graphics.TBitmap;
    function ShootRay( const X_,Y_:Single ) :TSingleRay3D;
    function PickObject( const X_,Y_:Single ) :TGLObject;
  end;

implementation //############################################################### ■

{$R *.fmx}

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLViewer.GoMouseClick( Sender_:TObject; Button_:TMouseButton; Shift_:TShiftState; X_,Y_:Single );
begin
     MouseClick( Button_, Shift_, X_, Y_ );
end;

procedure TGLViewer.GoMouseDown( Sender_:TObject; Button_:TMouseButton; Shift_:TShiftState; X_,Y_:Single );
begin
     _Form.MouseCapture;

     MouseDown( Button_, Shift_, X_, Y_ );
end;

procedure TGLViewer.GoMouseMove( Sender_:TObject; Shift_:TShiftState; X_,Y_:Single );
begin
     MouseMove( Shift_, X_, Y_ );
end;

procedure TGLViewer.GoMouseUp( Sender_:TObject; Button_:TMouseButton; Shift_:TShiftState; X_,Y_:Single );
begin
     MouseUp( Button_, Shift_, X_, Y_ );

     _Form.ReleaseCapture;
end;

procedure TGLViewer.GoMouseWheel( Sender_:TObject; Shift_:TShiftState; WheelDelta_:Integer; var Handled_:Boolean );
begin
     MouseWheel( Shift_, WheelDelta_, Handled_ );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLViewer.GetRootForm :TForm;
begin
     Result := Self.Root.GetObject as TForm;

     Assert( Assigned( Result ), 'Failed! TGLViewer.GetRootWND' );
end;

function TGLViewer.GetRootWND :HWND;
begin
     Result := WindowHandleToPlatform( GetRootForm.Handle ).Wnd;

     Assert( Result > 0, 'Failed! TGLViewer.GetRootWND' );
end;

function TGLViewer.GetPixSiz :System.Types.TSize;
begin
     with Result do
     begin
          Width  := Round( _Form.Width  * Scene.GetSceneScale );
          Height := Round( _Form.Height * Scene.GetSceneScale );
     end;
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

     Assert( Winapi.Windows.SetParent( _WND, GetRootWND ) > 0, 'Failed! SetParent @ TGLViewer.ParentChanged' );

     _Form.Visible := Self.ParentedVisible;
end;

procedure TGLViewer.Paint;
begin
     BeginRender;

       with GetPixSiz do glViewport( 0, 0, Width, Height );

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
     _Form := TCommonCustomForm.CreateNew( Self );

     with _Form do
     begin
          BorderStyle := TFmxFormBorderStyle.None;

          OnMouseClick := GoMouseClick;
          OnMouseDown  := GoMouseDown ;
          OnMouseMove  := GoMouseMove ;
          OnMouseUp    := GoMouseUp   ;
          OnMouseWheel := GoMouseWheel;

          HandleNeeded;

          _WND := WindowHandleToPlatform( Handle ).Wnd;
     end;

     SetWindowLong( _WND, GWL_STYLE, WS_CHILD or WS_CLIPSIBLINGS );
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
                       else _Viewer[ 0 ] := TSingleM4.Identity;

end;

//------------------------------------------------------------------------------

procedure TGLViewer.CreateDC;
begin
     _DC := GetDC( _WND );

     Assert( _DC > 0, 'Failed! TGLViewer.CreateDC' );

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

       Assert( wglMakeCurrent( _DC, _OpenGL_.RC ), 'Failed! TGLViewer.BeginGL' );
end;

procedure TGLViewer.EndGL;
begin
       Assert( wglMakeCurrent( _DC, 0 ), 'Failed! TGLViewer.EndGL' );

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

     EndGL;

     SwapBuffers( _DC );
end;

//------------------------------------------------------------------------------

function TGLViewer.MakeScreenShot :FMX.Graphics.TBitmap;
var
   Cs :TArray<TAlphaColor>;
   C, B :PAlphaColor;
   Bs :TBitmapData;
   S, Y :Integer;
begin
     Result := FMX.Graphics.TBitmap.Create;

     with Result do
     begin
          SetSize( GetPixSiz );

          SetLength( Cs, Height * Width );

          C := @Cs[ 0 ];

          BeginGL;
            glReadBuffer( GL_FRONT );
            glReadPixels( 0, 0, Width, Height, GL_BGRA, GL_UNSIGNED_BYTE, C );
          EndGL;

          Map( TMapAccess.Write, Bs );

          S := SizeOf( TAlphaColor ) * Width;

          for Y := Height-1 downto 0 do
          begin
               B := Bs.GetScanline( Y );

               System.Move( C^, B^, S );

               Inc( C, Width );
          end;

          Unmap( Bs );
     end;
end;

//------------------------------------------------------------------------------

function TGLViewer.ShootRay( const X_,Y_:Single ) :TSingleRay3D;
var
   M :TSingleM4;
   S, P0, P1 :TSingle4D;
begin
     M := _Camera.AbsoPose * _Camera.Proj.Inverse * _Viewer[ 0 ].Inverse;

     with GetPixSiz do
     begin
          S.X :=     X_ / Width  * 2 - 1;
          S.Y := 1 - Y_ / Height * 2    ;
          S.W := 1;
     end;

     S.Z := -1;  P0 := M * S;
     S.Z := +1;  P1 := M * S;

     with Result do
     begin
          Pos :=               P0.ToCart  ;
          Vec := Pos.UnitorTo( P1.ToCart );
     end;
end;

function TGLViewer.PickObject( const X_,Y_:Single ) :TGLObject;
begin
     Result := _Camera.Scener.HitRay( ShootRay( X_, Y_ ) );
end;

end. //######################################################################### ■
