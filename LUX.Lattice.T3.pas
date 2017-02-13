unit LUX.Lattice.T3;

interface //#################################################################### ■

uses System.SysUtils;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     TArray3D              = class;
     TArray3D<_TItem_>     = class;
     TBricArray3D<_TItem_> = class;
     TGridArray3D<_TItem_> = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TArray3D

     TArray3D = class
     private
     protected
       _WholeX  :Integer;
       _WholeY  :Integer;
       _WholeZ  :Integer;
       _CountX  :Integer;
       _CountY  :Integer;
       _CountZ  :Integer;
       _MarginX :Integer;
       _MarginY :Integer;
       _MarginZ :Integer;
       ///// アクセス
       function GetLines( const Y_,Z_:Integer ) :PByteArray; virtual; abstract;
       function GetItemSize :Integer; virtual; abstract;
       function GetLineSize :Integer;
       function GetStepX :Integer;
       function GetStepY :Integer;
       function GetStepZ :Integer;
       procedure SetCountX( const CountX_:Integer );
       procedure SetCountY( const CountY_:Integer );
       procedure SetCountZ( const CountZ_:Integer );
       procedure SetMarginX( const MarginX_:Integer );
       procedure SetMarginY( const MarginY_:Integer );
       procedure SetMarginZ( const MarginZ_:Integer );
       ///// メソッド
       procedure MakeArray; virtual;
       function XYZtoI( const X_,Y_,Z_:Integer ) :Integer; inline;
     public
       constructor Create; overload;
       constructor Create( const CountX_,CountY_,CountZ_:Integer ); overload;
       constructor Create( const CountX_,CountY_,CountZ_,Margin_:Integer ); overload;
       constructor Create( const CountX_,CountY_,CountZ_,MarginX_,MarginY_,MarginZ_:Integer ); overload;
       procedure AfterConstruction; override;
       destructor Destroy; override;
       ///// プロパティ
       property Lines[ const Y_,Z_:Integer ]    :PByteArray read GetLines                    ;
       property ItemSize                        :Integer    read GetItemSize                 ;
       property LineSize                        :Integer    read GetLineSize                 ;
       property StepX                           :Integer    read GetStepX                    ;
       property StepY                           :Integer    read GetStepY                    ;
       property StepZ                           :Integer    read GetStepZ                    ;
       property CountX                          :Integer    read   _CountX   write SetCountX ;
       property CountY                          :Integer    read   _CountY   write SetCountY ;
       property CountZ                          :Integer    read   _CountZ   write SetCountZ ;
       property MarginX                         :Integer    read   _MarginX  write SetMarginX;
       property MarginY                         :Integer    read   _MarginY  write SetMarginY;
       property MarginZ                         :Integer    read   _MarginZ  write SetMarginZ;
       ///// メソッド
       class procedure Swap( var Array0_,Array1_:TArray3D ); static;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TArray3D<_TItem_>

     TArray3D<_TItem_> = class( TArray3D )
     private
     protected
       _Items :TArray<_TItem_>;
       ///// アクセス
       function GetLines( const Y_,Z_:Integer ) :PByteArray; override;
       function GetItemSize :Integer; override;
       function GetItems( const X_,Y_,Z_:Integer ) :_TItem_;
       procedure SetItems( const X_,Y_,Z_:Integer; const Item_:_TItem_ );
       ///// メソッド
       procedure MakeArray; override;
     public
       ///// プロパティ
       property Items[ const X_,Y_,Z_:Integer ] :_TItem_ read GetItems write SetItems; default;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TBricArray3D<_TItem_>

     TBricArray3D<_TItem_> = class( TArray3D<_TItem_> )
     private
     protected
       ///// アクセス
       function GetGridsX :Integer;
       procedure SetGridsX( const GridX_:Integer );
       function GetGridsY :Integer;
       procedure SetGridsY( const GridY_:Integer );
       function GetGridsZ :Integer;
       procedure SetGridsZ( const GridZ_:Integer );
     public
       ///// プロパティ
       property Brics[ const X_,Y_,Z_:Integer ] :_TItem_ read GetItems  write SetItems ; default;
       property BricsX                          :Integer read   _CountX write SetCountX;
       property BricsY                          :Integer read   _CountY write SetCountY;
       property BricsZ                          :Integer read   _CountZ write SetCountZ;
       property GridsX                          :Integer read GetGridsX write SetGridsX;
       property GridsY                          :Integer read GetGridsY write SetGridsY;
       property GridsZ                          :Integer read GetGridsZ write SetGridsZ;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGridArray3D<_TItem_>

     TGridArray3D<_TItem_> = class( TArray3D<_TItem_> )
     private
     protected
       ///// アクセス
       function GetBricsX :Integer;
       procedure SetBricsX( const DivX_:Integer );
       function GetBricsY :Integer;
       procedure SetBricsY( const DivY_:Integer );
       function GetBricsZ :Integer;
       procedure SetBricsZ( const DivZ_:Integer );
     public
       constructor Create; overload;
       constructor Create( const DivX_,DivY_,DivZ_:Integer ); overload;
       constructor Create( const DivX_,DivY_,DivZ_,Margin_:Integer ); overload;
       constructor Create( const DivX_,DivY_,DivZ_,MarginX_,MarginY_,MarginZ_:Integer ); overload;
       destructor Destroy; override;
       ///// プロパティ
       property Grids[ const X_,Y_,Z_:Integer ] :_TItem_ read GetItems  write SetItems ; default;
       property GridsX :Integer read   _CountX write SetCountX;
       property GridsY :Integer read   _CountY write SetCountY;
       property GridsZ :Integer read   _CountZ write SetCountZ;
       property BricsX :Integer read GetBricsX write SetBricsX;
       property BricsY :Integer read GetBricsY write SetBricsY;
       property BricsZ :Integer read GetBricsZ write SetBricsZ;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TArray3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// メソッド

