unit LUX.Geometry.D3;

interface //#################################################################### ■

uses LUX, LUX.D1, LUX.D2, LUX.D3,
     LUX.Geometry, LUX.Geometry.D2;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleSpher2

     TSingleSpher2 = record
     private
     public
       Center :TSingle3D;
       Radiu2 :Single;
       /////
       constructor Create( const P1_,P2_,P3_,P4_:TSingle3D ); overload;
       constructor Create( const P1_,P2_,P3_:TSingle3D ); overload;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleSpher2

     TDoubleSpher2 = record
     private
     public
       Center :TDouble3D;
       Radiu2 :Double;
       /////
       constructor Create( const P1_,P2_,P3_,P4_:TDouble3D ); overload;
       constructor Create( const P1_,P2_,P3_:TDouble3D ); overload;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleSphere

     TSingleSphere = record
     private
     public
       Center :TSingle3D;
       Radius :Single;
       /////
       constructor Create( const P1_,P2_,P3_,P4_:TSingle3D ); overload;
       constructor Create( const P1_,P2_,P3_:TSingle3D ); overload;
       ///// 型変換
       class operator Implicit( const Spher2_:TSingleSpher2 ) :TSingleSphere;
       class operator Implicit( const Sphere_:TSingleSphere ) :TSingleSpher2;
       ///// メソッド
       class function Inner( const P1_,P2_,P3_,P4_:TSingle3D ) :TSingleSphere; static;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleSphere

     TDoubleSphere = record
     private
     public
       Center :TDouble3D;
       Radius :Double;
       /////
       constructor Create( const P1_,P2_,P3_,P4_:TDouble3D ); overload;
       constructor Create( const P1_,P2_,P3_:TDouble3D ); overload;
       ///// 型変換
       class operator Implicit( const Spher2_:TDoubleSpher2 ) :TDoubleSphere;
       class operator Implicit( const Sphere_:TDoubleSphere ) :TDoubleSpher2;
       ///// メソッド
       class function Inner( const P1_,P2_,P3_,P4_:TDouble3D ) :TDoubleSphere; static;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleTria3D

     //  P3        P* :Poin*
     //  │＼      E* :Edge*
     //  E2  E1
     //  │    ＼
     //  P1─E3─P2

     TSingleTria3D = record
     private
       ///// アクセス
       function GetNorv :TSingle3D;
       function GetEdge1 :TSingle3D;
       function GetEdge2 :TSingle3D;
       function GetEdge3 :TSingle3D;
       function GetProjXY :TSingleTria2D;
       function GetProjYZ :TSingleTria2D;
       function GetProjZX :TSingleTria2D;
       function GetAABB :TSingleArea3D;
     public
       Poin1 :TSingle3D;
       Poin2 :TSingle3D;
       Poin3 :TSingle3D;
       ///// プロパティ
       property Norv   :TSingle3D     read GetNorv  ;
       property Edge1  :TSingle3D     read GetEdge1 ;
       property Edge2  :TSingle3D     read GetEdge2 ;
       property Edge3  :TSingle3D     read GetEdge3 ;
       property ProjXY :TSingleTria2D read GetProjXY;
       property ProjYZ :TSingleTria2D read GetProjYZ;
       property ProjZX :TSingleTria2D read GetProjZX;
       property AABB   :TSingleArea3D read GetAABB  ;
       ///// 演算子
       class operator Negative( const V_:TSingleTria3D ) :TSingleTria3D; inline;
       class operator Positive( const V_:TSingleTria3D ) :TSingleTria3D; inline;
       class operator Add( const A_,B_:TSingleTria3D ) :TSingleTria3D; inline;
       class operator Subtract( const A_,B_:TSingleTria3D ) :TSingleTria3D; inline;
       class operator Multiply( const A_:TSingleTria3D; const B_:Single ) :TSingleTria3D; inline;
       class operator Multiply( const A_:Single; const B_:TSingleTria3D ) :TSingleTria3D; inline;
       class operator Divide( const A_:TSingleTria3D; const B_:Single ) :TSingleTria3D; inline;
       ///// メソッド
       function ProjVec( const Vec_:TSingle3D ) :TSingleArea;
       function CollisionPEF( const Area_:TSingleArea3D ) :Boolean;
       function CollisionSAT( const Area_:TSingleArea3D ) :Boolean;
       class function RandG :TSingleTria3D; static;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleTria3D

     //  P3        P* :Poin*
     //  │＼      E* :Edge*
     //  E2  E1
     //  │    ＼
     //  P1─E3─P2

     TDoubleTria3D = record
     private
       ///// アクセス
       function GetNorv :TDouble3D;
       function GetEdge1 :TDouble3D;
       function GetEdge2 :TDouble3D;
       function GetEdge3 :TDouble3D;
       function GetProjXY :TDoubleTria2D;
       function GetProjYZ :TDoubleTria2D;
       function GetProjZX :TDoubleTria2D;
       function GetAABB :TDoubleArea3D;
     public
       Poin1 :TDouble3D;
       Poin2 :TDouble3D;
       Poin3 :TDouble3D;
       ///// プロパティ
       property Norv   :TDouble3D     read GetNorv  ;
       property Edge1  :TDouble3D     read GetEdge1 ;
       property Edge2  :TDouble3D     read GetEdge2 ;
       property Edge3  :TDouble3D     read GetEdge3 ;
       property ProjXY :TDoubleTria2D read GetProjXY;
       property ProjYZ :TDoubleTria2D read GetProjYZ;
       property ProjZX :TDoubleTria2D read GetProjZX;
       property AABB   :TDoubleArea3D read GetAABB  ;
       ///// 演算子
       class operator Negative( const V_:TDoubleTria3D ) :TDoubleTria3D; inline;
       class operator Positive( const V_:TDoubleTria3D ) :TDoubleTria3D; inline;
       class operator Add( const A_,B_:TDoubleTria3D ) :TDoubleTria3D; inline;
       class operator Subtract( const A_,B_:TDoubleTria3D ) :TDoubleTria3D; inline;
       class operator Multiply( const A_:TDoubleTria3D; const B_:Double ) :TDoubleTria3D; inline;
       class operator Multiply( const A_:Double; const B_:TDoubleTria3D ) :TDoubleTria3D; inline;
       class operator Divide( const A_:TDoubleTria3D; const B_:Double ) :TDoubleTria3D; inline;
       ///// メソッド
       function ProjVec( const Vec_:TDouble3D ) :TDoubleArea;
       function CollisionPEF( const Area_:TDoubleArea3D ) :Boolean;
       function CollisionSAT( const Area_:TDoubleArea3D ) :Boolean;
       class function RandG :TDoubleTria3D; static;
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function HeronArea( const P1_,P2_,P3_:TSinglePos3D ) :Single; overload;
function HeronArea( const P1_,P2_,P3_:TDoublePos3D ) :Double; overload;

