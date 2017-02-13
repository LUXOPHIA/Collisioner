unit LUX.Lattice.T1;

interface //#################################################################### ■

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

     TArray1D<_TItem_> = class
     private
       _AllX :Integer;
       ///// メソッド
       procedure MakeArray;
       function XtoI( const X_:Integer ) :Integer; inline;
     protected
       _Item    :array of _TItem_;
       _CountX  :Integer;
       _MarginX :Integer;
       ///// アクセス
       function GetItem( const X_:Integer ) :_TItem_; virtual;
       procedure SetItem( const X_:Integer; const Item_:_TItem_ ); virtual;
       procedure SetCountX( const CountX_:Integer ); virtual;
       procedure SetMarginX( const MarginX_:Integer ); virtual;
     public
       constructor Create; overload;
       constructor Create( const CountX_:Integer ); overload;
       constructor Create( const CountX_,MarginX_:Integer ); overload;
       procedure AfterConstruction; override;
       destructor Destroy; override;
       ///// プロパティ
       property Item[ const X_:Integer ] :_TItem_ read GetItem    write SetItem   ; default;
       property Count                    :Integer read   _CountX  write SetCountX ;
       property CountX                   :Integer read   _CountX  write SetCountX ;
       property Margin                   :Integer read   _MarginX write SetMarginX;
       property MarginX                  :Integer read   _MarginX write SetMarginX;
       ///// メソッド
       class procedure Swap( var Array0_,Array1_:TArray1D<_TItem_> ); static;
       procedure MakeEdgeExten; virtual;
       procedure MakeEdgePerio; virtual; abstract;
       procedure MakeEdgeMirro; virtual; abstract;
       function AddTail( const Item_:_TItem_ ) :Integer;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TBricArray1D<_TItem_>

     TBricArray1D<_TItem_> = class( TArray1D<_TItem_> )
     private
     protected
       ///// アクセス
       function GetGridX :Integer;
       procedure SetGridX( const GridX_:Integer );
     public
       ///// プロパティ
       property Bric[ const X_:Integer ] :_TItem_ read GetItem   write SetItem  ; default;
       property BricN                    :Integer read   _CountX write SetCountX;
       property BricX                    :Integer read   _CountX write SetCountX;
       property GridN                    :Integer read GetGridX  write SetGridX ;
       property GridX                    :Integer read GetGridX  write SetGridX ;
       ///// メソッド
       procedure MakeEdgePerio; override;
       procedure MakeEdgeMirro; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGridArray1D<_TItem_>

     TGridArray1D<_TItem_> = class( TArray1D<_TItem_> )
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
       property Grid[ const X_:Integer ] :_TItem_ read GetItem   write SetItem  ; default;
       property GridN                    :Integer read   _CountX write SetCountX;
       property GridX                    :Integer read   _CountX write SetCountX;
       property BricN                    :Integer read GetBricX  write SetBricX ;
       property BricX                    :Integer read GetBricX  write SetBricX ;
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
       function Insert( const PV_:TPosval1D<_TItem_> ) :Integer; overload;
       function Insert( const Pos_:Single; const Val_:_TItem_ ) :Integer; overload;
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
     _AllX := _MarginX + _CountX + _MarginX;

     SetLength( _Item, _AllX );
end;

function TArray1D<_TItem_>.XtoI( const X_:Integer ) :Integer;
begin
     Result := _MarginX + X_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

procedure TArray1D<_TItem_>.SetCountX( const CountX_:Integer );
begin
     _CountX := CountX_;  MakeArray;
end;

procedure TArray1D<_TItem_>.SetMarginX( const MarginX_:Integer );
begin
     _MarginX := MarginX_;  MakeArray;
end;

function TArray1D<_TItem_>.GetItem( const X_:Integer ) :_TItem_;
begin
     Result := _Item[ XtoI( X_ ) ];
end;

procedure TArray1D<_TItem_>.SetItem( const X_:Integer; const Item_:_TItem_ );
begin
     _Item[ XtoI( X_ ) ] := Item_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TArray1D<_TItem_>.Create;
begin
     Create( 0, 0 );
end;

constructor TArray1D<_TItem_>.Create( const CountX_:Integer );
begin
     Create( CountX_, 0 );
end;

