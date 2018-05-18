unit LUX.Data.Lattice.T1;

interface //#################################################################### ■

uses System.SysUtils,
     LUX, LUX.Data.Lattice;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TPosval1D<_TItem_>

     TPosval1D<_TItem_> = record
     private
     public
       Pos :Single;
       Val :_TItem_;
       /////
       constructor Create( const Pos_:Single; const Val_:_TItem_ );
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TArray1D<_TItem_>

     IArray1D = interface( ICoreArray )
     ['{7BF64031-75DC-4CD8-9220-78D0F556C4CB}']
     {protected}
       ///// アクセス
       function GetElemsX :Integer;
       function GetItemsX :Integer;
       procedure SetItemsX( const ItemsX_:Integer );
       function GetMargsX :Integer;
       procedure SetMargsX( const MargsX_:Integer );
       function GetItemsN :Integer;
       function GetItem0P :Pointer;
     {public}
       ///// プロパティ
       property ItemByte :Integer read GetElemByte                ;
       property ElemsX   :Integer read GetElemsX                  ;
       property ItemsX   :Integer read GetItemsX   write SetItemsX;
       property MargsX   :Integer read GetMargsX   write SetMargsX;
       property ItemsN   :Integer read GetItemsN                  ;
       property Item0P   :Pointer read GetItem0P                  ;
     end;

     //-------------------------------------------------------------------------

     TArray1D<_TItem_> = class( TCoreArray<_TItem_>, IArray1D )
     public type
       _PItem_ = TCoreArray<_TItem_>._PElem_;
     private
       ///// メソッド
       function ElemsI( const X_:Integer ) :Integer; inline;
       function ItemsI( const X_:Integer ) :Integer; inline;
     protected
       _ElemsX :Integer;
       _ItemsX :Integer;
       _MargsX :Integer;
       ///// アクセス
       function GetElemsN :Integer; override;
       function GetElemsX :Integer;
       function GetElems( const X_:Integer ) :_TItem_;
       procedure SetElems( const X_:Integer; const Elem_:_TItem_ );
       function GetElemsP( const X_:Integer ) :_PItem_;
       function GetItemsX :Integer; virtual;
       procedure SetItemsX( const ItemsX_:Integer ); virtual;
       function GetMargsX :Integer;
       procedure SetMargsX( const MargsX_:Integer );
       function GetItemsN :Integer; virtual;
       function GetItems( const X_:Integer ) :_TItem_;
       procedure SetItems( const X_:Integer; const Item_:_TItem_ );
       function GetItemsP( const X_:Integer ) :_PItem_;
       function GetItem0P :Pointer;
       ///// メソッド
       procedure MakeArray; override;
     public
       constructor Create; overload;
       constructor Create( const ItemsX_:Integer ); overload;
       constructor Create( const ItemsX_,MargsX_:Integer ); overload; virtual;
       destructor Destroy; override;
       ///// プロパティ
       property ItemByte                   :Integer read GetElemByte                ;
       property ElemsX                     :Integer read GetElemsX                  ;
       property Elems[ const X_:Integer ]  :_TItem_ read GetElems    write SetElems ;
       property ElemsP[ const X_:Integer ] :_PItem_ read GetElemsP                  ;
       property ItemsX                     :Integer read GetItemsX   write SetItemsX;
       property MargsX                     :Integer read GetMargsX   write SetMargsX;
       property ItemsN                     :Integer read GetItemsN                  ;
       property Items[ const X_:Integer ]  :_TItem_ read GetItems    write SetItems ; default;
       property ItemsP[ const X_:Integer ] :_PItem_ read GetItemsP                  ;
       property Item0P                     :Pointer read GetItem0P                  ;
       ///// メソッド
       procedure MakeEdgeExten; virtual;
       procedure MakeEdgePerio; virtual; abstract;
       procedure MakeEdgeMirro; virtual; abstract;
       function AddTail( const Item_:_TItem_ ) :Integer;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TCellArray1D<_TItem_>

     ICellArray1D = interface( IArray1D )
     ['{970CB18E-E1DC-4393-A124-528256753896}']
       ///// アクセス
       function GetPoinsX :Integer;
       procedure SetPoinsX( const PoinX_:Integer );
       ///// プロパティ
       property CellsX :Integer read GetItemsX write SetItemsX;
       property PoinsX :Integer read GetPoinsX write SetPoinsX;
     end;

     //-------------------------------------------------------------------------

     TCellArray1D<_TItem_> = class( TArray1D<_TItem_>, ICellArray1D )
     private
     protected
       ///// アクセス
       function GetPoinsX :Integer;
       procedure SetPoinsX( const PoinsX_:Integer );
     public
       ///// プロパティ
       property Cells[ const X_:Integer ] :_TItem_ read GetItems  write SetItems ; default;
       property CellsX                    :Integer read GetItemsX write SetItemsX;
       property PoinsX                    :Integer read GetPoinsX write SetPoinsX;
       ///// メソッド
       procedure MakeEdgePerio; override;
       procedure MakeEdgeMirro; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TPoinArray1D<_TItem_>

     IPoinArray1D = interface( IArray1D )
     ['{9FF11CDA-0879-41D1-8025-C4323E1D4389}']
       ///// アクセス
       function GetCellsX :Integer;
       procedure SetCellsX( const CellsX_:Integer );
       ///// プロパティ
       property PoinsX :Integer read GetItemsX write SetItemsX;
       property CellsX :Integer read GetCellsX write SetCellsX;
     end;

     //-------------------------------------------------------------------------

     TPoinArray1D<_TItem_> = class( TArray1D<_TItem_>, IPoinArray1D )
     private
     protected
       ///// アクセス
       function GetCellsX :Integer;
       procedure SetCellsX( const CellsX_:Integer );
     public
       constructor Create( const CellsX_,MargsX_:Integer ); override;
       destructor Destroy; override;
       ///// プロパティ
       property Poins[ const X_:Integer ] :_TItem_ read GetItems  write SetItems ; default;
       property PoinsX                    :Integer read GetItemsX write SetItemsX;
       property CellsX                    :Integer read GetCellsX write SetCellsX;
       ///// メソッド
       procedure MakeEdgePerio; override;
       procedure MakeEdgeMirro; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TPoinMap1D<_TItem_>

     TPoinMap1D<_TItem_> = class( TPoinArray1D<_TItem_> )
     private
     protected
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TIrreMap1D<_TItem_>

     TIrreMap1D<_TItem_> = class( TPoinMap1D<TPosval1D<_TItem_>> )
     private
     protected
       ///// アクセス
       function GetMinPosX :Single;
       function GetMaxPosX :Single;
       ///// メソッド
       function Interp( const G0_,G1_,G2_,G3_:_TItem_; const Id_:Single ) :_TItem_; overload; virtual; abstract;
       function InterpPos( const G0_,G1_,G2_,G3_:TPosval1D<_TItem_>; const Pos_:Single ) :_TItem_; overload; virtual; abstract;
     public
       ///// プロパティ
       property MinPos  :Single read GetMinPosX;
       property MinPosX :Single read GetMinPosX;
       property MaxPos  :Single read GetMaxPosX;
       property MaxPosX :Single read GetMaxPosX;
       ///// メソッド
       function Interp( const I_:Single ) :_TItem_; overload; virtual;
       function InterpPos( const Pos_:Single ) :_TItem_; overload; virtual;
       function AddTail( const Pos_:Single; const Val_:_TItem_ ) :Integer; overload;
       function Insert( const PV_:TPosval1D<_TItem_> ) :Integer; overload; virtual;
       function Insert( const Pos_:Single; const Val_:_TItem_ ) :Integer; overload; virtual;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.Math;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TPosval1D<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TPosval1D<_TItem_>.Create( const Pos_:Single; const Val_:_TItem_ );
