unit LUX.Math.Special.Gamma.Lanczos;

interface //#################################################################### ■

uses LUX, LUX.D1, LUX.Math.Special;

//type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% {RECORD}

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% {CLASS}

const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

      _LC7g :Double = 5;
      _LC7s :array [ 0..7-1 ] of Double = (
           + 1.000000000190015    ,
           +76.18009172947146     ,
           -86.50532032941677     ,
           +24.01409824083091     ,
           - 1.231739572450155    ,
           + 0.1208650973866179e-2,
           - 0.5395239384953e-5    );

      _LC9g :Double = 7;
      _LC9s :array [ 0..9-1 ] of Double = (
           +   0.99999999999980993227684700473478,
           + 676.520368121885098567009190444019  ,
           -1259.13921672240287047156078755283   ,
           + 771.3234287776530788486528258894    ,
           - 176.61502916214059906584551354      ,
           +  12.507343278686904814458936853     ,
           -   0.13857109526572011689554707      ,
           +   9.984369578019570859563e-6        ,
           +   1.50563273514931155834e-7          );

      _LC11g :Double = 9;
      _LC11s :array [ 0..11-1 ] of Double = (
           +    1.000000000000000174663    ,
           + 5716.400188274341379136       ,
           -14815.30426768413909044        ,
           +14291.49277657478554025        ,
           - 6348.160217641458813289       ,
           + 1301.608286058321874105       ,
           -  108.1767053514369634679      ,
           +    2.605696505611755827729    ,
           -    0.7423452510201416151527e-2,
           +    0.5384136432509564062961e-7,
           -    0.4023533141268236372067e-8 );

      _LC15g :Double = 607/128;
      _LC15s :array [ 0..15-1 ] of Double = (
           + 0.99999999999999709182   ,
           +57.156235665862923517     ,
           -59.597960355475491248     ,
           +14.136097974741747174     ,
           - 0.49191381609762019978   ,
           + 0.33994649984811888699e-4,
           + 0.46523628927048575665e-4,
           - 0.98374475304879564677e-4,
           + 0.15808870322491248884e-3,
           - 0.21026444172410488319e-3,
           + 0.21743961811521264320e-3,
           - 0.16431810653676389022e-3,
           + 0.84418223983852743293e-4,
           - 0.26190838401581408670e-4,
           + 0.36899182659531622704e-5 );

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

// X_ > 0
function LnGammaP( X_:Single; const LCg_:Single; const LCs_:array of Single ) :Single; overload;
function LnGammaP( X_:Double; const LCg_:Double; const LCs_:array of Double ) :Double; overload;
function LnGammaP( X_:TdSingle; const LCg_:Single; const LCs_:array of Single ) :TdSingle; overload;
function LnGammaP( X_:TdDouble; const LCg_:Double; const LCs_:array of Double ) :TdDouble; overload;

function LnGammaP7( const X_:Single ) :Single; overload;
function LnGammaP7( const X_:Double ) :Double; overload;
function LnGammaP9( const X_:Single ) :Single; overload;
function LnGammaP9( const X_:Double ) :Double; overload;
function LnGammaP11( const X_:Single ) :Single; overload;
function LnGammaP11( const X_:Double ) :Double; overload;
function LnGammaP15( const X_:Single ) :Single; overload;
function LnGammaP15( const X_:Double ) :Double; overload;

// LnGamma > 0
function LnGamma( X_:Single; const LCg_:Single; const LCs_:array of Single ) :Single; overload;
function LnGamma( X_:Double; const LCg_:Double; const LCs_:array of Double ) :Double; overload;
function LnGamma( X_:TdSingle; const LCg_:Single; const LCs_:array of Single ) :TdSingle; overload;
function LnGamma( X_:TdDouble; const LCg_:Double; const LCs_:array of Double ) :TdDouble; overload;

function LnGamma7( const X_:Single ) :Single; overload;
function LnGamma7( const X_:Double ) :Double; overload;
function LnGamma9( const X_:Single ) :Single; overload;
function LnGamma9( const X_:Double ) :Double; overload;
function LnGamma11( const X_:Single ) :Single; overload;
function LnGamma11( const X_:Double ) :Double; overload;
function LnGamma15( const X_:Single ) :Single; overload;
function LnGamma15( const X_:Double ) :Double; overload;