function HeronVolum2( const P0_,P1_,P2_,P3_:TSinglePos3D ) :Single; overload;
function HeronVolum2( const P0_,P1_,P2_,P3_:TDoublePos3D ) :Double; overload;

function HeronVolume( const P0_,P1_,P2_,P3_:TSinglePos3D ) :Single; overload;
function HeronVolume( const P0_,P1_,P2_,P3_:TDoublePos3D ) :Double; overload;

function TriNormal( const P1_,P2_,P3_:TSinglePos3D ) :TSingleVec3D; inline; overload;
function TriNormal( const P1_,P2_,P3_:TDoublePos3D ) :TDoubleVec3D; inline; overload;

function Barycenter( const P1_,P2_:TSinglePos3D ) :TSinglePos3D; overload;
function Barycenter( const P1_,P2_:TDoublePos3D ) :TDoublePos3D; overload;

function Barycenter( const P1_,P2_,P3_:TSinglePos3D ) :TSinglePos3D; overload;
function Barycenter( const P1_,P2_,P3_:TDoublePos3D ) :TDoublePos3D; overload;

function Barycenter( const P0_,P1_,P2_,P3_:TSinglePos3D ) :TSinglePos3D; overload;
function Barycenter( const P0_,P1_,P2_,P3_:TDoublePos3D ) :TDoublePos3D; overload;

function InnerRadius( const P1_,P2_,P3_:TSinglePos3D ) :Single; overload;
function InnerRadius( const P1_,P2_,P3_:TDoublePos3D ) :Double; overload;

function InnerRadius( const P0_,P1_,P2_,P3_:TSinglePos3D ) :Single; overload;
function InnerRadius( const P0_,P1_,P2_,P3_:TDoublePos3D ) :Double; overload;

function InnerCenter( const P1_,P2_,P3_:TSinglePos3D ) :TSinglePos3D; overload;
function InnerCenter( const P1_,P2_,P3_:TDoublePos3D ) :TDoublePos3D; overload;

function InnerCenter( const P0_,P1_,P2_,P3_:TSinglePos3D ) :TSinglePos3D; overload;
function InnerCenter( const P0_,P1_,P2_,P3_:TDoublePos3D ) :TDoublePos3D; overload;

function CircumCenter( const P1_,P2_,P3_,P4_:TSinglePos3D ) :TSinglePos3D; overload;
function CircumCenter( const P1_,P2_,P3_,P4_:TDoublePos3D ) :TDoublePos3D; overload;

function CircumSphereCenter( const P1_,P2_,P3_:TSingle3D ) :TSingle3D; overload;
function CircumSphereCenter( const P1_,P2_,P3_:TDouble3D ) :TDouble3D; overload;

function MarginCorner( const V1_,V2_:TSingleVec3D; Margin_:Single ) :TSingleVec3D; overload;
function MarginCorner( const V1_,V2_:TDoubleVec3D; Margin_:Double ) :TDoubleVec3D; overload;

function MarginCorner( const P0_,P1_,P2_:TSinglePos3D; Margin_:Single ) :TSinglePos3D; overload;
function MarginCorner( const P0_,P1_,P2_:TDoublePos3D; Margin_:Double ) :TDoublePos3D; overload;

function Reflect( const Ray_,Nor_:TSingle3D ) :TSingle3D; overload;
function Reflect( const Ray_,Nor_:TDouble3D ) :TDouble3D; overload;

function ReflectW( const Ray_,Nor_:TSingle3D; const RaI_:Single ) :Single; overload;
function ReflectW( const Ray_,Nor_:TDouble3D; const RaI_:Double ) :Double; overload;

function Refract( const Ray_,Nor_:TSingle3D; const RaI_:Single ) :TSingle3D; overload;
function Refract( const Ray_,Nor_:TDouble3D; const RaI_:Double ) :TDouble3D; overload;

function Refract( const Ray_,Nor_:TSingle3D; const RaI_:Single; out RaV_:TSingle3D; out ReW_:Single ) :Boolean; overload;
function Refract( const Ray_,Nor_:TDouble3D; const RaI_:Double; out RaV_:TDouble3D; out ReW_:Double ) :Boolean; overload;

function SolidAngle( const P1_,P2_,P3_:TSingle3D; const P_:TSingle3D ) :Single; overload;
function SolidAngle( const P1_,P2_,P3_:TDouble3D; const P_:TDouble3D ) :Double; overload;

implementation //############################################################### ■

uses System.Math,
     LUX.M3, LUX.D4;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleSpher2

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TSingleSpher2.Create( const P1_,P2_,P3_,P4_:TSingle3D );
begin
     Center := CircumCenter( P1_, P2_, P3_, P4_ );

     Radiu2 := ( Distanc2( Center, P1_ )
               + Distanc2( Center, P2_ )
               + Distanc2( Center, P3_ )
               + Distanc2( Center, P4_ ) ) / 4;
end;

constructor TSingleSpher2.Create( const P1_,P2_,P3_:TSingle3D );
begin
     Center := CircumSphereCenter( P1_, P2_, P3_ );

     Radiu2 := ( Distanc2( Center, P1_ )
               + Distanc2( Center, P2_ )
               + Distanc2( Center, P3_ ) ) / 3;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleSpher2

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TDoubleSpher2.Create( const P1_,P2_,P3_,P4_:TDouble3D );
begin
     Center := CircumCenter( P1_, P2_, P3_, P4_ );

     Radiu2 := ( Distanc2( Center, P1_ )
               + Distanc2( Center, P2_ )
               + Distanc2( Center, P3_ )
               + Distanc2( Center, P4_ ) ) / 4;
end;

constructor TDoubleSpher2.Create( const P1_,P2_,P3_:TDouble3D );
begin
     Center := CircumSphereCenter( P1_, P2_, P3_ );

     Radiu2 := ( Distanc2( Center, P1_ )
               + Distanc2( Center, P2_ )
               + Distanc2( Center, P3_ ) ) / 3;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleSphere

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TSingleSphere.Create( const P1_,P2_,P3_,P4_:TSingle3D );
begin
     Self := TSingleSpher2.Create( P1_, P2_, P3_, P4_ );
end;

constructor TSingleSphere.Create( const P1_,P2_,P3_:TSingle3D );
begin
     Self := TSingleSpher2.Create( P1_, P2_, P3_ );
end;

///////////////////////////////////////////////////////////////////////// 型変換

class operator TSingleSphere.Implicit( const Spher2_:TSingleSpher2 ) :TSingleSphere;
begin
     with Result do
     begin
          Center :=       Spher2_.Center  ;
          Radius := Roo2( Spher2_.Radiu2 );
     end;
