unit LUX.Geometry.D2;

interface //#################################################################### ■

uses LUX, LUX.D1, LUX.D2, LUX.M2,
     LUX.Geometry;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleCircl2

     TSingleCircl2 = record
     private
     public
       Center :TSingle2D;
       Radiu2 :Single;
       /////
       constructor Create( const P1_,P2_,P3_:TSingle2D ); overload;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleCircl2

     TDoubleCircl2 = record
     private
     public
       Center :TDouble2D;
       Radiu2 :Double;
       /////
       constructor Create( const P1_,P2_,P3_:TDouble2D ); overload;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleCircle

     TSingleCircle = record
     private
     public
       Center :TSingle2D;
       Radius :Single;
       /////
       constructor Create( const P1_,P2_,P3_:TSingle2D ); overload;
       ///// 型変換
       class operator Implicit( const Circl2_:TSingleCircl2 ) :TSingleCircle;
       class operator Implicit( const Circle_:TSingleCircle ) :TSingleCircl2;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleCircle

     TDoubleCircle = record
     private
     public
       Center :TDouble2D;
       Radius :Double;
       /////
       constructor Create( const P1_,P2_,P3_:TDouble2D ); overload;
       ///// 型変換
       class operator Implicit( const Circl2_:TDoubleCircl2 ) :TDoubleCircle;
       class operator Implicit( const Circle_:TDoubleCircle ) :TDoubleCircl2;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleTria2D

     //  P3              P* :Poin*
     //  │＼            E* :Edge*
     //  │  ＼          N* :Enor*
     //  │    ＼
     //  E2─N2  E1
     //  │    ／  ＼
     //  │  N1  N3  ＼
     //  │      │    ＼
     //  P1───E3───P2

     TSingleTria2D = record
     private
       ///// アクセス
       function GetNorv :Single;
       function GetEdge1 :TSingle2D;
       function GetEdge2 :TSingle2D;
       function GetEdge3 :TSingle2D;
       function GetEnor1 :TSingle2D;
       function GetEnor2 :TSingle2D;
       function GetEnor3 :TSingle2D;
       function GetAABB :TSingleArea2D;
     public
       Poin1 :TSingle2D;
       Poin2 :TSingle2D;
       Poin3 :TSingle2D;
       ///// プロパティ
       property Norv  :Single        read GetNorv ;
       property Edge1 :TSingle2D     read GetEdge1;
       property Edge2 :TSingle2D     read GetEdge2;
       property Edge3 :TSingle2D     read GetEdge3;
       property Enor1 :TSingle2D     read GetEnor1;
       property Enor2 :TSingle2D     read GetEnor2;
       property Enor3 :TSingle2D     read GetEnor3;
       property AABB  :TSingleArea2D read GetAABB ;
       ///// メソッド
       function ColliEdge( const Area_:TSingleArea2D ) :Boolean;
       function Collision( const Area_:TSingleArea2D ) :Boolean;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleTria2D

     //  P3              P* :Poin*
     //  │＼            E* :Edge*
     //  │  ＼          N* :Enor*
     //  │    ＼
     //  E2─N2  E1
     //  │    ／  ＼
     //  │  N1  N3  ＼
     //  │      │    ＼
     //  P1───E3───P2

     TDoubleTria2D = record
     private
       ///// アクセス
       function GetNorv :Double;
       function GetEdge1 :TDouble2D;
       function GetEdge2 :TDouble2D;
       function GetEdge3 :TDouble2D;
       function GetEnor1 :TDouble2D;
       function GetEnor2 :TDouble2D;
       function GetEnor3 :TDouble2D;
       function GetAABB :TDoubleArea2D;
     public
       Poin1 :TDouble2D;
       Poin2 :TDouble2D;
       Poin3 :TDouble2D;
       ///// プロパティ
       property Norv  :Double        read GetNorv ;
       property Edge1 :TDouble2D     read GetEdge1;
       property Edge2 :TDouble2D     read GetEdge2;
       property Edge3 :TDouble2D     read GetEdge3;
       property Enor1 :TDouble2D     read GetEnor1;
       property Enor2 :TDouble2D     read GetEnor2;
       property Enor3 :TDouble2D     read GetEnor3;
       property AABB  :TDoubleArea2D read GetAABB ;
       ///// メソッド
       function ColliEdge( const Area_:TDoubleArea2D ) :Boolean;
       function Collision( const Area_:TDoubleArea2D ) :Boolean;
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function HeronAre2( const L1_,L2_,L3_:Single ) :Single; overload;
function HeronAre2( const L1_,L2_,L3_:Double ) :Double; overload;

