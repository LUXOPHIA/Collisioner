unit LUX.Complex.D1;

interface //#################################################################### ■

uses LUX, LUX.D1, LUX.Complex;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleCIter1D

     TDoubleCIter1D = class( TTransIter1D< TDoubleC, TSingleC > )
     private
     protected
       ///// アクセス
       function GetValue :TDoubleC; override;
       procedure SetValue( const Value_:TDoubleC ); override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleRandWalkC

     IDoubleRandWalkC = interface
     ['{952E0B09-3DFF-4A8C-A7E1-18DCE86F550A}']
     {protected}
       ///// アクセス
       function GetWalks( const I_:Integer ) :TDoubleC;
       function GetWalksN :Integer;
       procedure SetWalksN( const WalksN_:Integer );
       function GetStdDev :TDoubleC;
       procedure SetStdDev( const SDev_:TDoubleC );
     {public}
       ///// プロパティ
       property Walks[ const I_:Integer ] :TDoubleC read GetWalks                 ; default;
       property WalksN                    :Integer  read GetWalksN write SetWalksN;
       property StdDev                    :TDoubleC read GetStdDev write SetStdDev;
       ///// メソッド
       procedure AddStep;
     end;

     TDoubleRandWalkC = class( TInterfacedObject, IDoubleRandWalkC )
     private
       ///// メソッド
       function NextStep( const C_:TDoubleC ) :TDoubleC;
     protected
       _Walks  :TArray<TDoubleC>;
       _StdDev :TDoubleC;
       ///// アクセス
       function GetWalks( const I_:Integer ) :TDoubleC;
       function GetWalksN :Integer;
       procedure SetWalksN( const WalksN_:Integer );
       function GetStdDev :TDoubleC;
       procedure SetStdDev( const SDev_:TDoubleC );
     public
       constructor Create; overload;
       constructor Create( const WalksN_:Integer ); overload; virtual;
       destructor Destroy; override;
       ///// プロパティ
       property Walks[ const I_:Integer ] :TDoubleC read GetWalks                 ; default;
       property WalksN                    :Integer  read GetWalksN write SetWalksN;
       property StdDev                    :TDoubleC read GetStdDev write SetStdDev;
       ///// メソッド
       procedure AddStep;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function Gauss( const C_,SD_:TSingleC ) :Single; overload;
function Gauss( const C_,SD_:TDoubleC ) :Double; overload;

implementation //############################################################### ■

uses System.Math;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleCIter1D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TDoubleCIter1D.GetValue :TDoubleC;
begin
     Result := _Iter.Value;
end;

procedure TDoubleCIter1D.SetValue( const Value_:TDoubleC );
begin
     _Iter.Value := Value_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleRandWalkC

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

function MetroWalk( const C0,AreaSD_:TDoubleC; const W_:Single ) :TDoubleC; overload;
var
   C1 :TDoubleC;
   A :Double;
begin
     C1 := C0 + TDoubleC.RandG( W_ * AreaSD_ );

     A := Gauss( C1, AreaSD_ ) / Gauss( C0, AreaSD_ );

     if Random < A then Result := C1
                   else Result := C0;
end;

function TDoubleRandWalkC.NextStep( const C_:TDoubleC ) :TDoubleC;
begin
     Result := MetroWalk( C_, _StdDev, 0.2 )
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TDoubleRandWalkC.GetWalks( const I_:Integer ) :TDoubleC;
begin
     Result := _Walks[ I_ ];
end;

function TDoubleRandWalkC.GetWalksN :Integer;
begin
     Result := Length( _Walks );
end;

procedure TDoubleRandWalkC.SetWalksN( const WalksN_:Integer );
var
   N, I :Integer;
begin
     N := WalksN;

     SetLength( _Walks, WalksN_ );

     for I := N to WalksN_-1 do _Walks[ I ] := NextStep( _Walks[ I-1 ] );
end;

function TDoubleRandWalkC.GetStdDev :TDoubleC;
begin
     Result := _StdDev;
end;

procedure TDoubleRandWalkC.SetStdDev( const SDev_:TDoubleC );
begin
     _StdDev := SDev_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TDoubleRandWalkC.Create;
begin
     Create( 0 );
end;

constructor TDoubleRandWalkC.Create( const WalksN_:Integer );
begin
     inherited Create;

     WalksN := WalksN_;
     StdDev := TDoubleC.Create( 0.25, 0.25 );
end;

destructor TDoubleRandWalkC.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TDoubleRandWalkC.AddStep;
var
   I :Integer;
begin
     for I := 0 to WalksN-2 do _Walks[ I ] := _Walks[ I+1 ];

     _Walks[ WalksN-1 ] := NextStep( _Walks[ WalksN-2 ] );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function Gauss( const C_,SD_:TSingleC ) :Single;
begin
     Result := Gauss( C_.R, SD_.R ) * Gauss( C_.I, SD_.I );
end;

function Gauss( const C_,SD_:TDoubleC ) :Double;
begin
     Result := Gauss( C_.R, SD_.R ) * Gauss( C_.I, SD_.I );
end;

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