end;

class operator TSingleSphere.Implicit( const Sphere_:TSingleSphere ) :TSingleSpher2;
begin
     with Result do
     begin
          Center :=       Sphere_.Center  ;
          Radiu2 := Pow2( Sphere_.Radius );
     end;
end;

/////////////////////////////////////////////////////////////////////// メソッド

class function TSingleSphere.Inner( const P1_,P2_,P3_,P4_:TSingle3D ) :TSingleSphere;
begin
     with Result do
     begin
          Center :=InnerCenter( P1_,P2_,P3_,P4_ );
          Radius := InnerRadius( P1_,P2_,P3_,P4_ );
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleSphere

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TDoubleSphere.Create( const P1_,P2_,P3_,P4_:TDouble3D );
begin
     Self := TDoubleSpher2.Create( P1_, P2_, P3_, P4_ );
end;

constructor TDoubleSphere.Create( const P1_,P2_,P3_:TDouble3D );
begin
     Self := TDoubleSpher2.Create( P1_, P2_, P3_ );
end;

///////////////////////////////////////////////////////////////////////// 型変換

class operator TDoubleSphere.Implicit( const Spher2_:TDoubleSpher2 ) :TDoubleSphere;
begin
     with Result do
     begin
          Center :=       Spher2_.Center  ;
          Radius := Roo2( Spher2_.Radiu2 );
     end;
end;

class operator TDoubleSphere.Implicit( const Sphere_:TDoubleSphere ) :TDoubleSpher2;
begin
     with Result do
     begin
          Center :=       Sphere_.Center  ;
          Radiu2 := Pow2( Sphere_.Radius );
     end;
end;

/////////////////////////////////////////////////////////////////////// メソッド

class function TDoubleSphere.Inner( const P1_,P2_,P3_,P4_:TDouble3D ) :TDoubleSphere;
begin
     with Result do
     begin
          Center :=InnerCenter( P1_,P2_,P3_,P4_ );
          Radius := InnerRadius( P1_,P2_,P3_,P4_ );
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleTria3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TSingleTria3D.GetNorv :TSingle3D;
begin
     Result := CrossProduct( Edge2, Edge3 );
end;

//------------------------------------------------------------------------------

function TSingleTria3D.GetEdge1 :TSingle3D;
begin
     Result := Poin2.VectorTo( Poin3 );
end;

function TSingleTria3D.GetEdge2 :TSingle3D;
begin
     Result := Poin3.VectorTo( Poin1 );
end;

function TSingleTria3D.GetEdge3 :TSingle3D;
begin
     Result := Poin1.VectorTo( Poin2 );
end;

//------------------------------------------------------------------------------

function TSingleTria3D.GetProjXY :TSingleTria2D;
begin
     with Poin1 do Result.Poin1 := TSingle2D.Create( X, Y );
     with Poin2 do Result.Poin2 := TSingle2D.Create( X, Y );
     with Poin3 do Result.Poin3 := TSingle2D.Create( X, Y );
end;

function TSingleTria3D.GetProjYZ :TSingleTria2D;
begin
     with Poin1 do Result.Poin1 := TSingle2D.Create( Y, Z );
     with Poin2 do Result.Poin2 := TSingle2D.Create( Y, Z );
     with Poin3 do Result.Poin3 := TSingle2D.Create( Y, Z );
end;

function TSingleTria3D.GetProjZX :TSingleTria2D;
begin
     with Poin1 do Result.Poin1 := TSingle2D.Create( Z, X );
     with Poin2 do Result.Poin2 := TSingle2D.Create( Z, X );
     with Poin3 do Result.Poin3 := TSingle2D.Create( Z, X );
end;

//------------------------------------------------------------------------------

function TSingleTria3D.GetAABB :TSingleArea3D;
begin
     with Result do
     begin
          ProjX := TSingleArea.Create( Poin1.X, Poin2.X, Poin3.X );
          ProjY := TSingleArea.Create( Poin1.Y, Poin2.Y, Poin3.Y );
          ProjZ := TSingleArea.Create( Poin1.Z, Poin2.Z, Poin3.Z );
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

///////////////////////////////////////////////////////////////////////// 演算子

class operator TSingleTria3D.Negative( const V_:TSingleTria3D ) :TSingleTria3D;
begin
     with Result do
     begin
          Poin1 := -V_.Poin1;
          Poin2 := -V_.Poin2;
          Poin3 := -V_.Poin3;
     end;
end;

class operator TSingleTria3D.Positive( const V_:TSingleTria3D ) :TSingleTria3D;
begin
     with Result do
     begin
          Poin1 := +V_.Poin1;
          Poin2 := +V_.Poin2;
          Poin3 := +V_.Poin3;
     end;
end;

class operator TSingleTria3D.Add( const A_,B_:TSingleTria3D ) :TSingleTria3D;
begin
     with Result do
     begin
          Poin1 := A_.Poin1 + B_.Poin1;
          Poin2 := A_.Poin2 + B_.Poin2;
          Poin3 := A_.Poin3 + B_.Poin3;
     end;
end;

class operator TSingleTria3D.Subtract( const A_,B_:TSingleTria3D ) :TSingleTria3D;
begin
     with Result do
     begin
          Poin1 := A_.Poin1 - B_.Poin1;
          Poin2 := A_.Poin2 - B_.Poin2;
          Poin3 := A_.Poin3 - B_.Poin3;
     end;
end;

class operator TSingleTria3D.Multiply( const A_:TSingleTria3D; const B_:Single ) :TSingleTria3D;
begin
     with Result do
     begin
          Poin1 := A_.Poin1 * B_;
          Poin2 := A_.Poin2 * B_;
          Poin3 := A_.Poin3 * B_;
     end;
end;

class operator TSingleTria3D.Multiply( const A_:Single; const B_:TSingleTria3D ) :TSingleTria3D;
begin
     with Result do
     begin
          Poin1 := A_ * B_.Poin1;
          Poin2 := A_ * B_.Poin2;
          Poin3 := A_ * B_.Poin3;
     end;
end;

class operator TSingleTria3D.Divide( const A_:TSingleTria3D; const B_:Single ) :TSingleTria3D;
begin
     with Result do
     begin
          Poin1 := A_.Poin1 / B_;
          Poin2 := A_.Poin2 / B_;
          Poin3 := A_.Poin3 / B_;
     end;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TSingleTria3D.ProjVec( const Vec_:TSingle3D ) :TSingleArea;
var
   C1, C2, C3 :Single;
begin
     C1 := DotProduct( Vec_, Poin1 );
     C2 := DotProduct( Vec_, Poin2 );
     C3 := DotProduct( Vec_, Poin3 );

     Result := TSingleArea.Create( C1, C2, C3 );
