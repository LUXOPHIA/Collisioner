unit LUX.Data.Lattice.T2;

interface //#################################################################### ■

uses LUX;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TArray2D<_TItem_>

     IArray2D = interface
     ['{E4ECF85C-317F-4179-BDAE-C4495D2B2CC7}']
     {protected}
       ///// アクセス
       function GetItemByte :Integer;
       function GetElemsP0 :Pointer;
       function GetElemsX :Integer;
       function GetElemsY :Integer;
       function GetElemsN :Integer;
       function GetElemsByte :Integer;
       function GetItemsX :Integer;
       procedure SetItemsX( const ItemsX_:Integer );
       function GetItemsY :Integer;
       procedure SetItemsY( const ItemsY_:Integer );
       function GetMargsX :Integer;
       procedure SetMargsX( const MargsX_:Integer );
       function GetMargsY :Integer;
       procedure SetMargsY( const MargsY_:Integer );
     {public}
       ///// プロパティ
       property ItemByte  :Integer read GetItemByte                 ;
       property ElemsP0   :Pointer read GetElemsP0                  ;
       property ElemsX    :Integer read GetElemsX                   ;
       property ElemsY    :Integer read GetElemsY                   ;
       property ElemsN    :Integer read GetElemsN                   ;
       property ElemsByte :Integer read GetElemsByte                ;
       property ItemsX    :Integer read GetItemsX    write SetItemsX;
       property ItemsY    :Integer read GetItemsY    write SetItemsY;
       property MargsX    :Integer read GetMargsX    write SetMargsX;
       property MargsY    :Integer read GetMargsY    write SetMargsY;
     end;

     //-------------------------------------------------------------------------

     TArray2D<_TItem_> = class( TInterfacedBase, IArray2D )
     public type
       _PItem_ = ^_TItem_;
     private
       ///// メソッド
       procedure MakeArray;
       function XYtoI( const X_,Y_:Integer ) :Integer; inline;
     protected
       _Elems  :TArray<_TItem_>;
       _ElemsX :Integer;
       _ElemsY :Integer;
       _ItemsX :Integer;
       _ItemsY :Integer;
       _MargsX :Integer;
       _MargsY :Integer;
       ///// アクセス
       function GetItemByte :Integer;
       function GetElemsP0 :Pointer;
       function GetElemsX :Integer;
       function GetElemsY :Integer;
       function GetElemsN :Integer;
       function GetElemsByte :Integer;
       function GetItems( const X_,Y_:Integer ) :_TItem_;
       procedure SetItems( const X_,Y_:Integer; const Item_:_TItem_ );
       function GetItemP( const X_,Y_:Integer ) :_PItem_;
       function GetItemsX :Integer;
       procedure SetItemsX( const ItemsX_:Integer );
       function GetItemsY :Integer;
       procedure SetItemsY( const ItemsY_:Integer );
       function GetMargsX :Integer;
       procedure SetMargsX( const MargsX_:Integer );
       function GetMargsY :Integer;
       procedure SetMargsY( const MargsY_:Integer );
     public
       constructor Create; overload;
       constructor Create( const ItemsX_,ItemsY_:Integer ); overload;
       constructor Create( const ItemsX_,ItemsY_,Margs_:Integer ); overload;
       constructor Create( const ItemsX_,ItemsY_,MargsX_,MargsY_:Integer ); overload; virtual;
       procedure AfterConstruction; override;
       destructor Destroy; override;
       ///// プロパティ
       property ItemByte                     :Integer read GetItemByte                 ;
       property ElemsP0                      :Pointer read GetElemsP0                  ;
       property ElemsX                       :Integer read GetElemsX                   ;
       property ElemsY                       :Integer read GetElemsY                   ;
       property ElemsN                       :Integer read GetElemsN                   ;
       property ElemsByte                    :Integer read GetElemsByte                ;
       property Items[ const X_,Y_:Integer ] :_TItem_ read GetItems     write SetItems ; default;
       property ItemP[ const X_,Y_:Integer ] :_PItem_ read GetItemP                    ;
       property ItemsX                       :Integer read GetItemsX    write SetItemsX;
       property ItemsY                       :Integer read GetItemsY    write SetItemsY;
       property MargsX                       :Integer read GetMargsX    write SetMargsX;
       property MargsY                       :Integer read GetMargsY    write SetMargsY;
       ///// メソッド
       class procedure Swap( var Array0_,Array1_:TArray2D<_TItem_> ); static;
       procedure MakeEdgeLoop;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TBricArray2D<_TItem_>

     IBricArray2D = interface( IArray2D )
     ['{F942004C-5B06-4744-9E7C-7E5FCB6258A5}']
       ///// アクセス
       function GetGridsX :Integer;
       procedure SetGridsX( const GridX_:Integer );
       function GetGridsY :Integer;
       procedure SetGridsY( const GridY_:Integer );
       ///// プロパティ
       property BricsX :Integer read GetItemsX write SetItemsX;
       property BricsY :Integer read GetItemsY write SetItemsY;
       property GridsX :Integer read GetGridsX write SetGridsX;
       property GridsY :Integer read GetGridsY write SetGridsY;
     end;

     //-------------------------------------------------------------------------

     TBricArray2D<_TItem_> = class( TArray2D<_TItem_>, IBricArray2D )
     private
     protected
       ///// アクセス
       function GetGridsX :Integer;
       procedure SetGridsX( const GridsX_:Integer );
       function GetGridsY :Integer;
       procedure SetGridsY( const GridsY_:Integer );
     public
       ///// プロパティ
       property Brics[ const X_,Y_:Integer ] :_TItem_ read GetItems  write SetItems ; default;
       property BricsX                       :Integer read GetItemsX write SetItemsX;
       property BricsY                       :Integer read GetItemsY write SetItemsY;
       property GridsX                       :Integer read GetGridsX write SetGridsX;
       property GridsY                       :Integer read GetGridsY write SetGridsY;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGridArray2D<_TItem_>

     IGridArray2D = interface( IArray2D )
     ['{7E34AB1F-480A-4CCF-9719-7938AA1015A9}']
       ///// アクセス
       function GetBricsX :Integer;
       procedure SetBricsX( const BricsX_:Integer );
       function GetBricsY :Integer;
       procedure SetBricsY( const BricsY_:Integer );
       ///// プロパティ
       property GridsX :Integer read GetItemsX write SetItemsX;
       property GridsY :Integer read GetItemsY write SetItemsY;
       property BricsX :Integer read GetBricsX write SetBricsX;
       property BricsY :Integer read GetBricsY write SetBricsY;
     end;

     //-------------------------------------------------------------------------

     TGridArray2D<_TItem_> = class( TArray2D<_TItem_>, IGridArray2D )
     private
     protected
       ///// アクセス
       function GetBricsX :Integer;
       procedure SetBricsX( const BricsX_:Integer );
       function GetBricsY :Integer;
       procedure SetBricsY( const BricsY_:Integer );
     public
       constructor Create( const BricsX_,BricsY_,MargsX_,MargsY_:Integer ); override;
       destructor Destroy; override;
       ///// プロパティ
       property Grids[ const X_,Y_:Integer ] :_TItem_ read GetItems  write SetItems ; default;
       property GridsX                       :Integer read GetItemsX write SetItemsX;
       property GridsY                       :Integer read GetItemsY write SetItemsY;
       property BricsX                       :Integer read GetBricsX write SetBricsX;
       property BricsY                       :Integer read GetBricsY write SetBricsY;
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
     _ElemsX := _MargsX + _ItemsX + _MargsX;
     _ElemsY := _MargsY + _ItemsY + _MargsY;

     SetLength( _Elems, ElemsN );
