unit LUX.Data.Lattice.T3;

interface //#################################################################### ■

uses System.SysUtils, System.Classes,
     LUX, LUX.D3;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     TArray3D<_TItem_>     = class;
     TBricArray3D<_TItem_> = class;
     TGridArray3D<_TItem_> = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TArray3D<_TItem_>

     IArray3D = interface
     ['{2ED01C38-BB77-4958-83DE-E4F723A74774}']
       ///// アクセス
       function GetItemsX :Integer;
       procedure SetItemsX( const ItemsX_:Integer );
       function GetItemsY :Integer;
       procedure SetItemsY( const ItemsY_:Integer );
       function GetItemsZ :Integer;
       procedure SetItemsZ( const ItemsZ_:Integer );
       function GetMargsX :Integer;
       procedure SetMargsX( const MargsX_:Integer );
       function GetMargsY :Integer;
       procedure SetMargsY( const MargsY_:Integer );
       function GetMargsZ :Integer;
       procedure SetMargsZ( const MargsZ_:Integer );
       ///// プロパティ
       property ItemsX :Integer read GetItemsX write SetItemsX;
       property ItemsY :Integer read GetItemsY write SetItemsY;
       property ItemsZ :Integer read GetItemsZ write SetItemsZ;
       property MargsX :Integer read GetMargsX write SetMargsX;
       property MargsY :Integer read GetMargsY write SetMargsY;
       property MargsZ :Integer read GetMargsZ write SetMargsZ;
     end;

     TArray3D<_TItem_> = class( TInterfacedBase, IArray3D )
     public type
       _PItem_ = ^_TItem_;
     private
       _TotalX :Integer;
       _TotalY :Integer;
       _TotalZ :Integer;
       ///// メソッド
       procedure MakeArray; virtual;
       function XYZtoI( const X_,Y_,Z_:Integer ) :Integer; inline;
     protected
       _Items  :TArray<_TItem_>;
       _ItemsX :Integer;
       _ItemsY :Integer;
       _ItemsZ :Integer;
       _MargsX :Integer;
       _MargsY :Integer;
       _MargsZ :Integer;
       ///// アクセス
       function GetItems( const X_,Y_,Z_:Integer ) :_TItem_;
       procedure SetItems( const X_,Y_,Z_:Integer; const Item_:_TItem_ );
       function GetItemP( const X_,Y_,Z_:Integer ) :_PItem_;
       function GetItemsX :Integer;
       procedure SetItemsX( const ItemsX_:Integer );
       function GetItemsY :Integer;
       procedure SetItemsY( const ItemsY_:Integer );
       function GetItemsZ :Integer;
       procedure SetItemsZ( const ItemsZ_:Integer );
       function GetMargsX :Integer;
       procedure SetMargsX( const MargsX_:Integer );
       function GetMargsY :Integer;
       procedure SetMargsY( const MargsY_:Integer );
       function GetMargsZ :Integer;
       procedure SetMargsZ( const MargsZ_:Integer );
       function GetItemSize :Integer;
       function GetTotalN :Integer;
       function GetTotalSize :Integer;

       function GetLines( const Y_,Z_:Integer ) :PByteArray;
       function GetLineSize :Integer;
       function GetStepX :Integer;
       function GetStepY :Integer;
       function GetStepZ :Integer;
     public
       constructor Create; overload;
       constructor Create( const ItemsX_,ItemsY_,ItemsZ_:Integer ); overload;
       constructor Create( const ItemsX_,ItemsY_,ItemsZ_,Margs_:Integer ); overload;
       constructor Create( const ItemsX_,ItemsY_,ItemsZ_,MargsX_,MargsY_,MargsZ_:Integer ); overload; virtual;
       procedure AfterConstruction; override;
       destructor Destroy; override;
       ///// プロパティ
       property Items[ const X_,Y_,Z_:Integer ] :_TItem_    read GetItems    write SetItems ; default;
       property ItemP[ const X_,Y_,Z_:Integer ] :_PItem_    read GetItemP                   ;
       property ItemsX                          :Integer    read GetItemsX   write SetItemsX;
       property ItemsY                          :Integer    read GetItemsY   write SetItemsY;
       property ItemsZ                          :Integer    read GetItemsZ   write SetItemsZ;
       property MargsX                          :Integer    read GetMargsX   write SetMargsX;
       property MargsY                          :Integer    read GetMargsY   write SetMargsY;
       property MargsZ                          :Integer    read GetMargsZ   write SetMargsZ;
       property ItemSize                        :Integer    read GetItemSize                ;
       property TotalN                          :Integer    read GetTotalN                  ;
       property TotalSize                       :Integer    read GetTotalSize               ;

       property Lines[ const Y_,Z_:Integer ]    :PByteArray read GetLines                   ;
       property LineSize                        :Integer    read GetLineSize                ;
       property StepX                           :Integer    read GetStepX                   ;
       property StepY                           :Integer    read GetStepY                   ;
       property StepZ                           :Integer    read GetStepZ                   ;
       ///// メソッド
       class procedure Swap( var Array0_,Array1_:TArray3D<_TItem_> ); static;
       procedure Read( const Stream_:TStream ); virtual;
       procedure Write( const Stream_:TStream ); virtual;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TBricArray3D<_TItem_>

     IBricArray3D = interface( IArray3D )
     ['{40BD11E7-4BF9-43F3-BE98-846C78B22EFD}']
       ///// アクセス
       function GetGridsX :Integer;
       procedure SetGridsX( const GridX_:Integer );
       function GetGridsY :Integer;
       procedure SetGridsY( const GridY_:Integer );
       function GetGridsZ :Integer;
       procedure SetGridsZ( const GridZ_:Integer );
       ///// プロパティ
       property BricsX :Integer read GetItemsX write SetItemsX;
       property BricsY :Integer read GetItemsY write SetItemsY;
       property BricsZ :Integer read GetItemsZ write SetItemsZ;
       property GridsX :Integer read GetGridsX write SetGridsX;
       property GridsY :Integer read GetGridsY write SetGridsY;
       property GridsZ :Integer read GetGridsZ write SetGridsZ;
     end;

     TBricArray3D<_TItem_> = class( TArray3D<_TItem_>, IBricArray3D )
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
       property BricsX                          :Integer read GetItemsX write SetItemsX;
       property BricsY                          :Integer read GetItemsY write SetItemsY;
       property BricsZ                          :Integer read GetItemsZ write SetItemsZ;
       property GridsX                          :Integer read GetGridsX write SetGridsX;
       property GridsY                          :Integer read GetGridsY write SetGridsY;
       property GridsZ                          :Integer read GetGridsZ write SetGridsZ;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGridArray3D<_TItem_>

     IGridArray3D = interface( IArray3D )
     ['{60135172-47A4-4183-8CE9-B590E8F21835}']
       ///// アクセス
       function GetBricsX :Integer;
       procedure SetBricsX( const BricsX_:Integer );
       function GetBricsY :Integer;
       procedure SetBricsY( const BricsY_:Integer );
       function GetBricsZ :Integer;
       procedure SetBricsZ( const BricsZ_:Integer );
       ///// プロパティ
       property GridsX :Integer read GetItemsX write SetItemsX;
       property GridsY :Integer read GetItemsY write SetItemsY;
       property GridsZ :Integer read GetItemsZ write SetItemsZ;
       property BricsX :Integer read GetBricsX write SetBricsX;
       property BricsY :Integer read GetBricsY write SetBricsY;
       property BricsZ :Integer read GetBricsZ write SetBricsZ;
     end;

     TGridArray3D<_TItem_> = class( TArray3D<_TItem_>, IGridArray3D )
     private
     protected
       ///// アクセス
       function GetBricsX :Integer;
       procedure SetBricsX( const BricsX_:Integer );
       function GetBricsY :Integer;
       procedure SetBricsY( const BricsY_:Integer );
       function GetBricsZ :Integer;
       procedure SetBricsZ( const BricsZ_:Integer );
     public
       constructor Create( const BricsX_,BricsY_,BricsZ_,MargsX_,MargsY_,MargsZ_:Integer ); override;
       destructor Destroy; override;
       ///// プロパティ
       property Grids[ const X_,Y_,Z_:Integer ] :_TItem_ read GetItems  write SetItems ; default;
       property GridsX                          :Integer read GetItemsX write SetItemsX;
       property GridsY                          :Integer read GetItemsY write SetItemsY;
       property GridsZ                          :Integer read GetItemsZ write SetItemsZ;
       property BricsX                          :Integer read GetBricsX write SetBricsX;
       property BricsY                          :Integer read GetBricsY write SetBricsY;
       property BricsZ                          :Integer read GetBricsZ write SetBricsZ;
       ///// メソッド
       procedure Read( const Stream_:TStream ); override;
       procedure Write( const Stream_:TStream ); override;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TArray3D<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// メソッド