end;

function TSingleTria3D.CollisionPEF( const Area_:TSingleArea3D ) :Boolean;
//······································
     function CheckPlane :Boolean;
     var
        N, B0, B1, V0, V1 :TSingle3D;
        I0, I1 :Byte;
        C0, C1 :Single;
     begin
          N := Norv;

          I1 := N.Orthant;
          I0 := I1 xor 7;

          B0 := Area_.Poin[ I0 ];
          B1 := Area_.Poin[ I1 ];

          V0 := Poin1.VectorTo( B0 );
          V1 := Poin1.VectorTo( B1 );

          C0 := DotProduct( N, V0 );
          C1 := DotProduct( N, V1 );

          Result := ( C0 * C1 ) <= 0;
     end;
//······································
begin
     Result := AABB.Collision( Area_ )
           and CheckPlane
           and ProjXY.ColliEdge( Area_.ProjXY )
           and ProjYZ.ColliEdge( Area_.ProjYZ )
           and ProjZX.ColliEdge( Area_.ProjZX );
end;

function TSingleTria3D.CollisionSAT( const Area_:TSingleArea3D ) :Boolean;
//······································
     function CheckPlane :Boolean;
     var
        N, B0, B1, V0, V1 :TSingle3D;
        I0, I1 :Byte;
        C0, C1 :Single;
     begin
          N := Norv;

          I1 := N.Orthant;
          I0 := I1 xor 7;

          B0 := Area_.Poin[ I0 ];
          B1 := Area_.Poin[ I1 ];

          V0 := Poin1.VectorTo( B0 );
          V1 := Poin1.VectorTo( B1 );

          C0 := DotProduct( N, V0 );
          C1 := DotProduct( N, V1 );

          Result := ( C0 * C1 ) < 0;
     end;
     //·································
     function Check( const Vec_:TSingle3D ) :Boolean;
     begin
          Result := ProjVec( Vec_ ).Collision( Area_.ProjVec( Vec_ ) );
     end;
//······································
const
     AX :TSingle3D = ( X:1; Y:0; Z:0 );
     AY :TSingle3D = ( X:0; Y:1; Z:0 );
     AZ :TSingle3D = ( X:0; Y:0; Z:1 );
var
   E1, E2, E3 :TSingle3D;
begin
     E1 := Edge1;
     E2 := Edge2;
     E3 := Edge3;

     Result := Check( Norv )
           and Check( AX )
           and Check( AY )
           and Check( AZ )
           and Check( CrossProduct( AX, E1 ) )
           and Check( CrossProduct( AX, E2 ) )
           and Check( CrossProduct( AX, E3 ) )
           and Check( CrossProduct( AY, E1 ) )
           and Check( CrossProduct( AY, E2 ) )
           and Check( CrossProduct( AY, E3 ) )
           and Check( CrossProduct( AZ, E1 ) )
           and Check( CrossProduct( AZ, E2 ) )
           and Check( CrossProduct( AZ, E3 ) );
end;

//------------------------------------------------------------------------------

class function TSingleTria3D.RandG :TSingleTria3D;
begin
     with Result do
     begin
          Poin1 := TSingle3D.RandG;
          Poin2 := TSingle3D.RandG;
          Poin3 := TSingle3D.RandG;
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleTria3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TDoubleTria3D.GetNorv :TDouble3D;
begin
     Result := CrossProduct( Edge2, Edge3 );
end;

//------------------------------------------------------------------------------

function TDoubleTria3D.GetEdge1 :TDouble3D;
begin
     Result := Poin2.VectorTo( Poin3 );
end;

function TDoubleTria3D.GetEdge2 :TDouble3D;
begin
     Result := Poin3.VectorTo( Poin1 );
end;

function TDoubleTria3D.GetEdge3 :TDouble3D;
begin
     Result := Poin1.VectorTo( Poin2 );
end;

//------------------------------------------------------------------------------

function TDoubleTria3D.GetProjXY :TDoubleTria2D;
begin
     with Poin1 do Result.Poin1 := TDouble2D.Create( X, Y );
     with Poin2 do Result.Poin2 := TDouble2D.Create( X, Y );
     with Poin3 do Result.Poin3 := TDouble2D.Create( X, Y );
end;

function TDoubleTria3D.GetProjYZ :TDoubleTria2D;
begin
     with Poin1 do Result.Poin1 := TDouble2D.Create( Y, Z );
     with Poin2 do Result.Poin2 := TDouble2D.Create( Y, Z );
     with Poin3 do Result.Poin3 := TDouble2D.Create( Y, Z );
end;

function TDoubleTria3D.GetProjZX :TDoubleTria2D;
begin
     with Poin1 do Result.Poin1 := TDouble2D.Create( Z, X );
     with Poin2 do Result.Poin2 := TDouble2D.Create( Z, X );
     with Poin3 do Result.Poin3 := TDouble2D.Create( Z, X );
end;

//------------------------------------------------------------------------------

function TDoubleTria3D.GetAABB :TDoubleArea3D;
begin
     with Result do
     begin
          ProjX := TDoubleArea.Create( Poin1.X, Poin2.X, Poin3.X );
          ProjY := TDoubleArea.Create( Poin1.Y, Poin2.Y, Poin3.Y );
          ProjZ := TDoubleArea.Create( Poin1.Z, Poin2.Z, Poin3.Z );
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

///////////////////////////////////////////////////////////////////////// 演算子

class operator TDoubleTria3D.Negative( const V_:TDoubleTria3D ) :TDoubleTria3D;
begin
     with Result do
     begin
          Poin1 := -V_.Poin1;
          Poin2 := -V_.Poin2;
          Poin3 := -V_.Poin3;
     end;
end;

class operator TDoubleTria3D.Positive( const V_:TDoubleTria3D ) :TDoubleTria3D;
begin
     with Result do
     begin
          Poin1 := +V_.Poin1;
          Poin2 := +V_.Poin2;
          Poin3 := +V_.Poin3;
     end;
end;

class operator TDoubleTria3D.Add( const A_,B_:TDoubleTria3D ) :TDoubleTria3D;
begin
     with Result do
     begin
          Poin1 := A_.Poin1 + B_.Poin1;
          Poin2 := A_.Poin2 + B_.Poin2;
          Poin3 := A_.Poin3 + B_.Poin3;
     end;
end;

class operator TDoubleTria3D.Subtract( const A_,B_:TDoubleTria3D ) :TDoubleTria3D;
begin
     with Result do
     begin
          Poin1 := A_.Poin1 - B_.Poin1;
          Poin2 := A_.Poin2 - B_.Poin2;
          Poin3 := A_.Poin3 - B_.Poin3;
     end;
