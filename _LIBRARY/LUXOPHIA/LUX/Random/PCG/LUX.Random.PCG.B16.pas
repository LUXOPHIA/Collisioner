unit LUX.Random.PCG.B16;

interface //#################################################################### ■

uses LUX,
     LUX.Random,
     LUX.Random.PCG;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% T_pcg_state_16

     (* Representations for the oneseq, mcg, and unique variants *)

     T_pcg_state_16 = record
     private
     public
       state :Int16u;
     end;

     T_pcg16si_random_t = T_pcg_state_16;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% T_pcg_state_setseq_16

     (* Representations setseq variants *)

     T_pcg_state_setseq_16 = record
     private
     public
       state :Int16u;
       inc   :Int16u;
     end;

     T_pcg16i_random_t = T_pcg_state_setseq_16;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom16PCG<_TSeed_>

     { http://www.pcg-random.org/using-pcg-c.html }

     TRandom16PCG<_TSeed_:record> = class( TRandomPCG<_TSeed_> )
     private
     protected
       ///// メソッド
       function CalcRandInt08u :Int08u; override;
       function CalcRandInt32u :Int32u; override;
       function CalcRandInt64u :Int64u; override;
     public
       ///// メソッド
       // Rotate helper functions.
       class function pcg_rotr_8( value:Int08u; rot:Int32u ) :Int08u;
       class function pcg_rotr_16( value:Int16u; rot:Int32u ) :Int16u;
       class function pcg_rotr_32( value:Int32u; rot:Int32u ) :Int32u;
       class function pcg_rotr_64( value:Int64u; rot:Int32u ) :Int64u;
       // XSH RS
       class function pcg_output_xsh_rs_16_8( state:Int16u ) :Int08u;
       // XSH RR
       class function pcg_output_xsh_rr_16_8( state:Int16u ) :Int08u;
       // RXS M XS
       class function pcg_output_rxs_m_xs_16_16( state:Int16u ) :Int16u;
       // XSL RR
       // XSL RR RR
       // Multi-step advance functions (jump-ahead, jump-back)
       class function pcg_advance_lcg_16( state,delta,cur_mult,cur_plus:Int16u ) :Int16u;
       // Functions to advance the underlying LCG
       class procedure pcg_oneseq_16_step_r( var rng:T_pcg_state_16 );
       class procedure pcg_oneseq_16_advance_r( var rng:T_pcg_state_16; delta:Int16u );
       class procedure pcg_mcg_16_step_r( var rng:T_pcg_state_16 );
       class procedure pcg_mcg_16_advance_r( var rng:T_pcg_state_16; delta:Int16u );
       class procedure pcg_unique_16_step_r( var rng:T_pcg_state_16 );
       class procedure pcg_unique_16_advance_r( var rng:T_pcg_state_16; delta:Int16u );
       class procedure pcg_setseq_16_step_r( var rng:T_pcg_state_setseq_16 );
       class procedure pcg_setseq_16_advance_r( var rng:T_pcg_state_setseq_16; delta:Int16u );
       { Functions to seed the RNG state }
       class procedure pcg_oneseq_16_srandom_r( var rng:T_pcg_state_16; initstate:Int16u );
       class procedure pcg_mcg_16_srandom_r( var rng:T_pcg_state_16; initstate:Int16u );
       class procedure pcg_unique_16_srandom_r( var rng:T_pcg_state_16; initstate:Int16u );
       class procedure pcg_setseq_16_srandom_r( var rng:T_pcg_state_setseq_16; initstate:Int16u; initseq:Int16u );
       { Generation functions for XSH RS }
       class function pcg_oneseq_16_xsh_rs_8_random_r( var rng:T_pcg_state_16 ) :Int08u;
       class function pcg_oneseq_16_xsh_rs_8_boundedrand_r( var rng:T_pcg_state_16; bound:Int08u ) :Int08u;
       { ----- }
       class function pcg_unique_16_xsh_rs_8_random_r( var rng:T_pcg_state_16 ) :Int08u;
       class function pcg_unique_16_xsh_rs_8_boundedrand_r( var rng:T_pcg_state_16; bound:Int08u ) :Int08u;
       { ----- }
       class function pcg_setseq_16_xsh_rs_8_random_r( var rng:T_pcg_state_setseq_16 ) :Int08u;
       class function pcg_setseq_16_xsh_rs_8_boundedrand_r( var rng:T_pcg_state_setseq_16; bound:Int08u ) :Int08u;
       { ----- }
       class function pcg_mcg_16_xsh_rs_8_random_r( var rng:T_pcg_state_16 ) :Int08u;
       class function pcg_mcg_16_xsh_rs_8_boundedrand_r( var rng:T_pcg_state_16; bound:Int08u ) :Int08u;
       { Generation functions for XSH RR }
       class function pcg_oneseq_16_xsh_rr_8_random_r( var rng:T_pcg_state_16 ) :Int08u;
       class function pcg_oneseq_16_xsh_rr_8_boundedrand_r( var rng:T_pcg_state_16; bound:Int08u ) :Int08u;
       { ----- }
       class function pcg_unique_16_xsh_rr_8_random_r( var rng:T_pcg_state_16 ) :Int08u;
       class function pcg_unique_16_xsh_rr_8_boundedrand_r( var rng:T_pcg_state_16; bound:Int08u ) :Int08u;
       { ----- }
       class function pcg_setseq_16_xsh_rr_8_random_r( var rng:T_pcg_state_setseq_16 ) :Int08u;
       class function pcg_setseq_16_xsh_rr_8_boundedrand_r( var rng:T_pcg_state_setseq_16; bound:Int08u ) :Int08u;
       { ----- }
       class function pcg_mcg_16_xsh_rr_8_random_r( var rng:T_pcg_state_16 ) :Int08u;
       class function pcg_mcg_16_xsh_rr_8_boundedrand_r( var rng:T_pcg_state_16; bound:Int08u ) :Int08u;
       { Generation functions for RXS M XS }
       class function pcg_oneseq_16_rxs_m_xs_16_random_r( var rng:T_pcg_state_16 ) :Int16u;
       class function pcg_oneseq_16_rxs_m_xs_16_boundedrand_r( var rng:T_pcg_state_16; bound:Int16u ) :Int16u;
       { ----- }
       class function pcg_unique_16_rxs_m_xs_16_random_r( var rng:T_pcg_state_16 ) :Int16u;
       class function pcg_unique_16_rxs_m_xs_16_boundedrand_r( var rng:T_pcg_state_16; bound:Int16u ) :Int16u;
       { ----- }
       class function pcg_setseq_16_rxs_m_xs_16_random_r( var rng:T_pcg_state_setseq_16 ) :Int16u;
       class function pcg_setseq_16_rxs_m_xs_16_boundedrand_r( var rng:T_pcg_state_setseq_16; bound:Int16u ) :Int16u;
       { Generation functions for XSL RR }
       { Generation functions for XSL RR RR }
       //// random_r
       class function pcg16si_random_r( var rng:T_pcg_state_16 ) :Int16u; inline;
       class function pcg16i_random_r( var rng:T_pcg_state_setseq_16 ) :Int16u; inline;
       //// boundedrand_r
       class function pcg16si_boundedrand_r( var rng:T_pcg_state_16; bound:Int16u ) :Int16u; inline;
       class function pcg16i_boundedrand_r( var rng:T_pcg_state_setseq_16; bound:Int16u ) :Int16u; inline;
       //// srandom_r
       class procedure pcg16si_srandom_r( var rng:T_pcg_state_16; initstate:Int16u ); inline;
       class procedure pcg16i_srandom_r( var rng:T_pcg_state_setseq_16; initstate:Int16u; initseq:Int16u ); inline;
       //// advance_r
       class procedure pcg16si_advance_r( var rng:T_pcg_state_16; delta:Int16u ); inline;
       class procedure pcg16i_advance_r( var rng:T_pcg_state_setseq_16; delta:Int16u ); inline;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom16PCG16

     TRandom16PCG16 = class( TRandom16PCG<T_pcg_state_16> )
     private
     protected
       ///// メソッド
       procedure CalcNextSeed; override;
       function CalcRandInt16u :Int16u; override;
     public
       constructor CreateFromRand( const Random_:IRandom ); overload; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom16PCG16x15

     TRandom16PCG16x15 = class( TRandom16PCG<T_pcg_state_setseq_16> )
     private
     protected
       ///// メソッド
       procedure CalcNextSeed; override;
       function CalcRandInt16u :Int16u; override;
     public
       constructor CreateFromRand( const Random_:IRandom ); overload; override;
     end;

const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

      PCG_DEFAULT_MULTIPLIER_16 :Int16u = 12829;
      PCG_DEFAULT_INCREMENT_16  :Int16u = 47989;

      (*
       * Static initialization constants (if you can't call srandom for some
       * bizarre reason).
       *)

      PCG_STATE_ONESEQ_16_INITIALIZER :T_pcg_state_16        = ( state:$20df            );
      PCG_STATE_UNIQUE_16_INITIALIZER :T_pcg_state_16        = ( state:$20df            );  //= PCG_STATE_ONESEQ_16_INITIALIZER
      PCG_STATE_MCG_16_INITIALIZER    :T_pcg_state_16        = ( state:$a5e5            );
      PCG_STATE_SETSEQ_16_INITIALIZER :T_pcg_state_setseq_16 = ( state:$e39b; inc:$5bdb );

      PCG16SI_INITIALIZER             :T_pcg_state_16        = ( state:$20df            );  //= PCG_STATE_ONESEQ_16_INITIALIZER
      PCG16I_INITIALIZER              :T_pcg_state_setseq_16 = ( state:$e39b; inc:$5bdb );  //= PCG_STATE_SETSEQ_16_INITIALIZER

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.SysUtils;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom16PCG<_TSeed_>

{ https://github.com/imneme/pcg-c }

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

function TRandom16PCG<_TSeed_>.CalcRandInt08u :Int08u;
begin
     Result := CalcRandInt16u shr 08;
end;

function TRandom16PCG<_TSeed_>.CalcRandInt32u :Int32u;
begin
     Result := Int32u( CalcRandInt16u ) shl 16 or CalcRandInt16u;
end;

function TRandom16PCG<_TSeed_>.CalcRandInt64u :Int64u;
begin
     Result := Int64u( CalcRandInt32u ) shl 32 or CalcRandInt32u;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

{ https://github.com/imneme/pcg-c/blob/master/include/pcg_variants.h }

(*
 * Rotate helper functions.
 *)

class function TRandom16PCG<_TSeed_>.pcg_rotr_8( value:Int08u; rot:Int32u ) :Int08u;
begin
     (* Unfortunately, clang is kinda pathetic when it comes to properly
      * recognizing idiomatic rotate code, so for clang we actually provide
      * assembler directives (enabled with PCG_USE_INLINE_ASM).  Boo, hiss.
      *)

     Result := ( value shr rot ) or ( value shl ( -rot and 07 ) );
end;

class function TRandom16PCG<_TSeed_>.pcg_rotr_16( value:Int16u; rot:Int32u ) :Int16u;
begin
     Result := ( value shr rot ) or ( value shl ( -rot and 15 ) );
end;

class function TRandom16PCG<_TSeed_>.pcg_rotr_32( value:Int32u; rot:Int32u ) :Int32u;
begin
     Result := ( value shr rot ) or ( value shl ( -rot and 31 ) );
end;

class function TRandom16PCG<_TSeed_>.pcg_rotr_64( value:Int64u; rot:Int32u ) :Int64u;
begin
     Result := ( value shr rot ) or ( value shl ( -rot and 63 ) );
end;

(*
 * Output functions.  These are the core of the PCG generation scheme.
 *)

// XSH RS

class function TRandom16PCG<_TSeed_>.pcg_output_xsh_rs_16_8( state:Int16u ) :Int08u;
begin
     Result := Int08u( ( ( state shr 07 ) xor state ) shr ( ( state shr 14 ) + 03 ) );
end;

// XSH RR

class function TRandom16PCG<_TSeed_>.pcg_output_xsh_rr_16_8( state:Int16u ) :Int08u;
begin
     Result := pcg_rotr_8( ( ( state shr 05 ) xor state ) shr 05, state shr 13 );
end;

// RXS M XS

class function TRandom16PCG<_TSeed_>.pcg_output_rxs_m_xs_16_16( state:Int16u ) :Int16u;
var
   word :Int16u;
begin
     word := ( ( state shr ( ( state shr 13 ) + 3 ) ) xor state ) * 62169;

     Result := ( word shr 11 ) xor word;
end;

// XSL RR (only defined for >= 64 bits)

// XSL RR RR (only defined for >= 64 bits)

(* Multi-step advance functions (jump-ahead, jump-back) *)

{ https://github.com/imneme/pcg-c/blob/master/src/pcg-advance-16.c }

class function TRandom16PCG<_TSeed_>.pcg_advance_lcg_16( state,delta,cur_mult,cur_plus:Int16u ) :Int16u;
var
   acc_mult, acc_plus :Int16u;
begin
     acc_mult := 1;
     acc_plus := 0;

     while delta > 0 do
     begin
          if delta and 1 <> 0 then
          begin
               acc_mult := acc_mult * cur_mult;
               acc_plus := acc_plus * cur_mult + cur_plus;
          end;

          cur_plus := ( cur_mult + 1 ) * cur_plus;
          cur_mult := cur_mult * cur_mult;

          delta := delta div 2;
     end;

     Result := acc_mult * state + acc_plus;
end;

(* Functions to advance the underlying LCG, one version for each size and
 * each style.  These functions are considered semi-private.  There is rarely
 * a good reason to call them directly.
 *)

class procedure TRandom16PCG<_TSeed_>.pcg_oneseq_16_step_r( var rng:T_pcg_state_16 );
begin
     rng.state := rng.state * PCG_DEFAULT_MULTIPLIER_16 + PCG_DEFAULT_INCREMENT_16;
end;

class procedure TRandom16PCG<_TSeed_>.pcg_oneseq_16_advance_r( var rng:T_pcg_state_16; delta:Int16u );
begin
     rng.state := pcg_advance_lcg_16( rng.state, delta, PCG_DEFAULT_MULTIPLIER_16, PCG_DEFAULT_INCREMENT_16 );
end;

class procedure TRandom16PCG<_TSeed_>.pcg_mcg_16_step_r( var rng:T_pcg_state_16 );
begin
     rng.state := rng.state * PCG_DEFAULT_MULTIPLIER_16;
end;

class procedure TRandom16PCG<_TSeed_>.pcg_mcg_16_advance_r( var rng:T_pcg_state_16; delta:Int16u );
begin
     rng.state := pcg_advance_lcg_16( rng.state, delta, PCG_DEFAULT_MULTIPLIER_16, 0 );
end;

class procedure TRandom16PCG<_TSeed_>.pcg_unique_16_step_r( var rng:T_pcg_state_16 );
begin
     rng.state := rng.state * PCG_DEFAULT_MULTIPLIER_16 + Int16u( IntPtr( @rng ) or 1 );
end;

class procedure TRandom16PCG<_TSeed_>.pcg_unique_16_advance_r( var rng:T_pcg_state_16; delta:Int16u );
begin
     rng.state := pcg_advance_lcg_16( rng.state, delta, PCG_DEFAULT_MULTIPLIER_16, Int16u( IntPtr( @rng ) or 1 ) );
end;

class procedure TRandom16PCG<_TSeed_>.pcg_setseq_16_step_r( var rng:T_pcg_state_setseq_16 );
begin
     rng.state := rng.state * PCG_DEFAULT_MULTIPLIER_16 + rng.inc;
end;

class procedure TRandom16PCG<_TSeed_>.pcg_setseq_16_advance_r( var rng:T_pcg_state_setseq_16; delta:Int16u );
begin
     rng.state := pcg_advance_lcg_16( rng.state, delta, PCG_DEFAULT_MULTIPLIER_16, rng.inc );
end;

(* Functions to seed the RNG state, one version for each size and each
 * style.  Unlike the step functions, regular users can and should call
 * these functions.
 *)

class procedure TRandom16PCG<_TSeed_>.pcg_oneseq_16_srandom_r( var rng:T_pcg_state_16; initstate:Int16u );
begin
     rng.state := 0;
     pcg_oneseq_16_step_r( rng );
     rng.state := rng.state + initstate;
     pcg_oneseq_16_step_r( rng );
end;

class procedure TRandom16PCG<_TSeed_>.pcg_mcg_16_srandom_r( var rng:T_pcg_state_16; initstate:Int16u );
begin
     rng.state := initstate or 1;
end;

class procedure TRandom16PCG<_TSeed_>.pcg_unique_16_srandom_r( var rng:T_pcg_state_16; initstate:Int16u );
begin
     rng.state := 0;
     pcg_unique_16_step_r( rng );
     rng.state := rng.state + initstate;
     pcg_unique_16_step_r( rng );
end;

class procedure TRandom16PCG<_TSeed_>.pcg_setseq_16_srandom_r( var rng:T_pcg_state_setseq_16; initstate:Int16u; initseq:Int16u );
begin
     rng.state := 0;
     rng.inc := ( initseq shl 1 ) or 1;
     pcg_setseq_16_step_r( rng );
     rng.state := rng.state + initstate;
     pcg_setseq_16_step_r( rng );
end;

(* Generation functions for XSH RS *)

class function TRandom16PCG<_TSeed_>.pcg_oneseq_16_xsh_rs_8_random_r( var rng:T_pcg_state_16 ) :Int08u;
var
   oldstate :Int16u;
begin
     oldstate := rng.state;
     pcg_oneseq_16_step_r( rng );
     Result := pcg_output_xsh_rs_16_8( oldstate );
end;

class function TRandom16PCG<_TSeed_>.pcg_oneseq_16_xsh_rs_8_boundedrand_r( var rng:T_pcg_state_16; bound:Int08u ) :Int08u;
var
   threshold, r :Int08u;
begin
     threshold := Int08u( -bound ) mod bound;

     repeat
           r := pcg_oneseq_16_xsh_rs_8_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//------------------------------------------------------------------------------

class function TRandom16PCG<_TSeed_>.pcg_unique_16_xsh_rs_8_random_r( var rng:T_pcg_state_16 ) :Int08u;
var
   oldstate :Int16u;
begin
     oldstate := rng.state;
     pcg_unique_16_step_r( rng );
     Result := pcg_output_xsh_rs_16_8( oldstate );
end;

class function TRandom16PCG<_TSeed_>.pcg_unique_16_xsh_rs_8_boundedrand_r( var rng:T_pcg_state_16; bound:Int08u ) :Int08u;
var
   threshold, r :Int08u;
begin
     threshold := Int08u( -bound ) mod bound;

     repeat
           r := pcg_unique_16_xsh_rs_8_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//------------------------------------------------------------------------------

class function TRandom16PCG<_TSeed_>.pcg_setseq_16_xsh_rs_8_random_r( var rng:T_pcg_state_setseq_16 ) :Int08u;
var
   oldstate :Int16u;
begin
     oldstate := rng.state;
     pcg_setseq_16_step_r( rng );
     Result := pcg_output_xsh_rs_16_8( oldstate );
end;

class function TRandom16PCG<_TSeed_>.pcg_setseq_16_xsh_rs_8_boundedrand_r( var rng:T_pcg_state_setseq_16; bound:Int08u ) :Int08u;
var
   threshold, r :Int08u;
begin
     threshold := Int08u( -bound ) mod bound;

     repeat
           r := pcg_setseq_16_xsh_rs_8_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//------------------------------------------------------------------------------

class function TRandom16PCG<_TSeed_>.pcg_mcg_16_xsh_rs_8_random_r( var rng:T_pcg_state_16 ) :Int08u;
var
   oldstate :Int64u;
begin
     oldstate := rng.state;
     pcg_mcg_16_step_r( rng );
     Result := pcg_output_xsh_rs_16_8( oldstate );
end;

class function TRandom16PCG<_TSeed_>.pcg_mcg_16_xsh_rs_8_boundedrand_r( var rng:T_pcg_state_16; bound:Int08u ) :Int08u;
var
   threshold, r :Int08u;
begin
     threshold := Int08u( -bound ) mod bound;

     repeat
           r := pcg_mcg_16_xsh_rs_8_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//---------------------------------------------- Generation functions for XSH RR

class function TRandom16PCG<_TSeed_>.pcg_oneseq_16_xsh_rr_8_random_r( var rng:T_pcg_state_16 ) :Int08u;
var
   oldstate :Int16u;
begin
     oldstate := rng.state;
     pcg_oneseq_16_step_r( rng );
     Result := pcg_output_xsh_rr_16_8( oldstate );
end;

class function TRandom16PCG<_TSeed_>.pcg_oneseq_16_xsh_rr_8_boundedrand_r( var rng:T_pcg_state_16; bound:Int08u ) :Int08u;
var
   threshold, r :Int08u;
begin
     threshold := Int08u( -bound ) mod bound;

     repeat
           r := pcg_oneseq_16_xsh_rr_8_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//------------------------------------------------------------------------------

class function TRandom16PCG<_TSeed_>.pcg_unique_16_xsh_rr_8_random_r( var rng:T_pcg_state_16 ) :Int08u;
var
   oldstate :Int16u;
begin
     oldstate := rng.state;
     pcg_unique_16_step_r( rng );
     Result := pcg_output_xsh_rr_16_8( oldstate );
end;

class function TRandom16PCG<_TSeed_>.pcg_unique_16_xsh_rr_8_boundedrand_r( var rng:T_pcg_state_16; bound:Int08u ) :Int08u;
var
   threshold, r :Int08u;
begin
     threshold := Int08u( -bound ) mod bound;

     repeat
           r := pcg_unique_16_xsh_rr_8_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//------------------------------------------------------------------------------

class function TRandom16PCG<_TSeed_>.pcg_setseq_16_xsh_rr_8_random_r( var rng:T_pcg_state_setseq_16 ) :Int08u;
var
   oldstate :Int16u;
begin
     oldstate := rng.state;
     pcg_setseq_16_step_r( rng );
     Result := pcg_output_xsh_rr_16_8( oldstate );
end;

class function TRandom16PCG<_TSeed_>.pcg_setseq_16_xsh_rr_8_boundedrand_r( var rng:T_pcg_state_setseq_16; bound:Int08u ) :Int08u;
var
   threshold, r :Int08u;
begin
     threshold := Int08u( -bound ) mod bound;

     repeat
           r := pcg_setseq_16_xsh_rr_8_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//------------------------------------------------------------------------------

class function TRandom16PCG<_TSeed_>.pcg_mcg_16_xsh_rr_8_random_r( var rng:T_pcg_state_16 ) :Int08u;
var
   oldstate :Int16u;
begin
     oldstate := rng.state;
     pcg_mcg_16_step_r( rng );
     Result := pcg_output_xsh_rr_16_8( oldstate );
end;

class function TRandom16PCG<_TSeed_>.pcg_mcg_16_xsh_rr_8_boundedrand_r( var rng:T_pcg_state_16; bound:Int08u ) :Int08u;
var
   threshold, r :Int08u;
begin
     threshold := Int08u( -bound ) mod bound;

     repeat
           r := pcg_mcg_16_xsh_rr_8_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//-------------------------------------------- Generation functions for RXS M XS

class function TRandom16PCG<_TSeed_>.pcg_oneseq_16_rxs_m_xs_16_random_r( var rng:T_pcg_state_16 ) :Int16u;
var
   oldstate :Int16u;
begin
     oldstate := rng.state;
     pcg_oneseq_16_step_r( rng );
     Result := pcg_output_rxs_m_xs_16_16( oldstate );
end;

class function TRandom16PCG<_TSeed_>.pcg_oneseq_16_rxs_m_xs_16_boundedrand_r( var rng:T_pcg_state_16; bound:Int16u ) :Int16u;
var
   threshold, r :Int16u;
begin
     threshold := Int16u( -bound ) mod bound;

     repeat
           r := pcg_oneseq_16_rxs_m_xs_16_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//------------------------------------------------------------------------------

class function TRandom16PCG<_TSeed_>.pcg_unique_16_rxs_m_xs_16_random_r( var rng:T_pcg_state_16 ) :Int16u;
var
   oldstate :Int16u;
begin
     oldstate := rng.state;
     pcg_unique_16_step_r( rng );
     Result := pcg_output_rxs_m_xs_16_16( oldstate );
end;

class function TRandom16PCG<_TSeed_>.pcg_unique_16_rxs_m_xs_16_boundedrand_r( var rng:T_pcg_state_16; bound:Int16u ) :Int16u;
var
   threshold, r :Int16u;
begin
     threshold := Int16u( -bound ) mod bound;

     repeat
           r := pcg_unique_16_rxs_m_xs_16_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//------------------------------------------------------------------------------

class function TRandom16PCG<_TSeed_>.pcg_setseq_16_rxs_m_xs_16_random_r( var rng:T_pcg_state_setseq_16 ) :Int16u;
var
   oldstate :Int16u;
begin
     oldstate := rng.state;
     pcg_setseq_16_step_r( rng );
     Result := pcg_output_rxs_m_xs_16_16( oldstate );
end;

class function TRandom16PCG<_TSeed_>.pcg_setseq_16_rxs_m_xs_16_boundedrand_r( var rng:T_pcg_state_setseq_16; bound:Int16u ) :Int16u;
var
   threshold, r :Int16u;
begin
     threshold := Int16u( -bound ) mod bound;

     repeat
           r := pcg_setseq_16_rxs_m_xs_16_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//---------------------------------------------- Generation functions for XSL RR

//------------------------------------------- Generation functions for XSL RR RR

/////////////////////////////////////////////////////////////////////// random_r

class function TRandom16PCG<_TSeed_>.pcg16si_random_r( var rng:T_pcg_state_16 ) :Int16u;
begin
     Result := pcg_oneseq_16_rxs_m_xs_16_random_r( rng );
end;

class function TRandom16PCG<_TSeed_>.pcg16i_random_r( var rng:T_pcg_state_setseq_16 ) :Int16u;
begin
     Result := pcg_setseq_16_rxs_m_xs_16_random_r( rng );
end;

////////////////////////////////////////////////////////////////// boundedrand_r

class function TRandom16PCG<_TSeed_>.pcg16si_boundedrand_r( var rng:T_pcg_state_16; bound:Int16u ) :Int16u;
begin
     Result := pcg_oneseq_16_rxs_m_xs_16_boundedrand_r( rng, bound );
end;

class function TRandom16PCG<_TSeed_>.pcg16i_boundedrand_r( var rng:T_pcg_state_setseq_16; bound:Int16u ) :Int16u;
begin
     Result := pcg_setseq_16_rxs_m_xs_16_boundedrand_r( rng, bound );
end;

////////////////////////////////////////////////////////////////////// srandom_r

class procedure TRandom16PCG<_TSeed_>.pcg16si_srandom_r( var rng:T_pcg_state_16; initstate:Int16u );
begin
     pcg_oneseq_16_srandom_r( rng, initstate );
end;

class procedure TRandom16PCG<_TSeed_>.pcg16i_srandom_r( var rng:T_pcg_state_setseq_16; initstate:Int16u; initseq:Int16u );
begin
     pcg_setseq_16_srandom_r( rng, initstate, initseq );
end;

////////////////////////////////////////////////////////////////////// advance_r

class procedure TRandom16PCG<_TSeed_>.pcg16si_advance_r( var rng:T_pcg_state_16; delta:Int16u );
begin
     pcg_oneseq_16_advance_r( rng, delta );
end;

class procedure TRandom16PCG<_TSeed_>.pcg16i_advance_r( var rng:T_pcg_state_setseq_16; delta:Int16u );
begin
     pcg_setseq_16_advance_r( rng, delta );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom16PCG16

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandom16PCG16.CalcNextSeed;
begin
     pcg_oneseq_16_step_r( _Seed );
end;

//------------------------------------------------------------------------------

function TRandom16PCG16.CalcRandInt16u :Int16u;
begin
     Result := pcg_output_rxs_m_xs_16_16( _Seed.state );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandom16PCG16.CreateFromRand( const Random_:IRandom );
var
   S :T_pcg_state_16;
begin
     pcg_oneseq_16_srandom_r( S, Random_.DrawRandInt16u );

     Create( S );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom16PCG16x15

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandom16PCG16x15.CalcNextSeed;
begin
     pcg_setseq_16_step_r( _Seed );
end;

//------------------------------------------------------------------------------

function TRandom16PCG16x15.CalcRandInt16u :Int16u;
begin
     Result := pcg_output_rxs_m_xs_16_16( _Seed.state );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandom16PCG16x15.CreateFromRand( const Random_:IRandom );
var
   S :T_pcg_state_setseq_16;
begin
     pcg_setseq_16_srandom_r( S, Random_.DrawRandInt16u, Random_.DrawRandInt16u );

     Create( S );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■