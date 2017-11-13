unit LUX.Data.Lattice.T1;

interface //#################################################################### ■

uses System.SysUtils,
     LUX;

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

     IArray1D = interface
     ['{7BF64031-75DC-4CD8-9220-78D0F556C4CB}']
       ///// アクセス
       function GetItemsX :Integer;
       procedure SetItemsX( const ItemsX_:Integer );
       function GetMargsX :Integer;
       procedure SetMargsX( const MargsX_:Integer );
       ///// プロパティ
       property ItemsX :Integer read GetItemsX write SetItemsX;
       property MargsX :Integer read GetMargsX write SetMargsX;
     end;

     TArray1D<_TItem_> = class( TInterfacedBase, IArray1D )
     public type
       _PItem_ = ^_TItem_;
     private
       _TotalX :Integer;
       ///// メソッド
       procedure MakeArray;
       function XtoI( const X_:Integer ) :Integer; inline;
     protected
       _Items  :array of _TItem_;
       _ItemsX :Integer;
       _MargsX :Integer;
       ///// アクセス
       function GetItems( const X_:Integer ) :_TItem_; virtual;
       procedure SetItems( const X_:Integer; const Item_:_TItem_ ); virtual;
       function GetItemP( const X_:Integer ) :_PItem_;
       function GetItemsX :Integer;
       procedure SetItemsX( const ItemsX_:Integer );
       function GetMargsX :Integer;
       procedure SetMargsX( const MargsX_:Integer );
     public
       ///// イベント
       _OnChange :TProc;
     public
       constructor Create; overload;
       constructor Create( const ItemsX_:Integer ); overload;
       constructor Create( const ItemsX_,MargsX_:Integer ); overload; virtual;
       procedure AfterConstruction; override;
       destructor Destroy; override;
       ///// プロパティ
       property Items[ const X_:Integer ] :_TItem_ read GetItems  write SetItems ; default;
       property ItemP[ const X_:Integer ] :_PItem_ read GetItemP                 ;
       property ItemsN                    :Integer read GetItemsX write SetItemsX;
       property ItemsX                    :Integer read GetItemsX write SetItemsX;
       property MargsN                    :Integer read GetMargsX write SetMargsX;
       property MargsX                    :Integer read GetMargsX write SetMargsX;
       ///// メソッド
       class procedure Swap( var Array0_,Array1_:TArray1D<_TItem_> ); static;
       procedure MakeEdgeExten; virtual;
       procedure MakeEdgePerio; virtual; abstract;
       procedure MakeEdgeMirro; virtual; abstract;
       function AddTail( const Item_:_TItem_ ) :Integer;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TBricArray1D<_TItem_>

     IBricArray1D = interface( IArray1D )
     ['{970CB18E-E1DC-4393-A124-528256753896}']
       ///// アクセス
       function GetGridsX :Integer;
       procedure SetGridsX( const GridX_:Integer );
       ///// プロパティ
       property BricsX :Integer read GetItemsX write SetItemsX;
       property GridsX :Integer read GetGridsX write SetGridsX;
     end;

     TBricArray1D<_TItem_> = class( TArray1D<_TItem_>, IBricArray1D )
     private
     protected
       ///// アクセス
       function GetGridsX :Integer;
       procedure SetGridsX( const GridsX_:Integer );
     public
       ///// プロパティ
       property Brics[ const X_:Integer ] :_TItem_ read GetItems  write SetItems ; default;
       property BricsN                    :Integer read GetItemsX write SetItemsX;
       property BricsX                    :Integer read GetItemsX write SetItemsX;
       property GridsN                    :Integer read GetGridsX write SetGridsX;
       property GridsX                    :Integer read GetGridsX write SetGridsX;
       ///// メソッド
       procedure MakeEdgePerio; override;
       procedure MakeEdgeMirro; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGridArray1D<_TItem_>

     IGridArray1D = interface( IArray1D )
     ['{9FF11CDA-0879-41D1-8025-C4323E1D4389}']
       ///// アクセス
       function GetBricsX :Integer;
       procedure SetBricsX( const BricsX_:Integer );
       ///// プロパティ
       property GridsX :Integer read GetItemsX write SetItemsX;
       property BricsX :Integer read GetBricsX write SetBricsX;
     end;

     TGridArray1D<_TItem_> = class( TArray1D<_TItem_>, IGridArray1D )
     private
     protected
       ///// アクセス
       function GetBricsX :Integer;
       procedure SetBricsX( const BricsX_:Integer );
     public
       constructor Create( const BricsX_,MargsX_:Integer ); override;
       destructor Destroy; override;
       ///// プロパティ
       property Grids[ const X_:Integer ] :_TItem_ read GetItems  write SetItems ; default;
       property GridsN                    :Integer read GetItemsX write SetItemsX;
       property GridsX                    :Integer read GetItemsX write SetItemsX;
       property BricsN                    :Integer read GetBricsX write SetBricsX;
       property BricsX                    :Integer read GetBricsX write SetBricsX;
       ///// メソッド
       procedure MakeEdgePerio; override;
       procedure MakeEdgeMirro; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGridMap1D<_TItem_>

     TGridMap1D<_TItem_> = class( TGridArray1D<_TItem_> )
     private
     protected
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TIrreMap1D<_TItem_>

     TIrreMap1D<_TItem_> = class( TGridMap1D<TPosval1D<_TItem_>> )
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

