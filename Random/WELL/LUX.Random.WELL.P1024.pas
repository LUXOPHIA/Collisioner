unit LUX.Random.WELL.P1024;

{ http://www.iro.umontreal.ca/~panneton/WELLRNG.html }

interface //#################################################################### ■

uses LUX,
     LUX.Random,
     LUX.Random.WELL;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     TRandom32WEL1024a = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSeed32WEL1024a

     TSeed32WEL1024a = record
     private const
       R  = 32;
       M1 =  3;
       M2 = 24;
       M3 = 10;
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
       function GetnewV0 :Int32u;
       procedure SetnewV0( const newV0_:Int32u );
       function GetnewV1 :Int32u;
       procedure SetnewV1( const newV1_:Int32u );
     public
       state_i :Int32u;
       STATE   :array [ 0..R-1 ] of Int32u;
       /////
       property V0      :Int32u read GetV0      write SetV0     ;
       property VM1     :Int32u read GetVM1     write SetVM1    ;
       property VM2     :Int32u read GetVM2     write SetVM2    ;
       property VM3     :Int32u read GetVM3     write SetVM3    ;
       property VRm1    :Int32u read GetVRm1    write SetVRm1   ;
       property newV0   :Int32u read GetnewV0   write SetnewV0  ;
       property newV1   :Int32u read GetnewV1   write SetnewV1  ;
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32WEL1024a

     TRandom32WEL1024a = class( TRandomWEL<TSeed32WEL1024a> )
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
       function Identity( const v:Int32u ) :Int32u; inline;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.SysUtils;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSeed32WEL1024a

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TSeed32WEL1024a.GetV0 :Int32u;
begin
     Result := STATE[ state_i ];
end;

procedure TSeed32WEL1024a.SetV0( const V0_:Int32u );
begin
     STATE[ state_i ] := V0_;
end;

function TSeed32WEL1024a.GetVM1 :Int32u;
begin
     Result := STATE[ ( state_i + M1 ) and $0000001f ];
end;

procedure TSeed32WEL1024a.SetVM1( const VM1_:Int32u );
begin
     STATE[ ( state_i + M1 ) and $0000001f ] := VM1_;
end;

function TSeed32WEL1024a.GetVM2 :Int32u;
begin
     Result := STATE[ ( state_i + M2 ) and $0000001f ];
end;

procedure TSeed32WEL1024a.SetVM2( const VM2_:Int32u );
begin
     STATE[ ( state_i + M2 ) and $0000001f ] := VM2_;
end;

function TSeed32WEL1024a.GetVM3 :Int32u;
begin
     Result := STATE[ ( state_i + M3 ) and $0000001f ];
end;

procedure TSeed32WEL1024a.SetVM3( const VM3_:Int32u );
begin
     STATE[ ( state_i + M3 ) and $0000001f ] := VM3_;
end;

function TSeed32WEL1024a.GetVRm1 :Int32u;
begin
     Result := STATE[ ( state_i + 31 ) and $0000001f ];
end;

procedure TSeed32WEL1024a.SetVRm1( const VRm1_:Int32u );
begin
     STATE[ ( state_i + 31 ) and $0000001f ] := VRm1_;
end;

function TSeed32WEL1024a.GetnewV0 :Int32u;
begin
     Result := STATE[ ( state_i + 31 ) and $0000001f ];
end;

procedure TSeed32WEL1024a.SetnewV0( const newV0_:Int32u );
begin
     STATE[ ( state_i + 31 ) and $0000001f ] := newV0_;
end;

function TSeed32WEL1024a.GetnewV1 :Int32u;
begin
     Result := STATE[ state_i ];
end;

procedure TSeed32WEL1024a.SetnewV1( const newV1_:Int32u );
begin
     STATE[ state_i ] := newV1_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32WEL1024a

{ http://www.iro.umontreal.ca/~panneton/well/WELL1024a.c }

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandom32WEL1024a.CalcNextSeed;
var
   z0, z1, z2 :Int32u;
begin
     with _Seed do
     begin
          z0 := VRm1;
          z1 := Identity( V0 )
            xor MAT0POS( +08, VM1 );
          z2 := MAT0NEG( -19, VM2 )
            xor MAT0NEG( -14, VM3 );

          newV1 := z1 xor z2;
          newV0 := MAT0NEG( -11, z0 )
               xor MAT0NEG( -07, z1 )
               xor MAT0NEG( -13, z2 );

          state_i := ( state_i + 31 ) and $0000001f;
     end;
end;

function TRandom32WEL1024a.CalcRandInt32u :Int32u;
begin
     Result := _Seed.V0;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandom32WEL1024a.CreateFromRand( const Random_:IRandom );
var
   S :TSeed32WEL1024a;
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

function TRandom32WEL1024a.MAT0POS( const t:Int32u; const v:Int32u ) :Int32u;
begin
     Result := v xor ( v shr +t );
end;

function TRandom32WEL1024a.MAT0NEG( const t:Int32s; const v:Int32u ) :Int32u;
begin
     Result := v xor ( v shl -t );
end;

function TRandom32WEL1024a.Identity( const v:Int32u ) :Int32u;
begin
     Result := v;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■