// X_ > 0
function GammaP( const X_:Single; const LCg_:Single; const LCs_:array of Single ) :Single; overload;
function GammaP( const X_:Double; const LCg_:Double; const LCs_:array of Double ) :Double; overload;
function GammaP( const X_:TdSingle; const LCg_:Single; const LCs_:array of Single ) :TdSingle; overload;
function GammaP( const X_:TdDouble; const LCg_:Double; const LCs_:array of Double ) :TdDouble; overload;

function GammaP7( const X_:Single ) :Single; overload;
function GammaP7( const X_:Double ) :Double; overload;
function GammaP9( const X_:Single ) :Single; overload;
function GammaP9( const X_:Double ) :Double; overload;
function GammaP11( const X_:Single ) :Single; overload;
function GammaP11( const X_:Double ) :Double; overload;
function GammaP15( const X_:Single ) :Single; overload;
function GammaP15( const X_:Double ) :Double; overload;

function Gamma( const X_:Single; const LCg_:Single; const LCs_:array of Single ) :Single; overload;
function Gamma( const X_:Double; const LCg_:Double; const LCs_:array of Double ) :Double; overload;
function Gamma( const X_:TdSingle; const LCg_:Single; const LCs_:array of Single ) :TdSingle; overload;
function Gamma( const X_:TdDouble; const LCg_:Double; const LCs_:array of Double ) :TdDouble; overload;

function Gamma7( const X_:Single ) :Single; overload;
function Gamma7( const X_:Double ) :Double; overload;
function Gamma9( const X_:Single ) :Single; overload;
function Gamma9( const X_:Double ) :Double; overload;
function Gamma11( const X_:Single ) :Single; overload;
function Gamma11( const X_:Double ) :Double; overload;
function Gamma15( const X_:Single ) :Single; overload;
function Gamma15( const X_:Double ) :Double; overload;

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

function LnGammaP( X_:Single; const LCg_:Single; const LCs_:array of Single ) :Single;
const
     LR2P :Single = 0.91893853320467274178032973640561763986139747363778;  //= Ln( Pi2 ) / 2
var
   B, A :Single;
   I :Integer;
begin
     X_ := X_ - 1;

     A := LCs_[ 0 ];
     for I := 1 to High( LCs_ ) do A := A + LCs_[ I ] / ( X_ + I );

     B := X_ + LCg_ + 0.5;

     Result := LR2P + Ln( A ) - B + Ln( B ) * ( X_ + 0.5 );
end;

function LnGammaP( X_:Double; const LCg_:Double; const LCs_:array of Double ) :Double;
const
     LR2P :Double = 0.91893853320467274178032973640561763986139747363778;  //= Ln( Pi2 ) / 2
var
   B, A :Double;
   I :Integer;
begin
     X_ := X_ - 1;

     A := LCs_[ 0 ];
     for I := 1 to High( LCs_ ) do A := A + LCs_[ I ] / ( X_ + I );

     B := X_ + LCg_ + 0.5;

     Result := LR2P + Ln( A ) - B + Ln( B ) * ( X_ + 0.5 );
end;

function LnGammaP( X_:TdSingle; const LCg_:Single; const LCs_:array of Single ) :TdSingle;
const
     LR2P :Single = 0.91893853320467274178032973640561763986139747363778;  //= Ln( Pi2 ) / 2
var
   B, A :TdSingle;
   I :Integer;
begin
     X_ := X_ - 1;

     A := LCs_[ 0 ];
     for I := 1 to High( LCs_ ) do A := A + LCs_[ I ] / ( X_ + I );

     B := X_ + LCg_ + 0.5;

     Result := LR2P + Ln( A ) - B + Ln( B ) * ( X_ + 0.5 );
end;

function LnGammaP( X_:TdDouble; const LCg_:Double; const LCs_:array of Double ) :TdDouble;
const
     LR2P :Double = 0.91893853320467274178032973640561763986139747363778;  //= Ln( Pi2 ) / 2
var
   B, A :TdDouble;
   I :Integer;
