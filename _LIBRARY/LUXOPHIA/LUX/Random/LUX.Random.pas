unit LUX.Random;

interface //#################################################################### ■

uses System.SyncObjs,
     LUX;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     IRandom                   = interface;
       IRandom<_TSeed_:record> = interface;
         IRandomZero           = interface;

     TRandom                   = class;
       TRandom<_TSeed_:record> = class;
         TRandomZero           = class;

     ///////////////////////////////////////////////////////////////////////////

     CRandom = class of TRandom;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom

     IRandom = interface
     ['{333C851D-AEE2-4145-A5A0-33934B32B117}']
     {protected}
     {public}
       ///// メソッド
       procedure GoNextSeed;
       procedure DrawRand( out Rand_:Int08u ); overload;
       procedure DrawRand( out Rand_:Int16u ); overload;
       procedure DrawRand( out Rand_:Int32u ); overload;
       procedure DrawRand( out Rand_:Int64u ); overload;
       procedure DrawRand( out Rand_:Flo32s ); overload;
       procedure DrawRand( out Rand_:Flo64s ); overload;
       function DrawRandInt08u :Int08u;
       function DrawRandInt16u :Int16u;
       function DrawRandInt32u :Int32u;
       function DrawRandInt64u :Int64u;
       function DrawRandFlo32s :Single;
       function DrawRandFlo64s :Double;
     end;

     //-------------------------------------------------------------------------

     TRandom = class( TInterfacedObject, IRandom )
     protected class var
       _Zero :IRandomZero;
     private
     protected
       _SeedCS :TCriticalSection;
       ///// メソッド
       procedure CalcNextSeed; virtual; abstract;
       function CalcRandInt08u :Int08u; virtual;
       function CalcRandInt16u :Int16u; virtual;
       function CalcRandInt32u :Int32u; virtual;
       function CalcRandInt64u :Int64u; virtual;
     public
       class constructor Create;
       constructor Create; overload; virtual;
       constructor Create( const Random_:IRandom; const _:Byte = 0 ); overload; virtual; abstract;
       constructor CreateFromRand( const Random_:IRandom ); overload; virtual; abstract;
       destructor Destroy; override;
       ///// メソッド
       procedure GoNextSeed;
       procedure DrawRand( out Rand_:Int08u ); overload;  // 0 <= Value < 256                        = $100                   = 2^08
       procedure DrawRand( out Rand_:Int16u ); overload;  // 0 <= Value < 65,536                     = $1,0000                = 2^16
       procedure DrawRand( out Rand_:Int32u ); overload;  // 0 <= Value < 4,294,967,296              = $1,0000,0000           = 2^32
       procedure DrawRand( out Rand_:Int64u ); overload;  // 0 <= Value < 18,446,744,073,709,551,616 = $1,0000,0000,0000,0000 = 2^64
       procedure DrawRand( out Rand_:Flo32s ); overload;  // 0 <= Value < 1
       procedure DrawRand( out Rand_:Flo64s ); overload;  // 0 <= Value < 1
       function DrawRandInt08u :Int08u;                   // 0 <= Value < 256                        = $100                   = 2^08
       function DrawRandInt16u :Int16u;                   // 0 <= Value < 65,536                     = $1,0000                = 2^16
       function DrawRandInt32u :Int32u;                   // 0 <= Value < 4,294,967,296              = $1,0000,0000           = 2^32
       function DrawRandInt64u :Int64u;                   // 0 <= Value < 18,446,744,073,709,551,616 = $1,0000,0000,0000,0000 = 2^64
       function DrawRandFlo32s :Single;                   // 0 <= Value < 1
       function DrawRandFlo64s :Double;                   // 0 <= Value < 1
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom<_TSeed_>

     IRandom<_TSeed_:record> = interface( IRandom )
     ['{BF700E87-C812-4802-9470-4922D1653C72}']
     {protected}
       ///// アクセス
       function GetSeed :_TSeed_;
       procedure SetSeed( const Seed_:_TSeed_ );
     {public}
       ///// プロパティ
       property Seed :_TSeed_ read GetSeed write SetSeed;
       ///// メソッド
       procedure DrawSeed( out Rand_:_TSeed_ ); overload;
       function DrawSeed :_TSeed_; overload;
     end;

     //-------------------------------------------------------------------------

     TRandom<_TSeed_:record> = class( TRandom, IRandom<_TSeed_> )
     private
     protected
       _Seed :_TSeed_;
       ///// アクセス
       function GetSeed :_TSeed_;
       procedure SetSeed( const Seed_:_TSeed_ );
     public
       constructor Create; overload; override;
       constructor Create( const Random_:IRandom; const _:Byte = 0 ); overload; override;
       constructor CreateFromSeed( const Random_:IRandom<_TSeed_> );
       constructor Create( const Seed_:_TSeed_ ); overload; virtual;
       ///// プロパティ
       property Seed :_TSeed_ read GetSeed write SetSeed;
       ///// メソッド
       procedure DrawSeed( out Rand_:_TSeed_ ); overload;
       function DrawSeed :_TSeed_; overload;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomZero

     IRandomZero = interface( IRandom<Int64u> )
     ['{38D34A14-0D1E-466C-A969-13BDA7BB0E56}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TRandomZero = class( TRandom<Int64u>, IRandomZero )
     protected class var
       _Time64 :Int64u;
       _TimeCS :TCriticalSection;
     private
     protected
       ///// メソッド
       procedure CalcNextSeed; override;
       function CalcRandInt64u :Int64u; override;
     public
       class constructor Create;
       constructor Create; overload; override;
       constructor CreateFromRand( const Random_:IRandom ); overload; override;
       class destructor Destroy;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function GetTimeCount :Int64u;

implementation //############################################################### ■

uses System.SysUtils
     {$IF Defined( MSWINDOWS ) }
   , Winapi.Windows
     {$ELSEIF Defined( MACOS ) }
   , Macapi.Mach
     {$ELSEIF Fefined( POSIX ) }
   , Posix.Time
     {$ENDIF};

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

function TRandom.CalcRandInt08u :Int08u;
begin
     Result := CalcRandInt16u and $FF{= 2^8-1 };
end;

function TRandom.CalcRandInt16u :Int16u;
begin
     Result := CalcRandInt32u and $FFFF{= 2^16-1 };
end;

function TRandom.CalcRandInt32u :Int32u;
begin
     Result := CalcRandInt64u and $FFFFFFFF{= 2^32-1 };
end;

function TRandom.CalcRandInt64u :Int64u;
begin
     Result := CalcRandInt32u;  CalcNextSeed;

     Result := ( Result shl 32 ) or CalcRandInt32u;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

class constructor TRandom.Create;
begin
     inherited;

     _Zero := TRandomZero.Create;
end;

constructor TRandom.Create;
begin
     inherited;

     _SeedCS := TCriticalSection.Create;
end;

destructor TRandom.Destroy;
begin
     _SeedCS.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandom.GoNextSeed;
begin
     _SeedCS.Enter;

       CalcNextSeed;

     _SeedCS.Leave;
end;

//------------------------------------------------------------------------------

procedure TRandom.DrawRand( out Rand_:Int08u );
begin
     _SeedCS.Enter;

       Rand_ := CalcRandInt08u;  CalcNextSeed;

     _SeedCS.Leave;
end;

procedure TRandom.DrawRand( out Rand_:Int16u );
begin
     _SeedCS.Enter;

       Rand_ := CalcRandInt16u;  CalcNextSeed;

     _SeedCS.Leave;
end;

procedure TRandom.DrawRand( out Rand_:Int32u );
begin
     _SeedCS.Enter;

       Rand_ := CalcRandInt32u;  CalcNextSeed;

     _SeedCS.Leave;
end;

procedure TRandom.DrawRand( out Rand_:Int64u );
begin
     _SeedCS.Enter;

       Rand_ := CalcRandInt64u;  CalcNextSeed;

     _SeedCS.Leave;
end;

procedure TRandom.DrawRand( out Rand_:Flo32s );
begin
     Rand_ := DrawRandInt32u / 4294967296.0{= 2^32 };
end;

procedure TRandom.DrawRand( out Rand_:Flo64s );
begin
     Rand_ := DrawRandInt64u / 18446744073709551616.0{= 2^64 };
end;

//------------------------------------------------------------------------------

function TRandom.DrawRandInt08u :Int08u;
begin
     DrawRand( Result );
end;

function TRandom.DrawRandInt16u :Int16u;
begin
     DrawRand( Result );
end;

function TRandom.DrawRandInt32u :Int32u;
begin
     DrawRand( Result );
end;

function TRandom.DrawRandInt64u :Int64u;
begin
     DrawRand( Result );
end;

function TRandom.DrawRandFlo32s :Single;
begin
     DrawRand( Result );
end;

function TRandom.DrawRandFlo64s :Double;
begin
     DrawRand( Result );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom<_TSeed_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TRandom<_TSeed_>.GetSeed :_TSeed_;
begin
     Result := _Seed;
end;

procedure TRandom<_TSeed_>.SetSeed( const Seed_:_TSeed_ );
begin
     _Seed := Seed_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandom<_TSeed_>.Create;
begin
     Create( _Zero );
end;

{ [dcc64 警告] W1029 パラメータが同じ重複した constructor 'TRandom.CreateFromRand' は C++ からアクセスできません }
constructor TRandom<_TSeed_>.Create( const Random_:IRandom; const _:Byte = 0 );
begin
     if Random_ is TRandom<_TSeed_> then CreateFromSeed( Random_ as IRandom<_TSeed_> )
                                    else CreateFromRand( Random_ );
end;

constructor TRandom<_TSeed_>.CreateFromSeed( const Random_:IRandom<_TSeed_> );
begin
     Create( Random_.DrawSeed );
end;

constructor TRandom<_TSeed_>.Create( const Seed_:_TSeed_ );
begin
     inherited Create;

     _Seed := Seed_;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandom<_TSeed_>.DrawSeed( out Rand_:_TSeed_ );
begin
     _SeedCS.Enter;

       Rand_ := _Seed;  CalcNextSeed;

     _SeedCS.Leave;
end;

function TRandom<_TSeed_>.DrawSeed :_TSeed_;
begin
     DrawSeed( Result );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandomZero

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandomZero.CalcNextSeed;
begin
     Inc( _Seed );
end;

function TRandomZero.CalcRandInt64u :Int64u;
begin
     Result := _Seed;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

class constructor TRandomZero.Create;
begin
     inherited;

     _TimeCS := TCriticalSection.Create;

     _Time64 := GetTimeCount;
end;

constructor TRandomZero.Create;
begin
     _TimeCS.Enter;

       Create( _Time64 );  Inc( _Time64 );

     _TimeCS.Leave;
end;

constructor TRandomZero.CreateFromRand( const Random_:IRandom );
begin
     Create( Random_.DrawRandInt64u );
end;

class destructor TRandomZero.Destroy;
begin
     _TimeCS.DisposeOf;

     inherited;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function GetTimeCount :Int64u;
{$IFDEF MSWINDOWS }
var
   Counter :Int64;
begin
     if QueryPerformanceCounter( Counter ) then Result := Counter       //Int64s
                                           else Result := GetTickCount; //Int32u
end;
{$ELSEIF MACOS }
begin
     Result := AbsoluteToNanoseconds( MachAbsoluteTime );  //Int64u
end;
{$ELSEIF Defined( LINUX ) or Defined( ANDROID ) }
var
   TimeOfDay :timeval;
begin
     if gettimeofday( TimeOfDay, nil ) = 0
     then Result := TimeOfDay.tv_sec * 1000000 + TimeOfDay.tv_usec
     else Result := time( nil );
end;
{$ENDIF}

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■