begin
     Pos := Pos_;
     Val := Val_;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TArray1D<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// メソッド

function TArray1D<_TItem_>.ElemsI( const X_:Integer ) :Integer;
begin
     Result := X_;
end;

function TArray1D<_TItem_>.ItemsI( const X_:Integer ) :Integer;
begin
     Result := _MargsX + X_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TArray1D<_TItem_>.GetElemsN :Integer;
begin
     Result := _ElemsX;
end;

//------------------------------------------------------------------------------

function TArray1D<_TItem_>.GetElemsX :Integer;
begin
     Result := _ElemsX;
end;

//------------------------------------------------------------------------------

function TArray1D<_TItem_>.GetElems( const X_:Integer ) :_TItem_;
begin
     Result := _Elems[ ElemsI( X_ ) ];
end;

procedure TArray1D<_TItem_>.SetElems( const X_:Integer; const Elem_:_TItem_ );
begin
     _Elems[ ElemsI( X_ ) ] := Elem_;
end;

function TArray1D<_TItem_>.GetElemsP( const X_:Integer ) :_PItem_;
begin
     Result := @_Elems[ ElemsI( X_ ) ];
end;

//------------------------------------------------------------------------------

function TArray1D<_TItem_>.GetItemsX :Integer;
begin
     Result := _ItemsX;
