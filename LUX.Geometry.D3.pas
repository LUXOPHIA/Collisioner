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
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function TriNormal( const P1_,P2_,P3_:TSinglePos3D ) :TSingleVec3D; inline; overload;
function TriNormal( const P1_,P2_,P3_:TDoublePos3D ) :TDoubleVec3D; inline; overload;

function CircumCenter( const P0_,P1_,P2_,P3_:TSingle3D ) :TSingle3D; overload;
function CircumCenter( const P0_,P1_,P2_,P3_:TDouble3D ) :TDouble3D; overload;

function HeronVolum2( const P0_,P1_,P2_,P3_:TSingle3D ) :Single; overload;
function HeronVolum2( const P0_,P1_,P2_,P3_:TDouble3D ) :Double; overload;

function HeronVolume( const P0_,P1_,P2_,P3_:TSingle3D ) :Single; overload;
function HeronVolume( const P0_,P1_,P2_,P3_:TDouble3D ) :Double; overload;

function MarginCorner( const V0_,V1_:TSingleVec3D; const Margin_:Single ) :TSingleVec3D; overload;
function MarginCorner( const V0_,V1_:TDoubleVec3D; const Margin_:Double ) :TDoubleVec3D; overload;

function MarginCorner( const P0_,P1_,P2_:TSinglePos3D; const Margin_:Single ) :TSinglePos3D; overload;
function MarginCorner( const P0_,P1_,P2_:TDoublePos3D; const Margin_:Double ) :TDoublePos3D; overload;

implementation //############################################################### ■

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

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function TriNormal( const P1_,P2_,P3_:TSinglePos3D ) :TSingleVec3D;
begin
     Result := CrossProduct( P3_ - P2_, P1_ - P2_ ).Unitor;
end;

function TriNormal( const P1_,P2_,P3_:TDoublePos3D ) :TDoubleVec3D;
begin
     Result := CrossProduct( P3_ - P2_, P1_ - P2_ ).Unitor;
end;

////////////////////////////////////////////////////////////////////////////////

function CircumCenter( const P0_,P1_,P2_,P3_:TSingle3D ) :TSingle3D;
var
   L01, L23, LL1,
   L02, L31, LL2,
   L03, L12, LL3,
   W0, W1, W2, W3 :Single;
begin
     L01 := Distanc2( P0_, P1_ );  L23 := Distanc2( P2_, P3_ );
     L02 := Distanc2( P0_, P2_ );  L31 := Distanc2( P3_, P1_ );
     L03 := Distanc2( P0_, P3_ );  L12 := Distanc2( P1_, P2_ );

     LL1 := L01 * L23;
     LL2 := L02 * L31;
     LL3 := L03 * L12;

     W0 := LL1 * ( L31 + L12 - L23 ) + LL2 * ( L12 + L23 - L31 ) + LL3 * ( L23 + L31 - L12 ) - 2 * L23 * L31 * L12;
     W1 := LL1 * ( L02 + L03 - L23 ) + LL2 * ( L03 + L23 - L02 ) + LL3 * ( L23 + L02 - L03 ) - 2 * L23 * L02 * L03;
     W2 := LL1 * ( L03 + L31 - L01 ) + LL2 * ( L03 + L01 - L31 ) + LL3 * ( L01 + L31 - L03 ) - 2 * L01 * L31 * L03;
     W3 := LL1 * ( L02 + L12 - L01 ) + LL2 * ( L12 + L01 - L02 ) + LL3 * ( L01 + L02 - L12 ) - 2 * L01 * L02 * L12;

     { W0+W1+W2+W3 = 8 * Pow2( 6 * HeronVolume( P0, P1, P2, P3 ) ) }

     Result := ( W0 * P0_ + W1 * P1_ + W2 * P2_ + W3 * P3_ )
             / ( W0       + W1       + W2       + W3       );
end;