constructor TArray1D<_TItem_>.Create( const CountX_,MarginX_:Integer );
begin
     inherited Create;

     _CountX  := CountX_;
     _MarginX := MarginX_;
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

procedure TArray1D<_TItem_>.MakeEdgeExten;
var
   M, H, X :Integer;
begin
     {                                    H
                                          |
         -3  -2  -1  00  +1  +2  +3  +4  +5  +6  +7  +8
         ○─○─○─●─●─●─●─●─●─○─○─○
         00  00  00  ・  ・  ・  ・  ・  ・  +5  +5  +5   }

     M := _MarginX ;
     H := _CountX-1;

     for X := 0-M to 0-1 do Item[ X ] := Item[ 0 ];
     for X := H+1 to H+M do Item[ X ] := Item[ H ];
end;

function TArray1D<_TItem_>.AddTail( const Item_:_TItem_ ) :Integer;
begin
     Result := _CountX;

     Inc( _CountX );  MakeArray;

     Item[ Result ] := Item_;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TBricArray1D<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TBricArray1D<_TItem_>.GetGridX :Integer;
begin
     Result := BricX + 1;
end;

procedure TBricArray1D<_TItem_>.SetGridX( const GridX_:Integer );
begin
     BricX := GridX_ - 1;
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

     M := _MarginX ;
     N := _CountX  ;
     H := _CountX-1;

     for X := 0-M to 0-1 do Item[ X ] := Item[ X + N ];
     for X := H+1 to H+M do Item[ X ] := Item[ X - N ];
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

     M := _MarginX ;
     N := _CountX  ;
     H := _CountX-1;

     for X := 0-M to 0-1 do Item[ X ] := Item[ 0 - X - 1 ];
     for X := H+1 to H+M do Item[ X ] := Item[ H - X + N ];
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGridArray1D<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGridArray1D<_TItem_>.GetBricX :Integer;
begin
     Result := _CountX - 1;
end;

procedure TGridArray1D<_TItem_>.SetBricX( const BricX_:Integer );
begin
     _CountX  := BricX_ + 1;  MakeArray;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGridArray1D<_TItem_>.Create;
begin
     Create( 0, 0 );
end;

constructor TGridArray1D<_TItem_>.Create( const BricX_:Integer );
begin
     Create( BricX_, 0 );
end;

constructor TGridArray1D<_TItem_>.Create( const BricX_,MarginX_:Integer );
begin
     inherited;

     _CountX  := BricX_ + 1;
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

     M := _MarginX ;
     H := _CountX-1;

     for X := 0-M to 0-1 do Item[ X ] := Item[ X + H ];
     for X := H+0 to H+M do Item[ X ] := Item[ X - H ];
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

     M := _MarginX ;
     H := _CountX-1;

     for X := 0-M to 0-1 do Item[ X ] := Item[ -X       ];
     for X := H+1 to H+M do Item[ X ] := Item[ -X + 2*H ];
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
     Result := Grid[     0 ].Pos;
end;

function TIrreMap1D<_TItem_>.GetMaxPosX :Single;
begin
     Result := Grid[ BricN ].Pos;
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
     H0 := BricN;  BricN := BricN + 1;

     I1 := BricN;
     for I0 := H0 downto 0 do
     begin
          G0 := Grid[ I0 ];

          if G0.Pos <= PV_.Pos then Break;

          Grid[ I1 ] := G0;

          I1 := I0;
     end;

     Grid[ I1 ] := PV_;

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

     G0 := Grid[ I1-1 ].Val;
     G1 := Grid[ I1   ].Val;
     G2 := Grid[ I1+1 ].Val;
     G3 := Grid[ I1+2 ].Val;

     Result := Interp( G0, G1, G2, G3, Id );
end;

function TIrreMap1D<_TItem_>.InterpPos( const Pos_:Single ) :_TItem_;
var
   G0, G1, G2, G3 :TPosval1D<_TItem_>;
   I3 :Integer;
begin
     G1 := Grid[ -1 ];
     G2 := Grid[  0 ];
     G3 := Grid[ +1 ];
     for I3 := 2 to BricN+1 do
     begin
          G0 := G1;  G1 := G2;  G2 := G3;  G3 := Grid[ I3 ];

          if Pos_ <= G2.Pos then Break;
     end;

     Result := InterpPos( G0, G1, G2, G3, Pos_ );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
