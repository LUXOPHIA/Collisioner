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

//   Result := Power(     X_, A_ ) / A_
//                                 * HypGeo21( A_, 1 - B_, A_ + 1, X_ );

function IncBeta( const X_,A_,B_:Single ) :Single;
begin
     Result := Power(     X_, A_ ) / A_
             * Power( 1 - X_, B_ ) * HypGeo21( 1, A_ + B_, A_ + 1, X_ );
end;

function IncBeta( const X_,A_,B_:Double ) :Double;
begin
     Result := Power(     X_, A_ ) / A_
             * Power( 1 - X_, B_ ) * HypGeo21( 1, A_ + B_, A_ + 1, X_ );
end;

function IncBeta( const X_,A_,B_:TdSingle ) :TdSingle;
begin
     Result := Power(     X_, A_ ) / A_
             * Power( 1 - X_, B_ ) * HypGeo21( 1, A_ + B_, A_ + 1, X_ );
end;

function IncBeta( const X_,A_,B_:TdDouble ) :TdDouble;
begin
     Result := Power(     X_, A_ ) / A_
             * Power( 1 - X_, B_ ) * HypGeo21( 1, A_ + B_, A_ + 1, X_ );
end;

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