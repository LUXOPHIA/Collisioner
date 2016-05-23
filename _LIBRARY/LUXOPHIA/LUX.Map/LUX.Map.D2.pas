unit LUX.Map.D2;

interface //#################################################################### ■

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TArray2D<T_Item>

     TArray2D<T_Item> = class
     private
       _AllX :Integer;
       _AllY :Integer;
       ///// メソッド
       procedure MakeArray;
       function XYtoI( const X_,Y_:Integer ) :Integer; inline;
     protected
       _CountX  :Integer;
       _CountY  :Integer;
       _MarginX :Integer;
       _MarginY :Integer;
       _Item    :array of T_Item;
       ///// アクセス
       procedure SetCountX( const CountX_:Integer );
       procedure SetCountY( const CountY_:Integer );
       procedure SetMarginX( const MarginX_:Integer );
       procedure SetMarginY( const MarginY_:Integer );
       function GetItem( const X_,Y_:Integer ) :T_Item;
       procedure SetItem( const X_,Y_:Integer; const Item_:T_Item );
     public
       constructor Create; overload;
       constructor Create( const CountX_,CountY_:Integer ); overload;
       constructor Create( const CountX_,CountY_,Margin_:Integer ); overload;
       constructor Create( const CountX_,CountY_,MarginX_,MarginY_:Integer ); overload;
       procedure AfterConstruction; override;
       destructor Destroy; override;
       ///// プロパティ
       property CountX                      :Integer read _CountX  write SetCountX;
       property CountY                      :Integer read _CountY  write SetCountY;
       property MarginX                     :Integer read _MarginX write SetMarginX;
       property MarginY                     :Integer read _MarginY write SetMarginY;
       property Item[ const X_,Y_:Integer ] :T_Item  read GetItem  write SetItem;    default;
       ///// メソッド
       class procedure Swap( var Array0_,Array1_:TArray2D<T_Item> ); static;
       procedure MakeEdgeLoop;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TArray2D<T_Item>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// メソッド

procedure TArray2D<T_Item>.MakeArray;
begin
     _AllX := _MarginX + _CountX + _MarginX;
     _AllY := _MarginY + _CountY + _MarginY;

     SetLength( _Item, _AllX * _AllY );
end;

function TArray2D<T_Item>.XYtoI( const X_,Y_:Integer ) :Integer;
begin
     Result := ( _MarginX + X_ ) + _AllX * ( _MarginY + Y_ );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

procedure TArray2D<T_Item>.SetCountX( const CountX_:Integer );
begin
     _CountX := CountX_;  MakeArray;
end;

procedure TArray2D<T_Item>.SetCountY( const CountY_:Integer );
begin
     _CountY := CountY_;  MakeArray;
end;

procedure TArray2D<T_Item>.SetMarginX( const MarginX_:Integer );
begin
     _MarginX := MarginX_;  MakeArray;
end;

procedure TArray2D<T_Item>.SetMarginY( const MarginY_:Integer );
begin
     _MarginY := MarginY_;  MakeArray;
end;

function TArray2D<T_Item>.GetItem( const X_,Y_:Integer ) :T_Item;
begin
     Result := _Item[ XYtoI( X_, Y_ ) ];
end;

procedure TArray2D<T_Item>.SetItem( const X_,Y_:Integer; const Item_:T_Item );
begin
     _Item[ XYtoI( X_, Y_ ) ] := Item_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TArray2D<T_Item>.Create;
begin
     Create( 0, 0 );
end;

constructor TArray2D<T_Item>.Create( const CountX_,CountY_:Integer );
begin
     Create( CountX_, CountY_, 0 );
end;

constructor TArray2D<T_Item>.Create( const CountX_,CountY_,Margin_:Integer );
begin
     Create( CountX_, CountY_, Margin_, Margin_ );
end;

constructor TArray2D<T_Item>.Create( const CountX_,CountY_,MarginX_,MarginY_:Integer );
begin
     inherited Create;

     _CountX  := CountX_;
     _CountY  := CountY_;
     _MarginX := MarginX_;
     _MarginY := MarginY_;
end;

procedure TArray2D<T_Item>.AfterConstruction;
begin
     MakeArray;
end;

destructor TArray2D<T_Item>.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

class procedure TArray2D<T_Item>.Swap( var Array0_,Array1_:TArray2D<T_Item> );
var
   A :TArray2D<T_Item>;
begin
     A := Array0_;  Array0_ := Array1_;  Array1_ := A;
end;

procedure TArray2D<T_Item>.MakeEdgeLoop;
var
   EX, EY, MX, MY :Integer;
begin
     for EY := -_MarginY to -1 do
     begin
          MY := EY + _CountY;

          for EX := -_MarginX to                 -1 do Item[ EX, EY ] := Item[ EX + _CountX, MY ];
          for EX :=  0        to _CountX         -1 do Item[ EX, EY ] := Item[ EX          , MY ];
          for EX :=  _CountX  to _CountX+_MarginX-1 do Item[ EX, EY ] := Item[ EX - _CountX, MY ];
     end;

     for EY := 0 to _CountY-1 do
     begin
          for EX := -_MarginX to                 -1 do Item[ EX, EY ] := Item[ EX + _CountX, EY ];

          for EX :=  _CountX  to _CountX+_MarginX-1 do Item[ EX, EY ] := Item[ EX - _CountX, EY ];
     end;

     for EY := _CountY to _CountY+_MarginY-1 do
     begin
          MY := EY - _CountY;

          for EX := -_MarginX to                 -1 do Item[ EX, EY ] := Item[ EX + _CountX, MY ];
          for EX :=  0        to _CountX         -1 do Item[ EX, EY ] := Item[ EX          , MY ];
          for EX :=  _CountX  to _CountX+_MarginX-1 do Item[ EX, EY ] := Item[ EX - _CountX, MY ];
     end;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