function HeronArea( const L1_,L2_,L3_:Single ) :Single; overload;
function HeronArea( const L1_,L2_,L3_:Double ) :Double; overload;

function LineNormal( const P0_,P1_:TSingle2D ) :TSingle2D; overload;
function LineNormal( const P0_,P1_:TDouble2D ) :TDouble2D; overload;

function Barycenter( const P1_,P2_:TSinglePos2D ) :TSinglePos2D; overload;
function Barycenter( const P1_,P2_:TDoublePos2D ) :TDoublePos2D; overload;

function Barycenter( const P1_,P2_,P3_:TSinglePos2D ) :TSinglePos2D; overload;
function Barycenter( const P1_,P2_,P3_:TDoublePos2D ) :TDoublePos2D; overload;

function InnerRadius( const P1_,P2_,P3_:TSinglePos2D ) :Single; overload;
function InnerRadius( const P1_,P2_,P3_:TDoublePos2D ) :Double; overload;

function InnerCenter( const P1_,P2_,P3_:TSinglePos2D ) :TSinglePos2D; overload;
function InnerCenter( const P1_,P2_,P3_:TDoublePos2D ) :TDoublePos2D; overload;

function CircumCenter( const P1_,P2_,P3_:TSingle2D ) :TSingle2D; overload;
function CircumCenter( const P1_,P2_,P3_:TDouble2D ) :TDouble2D; overload;

function CurveLength( const Ps_:array of TSingle2D ) :Single; overload;
function CurveLength( const Ps_:array of TDouble2D ) :Single; overload;

function ClosedCurveLength( const Ps_:array of TSingle2D ) :Single; overload;
function ClosedCurveLength( const Ps_:array of TDouble2D ) :Single; overload;

function BoundingBox( const Ps_:array of TSingle2D ) :TSingleArea2D; overload;
function BoundingBox( const Ps_:array of TDouble2D ) :TDoubleArea2D; overload;

function ShapeMatch( const Vs0_,Vs1_:array of TSingle2D ) :TSingleM2; overload;
function ShapeMatch( const Vs0_,Vs1_:array of TDouble2D ) :TDoubleM2; overload;

function InsideLoop( const P_:TSingle2D; const Ps_:TArray<TSingle2D> ) :Single; overload;
function InsideLoop( const P_:TDouble2D; const Ps_:TArray<TDouble2D> ) :Double; overload;

implementation //############################################################### ■

uses System.SysUtils, System.Math;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleCircl2

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TSingleCircl2.Create( const P1_,P2_,P3_:TSingle2D );
begin
     Center := CircumCenter( P1_, P2_, P3_ );

     Radiu2 := ( Distanc2( Center, P1_ )
               + Distanc2( Center, P2_ )
               + Distanc2( Center, P3_ ) ) / 3;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleCircl2

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TDoubleCircl2.Create( const P1_,P2_,P3_:TDouble2D );
begin
     Center := CircumCenter( P1_, P2_, P3_ );

     Radiu2 := ( Distanc2( Center, P1_ )
               + Distanc2( Center, P2_ )
               + Distanc2( Center, P3_ ) ) / 3;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleCircle

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TSingleCircle.Create( const P1_,P2_,P3_:TSingle2D );
begin
     Self := TSingleCircl2.Create( P1_, P2_, P3_ );
end;

///////////////////////////////////////////////////////////////////////// 型変換

class operator TSingleCircle.Implicit( const Circl2_:TSingleCircl2 ) :TSingleCircle;
begin
     with Result do
     begin
          Center :=       Circl2_.Center  ;
          Radius := Roo2( Circl2_.Radiu2 );
     end;
end;

class operator TSingleCircle.Implicit( const Circle_:TSingleCircle ) :TSingleCircl2;
begin
     with Result do
     begin
          Center :=       Circle_.Center  ;
          Radiu2 := Pow2( Circle_.Radius );
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleCircle

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TDoubleCircle.Create( const P1_,P2_,P3_:TDouble2D );
begin
     Self := TDoubleCircl2.Create( P1_, P2_, P3_ );
