unit LUX.Math.Special.Beta;

interface //#################################################################### ■

uses LUX, LUX.D1,
     LUX.Math.Special;

//type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% {RECORD}

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% {CLASS}

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function LnBeta( const X_,Y_:Single ) :Single; overload;
function LnBeta( const X_,Y_:Double ) :Double; overload;
function LnBeta( const X_,Y_:TdSingle ) :TdSingle; overload;
function LnBeta( const X_,Y_:TdDouble ) :TdDouble; overload;

function Beta( const X_,Y_:Single ) :Single; overload;
function Beta( const X_,Y_:Double ) :Double; overload;
function Beta( const X_,Y_:TdSingle ) :TdSingle; overload;
function Beta( const X_,Y_:TdDouble ) :TdDouble; overload;

function IncBeta( const X_,A_,B_:Single ) :Single; overload;
function IncBeta( const X_,A_,B_:Double ) :Double; overload;
function IncBeta( const X_,A_,B_:TdSingle ) :TdSingle; overload;
function IncBeta( const X_,A_,B_:TdDouble ) :TdDouble; overload;

function RegIncBeta( const X_,A_,B_:Single ) :Single; overload;
function RegIncBeta( const X_,A_,B_:Double ) :Double; overload;
function RegIncBeta( const X_,A_,B_:TdSingle ) :TdSingle; overload;
function RegIncBeta( const X_,A_,B_:TdDouble ) :TdDouble; overload;

implementation //############################################################### ■

uses System.Math,
     LUX.Math.Special.Gamma.Ooura;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% {RECORD}

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% {CLASS}

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function LnBeta( const X_,Y_:Single ) :Single;
begin
     Result := LnGammaP( X_ ) + LnGammaP( Y_ ) - LnGammaP( X_ + Y_ );
end;

function LnBeta( const X_,Y_:Double ) :Double;
begin
     Result := LnGammaP( X_ ) + LnGammaP( Y_ ) - LnGammaP( X_ + Y_ );
end;

function LnBeta( const X_,Y_:TdSingle ) :TdSingle;
begin
     Result := LnGammaP( X_ ) + LnGammaP( Y_ ) - LnGammaP( X_ + Y_ );
end;

function LnBeta( const X_,Y_:TdDouble ) :TdDouble;
begin
     Result := LnGammaP( X_ ) + LnGammaP( Y_ ) - LnGammaP( X_ + Y_ );
end;

//------------------------------------------------------------------------------

function Beta( const X_,Y_:Single ) :Single;
begin
     Result := Exp( LnBeta( X_, Y_ ) );
end;

function Beta( const X_,Y_:Double ) :Double;
begin
     Result := Exp( LnBeta( X_, Y_ ) );
end;

function Beta( const X_,Y_:TdSingle ) :TdSingle;
begin
     Result := Exp( LnBeta( X_, Y_ ) );
end;

function Beta( const X_,Y_:TdDouble ) :TdDouble;
begin
     Result := Exp( LnBeta( X_, Y_ ) );
end;

//------------------------------------------------------------------------------

//   Result := Power( X_, A_ ) / A_ * HypGeo21( A_, 1 - B_, A_ + 1, X_ );

function IncBeta( const X_,A_,B_:Single ) :Single;
begin
     Result := Power(     X_, A_ ) / A_
             * Power( 1 - X_, B_ ) * HypGeo21A( A_ + B_, A_ + 1, X_ );
end;

function IncBeta( const X_,A_,B_:Double ) :Double;
begin
     Result := Power(     X_, A_ ) / A_
             * Power( 1 - X_, B_ ) * HypGeo21A( A_ + B_, A_ + 1, X_ );
end;

function IncBeta( const X_,A_,B_:TdSingle ) :TdSingle;
begin
     Result := Power(     X_, A_ ) / A_
             * Power( 1 - X_, B_ ) * HypGeo21A( A_ + B_, A_ + 1, X_ );
end;

