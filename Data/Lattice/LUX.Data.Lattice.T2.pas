unit LUX.Data.Lattice.T2;

interface //#################################################################### ■

uses LUX, LUX.Data.Lattice, LUX.Data.Lattice.T1;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TArray2D<_TItem_>

     IArray2D = interface( IArray1D )
     ['{E4ECF85C-317F-4179-BDAE-C4495D2B2CC7}']
     {protected}
       ///// アクセス
       function GetElemsY :Integer;
       function GetItemsY :Integer;
       procedure SetItemsY( const ItemsY_:Integer );
       function GetMargsY :Integer;
       procedure SetMargsY( const MargsY_:Integer );
       function GetItemsN :Integer;
     {public}
       ///// プロパティ
       property ElemsY :Integer read GetElemsY                ;
       property ItemsY :Integer read GetItemsY write SetItemsY;
       property MargsY :Integer read GetMargsY write SetMargsY;
       property ItemsN :Integer read GetItemsN                ;
     end;

     //-------------------------------------------------------------------------

     TArray2D<_TItem_> = class( TArray1D<_TItem_>, IArray2D )
     public type
       _PItem_ = TCoreArray<_TItem_>._PElem_;
     private
       ///// メソッド
       function ElemsI( const X_,Y_:Integer ) :Integer; inline;
       function ItemsI( const X_,Y_:Integer ) :Integer; inline;
     protected
       _ElemsY :Integer;
       _ItemsY :Integer;
       _MargsY :Integer;
       ///// アクセス
       function GetElemsN :Integer; override;
       function GetElemsY :Integer;
       function GetElems( const X_,Y_:Integer ) :_TItem_;
       procedure SetElems( const X_,Y_:Integer; const Elem_:_TItem_ );
       function GetElemsP( const X_,Y_:Integer ) :_PItem_;
       function GetItemsY :Integer;
       procedure SetItemsY( const ItemsY_:Integer );
       function GetMargsY :Integer;
       procedure SetMargsY( const MargsY_:Integer );
       function GetItemsN :Integer; override;
       function GetItems( const X_,Y_:Integer ) :_TItem_;
       procedure SetItems( const X_,Y_:Integer; const Item_:_TItem_ );
       function GetItemsP( const X_,Y_:Integer ) :_PItem_;
       function GetItem0P :Pointer;
       ///// メソッド
       procedure MakeArray; override;
     public
       constructor Create; overload;
       constructor Create( const ItemsX_,ItemsY_:Integer ); reintroduce; overload;
       constructor Create( const ItemsX_,ItemsY_,Margs_:Integer ); overload;
       constructor Create( const ItemsX_,ItemsY_,MargsX_,MargsY_:Integer ); overload; virtual;
       destructor Destroy; override;
       ///// プロパティ
       property ElemsY                        :Integer read GetElemsY                ;
       property Elems[ const X_,Y_:Integer ]  :_TItem_ read GetElems  write SetElems ;
       property ElemsP[ const X_,Y_:Integer ] :_PItem_ read GetElemsP                ;
       property ItemsY                        :Integer read GetItemsY write SetItemsY;
       property MargsY                        :Integer read GetMargsY write SetMargsY;
       property ItemsN                        :Integer read GetItemsN                ;
       property Items[ const X_,Y_:Integer ]  :_TItem_ read GetItems  write SetItems ; default;
       property ItemsP[ const X_,Y_:Integer ] :_PItem_ read GetItemsP                ;
       property Item0P                        :Pointer read GetItem0P                ;
       ///// メソッド
       procedure MakeEdgeLoop;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TCellArray2D<_TItem_>

     ICellArray2D = interface( IArray2D )
     ['{F942004C-5B06-4744-9E7C-7E5FCB6258A5}']
       ///// アクセス
       function GetPoinsX :Integer;
       procedure SetPoinsX( const PoinX_:Integer );
       function GetPoinsY :Integer;
       procedure SetPoinsY( const PoinY_:Integer );
       ///// プロパティ
       property CellsX :Integer read GetItemsX write SetItemsX;
       property CellsY :Integer read GetItemsY write SetItemsY;
       property PoinsX :Integer read GetPoinsX write SetPoinsX;
       property PoinsY :Integer read GetPoinsY write SetPoinsY;
     end;

     //-------------------------------------------------------------------------

     TCellArray2D<_TItem_> = class( TArray2D<_TItem_>, ICellArray2D )
     private
     protected
       ///// アクセス
       function GetPoinsX :Integer;
       procedure SetPoinsX( const PoinsX_:Integer );
       function GetPoinsY :Integer;
       procedure SetPoinsY( const PoinsY_:Integer );
     public
       ///// プロパティ
       property Cells[ const X_,Y_:Integer ] :_TItem_ read GetItems  write SetItems ; default;
       property CellsX                       :Integer read GetItemsX write SetItemsX;
       property CellsY                       :Integer read GetItemsY write SetItemsY;
       property PoinsX                       :Integer read GetPoinsX write SetPoinsX;
       property PoinsY                       :Integer read GetPoinsY write SetPoinsY;
       ///// メソッド
       procedure MakeEdgePerio; override;
       procedure MakeEdgeMirro; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TPoinArray2D<_TItem_>

     IPoinArray2D = interface( IArray2D )
     ['{7E34AB1F-480A-4CCF-9719-7938AA1015A9}']
       ///// アクセス
       function GetCellsX :Integer;
       procedure SetCellsX( const CellsX_:Integer );
       function GetCellsY :Integer;
       procedure SetCellsY( const CellsY_:Integer );
       ///// プロパティ
       property PoinsX :Integer read GetItemsX write SetItemsX;
       property PoinsY :Integer read GetItemsY write SetItemsY;
       property CellsX :Integer read GetCellsX write SetCellsX;
       property CellsY :Integer read GetCellsY write SetCellsY;
     end;

     //-------------------------------------------------------------------------

     TPoinArray2D<_TItem_> = class( TArray2D<_TItem_>, IPoinArray2D )
     private
     protected
       ///// アクセス
       function GetCellsX :Integer;
       procedure SetCellsX( const CellsX_:Integer );
       function GetCellsY :Integer;
       procedure SetCellsY( const CellsY_:Integer );
     public
       constructor Create( const CellsX_,CellsY_,MargsX_,MargsY_:Integer ); override;
       destructor Destroy; override;
       ///// プロパティ
       property Poins[ const X_,Y_:Integer ] :_TItem_ read GetItems  write SetItems ; default;
       property PoinsX                       :Integer read GetItemsX write SetItemsX;
       property PoinsY                       :Integer read GetItemsY write SetItemsY;
       property CellsX                       :Integer read GetCellsX write SetCellsX;
       property CellsY                       :Integer read GetCellsY write SetCellsY;
       ///// メソッド
       procedure MakeEdgePerio; override;
       procedure MakeEdgeMirro; override;
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

