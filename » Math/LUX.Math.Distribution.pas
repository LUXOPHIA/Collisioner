unit LUX.Math.Distribution;

interface //#################################################################### ■

uses LUX, LUX.D1;

//type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% {RECORD}

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% {CLASS}

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function DistT( const X_:Single; const N_:Cardinal ) :Single; overload;
function DistT( const X_:Double; const N_:Cardinal ) :Double; overload;
function DistT( const X_:TdSingle; const N_:Cardinal ) :TdSingle; overload;
function DistT( const X_:TdDouble; const N_:Cardinal ) :TdDouble; overload;

function CumDistT( const V_, X_:Single ) :Single; overload;
function CumDistT( const V_, X_:Double ) :Double; overload;
function CumDistT( const V_, X_:TdSingle ) :TdSingle; overload;
function CumDistT( const V_, X_:TdDouble ) :TdDouble; overload;

function InvCumDistT( const V_,P_:Single ) :Single; overload;
function InvCumDistT( const V_,P_:Double ) :Double; overload;

implementation //############################################################### ■

uses System.Math,
     LUX.Math.Special.Beta;

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

function DistT( const X_:Single; const N_:Cardinal ) :Single;
begin
     Result := Power( 1 + Pow2( X_ ) / N_, -( N_ + 1 ) / 2 )
             / ( Roo2( N_ ) * Beta( N_ / 2, 0.5 ) );
end;

function DistT( const X_:Double; const N_:Cardinal ) :Double;
begin
     Result := Power( 1 + Pow2( X_ ) / N_, -( N_ + 1 ) / 2 )
             / ( Roo2( N_ ) * Beta( N_ / 2, 0.5 ) );
end;

function DistT( const X_:TdSingle; const N_:Cardinal ) :TdSingle;
begin
     Result := Power( 1 + Pow2( X_ ) / N_, -( N_ + 1 ) / 2 )
             / ( Roo2( N_ ) * Beta( N_ / 2, 0.5 ) );
end;

function DistT( const X_:TdDouble; const N_:Cardinal ) :TdDouble;
begin
     Result := Power( 1 + Pow2( X_ ) / N_, -( N_ + 1 ) / 2 )
             / ( Roo2( N_ ) * Beta( N_ / 2, 0.5 ) );
end;

//------------------------------------------------------------------------------

function CumDistT( const V_, X_:Single ) :Single;
var
   V, A, X :Single;
begin
     V := V_ / 2;

     A := Roo2( Pow2( X_ ) + V_ );

     X := ( X_ + A ) / ( 2 * A );

     Result := RegIncBeta( X, V, V );
end;

function CumDistT( const V_, X_:Double ) :Double;
var
   V, A, X :Double;
begin
     V := V_ / 2;

     A := Roo2( Pow2( X_ ) + V_ );

     X := ( X_ + A ) / ( 2 * A );

     Result := RegIncBeta( X, V, V );
end;

function CumDistT( const V_, X_:TdSingle ) :TdSingle;
var
   V, A, X :TdSingle;
begin
     V := V_ / 2;

     A := Roo2( Pow2( X_ ) + V_ );

     X := ( X_ + A ) / ( 2 * A );

     Result := RegIncBeta( X, V, V );
end;

function CumDistT( const V_, X_:TdDouble ) :TdDouble;
var
   V, A, X :TdDouble;
begin
     V := V_ / 2;

     A := Roo2( Pow2( X_ ) + V_ );

     X := ( X_ + A ) / ( 2 * A );

     Result := RegIncBeta( X, V, V );
end;

//------------------------------------------------------------------------------

function InvCumDistT( const V_,P_:Single ) :Single;
var
   X, F :TdSingle;
   Xd :Single;
begin
     X := TdSingle.Create( 0, 1 );

     repeat
           F := CumDistT( V_, X );

           Xd := ( F.o - P_ ) / F.d;

           X.o := X.o - Xd;

     until Abs( Xd ) < SINGLE_EPS4;

     Result := X.o;
end;

function InvCumDistT( const V_,P_:Double ) :Double;
var
   X, F :TdDouble;
   Xd :Double;
begin
     X := TdDouble.Create( 0, 1 );

     repeat
           F := CumDistT( V_, X );

           Xd := ( F.o - P_ ) / F.d;

           X.o := X.o - Xd;

     until Abs( Xd ) < SINGLE_EPS4;

     Result := X.o;
end;

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■