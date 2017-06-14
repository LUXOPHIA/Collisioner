unit LUX.GPU.OpenGL.Camera;

interface //#################################################################### ■

uses Winapi.OpenGL, Winapi.OpenGLext,
     LUX, LUX.D2, LUX.D3, LUX.M4, LUX.Tree,
     LUX.GPU.OpenGL,
     LUX.GPU.OpenGL.Buffer,
     LUX.GPU.OpenGL.Buffer.Unif,
     LUX.GPU.OpenGL.Buffer.Vert,
     LUX.GPU.OpenGL.Buffer.Elem,
     LUX.GPU.OpenGL.Scener,
     LUX.GPU.OpenGL.Matery;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLCamera

     TGLCamera = class( TGLNode, IGLCamera )
     private
       const _N :Single = 0.1;
       const _F :Single = 1000;
     protected
       _Proj :TSingleM4;
       ///// アクセス
       function GetCamI :Integer;
       procedure SetMove( const Move_:TSingleM4 ); override;
       function GetProj :TSingleM4; virtual;
       procedure SetProj( const Proj_:TSingleM4 ); virtual;
     public
       constructor Create( const Paren_:ITreeNode ); override;
       destructor Destroy; override;
       ///// プロパティ
       property CamI :Integer   read GetCamI              ;
       property Proj :TSingleM4 read GetProj write SetProj;
       ///// メソッド
       procedure RegBuf;
       procedure Render;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLCameraOrth

     TGLCameraOrth = class( TGLCamera )
     private
     protected
       _Size :Single;
       ///// アクセス
       function GetSize :Single; virtual;
       procedure SetSize( const Size_:Single ); virtual;
     public
       constructor Create( const Paren_:ITreeNode ); override;
       destructor Destroy; override;
       ///// プロパティ
       property Size :Single read GetSize write SetSize;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLCameraPers

     TGLCameraPers = class( TGLCamera )
     private
     protected
       _Angl :Single;
       ///// アクセス
       function GetAngl :Single; virtual;
       procedure SetAngl( const Angl_:Single ); virtual;
     public
       constructor Create( const Paren_:ITreeNode ); override;
       destructor Destroy; override;
       ///// プロパティ
       property Angl :Single read GetAngl write SetAngl;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.SysUtils, System.Classes, System.Math;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLCamera

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLCamera.GetCamI :Integer;
begin
     Result := Scener.Cameras[ Self ];
end;

procedure TGLCamera.SetMove( const Move_:TSingleM4 );
begin
     inherited;

     RegBuf;
end;

//------------------------------------------------------------------------------

function TGLCamera.GetProj :TSingleM4;
begin
     Result := _Proj;
end;

procedure TGLCamera.SetProj( const Proj_:TSingleM4 );
begin
     _Proj := Proj_;  RegBuf;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLCamera.Create( const Paren_:ITreeNode );
begin
     inherited;

end;

destructor TGLCamera.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLCamera.RegBuf;
var
   C :TCameraDat;
begin
     C.Proj := _Proj;
     C.Move :=  Move;

     Scener.CameraUs[ CamI ] := C;
end;

//------------------------------------------------------------------------------

procedure TGLCamera.Render;
begin
     _Move.Use( 3{BinP} );

     with Scener do
     begin
          CameraUs.Use( 0{BinP}, CamI{Offs} );

          Draw;
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLCameraOrth

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLCameraOrth.GetSize :Single;
begin
     Result := _Size;
end;

procedure TGLCameraOrth.SetSize( const Size_:Single );
var
   S :Single;
begin
     _Size := Size_;

     S := _Size / 2;

     Proj := TSingleM4.ProjOrth( -S, +S, -S, +S, _N, _F );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLCameraOrth.Create( const Paren_:ITreeNode );
begin
     inherited;

     Size := 10;
end;

destructor TGLCameraOrth.Destroy;
begin

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLCameraPers

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLCameraPers.GetAngl :Single;
begin
     Result := _Angl;
end;

procedure TGLCameraPers.SetAngl( const Angl_:Single );
var
   S :Single;
begin
     _Angl := Angl_;

     S := _N * Tan( _Angl / 2 );

     Proj := TSingleM4.ProjPers( -S, +S, -S, +S, _N, _F );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLCameraPers.Create( const Paren_:ITreeNode );
begin
     inherited;

     Angl := 90{°};
end;

destructor TGLCameraPers.Destroy;
begin

     inherited;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
