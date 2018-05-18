unit LUX.Data.Lattice.T3;

interface //#################################################################### ■

uses System.SysUtils, System.Classes,
     LUX, LUX.D3, LUX.Data.Lattice, LUX.Data.Lattice.T2;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     TArray3D<_TItem_>             = class;
     TCellArray3D<_TItem_>         = class;
     TPoinArray3D<_TItem_>         = class;
     TCellIterPoinArray3D<_TItem_> = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TArray3D<_TItem_>

     IArray3D = interface( IArray2D )
     ['{2ED01C38-BB77-4958-83DE-E4F723A74774}']
     {protected}
       ///// アクセス
       function GetElemsZ :Integer;
       function GetItemsZ :Integer;
       procedure SetItemsZ( const ItemsZ_:Integer );
       function GetMargsZ :Integer;
       procedure SetMargsZ( const MargsZ_:Integer );
       function GetItemsN :Integer;
       //---
       function GetCounStepX :Integer;
       function GetCounStepY :Integer;
       function GetCounStepZ :Integer;
       function GetByteStepX :Integer;
       function GetByteStepY :Integer;
       function GetByteStepZ :Integer;
       function GetLines( const Y_,Z_:Integer ) :PByteArray;
       function GetLineSize :Integer;
     {public}
       ///// プロパティ
       property ElemsZ :Integer read GetElemsZ                ;
       property ItemsZ :Integer read GetItemsZ write SetItemsZ;
       property MargsZ :Integer read GetMargsZ write SetMargsZ;
       property ItemsN :Integer read GetItemsN                ;
       //---
       property CounStepX                    :Integer    read GetCounStepX;
       property CounStepY                    :Integer    read GetCounStepY;
       property CounStepZ                    :Integer    read GetCounStepZ;
       property ByteStepX                    :Integer    read GetByteStepX;
       property ByteStepY                    :Integer    read GetByteStepY;
       property ByteStepZ                    :Integer    read GetByteStepZ;
       property Lines[ const Y_,Z_:Integer ] :PByteArray read GetLines    ;
       property LineSize                     :Integer    read GetLineSize ;
     end;

     //-------------------------------------------------------------------------

     TArray3D<_TItem_> = class( TArray2D<_TItem_>, IArray3D )
     public type
       _PItem_ = TCoreArray<_TItem_>._PElem_;
     private
       ///// メソッド
       function ElemsI( const X_,Y_,Z_:Integer ) :Integer; inline;
       function ItemsI( const X_,Y_,Z_:Integer ) :Integer; inline;
     protected
       _ElemsZ :Integer;
       _ItemsZ :Integer;
       _MargsZ :Integer;
       ///// アクセス
       function GetElemsN :Integer; override;
       function GetElemsZ :Integer;
       function GetElems( const X_,Y_,Z_:Integer ) :_TItem_;
       procedure SetElems( const X_,Y_,Z_:Integer; const Elem_:_TItem_ );
       function GetElemsP( const X_,Y_,Z_:Integer ) :_PItem_;
       function GetItemsZ :Integer;
       procedure SetItemsZ( const ItemsZ_:Integer );
       function GetMargsZ :Integer;
       procedure SetMargsZ( const MargsZ_:Integer );
       function GetItemsN :Integer; override;
       function GetItems( const X_,Y_,Z_:Integer ) :_TItem_;
       procedure SetItems( const X_,Y_,Z_:Integer; const Item_:_TItem_ );
       function GetItemsP( const X_,Y_,Z_:Integer ) :_PItem_;
       function GetItem0P :Pointer;
       //---
       function GetCounStepX :Integer;
       function GetCounStepY :Integer;
       function GetCounStepZ :Integer;
       function GetByteStepX :Integer;
       function GetByteStepY :Integer;
       function GetByteStepZ :Integer;
       function GetLines( const Y_,Z_:Integer ) :PByteArray;
       function GetLineSize :Integer;
       ///// メソッド
       procedure MakeArray; override;
     public
       constructor Create; overload;
       constructor Create( const ItemsX_,ItemsY_,ItemsZ_:Integer ); overload;
       constructor Create( const ItemsX_,ItemsY_,ItemsZ_,Margs_:Integer ); reintroduce; overload;
       constructor Create( const ItemsX_,ItemsY_,ItemsZ_,MargsX_,MargsY_,MargsZ_:Integer ); overload; virtual;
       destructor Destroy; override;
       ///// プロパティ
       property ItemByte                         :Integer    read GetElemByte                 ;
       property ElemsZ                           :Integer    read GetElemsZ                   ;
       property Elems[ const X_,Y_,Z_:Integer ]  :_TItem_    read GetElems     write SetElems ;
       property ElemsP[ const X_,Y_,Z_:Integer ] :_PItem_    read GetElemsP                   ;
       property ItemsZ                           :Integer    read GetItemsZ    write SetItemsZ;
       property MargsZ                           :Integer    read GetMargsZ    write SetMargsZ;
       property ItemsN                           :Integer    read GetItemsN                   ;
       property Items[ const X_,Y_,Z_:Integer ]  :_TItem_    read GetItems     write SetItems ; default;
       property ItemsP[ const X_,Y_,Z_:Integer ] :_PItem_    read GetItemsP                   ;
       property Item0P                           :Pointer    read GetItem0P                   ;
       //---
       property CounStepX                        :Integer    read GetCounStepX                ;
       property CounStepY                        :Integer    read GetCounStepY                ;
       property CounStepZ                        :Integer    read GetCounStepZ                ;
       property ByteStepX                        :Integer    read GetByteStepX                ;
       property ByteStepY                        :Integer    read GetByteStepY                ;
       property ByteStepZ                        :Integer    read GetByteStepZ                ;
       property Lines[ const Y_,Z_:Integer ]     :PByteArray read GetLines                    ;
       property LineSize                         :Integer    read GetLineSize                 ;
       ///// メソッド
       procedure Read( const Stream_:TStream ); virtual;
       procedure Write( const Stream_:TStream ); virtual;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TCellArray3D<_TItem_>

     ICellArray3D = interface( IArray3D )
     ['{40BD11E7-4BF9-43F3-BE98-846C78B22EFD}']
       ///// アクセス
       function GetPoinsX :Integer;
       procedure SetPoinsX( const PoinX_:Integer );
       function GetPoinsY :Integer;
       procedure SetPoinsY( const PoinY_:Integer );
       function GetPoinsZ :Integer;
       procedure SetPoinsZ( const PoinZ_:Integer );
       ///// プロパティ
       property CellsX :Integer read GetItemsX write SetItemsX;
       property CellsY :Integer read GetItemsY write SetItemsY;
       property CellsZ :Integer read GetItemsZ write SetItemsZ;
       property PoinsX :Integer read GetPoinsX write SetPoinsX;
       property PoinsY :Integer read GetPoinsY write SetPoinsY;
       property PoinsZ :Integer read GetPoinsZ write SetPoinsZ;
     end;

     //-------------------------------------------------------------------------

     TCellArray3D<_TItem_> = class( TArray3D<_TItem_>, ICellArray3D )
     private
     protected
       ///// アクセス
       function GetPoinsX :Integer;
       procedure SetPoinsX( const PoinX_:Integer );
       function GetPoinsY :Integer;
       procedure SetPoinsY( const PoinY_:Integer );
       function GetPoinsZ :Integer;
       procedure SetPoinsZ( const PoinZ_:Integer );
     public
       ///// プロパティ
       property Cells[ const X_,Y_,Z_:Integer ] :_TItem_ read GetItems  write SetItems ; default;
       property CellsX                          :Integer read GetItemsX write SetItemsX;
       property CellsY                          :Integer read GetItemsY write SetItemsY;
       property CellsZ                          :Integer read GetItemsZ write SetItemsZ;
       property PoinsX                          :Integer read GetPoinsX write SetPoinsX;
       property PoinsY                          :Integer read GetPoinsY write SetPoinsY;
       property PoinsZ                          :Integer read GetPoinsZ write SetPoinsZ;
       ///// メソッド
       procedure MakeEdgePerio; override;
       procedure MakeEdgeMirro; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TPoinArray3D<_TItem_>

     IPoinArray3D = interface( IArray3D )
     ['{60135172-47A4-4183-8CE9-B590E8F21835}']
       ///// アクセス
       function GetCellsX :Integer;
       procedure SetCellsX( const CellsX_:Integer );
       function GetCellsY :Integer;
       procedure SetCellsY( const CellsY_:Integer );
       function GetCellsZ :Integer;
       procedure SetCellsZ( const CellsZ_:Integer );
       ///// プロパティ
       property PoinsX :Integer read GetItemsX write SetItemsX;
       property PoinsY :Integer read GetItemsY write SetItemsY;
       property PoinsZ :Integer read GetItemsZ write SetItemsZ;
       property CellsX :Integer read GetCellsX write SetCellsX;
       property CellsY :Integer read GetCellsY write SetCellsY;
       property CellsZ :Integer read GetCellsZ write SetCellsZ;
     end;

     //-------------------------------------------------------------------------

     TPoinArray3D<_TItem_> = class( TArray3D<_TItem_>, IPoinArray3D )
     private
     protected
       ///// アクセス
       function GetCellsX :Integer;
       procedure SetCellsX( const CellsX_:Integer );
       function GetCellsY :Integer;
       procedure SetCellsY( const CellsY_:Integer );
       function GetCellsZ :Integer;
       procedure SetCellsZ( const CellsZ_:Integer );
       function GetCellsN :Integer;
       ///// メソッド
       function NewCellIter :TCellIterPoinArray3D<_TItem_>; virtual;
     public
       constructor Create( const CellsX_,CellsY_,CellsZ_,MargsX_,MargsY_,MargsZ_:Integer ); override;
       destructor Destroy; override;
       ///// プロパティ
       property Poins[ const X_,Y_,Z_:Integer ] :_TItem_ read GetItems  write SetItems ; default;
       property PoinsX                          :Integer read GetItemsX write SetItemsX;
       property PoinsY                          :Integer read GetItemsY write SetItemsY;
       property PoinsZ                          :Integer read GetItemsZ write SetItemsZ;
       property PoinsN                          :Integer read GetItemsN                ;
       property CellsX                          :Integer read GetCellsX write SetCellsX;
       property CellsY                          :Integer read GetCellsY write SetCellsY;
       property CellsZ                          :Integer read GetCellsZ write SetCellsZ;
       property CellsN                          :Integer read GetCellsN                ;
       ///// メソッド
       procedure Read( const Stream_:TStream ); override;
       procedure Write( const Stream_:TStream ); override;
       procedure ForCells( const Proc_:TConstProc<TCellIterPoinArray3D<_TItem_>> );
       procedure ForEdgesX( const Proc_:TConstProc<TCellIterPoinArray3D<_TItem_>> );
       procedure ForEdgesY( const Proc_:TConstProc<TCellIterPoinArray3D<_TItem_>> );
       procedure ForEdgesZ( const Proc_:TConstProc<TCellIterPoinArray3D<_TItem_>> );
       ///// メソッド
       procedure MakeEdgePerio; override;
       procedure MakeEdgeMirro; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TCellIterPoinArray3D<_TItem_>

     ICellIterPoinArray3D<_TItem_> = interface
     ['{F5FE2821-AAE8-4D83-9732-956556A2E7C2}']
     {protected}
       function GetPos :TInteger3D;
       procedure SetPos( const Pos_:TInteger3D );
       function GetPoins( const X_,Y_,Z_:Shortint ) :_TItem_;
       procedure SetPoins( const X_,Y_,Z_:Shortint; const Item_:_TItem_ );
       function GetGiX( const I_:Shortint ) :Integer;
       function GetGiY( const I_:Shortint ) :Integer;
       function GetGiZ( const I_:Shortint ) :Integer;
     {public}
       property Pos                              :TInteger3D read GetPos   write SetPos  ;
       property Poins[ const X_,Y_,Z_:Shortint ] :_TItem_    read GetPoins write SetPoins; default;
       property GiX[ const I_:Shortint ]         :Integer    read GetGiX;
       property GiY[ const I_:Shortint ]         :Integer    read GetGiY;
       property GiZ[ const I_:Shortint ]         :Integer    read GetGiZ;
       ///// メソッド
       procedure GoPrevX; overload;
       procedure GoNextX; overload;
       procedure GoPrevY; overload;
       procedure GoNextY; overload;
       procedure GoPrevZ; overload;
       procedure GoNextZ; overload;
       procedure GoPrevX( const N_:Integer ); overload;
       procedure GoNextX( const N_:Integer ); overload;
       procedure GoPrevY( const N_:Integer ); overload;
       procedure GoNextY( const N_:Integer ); overload;
       procedure GoPrevZ( const N_:Integer ); overload;
       procedure GoNextZ( const N_:Integer ); overload;
       function Interp( const Xd_,Yd_,Zd_:Single ) :_TItem_;
       function AbsoInterp( const X_,Y_,Z_:Single ) :_TItem_;
     end;

     //-------------------------------------------------------------------------

     TCellIterPoinArray3D<_TItem_> = class( TInterfacedObject, ICellIterPoinArray3D<_TItem_> )
     private
     protected type
       _PItem_ = ^_TItem_;
     protected
       _Paren :TPoinArray3D<_TItem_>;
       _HeadZ :array [ -1..+2 ] of _PItem_;
       _HeadY :array [ -1..+2, -1..+2 ] of _PItem_;
       _Poins :array [ -1..+2, -1..+2, -1..+2 ] of _PItem_;
       _GX    :array [ -1..+2 ] of Integer;
       _GY    :array [ -1..+2 ] of Integer;
       _GZ    :array [ -1..+2 ] of Integer;
       ///// アクセス
       function GetPosX :Integer;
       procedure SetPosX( const PosX_:Integer );
       function GetPosY :Integer;
       procedure SetPosY( const PosY_:Integer );
       function GetPosZ :Integer;
       procedure SetPosZ( const PosZ_:Integer );
       function GetPos :TInteger3D;
       procedure SetPos( const Pos_:TInteger3D );
       function GetPoins( const X_,Y_,Z_:Shortint ) :_TItem_;
       procedure SetPoins( const X_,Y_,Z_:Shortint; const Item_:_TItem_ );
       function GetGiX( const I_:Shortint ) :Integer;
       function GetGiY( const I_:Shortint ) :Integer;
       function GetGiZ( const I_:Shortint ) :Integer;
       function GetGi( const X_,Y_,Z_:Shortint ) :TInteger3D;
     public
       constructor Create( const Array_:TPoinArray3D<_TItem_> );
       destructor Destroy; override;
       ///// プロパティ
       property PosX                             :Integer    read GetPosX  write SetPosX ;
       property PosY                             :Integer    read GetPosY  write SetPosY ;
       property PosZ                             :Integer    read GetPosZ  write SetPosZ ;
       property Pos                              :TInteger3D read GetPos   write SetPos  ;
       property Poins[ const X_,Y_,Z_:Shortint ] :_TItem_    read GetPoins write SetPoins; default;
       property GiX[ const I_:Shortint ]         :Integer    read GetGiX                 ;
       property GiY[ const I_:Shortint ]         :Integer    read GetGiY                 ;
       property GiZ[ const I_:Shortint ]         :Integer    read GetGiZ                 ;
       property Gi[ const X_,Y_,Z_:Shortint ]    :TInteger3D read GetGi                  ;
       ///// メソッド
       procedure GoPrevX; overload;
       procedure GoNextX; overload;
       procedure GoPrevY; overload;
       procedure GoNextY; overload;
       procedure GoPrevZ; overload;
       procedure GoNextZ; overload;
       procedure GoPrevX( const N_:Integer ); overload;
       procedure GoNextX( const N_:Integer ); overload;
       procedure GoPrevY( const N_:Integer ); overload;
       procedure GoNextY( const N_:Integer ); overload;
       procedure GoPrevZ( const N_:Integer ); overload;
       procedure GoNextZ( const N_:Integer ); overload;
       function Interp( const Xd_,Yd_,Zd_:Single ) :_TItem_; virtual;
       function AbsoInterp( const X_,Y_,Z_:Single ) :_TItem_; virtual;
       procedure ForCells( const Proc_:TProc );
       procedure ForEdgesX( const Proc_:TProc );
       procedure ForEdgesY( const Proc_:TProc );
       procedure ForEdgesZ( const Proc_:TProc );
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.Math;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TArray3D<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// メソッド