function CircumCenter( const P0_,P1_,P2_,P3_:TDouble3D ) :TDouble3D;
var
   L01, L23, LL1,
   L02, L31, LL2,
   L03, L12, LL3,
   W0, W1, W2, W3 :Double;
begin
     L01 := Distanc2( P0_, P1_ );  L23 := Distanc2( P2_, P3_ );
     L02 := Distanc2( P0_, P2_ );  L31 := Distanc2( P3_, P1_ );
     L03 := Distanc2( P0_, P3_ );  L12 := Distanc2( P1_, P2_ );

     LL1 := L01 * L23;
     LL2 := L02 * L31;
     LL3 := L03 * L12;

     W0 := LL1 * ( L31 + L12 - L23 ) + LL2 * ( L12 + L23 - L31 ) + LL3 * ( L23 + L31 - L12 ) - 2 * L23 * L31 * L12;
     W1 := LL1 * ( L02 + L03 - L23 ) + LL2 * ( L03 + L23 - L02 ) + LL3 * ( L23 + L02 - L03 ) - 2 * L23 * L02 * L03;
     W2 := LL1 * ( L03 + L31 - L01 ) + LL2 * ( L03 + L01 - L31 ) + LL3 * ( L01 + L31 - L03 ) - 2 * L01 * L31 * L03;
     W3 := LL1 * ( L02 + L12 - L01 ) + LL2 * ( L12 + L01 - L02 ) + LL3 * ( L01 + L02 - L12 ) - 2 * L01 * L02 * L12;

     { W0+W1+W2+W3 = 8 * Pow2( 6 * HeronVolume( P0, P1, P2, P3 ) ) }

     Result := ( W0 * P0_ + W1 * P1_ + W2 * P2_ + W3 * P3_ )
             / ( W0       + W1       + W2       + W3       );
end;

{
function CircumCenter( const P1_,P2_,P3_,P4_:TSingle3D ) :TSingle3D;
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

function CircumCenter( const P1_,P2_,P3_,P4_:TDouble3D ) :TDouble3D;
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
}

////////////////////////////////////////////////////////////////////////////////

function HeronVolum2( const P0_,P1_,P2_,P3_:TSingle3D ) :Single;
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

function HeronVolum2( const P0_,P1_,P2_,P3_:TDouble3D ) :Double;
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

function HeronVolume( const P0_,P1_,P2_,P3_:TSingle3D ) :Single;
begin
     Result := Roo2( HeronVolum2( P0_, P1_, P2_, P3_ ) );
end;

function HeronVolume( const P0_,P1_,P2_,P3_:TDouble3D ) :Double;
begin
     Result := Roo2( HeronVolum2( P0_, P1_, P2_, P3_ ) );
end;

////////////////////////////////////////////////////////////////////////////////

function MarginCorner( const V0_,V1_:TSingleVec3D; const Margin_:Single ) :TSingleVec3D;
begin
     Result := ( Margin_ / Roo2( 1 - Pow2( DotProduct( V0_, V1_ ) ) ) ) * ( V0_ + V1_ );
end;

function MarginCorner( const V0_,V1_:TDoubleVec3D; const Margin_:Double ) :TDoubleVec3D;
begin
     Result := ( Margin_ / Roo2( 1 - Pow2( DotProduct( V0_, V1_ ) ) ) ) * ( V0_ + V1_ );
end;

////////////////////////////////////////////////////////////////////////////////

function MarginCorner( const P0_,P1_,P2_:TSingleVec3D; const Margin_:Single ) :TSingleVec3D;
begin
     Result := P1_ + MarginCorner( P1_.UnitorTo( P0_ ), P1_.UnitorTo( P2_ ), Margin_ );
end;

function MarginCorner( const P0_,P1_,P2_:TDoubleVec3D; const Margin_:Double ) :TDoubleVec3D;
begin
     Result := P1_ + MarginCorner( P1_.UnitorTo( P0_ ), P1_.UnitorTo( P2_ ), Margin_ );
end;

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
