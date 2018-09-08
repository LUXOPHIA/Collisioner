unit LUX.Random.WELL.P44497;

{ http://www.iro.umontreal.ca/~panneton/WELLRNG.html }

interface //#################################################################### ■

uses System.SysUtils,
     LUX,
     LUX.Random,
     LUX.Random.WELL;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     TRandom32WEL44497a      = class;
       TRandom32WEL44497b    = class;
       TRandom32WEL44497anew = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSeed32WEL44497a

     TSeed32WEL44497a = record
     private const
       W     = 32;
       R     = 1391;
       P     = 15;
       MASKU = $ffffffff shr ( W - P );
       MASKL = not MASKU;
       M1    = 23;
       M2    = 481;
       M3    = 229;
     private
       ///// アクセス
       function GetV0 :Int32u;
       procedure SetV0( const V0_:Int32u );
       function GetVM1Over :Int32u;
       procedure SetVM1Over( const VM1Over_:Int32u );
       function GetVM1 :Int32u;
       procedure SetVM1( const VM1_:Int32u );
       function GetVM2Over :Int32u;
       procedure SetVM2Over( const VM2Over_:Int32u );
       function GetVM2 :Int32u;
       procedure SetVM2( const VM2_:Int32u );
       function GetVM3Over :Int32u;
       procedure SetVM3Over( const VM3Over_:Int32u );
       function GetVM3 :Int32u;
       procedure SetVM3( const VM3_:Int32u );
       function GetVRm1 :Int32u;
       procedure SetVRm1( const VRm1_:Int32u );
       function GetVRm1Under :Int32u;
       procedure SetVRm1Under( const VRm1Under_:Int32u );
       function GetVRm2 :Int32u;
       procedure SetVRm2( const VRm2_:Int32u );
       function GetVRm2Under :Int32u;
       procedure SetVRm2Under( const VRm2Under_:Int32u );
       function GetnewV0 :Int32u;
       procedure SetnewV0( const newV0_:Int32u );
       function GetnewV0Under :Int32u;
       procedure SetnewV0Under( const newV0Under_:Int32u );
       function GetnewV1 :Int32u;
       procedure SetnewV1( const newV1_:Int32u );
       function GetnewVRm1 :Int32u;
       procedure SetnewVRm1( const newVRm1_:Int32u );
       function GetnewVRm1Under :Int32u;
       procedure SetnewVRm1Under( const newVRm1Under_:Int32u );
       { WELL44497a-new }
       function GetnewVM2Over :Int32u;
       procedure SetnewVM2Over( const newVM2Over_:Int32u );
       function GetnewVM2 :Int32u;
       procedure SetnewVM2( const newVM2_:Int32u );
     public
       state_i :Int32u;
       STATE   :array [ 0..R-1 ] of Int32u;
       case_i  :Byte;
       ///// プロパティ
       property V0           :Int32u read GetV0           write SetV0          ;
       property VM1Over      :Int32u read GetVM1Over      write SetVM1Over     ;
       property VM1          :Int32u read GetVM1          write SetVM1         ;
       property VM2Over      :Int32u read GetVM2Over      write SetVM2Over     ;
       property VM2          :Int32u read GetVM2          write SetVM2         ;
       property VM3Over      :Int32u read GetVM3Over      write SetVM3Over     ;
       property VM3          :Int32u read GetVM3          write SetVM3         ;
       property VRm1         :Int32u read GetVRm1         write SetVRm1        ;
       property VRm1Under    :Int32u read GetVRm1Under    write SetVRm1Under   ;
       property VRm2         :Int32u read GetVRm2         write SetVRm2        ;
       property VRm2Under    :Int32u read GetVRm2Under    write SetVRm2Under   ;
       property newV0        :Int32u read GetnewV0        write SetnewV0       ;
       property newV0Under   :Int32u read GetnewV0Under   write SetnewV0Under  ;
       property newV1        :Int32u read GetnewV1        write SetnewV1       ;
       property newVRm1      :Int32u read GetnewVRm1      write SetnewVRm1     ;
       property newVRm1Under :Int32u read GetnewVRm1Under write SetnewVRm1Under;
       { WELL44497a-new }
       property newVM2Over   :Int32u read GetnewVM2Over   write SetnewVM2Over  ;
       property newVM2       :Int32u read GetnewVM2       write SetnewVM2      ;
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32WEL44497a

     TRandom32WEL44497a = class( TRandomWEL<TSeed32WEL44497a> )
     protected
       ///// メソッド
       procedure case_1;
       procedure case_2;
       procedure case_3;
       procedure case_4;
       procedure case_5;
       procedure case_6;
       procedure CalcNextSeed; override;
       function CalcRandInt32u :Int32u; override;
     public
       constructor CreateFromRand( const Random_:IRandom ); overload; override;
       ///// メソッド
       function MAT0POS( const t:Int32u; const v:Int32u ) :Int32u; inline;
       function MAT0NEG( const t:Int32s; const v:Int32u ) :Int32u; inline;
       function MAT1( const v:Int32u ) :Int32u; inline;
       function MAT2( const a:Int32u; const v:Int32u ) :Int32u; inline;
       function MAT3POS( const t:Int32u; const v:Int32u ) :Int32u; inline;
       function MAT3NEG( const t:Int32s; const v:Int32u ) :Int32u; inline;
       function MAT4POS( const t:Int32u; const b,v:Int32u ) :Int32u; inline;
       function MAT4NEG( const t:Int32s; const b,v:Int32u ) :Int32u; inline;
       function MAT5( const r:Int32s; const a,ds,dt,v:Int32u ) :Int32u; inline;
       function MAT7( const v:Int32u ) :Int32u; inline;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32WEL44497b

     TRandom32WEL44497b = class( TRandom32WEL44497a )
     private const
       TEMPERB = $93dd1400;
       TEMPERC = $fa118000;
     private
     protected
       ///// メソッド
       function CalcRandInt32u :Int32u; override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32WEL44497anew

     TRandom32WEL44497anew = class( TRandom32WEL44497a )
     private const
       BITMASK = $48000000;
     private
     protected
       ///// メソッド
       function CalcRandInt32u :Int32u; override;
     public
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSeed32WEL44497a

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TSeed32WEL44497a.GetV0 :Int32u;
begin
     Result := STATE[ state_i ];
end;

procedure TSeed32WEL44497a.SetV0( const V0_:Int32u );
begin
     STATE[ state_i ] := V0_;
end;

function TSeed32WEL44497a.GetVM1Over :Int32u;
begin
     Result := STATE[ state_i+M1-R ];
end;

procedure TSeed32WEL44497a.SetVM1Over( const VM1Over_:Int32u );
begin
     STATE[ state_i+M1-R ] := VM1Over_;
end;

function TSeed32WEL44497a.GetVM1 :Int32u;
begin
     Result := STATE[ state_i+M1 ];
end;

procedure TSeed32WEL44497a.SetVM1( const VM1_:Int32u );
begin
     STATE[ state_i+M1 ] := VM1_;
end;

function TSeed32WEL44497a.GetVM2Over :Int32u;
begin
     Result := STATE[ state_i+M2-R ];
end;

procedure TSeed32WEL44497a.SetVM2Over( const VM2Over_:Int32u );
begin
     STATE[ state_i+M2-R ] := VM2Over_;
end;

function TSeed32WEL44497a.GetVM2 :Int32u;
begin
     Result := STATE[ state_i+M2 ];
end;

procedure TSeed32WEL44497a.SetVM2( const VM2_:Int32u );
begin
     STATE[ state_i+M2 ] := VM2_;
end;

function TSeed32WEL44497a.GetVM3Over :Int32u;
begin
     Result := STATE[ state_i+M3-R ];
end;

procedure TSeed32WEL44497a.SetVM3Over( const VM3Over_:Int32u );
begin
     STATE[ state_i+M3-R ] := VM3Over_;
end;

function TSeed32WEL44497a.GetVM3 :Int32u;
begin
     Result := STATE[ state_i+M3 ];
end;

procedure TSeed32WEL44497a.SetVM3( const VM3_:Int32u );
begin
     STATE[ state_i+M3 ] := VM3_;
end;

function TSeed32WEL44497a.GetVRm1 :Int32u;
begin
     Result := STATE[ state_i-1 ];
end;

procedure TSeed32WEL44497a.SetVRm1( const VRm1_:Int32u );
begin
     STATE[ state_i-1 ] := VRm1_;
end;

function TSeed32WEL44497a.GetVRm1Under :Int32u;
begin
     Result := STATE[ state_i+R-1 ];
end;

procedure TSeed32WEL44497a.SetVRm1Under( const VRm1Under_:Int32u );
begin
     STATE[ state_i+R-1 ] := VRm1Under_;
end;

function TSeed32WEL44497a.GetVRm2 :Int32u;
begin
     Result := STATE[ state_i-2 ];
end;

procedure TSeed32WEL44497a.SetVRm2( const VRm2_:Int32u );
begin
     STATE[ state_i-2 ] := VRm2_;
end;

function TSeed32WEL44497a.GetVRm2Under :Int32u;
begin
     Result := STATE[ state_i+R-2 ];
end;

procedure TSeed32WEL44497a.SetVRm2Under( const VRm2Under_:Int32u );
begin
     STATE[ state_i+R-2 ] := VRm2Under_;
end;

function TSeed32WEL44497a.GetnewV0 :Int32u;
begin
     Result := STATE[ state_i-1 ];
end;

procedure TSeed32WEL44497a.SetnewV0( const newV0_:Int32u );
begin
     STATE[ state_i-1 ] := newV0_;
end;

function TSeed32WEL44497a.GetnewV0Under :Int32u;
begin
     Result := STATE[ state_i-1+R ];
end;

procedure TSeed32WEL44497a.SetnewV0Under( const newV0Under_:Int32u );
begin
     STATE[ state_i-1+R ] := newV0Under_;
end;

function TSeed32WEL44497a.GetnewV1 :Int32u;
begin
     Result := STATE[ state_i ];
end;

procedure TSeed32WEL44497a.SetnewV1( const newV1_:Int32u );
begin
     STATE[ state_i ] := newV1_;
end;

function TSeed32WEL44497a.GetnewVRm1 :Int32u;
begin
     Result := STATE[ state_i-2 ];
end;

procedure TSeed32WEL44497a.SetnewVRm1( const newVRm1_:Int32u );
begin
     STATE[ state_i-2 ] := newVRm1_;
end;

function TSeed32WEL44497a.GetnewVRm1Under :Int32u;
begin
     Result := STATE[ state_i-2+R ];
end;

procedure TSeed32WEL44497a.SetnewVRm1Under( const newVRm1Under_:Int32u );
begin
     STATE[ state_i-2+R ] := newVRm1Under_;
end;

{ WELL44497a-new }

function TSeed32WEL44497a.GetnewVM2Over :Int32u;
begin
     Result := STATE[ state_i+M2-R+1 ];
end;

procedure TSeed32WEL44497a.SetnewVM2Over( const newVM2Over_:Int32u );
begin
     STATE[ state_i+M2-R+1 ] := newVM2Over_;
end;

function TSeed32WEL44497a.GetnewVM2 :Int32u;
begin
     Result := STATE[ state_i+M2+1 ];
end;

procedure TSeed32WEL44497a.SetnewVM2( const newVM2_:Int32u );
begin
     STATE[ state_i+M2+1 ] := newVM2_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32WEL44497a

{ http://www.iro.umontreal.ca/~panneton/well/WELL44497a.c }

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandom32WEL44497a.case_1;
var
   z0, z1, z2 :Int32u;
begin
     with _Seed do
     begin
          z0 := ( Vrm1Under and MASKL )
             or ( Vrm2Under and MASKU );
          z1 := MAT0NEG( -24, V0  )
            xor MAT0POS( +30, VM1 );
          z2 := MAT0NEG( -10, VM2 )
            xor MAT3NEG( -26, VM3 );

          newV1      := z1 xor z2;
          newV0Under := MAT1( z0 )
                    xor MAT0POS( 20, z1 )
                    xor MAT5( 9, $b729fcec, $fbffffff, $00020000, z2 )
                    xor MAT1( newV1);

          state_i := R-1;
     end;
end;

procedure TRandom32WEL44497a.case_2;
var
   z0, z1, z2 :Int32u;
begin
     with _Seed do
     begin
          z0 := ( Vrm1      and MASKL )
             or ( Vrm2Under and MASKU );
          z1 := MAT0NEG( -24, V0  )
            xor MAT0POS( +30, VM1 );
          z2 := MAT0NEG( -10, VM2 )
            xor MAT3NEG( -26, VM3 );

          newV1 := z1 xor z2;
          newV0 := MAT1( z0 )
               xor MAT0POS( 20, z1 )
               xor MAT5( 9, $b729fcec, $fbffffff, $00020000, z2 )
               xor MAT1( newV1 );

          state_i := 0;
     end;
end;

procedure TRandom32WEL44497a.case_3;
var
   z0, z1, z2 :Int32u;
begin
     with _Seed do
     begin
          z0 := ( Vrm1 and MASKL )
             or ( Vrm2 and MASKU );
          z1 := MAT0NEG( -24, V0      )
            xor MAT0POS( +30, VM1Over );
          z2 := MAT0NEG( -10, VM2Over )
            xor MAT3NEG( -26, VM3Over );

          newV1 := z1 xor z2;
          newV0 := MAT1( z0 )
               xor MAT0POS( 20, z1 )
               xor MAT5( 9, $b729fcec, $fbffffff, $00020000, z2 )
               xor MAT1( newV1 );

          Dec( state_i );
     end;
end;

procedure TRandom32WEL44497a.case_4;
var
   z0, z1, z2 :Int32u;
begin
     with _Seed do
     begin
          z0 := ( Vrm1 and MASKL )
             or ( Vrm2 and MASKU );
          z1 := MAT0NEG( -24, V0      )
            xor MAT0POS( +30, VM1     );
          z2 := MAT0NEG( -10, VM2Over )
            xor MAT3NEG( -26, VM3Over );

          newV1 := z1 xor z2;
          newV0 := MAT1( z0 )
               xor MAT0POS( 20, z1 )
               xor MAT5( 9, $b729fcec, $fbffffff, $00020000, z2 )
               xor MAT1( newV1 );

          Dec( state_i );
     end;
end;

procedure TRandom32WEL44497a.case_5;
var
   z0, z1, z2 :Int32u;
begin
     with _Seed do
     begin
          z0 := ( Vrm1 and MASKL )
             or ( Vrm2 and MASKU );
          z1 := MAT0NEG( -24, V0      )
            xor MAT0POS( +30, VM1     );
          z2 := MAT0NEG( -10, VM2Over )
            xor MAT3NEG( -26, VM3     );

          newV1 := z1 xor z2;
          newV0 := MAT1( z0 )
               xor MAT0POS( 20, z1 )
               xor MAT5( 9, $b729fcec, $fbffffff, $00020000, z2 )
               xor MAT1( newV1 );

          Dec( state_i );
     end;
end;

procedure TRandom32WEL44497a.case_6;
var
   z0, z1, z2 :Int32u;
begin
     with _Seed do
     begin
          z0 := ( Vrm1 and MASKL )
             or ( Vrm2 and MASKU );
          z1 := MAT0NEG( -24, V0  )
            xor MAT0POS( +30, VM1 );
          z2 := MAT0NEG( -10, VM2 )
            xor MAT3NEG( -26, VM3 );

          newV1 := z1 xor z2;
          newV0 := MAT1( z0 )
               xor MAT0POS( 20, z1 )
               xor MAT5( 9, $b729fcec, $fbffffff, $00020000, z2 )
               xor MAT1( newV1 );

          Dec( state_i );
     end;
end;

//------------------------------------------------------------------------------

procedure TRandom32WEL44497a.CalcNextSeed;
begin
     with _Seed do
     begin
          case case_i of
            1:                          case_i := 3;
            2:                          case_i := 1;
            3: if state_i + M1 < R then case_i := 4;
            4: if state_i + M3 < R then case_i := 5;
            5: if state_i + M2 < R then case_i := 6;
            6: if state_i      = 1 then case_i := 2;
          end;

          case case_i of
            1: case_1;  // 0     = state_i
            2: case_2;  // 1     = state_i
            3: case_3;  // R-M1 <= state_i
            4: case_4;  // R-M3 <= state_i
            5: case_5;  // R-M2 <= state_i
            6: case_6;  // 2    <= state_i <= R-M2-1
          end;
     end;
end;

function TRandom32WEL44497a.CalcRandInt32u :Int32u;
begin
     Result := _Seed.V0;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandom32WEL44497a.CreateFromRand( const Random_:IRandom );
var
   S :TSeed32WEL44497a;
   I :Integer;
begin
     with S do
     begin
          for I := 0 to R-1 do STATE[ I ] := Random_.DrawRandInt32u;

          state_i := 0;
          case_i  := 2;
     end;

     Create( S );
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TRandom32WEL44497a.MAT0POS( const t:Int32u; const v:Int32u ) :Int32u;
begin
     Result := v xor ( v shr +t );
end;

function TRandom32WEL44497a.MAT0NEG( const t:Int32s; const v:Int32u ) :Int32u;
begin
     Result := v xor ( v shl -t );
end;

function TRandom32WEL44497a.MAT1( const v:Int32u ) :Int32u;
begin
     Result := v;
end;

function TRandom32WEL44497a.MAT2( const a:Int32u; const v:Int32u ) :Int32u;
begin
     if v and 1 <> 0 then Result := ( v shr 1 ) xor a
                     else Result :=   v shr 1;
end;

function TRandom32WEL44497a.MAT3POS( const t:Int32u; const v:Int32u ) :Int32u;
begin
     Result := v shr +t;
end;

function TRandom32WEL44497a.MAT3NEG( const t:Int32s; const v:Int32u ) :Int32u;
begin
     Result := v shl -t;
end;

function TRandom32WEL44497a.MAT4POS( const t:Int32u; const b,v:Int32u ) :Int32u;
begin
     Result := v xor ( ( v shr +t ) and b );
end;

function TRandom32WEL44497a.MAT4NEG( const t:Int32s; const b,v:Int32u ) :Int32u;
begin
     Result := v xor ( ( v shl -t ) and b );
end;

function TRandom32WEL44497a.MAT5( const r:Int32s; const a,ds,dt,v:Int32u ) :Int32u;
begin
     if v and dt <> 0 then Result := ( ( ( v shl r ) xor ( v shr ( _Seed.W - r ) ) ) and ds ) xor a
                      else Result :=   ( ( v shl r ) xor ( v shr ( _Seed.W - r ) ) ) and ds;
end;

function TRandom32WEL44497a.MAT7( const v:Int32u ) :Int32u;
begin
     Result := 0;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32WEL44497b

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

function TRandom32WEL44497b.CalcRandInt32u :Int32u;
begin
     with _Seed do
     begin
          Result := STATE[ state_i ] xor ( ( STATE[ state_i ] shl 07 ) and TEMPERB );
          Result := Result           xor ( ( Result           shl 15 ) and TEMPERC );
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32WEL44497anew

{ http://www.ritsumei.ac.jp/~harase/WELL44497a_new.c }

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

function TRandom32WEL44497anew.CalcRandInt32u :Int32u;
begin
     with _Seed do
     begin
          case case_i of
            1: Result := STATE[ state_i ] xor ( newVM2Over and BITMASK );
            2: Result := STATE[ state_i ] xor ( newVM2     and BITMASK );
            3: Result := STATE[ state_i ] xor ( newVM2Over and BITMASK );
            4: Result := STATE[ state_i ] xor ( newVM2Over and BITMASK );
            5: Result := STATE[ state_i ] xor ( newVM2Over and BITMASK );
            6: Result := STATE[ state_i ] xor ( newVM2     and BITMASK );
          else Result := 0;
          end;
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■