unit LUX.GPU.OpenGL.Camera;

interface //#################################################################### ■

uses Winapi.OpenGL, Winapi.OpenGLext,
     LUX, LUX.D2, LUX.D3, LUX.M4,
     LUX.GPU.OpenGL,
     LUX.GPU.OpenGL.Atom.Buffer.Unifor,
     LUX.GPU.OpenGL.Scener;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLCamera

     TGLCamera = class( TGLObject, IGLCamera )
     private
       const _N :Single = 0.1;
       const _F :Single = 1000;
     protected
       _Proj :TGLUnifor<TSingleM4>;
       _Offs :TSingle2D;
       ///// アクセス
       function GetProj :TSingleM4; virtual;
       procedure SetProj( const Proj_:TSingleM4 ); virtual;
       function GetOffs :TSingle2D; virtual;
       procedure SetOffs( const Offs_:TSingle2D ); virtual;
       ///// メソッド
       procedure CalcProj; virtual; abstract;
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       property Proj :TSingleM4 read GetProj write SetProj;
       property Offs :TSingle2D read GetOffs write SetOffs;
       ///// メソッド
       procedure HitRay( const AbsoRay_:TSingleRay3D; var Len_:Single; var Obj_:TGLObject ); override;
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
       ///// メソッド
       procedure CalcProj; override;
     public
       constructor Create; override;
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
       ///// メソッド
       procedure CalcProj; override;
     public
       constructor Create; override;
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

function TGLCamera.GetProj :TSingleM4;
begin
     Result := _Proj[ 0 ];
end;

procedure TGLCamera.SetProj( const Proj_:TSingleM4 );
begin
     _Proj[ 0 ] := Proj_;
end;

//------------------------------------------------------------------------------

function TGLCamera.GetOffs :TSingle2D;
begin
     Result := _Offs;
end;

procedure TGLCamera.SetOffs( const Offs_:TSingle2D );
begin
     _Offs := Offs_;

     CalcProj;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLCamera.Create;
begin
     inherited;

     _Proj := TGLUnifor<TSingleM4>.Create( GL_STATIC_DRAW );
     _Proj.Count := 1;

     _Offs := TSingle2D.Create( 0, 0 );
end;

destructor TGLCamera.Destroy;
begin
     _Proj.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLCamera.HitRay( const AbsoRay_:TSingleRay3D; var Len_:Single; var Obj_:TGLObject );
var
   I :Integer;
begin
     if _Visible and _HitTest then
     begin
          for I := 0 to ChildsN-1 do Childs[ I ].HitRay( AbsoRay_, Len_, Obj_ );
     end;
end;

procedure TGLCamera.Render;
begin
     _Proj    .Use( 1{BinP} );
     _AbsoPose.Use( 2{BinP} );

     Scener.Draw;
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
begin
     _Size := Size_;  CalcProj;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLCameraOrth.CalcProj;
var
   S :Single;
   C :TSingle2D;
begin
     S := _Size / 2;

     C := S * _Offs;

     Proj := TSingleM4.ProjOrth( C.X-S, C.X+S, C.Y-S, C.Y+S, _N, _F );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLCameraOrth.Create;
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
begin
     _Angl := Angl_;  CalcProj;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLCameraPers.CalcProj;
var
   S :Single;
   C :TSingle2D;
begin
     S := _N * Tan( _Angl / 2 );

     C := S * _Offs;

     Proj := TSingleM4.ProjPers( C.X-S, C.X+S, C.Y-S, C.Y+S, _N, _F );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLCameraPers.Create;
begin
     inherited;

     Angl := DegToRad( 60{°} );
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
