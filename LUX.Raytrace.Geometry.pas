unit LUX.Raytrace.Geometry;

interface //#################################################################### ■

uses LUX, LUX.D3, LUX.Graph.Tree, LUX.Raytrace, LUX.Matrix.L4;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     TGeometry = class;
       TWorld  = class;
       TCamera = class;
       TLight  = class;
       TSphere = class;

     TGeometrys = array of TGeometry;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRayHit

     TRayHit = record
     private
     public
       Obj :TGeometry;
       Len :Single;
       Pos :TSingle3D;
       Nor :TSingle3D;
       Tan :TSingle3D;
       Bin :TSingle3D;
       Tex :TSingle3D;
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGeometry

     TGeometry = class( TTreeNode<TGeometry> )
     private
       ///// メソッド
       ///procedure UpFlagMatrix;
     protected
       _LocalMatrix :TSingleDualM4;  upLocalMatrix_:Boolean;
       _WorldMatrix :TSingleDualM4;  upWorldMatrix_:Boolean;
       ///// アクセス
       function GetLocalMatrix :TSingleM4;
       procedure SetLocalMatrix( const LocalMatrix_:TSingleM4 );
       function GetWorldMatrix :TSingleM4;
       procedure SetWorldMatrix( const WorldMatrix_:TSingleM4 );
       ///// メソッド
       function Raytrace( const Ray_:TSingleRay3D; var Hit_:TRayHit ) :Boolean; virtual;
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       property LocalMatrix :TSingleM4 read GetLocalMatrix write SetLocalMatrix;
       property WorldMatrix :TSingleM4 read GetWorldMatrix write SetWorldMatrix;
       ///// メソッド
       function Raytraces( const Ray_:TSingleRay3D; var Hit_:TRayHit ) :Boolean;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TWorld

     TWorld = class( TGeometry )
     private
     protected
       ///// アクセス
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       ///// メソッド
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TCamera

     TCamera = class( TGeometry )
     private
     protected
       ///// アクセス
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       ///// メソッド
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TLight

     TLight = class( TGeometry )
     private
     protected
       ///// アクセス
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       ///// メソッド
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSphere

     TSphere = class( TGeometry )
     private
     protected
       _Radius :Single;
       ///// アクセス
       procedure SetRadius( const Radius_:Single );
       ///// メソッド
       function Raytrace( const Ray_:TSingleRay3D; var Hit_:TRayHit ) :Boolean; override;
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       property Radius :Single read _Radius write SetRadius;
       ///// メソッド
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGeometry

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGeometry.GetLocalMatrix :TSingleM4;
begin
     Result := _LocalMatrix.o;
end;

procedure TGeometry.SetLocalMatrix( const LocalMatrix_:TSingleM4 );
begin
     _LocalMatrix.o := LocalMatrix_;
end;

function TGeometry.GetWorldMatrix :TSingleM4;
begin
     Result := _WorldMatrix.o;
end;

procedure TGeometry.SetWorldMatrix( const WorldMatrix_:TSingleM4 );
begin
     _WorldMatrix.o := WorldMatrix_;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TGeometry.Raytrace( const Ray_:TSingleRay3D; var Hit_:TRayHit ) :Boolean;
begin
     Result := False;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGeometry.Create;
begin
     inherited;

     _LocalMatrix := TSingleDualM4.Identify;  upLocalMatrix_ := False;
     _WorldMatrix := TSingleDualM4.Identify;  upWorldMatrix_ := False;
end;

destructor TGeometry.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TGeometry.Raytraces( const Ray_:TSingleRay3D; var Hit_:TRayHit ) :Boolean;
var
   R :TSingleRay3D;
   H :TRayHit;
   I :Integer;
begin
     R := _LocalMatrix.i * Ray_;

     Result := Raytrace( R, H );

     if Result and ( H.Len < Hit_.Len ) then Hit_ := H;

     for I := 0 to ChildsN-1 do Result := Result or Childs[ I ].Raytraces( R, Hit_ );

     with Hit_ do
     begin
          Pos := _LocalMatrix.o.MultPos( Pos );
          Nor := _LocalMatrix.o.MultVec( Nor );
          Tan := _LocalMatrix.o.MultVec( Tan );
          Bin := _LocalMatrix.o.MultVec( Bin );
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TWorld

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TWorld.Create;
begin
     inherited;

end;

destructor TWorld.Destroy;
begin

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TCamera

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TCamera.Create;
begin
     inherited;

end;

destructor TCamera.Destroy;
begin

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TLight

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TLight.Create;
begin
     inherited;

end;

destructor TLight.Destroy;
begin

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSphere

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

procedure TSphere.SetRadius( const Radius_:Single );
begin
     _Radius := Radius_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

function TSphere.Raytrace( const Ray_:TSingleRay3D; var Hit_:TRayHit ) :Boolean;
var
   X, XX :TSingleRay3D;
   B, C, D, T :Single;
begin
     X := Ray_;  with X do Vec := Vec.Unitor;

     B := DotProduct( X.Pos, X.Vec );
     C := X.Pos.Siz2 - Pow2( _Radius );

     if ( C >= 0 ) and ( B >= 0 ) then
     begin
          Result := False;  Exit;
     end;

     D := Pow2( B ) - C;

     if D <= 0 then
     begin
          Result := False;  Exit;
     end;

     if C > 0 then T := -B - Roo2( D )
              else T := -B + Roo2( D );

     if T > 0.00001 then
     begin
          XX.Pos := T * X.Vec + X.Pos;
          XX.Vec := XX.Pos.Unitor;

          Hit_.Obj := Self;
          Hit_.Len := T;
          Hit_.Pos := XX.Pos;
          Hit_.Nor := XX.Vec;

          Result := True;
     end
     else Result := False;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TSphere.Create;
begin
     inherited;

     _Radius := 1;
end;

destructor TSphere.Destroy;
begin

     inherited;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■