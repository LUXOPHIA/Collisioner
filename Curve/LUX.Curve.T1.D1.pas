unit LUX.Curve.T1.D1;

interface //#################################################################### ■

uses LUX,
     LUX.D1,
     LUX.D2, LUX.M2,
     LUX.D3, LUX.M3,
     LUX.D4, LUX.M4,
     LUX.D5,
     LUX.DN;

//type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function Lerp( const P0_,P1_,T0_,T1_,T_:Single ) :Single; overload;
function Lerp( const P0_,P1_,T0_,T1_,T_:Double ) :Double; overload;
function Lerp( const P0_,P1_,T0_,T1_,T_:TdSingle ) :TdSingle; overload;
function Lerp( const P0_,P1_,T0_,T1_,T_:TdDouble ) :TdDouble; overload;

function Lerp( const P0_,P1_,T_:Single ) :Single; overload;
function Lerp( const P0_,P1_,T_:Double ) :Double; overload;
function Lerp( const P0_,P1_,T_:TdSingle ) :TdSingle; overload;
function Lerp( const P0_,P1_,T_:TdDouble ) :TdDouble; overload;

function CatmullRom( const P0_,P1_,P2_,P3_,T0_,T1_,T2_,T3_,T_:Single ) :Single; overload;
function CatmullRom( const P0_,P1_,P2_,P3_,T0_,T1_,T2_,T3_,T_:Double ) :Double; overload;
function CatmullRom( const P0_,P1_,P2_,P3_,T0_,T1_,T2_,T3_,T_:TdSingle ) :TdSingle; overload;
function CatmullRom( const P0_,P1_,P2_,P3_,T0_,T1_,T2_,T3_,T_:TdDouble ) :TdDouble; overload;

function CatmullRom( const P0_,P1_,P2_,P3_,T_:Single ) :Single; overload;
function CatmullRom( const P0_,P1_,P2_,P3_,T_:Double ) :Double; overload;
function CatmullRom( const P0_,P1_,P2_,P3_,T_:TdSingle ) :TdSingle; overload;
function CatmullRom( const P0_,P1_,P2_,P3_,T_:TdDouble ) :TdDouble; overload;
function CatmullRom( const P0_,P1_,P2_,P3_:Single; const T_:TdSingle ) :TdSingle; overload;
function CatmullRom( const P0_,P1_,P2_,P3_:Double; const T_:TdDouble ) :TdDouble; overload;

function BSpline( const T_:Single; const I0,N1:Integer; const Ts_:array of Single ) :Single; overload;
function BSpline( const T_:Double; const I0,N1:Integer; const Ts_:array of Double ) :Double; overload;
function BSpline( const T_:TdSingle; const I0,N1:Integer; const Ts_:array of TdSingle ) :TdSingle; overload;
function BSpline( const T_:TdDouble; const I0,N1:Integer; const Ts_:array of TdDouble ) :TdDouble; overload;

function BSplin4( const X_:Single ) :Single; overload;
function BSplin4( const X_:Double ) :Double; overload;
function BSplin4( const X_:TdSingle ) :TdSingle; overload;
function BSplin4( const X_:TdDouble ) :TdDouble; overload;

procedure BSplin4( const T_:Single; out Ws_:TSingle4D ); overload;
procedure BSplin4( const T_:Double; out Ws_:TDouble4D ); overload;
procedure BSplin4( const T_:TdSingle; out Ws_:TdSingle4D ); overload;
procedure BSplin4( const T_:TdDouble; out Ws_:TdDouble4D ); overload;

function BSplin4( const Ps_:TSingle4D; const T_:Single ) :Single; overload;
function BSplin4( const Ps_:TDouble4D; const T_:Double ) :Double; overload;
function BSplin4( const Ps_:TdSingle4D; const T_:TdSingle ) :TdSingle; overload;
function BSplin4( const Ps_:TdDouble4D; const T_:TdDouble ) :TdDouble; overload;

procedure Bezier4( const T_:Single; out Ws_:TSingle4D ); overload;
procedure Bezier4( const T_:Double; out Ws_:TDouble4D ); overload;
procedure Bezier4( const T_:TdSingle; out Ws_:TdSingle4D ); overload;
procedure Bezier4( const T_:TdDouble; out Ws_:TdDouble4D ); overload;

function Bezier4( const Ps_:TSingle4D; const T_:Single ) :Single; overload;
function Bezier4( const Ps_:TDouble4D; const T_:Double ) :Double; overload;
function Bezier4( const Ps_:TdSingle4D; const T_:TdSingle ) :TdSingle; overload;
function Bezier4( const Ps_:TdDouble4D; const T_:TdDouble ) :TdDouble; overload;

function Bezier( const T_:Single; const Cs_:TSingleND ) :Single; overload;
function Bezier( const T_:Double; const Cs_:TDoubleND ) :Double; overload;

function TrimBezier( const T0_,T1_:Single ) :TSingleM4; overload;
function TrimBezier( const T0_,T1_:Double ) :TDoubleM4; overload;

function Legendre( const X_:Single; const N_:Cardinal ) :Single; overload;
function Legendre( const X_:Double; const N_:Cardinal ) :Double; overload;

function Chebyshev1( const X_:Single; const N_:Cardinal ) :Single; overload;
function Chebyshev1( const X_:Double; const N_:Cardinal ) :Double; overload;

function SumLegendre( const X_:Single; const Ws_:array of Single ) :Single; overload;
function SumLegendre( const X_:Double; const Ws_:array of Double ) :Double; overload;

function SumChebyshev1( const X_:Single; const Ws_:array of Single ) :Single; overload;
function SumChebyshev1( const X_:Double; const Ws_:array of Double ) :Double; overload;

function Poly( const X_:Single; const Ks_:TSingle2D ) :Single; overload;
function Poly( const X_:Double; const Ks_:TDouble2D ) :Double; overload;

function Poly( const X_:Single; const Ks_:TSingle3D ) :Single; overload;
function Poly( const X_:Double; const Ks_:TDouble3D ) :Double; overload;

function Poly( const X_:Single; const Ks_:TSingle4D ) :Single; overload;
function Poly( const X_:Double; const Ks_:TDouble4D ) :Double; overload;

