unit LUX.GPU.OpenGL.Viewer;

interface //#################################################################### ■

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  System.Messaging,
  LUX, LUX.D3, LUX.D4, LUX.M4,
  LUX.GPU.OpenGL,
  LUX.GPU.OpenGL.Window,
  LUX.GPU.OpenGL.Atom.Buffer.Unifor,
  LUX.GPU.OpenGL.Scener,
  LUX.GPU.OpenGL.Camera;

type
  TGLViewer = class(TFrame)
  private
    { private 宣言 }
    ///// イベント
    procedure GoMouseClick( Sender_:TObject; Button_:TMouseButton; Shift_:TShiftState; X_,Y_:Single );
    procedure GoMouseDown( Sender_:TObject; Button_:TMouseButton; Shift_:TShiftState; X_,Y_:Single ); inline;
    procedure GoMouseMove( Sender_:TObject; Shift_:TShiftState; X_,Y_:Single ); inline;
    procedure GoMouseUp( Sender_:TObject; Button_:TMouseButton; Shift_:TShiftState; X_,Y_:Single ); inline;
    procedure GoMouseWheel( Sender_:TObject; Shift_:TShiftState; WheelDelta_:Integer; var Handled_:Boolean ); inline;
    ///// メソッド
    procedure OnCreateAnyWND( const Sender_:TObject; const Message_:TMessage );
    procedure OnDestroAnyWND( const Sender_:TObject; const Message_:TMessage );
  protected
    _RootForm :FMX.Forms.TCommonCustomForm;
    _Form     :TGLViewerForm;
    _Viewer   :TGLUnifor<TSingleM4>;
    _Camera   :TGLCamera;
    ///// イベント
    _OnPaint :TProc;
    ///// アクセス
    class function GetScreenScale :Single;
    function GetRootForm :TForm;
    function GetPxSize :System.Types.TSize;
    ///// メソッド
    procedure DoAbsoluteChanged; override;
    procedure ParentChanged; override;
    procedure Paint; override;
    procedure Resize; override;
    procedure AncestorVisibleChanged( const Visible_: Boolean ); override;
    procedure AncestorParentChanged; override;
    procedure CreateWindow;
    procedure DestroWindow;
    procedure FitWindow;
  public
    { public 宣言 }
    constructor Create( AOwner_:TComponent ); override;
    destructor Destroy; override;
    ///// プロパティ
    property PxSize :System.Types.TSize read GetPxSize              ;
    property Camera :TGLCamera          read   _Camera write _Camera;
    ///// イベント
    property OnPaint :TProc read _OnPaint write _OnPaint;
    ///// メソッド
    procedure Repaint;
    procedure BeginRender;
    procedure EndRender;
    function MakeScreenShot :FMX.Graphics.TBitmap;
    function ShootRay( const X_,Y_:Single ) :TSingleRay3D;
    function PickObject( const X_,Y_:Single ) :TGLObject;
  end;

implementation //############################################################### ■

{$R *.fmx}

uses FMX.Platform,
     Winapi.OpenGL, Winapi.OpenGLext;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// イベント

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

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLViewer.OnCreateAnyWND( const Sender_:TObject; const Message_:TMessage );
begin
    if Sender_ = _RootForm then
    begin
         Assert( not Assigned( _Form ), 'Failed! _Form is not nil. @ TGLViewer.OnCreateAnyWND' );

         CreateWindow;

         _Form.Parent := Self;

         FitWindow;
    end;
end;

procedure TGLViewer.OnDestroAnyWND( const Sender_:TObject; const Message_:TMessage );
begin
    if Sender_ = _RootForm then
     begin
          DestroWindow;
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

class function TGLViewer.GetScreenScale :Single;
var
   S :IFMXScreenService;
begin
     if TPlatformServices.Current.SupportsPlatformService( IFMXScreenService, IInterface( S ) )
     then Result := S.GetScreenScale
     else Result := 1;
end;

//------------------------------------------------------------------------------

function TGLViewer.GetRootForm :TForm;
begin
     if Assigned( Root ) and ( Root.GetObject is TForm ) then
     begin
          Result := Root.GetObject as TForm;
     end
     else Result := nil;