procedure TArray3D<_TItem_>.MakeArray;
begin
     _TotalX := _MargsX + _ItemsX + _MargsX;
     _TotalY := _MargsY + _ItemsY + _MargsY;
     _TotalZ := _MargsZ + _ItemsZ + _MargsZ;

     SetLength( _Items, GetTotalN );
end;

function TArray3D<_TItem_>.XYZtoI( const X_,Y_,Z_:Integer ) :Integer;
begin
     Result := ( ( _MargsZ + Z_ ) * _TotalY + ( _MargsY + Y_ ) ) * _TotalX + ( _MargsX + X_ );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TArray3D<_TItem_>.GetItems( const X_,Y_,Z_:Integer ) :_TItem_;
begin
     Result := _Items[ XYZtoI( X_, Y_, Z_ ) ];
end;

procedure TArray3D<_TItem_>.SetItems( const X_,Y_,Z_:Integer; const Item_:_TItem_ );
begin
     _Items[ XYZtoI( X_, Y_, Z_ ) ] := Item_;
end;

function TArray3D<_TItem_>.GetItemP( const X_,Y_,Z_:Integer ) :_PItem_;
begin
     Result := @_Items[ XYZtoI( X_, Y_, Z_ ) ];
end;

//------------------------------------------------------------------------------