function Poly( const X_:Single; const Ks_:TSingle5D ) :Single; overload;
function Poly( const X_:Double; const Ks_:TDouble5D ) :Double; overload;

function Poly( const X_:Single; const Ks_:TSingleND ) :Single; overload;
function Poly( const X_:Double; const Ks_:TDoubleND ) :Double; overload;

function FitPoly( const P_:TSingle4D ) :TSingle4D; overload;
function FitPoly( const P_:TDouble4D ) :TDouble4D; overload;

function FitPoly( const P_:TSingle5D ) :TSingle5D; overload;
function FitPoly( const P_:TDouble5D ) :TDouble5D; overload;

procedure RandPoly( out Ks_:TSingle4D ); overload;
procedure RandPoly( out Ks_:TDouble4D ); overload;

procedure RandPoly( out Ks_:TSingle5D ); overload;
procedure RandPoly( out Ks_:TDouble5D ); overload;

function PolyToBezi( const P_:TSingleND ) :TSingleND; overload;
function PolyToBezi( const P_:TDoubleND ) :TDoubleND; overload;

function BeziToPoly( const P_:TSingleND ) :TSingleND; overload;
function BeziToPoly( const P_:TDoubleND ) :TDoubleND; overload;

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function Lerp( const P0_,P1_,T0_,T1_,T_:Single ) :Single;
begin
     Result := ( ( T1_ - T_ ) * P0_ + ( T_ - T0_ ) * P1_ ) / ( T1_ - T0_ );
end;

function Lerp( const P0_,P1_,T0_,T1_,T_:Double ) :Double;
begin
     Result := ( ( T1_ - T_ ) * P0_ + ( T_ - T0_ ) * P1_ ) / ( T1_ - T0_ );
end;

function Lerp( const P0_,P1_,T0_,T1_,T_:TdSingle ) :TdSingle;
begin
     Result := ( ( T1_ - T_ ) * P0_ + ( T_ - T0_ ) * P1_ ) / ( T1_ - T0_ );
end;

function Lerp( const P0_,P1_,T0_,T1_,T_:TdDouble ) :TdDouble;
begin
     Result := ( ( T1_ - T_ ) * P0_ + ( T_ - T0_ ) * P1_ ) / ( T1_ - T0_ );
end;

//------------------------------------------------------------------------------

function Lerp( const P0_,P1_,T_:Single ) :Single;
begin
     Result := ( P1_ - P0_ ) * T_ + P0_;
end;

function Lerp( const P0_,P1_,T_:Double ) :Double;
begin
     Result := ( P1_ - P0_ ) * T_ + P0_;
end;

function Lerp( const P0_,P1_,T_:TdSingle ) :TdSingle;
begin
     Result := ( P1_ - P0_ ) * T_ + P0_;
end;

function Lerp( const P0_,P1_,T_:TdDouble ) :TdDouble;
begin
     Result := ( P1_ - P0_ ) * T_ + P0_;
end;

//------------------------------------------------------------------------------

function CatmullRom( const P0_,P1_,P2_,P3_,T0_,T1_,T2_,T3_,T_:Single ) :Single;
var
   A01, A12, A23, B02, B13 :Single;
begin
     A01 := Lerp( P0_, P1_, T0_, T1_, T_ );
     A12 := Lerp( P1_, P2_, T1_, T2_, T_ );
     A23 := Lerp( P2_, P3_, T2_, T3_, T_ );

     B02 := Lerp( A01, A12, T0_, T2_, T_ );
     B13 := Lerp( A12, A23, T1_, T3_, T_ );

     Result := Lerp( B02, B13, T1_, T2_, T_ );
end;

function CatmullRom( const P0_,P1_,P2_,P3_,T0_,T1_,T2_,T3_,T_:Double ) :Double;
var
   A01, A12, A23, B02, B13 :Double;
begin
     A01 := Lerp( P0_, P1_, T0_, T1_, T_ );
     A12 := Lerp( P1_, P2_, T1_, T2_, T_ );
     A23 := Lerp( P2_, P3_, T2_, T3_, T_ );

     B02 := Lerp( A01, A12, T0_, T2_, T_ );
     B13 := Lerp( A12, A23, T1_, T3_, T_ );

     Result := Lerp( B02, B13, T1_, T2_, T_ );
end;

function CatmullRom( const P0_,P1_,P2_,P3_,T0_,T1_,T2_,T3_,T_:TdSingle ) :TdSingle;
var
   A01, A12, A23, B02, B13 :TdSingle;
begin
     A01 := Lerp( P0_, P1_, T0_, T1_, T_ );
     A12 := Lerp( P1_, P2_, T1_, T2_, T_ );
     A23 := Lerp( P2_, P3_, T2_, T3_, T_ );

     B02 := Lerp( A01, A12, T0_, T2_, T_ );
     B13 := Lerp( A12, A23, T1_, T3_, T_ );

     Result := Lerp( B02, B13, T1_, T2_, T_ );
end;

function CatmullRom( const P0_,P1_,P2_,P3_,T0_,T1_,T2_,T3_,T_:TdDouble ) :TdDouble;
var
   A01, A12, A23, B02, B13 :TdDouble;
begin
     A01 := Lerp( P0_, P1_, T0_, T1_, T_ );
     A12 := Lerp( P1_, P2_, T1_, T2_, T_ );
     A23 := Lerp( P2_, P3_, T2_, T3_, T_ );

     B02 := Lerp( A01, A12, T0_, T2_, T_ );
     B13 := Lerp( A12, A23, T1_, T3_, T_ );

     Result := Lerp( B02, B13, T1_, T2_, T_ );
end;

//------------------------------------------------------------------------------

function CatmullRom( const P0_,P1_,P2_,P3_,T_:Single ) :Single;
begin
     Result := ( ( ( -0.5 * P0_ + 1.5 * P1_ - 1.5 * P2_ + 0.5 * P3_ ) * T_
                   +        P0_ - 2.5 * P1_ + 2.0 * P2_ - 0.5 * P3_ ) * T_
                   -  0.5 * P0_             + 0.5 * P2_             ) * T_
                                +       P1_;