end;

//------------------------------------------------------------------------------

function TGLViewer.GetPxSize :System.Types.TSize;
begin
     with Result do
     begin
          Width  := Round( _Form.Width  * GetScreenScale );
          Height := Round( _Form.Height * GetScreenScale );
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

     _RootForm := GetRootForm;

     _Form.Parent := Self;
end;

procedure TGLViewer.Paint;
begin
     BeginRender;

       with GetPxSize do glViewport( 0, 0, Width, Height );

       if Assigned( _Camera ) then _Camera.Render;

       _OnPaint;

     EndRender;
end;

procedure TGLViewer.Resize;
begin
     inherited;

     if Assigned( Parent ) then FitWindow;
end;

procedure TGLViewer.AncestorVisibleChanged( const Visible_: Boolean );
begin
     inherited;

     _Form.Visible := ParentedVisible;
end;

procedure TGLViewer.AncestorParentChanged;
begin
     inherited;

     _RootForm := GetRootForm;

     _Form.Parent := Self;
end;

//------------------------------------------------------------------------------

procedure TGLViewer.CreateWindow;
begin
     _Form := TGLViewerForm.CreateNew( Self );

     with _Form do
     begin
          OnMouseClick := GoMouseClick;
          OnMouseDown  := GoMouseDown ;
          OnMouseMove  := GoMouseMove ;
          OnMouseUp    := GoMouseUp   ;
          OnMouseWheel := GoMouseWheel;
     end;
end;

procedure TGLViewer.DestroWindow;
begin
     FreeAndNil( _Form );
end;

//------------------------------------------------------------------------------

procedure TGLViewer.FitWindow;
var
   R :TRectF;
begin
     R := TRectF.Create( LocalToAbsolute( TPointF.Zero ) * GetScreenScale, Width, Height );

     _Form.Bounds := R.Round;

     if Height < Width then _Viewer[ 0 ] := TSingleM4.Scale( Height / Width, 1, 1 )
                       else
     if Width < Height then _Viewer[ 0 ] := TSingleM4.Scale( 1, Width / Height, 1 )
                       else _Viewer[ 0 ] := TSingleM4.Identity;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLViewer.Create( AOwner_:TComponent );
begin
     inherited;

     HitTest := False;

     _RootForm := nil;

     _OnPaint := procedure begin end;

     CreateWindow;

     if not ( csDesigning in ComponentState ) then
     begin
          TMessageManager.DefaultManager.SubscribeToMessage( TAfterCreateFormHandle  , OnCreateAnyWND );
          TMessageManager.DefaultManager.SubscribeToMessage( TBeforeDestroyFormHandle, OnDestroAnyWND );
     end;

     _Viewer := TGLUnifor<TSingleM4>.Create( GL_DYNAMIC_DRAW );
     _Viewer.Count := 1;
end;

destructor TGLViewer.Destroy;
begin
     _Viewer.DisposeOf;

     if not ( csDesigning in ComponentState ) then
     begin
          TMessageManager.DefaultManager.Unsubscribe( TBeforeDestroyFormHandle, OnDestroAnyWND );
          TMessageManager.DefaultManager.Unsubscribe( TAfterCreateFormHandle  , OnCreateAnyWND );
     end;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLViewer.Repaint;
begin
     Paint;
end;

//------------------------------------------------------------------------------

procedure TGLViewer.BeginRender;
begin
     _Form.BeginGL;

       glClearColor( 0, 0, 0, 0 );

       glClear( GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT );

       _Viewer.Use( 0{BinP} );
end;

procedure TGLViewer.EndRender;
begin
       _Viewer.Unuse( 0{BinP} );

       glFlush;

     _Form.EndGL;

     _Form.SwapBuffers;
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
          SetSize( GetPxSize );

          SetLength( Cs, Height * Width );

          C := @Cs[ 0 ];

          with _Form do
          begin
               BeginGL;
                 glReadBuffer( GL_FRONT );
                 glReadPixels( 0, 0, Width, Height, GL_BGRA, GL_UNSIGNED_BYTE, C );
               EndGL;
          end;

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

     with GetPxSize do
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