function TArray3D<_TItem_>.ElemsI( const X_,Y_,Z_:Integer ) :Integer;
begin
     Result := ( Z_ * _ElemsY + Y_ ) * _ElemsX + X_;
end;

function TArray3D<_TItem_>.ItemsI( const X_,Y_,Z_:Integer ) :Integer;
begin
     Result := ( ( _MargsZ + Z_ ) * _ElemsY + ( _MargsY + Y_ ) ) * _ElemsX + ( _MargsX + X_ );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TArray3D<_TItem_>.GetElemsN :Integer;
begin
     Result := _ElemsZ * _ElemsY * _ElemsX;
end;

//------------------------------------------------------------------------------

function TArray3D<_TItem_>.GetElemsZ :Integer;
begin
     Result := _ElemsZ;
end;

//------------------------------------------------------------------------------

function TArray3D<_TItem_>.GetElems( const X_,Y_,Z_:Integer ) :_TItem_;
begin
     Result := _Elems[ ElemsI( X_, Y_, Z_ ) ];
end;

procedure TArray3D<_TItem_>.SetElems( const X_,Y_,Z_:Integer; const Elem_:_TItem_ );
begin
     _Elems[ ElemsI( X_, Y_, Z_ ) ] := Elem_;
end;

function TArray3D<_TItem_>.GetElemsP( const X_,Y_,Z_:Integer ) :_PItem_;
begin
     Result := @_Elems[ ElemsI( X_, Y_, Z_ ) ];