end;

function CatmullRom( const P0_,P1_,P2_,P3_,T_:Double ) :Double;
begin
     Result := ( ( ( -0.5 * P0_ + 1.5 * P1_ - 1.5 * P2_ + 0.5 * P3_ ) * T_
                   +        P0_ - 2.5 * P1_ + 2.0 * P2_ - 0.5 * P3_ ) * T_
                   -  0.5 * P0_             + 0.5 * P2_             ) * T_
                                +       P1_;
end;

function CatmullRom( const P0_,P1_,P2_,P3_,T_:TdSingle ) :TdSingle;
begin
     Result := ( ( ( -0.5 * P0_ + 1.5 * P1_ - 1.5 * P2_ + 0.5 * P3_ ) * T_
                   +        P0_ - 2.5 * P1_ + 2.0 * P2_ - 0.5 * P3_ ) * T_
                   -  0.5 * P0_             + 0.5 * P2_             ) * T_
                                +       P1_;
end;

function CatmullRom( const P0_,P1_,P2_,P3_,T_:TdDouble ) :TdDouble;
begin
     Result := ( ( ( -0.5 * P0_ + 1.5 * P1_ - 1.5 * P2_ + 0.5 * P3_ ) * T_
                   +        P0_ - 2.5 * P1_ + 2.0 * P2_ - 0.5 * P3_ ) * T_
                   -  0.5 * P0_             + 0.5 * P2_             ) * T_
                                +       P1_;
end;

function CatmullRom( const P0_,P1_,P2_,P3_:Single; const T_:TdSingle ) :TdSingle;
begin
     Result.o := CatmullRom( P0_, P1_, P2_, P3_, T_.o );

     Result.d := ( ( ( -1.5 * P0_ + 4.5 * P1_ - 4.5 * P2_ + 1.5 * P3_ ) * T_.o
                     +  2.0 * P0_ - 5.0 * P1_ + 4.0 * P2_ -       P3_ ) * T_.o
                     -  0.5 * P0_             + 0.5 * P2_             ) * T_.d;
end;

function CatmullRom( const P0_,P1_,P2_,P3_:Double; const T_:TdDouble ) :TdDouble;
begin
     Result.o := CatmullRom( P0_, P1_, P2_, P3_, T_.o );

     Result.d := ( ( ( -1.5 * P0_ + 4.5 * P1_ - 4.5 * P2_ + 1.5 * P3_ ) * T_.o
                     +  2.0 * P0_ - 5.0 * P1_ + 4.0 * P2_ -       P3_ ) * T_.o
                     -  0.5 * P0_             + 0.5 * P2_             ) * T_.d;
end;

//------------------------------------------------------------------------------

function BSpline( const T_:Single; const I0,N1:Integer; const Ts_:array of Single ) :Single;
var
   I1, N0 :Integer;
   T0, T1, T2, T3 :Single;
begin
     I1 := I0 + 1;

     T0 := Ts_[ I0      ];
     T2 := Ts_[ I0 + N1 ];
     T1 := Ts_[ I1      ];
     T3 := Ts_[ I1 + N1 ];

     if N1 = 1 then
     begin
          {    I0      I1
             ━╋━━━╋━━━╋━
               T0      T2
               ├─N1─┤
                       T1      T3
                       ├─N1─┤    }

          if ( T_ < T0 ) or ( T3 < T_ ) then Result := 0
          else
          begin
               if T_ < T2 then Result := ( T_ - T0 ) / ( T2 - T0 )
                          else
               if T_ > T1 then Result := ( T3 - T_ ) / ( T3 - T1 )
                          else Result := 1;
          end;
     end
     else
     begin
          {    I0      I1
             ━╋━━━╋━━━╋━━━╋━━━╋━
               T0                      T2
               ├─────N1─────┤
                       T1                      T3
                       ├─────N1─────┤    }

          N0 := N1 - 1;

          Result := 0;

          if T2 > T0 then Result := Result + ( T_ - T0 ) / ( T2 - T0 ) * BSpline( T_, I0, N0, Ts_ );
          if T3 > T1 then Result := Result + ( T3 - T_ ) / ( T3 - T1 ) * BSpline( T_, I1, N0, Ts_ );
     end;
end;

function BSpline( const T_:Double; const I0,N1:Integer; const Ts_:array of Double ) :Double;
var
   I1, N0 :Integer;
   T0, T1, T2, T3 :Double;
begin
     I1 := I0 + 1;

     T0 := Ts_[ I0      ];
     T2 := Ts_[ I0 + N1 ];
     T1 := Ts_[ I1      ];
     T3 := Ts_[ I1 + N1 ];

     if N1 = 1 then
     begin
          {    I0      I1
             ━╋━━━╋━━━╋━
               T0      T2
               ├─N1─┤
                       T1      T3
                       ├─N1─┤    }

          if ( T_ < T0 ) or ( T3 < T_ ) then Result := 0
          else
          begin
               if T_ < T2 then Result := ( T_ - T0 ) / ( T2 - T0 )
                          else
               if T_ > T1 then Result := ( T3 - T_ ) / ( T3 - T1 )
                          else Result := 1;
          end;
     end
     else
     begin
          {    I0      I1
             ━╋━━━╋━━━╋━━━╋━━━╋━
               T0                      T2
               ├─────N1─────┤
                       T1                      T3
                       ├─────N1─────┤    }

          N0 := N1 - 1;

          Result := 0;

          if T2 > T0 then Result := Result + ( T_ - T0 ) / ( T2 - T0 ) * BSpline( T_, I0, N0, Ts_ );
          if T3 > T1 then Result := Result + ( T3 - T_ ) / ( T3 - T1 ) * BSpline( T_, I1, N0, Ts_ );
     end;
end;

function BSpline( const T_:TdSingle; const I0,N1:Integer; const Ts_:array of TdSingle ) :TdSingle;
var
   I1, N0 :Integer;
   T0, T1, T2, T3 :TdSingle;
