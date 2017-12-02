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

function DistT( const X_,V_:Single ) :Single; overload;
function DistT( const X_,V_:Double ) :Double; overload;
function DistT( const X_,V_:TdSingle ) :TdSingle; overload;
function DistT( const X_,V_:TdDouble ) :TdDouble; overload;

function Cum2DistT( const X_,V_:Single ) :Single; overload;
function Cum2DistT( const X_,V_:Double ) :Double; overload;

function CumDistT( const X_,V_:Single ) :Single; overload;
function CumDistT( const X_,V_:Double ) :Double; overload;
function CumDistT( const X_:TdSingle; const V_:Single ) :TdSingle; overload;
function CumDistT( const X_:TdDouble; const V_:Double ) :TdDouble; overload;

function InvCumDistT( const P_,V_:Single ) :Single; overload;
function InvCumDistT( const P_,V_:Double ) :Double; overload;

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

function DistT( const X_,V_:Single ) :Single;
begin
     Result := Power( 1 + Pow2( X_ ) / V_, -( V_ + 1 ) / 2 )
             / ( Roo2( V_ ) * Beta( V_ / 2, 0.5 ) );
end;

function DistT( const X_,V_:Double ) :Double;
begin
     Result := Power( 1 + Pow2( X_ ) / V_, -( V_ + 1 ) / 2 )
             / ( Roo2( V_ ) * Beta( V_ / 2, 0.5 ) );
end;

function DistT( const X_,V_:TdSingle ) :TdSingle;
begin
     Result := Power( 1 + Pow2( X_ ) / V_, -( V_ + 1 ) / 2 )
             / ( Roo2( V_ ) * Beta( V_ / 2, 0.5 ) );
end;

function DistT( const X_,V_:TdDouble ) :TdDouble;
begin
     Result := Power( 1 + Pow2( X_ ) / V_, -( V_ + 1 ) / 2 )
             / ( Roo2( V_ ) * Beta( V_ / 2, 0.5 ) );
end;

//------------------------------------------------------------------------------

//   RegIncBeta( x a, b ) = 1 - RegIncBeta( 1 - x b, a )

function Cum2DistT( const X_,V_:Single ) :Single;
var
   X2 :Double;
begin
     X2 := Pow2( X_ );

     if 100 * X2 < V_ then Result := 1 - RegIncBeta( X2 / ( X2 + V_ ), 1  / 2, V_ / 2 )
                      else Result :=     RegIncBeta( V_ / ( X2 + V_ ), V_ / 2, 1  / 2 );
end;

function Cum2DistT( const X_,V_:Double ) :Double;
var
   X2 :Double;
begin
     X2 := Pow2( X_ );

     if 100 * X2 < V_ then Result := 1 - RegIncBeta( X2 / ( X2 + V_ ), 1  / 2, V_ / 2 )
                      else Result :=     RegIncBeta( V_ / ( X2 + V_ ), V_ / 2, 1  / 2 );
end;

//------------------------------------------------------------------------------

//   Result := RegIncBeta( ( X_ + Roo2( X2 + V_ ) )
//                       / ( 2  * Roo2( X2 + V_ ) ), V_ / 2, V_ / 2 );

function CumDistT( const X_,V_:Single ) :Single;
var
   C :Double;
begin
     C := Cum2DistT( X_, V_ );

     if X_ < 0 then Result :=     C / 2
               else Result := 1 - C / 2;
end;

function CumDistT( const X_,V_:Double ) :Double;
var
   C :Double;
begin
     C := Cum2DistT( X_, V_ );

     if X_ < 0 then Result :=     C / 2
               else Result := 1 - C / 2;
end;

function CumDistT( const X_:TdSingle; const V_:Single ) :TdSingle;
begin
     with X_ do
     begin
          Result.o := CumDistT( o, V_ )    ;
          Result.d :=    DistT( o, V_ ) * d;
     end;
end;

function CumDistT( const X_:TdDouble; const V_:Double ) :TdDouble;
begin
     with X_ do
     begin
          Result.o := CumDistT( o, V_ )    ;
          Result.d :=    DistT( o, V_ ) * d;
     end;
end;

//------------------------------------------------------------------------------

function InvCumDistT( const P_,V_:Single ) :Single;
var
   X, P :TdSingle;
   Pd :Single;
begin
     X := TdSingle.Create( 0, 1 );

     repeat
           P := CumDistT( X, V_ );

           Pd := P.o - P_;

           X.o := X.o - Pd / P.d;

     until Abs( Pd ) < SINGLE_EPS3;

     Result := X.o;
end;

function InvCumDistT( const P_,V_:Double ) :Double;
var
   X, P :TdDouble;
   Pd :Double;
begin
     X := TdDouble.Create( 0, 1 );

     repeat
           P := CumDistT( X, V_ );

           Pd := P.o - P_;

           X.o := X.o - Pd / P.d;

     until Abs( Pd ) < DOUBLE_EPS3;

     Result := X.o;
end;

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■