end;

///////////////////////////////////////////////////////////////////////// 型変換

class operator TDoubleCircle.Implicit( const Circl2_:TDoubleCircl2 ) :TDoubleCircle;
begin
     with Result do
     begin
          Center :=       Circl2_.Center  ;
          Radius := Roo2( Circl2_.Radiu2 );
     end;
end;

class operator TDoubleCircle.Implicit( const Circle_:TDoubleCircle ) :TDoubleCircl2;
begin
     with Result do
     begin
          Center :=       Circle_.Center  ;
          Radiu2 := Pow2( Circle_.Radius );
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleTria2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TSingleTria2D.GetNorv :Single;
begin
     Result := CrossProduct( Edge2, Edge3 );
end;

//------------------------------------------------------------------------------

function TSingleTria2D.GetEdge1 :TSingle2D;
begin
     Result := Poin2.VectorTo( Poin3 );
end;

function TSingleTria2D.GetEdge2 :TSingle2D;
begin
     Result := Poin3.VectorTo( Poin1 );
end;

function TSingleTria2D.GetEdge3 :TSingle2D;
begin
     Result := Poin1.VectorTo( Poin2 );
end;

//------------------------------------------------------------------------------

function TSingleTria2D.GetEnor1 :TSingle2D;
begin
     Result := Norv * Edge1.RotL90;
end;

function TSingleTria2D.GetEnor2 :TSingle2D;
begin
     Result := Norv * Edge2.RotL90;
end;

function TSingleTria2D.GetEnor3 :TSingle2D;
begin
     Result := Norv * Edge3.RotL90;
end;

//------------------------------------------------------------------------------

function TSingleTria2D.GetAABB :TSingleArea2D;
begin
     with Result do
     begin
          ProjX := TSingleArea.Create( Poin1.X, Poin2.X, Poin3.X );
          ProjY := TSingleArea.Create( Poin1.Y, Poin2.Y, Poin3.Y );
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

function TSingleTria2D.ColliEdge( const Area_:TSingleArea2D ) :Boolean;
//······································
     function CheckEdge( const N,P:TSingle2D ) :Boolean;
     var
        B, V :TSingle2D;
     begin
          B := Area_.Poin[ N.Orthant ];

          V := P.VectorTo( B );

          Result := DotProduct( N, V ) >= 0;
     end;
//······································
begin
     //  P3
     //  │＼
     //  │  ＼
     //  │    ＼
     //  E2─N2  E1
     //  │    ／  ＼
     //  │  N1  N3  ＼
     //  │      │    ＼
     //  P1───E3───P2

     Result := CheckEdge( Enor1, Poin2 )
           and CheckEdge( Enor2, Poin3 )
           and CheckEdge( Enor3, Poin1 );
end;

function TSingleTria2D.Collision( const Area_:TSingleArea2D ) :Boolean;
begin
     Result := AABB.Collision( Area_ ) and ColliEdge( Area_ );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleTria2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TDoubleTria2D.GetNorv :Double;
begin
     Result := CrossProduct( Edge2, Edge3 );
end;

//------------------------------------------------------------------------------

function TDoubleTria2D.GetEdge1 :TDouble2D;
begin
     Result := Poin2.VectorTo( Poin3 );
end;

function TDoubleTria2D.GetEdge2 :TDouble2D;
begin
     Result := Poin3.VectorTo( Poin1 );
end;

function TDoubleTria2D.GetEdge3 :TDouble2D;
begin
     Result := Poin1.VectorTo( Poin2 );
end;

//------------------------------------------------------------------------------

function TDoubleTria2D.GetEnor1 :TDouble2D;
begin
     Result := Norv * Edge1.RotL90;
end;

function TDoubleTria2D.GetEnor2 :TDouble2D;
begin
     Result := Norv * Edge2.RotL90;
end;

function TDoubleTria2D.GetEnor3 :TDouble2D;
begin
     Result := Norv * Edge3.RotL90;
end;

//------------------------------------------------------------------------------

function TDoubleTria2D.GetAABB :TDoubleArea2D;
begin
     with Result do
     begin
          ProjX := TDoubleArea.Create( Poin1.X, Poin2.X, Poin3.X );
          ProjY := TDoubleArea.Create( Poin1.Y, Poin2.Y, Poin3.Y );
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