end;

function TArray2D<_TItem_>.XYtoI( const X_,Y_:Integer ) :Integer;
begin
     Result := _ElemsX * ( _MargsY + Y_ ) + ( _MargsX + X_ );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TArray2D<_TItem_>.GetItemByte :Integer;
begin
     Result := SizeOf( _TItem_ );
end;

//------------------------------------------------------------------------------

function TArray2D<_TItem_>.GetElemsP0 :Pointer;
begin
     Result := @_Elems[ 0 ];
end;

//------------------------------------------------------------------------------

function TArray2D<_TItem_>.GetElemsX :Integer;
begin
     Result := _ElemsX;
end;

function TArray2D<_TItem_>.GetElemsY :Integer;
begin
     Result := _ElemsY;
end;

function TArray2D<_TItem_>.GetElemsN :Integer;
begin
     Result := _ElemsY * _ElemsX;
end;

function TArray2D<_TItem_>.GetElemsByte :Integer;
begin
     Result := ItemByte * ElemsN;
end;

//------------------------------------------------------------------------------

function TArray2D<_TItem_>.GetItems( const X_,Y_:Integer ) :_TItem_;
begin
     Result := _Elems[ XYtoI( X_, Y_ ) ];
end;

procedure TArray2D<_TItem_>.SetItems( const X_,Y_:Integer; const Item_:_TItem_ );
begin
     _Elems[ XYtoI( X_, Y_ ) ] := Item_;