begin
     I1 := I0 + 1;

     T0 := Ts_[ I0      ];
     T2 := Ts_[ I0 + N1 ];
     T1 := Ts_[ I1      ];
     T3 := Ts_[ I1 + N1 ];

     if N1 = 1 then
     begin
          {    I0      I1
             ━╋━━━╋━━━╋━
               T0      T2
               ├─N1─┤
                       T1      T3
                       ├─N1─┤    }

          if ( T_ < T0 ) or ( T3 < T_ ) then Result := 0
          else
          begin
               if T_ < T2 then Result := ( T_ - T0 ) / ( T2 - T0 )
                          else
               if T_ > T1 then Result := ( T3 - T_ ) / ( T3 - T1 )
                          else Result := 1;
          end;
     end
     else
     begin
          {    I0      I1
             ━╋━━━╋━━━╋━━━╋━━━╋━
               T0                      T2
               ├─────N1─────┤
                       T1                      T3
                       ├─────N1─────┤    }

          N0 := N1 - 1;

          Result := 0;

          if T2 > T0 then Result := Result + ( T_ - T0 ) / ( T2 - T0 ) * BSpline( T_, I0, N0, Ts_ );
          if T3 > T1 then Result := Result + ( T3 - T_ ) / ( T3 - T1 ) * BSpline( T_, I1, N0, Ts_ );
     end;
end;

function BSpline( const T_:TdDouble; const I0,N1:Integer; const Ts_:array of TdDouble ) :TdDouble;
var
   I1, N0 :Integer;
   T0, T1, T2, T3 :TdDouble;
begin
     I1 := I0 + 1;

     T0 := Ts_[ I0      ];
     T2 := Ts_[ I0 + N1 ];
     T1 := Ts_[ I1      ];
     T3 := Ts_[ I1 + N1 ];

     if N1 = 1 then
     begin
          {    I0      I1
             ━╋━━━╋━━━╋━
               T0      T2
               ├─N1─┤
                       T1      T3
                       ├─N1─┤    }

          if ( T_ < T0 ) or ( T3 < T_ ) then Result := 0
          else
          begin
               if T_ < T2 then Result := ( T_ - T0 ) / ( T2 - T0 )
                          else
               if T_ > T1 then Result := ( T3 - T_ ) / ( T3 - T1 )
                          else Result := 1;
          end;
     end
     else
     begin
          {    I0      I1
             ━╋━━━╋━━━╋━━━╋━━━╋━
               T0                      T2
               ├─────N1─────┤
                       T1                      T3
                       ├─────N1─────┤    }

          N0 := N1 - 1;

          Result := 0;

          if T2 > T0 then Result := Result + ( T_ - T0 ) / ( T2 - T0 ) * BSpline( T_, I0, N0, Ts_ );
          if T3 > T1 then Result := Result + ( T3 - T_ ) / ( T3 - T1 ) * BSpline( T_, I1, N0, Ts_ );
     end;
end;

//------------------------------------------------------------------------------

function BSplin4( const X_:Single ) :Single;
const
     A :Single = 1/6;
     B :Single = 4/3;
     C :Single = 2/3;
var
   X :Single;
begin
     X := Abs( X_ );

     if X < 1 then Result := ( 0.5 * X - 1 ) * X * X + C
              else
     if X < 2 then Result := ( ( 1 - A * X ) * X - 2 ) * X + B
              else Result := 0;
end;

function BSplin4( const X_:Double ) :Double;
const
     A :Double = 1/6;
     B :Double = 4/3;
     C :Double = 2/3;
var
   X :Double;
begin
     X := Abs( X_ );

     if X < 1 then Result := ( 0.5 * X - 1 ) * X * X + C
              else
     if X < 2 then Result := ( ( 1 - A * X ) * X - 2 ) * X + B
              else Result := 0;
end;

function BSplin4( const X_:TdSingle ) :TdSingle;
const
     A :TdSingle = ( o:1/6; d:0 );
     B :TdSingle = ( o:4/3; d:0 );
     C :TdSingle = ( o:2/3; d:0 );
var
   X :TdSingle;
begin
     X := Abso( X_ );

     if X < 1 then Result := ( X / 2 - 1 ) * X * X + C
              else
     if X < 2 then Result := ( ( 1 - A * X ) * X - 2 ) * X + B
              else Result := 0;
end;

function BSplin4( const X_:TdDouble ) :TdDouble;
const
     A :TdDouble = ( o:1/6; d:0 );
     B :TdDouble = ( o:4/3; d:0 );
     C :TdDouble = ( o:2/3; d:0 );
var
   X :TdDouble;
begin
     X := Abso( X_ );

     if X < 1 then Result := ( X / 2 - 1 ) * X * X + C
              else
     if X < 2 then Result := ( ( 1 - A * X ) * X - 2 ) * X + B
              else Result := 0;
end;

//------------------------------------------------------------------------------

procedure BSplin4( const T_:Single; out Ws_:TSingle4D );
begin
     with Ws_ do
     begin
          _1 := BSplin4( T_ + 1 );
          _2 := BSplin4( T_     );
          _3 := BSplin4( T_ - 1 );
          _4 := BSplin4( T_ - 2 );
     end;
end;

procedure BSplin4( const T_:Double; out Ws_:TDouble4D );
begin
     with Ws_ do
     begin
          _1 := BSplin4( T_ + 1 );
          _2 := BSplin4( T_     );
          _3 := BSplin4( T_ - 1 );
          _4 := BSplin4( T_ - 2 );
     end;
end;

procedure BSplin4( const T_:TdSingle; out Ws_:TdSingle4D );
begin
     with Ws_ do
     begin
          _1 := BSplin4( T_ + 1 );
          _2 := BSplin4( T_     );
          _3 := BSplin4( T_ - 1 );
          _4 := BSplin4( T_ - 2 );
     end;
end;

procedure BSplin4( const T_:TdDouble; out Ws_:TdDouble4D );
begin
     with Ws_ do
     begin
          _1 := BSplin4( T_ + 1 );
          _2 := BSplin4( T_     );
          _3 := BSplin4( T_ - 1 );
          _4 := BSplin4( T_ - 2 );
     end;
end;

//------------------------------------------------------------------------------

function BSplin4( const Ps_:TSingle4D; const T_:Single ) :Single;
var
   Ws :TSingle4D;