end;

class operator TDoubleTria3D.Multiply( const A_:TDoubleTria3D; const B_:Double ) :TDoubleTria3D;
begin
     with Result do
     begin
          Poin1 := A_.Poin1 * B_;
          Poin2 := A_.Poin2 * B_;
          Poin3 := A_.Poin3 * B_;
     end;
end;

class operator TDoubleTria3D.Multiply( const A_:Double; const B_:TDoubleTria3D ) :TDoubleTria3D;
begin
     with Result do
     begin
          Poin1 := A_ * B_.Poin1;
          Poin2 := A_ * B_.Poin2;
          Poin3 := A_ * B_.Poin3;
     end;
end;

class operator TDoubleTria3D.Divide( const A_:TDoubleTria3D; const B_:Double ) :TDoubleTria3D;
begin
     with Result do
     begin
          Poin1 := A_.Poin1 / B_;
          Poin2 := A_.Poin2 / B_;
          Poin3 := A_.Poin3 / B_;
     end;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TDoubleTria3D.ProjVec( const Vec_:TDouble3D ) :TDoubleArea;
var
   C1, C2, C3 :Double;
begin
     C1 := DotProduct( Vec_, Poin1 );
     C2 := DotProduct( Vec_, Poin2 );
     C3 := DotProduct( Vec_, Poin3 );

     Result := TDoubleArea.Create( C1, C2, C3 );
end;

function TDoubleTria3D.CollisionPEF( const Area_:TDoubleArea3D ) :Boolean;
//······································
     function CheckPlane :Boolean;
     var
        N, B0, B1, V0, V1 :TDouble3D;
        I0, I1 :Byte;
        C0, C1 :Double;
     begin
          N := Norv;

          I1 := N.Orthant;
          I0 := I1 xor 7;

          B0 := Area_.Poin[ I0 ];
          B1 := Area_.Poin[ I1 ];

          V0 := Poin1.VectorTo( B0 );
          V1 := Poin1.VectorTo( B1 );

          C0 := DotProduct( N, V0 );
          C1 := DotProduct( N, V1 );

          Result := ( C0 * C1 ) < 0;
     end;
//······································
begin
     Result := AABB.Collision( Area_ )
           and CheckPlane
           and ProjXY.ColliEdge( Area_.ProjXY )
           and ProjYZ.ColliEdge( Area_.ProjYZ )
           and ProjZX.ColliEdge( Area_.ProjZX );
end;

function TDoubleTria3D.CollisionSAT( const Area_:TDoubleArea3D ) :Boolean;
//······································
     function CheckPlane :Boolean;
     var
        N, B0, B1, V0, V1 :TDouble3D;
        I0, I1 :Byte;
        C0, C1 :Double;
     begin
          N := Norv;

          I1 := N.Orthant;
          I0 := I1 xor 7;

          B0 := Area_.Poin[ I0 ];
          B1 := Area_.Poin[ I1 ];

          V0 := Poin1.VectorTo( B0 );
          V1 := Poin1.VectorTo( B1 );

          C0 := DotProduct( N, V0 );
          C1 := DotProduct( N, V1 );

          Result := ( C0 * C1 ) < 0;
     end;
     //·································
     function Check( const Vec_:TDouble3D ) :Boolean;
     begin
          Result := ProjVec( Vec_ ).Collision( Area_.ProjVec( Vec_ ) );
     end;
//······································
const
     AX :TDouble3D = ( X:1; Y:0; Z:0 );
     AY :TDouble3D = ( X:0; Y:1; Z:0 );
     AZ :TDouble3D = ( X:0; Y:0; Z:1 );
var
   E1, E2, E3 :TDouble3D;
begin
     E1 := Edge1;
     E2 := Edge2;
     E3 := Edge3;

     Result := AABB.Collision( Area_ )          // Check( AX ) and Check( AY ) and Check( AZ )
           and CheckPlane                       // Check( Norv )
           and Check( CrossProduct( AX, E1 ) )
           and Check( CrossProduct( AX, E2 ) )
           and Check( CrossProduct( AX, E3 ) )
           and Check( CrossProduct( AY, E1 ) )
           and Check( CrossProduct( AY, E2 ) )
           and Check( CrossProduct( AY, E3 ) )
           and Check( CrossProduct( AZ, E1 ) )
           and Check( CrossProduct( AZ, E2 ) )
           and Check( CrossProduct( AZ, E3 ) );
end;

//------------------------------------------------------------------------------

class function TDoubleTria3D.RandG :TDoubleTria3D;
begin
     with Result do
     begin
          Poin1 := TDouble3D.RandG;
          Poin2 := TDouble3D.RandG;
          Poin3 := TDouble3D.RandG;
     end;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function HeronArea( const P1_,P2_,P3_:TSinglePos3D ) :Single;
var
   L1, L2, L3 :Single;
begin
     L1 := Distanc2( P2_, P3_ );
     L2 := Distanc2( P3_, P1_ );
     L3 := Distanc2( P1_, P2_ );

     Result := Roo2( Pow2(       L1   +       L2   +       L3   )
                   - 2 * ( Pow2( L1 ) + Pow2( L2 ) + Pow2( L3 ) ) ) / 4;
end;

function HeronArea( const P1_,P2_,P3_:TDoublePos3D ) :Double;
var
   L1, L2, L3 :Double;
begin
     L1 := Distanc2( P2_, P3_ );
     L2 := Distanc2( P3_, P1_ );
     L3 := Distanc2( P1_, P2_ );

     Result := Roo2( Pow2(       L1   +       L2   +       L3   )
                   - 2 * ( Pow2( L1 ) + Pow2( L2 ) + Pow2( L3 ) ) ) / 4;
end;

//------------------------------------------------------------------------------

function HeronVolum2( const P0_,P1_,P2_,P3_:TSinglePos3D ) :Single;
var
   L01, L23, LL1,
   L02, L31, LL2,
   L03, L12, LL3 :Single;
begin
     L01 := Distanc2( P0_, P1_ );  L23 := Distanc2( P2_, P3_ );
     L02 := Distanc2( P0_, P2_ );  L31 := Distanc2( P3_, P1_ );
     L03 := Distanc2( P0_, P3_ );  L12 := Distanc2( P1_, P2_ );

     LL1 := L01 + L23;
     LL2 := L02 + L31;
     LL3 := L03 + L12;

     Result := ( L23 * ( L01 * ( LL2 + LL3 - LL1 ) - L02 * L03 )
               + L31 * ( L02 * ( LL3 + LL1 - LL2 ) - L03 * L01 )
               + L12 * ( L03 * ( LL1 + LL2 - LL3 ) - L01 * L02 )
               - L23 * L31 * L12 ) / 144;