end;

//------------------------------------------------------------------------------

function TArray3D<_TItem_>.GetItemsZ :Integer;
begin
     Result := _ItemsZ;
end;

procedure TArray3D<_TItem_>.SetItemsZ( const ItemsZ_:Integer );
begin
     _ItemsZ := ItemsZ_;  MakeArray;
end;

function TArray3D<_TItem_>.GetMargsZ :Integer;
begin
     Result := _MargsZ;
end;

procedure TArray3D<_TItem_>.SetMargsZ( const MargsZ_:Integer );
begin
     _MargsZ := MargsZ_;  MakeArray;
end;

function TArray3D<_TItem_>.GetItemsN :Integer;
begin
     Result := _ItemsZ * _ItemsY * _ItemsX;
end;

//------------------------------------------------------------------------------

function TArray3D<_TItem_>.GetItems( const X_,Y_,Z_:Integer ) :_TItem_;
begin
     Result := _Elems[ ItemsI( X_, Y_, Z_ ) ];
end;

procedure TArray3D<_TItem_>.SetItems( const X_,Y_,Z_:Integer; const Item_:_TItem_ );
begin
     _Elems[ ItemsI( X_, Y_, Z_ ) ] := Item_;
end;

function TArray3D<_TItem_>.GetItemsP( const X_,Y_,Z_:Integer ) :_PItem_;
begin
     Result := @_Elems[ ItemsI( X_, Y_, Z_ ) ];