function TDoubleTria2D.ColliEdge( const Area_:TDoubleArea2D ) :Boolean;
//······································
     function CheckEdge( const N,P:TDouble2D ) :Boolean;
     var
        B, V :TDouble2D;
     begin
          B := Area_.Poin[ N.Orthant ];

          V := P.VectorTo( B );

          Result := DotProduct( N, V ) >= 0;
     end;
//······································
begin
     //  P3
     //  │＼
     //  │  ＼
     //  │    ＼
     //  E2─N2  E1
     //  │    ／  ＼
     //  │  N1  N3  ＼
     //  │      │    ＼
     //  P1───E3───P2

     Result := CheckEdge( Enor1, Poin2 )
           and CheckEdge( Enor2, Poin3 )
           and CheckEdge( Enor3, Poin1 );
end;

function TDoubleTria2D.Collision( const Area_:TDoubleArea2D ) :Boolean;
begin
     Result := AABB.Collision( Area_ ) and ColliEdge( Area_ );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function HeronAre2( const L1_,L2_,L3_:Single ) :Single;
var
   S :Single;
begin
     S := ( L1_ + L2_ + L3_ ) / 2;

     Result := S * ( S - L1_ ) * ( S - L2_ ) * ( S - L3_ );
end;

function HeronAre2( const L1_,L2_,L3_:Double ) :Double;
var
   S :Double;
begin
     S := ( L1_ + L2_ + L3_ ) / 2;

     Result := S * ( S - L1_ ) * ( S - L2_ ) * ( S - L3_ );
end;

//------------------------------------------------------------------------------

function HeronArea( const L1_,L2_,L3_:Single ) :Single;
begin
     Result := Roo2( HeronAre2( L1_, L2_, L3_ ) );
end;

function HeronArea( const L1_,L2_,L3_:Double ) :Double;
begin
     Result := Roo2( HeronAre2( L1_, L2_, L3_ ) );
end;

//------------------------------------------------------------------------------

function LineNormal( const P0_,P1_:TSingle2D ) :TSingle2D;
begin
     with P0_.VectorTo( P1_ ) do
     begin
          Result.X := +Y;
          Result.Y := -X;
     end;
end;

function LineNormal( const P0_,P1_:TDouble2D ) :TDouble2D;
begin
     with P0_.VectorTo( P1_ ) do
     begin
          Result.X := +Y;
          Result.Y := -X;
     end;
end;

//------------------------------------------------------------------------------

function Barycenter( const P1_,P2_:TSinglePos2D ) :TSinglePos2D;
begin
     Result := Ave( P1_, P2_ );
end;

function Barycenter( const P1_,P2_:TDoublePos2D ) :TDoublePos2D;
begin
     Result := Ave( P1_, P2_ );
end;

function Barycenter( const P1_,P2_,P3_:TSinglePos2D ) :TSinglePos2D;
begin
     Result := Ave( P1_, P2_, P3_ );
end;

function Barycenter( const P1_,P2_,P3_:TDoublePos2D ) :TDoublePos2D;
begin
     Result := Ave( P1_, P2_, P3_ );
end;

//------------------------------------------------------------------------------

function InnerRadius( const P1_,P2_,P3_:TSinglePos2D ) :Single;
var
   L1, L2, L3, S :Single;
begin
     L1 := Distance( P2_, P3_ );
     L2 := Distance( P3_, P1_ );
     L3 := Distance( P1_, P2_ );

     S := ( L1 + L2 + L3 ) / 2;

     Result := Roo2( ( S - L1 ) * ( S - L2 ) * ( S - L3 ) / S );
end;

function InnerRadius( const P1_,P2_,P3_:TDoublePos2D ) :Double;
var
   L1, L2, L3, S :Single;
begin
     L1 := Distance( P2_, P3_ );
     L2 := Distance( P3_, P1_ );
     L3 := Distance( P1_, P2_ );

     S := ( L1 + L2 + L3 ) / 2;

     Result := Roo2( ( S - L1 ) * ( S - L2 ) * ( S - L3 ) / S );
end;

//------------------------------------------------------------------------------

function InnerCenter( const P1_,P2_,P3_:TSinglePos2D ) :TSinglePos2D;
var
   L1, L2, L3 :Single;