function TArray3D<_TItem_>.GetItemsX :Integer;
begin
     Result := _ItemsX;
end;

procedure TArray3D<_TItem_>.SetItemsX( const ItemsX_:Integer );
begin
     _ItemsX := ItemsX_;  MakeArray;
end;

function TArray3D<_TItem_>.GetItemsY :Integer;
begin
     Result := _ItemsY;
end;

procedure TArray3D<_TItem_>.SetItemsY( const ItemsY_:Integer );
begin
     _ItemsY := ItemsY_;  MakeArray;
end;

function TArray3D<_TItem_>.GetItemsZ :Integer;
begin
     Result := _ItemsZ;
end;

procedure TArray3D<_TItem_>.SetItemsZ( const ItemsZ_:Integer );
begin
     _ItemsZ := ItemsZ_;  MakeArray;
end;

//------------------------------------------------------------------------------

function TArray3D<_TItem_>.GetMargsX :Integer;
begin
     Result := _MargsX;
end;

procedure TArray3D<_TItem_>.SetMargsX( const MargsX_:Integer );
begin
     _MargsX := MargsX_;  MakeArray;
end;

function TArray3D<_TItem_>.GetMargsY :Integer;
begin
     Result := _MargsY;
end;

procedure TArray3D<_TItem_>.SetMargsY( const MargsY_:Integer );
begin
     _MargsY := MargsY_;  MakeArray;
end;

function TArray3D<_TItem_>.GetMargsZ :Integer;
begin
     Result := _MargsZ;
end;

procedure TArray3D<_TItem_>.SetMargsZ( const MargsZ_:Integer );
begin
     _MargsZ := MargsZ_;  MakeArray;
end;

//------------------------------------------------------------------------------

function TArray3D<_TItem_>.GetItemSize :Integer;
begin
     Result := SizeOf( _TItem_ );
end;

function TArray3D<_TItem_>.GetTotalN :Integer;
begin
     Result := _TotalZ * _TotalY * _TotalX;
end;

function TArray3D<_TItem_>.GetTotalSize :Integer;
begin
     Result := GetTotalN * GetItemSize;
end;

//------------------------------------------------------------------------------

function TArray3D<_TItem_>.GetLines( const Y_,Z_:Integer ) :PByteArray;
begin
     Result := @_Items[ XYZtoI( 0, Y_, Z_ ) ];
end;

function TArray3D<_TItem_>.GetLineSize :Integer;
begin
     Result := GetItemSize * _ItemsX;
end;

//------------------------------------------------------------------------------