end;

function TArray3D<_TItem_>.GetItem0P :Pointer;
begin
     Result := GetItemsP( 0, 0, 0 );
end;

//------------------------------------------------------------------------------

function TArray3D<_TItem_>.GetCounStepX :Integer;
begin
     Result := 1;
end;

function TArray3D<_TItem_>.GetCounStepY :Integer;
begin
     Result := CounStepX * _ElemsX;
end;

function TArray3D<_TItem_>.GetCounStepZ :Integer;
begin
     Result := CounStepY * _ElemsY;
end;

//------------------------------------------------------------------------------

function TArray3D<_TItem_>.GetByteStepX :Integer;
begin
     Result := ItemByte * CounStepX;
end;

function TArray3D<_TItem_>.GetByteStepY :Integer;
begin
     Result := ItemByte * CounStepY;
end;

function TArray3D<_TItem_>.GetByteStepZ :Integer;
begin
     Result := ItemByte * CounStepZ;
end;

//------------------------------------------------------------------------------

function TArray3D<_TItem_>.GetLines( const Y_,Z_:Integer ) :PByteArray;
begin
     Result := @_Elems[ ItemsI( 0, Y_, Z_ ) ];
end;

function TArray3D<_TItem_>.GetLineSize :Integer;
begin
     Result := ItemByte * _ItemsX;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TArray3D<_TItem_>.MakeArray;
begin
     _ElemsZ := _MargsZ + _ItemsZ + _MargsZ;

     inherited;
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
     inherited Create( ItemsX_, ItemsY_, MargsX_, MargsY_ );

     _ItemsZ := ItemsZ_;
     _MargsZ := MargsZ_;
end;

destructor TArray3D<_TItem_>.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TArray3D<_TItem_>.Read( const Stream_:TStream );
begin
     Stream_.Read( _Elems[ 0 ], GetElemsByte );
end;

procedure TArray3D<_TItem_>.Write( const Stream_:TStream );
begin
     Stream_.Write( _Elems[ 0 ], GetElemsByte );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TCellArray3D<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TCellArray3D<_TItem_>.GetPoinsX :Integer;
begin
     Result := CellsX + 1;
end;

procedure TCellArray3D<_TItem_>.SetPoinsX( const PoinX_:Integer );
begin
     CellsX := PoinX_ - 1;
end;

function TCellArray3D<_TItem_>.GetPoinsY :Integer;
begin
     Result := CellsY + 1;
end;

procedure TCellArray3D<_TItem_>.SetPoinsY( const PoinY_:Integer );
begin
     CellsY := PoinY_ - 1;
end;

function TCellArray3D<_TItem_>.GetPoinsZ :Integer;
begin
     Result := CellsZ + 1;
end;

procedure TCellArray3D<_TItem_>.SetPoinsZ( const PoinZ_:Integer );
begin
     CellsY := PoinZ_ - 1;
end;

//------------------------------------------------------------------------------

procedure TCellArray3D<_TItem_>.MakeEdgePerio;
var
   MX, MY, MZ, NX, NY, NZ, HX, HY, HZ, X, Y, Z :Integer;