end;

procedure TArray1D<_TItem_>.SetItemsX( const ItemsX_:Integer );
begin
     _ItemsX := ItemsX_;  MakeArray;
end;

function TArray1D<_TItem_>.GetMargsX :Integer;
begin
     Result := _MargsX;
end;

procedure TArray1D<_TItem_>.SetMargsX( const MargsX_:Integer );
begin
     _MargsX := MargsX_;  MakeArray;
end;

function TArray1D<_TItem_>.GetItemsN :Integer;
begin
     Result := _ItemsX;
end;

//------------------------------------------------------------------------------

function TArray1D<_TItem_>.GetItems( const X_:Integer ) :_TItem_;
begin
     Result := _Elems[ ItemsI( X_ ) ];
end;

procedure TArray1D<_TItem_>.SetItems( const X_:Integer; const Item_:_TItem_ );
begin
     _Elems[ ItemsI( X_ ) ] := Item_;
end;

function TArray1D<_TItem_>.GetItemsP( const X_:Integer ) :_PItem_;
begin
     Result := @_Elems[ ItemsI( X_ ) ];
end;

function TArray1D<_TItem_>.GetItem0P :Pointer;
begin
     Result := GetItemsP( 0 );
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TArray1D<_TItem_>.MakeArray;
begin
     _ElemsX := _MargsX + _ItemsX + _MargsX;

     inherited;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TArray1D<_TItem_>.Create;
begin
     Create( 0, 0 );
end;

constructor TArray1D<_TItem_>.Create( const ItemsX_:Integer );
begin
     Create( ItemsX_, 0 );
end;

constructor TArray1D<_TItem_>.Create( const ItemsX_,MargsX_:Integer );
begin
     inherited Create;

     _OnChange := procedure begin end;

     _ItemsX := ItemsX_;
     _MargsX := MargsX_;
end;

destructor TArray1D<_TItem_>.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TArray1D<_TItem_>.MakeEdgeExten;
var
   M, H, X :Integer;
begin
     {                                    H
                                          |
         -3  -2  -1  00  +1  +2  +3  +4  +5  +6  +7  +8
         ○─○─○─●─●─●─●─●─●─○─○─○
         00  00  00  ・  ・  ・  ・  ・  ・  +5  +5  +5   }

     M := _MargsX  ;
     H := _ItemsX-1;

     for X := 0-M to 0-1 do Items[ X ] := Items[ 0 ];
     for X := H+1 to H+M do Items[ X ] := Items[ H ];
end;

//------------------------------------------------------------------------------

function TArray1D<_TItem_>.AddTail( const Item_:_TItem_ ) :Integer;
begin
     Result := _ItemsX;

     Inc( _ItemsX );  MakeArray;

     Items[ Result ] := Item_;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TCellArray1D<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TCellArray1D<_TItem_>.GetPoinsX :Integer;
begin
     Result := CellsX + 1;
end;

procedure TCellArray1D<_TItem_>.SetPoinsX( const PoinsX_:Integer );
begin
     CellsX := PoinsX_ - 1;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TCellArray1D<_TItem_>.MakeEdgePerio;
var
   M, N, H, X :Integer;
begin
     //                                     H   N
     //                                     |   |
     //    -3  -2  -1  00  +1  +2  +3  +4  +5  +6  +7  +8
     //  ┠─╂─╂─┣━╋━╋━╋━╋━╋━┫─╂─╂─┨
     //    +3  +4  +5  ・  ・  ・  ・  ・  ・  00  +1  +2   }

     M := _MargsX;  N := _ItemsX;  H := _ItemsX-1;

     for X := 0-M to 0-1 do Items[ X ] := Items[ X + N ];
     for X := H+1 to H+M do Items[ X ] := Items[ X - N ];
end;

procedure TCellArray1D<_TItem_>.MakeEdgeMirro;
var
   M, N, H, X :Integer;
begin
     //                                     H   N
     //                                     |   |
     //    -3  -2  -1  00  +1  +2  +3  +4  +5  +6  +7  +8
     //  ┠─╂─╂─┣━╋━╋━╋━╋━╋━┫─╂─╂─┨
     //    +2  +1  00  ・  ・  ・  ・  ・  ・  +5  +4  +3

     M := _MargsX;  N := _ItemsX;  H := _ItemsX-1;

     for X := 0-M to 0-1 do Items[ X ] := Items[ 0 - X - 1 ];
     for X := H+1 to H+M do Items[ X ] := Items[ H - X + N ];
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TPoinArray1D<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TPoinArray1D<_TItem_>.GetCellsX :Integer;
begin
     Result := _ItemsX - 1;