begin
     BSplin4( T_, Ws );

     Result := Ws._1 * Ps_._1
             + Ws._2 * Ps_._2
             + Ws._3 * Ps_._3
             + Ws._4 * Ps_._4;
end;

function BSplin4( const Ps_:TDouble4D; const T_:Double ) :Double;
var
   Ws :TDouble4D;
begin
     BSplin4( T_, Ws );

     Result := Ws._1 * Ps_._1
             + Ws._2 * Ps_._2
             + Ws._3 * Ps_._3
             + Ws._4 * Ps_._4;
end;

function BSplin4( const Ps_:TdSingle4D; const T_:TdSingle ) :TdSingle;
var
   Ws :TdSingle4D;
begin
     BSplin4( T_, Ws );

     Result := Ws._1 * Ps_._1
             + Ws._2 * Ps_._2
             + Ws._3 * Ps_._3
             + Ws._4 * Ps_._4;
end;

function BSplin4( const Ps_:TdDouble4D; const T_:TdDouble ) :TdDouble;
var
   Ws :TdDouble4D;
begin
     BSplin4( T_, Ws );

     Result := Ws._1 * Ps_._1
             + Ws._2 * Ps_._2
             + Ws._3 * Ps_._3
             + Ws._4 * Ps_._4;
end;

//------------------------------------------------------------------------------

procedure Bezier4( const T_:Single; out Ws_:TSingle4D );
var
   T1, T2, T3,
   S1, S2, S3 :Single;
begin
     T1 :=      T_;  S1 := 1  - T_;
     T2 := T1 * T1;  S2 := S1 * S1;
     T3 := T1 * T2;  S3 := S1 * S2;

     with Ws_ do
     begin
          _1 :=          S3;
          _2 := 3 * T1 * S2;
          _3 := 3 * T2 * S1;
          _4 :=     T3     ;
     end;
end;

procedure Bezier4( const T_:Double; out Ws_:TDouble4D );
var
   T1, T2, T3,
   S1, S2, S3 :Double;
begin
     T1 :=      T_;  S1 := 1  - T_;
     T2 := T1 * T1;  S2 := S1 * S1;
     T3 := T1 * T2;  S3 := S1 * S2;

     with Ws_ do
     begin
          _1 :=          S3;
          _2 := 3 * T1 * S2;
          _3 := 3 * T2 * S1;
          _4 :=     T3     ;
     end;
end;

procedure Bezier4( const T_:TdSingle; out Ws_:TdSingle4D );
var
   T1, T2, T3,
   S1, S2, S3 :TdSingle;
begin
     T1 :=      T_;  S1 := 1  - T_;
     T2 := T1 * T1;  S2 := S1 * S1;
     T3 := T1 * T2;  S3 := S1 * S2;

     with Ws_ do
     begin
          _1 :=          S3;
          _2 := 3 * T1 * S2;
          _3 := 3 * T2 * S1;
          _4 :=     T3     ;
     end;
end;

procedure Bezier4( const T_:TdDouble; out Ws_:TdDouble4D );
var
   T1, T2, T3,
   S1, S2, S3 :TdDouble;
begin
     T1 :=      T_;  S1 := 1  - T_;
     T2 := T1 * T1;  S2 := S1 * S1;
     T3 := T1 * T2;  S3 := S1 * S2;

     with Ws_ do
     begin
          _1 :=          S3;
          _2 := 3 * T1 * S2;
          _3 := 3 * T2 * S1;
          _4 :=     T3     ;
     end;
end;

//------------------------------------------------------------------------------

function Bezier4( const Ps_:TSingle4D; const T_:Single ) :Single;
var
   Ws :TSingle4D;
begin
     Bezier4( T_, Ws );

     with Ws do Result := _1 * Ps_._1
                        + _2 * Ps_._2
                        + _3 * Ps_._3
                        + _4 * Ps_._4;
end;

function Bezier4( const Ps_:TDouble4D; const T_:Double ) :Double;
var
   Ws :TDouble4D;
begin
     Bezier4( T_, Ws );

     with Ws do Result := _1 * Ps_._1
                        + _2 * Ps_._2
                        + _3 * Ps_._3
                        + _4 * Ps_._4;
end;

function Bezier4( const Ps_:TdSingle4D; const T_:TdSingle ) :TdSingle;
var
   Ws :TdSingle4D;
begin
     Bezier4( T_, Ws );

     with Ws do Result := _1 * Ps_._1
                        + _2 * Ps_._2
                        + _3 * Ps_._3
                        + _4 * Ps_._4;
end;

function Bezier4( const Ps_:TdDouble4D; const T_:TdDouble ) :TdDouble;
var
   Ws :TdDouble4D;
begin
     Bezier4( T_, Ws );

     with Ws do Result := _1 * Ps_._1
                        + _2 * Ps_._2
                        + _3 * Ps_._3
                        + _4 * Ps_._4;
end;

//------------------------------------------------------------------------------

function Bezier( const T_:Single; const Cs_:TSingleND ) :Single;
var
   Cs :TArray<Single>;
   N, I :Integer;
begin
     Cs := Copy( Cs_._s );

     for N := High( Cs ) downto 1 do
     begin
          for I := 0 to N-1 do Cs[ I ] := Lerp( Cs[ I ], Cs[ I+1 ], T_ );
     end;

     Result := Cs[ 0 ];
end;

function Bezier( const T_:Double; const Cs_:TDoubleND ) :Double;
var
   Cs :TArray<Double>;
   N, I :Integer;
begin
     Cs := Copy( Cs_._s );

     for N := High( Cs ) downto 1 do
     begin
          for I := 0 to N-1 do Cs[ I ] := Lerp( Cs[ I ], Cs[ I+1 ], T_ );
     end;

     Result := Cs[ 0 ];
end;

//------------------------------------------------------------------------------

function TrimBezier( const T0_,T1_:Single ) :TSingleM4;
var
   Td1, Td2, Td3, Tb1, Tb2, Tb3,
   Sd1, Sd2, Sd3, Sb1, Sb2, Sb3,
   W1, W2 :Single;
