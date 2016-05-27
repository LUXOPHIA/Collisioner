unit LUX.Raytrace.Geometry;

interface //#################################################################### ■

uses LUX, LUX.D3, LUX.Graph.Tree, LUX.Raytrace, LUX.Matrix.L4;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     TRayGeometry = class;
       TRayWorld  = class;
       TRayCamera = class;
       TRayLight  = class;
       TRaySphere = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRayHit

     TRayHit = record
     private
     public
       Obj :TRayGeometry;
       Len :Single;
       Pos :TSingle3D;
       Nor :TSingle3D;
       Tan :TSingle3D;
       Bin :TSingle3D;
       Tex :TSingle3D;
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRayGeometry

     TRayGeometry = class( TTreeNode<TRayGeometry> )
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

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRayWorld

     TRayWorld = class( TRayGeometry )
     private
     protected
       ///// アクセス
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       ///// メソッド
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRayCamera

     TRayCamera = class( TRayGeometry )
     private
     protected
       ///// アクセス
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       ///// メソッド
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRayLight

     TRayLight = class( TRayGeometry )
     private
     protected
       ///// アクセス
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       ///// メソッド
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRaySphere

     TRaySphere = class( TRayGeometry )
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

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRayGeometry

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TRayGeometry.GetLocalMatrix :TSingleM4;
begin
     Result := _LocalMatrix.o;
end;

procedure TRayGeometry.SetLocalMatrix( const LocalMatrix_:TSingleM4 );
begin
     _LocalMatrix.o := LocalMatrix_;
end;

function TRayGeometry.GetWorldMatrix :TSingleM4;
begin
     Result := _WorldMatrix.o;
end;

procedure TRayGeometry.SetWorldMatrix( const WorldMatrix_:TSingleM4 );
begin
     _WorldMatrix.o := WorldMatrix_;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TRayGeometry.Raytrace( const Ray_:TSingleRay3D; var Hit_:TRayHit ) :Boolean;
begin
     Result := False;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRayGeometry.Create;
begin
     inherited;

     _LocalMatrix := TSingleDualM4.Identify;  upLocalMatrix_ := False;
     _WorldMatrix := TSingleDualM4.Identify;  upWorldMatrix_ := False;
end;

destructor TRayGeometry.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TRayGeometry.Raytraces( const Ray_:TSingleRay3D; var Hit_:TRayHit ) :Boolean;
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

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRayWorld

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRayWorld.Create;
begin
     inherited;

end;

destructor TRayWorld.Destroy;
begin

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRayCamera

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRayCamera.Create;
begin
     inherited;

end;

destructor TRayCamera.Destroy;
begin

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRayLight

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRayLight.Create;
begin
     inherited;

end;

destructor TRayLight.Destroy;
begin

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRaySphere

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

procedure TRaySphere.SetRadius( const Radius_:Single );
begin
     _Radius := Radius_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

function TRaySphere.Raytrace( const Ray_:TSingleRay3D; var Hit_:TRayHit ) :Boolean;
var
   B, C, D, T :Single;
begin
     B := DotProduct( Ray_.Pos, Ray_.Vec );
     C := Ray_.Pos.Siz2 - Pow2( _Radius );

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
          with Hit_ do
          begin
               Obj := Self;
               Len := T;
               Pos := T * Ray_.Vec + Ray_.Pos;
               Nor := Pos.Unitor;

          end;

          Result := True;
     end
     else Result := False;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRaySphere.Create;
begin
     inherited;

     _Radius := 1;
end;

destructor TRaySphere.Destroy;
begin

     inherited;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■