end;

procedure TPoinArray1D<_TItem_>.SetCellsX( const CellsX_:Integer );
begin
     _ItemsX := CellsX_ + 1;  MakeArray;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TPoinArray1D<_TItem_>.Create( const CellsX_,MargsX_:Integer );
begin
     inherited Create( CellsX_+1,
                       MargsX_   );

end;

destructor TPoinArray1D<_TItem_>.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TPoinArray1D<_TItem_>.MakeEdgePerio;
var
   M, H, X :Integer;
begin
     //                                       H
     //                                       |
     //  -3  -2  -1  00  +1  +2  +3  +4  +5  +6  +7  +8  +9
     //  ┠─╂─╂─┣━╋━╋━╋━╋━╋━┫─╂─╂─┨
     //  +3  +4  +5  ・  ・  ・  ・  ・  ・  00  +1  +2  +3

     M := _MargsX;  H := _ItemsX-1;

     for X := 0-M to 0-1 do Items[ X ] := Items[ X + H ];
     for X := H+0 to H+M do Items[ X ] := Items[ X - H ];
end;

procedure TPoinArray1D<_TItem_>.MakeEdgeMirro;
var
   M, H, X :Integer;
begin
     //                                       H
     //                                       |
     //  -3  -2  -1  00  +1  +2  +3  +4  +5  +6  +7  +8  +9
     //  ┠─╂─╂─┣━╋━╋━╋━╋━╋━┫─╂─╂─┨
     //  +3  +2  +1  ・  ・  ・  ・  ・  ・  ・  +5  +4  +3

     M := _MargsX;  H := _ItemsX-1;

     for X := 0-M to 0-1 do Items[ X ] := Items[ -X       ];
     for X := H+1 to H+M do Items[ X ] := Items[ -X + 2*H ];
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TPoinMap1D<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TIrreMap1D<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TIrreMap1D<_TItem_>.GetMinPosX :Single;
begin
     Result := Poins[ 0 ].Pos;
end;

function TIrreMap1D<_TItem_>.GetMaxPosX :Single;
begin
     Result := Poins[ CellsX ].Pos;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

function TIrreMap1D<_TItem_>.AddTail( const Pos_:Single; const Val_:_TItem_ ) :Integer;
begin
     Result := AddTail( TPosval1D<_TItem_>.Create( Pos_, Val_ ) );
end;

//------------------------------------------------------------------------------

function TIrreMap1D<_TItem_>.Insert( const PV_:TPosval1D<_TItem_> ) :Integer;
var
   H0, I0, I1 :Integer;
   G0, G1 :TPosval1D<_TItem_>;
begin
     H0 := CellsX;  CellsX := CellsX + 1;

     I1 := CellsX;
     for I0 := H0 downto 0 do
     begin
          G0 := Poins[ I0 ];

          if G0.Pos <= PV_.Pos then Break;

          Poins[ I1 ] := G0;

          I1 := I0;
     end;

     Poins[ I1 ] := PV_;

     Result := I1;
end;

function TIrreMap1D<_TItem_>.Insert( const Pos_:Single; const Val_:_TItem_ ) :Integer;
begin
     Result := Insert( TPosval1D<_TItem_>.Create( Pos_, Val_ ) );
end;

//------------------------------------------------------------------------------

function TIrreMap1D<_TItem_>.Interp( const I_:Single ) :_TItem_;
var
   I1 :Integer;
   Id :Single;
   G0, G1, G2, G3 :_TItem_;
begin
     I1 := Floor( I_ );  Id := I_ - I1;

     G0 := Poins[ I1-1 ].Val;
     G1 := Poins[ I1   ].Val;
     G2 := Poins[ I1+1 ].Val;
     G3 := Poins[ I1+2 ].Val;

     Result := Interp( G0, G1, G2, G3, Id );
end;

function TIrreMap1D<_TItem_>.InterpPos( const Pos_:Single ) :_TItem_;
var
   G0, G1, G2, G3 :TPosval1D<_TItem_>;
   I3 :Integer;
begin
     G1 := Poins[ -1 ];
     G2 := Poins[  0 ];
     G3 := Poins[ +1 ];
     for I3 := 2 to CellsX+1 do
     begin
          G0 := G1;  G1 := G2;  G2 := G3;  G3 := Poins[ I3 ];

          if Pos_ <= G2.Pos then Break;
     end;

     Result := InterpPos( G0, G1, G2, G3, Pos_ );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