procedure TArray3D.MakeArray;
begin
     _WholeX := _MarginX + _CountX + _MarginX;
     _WholeY := _MarginY + _CountY + _MarginY;
     _WholeZ := _MarginZ + _CountZ + _MarginZ;
end;

function TArray3D.XYZtoI( const X_,Y_,Z_:Integer ) :Integer;
begin
     Result := ( _MarginX + X_ ) + _WholeX * ( ( _MarginY + Y_ ) + _WholeY * ( _MarginZ + Z_ ) );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TArray3D.GetLineSize :Integer;
begin
     Result := GetItemSize * _CountX;
end;

//------------------------------------------------------------------------------

function TArray3D.GetStepX :Integer;
begin
     Result := GetItemSize;
end;

function TArray3D.GetStepY :Integer;
begin
     Result := GetStepX * _WholeX;
end;

function TArray3D.GetStepZ :Integer;
begin
     Result := GetStepY * _WholeY;
end;

//------------------------------------------------------------------------------

procedure TArray3D.SetCountX( const CountX_:Integer );
begin
     _CountX := CountX_;  MakeArray;
end;

procedure TArray3D.SetCountY( const CountY_:Integer );
begin
     _CountY := CountY_;  MakeArray;
end;

procedure TArray3D.SetCountZ( const CountZ_:Integer );
begin
     _CountZ := CountZ_;  MakeArray;
end;

//------------------------------------------------------------------------------

procedure TArray3D.SetMarginX( const MarginX_:Integer );
begin
     _MarginX := MarginX_;  MakeArray;
end;

procedure TArray3D.SetMarginY( const MarginY_:Integer );
begin
     _MarginY := MarginY_;  MakeArray;
end;

procedure TArray3D.SetMarginZ( const MarginZ_:Integer );
begin
     _MarginZ := MarginZ_;  MakeArray;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TArray3D.Create;
begin
     Create( 0, 0, 0 );
end;

constructor TArray3D.Create( const CountX_,CountY_,CountZ_:Integer );
begin
     Create( CountX_, CountY_, CountZ_, 0 );
end;

constructor TArray3D.Create( const CountX_,CountY_,CountZ_,Margin_:Integer );
begin
     Create( CountX_, CountY_, CountZ_, Margin_, Margin_, Margin_ );
end;