begin
     Td1 :=     T0_;  Td2 := Td1 * Td1;  Td3 := Td1 * Td2;
     Tb1 := 1 - T0_;  Tb2 := Tb1 * Tb1;  Tb3 := Tb1 * Tb2;
     Sd1 :=     T1_;  Sd2 := Sd1 * Sd1;  Sd3 := Sd1 * Sd2;
     Sb1 := 1 - T1_;  Sb2 := Sb1 * Sb1;  Sb3 := Sb1 * Sb2;

     W1 := T1_ - T0_;  W2 := 2 * W1;

     with Result do
     begin
          _11 := Tb3      ;  _12 :=   3 * Td1 * Tb1        * Tb1;  _13 :=   3 * Td1 * Tb1        * Td1;  _14 := Td3      ;
          _21 := Tb2 * Sb1;  _22 := ( 3 * Td1 * Sb1 + W1 ) * Tb1;  _23 := ( 3 * Td1 * Sb1 + W2 ) * Td1;  _24 := Td2 * Sd1;
          _31 := Tb1 * Sb2;  _32 := ( 3 * Td1 * Sb1 + W2 ) * Sb1;  _33 := ( 3 * Td1 * Sb1 + W1 ) * Sd1;  _34 := Td1 * Sd2;
          _41 :=       Sb3;  _42 :=   3 * Sd1 * Sb1        * Sb1;  _43 :=   3 * Sd1 * Sb1        * Sd1;  _44 :=       Sd3;
     end;
end;

function TrimBezier( const T0_,T1_:Double ) :TDoubleM4;
var
   Td1, Td2, Td3, Tb1, Tb2, Tb3,
   Sd1, Sd2, Sd3, Sb1, Sb2, Sb3,
   W1, W2 :Double;
begin
     Td1 :=     T0_;  Td2 := Td1 * Td1;  Td3 := Td1 * Td2;
     Tb1 := 1 - T0_;  Tb2 := Tb1 * Tb1;  Tb3 := Tb1 * Tb2;
     Sd1 :=     T1_;  Sd2 := Sd1 * Sd1;  Sd3 := Sd1 * Sd2;
     Sb1 := 1 - T1_;  Sb2 := Sb1 * Sb1;  Sb3 := Sb1 * Sb2;

     W1 := T1_ - T0_;  W2 := 2 * W1;

     with Result do
     begin
          _11 := Tb3      ;  _12 :=   3 * Td1 * Tb1        * Tb1;  _13 :=   3 * Td1 * Tb1        * Td1;  _14 := Td3      ;
          _21 := Tb2 * Sb1;  _22 := ( 3 * Td1 * Sb1 + W1 ) * Tb1;  _23 := ( 3 * Td1 * Sb1 + W2 ) * Td1;  _24 := Td2 * Sd1;
          _31 := Tb1 * Sb2;  _32 := ( 3 * Td1 * Sb1 + W2 ) * Sb1;  _33 := ( 3 * Td1 * Sb1 + W1 ) * Sd1;  _34 := Td1 * Sd2;
          _41 :=       Sb3;  _42 :=   3 * Sd1 * Sb1        * Sb1;  _43 :=   3 * Sd1 * Sb1        * Sd1;  _44 :=       Sd3;
     end;
end;

//------------------------------------------------------------------------------

function Legendre( const X_:Single; const N_:Cardinal ) :Single;
var
   I :Cardinal;
   P0, P1, P2 :Single;
begin
     if N_ = 0 then Result := 1
     else
     begin
          P1 := 1 ;
          P2 := X_;
          for I := 2 to N_ do
          begin
               P0 := P1;  P1 := P2;

               P2 := ( ( 2 * I - 1 ) * X_ * P1 - ( I - 1 ) * P0 ) / I;
          end;

          Result := P2;
     end;
end;

function Legendre( const X_:Double; const N_:Cardinal ) :Double;
var
   I :Cardinal;
   P0, P1, P2 :Double;
begin
     if N_ = 0 then Result := 1
     else
     begin
          P1 := 1 ;
          P2 := X_;
          for I := 2 to N_ do
          begin
               P0 := P1;  P1 := P2;

               P2 := ( ( 2 * I - 1 ) * X_ * P1 - ( I - 1 ) * P0 ) / I;
          end;

          Result := P2;
     end;
end;

//------------------------------------------------------------------------------

function Chebyshev1( const X_:Single; const N_:Cardinal ) :Single;
var
   I :Cardinal;
   T0, T1, T2 :Single;
begin
     if N_ = 0 then Result := 1
     else
     begin
          T1 := 1 ;
          T2 := X_;
          for I := 2 to N_ do
          begin
               T0 := T1;  T1 := T2;

               T2 := 2 * X_ * T1 - T0;
          end;

          Result := T2;
     end;
end;

function Chebyshev1( const X_:Double; const N_:Cardinal ) :Double;
var
   I :Cardinal;
   T0, T1, T2 :Double;
begin
     if N_ = 0 then Result := 1
     else
     begin
          T1 := 1 ;
          T2 := X_;
          for I := 2 to N_ do
          begin
               T0 := T1;  T1 := T2;

               T2 := 2 * X_ * T1 - T0;
          end;

          Result := T2;
     end;
end;

//------------------------------------------------------------------------------

function SumLegendre( const X_:Single; const Ws_:array of Single ) :Single;
var
   H, I :Integer;
   P0, P1, P2 :Single;
begin
     Result := Ws_[ 0 ];

     H := High( Ws_ );

     if H > 0 then
     begin
          P1 := 1 ;
          P2 := X_;

          Result := Result + Ws_[ 1 ] * P2;

          for I := 2 to H do
          begin
               P0 := P1;  P1 := P2;

               P2 := ( ( 2 * I - 1 ) * X_ * P1 - ( I - 1 ) * P0 ) / I;

               Result := Result + Ws_[ I ] * P2;
          end;
     end;
end;

function SumLegendre( const X_:Double; const Ws_:array of Double ) :Double;
var
   H, I :Integer;
   P0, P1, P2 :Double;
