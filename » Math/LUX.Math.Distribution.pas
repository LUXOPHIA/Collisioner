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

function CumDistT( const X_:Single; const N_:Cardinal ) :Single; overload;
function CumDistT( const X_:Double; const N_:Cardinal ) :Double; overload;
function CumDistT( const X_:TdSingle; const N_:Cardinal ) :TdSingle; overload;
function CumDistT( const X_:TdDouble; const N_:Cardinal ) :TdDouble; overload;

function InvCumDistT( const P_:Single; const N_:Cardinal ) :Single; overload;
function InvCumDistT( const P_:Double; const N_:Cardinal ) :Double; overload;

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

function CumDistT( const X_:Single; const N_:Cardinal ) :Single;
var
   X2 :Single;
begin
     X2 := Pow2( X_ );

     if N_ < 2 * X2 then Result :=       RegIncBeta( N_ / ( X2 + N_ ), N_ / 2, 1  / 2 )   / 2
                    else Result := ( 1 - RegIncBeta( X2 / ( N_ + X2 ), 1  / 2, N_ / 2 ) ) / 2;

     if X_ > 0 then Result := 1 - Result;
end;

function CumDistT( const X_:Double; const N_:Cardinal ) :Double;
var
   X2 :Double;
begin
     X2 := Pow2( X_ );

     if N_ < 2 * X2 then Result :=       RegIncBeta( N_ / ( X2 + N_ ), N_ / 2, 1  / 2 )   / 2
                    else Result := ( 1 - RegIncBeta( X2 / ( N_ + X2 ), 1  / 2, N_ / 2 ) ) / 2;

     if X_ > 0 then Result := 1 - Result;
end;

function CumDistT( const X_:TdSingle; const N_:Cardinal ) :TdSingle;
begin
     with X_ do
     begin
          Result.o := CumDistT( o, N_ )    ;
          Result.d :=    DistT( o, N_ ) * d;
     end;
end;

function CumDistT( const X_:TdDouble; const N_:Cardinal ) :TdDouble;
begin
     with X_ do
     begin
          Result.o := CumDistT( o, N_ )    ;
          Result.d :=    DistT( o, N_ ) * d;
     end;
end;

//------------------------------------------------------------------------------

function InvCumDistT( const P_:Single; const N_:Cardinal ) :Single;
var
   X, P :TdSingle;
   Pd :Single;
begin
     X := TdSingle.Create( 0, 1 );

     repeat
           P := CumDistT( X, N_ );

           Pd := P.o - P_;

           X.o := X.o - Pd / P.d;

     until Abs( Pd ) < SINGLE_EPS3;

     Result := X.o;
end;

function InvCumDistT( const P_:Double; const N_:Cardinal ) :Double;
var
   X, P :TdDouble;
   Pd :Double;
begin
     X := TdDouble.Create( 0, 1 );

     repeat
           P := CumDistT( X, N_ );

           Pd := P.o - P_;

           X.o := X.o - Pd / P.d;

     until Abs( Pd ) < DOUBLE_EPS3;

     Result := X.o;
end;

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■