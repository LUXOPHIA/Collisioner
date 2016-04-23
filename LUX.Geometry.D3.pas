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
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleSpher2

     TDoubleSpher2 = record
     private
     public
       Center :TDouble3D;
       Radiu2 :Double;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleSphere

     TSingleSphere = record
     private
     public
       Center :TSingle3D;
       Radius :Single;
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
       ///// 型変換
       class operator Implicit( const Spher2_:TDoubleSpher2 ) :TDoubleSphere;
       class operator Implicit( const Sphere_:TDoubleSphere ) :TDoubleSpher2;
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function CircumscribedCenter( const P1_,P2_,P3_,P4_:TSingle3D ) :TSingle3D; overload;
function CircumscribedCenter( const P1_,P2_,P3_,P4_:TDouble3D ) :TDouble3D; overload;

function CircumscribedSpher2( const P1_,P2_,P3_,P4_:TSingle3D ) :TSingleSpher2; overload;
function CircumscribedSpher2( const P1_,P2_,P3_,P4_:TDouble3D ) :TDoubleSpher2; overload;

function CircumscribedSphere( const P1_,P2_,P3_,P4_:TSingle3D ) :TSingleSphere; overload;
function CircumscribedSphere( const P1_,P2_,P3_,P4_:TDouble3D ) :TDoubleSphere; overload;

implementation //############################################################### ■

uses LUX.Matrix.L3;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleSpher2

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleSpher2

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleSphere

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

///////////////////////////////////////////////////////////////////////// 型変換

class operator TSingleSphere.Implicit( const Spher2_:TSingleSpher2 ) :TSingleSphere;
begin
     with Result do
     begin
          Center :=       Spher2_.Center  ;
          Radius := Roo2( Spher2_.Radiu2 );
     end
end;

class operator TSingleSphere.Implicit( const Sphere_:TSingleSphere ) :TSingleSpher2;
begin
     with Result do
     begin
          Center :=       Sphere_.Center  ;
          Radiu2 := Pow2( Sphere_.Radius );
     end

end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleSphere

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

///////////////////////////////////////////////////////////////////////// 型変換

class operator TDoubleSphere.Implicit( const Spher2_:TDoubleSpher2 ) :TDoubleSphere;
begin
     with Result do
     begin
          Center :=       Spher2_.Center  ;
          Radius := Roo2( Spher2_.Radiu2 );
     end
end;

class operator TDoubleSphere.Implicit( const Sphere_:TDoubleSphere ) :TDoubleSpher2;
begin
     with Result do
     begin
          Center :=       Sphere_.Center  ;
          Radiu2 := Pow2( Sphere_.Radius );
     end

end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function CircumscribedCenter( const P1_,P2_,P3_,P4_:TSingle3D ) :TSingle3D;
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

     Result := M.Inverse * V / 2
end;

function CircumscribedCenter( const P1_,P2_,P3_,P4_:TDouble3D ) :TDouble3D;
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

     Result := M.Inverse * V / 2
end;

////////////////////////////////////////////////////////////////////////////////

function CircumscribedSpher2( const P1_,P2_,P3_,P4_:TSingle3D ) :TSingleSpher2;
begin
     with Result do
     begin
          Center := CircumscribedCenter( P1_, P2_, P3_, P4_ );

          Radiu2 := ( ( P1_ - Center ).Siz2
                    + ( P2_ - Center ).Siz2
                    + ( P3_ - Center ).Siz2
                    + ( P4_ - Center ).Siz2 ) / 4;
     end
end;

function CircumscribedSpher2( const P1_,P2_,P3_,P4_:TDouble3D ) :TDoubleSpher2;
begin
     with Result do
     begin
          Center := CircumscribedCenter( P1_, P2_, P3_, P4_ );

          Radiu2 := ( ( P1_ - Center ).Siz2
                    + ( P2_ - Center ).Siz2
                    + ( P3_ - Center ).Siz2
                    + ( P4_ - Center ).Siz2 ) / 4;
     end
end;

////////////////////////////////////////////////////////////////////////////////

function CircumscribedSphere( const P1_,P2_,P3_,P4_:TSingle3D ) :TSingleSphere;
begin
     Result := CircumscribedSpher2( P1_, P2_, P3_, P4_ );
end;

function CircumscribedSphere( const P1_,P2_,P3_,P4_:TDouble3D ) :TDoubleSphere;
begin
     Result := CircumscribedSpher2( P1_, P2_, P3_, P4_ );
end;

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