begin
     //                                     H   N
     //                                     |   |
     //    -3  -2  -1  00  +1  +2  +3  +4  +5  +6  +7  +8
     //  ┠─╂─╂─┣━╋━╋━╋━╋━╋━┫─╂─╂─┨
     //    +3  +4  +5  ・  ・  ・  ・  ・  ・  00  +1  +2

     MX := _MargsX;  NX := _ItemsX;  HX := _ItemsX-1;
     MY := _MargsY;  NY := _ItemsY;  HY := _ItemsY-1;
     MZ := _MargsZ;  NZ := _ItemsZ;  HZ := _ItemsZ-1;

     for Z := 00 to HZ do
     begin
          for Y := 00 to HY do
          begin
               for X := 00-MX to 00-01 do Items[ X, Y, Z ] := Items[ X + NX, Y, Z ];
               for X := HX+01 to HX+MX do Items[ X, Y, Z ] := Items[ X - NX, Y, Z ];
          end;

          for X := 00-MX to HX+MX do
          begin
               for Y := 00-MY to 00-01 do Items[ X, Y, Z ] := Items[ X, Y + NY, Z ];
               for Y := HY+01 to HY+MY do Items[ X, Y, Z ] := Items[ X, Y - NY, Z ];
          end;
     end;

     for Y := 00-MY to HY+MY do
     for X := 00-MX to HX+MX do
     begin
          for Z := 00-MZ to 00-01 do Items[ X, Y, Z ] := Items[ X, Y, Z + NZ ];
          for Z := HZ+01 to HZ+MZ do Items[ X, Y, Z ] := Items[ X, Y, Z - NZ ];
     end;
end;

procedure TCellArray3D<_TItem_>.MakeEdgeMirro;
var
   MX, MY, MZ, NX, NY, NZ, HX, HY, HZ, X, Y, Z :Integer;
begin
     //                                     H   N
     //                                     |   |
     //    -3  -2  -1  00  +1  +2  +3  +4  +5  +6  +7  +8
     //  ┠─╂─╂─┣━╋━╋━╋━╋━╋━┫─╂─╂─┨
     //    +2  +1  00  ・  ・  ・  ・  ・  ・  +5  +4  +3   }

     MX := _MargsX;  NX := _ItemsX;  HX := _ItemsX-1;
     MY := _MargsY;  NY := _ItemsY;  HY := _ItemsY-1;
     MZ := _MargsZ;  NZ := _ItemsZ;  HZ := _ItemsZ-1;

     for Z := 00 to HZ do
     begin
          for Y := 00 to HY do
          begin
               for X := 00-MX to 00-01 do Items[ X, Y, Z ] := Items[ 00 - X - 01, Y, Z ];
               for X := HX+01 to HX+MX do Items[ X, Y, Z ] := Items[ HX - X + NX, Y, Z ];
          end;

          for X := 00-MX to HX+MX do
          begin
               for Y := 00-MY to 00-01 do Items[ X, Y, Z ] := Items[ X, 00 - Y - 01, Z ];
               for Y := HY+01 to HY+MY do Items[ X, Y, Z ] := Items[ X, HY - Y + NY, Z ];
          end;
     end;

     for Y := 00-MY to HY+MY do
     for X := 00-MX to HX+MX do
     begin
          for Z := 00-MZ to 00-01 do Items[ X, Y, Z ] := Items[ X, Y, 00 - Z - 01 ];
          for Z := HZ+01 to HZ+MZ do Items[ X, Y, Z ] := Items[ X, Y, HZ - Z + NZ ];
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TPoinArray3D<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TPoinArray3D<_TItem_>.GetCellsX :Integer;
begin
     Result := _ItemsX - 1;
end;

procedure TPoinArray3D<_TItem_>.SetCellsX( const CellsX_:Integer );
begin
     _ItemsX  := CellsX_ + 1;  MakeArray;
end;

function TPoinArray3D<_TItem_>.GetCellsY :Integer;
begin
     Result := _ItemsY - 1;
end;

procedure TPoinArray3D<_TItem_>.SetCellsY( const CellsY_:Integer );
begin
     _ItemsY  := CellsY_ + 1;  MakeArray;
end;

function TPoinArray3D<_TItem_>.GetCellsZ :Integer;
begin
     Result := _ItemsZ - 1;
end;

procedure TPoinArray3D<_TItem_>.SetCellsZ( const CellsZ_:Integer );
begin
     _ItemsZ  := CellsZ_ + 1;  MakeArray;
end;

function TPoinArray3D<_TItem_>.GetCellsN :Integer;
begin
     Result := CellsZ * CellsY * CellsX;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TPoinArray3D<_TItem_>.NewCellIter :TCellIterPoinArray3D<_TItem_>;
begin
     Result := TCellIterPoinArray3D<_TItem_>.Create( Self );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TPoinArray3D<_TItem_>.Create( const CellsX_,CellsY_,CellsZ_,MargsX_,MargsY_,MargsZ_:Integer );
begin
     inherited Create( CellsX_+1, CellsY_+1, CellsZ_+1,
                       MargsX_  , MargsY_  , MargsZ_   );

end;

destructor TPoinArray3D<_TItem_>.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TPoinArray3D<_TItem_>.Read( const Stream_:TStream );
var
   S, M :TCardinal3D;
begin
     with Stream_ do
     begin
          Read( S, SizeOf( TCardinal3D ) );
          Read( M, SizeOf( TCardinal3D ) );
     end;

     CellsX := S.X;
     CellsY := S.Y;
     CellsZ := S.Z;

     MargsX := M.X;
     MargsY := M.Y;
     MargsZ := M.Z;

     inherited;
end;

procedure TPoinArray3D<_TItem_>.Write( const Stream_:TStream );
var
   S, M :TCardinal3D;
begin
     with S do
     begin
          X := CellsX;
          Y := CellsY;
          Z := CellsZ;
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

//------------------------------------------------------------------------------