begin
     Result := Ws_[ 0 ];

     H := High( Ws_ );

     if H > 0 then
     begin
          P1 := 1 ;
          P2 := X_;

          Result := Result + Ws_[ 1 ] * P2;

          for I := 2 to H do
          begin
               P0 := P1;  P1 := P2;

               P2 := ( ( 2 * I - 1 ) * X_ * P1 - ( I - 1 ) * P0 ) / I;

               Result := Result + Ws_[ I ] * P2;
          end;
     end;
end;

//------------------------------------------------------------------------------

function SumChebyshev1( const X_:Single; const Ws_:array of Single ) :Single;
var
   H, I :Integer;
   P0, P1, P2 :Single;
begin
     Result := Ws_[ 0 ];

     H := High( Ws_ );

     if H > 0 then
     begin
          P1 := 1 ;
          P2 := X_;

          Result := Result + Ws_[ 1 ] * P2;

          for I := 2 to H do
          begin
               P0 := P1;  P1 := P2;

               P2 := 2 * X_ * P1 - P0;

               Result := Result + Ws_[ I ] * P2;
          end;
     end;
end;

function SumChebyshev1( const X_:Double; const Ws_:array of Double ) :Double;
var
   H, I :Integer;
   P0, P1, P2 :Double;
begin
     Result := Ws_[ 0 ];

     H := High( Ws_ );

     if H > 0 then
     begin
          P1 := 1 ;
          P2 := X_;

          Result := Result + Ws_[ 1 ] * P2;

          for I := 2 to H do
          begin
               P0 := P1;  P1 := P2;

               P2 := 2 * X_ * P1 - P0;

               Result := Result + Ws_[ I ] * P2;
          end;
     end;
end;

//------------------------------------------------------------------------------

function Poly( const X_:Single; const Ks_:TSingle2D ) :Single;
begin
     with Ks_ do Result := _2 * X_ + _1;
end;

function Poly( const X_:Double; const Ks_:TDouble2D ) :Double;
begin
     with Ks_ do Result := _2 * X_ + _1;
end;

//------------------------------------------------------------------------------

function Poly( const X_:Single; const Ks_:TSingle3D ) :Single;
begin
     with Ks_ do Result := ( _3 * X_ + _2 ) * X_ + _1;
end;

function Poly( const X_:Double; const Ks_:TDouble3D ) :Double;
begin
     with Ks_ do Result := ( _3 * X_ + _2 ) * X_ + _1;
end;

//------------------------------------------------------------------------------

function Poly( const X_:Single; const Ks_:TSingle4D ) :Single;
begin
     with Ks_ do Result := ( ( _4 * X_ + _3 ) * X_ + _2 ) * X_ + _1;
end;

function Poly( const X_:Double; const Ks_:TDouble4D ) :Double;
begin
     with Ks_ do Result := ( ( _4 * X_ + _3 ) * X_ + _2 ) * X_ + _1;
end;

//------------------------------------------------------------------------------

function Poly( const X_:Single; const Ks_:TSingle5D ) :Single;
begin
     with Ks_ do Result := ( ( ( _5 * X_ + _4 ) * X_ + _3 ) * X_ + _2 ) * X_ + _1;
end;

function Poly( const X_:Double; const Ks_:TDouble5D ) :Double;
begin
     with Ks_ do Result := ( ( ( _5 * X_ + _4 ) * X_ + _3 ) * X_ + _2 ) * X_ + _1;
end;

//------------------------------------------------------------------------------

function Poly( const X_:Single; const Ks_:TSingleND ) :Single;
var
   I :Integer;
begin
     Result := Ks_[ Ks_.DimN-1 ];

     for I := Ks_.DimN-2 downto 0 do Result := Result * X_ + Ks_[ I ];
end;

function Poly( const X_:Double; const Ks_:TDoubleND ) :Double;
var
   I :Integer;
begin
     Result := Ks_[ Ks_.DimN-1 ];

     for I := Ks_.DimN-2 downto 0 do Result := Result * X_ + Ks_[ I ];
end;

//------------------------------------------------------------------------------

function FitPoly( const P_:TSingle4D ) :TSingle4D;
const
     M :TSingleM3 = ( _11:+09  ;  _12:-09/2;  _13:+01  ;
                      _21:-45/2;  _22:+18  ;  _23:-09/2;
                      _31:+27/2;  _32:-27/2;  _33:+09/2; );
var
   P, K :TSingle3D;
begin
     with P_ do
     begin
          P._1 := _2 - _1;
          P._2 := _3 - _1;
          P._3 := _4 - _1;
     end;

     K := M * P;

     with Result do
     begin
          _1 := P_._1;
          _2 := K ._1;
          _3 := K ._2;
          _4 := K ._3;
     end;
end;

function FitPoly( const P_:TDouble4D ) :TDouble4D;
const
     M :TDoubleM3 = ( _11:+09  ;  _12:-09/2;  _13:+01  ;
                      _21:-45/2;  _22:+18  ;  _23:-09/2;
                      _31:+27/2;  _32:-27/2;  _33:+09/2; );
var
   P, K :TDouble3D;
begin
     with P_ do
     begin
          P._1 := _2 - _1;
          P._2 := _3 - _1;
          P._3 := _4 - _1;
     end;

     K := M * P;

     with Result do
     begin
          _1 := P_._1;
          _2 := K ._1;
          _3 := K ._2;
          _4 := K ._3;
     end;
end;

//------------------------------------------------------------------------------

function FitPoly( const P_:TSingle5D ) :TSingle5D;
const
     M :TSingleM4 = ( _11:+016  ;  _12:-012  ;  _13:+016/3;  _14:-001  ;
                      _21:-208/3;  _22:+076  ;  _23:-112/3;  _24:+022/3;
                      _31:+096  ;  _32:-128  ;  _33:+224/3;  _34:-016  ;
                      _41:-128/3;  _42:+064  ;  _43:-128/3;  _44:+032/3; );
var
   P, K :TSingle4D;
begin
     with P_ do
     begin
          P._1 := _2 - _1;
          P._2 := _3 - _1;
          P._3 := _4 - _1;
          P._4 := _5 - _1;
     end;

     K := M * P;

     with Result do
     begin
          _1 := P_._1;
          _2 := K ._1;
          _3 := K ._2;
          _4 := K ._3;
          _5 := K ._4;
     end;