function IncBeta( const X_,A_,B_:TdDouble ) :TdDouble;
begin
     Result := Power(     X_, A_ ) / A_
             * Power( 1 - X_, B_ ) * HypGeo21A( A_ + B_, A_ + 1, X_ );
end;

{
///// 連分数展開①
function IncBeta( const X_,A_,B_:Double ) :Double;
var
   G0,     G2,
   C0, C1,
   P0, P1, P2,
   Q0, Q1, Q2, N2A :Double;
   N, N2 :Integer;
begin
     G2 := 0;

     C1 := -X_ * ( A_ + B_ ) / ( A_ + 1 );

     P0 := 0;  P1 := 1;  P2 := P1 + C1 * P0;
     Q0 := 1;  Q1 := 1;  Q2 := Q1 + C1 * Q0;

     for N := 1 to 10000 do
     begin
          G0 := G2;  G2 := P2 / Q2;

          if ( Abs( G2 - G0 ) < DOUBLE_EPS3 ) then Break;

          N2 := N shl 1;  N2A := N2 + A_;

          C0 := +X_ *        N   * (      B_ - N ) / ( N2A * ( N2A - 1 ) );
          C1 := -X_ * ( A_ + N ) * ( A_ + B_ + N ) / ( N2A * ( N2A + 1 ) );

          P0 := P1;  P1 := P2;  P2 := P1 + C0 * P0;
          Q0 := Q1;  Q1 := Q2;  Q2 := Q1 + C0 * Q0;

          P0 := P1;  P1 := P2;  P2 := P1 + C1 * P0;
          Q0 := Q1;  Q1 := Q2;  Q2 := Q1 + C1 * Q0;
     end;

     Result := Power(     X_, A_ ) / A_
             * Power( 1 - X_, B_ ) * G2;
end;
}
{
///// 連分数展開② http://ci.nii.ac.jp/naid/110006459103
function IncBeta( const X_,A_,B_:Double ) :Double;
var
   C0, C1,
   U0, U1, U2,
   V0, V1, V2,
   G0, G1, G2, N2A :Double;
   N, N2 :Integer;
begin
     C1 := -X_ * ( A_ + B_ ) / ( A_ + 1 );

     U1 := 2;  U2 := 1 + C1 / U1;
     V1 := 1;  V2 := 1 + C1 / V1;

     G0 := 1;  G1 := U1 / V1 * G0;  G2 := U2 / V2 * G1;

     for N := 1 to 10000 do
     begin
          if ( Abs( G2 - G0 ) < DOUBLE_EPS3 ) then Break;

          N2 := N shl 1;  N2A := N2 + A_;

          C0 := +X_ *        N   * (      B_ - N ) / ( N2A * ( N2A - 1 ) );
          C1 := -X_ * ( A_ + N ) * ( A_ + B_ + N ) / ( N2A * ( N2A + 1 ) );

          U0 := U2;  U1 := 1 + C0 / U0;  U2 := 1 + C1 / U1;
          V0 := V2;  V1 := 1 + C0 / V0;  V2 := 1 + C1 / V1;

          G0 := G2;  G1 := U1 / V1 * G0;  G2 := U2 / V2 * G1;
     end;

     Result := Power(     X_, A_ ) / A_
             * Power( 1 - X_, B_ ) * ( G2 - 1 );
end;
}

//------------------------------------------------------------------------------

function RegIncBeta( const X_,A_,B_:Single ) :Single;
begin
     Result := IncBeta( X_, A_, B_ ) / Beta( A_, B_ );
end;

function RegIncBeta( const X_,A_,B_:Double ) :Double;
begin
     Result := IncBeta( X_, A_, B_ ) / Beta( A_, B_ );
end;

function RegIncBeta( const X_,A_,B_:TdSingle ) :TdSingle;
begin
     Result := IncBeta( X_, A_, B_ ) / Beta( A_, B_ );
end;

function RegIncBeta( const X_,A_,B_:TdDouble ) :TdDouble;
begin
     Result := IncBeta( X_, A_, B_ ) / Beta( A_, B_ );
end;

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■