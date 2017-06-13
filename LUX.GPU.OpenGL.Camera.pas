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
     protected
       _Proj :TSingleM4;
       ///// アクセス
       function GetCamI :Integer;
       procedure SetMove( const Move_:TSingleM4 ); override;
       function GetProj :TSingleM4; virtual;
       procedure SetProj( const Proj_:TSingleM4 ); virtual;
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       property CamI :Integer   read GetCamI              ;
       property Proj :TSingleM4 read GetProj write SetProj;
       ///// メソッド
       procedure RegBuf; override;
       procedure Render;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.SysUtils, System.Classes;

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

     _Move := Move_;  RegBuf;
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

constructor TGLCamera.Create;
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
     C.Move := _Move;

     Scener.CameraUs[ CamI ] := C;
end;

//------------------------------------------------------------------------------

procedure TGLCamera.Render;
begin
     with Scener do
     begin
          CameraUs.Use( 0{BinP}, CamI{Offs} );

          Draw;

          CameraUs.Unuse( 0{BinP} );
     end;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