end;

function FitPoly( const P_:TDouble5D ) :TDouble5D;
const
     M :TDoubleM4 = ( _11:+016  ;  _12:-012  ;  _13:+016/3;  _14:-001  ;
                      _21:-208/3;  _22:+076  ;  _23:-112/3;  _24:+022/3;
                      _31:+096  ;  _32:-128  ;  _33:+224/3;  _34:-016  ;
                      _41:-128/3;  _42:+064  ;  _43:-128/3;  _44:+032/3; );
var
   P, K :TDouble4D;
begin
     with P_ do
     begin
          P._1 := _2 - _1;
          P._2 := _3 - _1;
          P._3 := _4 - _1;
          P._4 := _5 - _1;
     end;

     K := M * P;

     with Result do
     begin
          _1 := P_._1;
          _2 := K ._1;
          _3 := K ._2;
          _4 := K ._3;
          _5 := K ._4;
     end;
end;

//------------------------------------------------------------------------------

procedure RandPoly( out Ks_:TSingle4D );
var
   Ws :array [ 0..3 ] of Single;
   Ps :TSingle4D;
begin
     Ws[ 0 ] := 2 * Random - 1;
     Ws[ 1 ] := 2 * Random - 1;
     Ws[ 2 ] := 2 * Random - 1;
     Ws[ 3 ] := 2 * Random - 1;

     with Ps do
     begin
          _1 := SumChebyshev1( 0/3, Ws );
          _2 := SumChebyshev1( 1/3, Ws );
          _3 := SumChebyshev1( 2/3, Ws );
          _4 := SumChebyshev1( 3/3, Ws );
     end;

     Ks_ := FitPoly( Ps / 2 );
end;

procedure RandPoly( out Ks_:TDouble4D );
var
   Ws :array [ 0..3 ] of Double;
   Ps :TDouble4D;
begin
     Ws[ 0 ] := 2 * Random - 1;
     Ws[ 1 ] := 2 * Random - 1;
     Ws[ 2 ] := 2 * Random - 1;
     Ws[ 3 ] := 2 * Random - 1;

     with Ps do
     begin
          _1 := SumChebyshev1( 0/3, Ws );
          _2 := SumChebyshev1( 1/3, Ws );
          _3 := SumChebyshev1( 2/3, Ws );
          _4 := SumChebyshev1( 3/3, Ws );
     end;

     Ks_ := FitPoly( Ps / 2 );
end;

//------------------------------------------------------------------------------

procedure RandPoly( out Ks_:TSingle5D );
var
   Ws :array [ 0..4 ] of Single;
   Ps :TSingle5D;
begin
     Ws[ 0 ] := 2 * Random - 1;
     Ws[ 1 ] := 2 * Random - 1;
     Ws[ 2 ] := 2 * Random - 1;
     Ws[ 3 ] := 2 * Random - 1;
     Ws[ 4 ] := 2 * Random - 1;

     with Ps do
     begin
          _1 := SumChebyshev1( 0/4, Ws );
          _2 := SumChebyshev1( 1/4, Ws );
          _3 := SumChebyshev1( 2/4, Ws );
          _4 := SumChebyshev1( 3/4, Ws );
          _5 := SumChebyshev1( 4/4, Ws );
     end;

     Ks_ := FitPoly( Ps / Roo2(5) );
end;

procedure RandPoly( out Ks_:TDouble5D );
var
   Ws :array [ 0..4 ] of Double;
   Ps :TDouble5D;
begin
     Ws[ 0 ] := 2 * Random - 1;
     Ws[ 1 ] := 2 * Random - 1;
     Ws[ 2 ] := 2 * Random - 1;
     Ws[ 3 ] := 2 * Random - 1;
     Ws[ 4 ] := 2 * Random - 1;

     with Ps do
     begin
          _1 := SumChebyshev1( 0/4, Ws );
          _2 := SumChebyshev1( 1/4, Ws );
          _3 := SumChebyshev1( 2/4, Ws );
          _4 := SumChebyshev1( 3/4, Ws );
          _5 := SumChebyshev1( 4/4, Ws );
     end;

     Ks_ := FitPoly( Ps / Roo2(5) );
end;

//------------------------------------------------------------------------------

function PolyToBezi( const P_:TSingleND ) :TSingleND;
var
   X, Y :Integer;
begin
     with Result do
     begin
          DimN := P_.DimN;

          for X := 0 to DimN-1 do _s[ X ] := P_[ X ] / Comb( DimN-1, X );

          for Y := 1 to DimN-1 do
          begin
               for X := DimN-1 downto Y do _s[ X ] := _s[ X ] + _s[ X-1 ];
          end;
     end;
end;

function PolyToBezi( const P_:TDoubleND ) :TDoubleND;
var
   X, Y :Integer;
begin
     with Result do
     begin
          DimN := P_.DimN;

          for X := 0 to DimN-1 do _s[ X ] := P_[ X ] / Comb( DimN-1, X );

          for Y := 1 to DimN-1 do
          begin
               for X := DimN-1 downto Y do _s[ X ] := _s[ X ] + _s[ X-1 ];
          end;
     end;
end;

//------------------------------------------------------------------------------

function BeziToPoly( const P_:TSingleND ) :TSingleND;
var
   X, Y :Integer;
begin
     with Result do
     begin
          _s := Copy( P_._s );

          for Y := 1 to DimN-1 do
          begin
               for X := DimN-1 downto Y do _s[ X ] := _s[ X ] - _s[ X-1 ];
          end;

          for X := 0 to DimN-1 do _s[ X ] := _s[ X ] * Comb( DimN-1, X );
     end;
end;

function BeziToPoly( const P_:TDoubleND ) :TDoubleND;
var
   X, Y :Integer;
begin
     with Result do
     begin
          _s := Copy( P_._s );

          for Y := 1 to DimN-1 do
          begin
               for X := DimN-1 downto Y do _s[ X ] := _s[ X ] - _s[ X-1 ];
          end;

          for X := 0 to DimN-1 do _s[ X ] := _s[ X ] * Comb( DimN-1, X );
     end;
end;

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