function TArray2D<_TItem_>.ElemsI( const X_,Y_:Integer ) :Integer;
begin
     Result := Y_ * _ElemsX + X_;
end;

function TArray2D<_TItem_>.ItemsI( const X_,Y_:Integer ) :Integer;
begin
     Result := ( _MargsY + Y_ ) * _ElemsX + ( _MargsX + X_ );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TArray2D<_TItem_>.GetElemsN :Integer;
begin
     Result := _ElemsY * _ElemsX;
end;

//------------------------------------------------------------------------------

function TArray2D<_TItem_>.GetElemsY :Integer;
begin
     Result := _ElemsY;
end;

//------------------------------------------------------------------------------

function TArray2D<_TItem_>.GetElems( const X_,Y_:Integer ) :_TItem_;
begin
     Result := _Elems[ ElemsI( X_, Y_ ) ];
end;

procedure TArray2D<_TItem_>.SetElems( const X_,Y_:Integer; const Elem_:_TItem_ );
begin
     _Elems[ ElemsI( X_, Y_ ) ] := Elem_;
end;

function TArray2D<_TItem_>.GetElemsP( const X_,Y_:Integer ) :_PItem_;
begin
     Result := @_Elems[ ElemsI( X_, Y_ ) ];
end;

//------------------------------------------------------------------------------

function TArray2D<_TItem_>.GetItemsY :Integer;
begin
     Result := _ItemsY;
end;

procedure TArray2D<_TItem_>.SetItemsY( const ItemsY_:Integer );
begin
     _ItemsY := ItemsY_;  MakeArray;
end;

function TArray2D<_TItem_>.GetMargsY :Integer;
begin
     Result := _MargsY;
end;

procedure TArray2D<_TItem_>.SetMargsY( const MargsY_:Integer );
begin
     _MargsY := MargsY_;  MakeArray;
end;

function TArray2D<_TItem_>.GetItemsN :Integer;
begin
     Result := _ItemsY * _ItemsX;
end;

//------------------------------------------------------------------------------

function TArray2D<_TItem_>.GetItems( const X_,Y_:Integer ) :_TItem_;
begin
     Result := _Elems[ ItemsI( X_, Y_ ) ];
end;

