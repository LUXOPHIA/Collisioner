unit LUX.Random.PCG;

interface //#################################################################### ■

uses LUX,
     LUX.Random;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% T_pcg32_random_t

     (* Representations setseq variants *)

     T_pcg32_random_t = record
     private
     public
       state :Int64u;
       inc   :Int64u;
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomPCG<_TSeed_>

     IRandomPCG<_TSeed_:record> = interface( IRandom<_TSeed_> )
     ['{5794CF7C-B2C7-4E22-96CE-B30A4647EAAC}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TRandomPCG<_TSeed_:record> = class( TRandom<_TSeed_>, IRandomPCG<_TSeed_> )
     private const
     private
     protected
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32PCG64basic

     { http://www.pcg-random.org/using-pcg-c-basic.html }

     TRandom32PCG64x63basic = class( TRandomPCG<T_pcg32_random_t> )
     public
     protected
       ///// メソッド
       procedure CalcNextSeed; override;
       function CalcRandInt32u :Int32u; override;
     public
       constructor CreateFromRand( const Random_:IRandom ); overload; override;
       constructor CreateFromRand( const Random_:IRandom; const Stream_:Int64u ); overload;
       ///// メソッド
       procedure pcg32_srandom_r( var rng:T_pcg32_random_t; initstate,initseq:Int64u );
       procedure pcg32_srandom( seed,seq:Int64u );
       function pcg32_random_r( var rng:T_pcg32_random_t ) :Int32u;
       function pcg32_random :Int32u;
       function pcg32_boundedrand_r( var rng:T_pcg32_random_t; bound:Int32u ) :Int32u;
       function pcg32_boundedrand( bound:Int32u ) :Int32u;
     end;

const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

      PCG32_INITIALIZER :T_pcg32_random_t = ( state:$853c49e6748fea9b;
                                              inc  :$da3e39cb94b95bdb );

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.SysUtils;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomPCG<_TSeed_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32PCG64basic

{ https://github.com/imneme/pcg-c-basic }

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandom32PCG64x63basic.CalcNextSeed;
begin
     with _Seed do state := state * Int64u( 6364136223846793005 ) + inc;
end;

function TRandom32PCG64x63basic.CalcRandInt32u :Int32u;
var
   xorshifted, rot :Int32u;
begin
     with _Seed do
     begin
          xorshifted := ( ( state shr 18 ) xor state ) shr 27;

          rot := state shr 59;
     end;

     Result := ( xorshifted shr rot ) or ( xorshifted shl ( -rot and 31 ) );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandom32PCG64x63basic.CreateFromRand( const Random_:IRandom );
begin
     CreateFromRand( Random_, Random_.DrawRandInt64u );
end;

constructor TRandom32PCG64x63basic.CreateFromRand( const Random_:IRandom; const Stream_:Int64u );
var
   S :T_pcg32_random_t;
begin
     pcg32_srandom_r( S, Random_.DrawRandInt64u, Stream_ );

     Create( S );
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandom32PCG64x63basic.pcg32_srandom_r( var rng:T_pcg32_random_t; initstate,initseq:Int64u );
begin
     rng.state := 0;
     rng.inc   := ( initseq shl 1 ) or 1;

     pcg32_random_r( rng );

     rng.state := rng.state + initstate;

     pcg32_random_r( rng );
end;

procedure TRandom32PCG64x63basic.pcg32_srandom( seed,seq:Int64u );
begin
     pcg32_srandom_r( _Seed, seed, seq );
end;

function TRandom32PCG64x63basic.pcg32_random_r( var rng:T_pcg32_random_t ) :Int32u;
var
   oldstate :Int64u;
   xorshifted, rot :Int32u;
begin
     oldstate := rng.state;

     rng.state := oldstate * Int64u( 6364136223846793005 ) + rng.inc;

     xorshifted := ( ( oldstate shr 18 ) xor oldstate ) shr 27;

     rot := oldstate shr 59;

     Result := ( xorshifted shr rot ) or ( xorshifted shl ( -rot and 31 ) );
end;

function TRandom32PCG64x63basic.pcg32_random :Int32u;
begin
     Result := pcg32_random_r( _Seed );
end;

function TRandom32PCG64x63basic.pcg32_boundedrand_r( var rng:T_pcg32_random_t; bound:Int32u ) :Int32u;
var
   threshold, r :Int32u;
begin
     threshold := -bound mod bound;

     repeat
           r := pcg32_random_r( rng );

     until r >= threshold;

     Result := r mod bound;
end;

function TRandom32PCG64x63basic.pcg32_boundedrand( bound:Int32u ) :Int32u;
begin
     Result := pcg32_boundedrand_r( &_Seed, bound );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■