unit LUX.Data.Lattice.T2.D1;

interface //#################################################################### ■

uses LUX, LUX.D1, LUX.D2,
     LUX.M4,
     LUX.Data.Lattice.T2,
     LUX.Curve.T2.D1;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleGridMap2T<T_Item>

     TSingleGridMap2T = class( TPoinArray2D<Single> )
     private
     protected
     public
       constructor Create; overload;
       constructor Create( const CellsX_,CellsY_:Integer ); overload;
       destructor Destroy; override;
       ///// メソッド
       procedure Patch( const T_:TSingle2D; out M_:TSingleM4 ); overload;
       procedure Patch( const T_:TSingle2D; out M_:TdSingleM4 ); overload;
       function Interp( const T_:TSingle2D ) :Single; overload;
       function Interp( const T_:TdSingle2D ) :TdSingle; overload;
       function Nabla( const T_:TSingle2D ) :TSingle2D;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.Math;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleGridMap2T

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TSingleGridMap2T.Create;
begin
     Create( 2, 2 );
end;

constructor TSingleGridMap2T.Create( const CellsX_,CellsY_:Integer );
begin
     Create( CellsX_, CellsY_, 2, 2 );
end;

destructor TSingleGridMap2T.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TSingleGridMap2T.Patch( const T_:TSingle2D; out M_:TSingleM4 );
var
   X1, X2, X3, X4,
   Y1, Y2, Y3, Y4 :Integer;
begin
     X2 := Floor( T_.X );  X1 := X2 - 1;  X3 := X2 + 1;  X4 := X3 + 1;
     Y2 := Floor( T_.Y );  Y1 := Y2 - 1;  Y3 := Y2 + 1;  Y4 := Y3 + 1;

     with M_ do
     begin
          _11 := Poins[ X1, Y1 ];  _12 := Poins[ X2, Y1 ];  _13 := Poins[ X3, Y1 ];  _14 := Poins[ X4, Y1 ];
          _21 := Poins[ X1, Y2 ];  _22 := Poins[ X2, Y2 ];  _23 := Poins[ X3, Y2 ];  _24 := Poins[ X4, Y2 ];
          _31 := Poins[ X1, Y3 ];  _32 := Poins[ X2, Y3 ];  _33 := Poins[ X3, Y3 ];  _34 := Poins[ X4, Y3 ];
          _41 := Poins[ X1, Y4 ];  _42 := Poins[ X2, Y4 ];  _43 := Poins[ X3, Y4 ];  _44 := Poins[ X4, Y4 ];
     end;
end;

procedure TSingleGridMap2T.Patch( const T_:TSingle2D; out M_:TdSingleM4 );
var
   X1, X2, X3, X4,
   Y1, Y2, Y3, Y4 :Integer;
begin
     X2 := Floor( T_.X );  X1 := X2 - 1;  X3 := X2 + 1;  X4 := X3 + 1;
     Y2 := Floor( T_.Y );  Y1 := Y2 - 1;  Y3 := Y2 + 1;  Y4 := Y3 + 1;

     with M_ do
     begin
          _11 := Poins[ X1, Y1 ];  _12 := Poins[ X2, Y1 ];  _13 := Poins[ X3, Y1 ];  _14 := Poins[ X4, Y1 ];
          _21 := Poins[ X1, Y2 ];  _22 := Poins[ X2, Y2 ];  _23 := Poins[ X3, Y2 ];  _24 := Poins[ X4, Y2 ];
          _31 := Poins[ X1, Y3 ];  _32 := Poins[ X2, Y3 ];  _33 := Poins[ X3, Y3 ];  _34 := Poins[ X4, Y3 ];
          _41 := Poins[ X1, Y4 ];  _42 := Poins[ X2, Y4 ];  _43 := Poins[ X3, Y4 ];  _44 := Poins[ X4, Y4 ];
     end;
end;

function TSingleGridMap2T.Interp( const T_:TSingle2D ) :Single;
var
   M :TSingleM4;
   T :TSingle2D;
begin
     Patch( T_, M );

     T.X := Frac( T_.X );
     T.Y := Frac( T_.Y );

     Result := BSplin4( M, T );
end;

function TSingleGridMap2T.Interp( const T_:TdSingle2D ) :TdSingle;
var
   M :TdSingleM4;
   T :TdSingle2D;
begin
     Patch( T_.o, M );

     T.X.o := Frac( T_.X.o );  T.X.d := T_.X.d;
     T.Y.o := Frac( T_.Y.o );  T.Y.d := T_.Y.d;

     Result := BSplin4( M, T );
end;

function TSingleGridMap2T.Nabla( const T_:TSingle2D ) :TSingle2D;
var
   M :TdSingleM4;
   T :TdSingle2D;
begin
     Patch( T_, M );

     T.X.o := Frac( T_.X );
     T.Y.o := Frac( T_.Y );

     T.d := TSingle2D.Create( 1, 0 );

     Result.X := BSplin4( M, T ).d;

     T.d := TSingle2D.Create( 0, 1 );

     Result.Y := BSplin4( M, T ).d;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