procedure TArray1D<_TItem_>.MakeArray;
begin
     _TotalX := _MargsX + _ItemsX + _MargsX;

     SetLength( _Items, _TotalX );

     _OnChange;
end;

function TArray1D<_TItem_>.XtoI( const X_:Integer ) :Integer;
begin
     Result := _MargsX + X_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TArray1D<_TItem_>.GetItems( const X_:Integer ) :_TItem_;
begin
     Result := _Items[ XtoI( X_ ) ];
end;

procedure TArray1D<_TItem_>.SetItems( const X_:Integer; const Item_:_TItem_ );
begin
     _Items[ XtoI( X_ ) ] := Item_;
end;

function TArray1D<_TItem_>.GetItemP( const X_:Integer ) :_PItem_;
begin
     Result := @_Items[ XtoI( X_ ) ];
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

procedure TArray1D<_TItem_>.AfterConstruction;
begin
     MakeArray;
end;

destructor TArray1D<_TItem_>.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

class procedure TArray1D<_TItem_>.Swap( var Array0_,Array1_:TArray1D<_TItem_> );
var
   A :TArray1D<_TItem_>;
begin
     A := Array0_;  Array0_ := Array1_;  Array1_ := A;
end;

//------------------------------------------------------------------------------

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

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TBricArray1D<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TBricArray1D<_TItem_>.GetGridsX :Integer;
begin
     Result := BricsX + 1;
end;

procedure TBricArray1D<_TItem_>.SetGridsX( const GridsX_:Integer );
begin
     BricsX := GridsX_ - 1;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TBricArray1D<_TItem_>.MakeEdgePerio;
var
   M, N, H, X :Integer;
begin
     {                                    H   N
                                          |   |
         -3  -2  -1  00  +1  +2  +3  +4  +5  +6  +7  +8
       ┠─╂─╂─┣━╋━╋━╋━╋━╋━┫─╂─╂─┨
         +3  +4  +5  ・  ・  ・  ・  ・  ・  00  +1  +2   }

     M := _MargsX  ;
     N := _ItemsX  ;
     H := _ItemsX-1;

     for X := 0-M to 0-1 do Items[ X ] := Items[ X + N ];
     for X := H+1 to H+M do Items[ X ] := Items[ X - N ];
end;

procedure TBricArray1D<_TItem_>.MakeEdgeMirro;
var
   M, N, H, X :Integer;