procedure TArray2D<_TItem_>.SetItems( const X_,Y_:Integer; const Item_:_TItem_ );
begin
     _Elems[ ItemsI( X_, Y_ ) ] := Item_;
end;

function TArray2D<_TItem_>.GetItemsP( const X_,Y_:Integer ) :_PItem_;
begin
     Result := @_Elems[ ItemsI( X_, Y_ ) ];
end;

function TArray2D<_TItem_>.GetItem0P :Pointer;
begin
     Result := GetItemsP( 0, 0 );
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TArray2D<_TItem_>.MakeArray;
begin
     _ElemsY := _MargsY + _ItemsY + _MargsY;

     inherited;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TArray2D<_TItem_>.Create;
begin
     Create( 0, 0 );
end;

constructor TArray2D<_TItem_>.Create( const ItemsX_,ItemsY_:Integer );
begin
     Create( ItemsX_, ItemsY_, 0 );
end;

constructor TArray2D<_TItem_>.Create( const ItemsX_,ItemsY_,Margs_:Integer );
begin
     Create( ItemsX_, ItemsY_, Margs_, Margs_ );
end;

constructor TArray2D<_TItem_>.Create( const ItemsX_,ItemsY_,MargsX_,MargsY_:Integer );
begin
     inherited Create( ItemsX_, MargsX_ );

     _ItemsY := ItemsY_;
     _MargsY := MargsY_;
end;

destructor TArray2D<_TItem_>.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TArray2D<_TItem_>.MakeEdgeLoop;
var
   EX, EY, MX, MY :Integer;
begin
     for EY := -_MargsY to -1 do
     begin
          MY := EY + _ItemsY;

          for EX := -_MargsX to                -1 do Items[ EX, EY ] := Items[ EX + _ItemsX, MY ];
          for EX :=  0       to _ItemsX        -1 do Items[ EX, EY ] := Items[ EX          , MY ];
          for EX :=  _ItemsX to _ItemsX+_MargsX-1 do Items[ EX, EY ] := Items[ EX - _ItemsX, MY ];
     end;

     for EY := 0 to _ItemsY-1 do
     begin
          for EX := -_MargsX to                -1 do Items[ EX, EY ] := Items[ EX + _ItemsX, EY ];

          for EX :=  _ItemsX to _ItemsX+_MargsX-1 do Items[ EX, EY ] := Items[ EX - _ItemsX, EY ];
     end;

     for EY := _ItemsY to _ItemsY+_MargsY-1 do
     begin
          MY := EY - _ItemsY;

          for EX := -_MargsX to                -1 do Items[ EX, EY ] := Items[ EX + _ItemsX, MY ];
          for EX :=  0       to _ItemsX        -1 do Items[ EX, EY ] := Items[ EX          , MY ];
          for EX :=  _ItemsX to _ItemsX+_MargsX-1 do Items[ EX, EY ] := Items[ EX - _ItemsX, MY ];
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TCellArray2D<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TCellArray2D<_TItem_>.GetPoinsX :Integer;
begin
     Result := CellsX + 1;
end;

procedure TCellArray2D<_TItem_>.SetPoinsX( const PoinsX_:Integer );
begin
     CellsX := PoinsX_ - 1;
end;

function TCellArray2D<_TItem_>.GetPoinsY :Integer;
begin
     Result := CellsY + 1;
end;

procedure TCellArray2D<_TItem_>.SetPoinsY( const PoinsY_:Integer );
begin
     CellsY := PoinsY_ - 1;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TCellArray2D<_TItem_>.MakeEdgePerio;
var
   MX, MY, NX, NY, HX, HY, X, Y :Integer;
begin
     //                                     H   N
     //                                     |   |
     //    -3  -2  -1  00  +1  +2  +3  +4  +5  +6  +7  +8
     //  ┠─╂─╂─┣━╋━╋━╋━╋━╋━┫─╂─╂─┨
     //    +3  +4  +5  ・  ・  ・  ・  ・  ・  00  +1  +2

     MX := _MargsX;  NX := _ItemsX;  HX := _ItemsX-1;
     MY := _MargsY;  NY := _ItemsY;  HY := _ItemsY-1;

     for Y := 00 to HY do
     begin
          for X := 00-MX to 00-01 do Items[ X, Y ] := Items[ X + NX, Y ];
          for X := HX+01 to HX+MX do Items[ X, Y ] := Items[ X - NX, Y ];
     end;

     for X := 00-MX to HX+MX do
     begin
          for Y := 00-MY to 00-01 do Items[ X, Y ] := Items[ X, Y + NY ];
          for Y := HY+01 to HY+MY do Items[ X, Y ] := Items[ X, Y - NY ];
     end;
