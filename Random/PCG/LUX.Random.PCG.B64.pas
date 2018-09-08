unit LUX.Random.PCG.B64;

interface //#################################################################### ■

uses LUX,
     LUX.Random,
     LUX.Random.PCG;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% T_pcg_state_64

     (* Representations for the oneseq, mcg, and unique variants *)

     T_pcg_state_64 = record
     private
     public
       state :Int64u;
     end;

     T_pcg64si_random_t = T_pcg_state_64;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% T_pcg_state_setseq_64

     (* Representations setseq variants *)

     T_pcg_state_setseq_64 = record
     private
     public
       state :Int64u;
       inc   :Int64u;
     end;

     T_pcg64i_random_t = T_pcg_state_setseq_64;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64PCG<_TSeed_>

     { http://www.pcg-random.org/using-pcg-c.html }

     TRandom64PCG<_TSeed_:record> = class( TRandomPCG<_TSeed_> )
     private
     protected
       ///// メソッド
       function CalcRandInt08u :Int08u; override;
       function CalcRandInt16u :Int16u; override;
       function CalcRandInt32u :Int32u; override;
     public
       ///// メソッド
       // Rotate helper functions.
       class function pcg_rotr_8( value:Int08u; rot:Int32u ) :Int08u;
       class function pcg_rotr_16( value:Int16u; rot:Int32u ) :Int16u;
       class function pcg_rotr_32( value:Int32u; rot:Int32u ) :Int32u;
       class function pcg_rotr_64( value:Int64u; rot:Int32u ) :Int64u;
       // XSH RS
       class function pcg_output_xsh_rs_64_32( state:Int64u ) :Int32u;
       // XSH RR
       class function pcg_output_xsh_rr_64_32( state:Int64u ) :Int32u;
       // RXS M XS
       class function pcg_output_rxs_m_xs_64_64( state:Int64u ) :Int64u;
       // XSL RR
       class function pcg_output_xsl_rr_64_32( state:Int64u ) :Int32u;
       // XSL RR RR
       class function pcg_output_xsl_rr_rr_64_64( state:Int64u ) :Int64u;
       // Multi-step advance functions (jump-ahead, jump-back)
       class function pcg_advance_lcg_64( state,delta,cur_mult,cur_plus:Int64u ) :Int64u;
       // Functions to advance the underlying LCG
       class procedure pcg_oneseq_64_step_r( var rng:T_pcg_state_64 );
       class procedure pcg_oneseq_64_advance_r( var rng:T_pcg_state_64; delta:Int64u );
       class procedure pcg_mcg_64_step_r( var rng:T_pcg_state_64 );
       class procedure pcg_mcg_64_advance_r( var rng:T_pcg_state_64; delta:Int64u );
       class procedure pcg_unique_64_step_r( var rng:T_pcg_state_64 );
       class procedure pcg_unique_64_advance_r( var rng:T_pcg_state_64; delta:Int64u );
       class procedure pcg_setseq_64_step_r( var rng:T_pcg_state_setseq_64 );
       class procedure pcg_setseq_64_advance_r( var rng:T_pcg_state_setseq_64; delta:Int64u );
       { Functions to seed the RNG state }
       class procedure pcg_oneseq_64_srandom_r( var rng:T_pcg_state_64; initstate:Int64u );
       class procedure pcg_mcg_64_srandom_r( var rng:T_pcg_state_64; initstate:Int64u );
       class procedure pcg_unique_64_srandom_r( var rng:T_pcg_state_64; initstate:Int64u );
       class procedure pcg_setseq_64_srandom_r( var rng:T_pcg_state_setseq_64; initstate:Int64u; initseq:Int64u );
       { Generation functions for XSH RS }
       class function pcg_oneseq_64_xsh_rs_32_random_r( var rng:T_pcg_state_64 ) :Int32u;
       class function pcg_oneseq_64_xsh_rs_32_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u;
       { ----- }
       class function pcg_unique_64_xsh_rs_32_random_r( var rng:T_pcg_state_64 ) :Int32u;
       class function pcg_unique_64_xsh_rs_32_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u;
       { ----- }
       class function pcg_setseq_64_xsh_rs_32_random_r( var rng:T_pcg_state_setseq_64 ) :Int32u;
       class function pcg_setseq_64_xsh_rs_32_boundedrand_r( var rng:T_pcg_state_setseq_64; bound:Int32u ) :Int32u;
       { ----- }
       class function pcg_mcg_64_xsh_rs_32_random_r( var rng:T_pcg_state_64 ) :Int32u;
       class function pcg_mcg_64_xsh_rs_32_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u;
       { Generation functions for XSH RR }
       class function pcg_oneseq_64_xsh_rr_32_random_r( var rng:T_pcg_state_64 ) :Int32u;
       class function pcg_oneseq_64_xsh_rr_32_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u;
       { ----- }
       class function pcg_unique_64_xsh_rr_32_random_r( var rng:T_pcg_state_64 ) :Int32u;
       class function pcg_unique_64_xsh_rr_32_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u;
       { ----- }
       class function pcg_setseq_64_xsh_rr_32_random_r( var rng:T_pcg_state_setseq_64 ) :Int32u;
       class function pcg_setseq_64_xsh_rr_32_boundedrand_r( var rng:T_pcg_state_setseq_64; bound:Int32u ) :Int32u;
       { ----- }
       class function pcg_mcg_64_xsh_rr_32_random_r( var rng:T_pcg_state_64 ) :Int32u;
       class function pcg_mcg_64_xsh_rr_32_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u;
       { Generation functions for RXS M XS }
       class function pcg_oneseq_64_rxs_m_xs_64_random_r( var rng:T_pcg_state_64 ) :Int64u;
       class function pcg_oneseq_64_rxs_m_xs_64_boundedrand_r( var rng:T_pcg_state_64; bound:Int64u ) :Int64u;
       { ----- }
       class function pcg_unique_64_rxs_m_xs_64_random_r( var rng:T_pcg_state_64 ) :Int64u;
       class function pcg_unique_64_rxs_m_xs_64_boundedrand_r( var rng:T_pcg_state_64; bound:Int64u ) :Int64u;
       { ----- }
       class function pcg_setseq_64_rxs_m_xs_64_random_r( var rng:T_pcg_state_setseq_64 ) :Int64u;
       class function pcg_setseq_64_rxs_m_xs_64_boundedrand_r( var rng:T_pcg_state_setseq_64; bound:Int64u ) :Int64u;
       { Generation functions for XSL RR }
       class function pcg_oneseq_64_xsl_rr_32_random_r( var rng:T_pcg_state_64 ) :Int32u;
       class function pcg_oneseq_64_xsl_rr_32_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u;
       class function pcg_unique_64_xsl_rr_32_random_r( var rng:T_pcg_state_64 ) :Int32u;
       class function pcg_unique_64_xsl_rr_32_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u;
       class function pcg_setseq_64_xsl_rr_32_random_r( var rng:T_pcg_state_setseq_64 ) :Int32u;
       class function pcg_setseq_64_xsl_rr_32_boundedrand_r( var rng:T_pcg_state_setseq_64; bound:Int32u ) :Int32u;
       class function pcg_mcg_64_xsl_rr_32_random_r( var rng:T_pcg_state_64 ) :Int32u;
       class function pcg_mcg_64_xsl_rr_32_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u;
       { Generation functions for XSL RR RR }
       class function pcg_oneseq_64_xsl_rr_rr_64_random_r( var rng:T_pcg_state_64 ) :Int64u;
       class function pcg_oneseq_64_xsl_rr_rr_64_boundedrand_r( var rng:T_pcg_state_64; bound:Int64u ) :Int64u;
       class function pcg_unique_64_xsl_rr_rr_64_random_r( var rng:T_pcg_state_64 ) :Int64u;
       class function pcg_unique_64_xsl_rr_rr_64_boundedrand_r( var rng:T_pcg_state_64; bound:Int64u ) :Int64u;
       class function pcg_setseq_64_xsl_rr_rr_64_random_r( var rng:T_pcg_state_setseq_64 ) :Int64u;
       class function pcg_setseq_64_xsl_rr_rr_64_boundedrand_r( var rng:T_pcg_state_setseq_64; bound:Int64u ) :Int64u;
       //// random_r
       class function pcg64si_random_r( var rng:T_pcg_state_64 ) :Int64u; inline;
       class function pcg64i_random_r( var rng:T_pcg_state_setseq_64 ) :Int64u; inline;
       //// boundedrand_r
       class function pcg64si_boundedrand_r( var rng:T_pcg_state_64; bound:Int64u ) :Int64u; inline;
       class function pcg64i_boundedrand_r( var rng:T_pcg_state_setseq_64; bound:Int64u ) :Int64u; inline;
       //// srandom_r
       class procedure pcg64si_srandom_r( var rng:T_pcg_state_64; initstate:Int64u ); inline;
       class procedure pcg64i_srandom_r( var rng:T_pcg_state_setseq_64; initstate:Int64u; initseq:Int64u ); inline;
       //// advance_r
       class procedure pcg64si_advance_r( var rng:T_pcg_state_64; delta:Int64u ); inline;
       class procedure pcg64i_advance_r( var rng:T_pcg_state_setseq_64; delta:Int64u ); inline;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64PCG64

     TRandom64PCG64 = class( TRandom64PCG<T_pcg_state_64> )
     private
     protected
       ///// メソッド
       procedure CalcNextSeed; override;
       function CalcRandInt64u :Int64u; override;
     public
       constructor CreateFromRand( const Random_:IRandom ); overload; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64PCG64x63

     TRandom64PCG64x63 = class( TRandom64PCG<T_pcg_state_setseq_64> )
     private
     protected
       ///// メソッド
       procedure CalcNextSeed; override;
       function CalcRandInt64u :Int64u; override;
     public
       constructor CreateFromRand( const Random_:IRandom ); overload; override;
     end;

const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

      PCG_DEFAULT_MULTIPLIER_64 :Int64u = 6364136223846793005;
      PCG_DEFAULT_INCREMENT_64  :Int64u = 1442695040888963407;

      (*
       * Static initialization constants (if you can't call srandom for some
       * bizarre reason).
       *)

      PCG_STATE_ONESEQ_64_INITIALIZER :T_pcg_state_64        = ( state:$4d595df4d0f33173                        );
      PCG_STATE_UNIQUE_64_INITIALIZER :T_pcg_state_64        = ( state:$4d595df4d0f33173                        );  //= PCG_STATE_ONESEQ_64_INITIALIZER
      PCG_STATE_MCG_64_INITIALIZER    :T_pcg_state_64        = ( state:$cafef00dd15ea5e5                        );
      PCG_STATE_SETSEQ_64_INITIALIZER :T_pcg_state_setseq_64 = ( state:$853c49e6748fea9b; inc:$da3e39cb94b95bdb );

      PCG64SI_INITIALIZER             :T_pcg_state_64        = ( state:$4d595df4d0f33173                        );  //= PCG_STATE_ONESEQ_64_INITIALIZER
      PCG64I_INITIALIZER              :T_pcg_state_setseq_64 = ( state:$853c49e6748fea9b; inc:$da3e39cb94b95bdb );  //= PCG_STATE_SETSEQ_64_INITIALIZER

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.SysUtils;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64PCG<_TSeed_>

{ https://github.com/imneme/pcg-c }

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

function TRandom64PCG<_TSeed_>.CalcRandInt08u :Int08u;
begin
     Result := CalcRandInt16u shr 08;
end;

function TRandom64PCG<_TSeed_>.CalcRandInt16u :Int16u;
begin
     Result := CalcRandInt32u shr 16;
end;

function TRandom64PCG<_TSeed_>.CalcRandInt32u :Int32u;
begin
     Result := CalcRandInt64u shr 32;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

{ https://github.com/imneme/pcg-c/blob/master/include/pcg_variants.h }

(*
 * Rotate helper functions.
 *)

class function TRandom64PCG<_TSeed_>.pcg_rotr_8( value:Int08u; rot:Int32u ) :Int08u;
begin
     (* Unfortunately, clang is kinda pathetic when it comes to properly
      * recognizing idiomatic rotate code, so for clang we actually provide
      * assembler directives (enabled with PCG_USE_INLINE_ASM).  Boo, hiss.
      *)

     Result := ( value shr rot ) or ( value shl ( -rot and 07 ) );
end;

class function TRandom64PCG<_TSeed_>.pcg_rotr_16( value:Int16u; rot:Int32u ) :Int16u;
begin
     Result := ( value shr rot ) or ( value shl ( -rot and 15 ) );
end;

class function TRandom64PCG<_TSeed_>.pcg_rotr_32( value:Int32u; rot:Int32u ) :Int32u;
begin
     Result := ( value shr rot ) or ( value shl ( -rot and 31 ) );
end;

class function TRandom64PCG<_TSeed_>.pcg_rotr_64( value:Int64u; rot:Int32u ) :Int64u;
begin
     Result := ( value shr rot ) or ( value shl ( -rot and 63 ) );
end;

(*
 * Output functions.  These are the core of the PCG generation scheme.
 *)

// XSH RS

class function TRandom64PCG<_TSeed_>.pcg_output_xsh_rs_64_32( state:Int64u ) :Int32u;
begin
     Result := Int32u( ( ( state shr 22 ) xor state ) shr ( ( state shr 61 ) + 22 ) );
end;

// XSH RR

class function TRandom64PCG<_TSeed_>.pcg_output_xsh_rr_64_32( state:Int64u ) :Int32u;
begin
     Result := pcg_rotr_32( ( ( state shr 18 ) xor state ) shr 27, state shr 59 );
end;

// RXS M XS

class function TRandom64PCG<_TSeed_>.pcg_output_rxs_m_xs_64_64( state:Int64u ) :Int64u;
var
   word :Int64u;
begin
     word := ( ( state shr ( ( state shr 59 ) + 5 ) ) xor state ) * 12605985483714917081;

     Result := ( word shr 43 ) xor word;
end;

// XSL RR (only defined for >= 64 bits)

class function TRandom64PCG<_TSeed_>.pcg_output_xsl_rr_64_32( state:Int64u ) :Int32u;
begin
     Result := pcg_rotr_32( ( Int32u( state shr 32 ) ) xor Int32u( state ), state shr 59 );
end;

// XSL RR RR (only defined for >= 64 bits)

class function TRandom64PCG<_TSeed_>.pcg_output_xsl_rr_rr_64_64( state:Int64u ) :Int64u;
var
   rot1, high, low, xored, newlow, newhigh :Int32u;
begin
     rot1    := Int32u( state shr 59 );
     high    := Int32u( state shr 32 );
     low     := Int32u( state        );

     xored   := high xor low;
     newlow  := pcg_rotr_32( xored, rot1 );
     newhigh := pcg_rotr_32( high, newlow and 31 );

     Result := ( Int64u( newhigh ) shl 32 ) or newlow;
end;

(* Multi-step advance functions (jump-ahead, jump-back) *)

{ https://github.com/imneme/pcg-c/blob/master/src/pcg-advance-64.c }

class function TRandom64PCG<_TSeed_>.pcg_advance_lcg_64( state,delta,cur_mult,cur_plus:Int64u ) :Int64u;
var
   acc_mult, acc_plus :Int64u;
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

class procedure TRandom64PCG<_TSeed_>.pcg_oneseq_64_step_r( var rng:T_pcg_state_64 );
begin
     rng.state := rng.state * PCG_DEFAULT_MULTIPLIER_64 + PCG_DEFAULT_INCREMENT_64;
end;

class procedure TRandom64PCG<_TSeed_>.pcg_oneseq_64_advance_r( var rng:T_pcg_state_64; delta:Int64u );
begin
     rng.state := pcg_advance_lcg_64( rng.state, delta, PCG_DEFAULT_MULTIPLIER_64, PCG_DEFAULT_INCREMENT_64 );
end;

class procedure TRandom64PCG<_TSeed_>.pcg_mcg_64_step_r( var rng:T_pcg_state_64 );
begin
     rng.state := rng.state * PCG_DEFAULT_MULTIPLIER_64;
end;

class procedure TRandom64PCG<_TSeed_>.pcg_mcg_64_advance_r( var rng:T_pcg_state_64; delta:Int64u );
begin
     rng.state := pcg_advance_lcg_64( rng.state, delta, PCG_DEFAULT_MULTIPLIER_64, 0 );
end;

class procedure TRandom64PCG<_TSeed_>.pcg_unique_64_step_r( var rng:T_pcg_state_64 );
begin
     rng.state := rng.state * PCG_DEFAULT_MULTIPLIER_64 + Int64u( IntPtr( @rng ) or 1 );
end;

class procedure TRandom64PCG<_TSeed_>.pcg_unique_64_advance_r( var rng:T_pcg_state_64; delta:Int64u );
begin
     rng.state := pcg_advance_lcg_64( rng.state, delta, PCG_DEFAULT_MULTIPLIER_64, Int64u( IntPtr( @rng ) or 1 ) );
end;

class procedure TRandom64PCG<_TSeed_>.pcg_setseq_64_step_r( var rng:T_pcg_state_setseq_64 );
begin
     rng.state := rng.state * PCG_DEFAULT_MULTIPLIER_64 + rng.inc;
end;

class procedure TRandom64PCG<_TSeed_>.pcg_setseq_64_advance_r( var rng:T_pcg_state_setseq_64; delta:Int64u );
begin
     rng.state := pcg_advance_lcg_64( rng.state, delta, PCG_DEFAULT_MULTIPLIER_64, rng.inc );
end;

(* Functions to seed the RNG state, one version for each size and each
 * style.  Unlike the step functions, regular users can and should call
 * these functions.
 *)

class procedure TRandom64PCG<_TSeed_>.pcg_oneseq_64_srandom_r( var rng:T_pcg_state_64; initstate:Int64u );
begin
     rng.state := 0;
     pcg_oneseq_64_step_r( rng );
     rng.state := rng.state + initstate;
     pcg_oneseq_64_step_r( rng );
end;

class procedure TRandom64PCG<_TSeed_>.pcg_mcg_64_srandom_r( var rng:T_pcg_state_64; initstate:Int64u );
begin
     rng.state := initstate or 1;
end;

class procedure TRandom64PCG<_TSeed_>.pcg_unique_64_srandom_r( var rng:T_pcg_state_64; initstate:Int64u );
begin
     rng.state := 0;
     pcg_unique_64_step_r( rng );
     rng.state := rng.state + initstate;
     pcg_unique_64_step_r( rng );
end;

class procedure TRandom64PCG<_TSeed_>.pcg_setseq_64_srandom_r( var rng:T_pcg_state_setseq_64; initstate:Int64u; initseq:Int64u );
begin
     rng.state := 0;
     rng.inc := ( initseq shl 1 ) or 1;
     pcg_setseq_64_step_r( rng );
     rng.state := rng.state + initstate;
     pcg_setseq_64_step_r( rng );
end;

(* Generation functions for XSH RS *)

class function TRandom64PCG<_TSeed_>.pcg_oneseq_64_xsh_rs_32_random_r( var rng:T_pcg_state_64 ) :Int32u;
var
   oldstate :Int64u;
begin
     oldstate := rng.state;
     pcg_oneseq_64_step_r( rng );
     Result := pcg_output_xsh_rs_64_32( oldstate );
end;

class function TRandom64PCG<_TSeed_>.pcg_oneseq_64_xsh_rs_32_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u;
var
   threshold, r :Int32u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_oneseq_64_xsh_rs_32_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//------------------------------------------------------------------------------

class function TRandom64PCG<_TSeed_>.pcg_unique_64_xsh_rs_32_random_r( var rng:T_pcg_state_64 ) :Int32u;
var
   oldstate :Int64u;
begin
     oldstate := rng.state;
     pcg_unique_64_step_r( rng );
     Result := pcg_output_xsh_rs_64_32( oldstate );
end;

class function TRandom64PCG<_TSeed_>.pcg_unique_64_xsh_rs_32_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u;
var
   threshold, r :Int32u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_unique_64_xsh_rs_32_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//------------------------------------------------------------------------------

class function TRandom64PCG<_TSeed_>.pcg_setseq_64_xsh_rs_32_random_r( var rng:T_pcg_state_setseq_64 ) :Int32u;
var
   oldstate :Int64u;
begin
     oldstate := rng.state;
     pcg_setseq_64_step_r( rng );
     Result := pcg_output_xsh_rs_64_32( oldstate );
end;

class function TRandom64PCG<_TSeed_>.pcg_setseq_64_xsh_rs_32_boundedrand_r( var rng:T_pcg_state_setseq_64; bound:Int32u ) :Int32u;
var
   threshold, r :Int32u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_setseq_64_xsh_rs_32_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//------------------------------------------------------------------------------

class function TRandom64PCG<_TSeed_>.pcg_mcg_64_xsh_rs_32_random_r( var rng:T_pcg_state_64 ) :Int32u;
var
   oldstate :Int64u;
begin
     oldstate := rng.state;
     pcg_mcg_64_step_r( rng );
     Result := pcg_output_xsh_rs_64_32( oldstate );
end;

class function TRandom64PCG<_TSeed_>.pcg_mcg_64_xsh_rs_32_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u;
var
   threshold, r :Int32u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_mcg_64_xsh_rs_32_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//---------------------------------------------- Generation functions for XSH RR

class function TRandom64PCG<_TSeed_>.pcg_oneseq_64_xsh_rr_32_random_r( var rng:T_pcg_state_64 ) :Int32u;
var
   oldstate :Int64u;
begin
     oldstate := rng.state;
     pcg_oneseq_64_step_r( rng );
     Result := pcg_output_xsh_rr_64_32( oldstate );
end;

class function TRandom64PCG<_TSeed_>.pcg_oneseq_64_xsh_rr_32_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u;
var
   threshold, r :Int32u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_oneseq_64_xsh_rr_32_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//------------------------------------------------------------------------------

class function TRandom64PCG<_TSeed_>.pcg_unique_64_xsh_rr_32_random_r( var rng:T_pcg_state_64 ) :Int32u;
var
   oldstate :Int64u;
begin
     oldstate := rng.state;
     pcg_unique_64_step_r( rng );
     Result := pcg_output_xsh_rr_64_32( oldstate );
end;

class function TRandom64PCG<_TSeed_>.pcg_unique_64_xsh_rr_32_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u;
var
   threshold, r :Int32u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_unique_64_xsh_rr_32_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//------------------------------------------------------------------------------

class function TRandom64PCG<_TSeed_>.pcg_setseq_64_xsh_rr_32_random_r( var rng:T_pcg_state_setseq_64 ) :Int32u;
var
   oldstate :Int64u;
begin
     oldstate := rng.state;
     pcg_setseq_64_step_r( rng );
     Result := pcg_output_xsh_rr_64_32( oldstate );
end;

class function TRandom64PCG<_TSeed_>.pcg_setseq_64_xsh_rr_32_boundedrand_r( var rng:T_pcg_state_setseq_64; bound:Int32u ) :Int32u;
var
   threshold, r :Int32u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_setseq_64_xsh_rr_32_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//------------------------------------------------------------------------------

class function TRandom64PCG<_TSeed_>.pcg_mcg_64_xsh_rr_32_random_r( var rng:T_pcg_state_64 ) :Int32u;
var
   oldstate :Int64u;
begin
     oldstate := rng.state;
     pcg_mcg_64_step_r( rng );
     Result := pcg_output_xsh_rr_64_32( oldstate );
end;

class function TRandom64PCG<_TSeed_>.pcg_mcg_64_xsh_rr_32_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u;
var
   threshold, r :Int32u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_mcg_64_xsh_rr_32_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//-------------------------------------------- Generation functions for RXS M XS

class function TRandom64PCG<_TSeed_>.pcg_oneseq_64_rxs_m_xs_64_random_r( var rng:T_pcg_state_64 ) :Int64u;
var
   oldstate :Int64u;
begin
     oldstate := rng.state;
     pcg_oneseq_64_step_r( rng );
     Result := pcg_output_rxs_m_xs_64_64( oldstate );
end;

class function TRandom64PCG<_TSeed_>.pcg_oneseq_64_rxs_m_xs_64_boundedrand_r( var rng:T_pcg_state_64; bound:Int64u ) :Int64u;
var
   threshold, r :Int64u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_oneseq_64_rxs_m_xs_64_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//------------------------------------------------------------------------------

class function TRandom64PCG<_TSeed_>.pcg_unique_64_rxs_m_xs_64_random_r( var rng:T_pcg_state_64 ) :Int64u;
var
   oldstate :Int64u;
begin
     oldstate := rng.state;
     pcg_unique_64_step_r( rng );
     Result := pcg_output_rxs_m_xs_64_64( oldstate );
end;

class function TRandom64PCG<_TSeed_>.pcg_unique_64_rxs_m_xs_64_boundedrand_r( var rng:T_pcg_state_64; bound:Int64u ) :Int64u;
var
   threshold, r :Int64u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_unique_64_rxs_m_xs_64_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//------------------------------------------------------------------------------

class function TRandom64PCG<_TSeed_>.pcg_setseq_64_rxs_m_xs_64_random_r( var rng:T_pcg_state_setseq_64 ) :Int64u;
var
   oldstate :Int64u;
begin
     oldstate := rng.state;
     pcg_setseq_64_step_r( rng );
     Result := pcg_output_rxs_m_xs_64_64( oldstate );
end;

class function TRandom64PCG<_TSeed_>.pcg_setseq_64_rxs_m_xs_64_boundedrand_r( var rng:T_pcg_state_setseq_64; bound:Int64u ) :Int64u;
var
   threshold, r :Int64u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_setseq_64_rxs_m_xs_64_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//---------------------------------------------- Generation functions for XSL RR

class function TRandom64PCG<_TSeed_>.pcg_oneseq_64_xsl_rr_32_random_r( var rng:T_pcg_state_64 ) :Int32u;
var
   oldstate :Int64u;
begin
     oldstate := rng.state;
     pcg_oneseq_64_step_r( rng );
     Result := pcg_output_xsl_rr_64_32( oldstate );
end;

class function TRandom64PCG<_TSeed_>.pcg_oneseq_64_xsl_rr_32_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u;
var
   threshold, r :Int32u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_oneseq_64_xsl_rr_32_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

class function TRandom64PCG<_TSeed_>.pcg_unique_64_xsl_rr_32_random_r( var rng:T_pcg_state_64 ) :Int32u;
var
   oldstate :Int64u;
begin
     oldstate := rng.state;
     pcg_unique_64_step_r( rng );
     Result := pcg_output_xsl_rr_64_32( oldstate );
end;

class function TRandom64PCG<_TSeed_>.pcg_unique_64_xsl_rr_32_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u;
var
   threshold, r :Int32u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_unique_64_xsl_rr_32_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

class function TRandom64PCG<_TSeed_>.pcg_setseq_64_xsl_rr_32_random_r( var rng:T_pcg_state_setseq_64 ) :Int32u;
var
   oldstate :Int64u;
begin
     oldstate := rng.state;
     pcg_setseq_64_step_r( rng );
     Result := pcg_output_xsl_rr_64_32( oldstate );
end;

class function TRandom64PCG<_TSeed_>.pcg_setseq_64_xsl_rr_32_boundedrand_r( var rng:T_pcg_state_setseq_64; bound:Int32u ) :Int32u;
var
   threshold, r :Int32u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_setseq_64_xsl_rr_32_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

class function TRandom64PCG<_TSeed_>.pcg_mcg_64_xsl_rr_32_random_r( var rng:T_pcg_state_64 ) :Int32u;
var
   oldstate :Int64u;
begin
     oldstate := rng.state;
     pcg_mcg_64_step_r( rng );
     Result := pcg_output_xsl_rr_64_32( oldstate );
end;

class function TRandom64PCG<_TSeed_>.pcg_mcg_64_xsl_rr_32_boundedrand_r( var rng:T_pcg_state_64; bound:Int32u ) :Int32u;
var
   threshold, r :Int32u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_mcg_64_xsl_rr_32_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//------------------------------------------- Generation functions for XSL RR RR

class function TRandom64PCG<_TSeed_>.pcg_oneseq_64_xsl_rr_rr_64_random_r( var rng:T_pcg_state_64 ) :Int64u;
var
   oldstate :Int64u;
begin
     oldstate := rng.state;
     pcg_oneseq_64_step_r( rng );
     Result := pcg_output_xsl_rr_rr_64_64( oldstate );
end;

class function TRandom64PCG<_TSeed_>.pcg_oneseq_64_xsl_rr_rr_64_boundedrand_r( var rng:T_pcg_state_64; bound:Int64u ) :Int64u;
var
   threshold, r :Int64u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_oneseq_64_xsl_rr_rr_64_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

class function TRandom64PCG<_TSeed_>.pcg_unique_64_xsl_rr_rr_64_random_r( var rng:T_pcg_state_64 ) :Int64u;
var
   oldstate :Int64u;
begin
     oldstate := rng.state;
     pcg_unique_64_step_r( rng );
     Result := pcg_output_xsl_rr_rr_64_64( oldstate );
end;

class function TRandom64PCG<_TSeed_>.pcg_unique_64_xsl_rr_rr_64_boundedrand_r( var rng:T_pcg_state_64; bound:Int64u ) :Int64u;
var
   threshold, r :Int64u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_unique_64_xsl_rr_rr_64_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

class function TRandom64PCG<_TSeed_>.pcg_setseq_64_xsl_rr_rr_64_random_r( var rng:T_pcg_state_setseq_64 ) :Int64u;
var
   oldstate :Int64u;
begin
     oldstate := rng.state;
     pcg_setseq_64_step_r( rng );
     Result := pcg_output_xsl_rr_rr_64_64( oldstate );
end;

class function TRandom64PCG<_TSeed_>.pcg_setseq_64_xsl_rr_rr_64_boundedrand_r( var rng:T_pcg_state_setseq_64; bound:Int64u ) :Int64u;
var
   threshold, r :Int64u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg_setseq_64_xsl_rr_rr_64_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

/////////////////////////////////////////////////////////////////////// random_r

class function TRandom64PCG<_TSeed_>.pcg64si_random_r( var rng:T_pcg_state_64 ) :Int64u;
begin
     Result := pcg_oneseq_64_rxs_m_xs_64_random_r( rng );
end;

class function TRandom64PCG<_TSeed_>.pcg64i_random_r( var rng:T_pcg_state_setseq_64 ) :Int64u;
begin
     Result := pcg_setseq_64_rxs_m_xs_64_random_r( rng );
end;

////////////////////////////////////////////////////////////////// boundedrand_r

class function TRandom64PCG<_TSeed_>.pcg64si_boundedrand_r( var rng:T_pcg_state_64; bound:Int64u ) :Int64u;
begin
     Result := pcg_oneseq_64_rxs_m_xs_64_boundedrand_r( rng, bound );
end;

class function TRandom64PCG<_TSeed_>.pcg64i_boundedrand_r( var rng:T_pcg_state_setseq_64; bound:Int64u ) :Int64u;
begin
     Result := pcg_setseq_64_rxs_m_xs_64_boundedrand_r( rng, bound );
end;

////////////////////////////////////////////////////////////////////// srandom_r

class procedure TRandom64PCG<_TSeed_>.pcg64si_srandom_r( var rng:T_pcg_state_64; initstate:Int64u );
begin
     pcg_oneseq_64_srandom_r( rng, initstate );
end;

class procedure TRandom64PCG<_TSeed_>.pcg64i_srandom_r( var rng:T_pcg_state_setseq_64; initstate:Int64u; initseq:Int64u );
begin
     pcg_setseq_64_srandom_r( rng, initstate, initseq );
end;

////////////////////////////////////////////////////////////////////// advance_r

class procedure TRandom64PCG<_TSeed_>.pcg64si_advance_r( var rng:T_pcg_state_64; delta:Int64u );
begin
     pcg_oneseq_64_advance_r( rng, delta );
end;

class procedure TRandom64PCG<_TSeed_>.pcg64i_advance_r( var rng:T_pcg_state_setseq_64; delta:Int64u );
begin
     pcg_setseq_64_advance_r( rng, delta );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64PCG64

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandom64PCG64.CalcNextSeed;
begin
     pcg_oneseq_64_step_r( _Seed );
end;

//------------------------------------------------------------------------------

function TRandom64PCG64.CalcRandInt64u :Int64u;
begin
     Result := pcg_output_rxs_m_xs_64_64( _Seed.state );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandom64PCG64.CreateFromRand( const Random_:IRandom );
var
   S :T_pcg_state_64;
begin
     pcg_oneseq_64_srandom_r( S, Random_.DrawRandInt64u );

     Create( S );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64PCG64x63

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandom64PCG64x63.CalcNextSeed;
begin
     pcg_setseq_64_step_r( _Seed );
end;

//------------------------------------------------------------------------------

function TRandom64PCG64x63.CalcRandInt64u :Int64u;
begin
     Result := pcg_output_rxs_m_xs_64_64( _Seed.state );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandom64PCG64x63.CreateFromRand( const Random_:IRandom );
var
   S :T_pcg_state_setseq_64;
begin
     pcg_setseq_64_srandom_r( S, Random_.DrawRandInt64u, Random_.DrawRandInt64u );

     Create( S );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
