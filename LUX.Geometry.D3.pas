unit LUX.Geometry.D3;

interface //#################################################################### ■

uses LUX, LUX.D3, LUX.Geometry;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleSpher2

     TSingleSpher2 = record
     private
     public
       Center :TSingle3D;
       Radiu2 :Single;
       /////
       constructor Create( const P1_,P2_,P3_,P4_:TSingle3D );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleSpher2

     TDoubleSpher2 = record
     private
     public
       Center :TDouble3D;
       Radiu2 :Double;
       /////
       constructor Create( const P1_,P2_,P3_,P4_:TDouble3D );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleSphere

     TSingleSphere = record
     private
     public
       Center :TSingle3D;
       Radius :Single;
       /////
       constructor Create( const P1_,P2_,P3_,P4_:TSingle3D );
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
       constructor Create( const P1_,P2_,P3_,P4_:TDouble3D );
       ///// 型変換
       class operator Implicit( const Spher2_:TDoubleSpher2 ) :TDoubleSphere;
       class operator Implicit( const Sphere_:TDoubleSphere ) :TDoubleSpher2;
       ///// メソッド
       class function Inner( const P1_,P2_,P3_,P4_:TDouble3D ) :TDoubleSphere; static;
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

function MarginCorner( const V1_,V2_:TSingleVec3D; Margin_:Single ) :TSingleVec3D; overload;
function MarginCorner( const V1_,V2_:TDoubleVec3D; Margin_:Double ) :TDoubleVec3D; overload;

function MarginCorner( const P0_,P1_,P2_:TSinglePos3D; Margin_:Single ) :TSinglePos3D; overload;
function MarginCorner( const P0_,P1_,P2_:TDoublePos3D; Margin_:Double ) :TDoublePos3D; overload;

function Reflect( const InV_,Nor_:TSingle3D ) :TSingle3D; overload;
function Reflect( const InV_,Nor_:TDouble3D ) :TDouble3D; overload;

function Refract( const InV_,Nor_:TSingle3D; const RaI_:Single; out RaV_:TSingle3D; out ReW_:Single ) :Boolean; overload;
function Refract( const InV_,Nor_:TDouble3D; const RaI_:Double; out RaV_:TDouble3D; out ReW_:Double ) :Boolean; overload;

implementation //############################################################### ■

uses System.Math,
     LUX.Matrix.L3;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleSpher2

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TSingleSpher2.Create( const P1_,P2_,P3_,P4_:TSingle3D );
begin
     Center := CircumCenter( P1_, P2_, P3_, P4_ );
     Radiu2 := Distanc2( Center, P1_ );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleSpher2

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TDoubleSpher2.Create( const P1_,P2_,P3_,P4_:TDouble3D );
begin
     Center := CircumCenter( P1_, P2_, P3_, P4_ );
     Radiu2 := Distanc2( Center, P1_ );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleSphere

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TSingleSphere.Create( const P1_,P2_,P3_,P4_:TSingle3D );
begin
     Self := TSingleSpher2.Create( P1_, P2_, P3_, P4_ );
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

function Reflect( const InV_,Nor_:TSingle3D ) :TSingle3D;
begin
     Result := InV_ - 2 * DotProduct( InV_, Nor_ ) * Nor_;
end;

function Reflect( const InV_,Nor_:TDouble3D ) :TDouble3D;
begin
     Result := InV_ - 2 * DotProduct( InV_, Nor_ ) * Nor_;
end;

//------------------------------------------------------------------------------

function Refract( const InV_,Nor_:TSingle3D; const RaI_:Single; out RaV_:TSingle3D; out ReW_:Single ) :Boolean;
var
   N2, C, C2, G, G2, N2C :Single;
begin
     N2 := Pow2( RaI_ );

     C := -DotProduct( InV_, Nor_ );  C2 := Pow2( C );

     G2 := N2 + C2 - 1;

     Result := ( G2 >= 0 );

     if Result then
     begin
          G := Roo2( G2 );

          RaV_ := ( InV_ + ( C - G ) * Nor_ ) / RaI_;

          N2C := N2 * C;

          ReW_ := ( Pow2( (   C - G ) / (   C + G ) )
                  + Pow2( ( N2C - G ) / ( N2C + G ) ) ) / 2;
          { 近似
          R := Pow2( ( RaI_ - 1 ) / ( RaI_ + 1 ) );
          ReW_ := R + ( 1 - R ) * IntPower( 1 - C, 5 );
          }
     end;
end;

function Refract( const InV_,Nor_:TDouble3D; const RaI_:Double; out RaV_:TDouble3D; out ReW_:Double ) :Boolean;
var
   N2, C, C2, G, G2, N2C :Double;
begin
     N2 := Pow2( RaI_ );

     C := -DotProduct( InV_, Nor_ );  C2 := Pow2( C );

     G2 := N2 + C2 - 1;

     Result := ( G2 >= 0 );

     if Result then
     begin
          G := Roo2( G2 );

          RaV_ := ( InV_ + ( C - G ) * Nor_ ) / RaI_;

          N2C := N2 * C;

          ReW_ := ( Pow2( (   C - G ) / (   C + G ) )
                  + Pow2( ( N2C - G ) / ( N2C + G ) ) ) / 2;
          { 近似
          R := Pow2( ( RaI_ - 1 ) / ( RaI_ + 1 ) );
          ReW_ := R + ( 1 - R ) * IntPower( 1 - C, 5 );
          }
     end;
end;

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
