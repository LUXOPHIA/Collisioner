unit LUX.Random.PCG.B32;

interface //#################################################################### ■

uses LUX,
     LUX.Random,
     LUX.Random.PCG,
     LUX.Random.PCG.B64;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】


     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% T_pcg_state_32

     (* Representations for the oneseq, mcg, and unique variants *)

     T_pcg_state_32 = record
     private
     public
       state :Int32u;
     end;

     T_pcg32s_random_t  = T_pcg_state_64;
     T_pcg32u_random_t  = T_pcg_state_64;
     T_pcg32f_random_t  = T_pcg_state_64;

     T_pcg32si_random_t = T_pcg_state_32;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% T_pcg_state_setseq_32

     (* Representations setseq variants *)

     T_pcg_state_setseq_32 = record
     private
     public
       state :Int32u;
       inc   :Int32u;
     end;

     T_pcg32_random_t  = T_pcg_state_setseq_64;

     T_pcg32i_random_t = T_pcg_state_setseq_32;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32PCG<_TSeed_>

     { http://www.pcg-random.org/using-pcg-c.html }

     TRandom32PCG<_TSeed_:record> = class( TRandomPCG<_TSeed_> )
     private
     protected
       ///// メソッド
       function CalcRandInt08u :Int08u; override;
       function CalcRandInt16u :Int16u; override;
       function CalcRandInt64u :Int64u; override;
     public
       ///// メソッド
       // Rotate helper functions.
       class function pcg_rotr_8( value:Int08u; rot:Int32u ) :Int08u;
       class function pcg_rotr_16( value:Int16u; rot:Int32u ) :Int16u;
       class function pcg_rotr_32( value:Int32u; rot:Int32u ) :Int32u;
       class function pcg_rotr_64( value:Int64u; rot:Int32u ) :Int64u;
       // XSH RS
       class function pcg_output_xsh_rs_32_16( state:Int32u ) :Int16u;
       // XSH RR
       class function pcg_output_xsh_rr_32_16( state:Int32u ) :Int16u;
       // RXS M XS
       class function pcg_output_rxs_m_xs_32_32( state:Int32u ) :Int32u;
       // XSL RR
       // XSL RR RR
       // Multi-step advance functions (jump-ahead, jump-back)
       class function pcg_advance_lcg_32( state,delta,cur_mult,cur_plus:Int32u ) :Int32u;
       // Functions to advance the underlying LCG
       class procedure pcg_oneseq_32_step_r( var rng:T_pcg_state_32 );
       class procedure pcg_oneseq_32_advance_r( var rng:T_pcg_state_32; delta:Int32u );
       class procedure pcg_mcg_32_step_r( var rng:T_pcg_state_32 );
       class procedure pcg_mcg_32_advance_r( var rng:T_pcg_state_32; delta:Int32u );
       class procedure pcg_unique_32_step_r( var rng:T_pcg_state_32 );
       class procedure pcg_unique_32_advance_r( var rng:T_pcg_state_32; delta:Int32u );
       class procedure pcg_setseq_32_step_r( var rng:T_pcg_state_setseq_32 );
       class procedure pcg_setseq_32_advance_r( var rng:T_pcg_state_setseq_32; delta:Int32u );
       { Functions to seed the RNG state }
       class procedure pcg_oneseq_32_srandom_r( var rng:T_pcg_state_32; initstate:Int32u );
       class procedure pcg_mcg_32_srandom_r( var rng:T_pcg_state_32; initstate:Int32u );
       class procedure pcg_unique_32_srandom_r( var rng:T_pcg_state_32; initstate:Int32u );
       class procedure pcg_setseq_32_srandom_r( var rng:T_pcg_state_setseq_32; initstate:Int32u; initseq:Int32u );
       { Generation functions for XSH RS }
       class function pcg_oneseq_32_xsh_rs_16_random_r( var rng:T_pcg_state_32 ) :Int16u;
       class function pcg_oneseq_32_xsh_rs_16_boundedrand_r( var rng:T_pcg_state_32; bound:Int16u ) :Int16u;
       { ----- }
       class function pcg_unique_32_xsh_rs_16_random_r( var rng:T_pcg_state_32 ) :Int16u;
       class function pcg_unique_32_xsh_rs_16_boundedrand_r( var rng:T_pcg_state_32; bound:Int16u ) :Int16u;
       { ----- }
       class function pcg_setseq_32_xsh_rs_16_random_r( var rng:T_pcg_state_setseq_32 ) :Int16u;
       class function pcg_setseq_32_xsh_rs_16_boundedrand_r( var rng:T_pcg_state_setseq_32; bound:Int16u ) :Int16u;
       { ----- }
       class function pcg_mcg_32_xsh_rs_16_random_r( var rng:T_pcg_state_32 ) :Int16u;
       class function pcg_mcg_32_xsh_rs_16_boundedrand_r( var rng:T_pcg_state_32; bound:Int16u ) :Int16u;
       { Generation functions for XSH RR }
       class function pcg_oneseq_32_xsh_rr_16_random_r( var rng:T_pcg_state_32 ) :Int16u;
       class function pcg_oneseq_32_xsh_rr_16_boundedrand_r( var rng:T_pcg_state_32; bound:Int16u ) :Int16u;
       { ----- }
       class function pcg_unique_32_xsh_rr_16_random_r( var rng:T_pcg_state_32 ) :Int16u;
       class function pcg_unique_32_xsh_rr_16_boundedrand_r( var rng:T_pcg_state_32; bound:Int16u ) :Int16u;
       { ----- }
       class function pcg_setseq_32_xsh_rr_16_random_r( var rng:T_pcg_state_setseq_32 ) :Int16u;
       class function pcg_setseq_32_xsh_rr_16_boundedrand_r( var rng:T_pcg_state_setseq_32; bound:Int16u ) :Int16u;
       { ----- }
       class function pcg_mcg_32_xsh_rr_16_random_r( var rng:T_pcg_state_32 ) :Int16u;
       class function pcg_mcg_32_xsh_rr_16_boundedrand_r( var rng:T_pcg_state_32; bound:Int16u ) :Int16u;
       { Generation functions for RXS M XS }
       class function pcg_oneseq_32_rxs_m_xs_32_random_r( var rng:T_pcg_state_32 ) :Int32u;
       class function pcg_oneseq_32_rxs_m_xs_32_boundedrand_r( var rng:T_pcg_state_32; bound:Int32u ) :Int32u;
       { ----- }
       class function pcg_unique_32_rxs_m_xs_32_random_r( var rng:T_pcg_state_32 ) :Int32u;
       class function pcg_unique_32_rxs_m_xs_32_boundedrand_r( var rng:T_pcg_state_32; bound:Int32u ) :Int32u;
       { ----- }
       class function pcg_setseq_32_rxs_m_xs_32_random_r( var rng:T_pcg_state_setseq_32 ) :Int32u;
       class function pcg_setseq_32_rxs_m_xs_32_boundedrand_r( var rng:T_pcg_state_setseq_32; bound:Int32u ) :Int32u;
       { Generation functions for XSL RR }
       { Generation functions for XSL RR RR }
       //// random_r
       class function pcg32_random_r( var rng:T_pcg_state_setseq_64 ) :Int32u; inline;
       class function pcg32s_random_r( var rng:T_pcg_state_64 ) :Int32u; inline;
       class function pcg32u_random_r( var rng:T_pcg_state_64 ) :Int32u; inline;
       class function pcg32f_random_r( var rng:T_pcg_state_64 ) :Int32u; inline;
       class function pcg32si_random_r( var rng:T_pcg_state_32 ) :Int32u; inline;
       class function pcg32i_random_r( var rng:T_pcg_state_setseq_32 ) :Int32u; inline;
       //// boundedrand_r
       class function pcg32_boundedrand_r( var rng:T_pcg_state_setseq_64; bound:Int32u ) :Int32u; inline;
       class function pcg32s_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u; inline;
       class function pcg32u_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u; inline;
       class function pcg32f_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u; inline;
       class function pcg32si_boundedrand_r( var rng:T_pcg_state_32; bound:Int32u ) :Int32u; inline;
       class function pcg32i_boundedrand_r( var rng:T_pcg_state_setseq_32; bound:Int32u ) :Int32u; inline;
       //// srandom_r
       class procedure pcg32_srandom_r( var rng:T_pcg_state_setseq_64; initstate:Int64u; initseq:Int64u ); inline;
       class procedure pcg32s_srandom_r( var rng:T_pcg_state_64; initstate:Int64u ); inline;
       class procedure pcg32u_srandom_r( var rng:T_pcg_state_64; initstate:Int64u ); inline;
       class procedure pcg32f_srandom_r( var rng:T_pcg_state_64; initstate:Int64u ); inline;
       class procedure pcg32si_srandom_r( var rng:T_pcg_state_32; initstate:Int32u ); inline;
       class procedure pcg32i_srandom_r( var rng:T_pcg_state_setseq_32; initstate:Int32u; initseq:Int32u ); inline;
       //// advance_r
       class procedure pcg32_advance_r( var rng:T_pcg_state_setseq_64; delta:Int64u ); inline;
       class procedure pcg32s_advance_r( var rng:T_pcg_state_64; delta:Int64u ); inline;
       class procedure pcg32u_advance_r( var rng:T_pcg_state_64; delta:Int64u ); inline;
       class procedure pcg32f_advance_r( var rng:T_pcg_state_64; delta:Int64u ); inline;
       class procedure pcg32si_advance_r( var rng:T_pcg_state_32; delta:Int32u ); inline;
       class procedure pcg32i_advance_r( var rng:T_pcg_state_setseq_32; delta:Int32u ); inline;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32PCG32

     TRandom32PCG32 = class( TRandom32PCG<T_pcg_state_32> )
     private
     protected
       ///// メソッド
       procedure CalcNextSeed; override;
       function CalcRandInt32u :Int32u; override;
     public
       constructor CreateFromRand( const Random_:IRandom ); overload; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32PCG32x31

     TRandom32PCG32x31 = class( TRandom32PCG<T_pcg_state_setseq_32> )
     private
     protected
       ///// メソッド
       procedure CalcNextSeed; override;
       function CalcRandInt32u :Int32u; override;
     public
       constructor CreateFromRand( const Random_:IRandom ); overload; override;
     end;

const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

      PCG_DEFAULT_MULTIPLIER_32 :Int32u = 747796405;
      PCG_DEFAULT_INCREMENT_32  :Int32u = 2891336453;

      (*
       * Static initialization constants (if you can't call srandom for some
       * bizarre reason).
       *)

      PCG_STATE_ONESEQ_32_INITIALIZER :T_pcg_state_32        = ( state:$46b56677                               );
      PCG_STATE_UNIQUE_32_INITIALIZER :T_pcg_state_32        = ( state:$46b56677                               );  //= PCG_STATE_ONESEQ_32_INITIALIZER
      PCG_STATE_MCG_32_INITIALIZER    :T_pcg_state_32        = ( state:$d15ea5e5                               );
      PCG_STATE_SETSEQ_32_INITIALIZER :T_pcg_state_setseq_32 = ( state:$ec02d89b;         inc:$94b95bdb        );

      PCG_STATE_ONESEQ_64_INITIALIZER :T_pcg_state_64        = ( state:$4d595df4d0f33173                        );
      PCG_STATE_UNIQUE_64_INITIALIZER :T_pcg_state_64        = ( state:$4d595df4d0f33173                        );  //= PCG_STATE_ONESEQ_64_INITIALIZER
      PCG_STATE_MCG_64_INITIALIZER    :T_pcg_state_64        = ( state:$cafef00dd15ea5e5                        );
      PCG_STATE_SETSEQ_64_INITIALIZER :T_pcg_state_setseq_64 = ( state:$853c49e6748fea9b; inc:$da3e39cb94b95bdb );

      PCG32_INITIALIZER               :T_pcg_state_setseq_64 = ( state:$853c49e6748fea9b; inc:$da3e39cb94b95bdb );  //= PCG_STATE_SETSEQ_64_INITIALIZER
      PCG32U_INITIALIZER              :T_pcg_state_64        = ( state:$4d595df4d0f33173                        );  //= PCG_STATE_UNIQUE_64_INITIALIZER
      PCG32S_INITIALIZER              :T_pcg_state_64        = ( state:$4d595df4d0f33173                        );  //= PCG_STATE_ONESEQ_64_INITIALIZER
      PCG32F_INITIALIZER              :T_pcg_state_64        = ( state:$cafef00dd15ea5e5                        );  //= PCG_STATE_MCG_64_INITIALIZER
      PCG32SI_INITIALIZER             :T_pcg_state_32        = ( state:$46b56677                                );  //= PCG_STATE_ONESEQ_32_INITIALIZER
      PCG32I_INITIALIZER              :T_pcg_state_setseq_32 = ( state:$ec02d89b;         inc:$94b95bdb         );  //= PCG_STATE_SETSEQ_32_INITIALIZER

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.SysUtils;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32PCG<_TSeed_>

{ https://github.com/imneme/pcg-c }

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

function TRandom32PCG<_TSeed_>.CalcRandInt08u :Int08u;
begin
     Result := CalcRandInt16u shr 08;
end;

function TRandom32PCG<_TSeed_>.CalcRandInt16u :Int16u;
begin
     Result := CalcRandInt32u shr 16;
end;

function TRandom32PCG<_TSeed_>.CalcRandInt64u :Int64u;
begin
     Result := Int64u( CalcRandInt32u ) shl 32 or CalcRandInt32u;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

{ https://github.com/imneme/pcg-c/blob/master/include/pcg_variants.h }

(*
 * Rotate helper functions.
 *)

class function TRandom32PCG<_TSeed_>.pcg_rotr_8( value:Int08u; rot:Int32u ) :Int08u;
begin
     (* Unfortunately, clang is kinda pathetic when it comes to properly
      * recognizing idiomatic rotate code, so for clang we actually provide
      * assembler directives (enabled with PCG_USE_INLINE_ASM).  Boo, hiss.
      *)

     Result := ( value shr rot ) or ( value shl ( -rot and 07 ) );
end;

class function TRandom32PCG<_TSeed_>.pcg_rotr_16( value:Int16u; rot:Int32u ) :Int16u;
begin
     Result := ( value shr rot ) or ( value shl ( -rot and 15 ) );
end;

class function TRandom32PCG<_TSeed_>.pcg_rotr_32( value:Int32u; rot:Int32u ) :Int32u;
begin
     Result := ( value shr rot ) or ( value shl ( -rot and 31 ) );
end;

class function TRandom32PCG<_TSeed_>.pcg_rotr_64( value:Int64u; rot:Int32u ) :Int64u;
begin
     Result := ( value shr rot ) or ( value shl ( -rot and 63 ) );
end;

(*
 * Output functions.  These are the core of the PCG generation scheme.
 *)

// XSH RS

class function TRandom32PCG<_TSeed_>.pcg_output_xsh_rs_32_16( state:Int32u ) :Int16u;
begin
     Result := Int16u( ( ( state shr 11 ) xor state ) shr ( ( state shr 30 ) + 11 ) );
end;

// XSH RR

class function TRandom32PCG<_TSeed_>.pcg_output_xsh_rr_32_16( state:Int32u ) :Int16u;
begin
     Result := pcg_rotr_16( ( ( state shr 10 ) xor state ) shr 12, state shr 28 );
end;

// RXS M XS

class function TRandom32PCG<_TSeed_>.pcg_output_rxs_m_xs_32_32( state:Int32u ) :Int32u;
var
   word :Int32u;
begin
     word := ( ( state shr ( ( state shr 28 ) + 4 ) ) xor state ) * 277803737;

     Result := ( word shr 22 ) xor word;
end;

// XSL RR (only defined for >= 64 bits)

// XSL RR RR (only defined for >= 64 bits)

(* Functions to advance the underlying LCG, one version for each size and
 * each style.  These functions are considered semi-private.  There is rarely
 * a good reason to call them directly.
 *)

class procedure TRandom32PCG<_TSeed_>.pcg_oneseq_32_step_r( var rng:T_pcg_state_32 );
begin
     rng.state := rng.state * PCG_DEFAULT_MULTIPLIER_32 + PCG_DEFAULT_INCREMENT_32;
end;

class procedure TRandom32PCG<_TSeed_>.pcg_oneseq_32_advance_r( var rng:T_pcg_state_32; delta:Int32u );
begin
     rng.state := pcg_advance_lcg_32( rng.state, delta, PCG_DEFAULT_MULTIPLIER_32, PCG_DEFAULT_INCREMENT_32 );
end;

class procedure TRandom32PCG<_TSeed_>.pcg_mcg_32_step_r( var rng:T_pcg_state_32 );
begin
     rng.state := rng.state * PCG_DEFAULT_MULTIPLIER_32;
end;

class procedure TRandom32PCG<_TSeed_>.pcg_mcg_32_advance_r( var rng:T_pcg_state_32; delta:Int32u );
begin
     rng.state := pcg_advance_lcg_32( rng.state, delta, PCG_DEFAULT_MULTIPLIER_32, 0 );
end;

class procedure TRandom32PCG<_TSeed_>.pcg_unique_32_step_r( var rng:T_pcg_state_32 );
begin
     rng.state := rng.state * PCG_DEFAULT_MULTIPLIER_32 + Int32u( IntPtr( @rng ) or 1 );
end;

class procedure TRandom32PCG<_TSeed_>.pcg_unique_32_advance_r( var rng:T_pcg_state_32; delta:Int32u );
begin
     rng.state := pcg_advance_lcg_32( rng.state, delta, PCG_DEFAULT_MULTIPLIER_32, Int32u( IntPtr( @rng ) or 1 ) );
end;

class procedure TRandom32PCG<_TSeed_>.pcg_setseq_32_step_r( var rng:T_pcg_state_setseq_32 );
begin
     rng.state := rng.state * PCG_DEFAULT_MULTIPLIER_32 + rng.inc;
end;

class procedure TRandom32PCG<_TSeed_>.pcg_setseq_32_advance_r( var rng:T_pcg_state_setseq_32; delta:Int32u );
begin
     rng.state := pcg_advance_lcg_32( rng.state, delta, PCG_DEFAULT_MULTIPLIER_32, rng.inc );
end;

(* Multi-step advance functions (jump-ahead, jump-back) *)

{ https://github.com/imneme/pcg-c/blob/master/src/pcg-advance-32.c }

class function TRandom32PCG<_TSeed_>.pcg_advance_lcg_32( state,delta,cur_mult,cur_plus:Int32u ) :Int32u;
var
   acc_mult, acc_plus :Int32u;
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

(* Functions to seed the RNG state, one version for each size and each
 * style.  Unlike the step functions, regular users can and should call
 * these functions.
 *)

class procedure TRandom32PCG<_TSeed_>.pcg_oneseq_32_srandom_r( var rng:T_pcg_state_32; initstate:Int32u );
begin
     rng.state := 0;
     pcg_oneseq_32_step_r( rng );
     rng.state := rng.state + initstate;
     pcg_oneseq_32_step_r( rng );
end;

class procedure TRandom32PCG<_TSeed_>.pcg_mcg_32_srandom_r( var rng:T_pcg_state_32; initstate:Int32u );
begin
     rng.state := initstate or 1;
end;

class procedure TRandom32PCG<_TSeed_>.pcg_unique_32_srandom_r( var rng:T_pcg_state_32; initstate:Int32u );
begin
     rng.state := 0;
     pcg_unique_32_step_r( rng );
     rng.state := rng.state + initstate;
     pcg_unique_32_step_r( rng );
end;

class procedure TRandom32PCG<_TSeed_>.pcg_setseq_32_srandom_r( var rng:T_pcg_state_setseq_32; initstate:Int32u; initseq:Int32u );
begin
     rng.state := 0;
     rng.inc := ( initseq shl 1 ) or 1;
     pcg_setseq_32_step_r( rng );
     rng.state := rng.state + initstate;
     pcg_setseq_32_step_r( rng );
end;

(* Generation functions for XSH RS *)

class function TRandom32PCG<_TSeed_>.pcg_oneseq_32_xsh_rs_16_random_r( var rng:T_pcg_state_32 ) :Int16u;
var
   oldstate :Int32u;
begin
     oldstate := rng.state;
     pcg_oneseq_32_step_r( rng );
     Result := pcg_output_xsh_rs_32_16( oldstate );
end;

class function TRandom32PCG<_TSeed_>.pcg_oneseq_32_xsh_rs_16_boundedrand_r( var rng:T_pcg_state_32; bound:Int16u ) :Int16u;
var
   threshold, r :Int16u;
begin
     threshold := Int16u( -bound ) mod bound;

     repeat
           r := pcg_oneseq_32_xsh_rs_16_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//------------------------------------------------------------------------------

class function TRandom32PCG<_TSeed_>.pcg_unique_32_xsh_rs_16_random_r( var rng:T_pcg_state_32 ) :Int16u;
var
   oldstate :Int32u;
begin
     oldstate := rng.state;
     pcg_unique_32_step_r( rng );
     Result := pcg_output_xsh_rs_32_16( oldstate );
end;

class function TRandom32PCG<_TSeed_>.pcg_unique_32_xsh_rs_16_boundedrand_r( var rng:T_pcg_state_32; bound:Int16u ) :Int16u;
var
   threshold, r :Int16u;
begin
     threshold := Int16u( -bound ) mod bound;

     repeat
           r := pcg_unique_32_xsh_rs_16_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//------------------------------------------------------------------------------

class function TRandom32PCG<_TSeed_>.pcg_setseq_32_xsh_rs_16_random_r( var rng:T_pcg_state_setseq_32 ) :Int16u;
var
   oldstate :Int32u;
begin
     oldstate := rng.state;
     pcg_setseq_32_step_r( rng );
     Result := pcg_output_xsh_rs_32_16( oldstate );
end;

class function TRandom32PCG<_TSeed_>.pcg_setseq_32_xsh_rs_16_boundedrand_r( var rng:T_pcg_state_setseq_32; bound:Int16u ) :Int16u;
var
   threshold, r :Int16u;
begin
     threshold := Int16u( -bound ) mod bound;

     repeat
           r := pcg_setseq_32_xsh_rs_16_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//------------------------------------------------------------------------------

class function TRandom32PCG<_TSeed_>.pcg_mcg_32_xsh_rs_16_random_r( var rng:T_pcg_state_32 ) :Int16u;
var
   oldstate :Int32u;
begin
     oldstate := rng.state;
     pcg_mcg_32_step_r( rng );
     Result := pcg_output_xsh_rs_32_16( oldstate );
end;

class function TRandom32PCG<_TSeed_>.pcg_mcg_32_xsh_rs_16_boundedrand_r( var rng:T_pcg_state_32; bound:Int16u ) :Int16u;
var
   threshold, r :Int16u;
begin
     threshold := Int16u( -bound ) mod bound;

     repeat
           r := pcg_mcg_32_xsh_rs_16_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//---------------------------------------------- Generation functions for XSH RR

class function TRandom32PCG<_TSeed_>.pcg_oneseq_32_xsh_rr_16_random_r( var rng:T_pcg_state_32 ) :Int16u;
var
   oldstate :Int32u;
begin
     oldstate := rng.state;
     pcg_oneseq_32_step_r( rng );
     Result := pcg_output_xsh_rr_32_16( oldstate );
end;

class function TRandom32PCG<_TSeed_>.pcg_oneseq_32_xsh_rr_16_boundedrand_r( var rng:T_pcg_state_32; bound:Int16u ) :Int16u;
var
   threshold, r :Int16u;
begin
     threshold := Int16u( -bound ) mod bound;

     repeat
           r := pcg_oneseq_32_xsh_rr_16_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//------------------------------------------------------------------------------

class function TRandom32PCG<_TSeed_>.pcg_unique_32_xsh_rr_16_random_r( var rng:T_pcg_state_32 ) :Int16u;
var
   oldstate :Int32u;
begin
     oldstate := rng.state;
     pcg_unique_32_step_r( rng );
     Result := pcg_output_xsh_rr_32_16( oldstate );
end;

class function TRandom32PCG<_TSeed_>.pcg_unique_32_xsh_rr_16_boundedrand_r( var rng:T_pcg_state_32; bound:Int16u ) :Int16u;
var
   threshold, r :Int16u;
begin
     threshold := Int16u( -bound ) mod bound;

     repeat
           r := pcg_unique_32_xsh_rr_16_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//------------------------------------------------------------------------------

class function TRandom32PCG<_TSeed_>.pcg_setseq_32_xsh_rr_16_random_r( var rng:T_pcg_state_setseq_32 ) :Int16u;
var
   oldstate :Int32u;
begin
     oldstate := rng.state;
     pcg_setseq_32_step_r( rng );
     Result := pcg_output_xsh_rr_32_16( oldstate );
end;

class function TRandom32PCG<_TSeed_>.pcg_setseq_32_xsh_rr_16_boundedrand_r( var rng:T_pcg_state_setseq_32; bound:Int16u ) :Int16u;
var
   threshold, r :Int16u;
begin
     threshold := Int16u( -bound ) mod bound;

     repeat
           r := pcg_setseq_32_xsh_rr_16_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//------------------------------------------------------------------------------

class function TRandom32PCG<_TSeed_>.pcg_mcg_32_xsh_rr_16_random_r( var rng:T_pcg_state_32 ) :Int16u;
var
   oldstate :Int32u;
begin
     oldstate := rng.state;
     pcg_mcg_32_step_r( rng );
     Result := pcg_output_xsh_rr_32_16( oldstate );
end;

class function TRandom32PCG<_TSeed_>.pcg_mcg_32_xsh_rr_16_boundedrand_r( var rng:T_pcg_state_32; bound:Int16u ) :Int16u;
var
   threshold, r :Int16u;
begin
     threshold := Int16u( -bound ) mod bound;

     repeat
           r := pcg_mcg_32_xsh_rr_16_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//-------------------------------------------- Generation functions for RXS M XS

class function TRandom32PCG<_TSeed_>.pcg_oneseq_32_rxs_m_xs_32_random_r( var rng:T_pcg_state_32 ) :Int32u;
var
   oldstate :Int32u;
begin
     oldstate := rng.state;
     pcg_oneseq_32_step_r( rng );
     Result := pcg_output_rxs_m_xs_32_32( oldstate );
end;

class function TRandom32PCG<_TSeed_>.pcg_oneseq_32_rxs_m_xs_32_boundedrand_r( var rng:T_pcg_state_32; bound:Int32u ) :Int32u;
var
   threshold, r :Int32u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_oneseq_32_rxs_m_xs_32_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//------------------------------------------------------------------------------

class function TRandom32PCG<_TSeed_>.pcg_unique_32_rxs_m_xs_32_random_r( var rng:T_pcg_state_32 ) :Int32u;
var
   oldstate :Int32u;
begin
     oldstate := rng.state;
     pcg_unique_32_step_r( rng );
     Result := pcg_output_rxs_m_xs_32_32( oldstate );
end;

class function TRandom32PCG<_TSeed_>.pcg_unique_32_rxs_m_xs_32_boundedrand_r( var rng:T_pcg_state_32; bound:Int32u ) :Int32u;
var
   threshold, r :Int32u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_unique_32_rxs_m_xs_32_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//------------------------------------------------------------------------------

class function TRandom32PCG<_TSeed_>.pcg_setseq_32_rxs_m_xs_32_random_r( var rng:T_pcg_state_setseq_32 ) :Int32u;
var
   oldstate :Int32u;
begin
     oldstate := rng.state;
     pcg_setseq_32_step_r( rng );
     Result := pcg_output_rxs_m_xs_32_32( oldstate );
end;

class function TRandom32PCG<_TSeed_>.pcg_setseq_32_rxs_m_xs_32_boundedrand_r( var rng:T_pcg_state_setseq_32; bound:Int32u ) :Int32u;
var
   threshold, r :Int32u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_setseq_32_rxs_m_xs_32_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//---------------------------------------------- Generation functions for XSL RR

//------------------------------------------- Generation functions for XSL RR RR

/////////////////////////////////////////////////////////////////////// random_r

class function TRandom32PCG<_TSeed_>.pcg32_random_r( var rng:T_pcg_state_setseq_64 ) :Int32u;
begin
     Result := TRandom64PCG<_TSeed_>.pcg_setseq_64_xsh_rr_32_random_r( rng );
end;

class function TRandom32PCG<_TSeed_>.pcg32s_random_r( var rng:T_pcg_state_64 ) :Int32u;
begin
     Result := TRandom64PCG<_TSeed_>.pcg_oneseq_64_xsh_rr_32_random_r( rng );
end;

class function TRandom32PCG<_TSeed_>.pcg32u_random_r( var rng:T_pcg_state_64 ) :Int32u;
begin
     Result := TRandom64PCG<_TSeed_>.pcg_unique_64_xsh_rr_32_random_r( rng );
end;

class function TRandom32PCG<_TSeed_>.pcg32f_random_r( var rng:T_pcg_state_64 ) :Int32u;
begin
     Result := TRandom64PCG<_TSeed_>.pcg_mcg_64_xsh_rs_32_random_r( rng );
end;

class function TRandom32PCG<_TSeed_>.pcg32si_random_r( var rng:T_pcg_state_32 ) :Int32u;
begin
     Result := pcg_oneseq_32_rxs_m_xs_32_random_r( rng );
end;

class function TRandom32PCG<_TSeed_>.pcg32i_random_r( var rng:T_pcg_state_setseq_32 ) :Int32u;
begin
     Result := pcg_setseq_32_rxs_m_xs_32_random_r( rng );
end;

////////////////////////////////////////////////////////////////// boundedrand_r

class function TRandom32PCG<_TSeed_>.pcg32_boundedrand_r( var rng:T_pcg_state_setseq_64; bound:Int32u ) :Int32u;
begin
     Result := TRandom64PCG<_TSeed_>.pcg_setseq_64_xsh_rr_32_boundedrand_r( rng, bound );
end;

class function TRandom32PCG<_TSeed_>.pcg32s_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u;
begin
     Result := TRandom64PCG<_TSeed_>.pcg_oneseq_64_xsh_rr_32_boundedrand_r( rng, bound );
end;

class function TRandom32PCG<_TSeed_>.pcg32u_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u;
begin
     Result := TRandom64PCG<_TSeed_>.pcg_unique_64_xsh_rr_32_boundedrand_r( rng, bound );
end;

class function TRandom32PCG<_TSeed_>.pcg32f_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u;
begin
     Result := TRandom64PCG<_TSeed_>.pcg_mcg_64_xsh_rs_32_boundedrand_r( rng, bound );
end;

class function TRandom32PCG<_TSeed_>.pcg32si_boundedrand_r( var rng:T_pcg_state_32; bound:Int32u ) :Int32u;
begin
     Result := pcg_oneseq_32_rxs_m_xs_32_boundedrand_r( rng, bound );
end;

class function TRandom32PCG<_TSeed_>.pcg32i_boundedrand_r( var rng:T_pcg_state_setseq_32; bound:Int32u ) :Int32u;
begin
     Result := pcg_setseq_32_rxs_m_xs_32_boundedrand_r( rng, bound );
end;

////////////////////////////////////////////////////////////////////// srandom_r

class procedure TRandom32PCG<_TSeed_>.pcg32_srandom_r( var rng:T_pcg_state_setseq_64; initstate:Int64u; initseq:Int64u );
begin
     TRandom64PCG<_TSeed_>.pcg_setseq_64_srandom_r( rng, initstate, initseq );
end;

class procedure TRandom32PCG<_TSeed_>.pcg32s_srandom_r( var rng:T_pcg_state_64; initstate:Int64u );
begin
     TRandom64PCG<_TSeed_>.pcg_oneseq_64_srandom_r( rng, initstate );
end;

class procedure TRandom32PCG<_TSeed_>.pcg32u_srandom_r( var rng:T_pcg_state_64; initstate:Int64u );
begin
     TRandom64PCG<_TSeed_>.pcg_unique_64_srandom_r( rng, initstate );
end;

class procedure TRandom32PCG<_TSeed_>.pcg32f_srandom_r( var rng:T_pcg_state_64; initstate:Int64u );
begin
     TRandom64PCG<_TSeed_>.pcg_mcg_64_srandom_r( rng, initstate );
end;

class procedure TRandom32PCG<_TSeed_>.pcg32si_srandom_r( var rng:T_pcg_state_32; initstate:Int32u );
begin
     pcg_oneseq_32_srandom_r( rng, initstate );
end;

class procedure TRandom32PCG<_TSeed_>.pcg32i_srandom_r( var rng:T_pcg_state_setseq_32; initstate:Int32u; initseq:Int32u );
begin
     pcg_setseq_32_srandom_r( rng, initstate, initseq );
end;

////////////////////////////////////////////////////////////////////// advance_r

class procedure TRandom32PCG<_TSeed_>.pcg32_advance_r( var rng:T_pcg_state_setseq_64; delta:Int64u );
begin
     TRandom64PCG<_TSeed_>.pcg_setseq_64_advance_r( rng, delta );
end;

class procedure TRandom32PCG<_TSeed_>.pcg32s_advance_r( var rng:T_pcg_state_64; delta:Int64u );
begin
     TRandom64PCG<_TSeed_>.pcg_oneseq_64_advance_r( rng, delta );
end;

class procedure TRandom32PCG<_TSeed_>.pcg32u_advance_r( var rng:T_pcg_state_64; delta:Int64u );
begin
     TRandom64PCG<_TSeed_>.pcg_unique_64_advance_r( rng, delta );
end;

class procedure TRandom32PCG<_TSeed_>.pcg32f_advance_r( var rng:T_pcg_state_64; delta:Int64u );
begin
     TRandom64PCG<_TSeed_>.pcg_mcg_64_advance_r( rng, delta );
end;

class procedure TRandom32PCG<_TSeed_>.pcg32si_advance_r( var rng:T_pcg_state_32; delta:Int32u );
begin
     pcg_oneseq_32_advance_r( rng, delta );
end;

class procedure TRandom32PCG<_TSeed_>.pcg32i_advance_r( var rng:T_pcg_state_setseq_32; delta:Int32u );
begin
     pcg_setseq_32_advance_r( rng, delta );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32PCG32

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandom32PCG32.CalcNextSeed;
begin
     pcg_oneseq_32_step_r( _Seed );
end;

//------------------------------------------------------------------------------

function TRandom32PCG32.CalcRandInt32u :Int32u;
begin
     Result := pcg_output_rxs_m_xs_32_32( _Seed.state );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandom32PCG32.CreateFromRand( const Random_:IRandom );
var
   S :T_pcg_state_32;
begin
     pcg_oneseq_32_srandom_r( S, Random_.DrawRandInt32u );

     Create( S );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32PCG32x31

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandom32PCG32x31.CalcNextSeed;
begin
     pcg_setseq_32_step_r( _Seed );
end;

//------------------------------------------------------------------------------

function TRandom32PCG32x31.CalcRandInt32u :Int32u;
begin
     Result := pcg_output_rxs_m_xs_32_32( _Seed.state );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandom32PCG32x31.CreateFromRand( const Random_:IRandom );
var
   S :T_pcg_state_setseq_32;
begin
     pcg_setseq_32_srandom_r( S, Random_.DrawRandInt32u, Random_.DrawRandInt32u );

     Create( S );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