procedure TPoinArray3D<_TItem_>.ForCells( const Proc_:TConstProc<TCellIterPoinArray3D<_TItem_>> );
var
   B :TCellIterPoinArray3D<_TItem_>;
begin
     B := NewCellIter;

     B.ForCells( procedure begin Proc_( B ); end );

     B.DisposeOf;
end;

procedure TPoinArray3D<_TItem_>.ForEdgesX( const Proc_:TConstProc<TCellIterPoinArray3D<_TItem_>> );
var
   E :TCellIterPoinArray3D<_TItem_>;
begin
     E := NewCellIter;

     E.ForEdgesX( procedure begin Proc_( E ); end );

     E.DisposeOf;
end;

procedure TPoinArray3D<_TItem_>.ForEdgesY( const Proc_:TConstProc<TCellIterPoinArray3D<_TItem_>> );
var
   E :TCellIterPoinArray3D<_TItem_>;
begin
     E := NewCellIter;

     E.ForEdgesY( procedure begin Proc_( E ); end );

     E.DisposeOf;
end;

procedure TPoinArray3D<_TItem_>.ForEdgesZ( const Proc_:TConstProc<TCellIterPoinArray3D<_TItem_>> );
var
   E :TCellIterPoinArray3D<_TItem_>;
begin
     E := NewCellIter;

     E.ForEdgesZ( procedure begin Proc_( E ); end );

     E.DisposeOf;
end;

//------------------------------------------------------------------------------

procedure TPoinArray3D<_TItem_>.MakeEdgePerio;
var
   MX, MY, MZ, HX, HY, HZ, X, Y, Z :Integer;
begin
     //                                       H
     //                                       |
     //  -3  -2  -1  00  +1  +2  +3  +4  +5  +6  +7  +8  +9
     //  ┠─╂─╂─┣━╋━╋━╋━╋━╋━┫─╂─╂─┨
     //  +3  +4  +5  ・  ・  ・  ・  ・  ・  00  +1  +2  +3

     MX := _MargsX;  HX := _ItemsX-1;
     MY := _MargsX;  HY := _ItemsX-1;
     MZ := _MargsZ;  HZ := _ItemsZ-1;

     for Z := 00 to HZ do
     begin
          for Y := 00 to HY do
          begin
               for X := 00-MX to 00-01 do Items[ X, Y, Z ] := Items[ X + HX, Y, Z ];
               for X := HX+00 to HX+MX do Items[ X, Y, Z ] := Items[ X - HX, Y, Z ];
          end;

          for X := 00-MX to HX+MX do
          begin
               for Y := 00-MY to 00-01 do Items[ X, Y, Z ] := Items[ X, Y + HY, Z ];
               for Y := HY+00 to HY+MY do Items[ X, Y, Z ] := Items[ X, Y - HY, Z ];
          end;
     end;

     for Y := 00-MY to HY+MY do
     for X := 00-MX to HX+MX do
     begin
          for Z := 00-MZ to 00-01 do Items[ X, Y, Z ] := Items[ X, Y, Z + HZ ];
          for Z := HZ+00 to HZ+MZ do Items[ X, Y, Z ] := Items[ X, Y, Z - HZ ];
     end;
end;

procedure TPoinArray3D<_TItem_>.MakeEdgeMirro;
var
   MX, MY, MZ, HX, HY, HZ, X, Y, Z :Integer;
begin
     //                                       H
     //                                       |
     //  -3  -2  -1  00  +1  +2  +3  +4  +5  +6  +7  +8  +9
     //  ┠─╂─╂─┣━╋━╋━╋━╋━╋━┫─╂─╂─┨
     //  +3  +2  +1  ・  ・  ・  ・  ・  ・  ・  +5  +4  +3

     MX := _MargsX;  HX := _ItemsX-1;
     MY := _MargsX;  HY := _ItemsX-1;
     MZ := _MargsZ;  HZ := _ItemsZ-1;

     for Z := 00 to HZ do
     begin
          for Y := 00 to HY do
          begin
               for X := 00-MX to 00-01 do Items[ X, Y, Z ] := Items[ -X       , Y, Z ];
               for X := HX+01 to HX+MX do Items[ X, Y, Z ] := Items[ -X + 2*HX, Y, Z ];
          end;

          for X := 00-MX to HX+MX do
          begin
               for Y := 00-MY to 00-01 do Items[ X, Y, Z ] := Items[ X, -Y       , Z ];
               for Y := HY+01 to HY+MY do Items[ X, Y, Z ] := Items[ X, -Y + 2*HY, Z ];
          end;
     end;

     for Y := 00-MY to HY+MY do
     for X := 00-MX to HX+MX do
     begin
          for Z := 00-MZ to 00-01 do Items[ X, Y, Z ] := Items[ X, Y, -Z        ];
          for Z := HZ+01 to HZ+MZ do Items[ X, Y, Z ] := Items[ X, Y, -Z + 2*HZ ];
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TCellIterPoinArray3D<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TCellIterPoinArray3D<_TItem_>.GetPosX :Integer;
begin
     Result := _GX[ 0 ];
end;

procedure TCellIterPoinArray3D<_TItem_>.SetPosX( const PosX_:Integer );
var
   X, Y, Z :Integer;
begin
     for X := -1 to +2 do
     begin
          _GX[ X ] := PosX_ + X;

          for Y := -1 to +2 do
          begin
               for Z := -1 to +2 do
               begin
                    _Poins[ Z, Y, X ] := _HeadY[ Z, Y ];

                    Inc( _Poins[ Z, Y, X ], _GX[ X ] * _Paren.CounStepX );
               end;
          end;
     end;
end;

function TCellIterPoinArray3D<_TItem_>.GetPosY :Integer;
begin
     Result := _GY[ 0 ];
end;

