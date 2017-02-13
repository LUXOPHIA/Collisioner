unit LUX.Lattice.T2;

interface //#################################################################### ■

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TArray2D<_TItem_>

     TArray2D<_TItem_> = class
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
       _Item    :array of _TItem_;
       ///// アクセス
       procedure SetCountX( const CountX_:Integer );
       procedure SetCountY( const CountY_:Integer );
       procedure SetMarginX( const MarginX_:Integer );
       procedure SetMarginY( const MarginY_:Integer );
       function GetItem( const X_,Y_:Integer ) :_TItem_;
       procedure SetItem( const X_,Y_:Integer; const Item_:_TItem_ );
     public
       constructor Create; overload;
       constructor Create( const CountX_,CountY_:Integer ); overload;
       constructor Create( const CountX_,CountY_,Margin_:Integer ); overload;
       constructor Create( const CountX_,CountY_,MarginX_,MarginY_:Integer ); overload;
       procedure AfterConstruction; override;
       destructor Destroy; override;
       ///// プロパティ
       property CountX                      :Integer read   _CountX  write SetCountX ;
       property CountY                      :Integer read   _CountY  write SetCountY ;
       property MarginX                     :Integer read   _MarginX write SetMarginX;
       property MarginY                     :Integer read   _MarginY write SetMarginY;
       property Item[ const X_,Y_:Integer ] :_TItem_ read GetItem    write SetItem   ; default;
       ///// メソッド
       class procedure Swap( var Array0_,Array1_:TArray2D<_TItem_> ); static;
       procedure MakeEdgeLoop;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TBricArray2D<_TItem_>

     TBricArray2D<_TItem_> = class( TArray2D<_TItem_> )
     private
     protected
       ///// アクセス
       function GetGridX :Integer;
       procedure SetGridX( const GridX_:Integer );
       function GetGridY :Integer;
       procedure SetGridY( const GridY_:Integer );
     public
       ///// プロパティ
       property Bric[ const X_,Y_:Integer ] :_TItem_ read GetItem   write SetItem  ; default;
       property BricX                       :Integer read   _CountX write SetCountX;
       property BricY                       :Integer read   _CountY write SetCountY;
       property GridX                       :Integer read GetGridX  write SetGridX ;
       property GridY                       :Integer read GetGridY  write SetGridY ;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGridArray2D<_TItem_>

     TGridArray2D<_TItem_> = class( TArray2D<_TItem_> )
     private
     protected
       ///// アクセス
       function GetBricX :Integer;
       procedure SetBricX( const BricX_:Integer );
       function GetBricY :Integer;
       procedure SetBricY( const BricY_:Integer );
     public
       constructor Create; overload;
       constructor Create( const BricX_,BricY_:Integer ); overload;
       constructor Create( const BricX_,BricY_,MarginX_,MarginY_:Integer ); overload;
       destructor Destroy; override;
       ///// プロパティ
       property Grid[ const X_,Y_:Integer ] :_TItem_ read GetItem   write SetItem  ; default;
       property GridX                       :Integer read   _CountX write SetCountX;
       property GridY                       :Integer read   _CountY write SetCountY;
       property BricX                       :Integer read GetBricX  write SetBricX ;
       property BricY                       :Integer read GetBricY  write SetBricY ;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TArray2D<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// メソッド

procedure TArray2D<_TItem_>.MakeArray;
begin
     _AllX := _MarginX + _CountX + _MarginX;
     _AllY := _MarginY + _CountY + _MarginY;

     SetLength( _Item, _AllX * _AllY );
end;

function TArray2D<_TItem_>.XYtoI( const X_,Y_:Integer ) :Integer;
begin
     Result := ( _MarginX + X_ ) + _AllX * ( _MarginY + Y_ );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

procedure TArray2D<_TItem_>.SetCountX( const CountX_:Integer );
begin
     _CountX := CountX_;  MakeArray;
end;

procedure TArray2D<_TItem_>.SetCountY( const CountY_:Integer );
begin
     _CountY := CountY_;  MakeArray;
end;

procedure TArray2D<_TItem_>.SetMarginX( const MarginX_:Integer );
begin
     _MarginX := MarginX_;  MakeArray;
end;

procedure TArray2D<_TItem_>.SetMarginY( const MarginY_:Integer );
begin
     _MarginY := MarginY_;  MakeArray;
end;

function TArray2D<_TItem_>.GetItem( const X_,Y_:Integer ) :_TItem_;
begin
     Result := _Item[ XYtoI( X_, Y_ ) ];
end;

procedure TArray2D<_TItem_>.SetItem( const X_,Y_:Integer; const Item_:_TItem_ );
begin
     _Item[ XYtoI( X_, Y_ ) ] := Item_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TArray2D<_TItem_>.Create;
begin
     Create( 0, 0 );
end;

constructor TArray2D<_TItem_>.Create( const CountX_,CountY_:Integer );
begin
     Create( CountX_, CountY_, 0 );
end;

constructor TArray2D<_TItem_>.Create( const CountX_,CountY_,Margin_:Integer );
begin
     Create( CountX_, CountY_, Margin_, Margin_ );
end;

constructor TArray2D<_TItem_>.Create( const CountX_,CountY_,MarginX_,MarginY_:Integer );
begin
     inherited Create;

     _CountX  := CountX_;
     _CountY  := CountY_;
     _MarginX := MarginX_;
     _MarginY := MarginY_;
end;

procedure TArray2D<_TItem_>.AfterConstruction;
begin
     MakeArray;
end;

destructor TArray2D<_TItem_>.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

class procedure TArray2D<_TItem_>.Swap( var Array0_,Array1_:TArray2D<_TItem_> );
var
   A :TArray2D<_TItem_>;
begin
     A := Array0_;  Array0_ := Array1_;  Array1_ := A;
end;

procedure TArray2D<_TItem_>.MakeEdgeLoop;
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

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TBricArray2D<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TBricArray2D<_TItem_>.GetGridX :Integer;
begin
     Result := BricX + 1;
end;

procedure TBricArray2D<_TItem_>.SetGridX( const GridX_:Integer );
begin
     BricX := GridX_ - 1;
end;

function TBricArray2D<_TItem_>.GetGridY :Integer;
begin
     Result := BricY + 1;
end;

procedure TBricArray2D<_TItem_>.SetGridY( const GridY_:Integer );
begin
     BricY := GridY_ - 1;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGridArray2D<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGridArray2D<_TItem_>.GetBricX :Integer;
begin
     Result := _CountX - 1;
end;

procedure TGridArray2D<_TItem_>.SetBricX( const BricX_:Integer );
begin
     _CountX  := BricX_ + 1;  MakeArray;
end;

function TGridArray2D<_TItem_>.GetBricY :Integer;
begin
     Result := _CountY - 1;
end;

procedure TGridArray2D<_TItem_>.SetBricY( const BricY_:Integer );
begin
     _CountY  := BricY_ + 1;  MakeArray;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGridArray2D<_TItem_>.Create;
begin
     Create( 0, 0 );
end;

constructor TGridArray2D<_TItem_>.Create( const BricX_,BricY_:Integer );
begin
     Create( BricX_, BricY_, 0, 0 );
end;

constructor TGridArray2D<_TItem_>.Create( const BricX_,BricY_,MarginX_,MarginY_:Integer );
begin
     inherited;

     _CountX  := BricX_ + 1;
     _CountY  := BricY_ + 1;
end;

destructor TGridArray2D<_TItem_>.Destroy;
begin

     inherited;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
