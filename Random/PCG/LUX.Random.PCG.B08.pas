unit LUX.Random.PCG.B08;

interface //#################################################################### ■

uses LUX, LUX.D3, LUX.D4,
     LUX.Random,
     LUX.Random.PCG;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% T_pcg_state_8

     (* Representations for the oneseq, mcg, and unique variants *)

     T_pcg_state_8 = record
     private
     public
       state :Int08u;
     end;

     T_pcg8si_random_t  = T_pcg_state_8;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% T_pcg_state_setseq_8

     (* Representations setseq variants *)

     T_pcg_state_setseq_8 = record
     private
     public
       state :Int08u;
       inc   :Int08u;
     end;

     T_pcg8i_random_t = T_pcg_state_setseq_8;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom08PCG<_TSeed_>

     { http://www.pcg-random.org/using-pcg-c.html }

     TRandom08PCG<_TSeed_:record> = class( TRandomPCG<_TSeed_> )
     private
     protected
       ///// メソッド
       function CalcRandInt16u :Int16u; override;
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
       // XSH RR
       // RXS M XS
       class function pcg_output_rxs_m_xs_8_8( state:Int08u ) :Int08u;
       // XSL RR
       // XSL RR RR
       // Multi-step advance functions (jump-ahead, jump-back)
       class function pcg_advance_lcg_8( state,delta,cur_mult,cur_plus:Int08u ) :Int08u;
       // Functions to advance the underlying LCG
       class procedure pcg_oneseq_8_step_r( var rng:T_pcg_state_8 );
       class procedure pcg_oneseq_8_advance_r( var rng:T_pcg_state_8; delta:Int08u );
       class procedure pcg_mcg_8_step_r( var rng:T_pcg_state_8 );
       class procedure pcg_mcg_8_advance_r( var rng:T_pcg_state_8; delta:Int08u );
       class procedure pcg_unique_8_step_r( var rng:T_pcg_state_8 );
       class procedure pcg_unique_8_advance_r( var rng:T_pcg_state_8; delta:Int08u );
       class procedure pcg_setseq_8_step_r( var rng:T_pcg_state_setseq_8 );
       class procedure pcg_setseq_8_advance_r( var rng:T_pcg_state_setseq_8; delta:Int08u );
       { Functions to seed the RNG state }
       class procedure pcg_oneseq_8_srandom_r( var rng:T_pcg_state_8; initstate:Int08u );
       class procedure pcg_mcg_8_srandom_r( var rng:T_pcg_state_8; initstate:Int08u );
       class procedure pcg_unique_8_srandom_r( var rng:T_pcg_state_8; initstate:Int08u );
       class procedure pcg_setseq_8_srandom_r( var rng:T_pcg_state_setseq_8; initstate:Int08u; initseq:Int08u );
       { Generation functions for XSH RS }
       { Generation functions for XSH RR }
       { Generation functions for RXS M XS }
       class function pcg_oneseq_8_rxs_m_xs_8_random_r( var rng:T_pcg_state_8 ) :Int08u;
       class function pcg_oneseq_8_rxs_m_xs_8_boundedrand_r( var rng:T_pcg_state_8; bound:Int08u ) :Int08u;
       class function pcg_setseq_8_rxs_m_xs_8_random_r( var rng:T_pcg_state_setseq_8 ) :Int08u;
       class function pcg_setseq_8_rxs_m_xs_8_boundedrand_r( var rng:T_pcg_state_setseq_8; bound:Int08u ) :Int08u;
       { Generation functions for XSL RR }
       { Generation functions for XSL RR RR }
       //// random_r
       class function pcg8si_random_r( var rng:T_pcg_state_8 ) :Int08u; inline;
       class function pcg8i_random_r( var rng:T_pcg_state_setseq_8 ) :Int08u; inline;
       //// boundedrand_r
       class function pcg8si_boundedrand_r( var rng:T_pcg_state_8; bound:Int08u ) :Int08u; inline;
       class function pcg8i_boundedrand_r( var rng:T_pcg_state_setseq_8; bound:Int08u ) :Int08u; inline;
       //// srandom_r
       class procedure pcg8si_srandom_r( var rng:T_pcg_state_8; initstate:Int08u ); inline;
       class procedure pcg8i_srandom_r( var rng:T_pcg_state_setseq_8; initstate:Int08u; initseq:Int08u ); inline;
       //// advance_r
       class procedure pcg8si_advance_r( var rng:T_pcg_state_8; delta:Int08u ); inline;
       class procedure pcg8i_advance_r( var rng:T_pcg_state_setseq_8; delta:Int08u ); inline;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom08PCG08

     TRandom08PCG08 = class( TRandom08PCG<T_pcg_state_8> )
     private
     protected
       ///// メソッド
       procedure CalcNextSeed; override;
       function CalcRandInt08u :Int08u; override;
     public
       constructor CreateFromRand( const Random_:IRandom ); overload; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom08PCG08x07

     TRandom08PCG08x07 = class( TRandom08PCG<T_pcg_state_setseq_8> )
     private
     protected
       ///// メソッド
       procedure CalcNextSeed; override;
       function CalcRandInt08u :Int08u; override;
     public
       constructor CreateFromRand( const Random_:IRandom ); overload; override;
     end;

const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

      PCG_DEFAULT_MULTIPLIER_8  :Int08u = 141;
      PCG_DEFAULT_INCREMENT_8   :Int08u = 77;

      (*
       * Static initialization constants (if you can't call srandom for some
       * bizarre reason).
       *)

      PCG_STATE_ONESEQ_8_INITIALIZER  :T_pcg_state_8         = ( state:$d7          );
      PCG_STATE_UNIQUE_8_INITIALIZER  :T_pcg_state_8         = ( state:$d7          );  //= PCG_STATE_ONESEQ_8_INITIALIZER
      PCG_STATE_MCG_8_INITIALIZER     :T_pcg_state_8         = ( state:$e5          );
      PCG_STATE_SETSEQ_8_INITIALIZER  :T_pcg_state_setseq_8  = ( state:$9b; inc:$db );

      PCG8SI_INITIALIZER              :T_pcg_state_8         = ( state:$d7          );  //= PCG_STATE_ONESEQ_8_INITIALIZER
      PCG8I_INITIALIZER               :T_pcg_state_setseq_8  = ( state:$9b; inc:$db );  //= PCG_STATE_SETSEQ_8_INITIALIZER

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.SysUtils;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom08PCG<_TSeed_>

{ https://github.com/imneme/pcg-c }

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

function TRandom08PCG<_TSeed_>.CalcRandInt16u :Int16u;
begin
     Result := Int16u( CalcRandInt08u ) shl 08 or CalcRandInt08u;
end;

function TRandom08PCG<_TSeed_>.CalcRandInt32u :Int32u;
begin
     Result := Int32u( CalcRandInt16u ) shl 16 or CalcRandInt16u;
end;

function TRandom08PCG<_TSeed_>.CalcRandInt64u :Int64u;
begin
     Result := Int64u( CalcRandInt32u ) shl 32 or CalcRandInt32u;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

{ https://github.com/imneme/pcg-c/blob/master/include/pcg_variants.h }

(*
 * Rotate helper functions.
 *)

class function TRandom08PCG<_TSeed_>.pcg_rotr_8( value:Int08u; rot:Int32u ) :Int08u;
begin
     (* Unfortunately, clang is kinda pathetic when it comes to properly
      * recognizing idiomatic rotate code, so for clang we actually provide
      * assembler directives (enabled with PCG_USE_INLINE_ASM).  Boo, hiss.
      *)

     Result := ( value shr rot ) or ( value shl ( -rot and 07 ) );
end;

class function TRandom08PCG<_TSeed_>.pcg_rotr_16( value:Int16u; rot:Int32u ) :Int16u;
begin
     Result := ( value shr rot ) or ( value shl ( -rot and 15 ) );
end;

class function TRandom08PCG<_TSeed_>.pcg_rotr_32( value:Int32u; rot:Int32u ) :Int32u;
begin
     Result := ( value shr rot ) or ( value shl ( -rot and 31 ) );
end;

class function TRandom08PCG<_TSeed_>.pcg_rotr_64( value:Int64u; rot:Int32u ) :Int64u;
begin
     Result := ( value shr rot ) or ( value shl ( -rot and 63 ) );
end;

(*
 * Output functions.  These are the core of the PCG generation scheme.
 *)

// XSH RS

// XSH RR

// RXS M XS

class function TRandom08PCG<_TSeed_>.pcg_output_rxs_m_xs_8_8( state:Int08u ) :Int08u;
var
   word :Int08u;
begin
     word := ( ( state shr ( ( state shr 06 ) + 2 ) ) xor state ) * 217;

     Result := ( word shr 06 ) xor word;
end;

// XSL RR (only defined for >= 64 bits)

// XSL RR RR (only defined for >= 64 bits)

(* Multi-step advance functions (jump-ahead, jump-back) *)

{ https://github.com/imneme/pcg-c/blob/master/src/pcg-advance-8.c }

class function TRandom08PCG<_TSeed_>.pcg_advance_lcg_8( state,delta,cur_mult,cur_plus:Int08u ) :Int08u;
var
   acc_mult, acc_plus :Int08u;
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

class procedure TRandom08PCG<_TSeed_>.pcg_oneseq_8_step_r( var rng:T_pcg_state_8 );
begin
     rng.state := rng.state * PCG_DEFAULT_MULTIPLIER_8 + PCG_DEFAULT_INCREMENT_8;
end;

class procedure TRandom08PCG<_TSeed_>.pcg_oneseq_8_advance_r( var rng:T_pcg_state_8; delta:Int08u );
begin
     rng.state := pcg_advance_lcg_8( rng.state, delta, PCG_DEFAULT_MULTIPLIER_8, PCG_DEFAULT_INCREMENT_8 );
end;

class procedure TRandom08PCG<_TSeed_>.pcg_mcg_8_step_r( var rng:T_pcg_state_8 );
begin
     rng.state := rng.state * PCG_DEFAULT_MULTIPLIER_8;
end;

class procedure TRandom08PCG<_TSeed_>.pcg_mcg_8_advance_r( var rng:T_pcg_state_8; delta:Int08u );
begin
     rng.state := pcg_advance_lcg_8( rng.state, delta, PCG_DEFAULT_MULTIPLIER_8, 0 );
end;

class procedure TRandom08PCG<_TSeed_>.pcg_unique_8_step_r( var rng:T_pcg_state_8 );
begin
     rng.state := rng.state * PCG_DEFAULT_MULTIPLIER_8 + Int08u( IntPtr( @rng ) or 1 );
end;

class procedure TRandom08PCG<_TSeed_>.pcg_unique_8_advance_r( var rng:T_pcg_state_8; delta:Int08u );
begin
     rng.state := pcg_advance_lcg_8( rng.state, delta, PCG_DEFAULT_MULTIPLIER_8, Int08u( IntPtr( @rng ) or 1 ) );
end;

class procedure TRandom08PCG<_TSeed_>.pcg_setseq_8_step_r( var rng:T_pcg_state_setseq_8 );
begin
     rng.state := rng.state * PCG_DEFAULT_MULTIPLIER_8 + rng.inc;
end;

class procedure TRandom08PCG<_TSeed_>.pcg_setseq_8_advance_r( var rng:T_pcg_state_setseq_8; delta:Int08u );
begin
     rng.state := pcg_advance_lcg_8( rng.state, delta, PCG_DEFAULT_MULTIPLIER_8, rng.inc );
end;

(* Functions to seed the RNG state, one version for each size and each
 * style.  Unlike the step functions, regular users can and should call
 * these functions.
 *)

class procedure TRandom08PCG<_TSeed_>.pcg_oneseq_8_srandom_r( var rng:T_pcg_state_8; initstate:Int08u );
begin
     rng.state := 0;
     pcg_oneseq_8_step_r( rng );
     rng.state := rng.state + initstate;
     pcg_oneseq_8_step_r( rng );
end;

class procedure TRandom08PCG<_TSeed_>.pcg_mcg_8_srandom_r( var rng:T_pcg_state_8; initstate:Int08u );
begin
     rng.state := initstate or 1;
end;

class procedure TRandom08PCG<_TSeed_>.pcg_unique_8_srandom_r( var rng:T_pcg_state_8; initstate:Int08u );
begin
     rng.state := 0;
     pcg_unique_8_step_r( rng );
     rng.state := rng.state + initstate;
     pcg_unique_8_step_r( rng );
end;

class procedure TRandom08PCG<_TSeed_>.pcg_setseq_8_srandom_r( var rng:T_pcg_state_setseq_8; initstate:Int08u; initseq:Int08u );
begin
     rng.state := 0;
     rng.inc := ( initseq shl 1 ) or 1;
     pcg_setseq_8_step_r( rng );
     rng.state := rng.state + initstate;
     pcg_setseq_8_step_r( rng );
end;

//------------------------------------------------------------------------------

//------------------------------------------------------------------------------

//------------------------------------------------------------------------------

//---------------------------------------------- Generation functions for XSH RR

//------------------------------------------------------------------------------

//------------------------------------------------------------------------------

//------------------------------------------------------------------------------

//-------------------------------------------- Generation functions for RXS M XS

class function TRandom08PCG<_TSeed_>.pcg_oneseq_8_rxs_m_xs_8_random_r( var rng:T_pcg_state_8 ) :Int08u;
var
   oldstate :Int08u;
begin
     oldstate := rng.state;
     pcg_oneseq_8_step_r( rng );
     Result := pcg_output_rxs_m_xs_8_8( oldstate );
end;

class function TRandom08PCG<_TSeed_>.pcg_oneseq_8_rxs_m_xs_8_boundedrand_r( var rng:T_pcg_state_8; bound:Int08u ) :Int08u;
var
   threshold, r :Int08u;
begin
     threshold := Int08u( -bound ) mod bound;

     repeat
           r := pcg_oneseq_8_rxs_m_xs_8_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//------------------------------------------------------------------------------

//------------------------------------------------------------------------------

class function TRandom08PCG<_TSeed_>.pcg_setseq_8_rxs_m_xs_8_random_r( var rng:T_pcg_state_setseq_8 ) :Int08u;
var
   oldstate :Int08u;
begin
     oldstate := rng.state;
     pcg_setseq_8_step_r( rng );
     Result := pcg_output_rxs_m_xs_8_8( oldstate );
end;

class function TRandom08PCG<_TSeed_>.pcg_setseq_8_rxs_m_xs_8_boundedrand_r( var rng:T_pcg_state_setseq_8; bound:Int08u ) :Int08u;
var
   threshold, r :Int08u;
begin
     threshold := Int08u( -bound ) mod bound;

     repeat
           r := pcg_setseq_8_rxs_m_xs_8_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

//---------------------------------------------- Generation functions for XSL RR

//------------------------------------------- Generation functions for XSL RR RR

/////////////////////////////////////////////////////////////////////// random_r

class function TRandom08PCG<_TSeed_>.pcg8si_random_r( var rng:T_pcg_state_8 ) :Int08u;
begin
     Result := pcg_oneseq_8_rxs_m_xs_8_random_r( rng );
end;

class function TRandom08PCG<_TSeed_>.pcg8i_random_r( var rng:T_pcg_state_setseq_8 ) :Int08u;
begin
     Result := pcg_setseq_8_rxs_m_xs_8_random_r( rng );
end;

////////////////////////////////////////////////////////////////// boundedrand_r

class function TRandom08PCG<_TSeed_>.pcg8si_boundedrand_r( var rng:T_pcg_state_8; bound:Int08u ) :Int08u;
begin
     Result := pcg_oneseq_8_rxs_m_xs_8_boundedrand_r( rng, bound );
end;

class function TRandom08PCG<_TSeed_>.pcg8i_boundedrand_r( var rng:T_pcg_state_setseq_8; bound:Int08u ) :Int08u;
begin
     Result := pcg_setseq_8_rxs_m_xs_8_boundedrand_r( rng, bound );
end;

////////////////////////////////////////////////////////////////////// srandom_r

class procedure TRandom08PCG<_TSeed_>.pcg8si_srandom_r( var rng:T_pcg_state_8; initstate:Int08u );
begin
     pcg_oneseq_8_srandom_r( rng, initstate );
end;

class procedure TRandom08PCG<_TSeed_>.pcg8i_srandom_r( var rng:T_pcg_state_setseq_8; initstate:Int08u; initseq:Int08u );
begin
     pcg_setseq_8_srandom_r( rng, initstate, initseq );
end;

////////////////////////////////////////////////////////////////////// advance_r

class procedure TRandom08PCG<_TSeed_>.pcg8si_advance_r( var rng:T_pcg_state_8; delta:Int08u );
begin
     pcg_oneseq_8_advance_r( rng, delta );
end;

class procedure TRandom08PCG<_TSeed_>.pcg8i_advance_r( var rng:T_pcg_state_setseq_8; delta:Int08u );
begin
     pcg_setseq_8_advance_r( rng, delta );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom08PCG08

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandom08PCG08.CalcNextSeed;
begin
     pcg_oneseq_8_step_r( _Seed );
end;

//------------------------------------------------------------------------------

function TRandom08PCG08.CalcRandInt08u :Int08u;
begin
     Result := pcg_output_rxs_m_xs_8_8( _Seed.state );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandom08PCG08.CreateFromRand( const Random_:IRandom );
var
   S :T_pcg_state_8;
begin
     pcg_oneseq_8_srandom_r( S, Random_.DrawRandInt08u );

     Create( S );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom08PCG08x07

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandom08PCG08x07.CalcNextSeed;
begin
     pcg_setseq_8_step_r( _Seed );
end;

//------------------------------------------------------------------------------

function TRandom08PCG08x07.CalcRandInt08u :Int08u;
begin
     Result := pcg_output_rxs_m_xs_8_8( _Seed.state );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandom08PCG08x07.CreateFromRand( const Random_:IRandom );
var
   S :T_pcg_state_setseq_8;
begin
     pcg_setseq_8_srandom_r( S, Random_.DrawRandInt08u, Random_.DrawRandInt08u );

     Create( S );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