end;

function HeronVolum2( const P0_,P1_,P2_,P3_:TDoublePos3D ) :Double;
var
   L01, L23, LL1,
   L02, L31, LL2,
   L03, L12, LL3 :Double;
begin
     L01 := Distanc2( P0_, P1_ );  L23 := Distanc2( P2_, P3_ );
     L02 := Distanc2( P0_, P2_ );  L31 := Distanc2( P3_, P1_ );
     L03 := Distanc2( P0_, P3_ );  L12 := Distanc2( P1_, P2_ );

     LL1 := L01 + L23;
     LL2 := L02 + L31;
     LL3 := L03 + L12;

     Result := ( L23 * ( L01 * ( LL2 + LL3 - LL1 ) - L02 * L03 )
               + L31 * ( L02 * ( LL3 + LL1 - LL2 ) - L03 * L01 )
               + L12 * ( L03 * ( LL1 + LL2 - LL3 ) - L01 * L02 )
               - L23 * L31 * L12 ) / 144;
end;

function HeronVolume( const P0_,P1_,P2_,P3_:TSinglePos3D ) :Single;
begin
     Result := Roo2( HeronVolum2( P0_, P1_, P2_, P3_ ) );
end;

function HeronVolume( const P0_,P1_,P2_,P3_:TDoublePos3D ) :Double;
begin
     Result := Roo2( HeronVolum2( P0_, P1_, P2_, P3_ ) );
end;

//------------------------------------------------------------------------------

function TriNormal( const P1_,P2_,P3_:TSinglePos3D ) :TSingleVec3D;
begin
     Result := CrossProduct( P3_ - P2_, P1_ - P2_ ).Unitor;
end;

function TriNormal( const P1_,P2_,P3_:TDoublePos3D ) :TDoubleVec3D;
begin
     Result := CrossProduct( P3_ - P2_, P1_ - P2_ ).Unitor;
end;

//------------------------------------------------------------------------------

function Barycenter( const P1_,P2_:TSinglePos3D ) :TSinglePos3D;
begin
     Result := Ave( P1_, P2_ );
end;

function Barycenter( const P1_,P2_:TDoublePos3D ) :TDoublePos3D;
begin
     Result := Ave( P1_, P2_ );
end;

function Barycenter( const P1_,P2_,P3_:TSinglePos3D ) :TSinglePos3D;
begin
     Result := Ave( P1_, P2_, P3_ );
end;

function Barycenter( const P1_,P2_,P3_:TDoublePos3D ) :TDoublePos3D;
begin
     Result := Ave( P1_, P2_, P3_ );
end;

function Barycenter( const P0_,P1_,P2_,P3_:TSinglePos3D ) :TSinglePos3D;
begin
     Result := Ave( P0_, P1_, P2_, P3_ );
end;

function Barycenter( const P0_,P1_,P2_,P3_:TDoublePos3D ) :TDoublePos3D;
begin
     Result := Ave( P0_, P1_, P2_, P3_ );
end;

//------------------------------------------------------------------------------

function InnerRadius( const P1_,P2_,P3_:TSinglePos3D ) :Single;
var
   L1, L2, L3, S :Single;
begin
     L1 := Distance( P2_, P3_ );
     L2 := Distance( P3_, P1_ );
     L3 := Distance( P1_, P2_ );

     S := ( L1 + L2 + L3 ) / 2;

     Result := Roo2( ( S - L1 ) * ( S - L2 ) * ( S - L3 ) / S );
end;

function InnerRadius( const P1_,P2_,P3_:TDoublePos3D ) :Double;
var
   L1, L2, L3, S :Single;
begin
     L1 := Distance( P2_, P3_ );
     L2 := Distance( P3_, P1_ );
     L3 := Distance( P1_, P2_ );

     S := ( L1 + L2 + L3 ) / 2;

     Result := Roo2( ( S - L1 ) * ( S - L2 ) * ( S - L3 ) / S );
end;

function InnerRadius( const P0_,P1_,P2_,P3_:TSinglePos3D ) :Single;
var
   V, A0, A1, A2, A3 :Single;
begin
     V := HeronVolume( P0_, P1_, P2_, P3_ );

     A0 := HeronArea( P1_, P2_, P3_ );
     A1 := HeronArea( P0_, P3_, P2_ );
     A2 := HeronArea( P3_, P0_, P1_ );
     A3 := HeronArea( P2_, P1_, P0_ );

     Result := 3 * V / ( A0 + A1 + A2 + A3 );
end;

function InnerRadius( const P0_,P1_,P2_,P3_:TDoublePos3D ) :Double;
var
   V, A0, A1, A2, A3 :Double;
begin
     V := HeronVolume( P0_, P1_, P2_, P3_ );

     A0 := HeronArea( P1_, P2_, P3_ );
     A1 := HeronArea( P0_, P3_, P2_ );
     A2 := HeronArea( P3_, P0_, P1_ );
     A3 := HeronArea( P2_, P1_, P0_ );

     Result := 3 * V / ( A0 + A1 + A2 + A3 );
end;

//------------------------------------------------------------------------------

function InnerCenter( const P1_,P2_,P3_:TSinglePos3D ) :TSinglePos3D;
var
   L1, L2, L3 :Single;
begin
     L1 := Distance( P2_, P3_ );
     L2 := Distance( P3_, P1_ );
     L3 := Distance( P1_, P2_ );

     Result := ( L1 * P1_ + L2 * P2_ + L3 * P3_ )
             / ( L1       + L2       + L3       );
end;

function InnerCenter( const P1_,P2_,P3_:TDoublePos3D ) :TDoublePos3D;
var
   L1, L2, L3 :Double;
begin
     L1 := Distance( P2_, P3_ );
     L2 := Distance( P3_, P1_ );
     L3 := Distance( P1_, P2_ );

     Result := ( L1 * P1_ + L2 * P2_ + L3 * P3_ )
             / ( L1       + L2       + L3       );
end;

function InnerCenter( const P0_,P1_,P2_,P3_:TSinglePos3D ) :TSinglePos3D;
var
   A0, A1, A2, A3 :Single;
begin
     A0 := HeronArea( P1_, P2_, P3_ );
     A1 := HeronArea( P0_, P3_, P2_ );
     A2 := HeronArea( P3_, P0_, P1_ );
     A3 := HeronArea( P2_, P1_, P0_ );

     Result := ( A0 * P0_ + A1 * P1_ + A2 * P2_ + A3 * P3_ )
             / ( A0       + A1       + A2       + A3       );
end;

function InnerCenter( const P0_,P1_,P2_,P3_:TDoublePos3D ) :TDoublePos3D;
var
   A0, A1, A2, A3 :Double;