begin
     {                                    H   N
                                          |   |
         -3  -2  -1  00  +1  +2  +3  +4  +5  +6  +7  +8
       ┠─╂─╂─┣━╋━╋━╋━╋━╋━┫─╂─╂─┨
         +2  +1  00  ・  ・  ・  ・  ・  ・  +5  +4  +3   }

     M := _MargsX  ;
     N := _ItemsX  ;
     H := _ItemsX-1;

     for X := 0-M to 0-1 do Items[ X ] := Items[ 0 - X - 1 ];
     for X := H+1 to H+M do Items[ X ] := Items[ H - X + N ];
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGridArray1D<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGridArray1D<_TItem_>.GetBricsX :Integer;
begin
     Result := _ItemsX - 1;
end;

procedure TGridArray1D<_TItem_>.SetBricsX( const BricsX_:Integer );
begin
     _ItemsX := BricsX_ + 1;  MakeArray;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGridArray1D<_TItem_>.Create( const BricsX_,MargsX_:Integer );
begin
     inherited Create( BricsX_+1,
                       MargsX_   );

end;

destructor TGridArray1D<_TItem_>.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGridArray1D<_TItem_>.MakeEdgePerio;
var
   M, H, X :Integer;
begin
     {                                      H
                                            |
       -3  -2  -1  00  +1  +2  +3  +4  +5  +6  +7  +8  +9
       ┠─╂─╂─┣━╋━╋━╋━╋━╋━┫─╂─╂─┨
       +3  +4  +5  ・  ・  ・  ・  ・  ・  00  +1  +2  +3 }

     M := _MargsX  ;
     H := _ItemsX-1;

     for X := 0-M to 0-1 do Items[ X ] := Items[ X + H ];
     for X := H+0 to H+M do Items[ X ] := Items[ X - H ];
end;

procedure TGridArray1D<_TItem_>.MakeEdgeMirro;
var
   M, H, X :Integer;
begin
     {                                      H
                                            |
       -3  -2  -1  00  +1  +2  +3  +4  +5  +6  +7  +8  +9
       ┠─╂─╂─┣━╋━╋━╋━╋━╋━┫─╂─╂─┨
       +3  +2  +1  ・  ・  ・  ・  ・  ・  ・  +5  +4  +3 }

     M := _MargsX  ;
     H := _ItemsX-1;

     for X := 0-M to 0-1 do Items[ X ] := Items[ -X       ];
     for X := H+1 to H+M do Items[ X ] := Items[ -X + 2*H ];
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGridMap1D<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TIrreMap1D<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TIrreMap1D<_TItem_>.GetMinPosX :Single;
begin
     Result := Grids[ 0 ].Pos;
end;

function TIrreMap1D<_TItem_>.GetMaxPosX :Single;
begin
     Result := Grids[ BricsN ].Pos;
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
     H0 := BricsN;  BricsN := BricsN + 1;

     I1 := BricsN;
     for I0 := H0 downto 0 do
     begin
          G0 := Grids[ I0 ];

          if G0.Pos <= PV_.Pos then Break;

          Grids[ I1 ] := G0;

          I1 := I0;
     end;

     Grids[ I1 ] := PV_;

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

     G0 := Grids[ I1-1 ].Val;
     G1 := Grids[ I1   ].Val;
     G2 := Grids[ I1+1 ].Val;
     G3 := Grids[ I1+2 ].Val;

     Result := Interp( G0, G1, G2, G3, Id );
end;

function TIrreMap1D<_TItem_>.InterpPos( const Pos_:Single ) :_TItem_;
var
   G0, G1, G2, G3 :TPosval1D<_TItem_>;
   I3 :Integer;
begin
     G1 := Grids[ -1 ];
     G2 := Grids[  0 ];
     G3 := Grids[ +1 ];
     for I3 := 2 to BricsN+1 do
     begin
          G0 := G1;  G1 := G2;  G2 := G3;  G3 := Grids[ I3 ];

          if Pos_ <= G2.Pos then Break;
     end;

     Result := InterpPos( G0, G1, G2, G3, Pos_ );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