function TArray3D<_TItem_>.GetStepX :Integer;
begin
     Result := GetItemSize;
end;

function TArray3D<_TItem_>.GetStepY :Integer;
begin
     Result := GetStepX * _TotalX;
end;

function TArray3D<_TItem_>.GetStepZ :Integer;
begin
     Result := GetStepY * _TotalY;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TArray3D<_TItem_>.Create;
begin
     Create( 0, 0, 0 );
end;

constructor TArray3D<_TItem_>.Create( const ItemsX_,ItemsY_,ItemsZ_:Integer );
begin
     Create( ItemsX_, ItemsY_, ItemsZ_, 0 );
end;

constructor TArray3D<_TItem_>.Create( const ItemsX_,ItemsY_,ItemsZ_,Margs_:Integer );
begin
     Create( ItemsX_, ItemsY_, ItemsZ_, Margs_, Margs_, Margs_ );
end;

constructor TArray3D<_TItem_>.Create( const ItemsX_,ItemsY_,ItemsZ_,MargsX_,MargsY_,MargsZ_:Integer );
begin
     inherited Create;

     _ItemsX := ItemsX_;
     _ItemsY := ItemsY_;
     _ItemsZ := ItemsZ_;
     _MargsX := MargsX_;
     _MargsY := MargsY_;
     _MargsZ := MargsZ_;
end;

procedure TArray3D<_TItem_>.AfterConstruction;
begin
     MakeArray;
end;

destructor TArray3D<_TItem_>.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

class procedure TArray3D<_TItem_>.Swap( var Array0_,Array1_:TArray3D<_TItem_> );
var
   A :TArray3D<_TItem_>;
begin
     A := Array0_;  Array0_ := Array1_;  Array1_ := A;
end;

//------------------------------------------------------------------------------

procedure TArray3D<_TItem_>.Read( const Stream_:TStream );
begin
     Stream_.Read( _Items[ 0 ], GetTotalSize );
end;

procedure TArray3D<_TItem_>.Write( const Stream_:TStream );
begin
     Stream_.Write( _Items[ 0 ], GetTotalSize );
end;

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
     Result := _ItemsX - 1;
end;

procedure TGridArray3D<_TItem_>.SetBricsX( const BricsX_:Integer );
begin
     _ItemsX  := BricsX_ + 1;  MakeArray;
end;

function TGridArray3D<_TItem_>.GetBricsY :Integer;
begin
     Result := _ItemsY - 1;
end;

procedure TGridArray3D<_TItem_>.SetBricsY( const BricsY_:Integer );
begin
     _ItemsY  := BricsY_ + 1;  MakeArray;
end;

function TGridArray3D<_TItem_>.GetBricsZ :Integer;
begin
     Result := _ItemsZ - 1;
end;

procedure TGridArray3D<_TItem_>.SetBricsZ( const BricsZ_:Integer );
begin
     _ItemsZ  := BricsZ_ + 1;  MakeArray;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGridArray3D<_TItem_>.Create( const BricsX_,BricsY_,BricsZ_,MargsX_,MargsY_,MargsZ_:Integer );
begin
     inherited Create( BricsX_+1, BricsY_+1, BricsZ_+1,
                       MargsX_  , MargsY_  , MargsZ_   );

end;

destructor TGridArray3D<_TItem_>.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGridArray3D<_TItem_>.Read( const Stream_:TStream );
var
   S, M :TCardinal3D;
begin
     with Stream_ do
     begin
          Read( S, SizeOf( TCardinal3D ) );
          Read( M, SizeOf( TCardinal3D ) );
     end;

     BricsX := S.X;
     BricsY := S.Y;
     BricsZ := S.Z;

     MargsX := M.X;
     MargsY := M.Y;
     MargsZ := M.Z;

     inherited;
end;

procedure TGridArray3D<_TItem_>.Write( const Stream_:TStream );
var
   S, M :TCardinal3D;
begin
     with S do
     begin
          X := BricsX;
          Y := BricsY;
          Z := BricsZ;
     end;

     with M do
     begin
          X := MargsX;
          Y := MargsY;
          Z := MargsZ;
     end;

     with Stream_ do
     begin
          Write( S, SizeOf( TCardinal3D ) );
          Write( M, SizeOf( TCardinal3D ) );
     end;

     inherited;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
