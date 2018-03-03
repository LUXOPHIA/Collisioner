unit LUX.Math.Special;

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

function HypGeo21( const A_,B_,C_,X_:Single ) :Single; overload;
function HypGeo21( const A_,B_,C_,X_:Double ) :Double; overload;
function HypGeo21( const A_,B_,C_,X_:TdSingle ) :TdSingle; overload;
function HypGeo21( const A_,B_,C_,X_:TdDouble ) :TdDouble; overload;

///// HypGeo21A( B_, C_, X_ ) = HypGeo21( 1, B_, C_, X_ )
function HypGeo21A( const B_,C_,X_:Single ) :Single; overload;
function HypGeo21A( const B_,C_,X_:Double ) :Double; overload;
function HypGeo21A( const B_,C_,X_:TdSingle ) :TdSingle; overload;
function HypGeo21A( const B_,C_,X_:TdDouble ) :TdDouble; overload;

implementation //############################################################### ■

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

function HypGeo21( const A_,B_,C_,X_:Single ) :Single;
var
   P0, P1 :Single;
   N :Integer;
begin
     P0 := 1;

     Result := P0;

     for N := 0 to 10000 do
     begin
          P1 := ( ( A_ + N ) * ( B_ + N ) )
              / ( ( C_ + N ) * ( 1  + N ) ) * X_ * P0;

          Result := Result + P1;

          if Abs( P1 ) < SINGLE_EPS3 then Break;

          P0 := P1;
     end;
end;

function HypGeo21( const A_,B_,C_,X_:Double ) :Double;
var
   P0, P1 :Double;
   N :Integer;
begin
     P0 := 1;

     Result := P0;

     for N := 0 to 10000 do
     begin
          P1 := ( ( A_ + N ) * ( B_ + N ) )
              / ( ( C_ + N ) * ( 1  + N ) ) * X_ * P0;

          Result := Result + P1;

          if Abs( P1 ) < DOUBLE_EPS3 then Break;

          P0 := P1;
     end;
end;

function HypGeo21( const A_,B_,C_,X_:TdSingle ) :TdSingle;
var
   P0, P1 :TdSingle;
   N :Integer;
begin
     P0 := 1;

     Result := P0;

     for N := 0 to 10000 do
     begin
          P1 := ( ( A_ + N ) * ( B_ + N ) )
              / ( ( C_ + N ) * ( 1  + N ) ) * X_ * P0;

          Result := Result + P1;

          if Abs( P1.o ) < SINGLE_EPS3 then Break;

          P0 := P1;
     end;
end;

function HypGeo21( const A_,B_,C_,X_:TdDouble ) :TdDouble;
var
   P0, P1 :TdDouble;
   N :Integer;
begin
     P0 := 1;

     Result := P0;

     for N := 0 to 10000 do
     begin
          P1 := ( ( A_ + N ) * ( B_ + N ) )
              / ( ( C_ + N ) * ( 1  + N ) ) * X_ * P0;

          Result := Result + P1;

          if Abs( P1.o ) < DOUBLE_EPS3 then Break;

          P0 := P1;
     end;
end;

//------------------------------------------------------------------------------

function HypGeo21A( const B_,C_,X_:Single ) :Single;
var
   P0, P1 :Single;
   N :Integer;
begin
     P0 := 1;

     Result := P0;

     for N := 0 to 10000 do
     begin
          P1 := ( B_ + N ) / ( C_ + N ) * X_ * P0;

          Result := Result + P1;

          if Abs( P1 ) < DOUBLE_EPS3 then Break;

          P0 := P1;
     end;
end;

function HypGeo21A( const B_,C_,X_:Double ) :Double;
var
   P0, P1 :Double;
   N :Integer;
begin
     P0 := 1;

     Result := P0;

     for N := 0 to 10000 do
     begin
          P1 := ( B_ + N ) / ( C_ + N ) * X_ * P0;

          Result := Result + P1;

          if Abs( P1 ) < DOUBLE_EPS3 then Break;

          P0 := P1;
     end;
end;

function HypGeo21A( const B_,C_,X_:TdSingle ) :TdSingle;
var
   P0, P1 :TdSingle;
   N :Integer;
begin
     P0 := 1;

     Result := P0;

     for N := 0 to 10000 do
     begin
          P1 := ( B_ + N ) / ( C_ + N ) * X_ * P0;

          Result := Result + P1;

          if Abs( P1.o ) < DOUBLE_EPS3 then Break;

          P0 := P1;
     end;
end;

function HypGeo21A( const B_,C_,X_:TdDouble ) :TdDouble;
var
   P0, P1 :TdDouble;
   N :Integer;
begin
     P0 := 1;

     Result := P0;

     for N := 0 to 10000 do
     begin
          P1 := ( B_ + N ) / ( C_ + N ) * X_ * P0;

          Result := Result + P1;

          if Abs( P1.o ) < DOUBLE_EPS3 then Break;

          P0 := P1;
     end;
end;

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■