begin
     X_ := X_ - 1;

     A := LCs_[ 0 ];
     for I := 1 to High( LCs_ ) do A := A + LCs_[ I ] / ( X_ + I );

     B := X_ + LCg_ + 0.5;

     Result := LR2P + Ln( A ) - B + Ln( B ) * ( X_ + 0.5 );
end;

//------------------------------------------------------------------------------

function LnGammaP7( const X_:Single ) :Single;
begin
     Result := LnGammaP( X_, _LC7g, _LC7s );
end;

function LnGammaP7( const X_:Double ) :Double;
begin
     Result := LnGammaP( X_, _LC7g, _LC7s );
end;

function LnGammaP9( const X_:Single ) :Single;
begin
     Result := LnGammaP( X_, _LC9g, _LC9s );
end;

function LnGammaP9( const X_:Double ) :Double;
begin
     Result := LnGammaP( X_, _LC9g, _LC9s );
end;

function LnGammaP11( const X_:Single ) :Single;
begin
     Result := LnGammaP( X_, _LC11g, _LC11s );
end;

function LnGammaP11( const X_:Double ) :Double;
begin
     Result := LnGammaP( X_, _LC11g, _LC11s );
end;

function LnGammaP15( const X_:Single ) :Single;
begin
     Result := LnGammaP( X_, _LC15g, _LC15s );
end;

function LnGammaP15( const X_:Double ) :Double;
begin
     Result := LnGammaP( X_, _LC15g, _LC15s );
end;

//------------------------------------------------------------------------------

function LnGamma( X_:Single; const LCg_:Single; const LCs_:array of Single ) :Single;
begin
     if X_ < 0.5 then Result := Ln( Pi / Sin( Pi * X_ ) ) - LnGammaP( 1.0 - X_, LCg_, LCs_ )
                 else Result :=                             LnGammaP(       X_, LCg_, LCs_ );
end;

function LnGamma( X_:Double; const LCg_:Double; const LCs_:array of Double ) :Double;
begin
     if X_ < 0.5 then Result := Ln( Pi / Sin( Pi * X_ ) ) - LnGammaP( 1.0 - X_, LCg_, LCs_ )
                 else Result :=                             LnGammaP(       X_, LCg_, LCs_ );
end;

function LnGamma( X_:TdSingle; const LCg_:Single; const LCs_:array of Single ) :TdSingle;
begin
     if X_ < 0.5 then Result := Ln( Pi / Sin( Pi * X_ ) ) - LnGammaP( 1.0 - X_, LCg_, LCs_ )
                 else Result :=                             LnGammaP(       X_, LCg_, LCs_ );
end;

function LnGamma( X_:TdDouble; const LCg_:Double; const LCs_:array of Double ) :TdDouble;
begin
     if X_ < 0.5 then Result := Ln( Pi / Sin( Pi * X_ ) ) - LnGammaP( 1.0 - X_, LCg_, LCs_ )
                 else Result :=                             LnGammaP(       X_, LCg_, LCs_ );
end;

//------------------------------------------------------------------------------

function LnGamma7( const X_:Single ) :Single;
begin
     Result := LnGamma( X_, _LC7g, _LC7s );
end;

function LnGamma7( const X_:Double ) :Double;
begin
     Result := LnGamma( X_, _LC7g, _LC7s );
end;

function LnGamma9( const X_:Single ) :Single;
begin
     Result := LnGamma( X_, _LC9g, _LC9s );
end;

function LnGamma9( const X_:Double ) :Double;
begin
     Result := LnGamma( X_, _LC9g, _LC9s );
end;

function LnGamma11( const X_:Single ) :Single;
begin
     Result := LnGamma( X_, _LC11g, _LC11s );
end;

function LnGamma11( const X_:Double ) :Double;
begin
     Result := LnGamma( X_, _LC11g, _LC11s );
end;

function LnGamma15( const X_:Single ) :Single;
begin
     Result := LnGamma( X_, _LC15g, _LC15s );
end;

function LnGamma15( const X_:Double ) :Double;
begin
     Result := LnGamma( X_, _LC15g, _LC15s );
end;

//------------------------------------------------------------------------------

function GammaP( const X_:Single; const LCg_:Single; const LCs_:array of Single ) :Single;
begin
     Result := Exp( LnGammaP( X_, LCg_, LCs_ ) );