begin
     A0 := HeronArea( P1_, P2_, P3_ );
     A1 := HeronArea( P0_, P3_, P2_ );
     A2 := HeronArea( P3_, P0_, P1_ );
     A3 := HeronArea( P2_, P1_, P0_ );

     Result := ( A0 * P0_ + A1 * P1_ + A2 * P2_ + A3 * P3_ )
             / ( A0       + A1       + A2       + A3       );
end;

//------------------------------------------------------------------------------

function CircumCenter( const P1_,P2_,P3_,P4_:TSinglePos3D ) :TSinglePos3D;
var
   L1, L2, L3, L4 :Single;
   M :TSingleM3;
   V :TSingle3D;
begin
     L1 := P1_.Siz2;
     L2 := P2_.Siz2;
     L3 := P3_.Siz2;
     L4 := P4_.Siz2;

     with M do
     begin
          _11 := P2_.X - P1_.X;  _12 := P2_.Y - P1_.Y;  _13 := P2_.Z - P1_.Z;
          _21 := P3_.X - P2_.X;  _22 := P3_.Y - P2_.Y;  _23 := P3_.Z - P2_.Z;
          _31 := P4_.X - P3_.X;  _32 := P4_.Y - P3_.Y;  _33 := P4_.Z - P3_.Z;
     end;

     with V do
     begin
          X := L2 - L1;
          Y := L3 - L2;
          Z := L4 - L3;
     end;

     Result := M.Inverse * V / 2;
end;

function CircumCenter( const P1_,P2_,P3_,P4_:TDoublePos3D ) :TDoublePos3D;
var
   L1, L2, L3, L4 :Double;
   M :TDoubleM3;
   V :TDouble3D;
begin
     L1 := P1_.Siz2;
     L2 := P2_.Siz2;
     L3 := P3_.Siz2;
     L4 := P4_.Siz2;

     with M do
     begin
          _11 := P2_.X - P1_.X;  _12 := P2_.Y - P1_.Y;  _13 := P2_.Z - P1_.Z;
          _21 := P3_.X - P2_.X;  _22 := P3_.Y - P2_.Y;  _23 := P3_.Z - P2_.Z;
          _31 := P4_.X - P3_.X;  _32 := P4_.Y - P3_.Y;  _33 := P4_.Z - P3_.Z;
     end;

     with V do
     begin
          X := L2 - L1;
          Y := L3 - L2;
          Z := L4 - L3;
     end;

     Result := M.Inverse * V / 2;
end;

//------------------------------------------------------------------------------

function CircumSphereCenter( const P1_,P2_,P3_:TSingle3D ) :TSingle3D;
var
   L1, L2, L3,
   W1, W2, W3 :Single;
begin
     L1 := Distance( P2_, P3_ );
     L2 := Distance( P3_, P1_ );
     L3 := Distance( P1_, P2_ );

     W1 := L1 * ( L2 + L3 - L1 );
     W2 := L2 * ( L3 + L1 - L2 );
     W3 := L3 * ( L1 + L2 - L3 );

     Result := ( W1 * P1_ + W2 * P2_ + W3 * P3_ )
             / ( W1       + W2       + W3       );
end;

function CircumSphereCenter( const P1_,P2_,P3_:TDouble3D ) :TDouble3D;
var
   L1, L2, L3,
   W1, W2, W3 :Double;
begin
     L1 := Distance( P2_, P3_ );
     L2 := Distance( P3_, P1_ );
     L3 := Distance( P1_, P2_ );

     W1 := L1 * ( L2 + L3 - L1 );
     W2 := L2 * ( L3 + L1 - L2 );
     W3 := L3 * ( L1 + L2 - L3 );

     Result := ( W1 * P1_ + W2 * P2_ + W3 * P3_ )
             / ( W1       + W2       + W3       );
end;

//------------------------------------------------------------------------------

function MarginCorner( const V1_,V2_:TSingleVec3D; Margin_:Single ) :TSingleVec3D;
var
   R :Single;
   E1, E2 :TSingleVec3D;
begin
     R := InnerRadius( TSingle3D.Create( 0, 0, 0 ), V1_, V2_ );

     if R < Margin_ then Margin_ := R;

     E1 := V1_.Unitor;
     E2 := V2_.Unitor;

     Result := ( Margin_ / Roo2( 1 - Pow2( DotProduct( E1, E2 ) ) ) ) * ( E1 + E2 );
end;

function MarginCorner( const V1_,V2_:TDoubleVec3D; Margin_:Double ) :TDoubleVec3D;
var
   R :Double;
   E1, E2 :TDoubleVec3D;
begin
     R := InnerRadius( TDouble3D.Create( 0, 0, 0 ), V1_, V2_ );

     if R < Margin_ then Margin_ := R;

     E1 := V1_.Unitor;
     E2 := V2_.Unitor;

     Result := ( Margin_ / Roo2( 1 - Pow2( DotProduct( E1, E2 ) ) ) ) * ( E1 + E2 );
end;

//------------------------------------------------------------------------------

function MarginCorner( const P0_,P1_,P2_:TSinglePos3D; Margin_:Single ) :TSinglePos3D;
var
   R :Single;
   E1, E2 :TSingleVec3D;
begin
     R := InnerRadius( P0_, P1_, P2_ );

     if R < Margin_ then Margin_ := R;

     E1 := P0_.UnitorTo( P1_ );
     E2 := P0_.UnitorTo( P2_ );

     Result := ( Margin_ / Roo2( 1 - Pow2( DotProduct( E1, E2 ) ) ) ) * ( E1 + E2 ) + P0_;
end;

function MarginCorner( const P0_,P1_,P2_:TDoublePos3D; Margin_:Double ) :TDoublePos3D;
var
   R :Double;
   E1, E2 :TDoubleVec3D;
begin
     R := InnerRadius( P0_, P1_, P2_ );

     if R < Margin_ then Margin_ := R;

     E1 := P0_.UnitorTo( P1_ );
     E2 := P0_.UnitorTo( P2_ );

     Result := ( Margin_ / Roo2( 1 - Pow2( DotProduct( E1, E2 ) ) ) ) * ( E1 + E2 ) + P0_;
end;

//------------------------------------------------------------------------------

function Reflect( const Ray_,Nor_:TSingle3D ) :TSingle3D;
begin
     Result := Ray_ - 2 * DotProduct( Ray_, Nor_ ) * Nor_;
end;

function Reflect( const Ray_,Nor_:TDouble3D ) :TDouble3D;
begin
     Result := Ray_ - 2 * DotProduct( Ray_, Nor_ ) * Nor_;
end;

//------------------------------------------------------------------------------

