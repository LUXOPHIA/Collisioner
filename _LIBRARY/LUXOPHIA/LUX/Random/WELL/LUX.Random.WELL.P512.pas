unit LUX.Random.WELL.P512;

{ http://www.iro.umontreal.ca/~panneton/WELLRNG.html }

interface //#################################################################### ■

uses LUX,
     LUX.Random,
     LUX.Random.WELL;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     TRandom32WEL512a = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSeed32WEL512a

     TSeed32WEL512a = record
     private const
       R  = 16;
       M1 = 13;
       M2 =  9;
       M3 =  5;
     private
       ///// アクセス
       function GetV0 :Int32u;
       procedure SetV0( const V0_:Int32u );
       function GetVM1 :Int32u;
       procedure SetVM1( const VM1_:Int32u );
       function GetVM2 :Int32u;
       procedure SetVM2( const VM2_:Int32u );
       function GetVM3 :Int32u;
       procedure SetVM3( const VM3_:Int32u );
       function GetVRm1 :Int32u;
       procedure SetVRm1( const VRm1_:Int32u );
       function GetVRm2 :Int32u;
       procedure SetVRm2( const VRm2_:Int32u );
       function GetnewV0 :Int32u;
       procedure SetnewV0( const newV0_:Int32u );
       function GetnewV1 :Int32u;
       procedure SetnewV1( const newV1_:Int32u );
       function GetnewVRm1 :Int32u;
       procedure SetnewVRm1( const newVRm1_:Int32u );
     public
       state_i :Int32u;
       STATE   :array [ 0..R-1 ] of Int32u;
       /////
       property V0      :Int32u read GetV0      write SetV0     ;
       property VM1     :Int32u read GetVM1     write SetVM1    ;
       property VM2     :Int32u read GetVM2     write SetVM2    ;
       property VM3     :Int32u read GetVM3     write SetVM3    ;
       property VRm1    :Int32u read GetVRm1    write SetVRm1   ;
       property VRm2    :Int32u read GetVRm2    write SetVRm2   ;
       property newV0   :Int32u read GetnewV0   write SetnewV0  ;
       property newV1   :Int32u read GetnewV1   write SetnewV1  ;
       property newVRm1 :Int32u read GetnewVRm1 write SetnewVRm1;
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32WEL512a

     TRandom32WEL512a = class( TRandomWEL<TSeed32WEL512a> )
     private
     protected
       ///// メソッド
       procedure CalcNextSeed; override;
       function CalcRandInt32u :Int32u; override;
     public
       constructor CreateFromRand( const Random_:IRandom ); overload; override;
       ///// メソッド
       function MAT0POS( const t:Int32u; const v:Int32u ) :Int32u; inline;
       function MAT0NEG( const t:Int32s; const v:Int32u ) :Int32u; inline;
       function MAT3NEG( const t:Int32s; const v:Int32u ) :Int32u; inline;
       function MAT4NEG( const t:Int32s; const b,v:Int32u ) :Int32u; inline;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.SysUtils;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSeed32WEL512a

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TSeed32WEL512a.GetV0 :Int32u;
begin
     Result := STATE[ state_i ];
end;

procedure TSeed32WEL512a.SetV0( const V0_:Int32u );
begin
     STATE[ state_i ] := V0_;
end;

function TSeed32WEL512a.GetVM1 :Int32u;
begin
     Result := STATE[ ( state_i + M1 ) and $0000000f ];
end;

procedure TSeed32WEL512a.SetVM1( const VM1_:Int32u );
begin
     STATE[ ( state_i + M1 ) and $0000000f ] := VM1_;
end;

function TSeed32WEL512a.GetVM2 :Int32u;
begin
     Result := STATE[ ( state_i + M2 ) and $0000000f ];
end;

procedure TSeed32WEL512a.SetVM2( const VM2_:Int32u );
begin
     STATE[ ( state_i + M2 ) and $0000000f ] := VM2_;
end;

function TSeed32WEL512a.GetVM3 :Int32u;
begin
     Result := STATE[ ( state_i + M3 ) and $0000000f ];
end;

procedure TSeed32WEL512a.SetVM3( const VM3_:Int32u );
begin
     STATE[ ( state_i + M3 ) and $0000000f ] := VM3_;
end;

function TSeed32WEL512a.GetVRm1 :Int32u;
begin
     Result := STATE[ ( state_i + 15 ) and $0000000f ];
end;

procedure TSeed32WEL512a.SetVRm1( const VRm1_:Int32u );
begin
     STATE[ ( state_i + 15 ) and $0000000f ] := VRm1_;
end;

function TSeed32WEL512a.GetVRm2 :Int32u;
begin
     Result := STATE[ ( state_i + 14 ) and $0000000f ];
end;

procedure TSeed32WEL512a.SetVRm2( const VRm2_:Int32u );
begin
     STATE[ ( state_i + 14 ) and $0000000f ] := VRm2_;
end;

function TSeed32WEL512a.GetnewV0 :Int32u;
begin
     Result := STATE[ ( state_i + 15 ) and $0000000f ];
end;

procedure TSeed32WEL512a.SetnewV0( const newV0_:Int32u );
begin
     STATE[ ( state_i + 15 ) and $0000000f ] := newV0_;
end;

function TSeed32WEL512a.GetnewV1 :Int32u;
begin
     Result := STATE[ state_i ];
end;

procedure TSeed32WEL512a.SetnewV1( const newV1_:Int32u );
begin
     STATE[ state_i ] := newV1_;
end;

function TSeed32WEL512a.GetnewVRm1 :Int32u;
begin
     Result := STATE[ ( state_i + 14 ) and $0000000f ];
end;

procedure TSeed32WEL512a.SetnewVRm1( const newVRm1_:Int32u );
begin
     STATE[ ( state_i + 14 ) and $0000000f ] := newVRm1_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32WEL512a

{ http://www.iro.umontreal.ca/~panneton/well/WELL512a.c }

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandom32WEL512a.CalcNextSeed;
var
   z0, z1, z2 :Int32u;
begin
     with _Seed do
     begin
          z0 := VRm1;
          z1 := MAT0NEG( -16, V0  )
            xor MAT0NEG( -15, VM1 );
          z2 := MAT0POS( +11, VM2 );

          newV1 := z1 xor z2;

          newV0 := MAT0NEG( -02, z0 )
               xor MAT0NEG( -18, z1 )
               xor MAT3NEG( -28, z2 )
               xor MAT4NEG( -05, $da442d24, newV1 );

          state_i := ( state_i + 15 ) and $0000000f;
     end;
end;

function TRandom32WEL512a.CalcRandInt32u :Int32u;
begin
     Result := _Seed.V0;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandom32WEL512a.CreateFromRand( const Random_:IRandom );
var
   S :TSeed32WEL512a;
   I :Integer;
begin
     with S do
     begin
          for I := 0 to R-1 do STATE[ I ] := Random_.DrawRandInt32u;

          state_i := 0;
     end;

     Create( S );
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TRandom32WEL512a.MAT0POS( const t:Int32u; const v:Int32u ) :Int32u;
begin
     Result := v xor ( v shr +t );
end;

function TRandom32WEL512a.MAT0NEG( const t:Int32s; const v:Int32u ) :Int32u;
begin
     Result := v xor ( v shl -t );
end;

function TRandom32WEL512a.MAT3NEG( const t:Int32s; const v:Int32u ) :Int32u;
begin
     Result := v shl -t;
end;

function TRandom32WEL512a.MAT4NEG( const t:Int32s; const b,v:Int32u ) :Int32u;
begin
     Result := v xor ( ( v shl -t ) and b );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■