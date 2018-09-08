unit LUX.Random.SFMT;

interface //#################################################################### ■

uses LUX, LUX.D3, LUX.D4,
     LUX.Random;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% T_w128_t

     { 128-bit SIMD like data type for standard C }

     P_w128_t = ^T_w128_t;

     T_w128_t = record
     private
     public
       case Byte of
        0:( u   :array [ 0..4-1 ] of Int32u );
        1:( u64 :array [ 0..2-1 ] of Int64u );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% T_sfmt_t

     { SFMT internal state }

     T_sfmt_t = record
     private
       ///// アクセス
       function Getpsfmt32( const I_:Int32s ) :Int32u;
       procedure Setpsfmt32( const I_:Int32s; const sfmt32_:Int32u );
       function Getpsfmt64( const I_:Int32s ) :Int64u;
       procedure Setpsfmt64( const I_:Int32s; const sfmt64_:Int64u );
     public
       state :TArray<T_w128_t>;  // the 128-bit internal state array
       idx   :Int32s;            // index counter to the 32-bit internal state array
       /////
       constructor Create( const stateN_:Int32s ); overload;
       constructor Create( const sfmt_:T_sfmt_t ); overload;
       ///// プロパティ
       property psfmt32[ const I_:Int32s ] :Int32u read Getpsfmt32 write Setpsfmt32;
       property psfmt64[ const I_:Int32s ] :Int64u read Getpsfmt64 write Setpsfmt64;
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomSMT

     IRandomSMT = interface( IRandom<T_sfmt_t> )
     ['{3780F689-4D47-4EA8-ABE8-6D5051C0CBEC}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TRandomSMT = class( TRandom<T_sfmt_t>, IRandomSMT )
     private
     protected
       ///// アクセス
       function GetSFMT_MEXP :Int32s; virtual; abstract;
       function GetSFMT_N :Int32s;
       function GetSFMT_N32 :Int32s;
       function GetSFMT_N64 :Int32s;
       function GetSFMT_POS1 :Int32s; virtual; abstract;
       function GetSFMT_SL1 :Int32s; virtual; abstract;
       function GetSFMT_SL2 :Int32s; virtual; abstract;
       function GetSFMT_SR1 :Int32s; virtual; abstract;
       function GetSFMT_SR2 :Int32s; virtual; abstract;
       function GetSFMT_MSK1 :Int32u; virtual; abstract;
       function GetSFMT_MSK2 :Int32u; virtual; abstract;
       function GetSFMT_MSK3 :Int32u; virtual; abstract;
       function GetSFMT_MSK4 :Int32u; virtual; abstract;
       function GetSFMT_PARITY1 :Int32u; virtual; abstract;
       function GetSFMT_PARITY2 :Int32u; virtual; abstract;
       function GetSFMT_PARITY3 :Int32u; virtual; abstract;
       function GetSFMT_PARITY4 :Int32u; virtual; abstract;
       function GetSFMT_IDSTR :String; virtual; abstract;
     public
       constructor CreateFromRand( const Random_:IRandom ); overload; override;
       constructor Create( const Seed_:T_sfmt_t ); overload; override;
       constructor Create( const Key_:Int32u ); overload;
       constructor Create( const Keys_:TArray<Int32u> ); overload;
       ///// プロパティ
       property SFMT_MEXP    :Int32s read GetSFMT_MEXP   ;
       property SFMT_N       :Int32s read GetSFMT_N      ;
       property SFMT_N32     :Int32s read GetSFMT_N32    ;
       property SFMT_N64     :Int32s read GetSFMT_N64    ;
       property SFMT_POS1    :Int32s read GetSFMT_POS1   ;
       property SFMT_SL1     :Int32s read GetSFMT_SL1    ;
       property SFMT_SL2     :Int32s read GetSFMT_SL2    ;
       property SFMT_SR1     :Int32s read GetSFMT_SR1    ;
       property SFMT_SR2     :Int32s read GetSFMT_SR2    ;
       property SFMT_MSK1    :Int32u read GetSFMT_MSK1   ;
       property SFMT_MSK2    :Int32u read GetSFMT_MSK2   ;
       property SFMT_MSK3    :Int32u read GetSFMT_MSK3   ;
       property SFMT_MSK4    :Int32u read GetSFMT_MSK4   ;
       property SFMT_PARITY1 :Int32u read GetSFMT_PARITY1;
       property SFMT_PARITY2 :Int32u read GetSFMT_PARITY2;
       property SFMT_PARITY3 :Int32u read GetSFMT_PARITY3;
       property SFMT_PARITY4 :Int32u read GetSFMT_PARITY4;
       property SFMT_IDSTR   :String read GetSFMT_IDSTR  ;
       ///// メソッド
       class procedure rshift128( out out_:T_w128_t; const in_:T_w128_t; shift:Int32s ); inline;
       class procedure lshift128( out out_:T_w128_t; const in_:T_w128_t; shift:Int32s ); inline;
       procedure do_recursion( out r:T_w128_t; const a,b,c,d:T_w128_t ); inline;
       {--------}
       function sfmt_genrand_uint32( var sfmt:T_sfmt_t ) :Int32u; inline;
       function sfmt_genrand_uint64( var sfmt:T_sfmt_t ) :Int64u; inline;
       {--------}
       class function sfmt_to_real1( v:Int32u ) :Flo64s; inline;
       function sfmt_genrand_real1( var sfmt:T_sfmt_t ) :Flo64s; inline;
       class function sfmt_to_real2( v:Int32u ) :Flo64s; inline;
       function sfmt_genrand_real2( var sfmt:T_sfmt_t ) :Flo64s; inline;
       class function sfmt_to_real3( v:Int32u ) :Flo64s; inline;
       function sfmt_genrand_real3( var sfmt:T_sfmt_t ) :Flo64s; inline;
       class function sfmt_to_res53( v:Int64u ) :Flo64s; inline;
       function sfmt_genrand_res53( var sfmt:T_sfmt_t ) :Flo64s; inline;
       class function sfmt_to_res53_mix( x,y:Int32u ) :Flo64s; inline;
       function sfmt_genrand_res53_mix( var sfmt:T_sfmt_t ) :Flo64s; inline;
       {--------}
       class function idxof( i:Int32s ) :Int32s; inline;
       procedure gen_rand_array( var sfmt:T_sfmt_t; array_:TArray<T_w128_t>; size:Int32s ); inline;
       class function func1( x:Int32u ) :Int32u; inline;
       class function func2( x:Int32u ) :Int32u; inline;
       procedure period_certification( var sfmt:T_sfmt_t ); inline;
       {--------}
       function sfmt_get_idstring( var sfmt:T_sfmt_t ) :String;
       function sfmt_get_min_array_size32( var sfmt:T_sfmt_t ) :Int32s;
       function sfmt_get_min_array_size64( var sfmt:T_sfmt_t ) :Int32s;
       procedure sfmt_gen_rand_all( var sfmt:T_sfmt_t );
       procedure sfmt_fill_array32( var sfmt:T_sfmt_t; array_:TArray<T_w128_t>; size:Int32s );
       procedure sfmt_fill_array64( var sfmt:T_sfmt_t; array_:TArray<T_w128_t>; size:Int32s );
       procedure sfmt_init_gen_rand( var sfmt:T_sfmt_t; seed:Int32u );
       procedure sfmt_init_by_array( var sfmt:T_sfmt_t; init_key:TArray<Int32u>; key_length:Int32s );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32SMT

     TRandom32SMT = class( TRandomSMT )
     private
     protected
       ///// メソッド
       procedure CalcNextSeed; override;
       function CalcRandInt32u :Int32u; override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64SMT

     TRandom64SMT = class( TRandomSMT )
     private
     protected
       ///// メソッド
       procedure CalcNextSeed; override;
       function CalcRandInt64u :Int64u; override;
     public
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.SysUtils, System.Math;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% T_w128_t

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% T_sfmt_t

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function T_sfmt_t.Getpsfmt32( const I_:Int32s ) :Int32u;
begin
     Result := TArray<Int32u>( state )[ I_ ];
end;

procedure T_sfmt_t.Setpsfmt32( const I_:Int32s; const sfmt32_:Int32u );
begin
     TArray<Int32u>( state )[ I_ ] := sfmt32_;
end;

function T_sfmt_t.Getpsfmt64( const I_:Int32s ) :Int64u;
begin
     Result := TArray<Int64u>( state )[ I_ ];
end;

procedure T_sfmt_t.Setpsfmt64( const I_:Int32s; const sfmt64_:Int64u );
begin
     TArray<Int64u>( state )[ I_ ] := sfmt64_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor T_sfmt_t.Create( const stateN_:Int32s );
begin
     SetLength( state, stateN_ );
end;

constructor T_sfmt_t.Create( const sfmt_:T_sfmt_t );
begin
     Create( Length( sfmt_.state ) );

     Move( sfmt_.state[ 0 ], state[ 0 ], SizeOf( T_w128_t ) * Min( Length( sfmt_.state ), Length( state ) ) );

     idx := sfmt_.idx;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomSMT

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TRandomSMT.GetSFMT_N :Int32s;
begin
     Result := SFMT_MEXP div 128 + 1;
end;

function TRandomSMT.GetSFMT_N32 :Int32s;
begin
     Result := SFMT_N * 4;
end;

function TRandomSMT.GetSFMT_N64 :Int32s;
begin
     Result := SFMT_N * 2;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandomSMT.CreateFromRand( const Random_:IRandom );
begin
     Create( Random_.DrawRandInt32u );
end;

constructor TRandomSMT.Create( const Seed_:T_sfmt_t );
begin
     inherited Create( T_sfmt_t.Create( Seed_ ) );
end;

constructor TRandomSMT.Create( const Key_:Int32u );
var
   S :T_sfmt_t;
begin
     S := T_sfmt_t.Create( SFMT_N );

     sfmt_init_gen_rand( S, Key_ );  // S.idx = SFMT_N32

     // from: sfmt_genrand_uint32( sfmt )

     sfmt_gen_rand_all( S );

     S.idx := 0;

     inherited Create( S );
end;

constructor TRandomSMT.Create( const Keys_:TArray<Int32u> );
var
   S :T_sfmt_t;
begin
     S := T_sfmt_t.Create( SFMT_N );

     sfmt_init_by_array( S, Keys_, Length( Keys_ ) );  // S.idx = SFMT_N32

     // from: sfmt_genrand_uint32( sfmt )

     sfmt_gen_rand_all( S );

     S.idx := 0;

     inherited Create( S );
end;

/////////////////////////////////////////////////////////////////////// メソッド

class procedure TRandomSMT.rshift128( out out_:T_w128_t; const in_:T_w128_t; shift:Int32s );
var
   th, tl, oh, ol :Int64u;
begin
     th := ( Int64u( in_.u[ 3 ] ) shl 32 ) or ( Int64u( in_.u[ 2 ] ) );
     tl := ( Int64u( in_.u[ 1 ] ) shl 32 ) or ( Int64u( in_.u[ 0 ] ) );

     oh :=       th shr (      shift * 8 );
     ol :=       tl shr (      shift * 8 );
     ol := ol or th shl ( 64 - shift * 8 );

     out_.u[ 1 ] := Int32u( ol shr 32 );
     out_.u[ 0 ] := Int32u( ol        );
     out_.u[ 3 ] := Int32u( oh shr 32 );
     out_.u[ 2 ] := Int32u( oh        );
end;

class procedure TRandomSMT.lshift128( out out_:T_w128_t; const in_:T_w128_t; shift:Int32s );
var
   th, tl, oh, ol :Int64u;
begin
     th := ( Int64u( in_.u[ 3 ] ) shl 32 ) or ( Int64u( in_.u[ 2 ] ) );
     tl := ( Int64u( in_.u[ 1 ] ) shl 32 ) or ( Int64u( in_.u[ 0 ] ) );

     oh :=       th shl (      shift * 8 );
     ol :=       tl shl (      shift * 8 );
     oh := oh or tl shr ( 64 - shift * 8 );

     out_.u[ 1 ] := Int32u( ol shr 32 );
     out_.u[ 0 ] := Int32u( ol        );
     out_.u[ 3 ] := Int32u( oh shr 32 );
     out_.u[ 2 ] := Int32u( oh        );
end;

procedure TRandomSMT.do_recursion( out r:T_w128_t; const a,b,c,d:T_w128_t );
var
   x, y :T_w128_t;
begin
     lshift128( x, a, SFMT_SL2 );
     rshift128( y, c, SFMT_SR2 );

     r.u[ 0 ] := a.u[ 0 ] xor x.u[ 0 ] xor ( ( b.u[ 0 ] shr SFMT_SR1 ) and SFMT_MSK1 ) xor y.u[ 0 ] xor ( d.u[ 0 ] shl SFMT_SL1 );
     r.u[ 1 ] := a.u[ 1 ] xor x.u[ 1 ] xor ( ( b.u[ 1 ] shr SFMT_SR1 ) and SFMT_MSK2 ) xor y.u[ 1 ] xor ( d.u[ 1 ] shl SFMT_SL1 );
     r.u[ 2 ] := a.u[ 2 ] xor x.u[ 2 ] xor ( ( b.u[ 2 ] shr SFMT_SR1 ) and SFMT_MSK3 ) xor y.u[ 2 ] xor ( d.u[ 2 ] shl SFMT_SL1 );
     r.u[ 3 ] := a.u[ 3 ] xor x.u[ 3 ] xor ( ( b.u[ 3 ] shr SFMT_SR1 ) and SFMT_MSK4 ) xor y.u[ 3 ] xor ( d.u[ 3 ] shl SFMT_SL1 );
end;

////////////////////////////////////////////////////////////////////////////////

(**
 * This function generates and returns 32-bit pseudorandom number.
 * init_gen_rand or init_by_array must be called before this function.
 * @param sfmt SFMT internal state
 * @return 32-bit pseudorandom number
 *)
function TRandomSMT.sfmt_genrand_uint32( var sfmt:T_sfmt_t ) :Int32u;
begin
     if sfmt.idx >= SFMT_N32 then
     begin
          sfmt_gen_rand_all( sfmt );

          sfmt.idx := 0;
     end;

     Result := sfmt.psfmt32[ sfmt.idx ];

     Inc( sfmt.idx );
end;

(**
 * This function generates and returns 64-bit pseudorandom number.
 * init_gen_rand or init_by_array must be called before this function.
 * The function gen_rand64 should not be called after gen_rand32,
 * unless an initialization is again executed.
 * @param sfmt SFMT internal state
 * @return 64-bit pseudorandom number
 *)
function TRandomSMT.sfmt_genrand_uint64( var sfmt:T_sfmt_t ) :Int64u;
begin
     Assert( sfmt.idx mod 2 = 0 );

     if sfmt.idx >= SFMT_N32 then
     begin
          sfmt_gen_rand_all( sfmt );

          sfmt.idx := 0;
     end;

     Result := sfmt.psfmt64[ sfmt.idx div 2 ];

     Inc( sfmt.idx, 2 );
end;

(**
 * converts an unsigned 32-bit number to a double on [0,1]-real-interval.
 * @param v 32-bit unsigned integer
 * @return double on [0,1]-real-interval
 *)
class function TRandomSMT.sfmt_to_real1( v:Int32u ) :Flo64s;
begin
     Result := v * ( 1.0 / 4294967295.0 ); // divided by 2^32-1
end;

(**
 * generates a random number on [0,1]-real-interval
 * @param sfmt SFMT internal state
 * @return double on [0,1]-real-interval
 *)
function TRandomSMT.sfmt_genrand_real1( var sfmt:T_sfmt_t ) :Flo64s;
begin
     Result := sfmt_to_real1( sfmt_genrand_uint32( sfmt ) );
end;

(**
 * converts an unsigned 32-bit integer to a double on [0,1)-real-interval.
 * @param v 32-bit unsigned integer
 * @return double on [0,1)-real-interval
 *)
class function TRandomSMT.sfmt_to_real2( v:Int32u ) :Flo64s;
begin
     Result := v * ( 1.0 / 4294967296.0 );  // divided by 2^32
end;

(**
 * generates a random number on [0,1)-real-interval
 * @param sfmt SFMT internal state
 * @return double on [0,1)-real-interval
 *)
function TRandomSMT.sfmt_genrand_real2( var sfmt:T_sfmt_t ) :Flo64s;
begin
     Result := sfmt_to_real2( sfmt_genrand_uint32( sfmt ) );
end;

(**
 * converts an unsigned 32-bit integer to a double on (0,1)-real-interval.
 * @param v 32-bit unsigned integer
 * @return double on (0,1)-real-interval
 *)
class function TRandomSMT.sfmt_to_real3( v:Int32u ) :Flo64s;
begin
     Result := ( Flo64s( v ) + 0.5 ) * ( 1.0 / 4294967296.0 );  // divided by 2^32
end;

(**
 * generates a random number on (0,1)-real-interval
 * @param sfmt SFMT internal state
 * @return double on (0,1)-real-interval
 *)
function TRandomSMT.sfmt_genrand_real3( var sfmt:T_sfmt_t ) :Flo64s;
begin
     Result := sfmt_to_real3( sfmt_genrand_uint32( sfmt ) );
end;

(**
 * converts an unsigned 32-bit integer to double on [0,1)
 * with 53-bit resolution.
 * @param v 32-bit unsigned integer
 * @return double on [0,1)-real-interval with 53-bit resolution.
 *)
class function TRandomSMT.sfmt_to_res53( v:Int64u ) :Flo64s;
begin
     Result := ( v shr 11 ) * ( 1.0 / 9007199254740992.0 );
end;

(**
 * generates a random number on [0,1) with 53-bit resolution
 * @param sfmt SFMT internal state
 * @return double on [0,1) with 53-bit resolution
 *)
function TRandomSMT.sfmt_genrand_res53( var sfmt:T_sfmt_t ) :Flo64s;
begin
     Result := sfmt_to_res53( sfmt_genrand_uint64( sfmt ) );
end;

(**
 * generates a random number on [0,1) with 53-bit resolution from two
 * 32 bit integers
 *)
class function TRandomSMT.sfmt_to_res53_mix( x,y:Int32u ) :Flo64s;
begin
     Result := sfmt_to_res53( x or ( Int64u( y ) shl 32 ) );
end;

(**
 * generates a random number on [0,1) with 53-bit resolution
 * using two 32bit integers.
 * @param sfmt SFMT internal state
 * @return double on [0,1) with 53-bit resolution
 *)
function TRandomSMT.sfmt_genrand_res53_mix( var sfmt:T_sfmt_t ) :Flo64s;
var
   x, y :Int32u;
begin
     x := sfmt_genrand_uint32( sfmt );
     y := sfmt_genrand_uint32( sfmt );

     Result := sfmt_to_res53_mix( x, y );
end;

//------------------------------------------------------------------------------

(**
 * This function simulate a 64-bit index of LITTLE ENDIAN
 * in BIG ENDIAN machine.
 *)
class function TRandomSMT.idxof( i:Int32s ) :Int32s;
begin
     Result := i;
end;

(**
 * This function fills the user-specified array with pseudorandom
 * integers.
 *
 * @param sfmt SFMT internal state
 * @param array an 128-bit array to be filled by pseudorandom numbers.
 * @param size number of 128-bit pseudorandom numbers to be generated.
 *)
procedure TRandomSMT.gen_rand_array( var sfmt:T_sfmt_t; array_:TArray<T_w128_t>; size:Int32s );
var
   i, j :Int32s;
   r1, r2 :P_w128_t;
begin
     r1 := @sfmt.state[ SFMT_N - 2 ];
     r2 := @sfmt.state[ SFMT_N - 1 ];

     for i := 0 to SFMT_N - SFMT_POS1 - 1 do
     begin
          do_recursion( array_[ i ], sfmt.state[ i ], sfmt.state[ i + SFMT_POS1 ], r1^, r2^ );

          r1 := r2;  r2 := @array_[ i ];
     end;

     for i := SFMT_N - SFMT_POS1 to SFMT_N - 1 do
     begin
          do_recursion( array_[ i ], sfmt.state[ i ], array_[ i + SFMT_POS1 - SFMT_N ], r1^, r2^ );

          r1 := r2;  r2 := @array_[ i ];
     end;

     for i := SFMT_N to size - SFMT_N - 1 do
     begin
          do_recursion( array_[ i ], array_[ i - SFMT_N ], array_[ i + SFMT_POS1 - SFMT_N ], r1^, r2^ );

          r1 := r2;  r2 := @array_[ i ];
     end;

     for j := 0 to 2 * SFMT_N - size - 1 do
     begin
          sfmt.state[ j ] := array_[ j + size - SFMT_N ];
     end;

     j := 2 * SFMT_N - size;
     for i := size - SFMT_N to size - 1 do
     begin
          do_recursion( array_[ i ], array_[ i - SFMT_N ], array_[ i + SFMT_POS1 - SFMT_N ], r1^, r2^ );

          r1 := r2;  r2 := @array_[ i ];

          sfmt.state[ j ] := array_[ i ];

          Inc( j );
     end;
end;

(**
 * This function represents a function used in the initialization
 * by init_by_array
 * @param x 32-bit integer
 * @return 32-bit integer
 *)
class function TRandomSMT.func1( x:Int32u ) :Int32u;
begin
     Result := ( x xor ( x shr 27 ) ) * Int32u( 1664525 );
end;

(**
 * This function represents a function used in the initialization
 * by init_by_array
 * @param x 32-bit integer
 * @return 32-bit integer
 *)
class function TRandomSMT.func2( x:Int32u ) :Int32u;
begin
     Result := ( x xor ( x shr 27 ) ) * Int32u( 1566083941 );
end;

(**
 * This function certificate the period of 2^{MEXP}
 * @param sfmt SFMT internal state
 *)
procedure TRandomSMT.period_certification( var sfmt:T_sfmt_t );
var
   inner, work :Int32u;
   i, j :Int32s;
   parity :array [ 0..4-1 ] of Int32u;
begin
     parity[ 0 ] := SFMT_PARITY1;
     parity[ 1 ] := SFMT_PARITY2;
     parity[ 2 ] := SFMT_PARITY3;
     parity[ 3 ] := SFMT_PARITY4;

     inner := 0;

     for i := 0 to 4-1 do
     begin
          inner := inner xor ( sfmt.psfmt32[ idxof( i ) ] and parity[ i ] );
     end;

     i := 16;
     while i > 0 do
     begin
          inner := inner xor ( inner shr i );

          i := i shr 1;
     end;

     inner := inner and 1;

     (* check OK *)
     if inner = 1 then Exit;

     (* check NG, and modification *)
     for i := 0 to 4-1 do
     begin
          work := 1;
          for j := 0 to 32-1 do
          begin
               if work and parity[ i ] <> 0 then
               begin
                    with sfmt do psfmt32[ idxof( i ) ] := psfmt32[ idxof( i ) ] xor work;

                    Exit;
               end;

               work := work shl 1;
          end;
     end;
end;

//------------------------------------------------------------- PUBLIC FUNCTIONS

(**
 * This function returns the identification string.
 * The string shows the word size, the Mersenne exponent,
 * and all parameters of this generator.
 * @param sfmt SFMT internal state
 *)
function TRandomSMT.sfmt_get_idstring( var sfmt:T_sfmt_t ) :String;
begin
     Result := SFMT_IDSTR;
end;

(**
 * This function returns the minimum size of array used for \b
 * fill_array32() function.
 * @param sfmt SFMT internal state
 * @return minimum size of array used for fill_array32() function.
 *)
function TRandomSMT.sfmt_get_min_array_size32( var sfmt:T_sfmt_t ) :Int32s;
begin
     Result := SFMT_N32;
end;

(**
 * This function returns the minimum size of array used for \b
 * fill_array64() function.
 * @param sfmt SFMT internal state
 * @return minimum size of array used for fill_array64() function.
 *)
function TRandomSMT.sfmt_get_min_array_size64( var sfmt:T_sfmt_t ) :Int32s;
begin
     Result := SFMT_N64;
end;

(**
 * This function fills the internal state array with pseudorandom
 * integers.
 * @param sfmt SFMT internal state
 *)
procedure TRandomSMT.sfmt_gen_rand_all( var sfmt:T_sfmt_t );
var
   i :Int32s;
   r1, r2 :P_w128_t;
begin
     r1 := @sfmt.state[ SFMT_N - 2 ];
     r2 := @sfmt.state[ SFMT_N - 1 ];

     for i := 0 to SFMT_N - SFMT_POS1 - 1 do
     begin
          do_recursion( sfmt.state[ i ], sfmt.state[ i ], sfmt.state[ i + SFMT_POS1 ], r1^, r2^ );

          r1 := r2;  r2 := @sfmt.state[ i ];
     end;

     for i := SFMT_N - SFMT_POS1 to SFMT_N - 1 do
     begin
          do_recursion( sfmt.state[ i ], sfmt.state[ i ], sfmt.state[ i + SFMT_POS1 - SFMT_N ], r1^, r2^ );

          r1 := r2;  r2 := @sfmt.state[ i ];
     end;
end;

(**
 * This function generates pseudorandom 32-bit integers in the
 * specified array[] by one call. The number of pseudorandom integers
 * is specified by the argument size, which must be at least 624 and a
 * multiple of four.  The generation by this function is much faster
 * than the following gen_rand function.
 *
 * For initialization, init_gen_rand or init_by_array must be called
 * before the first call of this function. This function can not be
 * used after calling gen_rand function, without initialization.
 *
 * @param sfmt SFMT internal state
 * @param array an array where pseudorandom 32-bit integers are filled
 * by this function.  The pointer to the array must be \b "aligned"
 * (namely, must be a multiple of 16) in the SIMD version, since it
 * refers to the address of a 128-bit integer.  In the standard C
 * version, the pointer is arbitrary.
 *
 * @param size the number of 32-bit pseudorandom integers to be
 * generated.  size must be a multiple of 4, and greater than or equal
 * to (MEXP / 128 + 1) * 4.
 *
 * @note \b memalign or \b posix_memalign is available to get aligned
 * memory. Mac OSX doesn't have these functions, but \b malloc of OSX
 * returns the pointer to the aligned memory block.
 *)
procedure TRandomSMT.sfmt_fill_array32( var sfmt:T_sfmt_t; array_:TArray<T_w128_t>; size:Int32s );
begin
     Assert( sfmt.idx = SFMT_N32 );
     Assert( size mod 4 = 0 );
     Assert( size >= SFMT_N32 );

     gen_rand_array( sfmt, array_, size div 4 );

     sfmt.idx := SFMT_N32;
end;

(**
 * This function generates pseudorandom 64-bit integers in the
 * specified array[] by one call. The number of pseudorandom integers
 * is specified by the argument size, which must be at least 312 and a
 * multiple of two.  The generation by this function is much faster
 * than the following gen_rand function.
 *
 * @param sfmt SFMT internal state
 * For initialization, init_gen_rand or init_by_array must be called
 * before the first call of this function. This function can not be
 * used after calling gen_rand function, without initialization.
 *
 * @param array an array where pseudorandom 64-bit integers are filled
 * by this function.  The pointer to the array must be "aligned"
 * (namely, must be a multiple of 16) in the SIMD version, since it
 * refers to the address of a 128-bit integer.  In the standard C
 * version, the pointer is arbitrary.
 *
 * @param size the number of 64-bit pseudorandom integers to be
 * generated.  size must be a multiple of 2, and greater than or equal
 * to (MEXP / 128 + 1) * 2
 *
 * @note \b memalign or \b posix_memalign is available to get aligned
 * memory. Mac OSX doesn't have these functions, but \b malloc of OSX
 * returns the pointer to the aligned memory block.
 *)
procedure TRandomSMT.sfmt_fill_array64( var sfmt:T_sfmt_t; array_:TArray<T_w128_t>; size:Int32s );
begin
     Assert( sfmt.idx = SFMT_N32 );
     Assert( size mod 2 = 0 );
     Assert( size >= SFMT_N64 );

     gen_rand_array( sfmt, array_, size div 2 );

     sfmt.idx := SFMT_N32;
end;

(**
 * This function initializes the internal state array with a 32-bit
 * integer seed.
 *
 * @param sfmt SFMT internal state
 * @param seed a 32-bit integer used as the seed.
 *)
procedure TRandomSMT.sfmt_init_gen_rand( var sfmt:T_sfmt_t; seed:Int32u );
var
   i :Int32s;
begin
     sfmt.psfmt32[ idxof( 0 ) ] := seed;

     for i := 1 to SFMT_N32 - 1
     do sfmt.psfmt32[ idxof( i ) ] := 1812433253 * ( sfmt.psfmt32[ idxof( i - 1 ) ]
                                               xor ( sfmt.psfmt32[ idxof( i - 1 ) ] shr 30 ) ) + Int32u( i );

     sfmt.idx := SFMT_N32;

     period_certification( sfmt );
end;

(**
 * This function initializes the internal state array,
 * with an array of 32-bit integers used as the seeds
 * @param sfmt SFMT internal state
 * @param init_key the array of 32-bit integers, used as a seed.
 * @param key_length the length of init_key.
 *)
procedure TRandomSMT.sfmt_init_by_array( var sfmt:T_sfmt_t; init_key:TArray<Int32u>; key_length:Int32s );
var
   i, j, count, lag, mid, size :Int32s;
   r :Int32u;
begin
     size := SFMT_N * 4;

     if size >= 623 then lag := 11
                    else
     if size >=  68 then lag := 07
                    else
     if size >=  39 then lag := 05
                    else lag := 03;

     mid := ( size - lag ) div 2;

     FillChar( sfmt.state[ 0 ], SizeOf( T_w128_t ) * Length( sfmt.state ), $8b );

     if key_length + 1 > SFMT_N32 then count := key_length + 1
                                  else count := SFMT_N32;

     r := func1( sfmt.psfmt32[ idxof( 0            ) ]
             xor sfmt.psfmt32[ idxof( mid          ) ]
             xor sfmt.psfmt32[ idxof( SFMT_N32 - 1 ) ] );

     sfmt.psfmt32[ idxof( mid ) ] := sfmt.psfmt32[ idxof( mid ) ] + r;

     Inc( r, key_length );

     sfmt.psfmt32[ idxof( mid + lag ) ] := sfmt.psfmt32[ idxof( mid + lag ) ] + r;

     sfmt.psfmt32[ idxof( 0 ) ] := r;

     Dec( count );

     i := 1;  j := 0;
     while ( j < count ) and ( j < key_length ) do
     begin
          r := func1( sfmt.psfmt32[ idxof(   i                               ) ]
                  xor sfmt.psfmt32[ idxof( ( i + mid          ) mod SFMT_N32 ) ]
                  xor sfmt.psfmt32[ idxof( ( i + SFMT_N32 - 1 ) mod SFMT_N32 ) ] );

          sfmt.psfmt32[ idxof( ( i + mid ) mod SFMT_N32 ) ] := sfmt.psfmt32[ idxof( ( i + mid ) mod SFMT_N32 ) ] + r;

          Inc( r, init_key[ j ] + Int32u( i ) );

          sfmt.psfmt32[ idxof( ( i + mid + lag ) mod SFMT_N32 ) ] := sfmt.psfmt32[ idxof( ( i + mid + lag ) mod SFMT_N32 ) ] + r;

          sfmt.psfmt32[ idxof( i ) ] := r;

          i := ( i + 1 ) mod SFMT_N32;

          Inc( j );
     end;

     while j < count do
     begin
          r := func1( sfmt.psfmt32[ idxof(   i                               ) ]
                  xor sfmt.psfmt32[ idxof( ( i + mid          ) mod SFMT_N32 ) ]
                  xor sfmt.psfmt32[ idxof( ( i + SFMT_N32 - 1 ) mod SFMT_N32 ) ] );

          sfmt.psfmt32[ idxof( ( i + mid ) mod SFMT_N32 ) ] := sfmt.psfmt32[ idxof( ( i + mid ) mod SFMT_N32 ) ] + r;

          Inc( r, i );

          sfmt.psfmt32[ idxof( ( i + mid + lag ) mod SFMT_N32 ) ] := sfmt.psfmt32[ idxof( ( i + mid + lag ) mod SFMT_N32 ) ] + r;

          sfmt.psfmt32[ idxof( i ) ] := r;

          i := ( i + 1 ) mod SFMT_N32;

          Inc( j );
     end;

     for j := 0 to SFMT_N32 - 1 do
     begin
          r := func2( sfmt.psfmt32[ idxof(   i                               ) ]
                    + sfmt.psfmt32[ idxof( ( i + mid          ) mod SFMT_N32 ) ]
                    + sfmt.psfmt32[ idxof( ( i + SFMT_N32 - 1 ) mod SFMT_N32 ) ] );

          sfmt.psfmt32[ idxof( ( i + mid ) mod SFMT_N32 ) ] := sfmt.psfmt32[ idxof( ( i + mid ) mod SFMT_N32 ) ] xor r;

          Dec( r, i );

          sfmt.psfmt32[ idxof( ( i + mid + lag ) mod SFMT_N32 ) ] := sfmt.psfmt32[ idxof( ( i + mid + lag ) mod SFMT_N32 ) ] xor r;

          sfmt.psfmt32[ idxof( i ) ] := r;

          i := ( i + 1 ) mod SFMT_N32;
     end;

     sfmt.idx := SFMT_N32;

     period_certification( sfmt );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32SMT

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandom32SMT.CalcNextSeed;
begin
     // from: sfmt_genrand_uint32( sfmt )

     Inc( _Seed.idx );

     if _Seed.idx >= SFMT_N32 then
     begin
          sfmt_gen_rand_all( _Seed );

          _Seed.idx := 0;
     end;
end;

function TRandom32SMT.CalcRandInt32u :Int32u;
begin
     // from: sfmt_genrand_uint32( sfmt )

     Result := _Seed.psfmt32[ _Seed.idx ];
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64SMT

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandom64SMT.CalcNextSeed;
begin
     // from: sfmt_genrand_uint64( sfmt )

     Inc( _Seed.idx, 2 );

     if _Seed.idx >= SFMT_N32 then
     begin
          sfmt_gen_rand_all( _Seed );

          _Seed.idx := 0;
     end;
end;

function TRandom64SMT.CalcRandInt64u :Int64u;
begin
     // from: sfmt_genrand_uint64( sfmt )

     Result := _Seed.psfmt64[ _Seed.idx div 2 ];
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■