function ReflectW( const Ray_,Nor_:TSingle3D; const RaI_:Single ) :Single;
var
   N2, C, C2, G, G2, N2C :Single;
begin
     N2 := Pow2( RaI_ );

     C := DotProduct( Ray_, Nor_ );  C2 := Pow2( C );

     G2 := N2 + C2 - 1;

     if G2 > 0 then
     begin
          G := Roo2( G2 );

          N2C := N2 * C;

          Result := ( Pow2( (   C + G ) / (   C - G ) )
                    + Pow2( ( N2C + G ) / ( N2C - G ) ) ) / 2;
          { 近似
          R := Pow2( ( RaI_ - 1 ) / ( RaI_ + 1 ) );
          Result := R + ( 1 - R ) * IntPower( 1 + C, 5 );
          }
     end
     else Result := 1;
end;

function ReflectW( const Ray_,Nor_:TDouble3D; const RaI_:Double ) :Double;
var
   N2, C, C2, G, G2, N2C :Double;
begin
     N2 := Pow2( RaI_ );

     C := DotProduct( Ray_, Nor_ );  C2 := Pow2( C );

     G2 := N2 + C2 - 1;

     if G2 > 0 then
     begin
          G := Roo2( G2 );

          N2C := N2 * C;

          Result := ( Pow2( (   C + G ) / (   C - G ) )
                    + Pow2( ( N2C + G ) / ( N2C - G ) ) ) / 2;
          { 近似
          R := Pow2( ( RaI_ - 1 ) / ( RaI_ + 1 ) );
          Result := R + ( 1 - R ) * IntPower( 1 + C, 5 );
          }
     end
     else Result := 1;
end;

//------------------------------------------------------------------------------

function Refract( const Ray_,Nor_:TSingle3D; const RaI_:Single ) :TSingle3D;
var
   N2, C, C2, G, G2 :Single;
begin
     N2 := Pow2( RaI_ );

     C := DotProduct( Ray_, Nor_ );  C2 := Pow2( C );

     G2 := N2 + C2 - 1;

     G := Roo2( G2 );

     Result := ( Ray_ - ( C + G ) * Nor_ ) / RaI_;  Result := Result.Unitor;
end;

function Refract( const Ray_,Nor_:TDouble3D; const RaI_:Double ) :TDouble3D;
var
   N2, C, C2, G, G2 :Double;
begin
     N2 := Pow2( RaI_ );

     C := DotProduct( Ray_, Nor_ );  C2 := Pow2( C );

     G2 := N2 + C2 - 1;

     G := Roo2( G2 );

     Result := ( Ray_ - ( C + G ) * Nor_ ) / RaI_;  Result := Result.Unitor;
end;

//------------------------------------------------------------------------------

function Refract( const Ray_,Nor_:TSingle3D; const RaI_:Single; out RaV_:TSingle3D; out ReW_:Single ) :Boolean;
var
   N2, C, C2, G, G2, N2C :Single;
begin
     N2 := Pow2( RaI_ );

     C := DotProduct( Ray_, Nor_ );  C2 := Pow2( C );

     G2 := N2 + C2 - 1;

     Result := ( G2 > 0 );

     if Result then
     begin
          G := Roo2( G2 );

          RaV_ := ( Ray_ - ( C + G ) * Nor_ ) / RaI_;  RaV_ := RaV_.Unitor;

          N2C := N2 * C;

          ReW_ := ( Pow2( (   C + G ) / (   C - G ) )
                  + Pow2( ( N2C + G ) / ( N2C - G ) ) ) / 2;
          { 近似
          R := Pow2( ( RaI_ - 1 ) / ( RaI_ + 1 ) );
          ReW_ := R + ( 1 - R ) * IntPower( 1 + C, 5 );
          }
     end;
end;

function Refract( const Ray_,Nor_:TDouble3D; const RaI_:Double; out RaV_:TDouble3D; out ReW_:Double ) :Boolean;
var
   N2, C, C2, G, G2, N2C :Double;
begin
     N2 := Pow2( RaI_ );

     C := DotProduct( Ray_, Nor_ );  C2 := Pow2( C );

     G2 := N2 + C2 - 1;

     Result := ( G2 > 0 );

     if Result then
     begin
          G := Roo2( G2 );

          RaV_ := ( Ray_ - ( C + G ) * Nor_ ) / RaI_;  RaV_ := RaV_.Unitor;

          N2C := N2 * C;

          ReW_ := ( Pow2( (   C + G ) / (   C - G ) )
                  + Pow2( ( N2C + G ) / ( N2C - G ) ) ) / 2;
          { 近似
          R := Pow2( ( RaI_ - 1 ) / ( RaI_ + 1 ) );
          ReW_ := R + ( 1 - R ) * IntPower( 1 + C, 5 );
          }
     end;
end;

//------------------------------------------------------------------------------

function SolidAngle( const P1_,P2_,P3_:TSingle3D; const P_:TSingle3D ) :Single;
var
   V1, V2, V3 :TSingle3D;
   L1, L2, L3, A, B :Single;
begin
     V1 := P_.VectorTo( P1_ );  L1 := V1.Size;
     V2 := P_.VectorTo( P2_ );  L2 := V2.Size;
     V3 := P_.VectorTo( P3_ );  L3 := V3.Size;

     A := V1.X * V2.Y * V3.Z + V2.X * V3.Y * V1.Z + V3.X * V1.Y * V2.Z
        - V1.X * V3.Y * V2.Z - V2.X * V1.Y * V3.Z - V3.X * V2.Y * V1.Z;

     B := L1 * L2 * L3
        + L3 * DotProduct( V1, V2 )
        + L1 * DotProduct( V2, V3 )
        + L2 * DotProduct( V3, V1 );

     Result := 2 * ArcTan2( A, B );
end;

function SolidAngle( const P1_,P2_,P3_:TDouble3D; const P_:TDouble3D ) :Double;
var
   V1, V2, V3 :TDouble3D;
   L1, L2, L3, A, B :Double;
begin
     V1 := P_.VectorTo( P1_ );  L1 := V1.Size;
     V2 := P_.VectorTo( P2_ );  L2 := V2.Size;
     V3 := P_.VectorTo( P3_ );  L3 := V3.Size;

     A := V1.X * V2.Y * V3.Z + V2.X * V3.Y * V1.Z + V3.X * V1.Y * V2.Z
        - V1.X * V3.Y * V2.Z - V2.X * V1.Y * V3.Z - V3.X * V2.Y * V1.Z;

     B := L1 * L2 * L3
        + L3 * DotProduct( V1, V2 )
        + L1 * DotProduct( V2, V3 )
        + L2 * DotProduct( V3, V1 );

     Result := 2 * ArcTan2( A, B );
end;

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
