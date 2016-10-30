unit LUX.Map.D1;

interface //#################################################################### ■

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TArray1D<T_Item>

     TArray1D<T_Item> = class
     private
       _AllX :Integer;
       ///// メソッド
       procedure MakeArray;
       function XtoI( const X_:Integer ) :Integer; inline;
     protected
       _Item    :array of T_Item;
       _CountX  :Integer;
       _MarginX :Integer;
       ///// アクセス
       function GetItem( const X_:Integer ) :T_Item; virtual;
       procedure SetItem( const X_:Integer; const Item_:T_Item ); virtual;
       procedure SetCountX( const CountX_:Integer ); virtual;
       procedure SetMarginX( const MarginX_:Integer ); virtual;
     public
       constructor Create; overload;
       constructor Create( const CountX_:Integer ); overload;
       constructor Create( const CountX_,MarginX_:Integer ); overload;
       procedure AfterConstruction; override;
       destructor Destroy; override;
       ///// プロパティ
       property Item[ const X_:Integer ] :T_Item  read GetItem  write SetItem;    default;
       property Count                    :Integer read _CountX  write SetCountX;
       property CountX                   :Integer read _CountX  write SetCountX;
       property Margin                   :Integer read _MarginX write SetMarginX;
       property MarginX                  :Integer read _MarginX write SetMarginX;
       ///// メソッド
       class procedure Swap( var Array0_,Array1_:TArray1D<T_Item> ); static;
       procedure MakeEdgeLoop;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TBricArray1D<T_Item>

     TBricArray1D<T_Item> = class( TArray1D<T_Item> )
     private
     protected
       ///// アクセス
       function GetGridX :Integer;
       procedure SetGridX( const GridX_:Integer );
     public
       ///// プロパティ
       property Bric[ const X_:Integer ] :T_Item  read GetItem  write SetItem;   default;
       property BricN                    :Integer read _CountX  write SetCountX;
       property BricX                    :Integer read _CountX  write SetCountX;
       property GridN                    :Integer read GetGridX write SetGridX;
       property GridX                    :Integer read GetGridX write SetGridX;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGridArray1D<T_Item>

     TGridArray1D<T_Item> = class( TArray1D<T_Item> )
     private
     protected
       ///// アクセス
       function GetBricX :Integer;
       procedure SetBricX( const BricX_:Integer );
     public
       constructor Create; overload;
       constructor Create( const BricX_:Integer ); overload;
       constructor Create( const BricX_,MarginX_:Integer ); overload;
       destructor Destroy; override;
       ///// プロパティ
       property Grid[ const X_:Integer ] :T_Item  read GetItem  write SetItem;   default;
       property GridN                    :Integer read _CountX  write SetCountX;
       property GridX                    :Integer read _CountX  write SetCountX;
       property BricN                    :Integer read GetBricX write SetBricX;
       property BricX                    :Integer read GetBricX write SetBricX;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TArray1D<T_Item>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// メソッド

procedure TArray1D<T_Item>.MakeArray;
begin
     _AllX := _MarginX + _CountX + _MarginX;

     SetLength( _Item, _AllX );
end;

function TArray1D<T_Item>.XtoI( const X_:Integer ) :Integer;
begin
     Result := _MarginX + X_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

procedure TArray1D<T_Item>.SetCountX( const CountX_:Integer );
begin
     _CountX := CountX_;  MakeArray;
end;

procedure TArray1D<T_Item>.SetMarginX( const MarginX_:Integer );
begin
     _MarginX := MarginX_;  MakeArray;
end;

function TArray1D<T_Item>.GetItem( const X_:Integer ) :T_Item;
begin
     Result := _Item[ XtoI( X_ ) ];
end;

procedure TArray1D<T_Item>.SetItem( const X_:Integer; const Item_:T_Item );
begin
     _Item[ XtoI( X_ ) ] := Item_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TArray1D<T_Item>.Create;
begin
     Create( 0, 0 );
end;

constructor TArray1D<T_Item>.Create( const CountX_:Integer );
begin
     Create( CountX_, 0 );
end;

constructor TArray1D<T_Item>.Create( const CountX_,MarginX_:Integer );
begin
     inherited Create;

     _CountX  := CountX_;
     _MarginX := MarginX_;
end;

procedure TArray1D<T_Item>.AfterConstruction;
begin
     MakeArray;
end;

destructor TArray1D<T_Item>.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

class procedure TArray1D<T_Item>.Swap( var Array0_,Array1_:TArray1D<T_Item> );
var
   A :TArray1D<T_Item>;
begin
     A := Array0_;  Array0_ := Array1_;  Array1_ := A;
end;

procedure TArray1D<T_Item>.MakeEdgeLoop;
var
   X :Integer;
begin
     for X := -_MarginX to                 -1 do Item[ X ] := Item[ X + _CountX ];
     for X :=  _CountX  to _CountX+_MarginX-1 do Item[ X ] := Item[ X - _CountX ];
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TBricArray1D<T_Item>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TBricArray1D<T_Item>.GetGridX :Integer;
begin
     Result := BricX + 1;
end;

procedure TBricArray1D<T_Item>.SetGridX( const GridX_:Integer );
begin
     BricX := GridX_ - 1;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGridArray1D<T_Item>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGridArray1D<T_Item>.GetBricX :Integer;
begin
     Result := _CountX - 1;
end;

procedure TGridArray1D<T_Item>.SetBricX( const BricX_:Integer );
begin
     _CountX  := BricX_ + 1;  MakeArray;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGridArray1D<T_Item>.Create;
begin
     Create( 0, 0 );
end;

constructor TGridArray1D<T_Item>.Create( const BricX_:Integer );
begin
     Create( BricX_, 0 );
end;

constructor TGridArray1D<T_Item>.Create( const BricX_,MarginX_:Integer );
begin
     inherited;

     _CountX  := BricX_ + 1;
end;

destructor TGridArray1D<T_Item>.Destroy;
begin

     inherited;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