constructor TArray3D.Create( const CountX_,CountY_,CountZ_,MarginX_,MarginY_,MarginZ_:Integer );
begin
     inherited Create;

     _CountX  := CountX_;
     _CountY  := CountY_;
     _CountZ  := CountZ_;
     _MarginX := MarginX_;
     _MarginY := MarginY_;
     _MarginZ := MarginZ_;
end;

procedure TArray3D.AfterConstruction;
begin
     MakeArray;
end;

destructor TArray3D.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

class procedure TArray3D.Swap( var Array0_,Array1_:TArray3D );
var
   A :TArray3D;
begin
     A := Array0_;  Array0_ := Array1_;  Array1_ := A;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TArray3D<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// メソッド

procedure TArray3D<_TItem_>.MakeArray;
begin
     inherited;

     SetLength( _Items, _WholeX * _WholeY * _WholeZ );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TArray3D<_TItem_>.GetLines( const Y_,Z_:Integer ) :PByteArray;
begin
     Result := @_Items[ XYZtoI( 0, Y_, Z_ ) ];
end;

function TArray3D<_TItem_>.GetItemSize :Integer;
begin
     Result := SizeOf( _TItem_ );
end;

//------------------------------------------------------------------------------

function TArray3D<_TItem_>.GetItems( const X_,Y_,Z_:Integer ) :_TItem_;
begin
     Result := _Items[ XYZtoI( X_, Y_, Z_ ) ];
end;

procedure TArray3D<_TItem_>.SetItems( const X_,Y_,Z_:Integer; const Item_:_TItem_ );
begin
     _Items[ XYZtoI( X_, Y_, Z_ ) ] := Item_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TBricArray3D<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TBricArray3D<_TItem_>.GetGridsX :Integer;
begin
     Result := BricsX + 1;
end;

procedure TBricArray3D<_TItem_>.SetGridsX( const GridX_:Integer );
begin
     BricsX := GridX_ - 1;
end;

function TBricArray3D<_TItem_>.GetGridsY :Integer;
begin
     Result := BricsY + 1;
end;

procedure TBricArray3D<_TItem_>.SetGridsY( const GridY_:Integer );
begin
     BricsY := GridY_ - 1;
end;

function TBricArray3D<_TItem_>.GetGridsZ :Integer;
begin
     Result := BricsZ + 1;
end;

procedure TBricArray3D<_TItem_>.SetGridsZ( const GridZ_:Integer );
begin
     BricsY := GridZ_ - 1;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGridArray3D<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGridArray3D<_TItem_>.GetBricsX :Integer;
begin
     Result := _CountX - 1;
end;

procedure TGridArray3D<_TItem_>.SetBricsX( const DivX_:Integer );
begin
     _CountX  := DivX_ + 1;  MakeArray;
end;

function TGridArray3D<_TItem_>.GetBricsY :Integer;
begin
     Result := _CountY - 1;
end;

procedure TGridArray3D<_TItem_>.SetBricsY( const DivY_:Integer );
begin
     _CountY  := DivY_ + 1;  MakeArray;
end;

function TGridArray3D<_TItem_>.GetBricsZ :Integer;
begin
     Result := _CountZ - 1;
end;

procedure TGridArray3D<_TItem_>.SetBricsZ( const DivZ_:Integer );
begin
     _CountZ  := DivZ_ + 1;  MakeArray;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGridArray3D<_TItem_>.Create;
begin
     Create( 0, 0, 0 );
end;

constructor TGridArray3D<_TItem_>.Create( const DivX_,DivY_,DivZ_:Integer );
begin
     Create( DivX_, DivY_, DivZ_, 0 );
end;

constructor TGridArray3D<_TItem_>.Create( const DivX_,DivY_,DivZ_,Margin_:Integer );
begin
     Create( DivX_, DivY_, DivZ_, Margin_, Margin_, Margin_ );
end;

constructor TGridArray3D<_TItem_>.Create( const DivX_,DivY_,DivZ_,MarginX_,MarginY_,MarginZ_:Integer );
begin
     inherited;

     _CountX  := DivX_ + 1;
     _CountY  := DivY_ + 1;
     _CountZ  := DivZ_ + 1;
end;

destructor TGridArray3D<_TItem_>.Destroy;
begin

     inherited;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