end;

function TArray2D<_TItem_>.GetItemP( const X_,Y_:Integer ) :_PItem_;
begin
     Result := @_Elems[ XYtoI( X_, Y_ ) ];
end;

//------------------------------------------------------------------------------

function TArray2D<_TItem_>.GetItemsX :Integer;
begin
     Result := _ItemsX;
end;

procedure TArray2D<_TItem_>.SetItemsX( const ItemsX_:Integer );
begin
     _ItemsX := ItemsX_;  MakeArray;
end;

function TArray2D<_TItem_>.GetItemsY :Integer;
begin
     Result := _ItemsY;
end;

procedure TArray2D<_TItem_>.SetItemsY( const ItemsY_:Integer );
begin
     _ItemsY := ItemsY_;  MakeArray;
end;

function TArray2D<_TItem_>.GetMargsX :Integer;
begin
     Result := _MargsX;
end;

procedure TArray2D<_TItem_>.SetMargsX( const MargsX_:Integer );
begin
     _MargsX := MargsX_;  MakeArray;
end;

function TArray2D<_TItem_>.GetMargsY :Integer;
begin
     Result := _MargsY;
end;

procedure TArray2D<_TItem_>.SetMargsY( const MargsY_:Integer );
begin
     _MargsY := MargsY_;  MakeArray;
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
     inherited Create;

     _ItemsX := ItemsX_;
     _ItemsY := ItemsY_;
     _MargsX := MargsX_;
     _MargsY := MargsY_;
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

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TBricArray2D<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TBricArray2D<_TItem_>.GetGridsX :Integer;
begin
     Result := BricsX + 1;
end;

procedure TBricArray2D<_TItem_>.SetGridsX( const GridsX_:Integer );
begin
     BricsX := GridsX_ - 1;
end;

function TBricArray2D<_TItem_>.GetGridsY :Integer;
begin
     Result := BricsY + 1;
end;

procedure TBricArray2D<_TItem_>.SetGridsY( const GridsY_:Integer );
begin
     BricsY := GridsY_ - 1;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGridArray2D<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGridArray2D<_TItem_>.GetBricsX :Integer;
begin
     Result := _ItemsX - 1;
end;

procedure TGridArray2D<_TItem_>.SetBricsX( const BricsX_:Integer );
begin
     _ItemsX := BricsX_ + 1;  MakeArray;
end;

function TGridArray2D<_TItem_>.GetBricsY :Integer;
begin
     Result := _ItemsY - 1;
end;

procedure TGridArray2D<_TItem_>.SetBricsY( const BricsY_:Integer );
begin
     _ItemsY := BricsY_ + 1;  MakeArray;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGridArray2D<_TItem_>.Create( const BricsX_,BricsY_,MargsX_,MargsY_:Integer );
begin
     inherited Create( BricsX_+1, BricsY_+1,
                       MargsX_  , MargsY_   );

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