procedure TCellIterPoinArray3D<_TItem_>.SetPosY( const PosY_:Integer );
var
   Y, Z :Integer;
begin
     for Y := -1 to +2 do
     begin
          _GY[ Y ] := PosY_ + Y;

          for Z := -1 to +2 do
          begin
               _HeadY[ Z, Y ] := _HeadZ[ Z ];

               Inc( _HeadY[ Z, Y ], _GY[ Y ] * _Paren.CounStepY );
          end;
     end;
end;

function TCellIterPoinArray3D<_TItem_>.GetPosZ :Integer;
begin
     Result := _GZ[ 0 ];
end;

procedure TCellIterPoinArray3D<_TItem_>.SetPosZ( const PosZ_:Integer );
var
   Z :Integer;
begin
     for Z := -1 to +2 do
     begin
          _GZ[ Z ] := PosZ_ + Z;

          _HeadZ[ Z ] := _Paren.Item0P;

          Inc( _HeadZ[ Z ], _GZ[ Z ] * _Paren.CounStepZ );
     end;
end;

//------------------------------------------------------------------------------

function TCellIterPoinArray3D<_TItem_>.GetPos :TInteger3D;
begin
     Result := TInteger3D.Create( PosX, PosY, PosZ );
end;

procedure TCellIterPoinArray3D<_TItem_>.SetPos( const Pos_:TInteger3D );
begin
     with Pos_ do
     begin
          PosZ := Z;
          PosY := Y;
          PosX := X;
     end;
end;

//------------------------------------------------------------------------------

function TCellIterPoinArray3D<_TItem_>.GetPoins( const X_,Y_,Z_:Shortint ) :_TItem_;
begin
     Result := _Poins[ Z_, Y_, X_ ]^;
end;

procedure TCellIterPoinArray3D<_TItem_>.SetPoins( const X_,Y_,Z_:Shortint; const Item_:_TItem_ );
begin
     _Poins[ Z_, Y_, X_ ]^ := Item_;
end;

//------------------------------------------------------------------------------

function TCellIterPoinArray3D<_TItem_>.GetGiX( const I_:Shortint ) :Integer;
begin
     Result := _GX[ I_ ];
end;

function TCellIterPoinArray3D<_TItem_>.GetGiY( const I_:Shortint ) :Integer;
begin
     Result := _GY[ I_ ];
end;

function TCellIterPoinArray3D<_TItem_>.GetGiZ( const I_:Shortint ) :Integer;
begin
     Result := _GZ[ I_ ];
end;

function TCellIterPoinArray3D<_TItem_>.GetGi( const X_,Y_,Z_:Shortint ) :TInteger3D;
begin
     with Result do
     begin
          X := GiX[ X_ ];
          Y := GiY[ Y_ ];
          Z := GiZ[ Z_ ];
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TCellIterPoinArray3D<_TItem_>.Create( const Array_:TPoinArray3D<_TItem_> );
begin
     inherited Create;

     _Paren := Array_;

     Pos := TInteger3D.Create( 0, 0, 0 );
end;

destructor TCellIterPoinArray3D<_TItem_>.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TCellIterPoinArray3D<_TItem_>.GoPrevX;
var
   Y, Z :Integer;
begin
     Move( _GX[ -1 ], _GX[ 0 ], 3 * SizeOf( Integer ) );  Dec( _GX[ -1 ] );

     for Z := -1 to +2 do
     begin
          for Y := -1 to +2 do
          begin
               Move( _Poins[ Z, Y, -1 ], _Poins[ Z, Y, 0 ], 3 * SizeOf( _PItem_ ) );

               Dec( _Poins[ Z, Y, -1 ], _Paren.CounStepX );
          end;
     end;
end;

procedure TCellIterPoinArray3D<_TItem_>.GoNextX;
var
   Y, Z :Integer;
begin
     Move( _GX[ 0 ], _GX[ -1 ], 3 * SizeOf( Integer ) );  Inc( _GX[ +2 ] );

     for Z := -1 to +2 do
     begin
          for Y := -1 to +2 do
          begin
               Move( _Poins[ Z, Y, 0 ], _Poins[ Z, Y, -1 ], 3 * SizeOf( _PItem_ ) );

               Inc( _Poins[ Z, Y, +2 ], _Paren.CounStepX );
          end;
     end;
end;

//------------------------------------------------------------------------------

procedure TCellIterPoinArray3D<_TItem_>.GoPrevY;
var
   Z, X :Integer;
begin
     Move( _GY[ -1 ], _GY[ 0 ], 3 * SizeOf( Integer ) );  Dec( _GY[ -1 ] );

     for Z := -1 to +2 do
     begin
          Move( _HeadY[ Z, -1 ], _HeadY[ Z, 0 ],  3 * SizeOf( _PItem_ ) );  Dec( _HeadY[ Z, -1 ], _Paren.CounStepY );

          Move( _Poins[ Z, -1 ], _Poins[ Z, 0 ], 12 * SizeOf( _PItem_ ) );

          for X := -1 to +2 do Dec( _Poins[ Z, -1, X ], _Paren.CounStepY );
     end;
end;

procedure TCellIterPoinArray3D<_TItem_>.GoNextY;
var
   Z, X :Integer;
begin
     Move( _GY[ 0 ], _GY[ -1 ], 3 * SizeOf( Integer ) );  Inc( _GY[ +2 ] );

     for Z := -1 to +2 do
     begin
          Move( _HeadY[ Z, 0 ], _HeadY[ Z, -1 ],  3 * SizeOf( _PItem_ ) );  Inc( _HeadY[ Z, +2 ], _Paren.CounStepY );

          Move( _Poins[ Z, 0 ], _Poins[ Z, -1 ], 12 * SizeOf( _PItem_ ) );

          for X := -1 to +2 do Inc( _Poins[ Z, +2, X ], _Paren.CounStepY );
     end;