begin
     L1 := Distance( P2_, P3_ );
     L2 := Distance( P3_, P1_ );
     L3 := Distance( P1_, P2_ );

     Result := ( L1 * P1_ + L2 * P2_ + L3 * P3_ )
             / ( L1       + L2       + L3       );
end;

function InnerCenter( const P1_,P2_,P3_:TDoublePos2D ) :TDoublePos2D;
var
   L1, L2, L3 :Double;
begin
     L1 := Distance( P2_, P3_ );
     L2 := Distance( P3_, P1_ );
     L3 := Distance( P1_, P2_ );

     Result := ( L1 * P1_ + L2 * P2_ + L3 * P3_ )
             / ( L1       + L2       + L3       );
end;

//------------------------------------------------------------------------------

function CircumCenter( const P1_,P2_,P3_:TSingle2D ) :TSingle2D;
var
   L1, L2, L3, W :Single;
   E1, E2, E3 :TSingle2D;
begin
     L1 := P1_.Siz2;  E1 := P3_ - P2_;
     L2 := P2_.Siz2;  E2 := P1_ - P3_;
     L3 := P3_.Siz2;  E3 := P2_ - P1_;

     W := 2 * ( P2_.X * P1_.Y - P1_.X * P2_.Y
              + P3_.X * P2_.Y - P2_.X * P3_.Y
              + P1_.X * P3_.Y - P3_.X * P1_.Y );

     with Result do
     begin
          X := ( L1 * E1.Y + L2 * E2.Y + L3 * E3.Y ) / +W;
          Y := ( L1 * E1.X + L2 * E2.X + L3 * E3.X ) / -W;
     end;
end;

function CircumCenter( const P1_,P2_,P3_:TDouble2D ) :TDouble2D;
var
   L1, L2, L3, W :Double;
   E1, E2, E3 :TDouble2D;
begin
     L1 := P1_.Siz2;  E1 := P3_ - P2_;
     L2 := P2_.Siz2;  E2 := P1_ - P3_;
     L3 := P3_.Siz2;  E3 := P2_ - P1_;

     W := 2 * ( P2_.X * P1_.Y - P1_.X * P2_.Y
              + P3_.X * P2_.Y - P2_.X * P3_.Y
              + P1_.X * P3_.Y - P3_.X * P1_.Y );

     with Result do
     begin
          X := ( L1 * E1.Y + L2 * E2.Y + L3 * E3.Y ) / +W;
          Y := ( L1 * E1.X + L2 * E2.X + L3 * E3.X ) / -W;
     end;
end;

//------------------------------------------------------------------------------

function CurveLength( const Ps_:array of TSingle2D ) :Single;
var
   I :Integer;
   P0, P1 :TSingle2D;
begin
     Result := 0;

     P1 := Ps_[ 0 ];
     for I := 1 to High( Ps_ ) do
     begin
          P0 := P1;  P1 := Ps_[ I ];

          Result := Result + Distance( P0, P1 );
     end;
end;

function CurveLength( const Ps_:array of TDouble2D ) :Single;
var
   I :Integer;
   P0, P1 :TDouble2D;
begin
     Result := 0;

     P1 := Ps_[ 0 ];
     for I := 1 to High( Ps_ ) do
     begin
          P0 := P1;  P1 := Ps_[ I ];

          Result := Result + Distance( P0, P1 );
     end;
end;

//------------------------------------------------------------------------------

function ClosedCurveLength( const Ps_:array of TSingle2D ) :Single;
var
   I :Integer;
   P0, P1, P2 :TSingle2D;
begin
     Result := 0;

     P2 := Ps_[ 0 ];

     P1 := P2;
     for I := 1 to High( Ps_ ) do
     begin
          P0 := P1;  P1 := Ps_[ I ];

          Result := Result + Distance( P0, P1 );
     end;

     Result := Result + Distance( P1, P2 );
end;

function ClosedCurveLength( const Ps_:array of TDouble2D ) :Single;
var
   I :Integer;
   P0, P1, P2 :TDouble2D;
begin
     Result := 0;

     P2 := Ps_[ 0 ];

     P1 := P2;
     for I := 1 to High( Ps_ ) do
     begin
          P0 := P1;  P1 := Ps_[ I ];

          Result := Result + Distance( P0, P1 );
     end;

     Result := Result + Distance( P1, P2 );
end;

//------------------------------------------------------------------------------

function BoundingBox( const Ps_:array of TSingle2D ) :TSingleArea2D;
var
   P :TSingle2D;