end;

function GammaP( const X_:Double; const LCg_:Double; const LCs_:array of Double ) :Double;
begin
     Result := Exp( LnGammaP( X_, LCg_, LCs_ ) );
end;

function GammaP( const X_:TdSingle; const LCg_:Single; const LCs_:array of Single ) :TdSingle;
begin
     Result := Exp( LnGammaP( X_, LCg_, LCs_ ) );
end;

function GammaP( const X_:TdDouble; const LCg_:Double; const LCs_:array of Double ) :TdDouble;
begin
     Result := Exp( LnGammaP( X_, LCg_, LCs_ ) );
end;

//------------------------------------------------------------------------------

function GammaP7( const X_:Single ) :Single;
begin
     Result := GammaP( X_, _LC7g, _LC7s );
end;

function GammaP7( const X_:Double ) :Double;
begin
     Result := GammaP( X_, _LC7g, _LC7s );
end;

function GammaP9( const X_:Single ) :Single;
begin
     Result := GammaP( X_, _LC9g, _LC9s );
end;

function GammaP9( const X_:Double ) :Double;
begin
     Result := GammaP( X_, _LC9g, _LC9s );
end;

function GammaP11( const X_:Single ) :Single;
begin
     Result := GammaP( X_, _LC11g, _LC11s );
end;

function GammaP11( const X_:Double ) :Double;
begin
     Result := GammaP( X_, _LC11g, _LC11s );
end;

function GammaP15( const X_:Single ) :Single;
begin
     Result := GammaP( X_, _LC15g, _LC15s );
end;

function GammaP15( const X_:Double ) :Double;
begin
     Result := GammaP( X_, _LC15g, _LC15s );
end;

//------------------------------------------------------------------------------

function Gamma( const X_:Single; const LCg_:Single; const LCs_:array of Single ) :Single;
begin
     if X_ < 0.5 then Result := Pi / ( Sin( Pi * X_ ) * GammaP( 1.0 - X_, LCg_, LCs_ ) )
                 else Result :=                         GammaP(       X_, LCg_, LCs_ );
end;

function Gamma( const X_:Double; const LCg_:Double; const LCs_:array of Double ) :Double;
begin
     if X_ < 0.5 then Result := Pi / ( Sin( Pi * X_ ) * GammaP( 1.0 - X_, LCg_, LCs_ ) )
                 else Result :=                         GammaP(       X_, LCg_, LCs_ );
end;

function Gamma( const X_:TdSingle; const LCg_:Single; const LCs_:array of Single ) :TdSingle;
begin
     if X_ < 0.5 then Result := Pi / ( Sin( Pi * X_ ) * GammaP( 1.0 - X_, LCg_, LCs_ ) )
                 else Result :=                         GammaP(       X_, LCg_, LCs_ );
end;

function Gamma( const X_:TdDouble; const LCg_:Double; const LCs_:array of Double ) :TdDouble;
begin
     if X_ < 0.5 then Result := Pi / ( Sin( Pi * X_ ) * GammaP( 1.0 - X_, LCg_, LCs_ ) )
                 else Result :=                         GammaP(       X_, LCg_, LCs_ );
end;

//------------------------------------------------------------------------------

function Gamma7( const X_:Single ) :Single;
begin
     Result := Gamma( X_, _LC7g, _LC7s );
end;

function Gamma7( const X_:Double ) :Double;
begin
     Result := Gamma( X_, _LC7g, _LC7s );
end;

function Gamma9( const X_:Single ) :Single;
begin
     Result := Gamma( X_, _LC9g, _LC9s );
end;

function Gamma9( const X_:Double ) :Double;
begin
     Result := Gamma( X_, _LC9g, _LC9s );
end;

function Gamma11( const X_:Single ) :Single;
begin
     Result := Gamma( X_, _LC11g, _LC11s );
end;

function Gamma11( const X_:Double ) :Double;
begin
     Result := Gamma( X_, _LC11g, _LC11s );
end;

function Gamma15( const X_:Single ) :Single;
begin
     Result := Gamma( X_, _LC15g, _LC15s );
end;

function Gamma15( const X_:Double ) :Double;
begin
     Result := Gamma( X_, _LC15g, _LC15s );
end;

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■