end;

procedure TCellArray2D<_TItem_>.MakeEdgeMirro;
var
   MX, MY, NX, NY, HX, HY, X, Y :Integer;
begin
     //                                     H   N
     //                                     |   |
     //    -3  -2  -1  00  +1  +2  +3  +4  +5  +6  +7  +8
     //  ┠─╂─╂─┣━╋━╋━╋━╋━╋━┫─╂─╂─┨
     //    +2  +1  00  ・  ・  ・  ・  ・  ・  +5  +4  +3   }

     MX := _MargsX;  NX := _ItemsX;  HX := _ItemsX-1;
     MY := _MargsY;  NY := _ItemsY;  HY := _ItemsY-1;

     for Y := 00 to HY do
     begin
          for X := 00-MX to 00-01 do Items[ X, Y ] := Items[ 00 - X - 01, Y ];
          for X := HX+01 to HX+MX do Items[ X, Y ] := Items[ HX - X + NX, Y ];
     end;

     for X := 00-MX to HX+MX do
     begin
          for Y := 00-MY to 00-01 do Items[ X, Y ] := Items[ X, 00 - Y - 01 ];
          for Y := HY+01 to HY+MY do Items[ X, Y ] := Items[ X, HY - Y + NY ];
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TPoinArray2D<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TPoinArray2D<_TItem_>.GetCellsX :Integer;
begin
     Result := _ItemsX - 1;
end;

procedure TPoinArray2D<_TItem_>.SetCellsX( const CellsX_:Integer );
begin
     _ItemsX := CellsX_ + 1;  MakeArray;
end;

function TPoinArray2D<_TItem_>.GetCellsY :Integer;
begin
     Result := _ItemsY - 1;
end;

procedure TPoinArray2D<_TItem_>.SetCellsY( const CellsY_:Integer );
begin
     _ItemsY := CellsY_ + 1;  MakeArray;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TPoinArray2D<_TItem_>.Create( const CellsX_,CellsY_,MargsX_,MargsY_:Integer );
begin
     inherited Create( CellsX_+1, CellsY_+1,
                       MargsX_  , MargsY_   );

end;

destructor TPoinArray2D<_TItem_>.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TPoinArray2D<_TItem_>.MakeEdgePerio;
var
   MX, MY, HX, HY, X, Y :Integer;
begin
     //                                       H
     //                                       |
     //  -3  -2  -1  00  +1  +2  +3  +4  +5  +6  +7  +8  +9
     //  ┠─╂─╂─┣━╋━╋━╋━╋━╋━┫─╂─╂─┨
     //  +3  +4  +5  ・  ・  ・  ・  ・  ・  00  +1  +2  +3

     MX := _MargsX;  HX := _ItemsX-1;
     MY := _MargsX;  HY := _ItemsX-1;

     for Y := 00 to HY do
     begin
          for X := 00-MX to 00-01 do Items[ X, Y ] := Items[ X + HX, Y ];
          for X := HX+00 to HX+MX do Items[ X, Y ] := Items[ X - HX, Y ];
     end;

     for X := 00-MX to HX+MX do
     begin
          for Y := 00-MY to 00-01 do Items[ X, Y ] := Items[ X, Y + HY ];
          for Y := HY+00 to HY+MY do Items[ X, Y ] := Items[ X, Y - HY ];
     end;
end;

procedure TPoinArray2D<_TItem_>.MakeEdgeMirro;
var
   MX, MY, HX, HY, X, Y :Integer;
begin
     //                                       H
     //                                       |
     //  -3  -2  -1  00  +1  +2  +3  +4  +5  +6  +7  +8  +9
     //  ┠─╂─╂─┣━╋━╋━╋━╋━╋━┫─╂─╂─┨
     //  +3  +2  +1  ・  ・  ・  ・  ・  ・  ・  +5  +4  +3

     MX := _MargsX;  HX := _ItemsX-1;
     MY := _MargsX;  HY := _ItemsX-1;

     for Y := 00 to HY do
     begin
          for X := 00-MX to 00-01 do Items[ X, Y ] := Items[ -X       , Y ];
          for X := HX+01 to HX+MX do Items[ X, Y ] := Items[ -X + 2*HX, Y ];
     end;

     for X := 00-MX to HX+MX do
     begin
          for Y := 00-MY to 00-01 do Items[ X, Y ] := Items[ X, -Y        ];
          for Y := HY+01 to HY+MY do Items[ X, Y ] := Items[ X, -Y + 2*HY ];
     end;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