end;

//------------------------------------------------------------------------------

procedure TCellIterPoinArray3D<_TItem_>.GoPrevZ;
var
   X, Y :Integer;
begin
     Move( _GZ[ -1 ], _GZ[ 0 ], 3 * SizeOf( Integer ) );  Dec( _GZ[ -1 ] );

     Move( _HeadZ[ -1 ], _HeadZ[ 0 ], 3 * SizeOf( _PItem_ ) );  Dec( _HeadZ[ -1 ], _Paren.CounStepZ );

     Move( _Poins[ -1 ], _Poins[ 0 ], 48 * SizeOf( _PItem_ ) );

     for Y := -1 to +2 do
     begin
          for X := -1 to +2 do Dec( _Poins[ -1, Y, X ], _Paren.CounStepZ );
     end;
end;

procedure TCellIterPoinArray3D<_TItem_>.GoNextZ;
var
   X, Y :Integer;
begin
     Move( _GZ[ 0 ], _GZ[ -1 ], 3 * SizeOf( Integer ) );  Inc( _GZ[ +2 ] );

     Move( _HeadZ[ 0 ], _HeadZ[ -1 ], 3 * SizeOf( _PItem_ ) );  Inc( _HeadZ[ +2 ], _Paren.CounStepZ );

     Move( _Poins[ 0 ], _Poins[ -1 ], 48 * SizeOf( _PItem_ ) );

     for Y := -1 to +2 do
     begin
          for X := -1 to +2 do
          begin
               Inc( _Poins[ +2, Y, X ], _Paren.CounStepZ );
          end;
     end;
end;

//------------------------------------------------------------------------------

procedure TCellIterPoinArray3D<_TItem_>.GoPrevX( const N_:Integer );
var
   N :Integer;
begin
     for N := 1 to N_ do GoPrevX;
end;

procedure TCellIterPoinArray3D<_TItem_>.GoNextX( const N_:Integer );
var
   N :Integer;
begin
     for N := 1 to N_ do GoNextX;
end;

procedure TCellIterPoinArray3D<_TItem_>.GoPrevY( const N_:Integer );
var
   N :Integer;
begin
     for N := 1 to N_ do GoPrevY;
end;

procedure TCellIterPoinArray3D<_TItem_>.GoNextY( const N_:Integer );
var
   N :Integer;
begin
     for N := 1 to N_ do GoNextY;
end;

procedure TCellIterPoinArray3D<_TItem_>.GoPrevZ( const N_:Integer );
var
   N :Integer;
begin
     for N := 1 to N_ do GoPrevZ;
end;

procedure TCellIterPoinArray3D<_TItem_>.GoNextZ( const N_:Integer );
var
   N :Integer;
begin
     for N := 1 to N_ do GoNextZ;
end;

//------------------------------------------------------------------------------

function TCellIterPoinArray3D<_TItem_>.Interp( const Xd_,Yd_,Zd_:Single ) :_TItem_;
begin
     Result := Poins[ Round( Xd_ ), Round( Yd_ ), Round( Zd_ ) ];
end;

function TCellIterPoinArray3D<_TItem_>.AbsoInterp( const X_,Y_,Z_:Single ) :_TItem_;
var
   Xd, Yd, Zd :Single;
begin
     PosZ := Floor( Z_ );  Zd := Z_ - PosZ;
     PosY := Floor( Y_ );  Yd := Y_ - PosY;
     PosX := Floor( X_ );  Xd := X_ - PosX;

     Result := Interp( Xd, Yd, Zd );
end;

//------------------------------------------------------------------------------

procedure TCellIterPoinArray3D<_TItem_>.ForCells( const Proc_:TProc );
var
   X, Y, Z :Integer;
begin
     PosZ := 0;
     for Z := 1 to _Paren.CellsZ do
     begin
          PosY := 0;
          for Y := 1 to _Paren.CellsY do
          begin
               PosX := 0;
               for X := 1 to _Paren.CellsX do
               begin
                    Proc_;

                    GoNextX;
               end;
               GoNextY;
          end;
          GoNextZ;
     end;
end;

procedure TCellIterPoinArray3D<_TItem_>.ForEdgesX( const Proc_:TProc );
var
   X, Y, Z :Integer;
begin
     PosZ := 0;
     for Z := 0 to _Paren.CellsZ do
     begin
          PosY := 0;
          for Y := 0 to _Paren.CellsY do
          begin
               PosX := 0;
               for X := 1 to _Paren.CellsX do
               begin
                    Proc_;

                    GoNextX;
               end;
               GoNextY;
          end;
          GoNextZ;
     end;
end;

procedure TCellIterPoinArray3D<_TItem_>.ForEdgesY( const Proc_:TProc );
var
   X, Y, Z :Integer;
begin
     PosZ := 0;
     for Z := 0 to _Paren.CellsZ do
     begin
          PosY := 0;
          for Y := 1 to _Paren.CellsY do
          begin
               PosX := 0;
               for X := 0 to _Paren.CellsX do
               begin
                    Proc_;

                    GoNextX;
               end;
               GoNextY;
          end;
          GoNextZ;
     end;
end;

procedure TCellIterPoinArray3D<_TItem_>.ForEdgesZ( const Proc_:TProc );
var
   X, Y, Z :Integer;
begin
     PosZ := 0;
     for Z := 1 to _Paren.CellsZ do
     begin
          PosY := 0;
          for Y := 0 to _Paren.CellsY do
          begin
               PosX := 0;
               for X := 0 to _Paren.CellsX do
               begin
                    Proc_;

                    GoNextX;
               end;
               GoNextY;
          end;
          GoNextZ;
     end;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