begin
     Result := TSingleArea2D.NeInf;

     for P in Ps_ do
     begin
          if P.X < Result.Min.X then Result.Min.X := P.X;
          if P.Y < Result.Min.Y then Result.Min.Y := P.Y;

          if Result.Max.X < P.X then Result.Max.X := P.X;
          if Result.Max.Y < P.Y then Result.Max.Y := P.Y;
     end;
end;

function BoundingBox( const Ps_:array of TDouble2D ) :TDoubleArea2D;
var
   P :TDouble2D;
begin
     Result := TDoubleArea2D.NeInf;

     for P in Ps_ do
     begin
          if P.X < Result.Min.X then Result.Min.X := P.X;
          if P.Y < Result.Min.Y then Result.Min.Y := P.Y;

          if Result.Max.X < P.X then Result.Max.X := P.X;
          if Result.Max.Y < P.Y then Result.Max.Y := P.Y;
     end;
end;

//------------------------------------------------------------------------------

function ShapeMatch( const Vs0_,Vs1_:array of TSingle2D ) :TSingleM2;
var
   I :Integer;
   V0, V1 :TSingle2D;
   M :TSingleM2;
begin
     Result := TSingleM2.Create( 0, 0,
                                 0, 0 );

     for I := 0 to High( Vs0_ ) do
     begin
          V0 := Vs0_[ I ];
          V1 := Vs1_[ I ];

          with M do
          begin
               _11 := V1.X * V0.X + V1.Y * V0.Y;  _12 := V1.X * V0.Y - V1.Y * V0.X;
               _21 := V1.Y * V0.X - V1.X * V0.Y;  _22 := V1.X * V0.X + V1.Y * V0.Y;
          end;

          Result := Result + M;
     end;

     Result := Result / Roo2( Pow2( Result._11 ) + Pow2( Result._12 ) );
end;

function ShapeMatch( const Vs0_,Vs1_:array of TDouble2D ) :TDoubleM2;
var
   I :Integer;
   V0, V1 :TDouble2D;
   M :TDoubleM2;
begin
     Result := TDoubleM2.Create( 0, 0,
                                 0, 0 );

     for I := 0 to High( Vs0_ ) do
     begin
          V0 := Vs0_[ I ];
          V1 := Vs1_[ I ];

          with M do
          begin
               _11 := V1.X * V0.X + V1.Y * V0.Y;  _12 := V1.X * V0.Y - V1.Y * V0.X;
               _21 := V1.Y * V0.X - V1.X * V0.Y;  _22 := V1.X * V0.X + V1.Y * V0.Y;
          end;

          Result := Result + M;
     end;

     Result := Result / Roo2( Pow2( Result._11 ) + Pow2( Result._12 ) );
end;

//------------------------------------------------------------------------------

function InsideLoop( const P_:TSingle2D; const Ps_:TArray<TSingle2D> ) :Single;
var
   I :Integer;
   P0, P1, P2, V0, V1 :TSingle2D;
   A :Single;
begin
     Result := 0;

     P2 := Ps_[ 0 ];
     P1 := P2;
     for I := 1 to High( Ps_ )-1 do
     begin
          P0 := P1;  P1 := Ps_[ I ];

          V0 := P0 - P_;
          V1 := P1 - P_;

          A := V0.RotAngleTo( V1 );

          Result := Result + A;
     end;

     V0 := P1 - P_;
     V1 := P2 - P_;

     A := V0.RotAngleTo( V1 );

     Result := Result + A;

     Result := Result / Pi2;
end;

function InsideLoop( const P_:TDouble2D; const Ps_:TArray<TDouble2D> ) :Double;
var
   I :Integer;
   P0, P1, P2, V0, V1 :TDouble2D;
   A :Double;
begin
     Result := 0;

     P2 := Ps_[ 0 ];
     P1 := P2;
     for I := 1 to High( Ps_ )-1 do
     begin
          P0 := P1;  P1 := Ps_[ I ];

          V0 := P0 - P_;
          V1 := P1 - P_;

          A := V0.RotAngleTo( V1 );

          Result := Result + A;
     end;

     V0 := P1 - P_;
     V1 := P2 - P_;

     A := V0.RotAngleTo( V1 );

     Result := Result + A;

     Result := Result / Pi2;
end;

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
