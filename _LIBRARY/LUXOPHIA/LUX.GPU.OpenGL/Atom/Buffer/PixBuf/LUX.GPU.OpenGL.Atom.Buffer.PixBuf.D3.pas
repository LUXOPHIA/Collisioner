unit LUX.GPU.OpenGL.Atom.Buffer.PixBuf.D3;

interface //#################################################################### ■

uses System.Classes,
     Winapi.OpenGL, Winapi.OpenGLext,
     LUX, LUX.D3,
     LUX.GPU.OpenGL.Atom,
     LUX.GPU.OpenGL.Atom.Buffer,
     LUX.GPU.OpenGL.Atom.Textur,
     LUX.GPU.OpenGL.Atom.Buffer.PixBuf,
     LUX.GPU.OpenGL.Atom.Buffer.PixBuf.D2;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     IGLPixBuf3D   = interface;
       IGLPoiPix3D = interface;
       IGLCelPix3D = interface;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPixBufIter3D<_TItem_>

     TGLPixBufIter3D<_TItem_:record> = class( TGLPixBufIter2D<_TItem_> )
     public type
       _PItem_ = TGLPixBufIter2D<_TItem_>._PItem_;
     protected
       ///// アクセス
       function GetParen :IGLPixBuf3D;
       function GetElemsZ :Integer;
       function GetItemsZ :Integer;
       function GetMargsZ :Integer;
       function GetPoinsZ :Integer;
       function GetCellsZ :Integer;
       ///// メソッド
       function ItemsI( const X_,Y_,Z_:Integer ) :Integer;
     public
       ///// プロパティ
       property Paren  :IGLPixBuf3D read GetParen ;
       property ElemsZ :Integer     read GetElemsZ;
       property ItemsZ :Integer     read GetItemsZ;
       property MargsZ :Integer     read GetMargsZ;
       property PoinsZ :Integer     read GetPoinsZ;
       property CellsZ :Integer     read GetCellsZ;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPixBuf3D<_TItem_,_TIter_>

     IGLPixBuf3D = interface( IGLPixBuf2D )
     ['{68D24B25-0598-466A-BD4D-BBAFC369B5CD}']
     {protected}
       ///// アクセス
       function GetElemsZ :Integer;
       function GetItemsZ :Integer;
       procedure SetItemsZ( const ItemsZ_:Integer );
       function GetMargsZ :Integer;
       procedure SetMargsZ( const MargsZ_:Integer );
       function GetPoinsZ :Integer;
       procedure SetPoinsZ( const PoinsZ_:Integer );
       function GetCellsZ :Integer;
       procedure SetCellsZ( const CellsZ_:Integer );
     {public}
       ///// プロパティ
       property ElemsZ :Integer read GetElemsZ                ;
       property ItemsZ :Integer read GetItemsZ write SetItemsZ;
       property MargsZ :Integer read GetMargsZ write SetMargsZ;
       property PoinsZ :Integer read GetPoinsZ write SetPoinsZ;
       property CellsZ :Integer read GetCellsZ write SetCellsZ;
     end;

     //-------------------------------------------------------------------------

     TGLPixBuf3D<_TItem_:record;
                 _TIter_:TGLPixBufIter3D<_TItem_>,constructor> = class( TGLPixBuf2D<_TItem_,_TIter_>, IGLPixBuf3D )
     private
     protected
       _ItemsZ :Integer;
       _MargsZ :Integer;
       ///// アクセス
       function GetElemsN :Integer; override;
       function GetPoinsN :Integer; override;
       function GetCellsN :Integer; override;
       function GetElemsZ :Integer;
       function GetItemsZ :Integer;
       procedure SetItemsZ( const ItemsZ_:Integer );
       function GetMargsZ :Integer;
       procedure SetMargsZ( const MargsZ_:Integer );
       function GetPoinsZ :Integer; virtual; abstract;
       procedure SetPoinsZ( const PoinsZ_:Integer ); virtual; abstract;
       function GetCellsZ :Integer; virtual; abstract;
       procedure SetCellsZ( const CellsZ_:Integer ); virtual; abstract;
     public
       constructor Create( const Usage_:GLenum ); override;
       ///// プロパティ
       property ElemsZ :Integer read GetElemsZ                ;
       property ItemsZ :Integer read GetItemsZ write SetItemsZ;
       property MargsZ :Integer read GetMargsZ write SetMargsZ;
       property PoinsZ :Integer read GetPoinsZ write SetPoinsZ;
       property CellsZ :Integer read GetCellsZ write SetCellsZ;
       ///// メソッド
       procedure Read( const Stream_:TStream );
       procedure Write( const Stream_:TStream );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPoiPixIter3D<_TItem_>

     TGLPoiPixIter3D<_TItem_:record> = class( TGLPixBufIter3D<_TItem_> )
     public type
       _PItem_ = TGLPixBufIter3D<_TItem_>._PItem_;
     protected
       ///// アクセス
       function GetPoins( const X_,Y_,Z_:Integer ) :_TItem_;
       procedure SetPoins( const X_,Y_,Z_:Integer; const Item_:_TItem_ );
       function GetPoinsP( const X_,Y_,Z_:Integer ) :_PItem_;
     public
       ///// プロパティ
       property Poins [ const X_,Y_,Z_:Integer ] :_TItem_ read GetPoins  write SetPoins; default;
       property PoinsP[ const X_,Y_,Z_:Integer ] :_PItem_ read GetPoinsP               ;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPoiPix3D<_TItem_>

     IGLPoiPix3D = interface( IGLPixBuf3D )
     ['{97C18089-90B8-4E43-9C6D-59737D6D555E}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TGLPoiPix3D<_TItem_:record> = class( TGLPixBuf3D<_TItem_,TGLPoiPixIter3D<_TItem_>>, IGLPoiPix3D )
     private
     protected
       ///// アクセス
       function GetPoinsX :Integer; override;
       procedure SetPoinsX( const PoinsX_:Integer ); override;
       function GetPoinsY :Integer; override;
       procedure SetPoinsY( const PoinsY_:Integer ); override;
       function GetPoinsZ :Integer; override;
       procedure SetPoinsZ( const PoinsZ_:Integer ); override;
       function GetCellsX :Integer; override;
       procedure SetCellsX( const CellsX_:Integer ); override;
       function GetCellsY :Integer; override;
       procedure SetCellsY( const CellsY_:Integer ); override;
       function GetCellsZ :Integer; override;
       procedure SetCellsZ( const CellsZ_:Integer ); override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLCelPixIter3D<_TItem_>

     TGLCelPixIter3D<_TItem_:record> = class( TGLPixBufIter3D<_TItem_> )
     public type
       _PItem_ = TGLPixBufIter3D<_TItem_>._PItem_;
     protected
       ///// アクセス
       function GetCells( const X_,Y_,Z_:Integer ) :_TItem_;
       procedure SetCells( const X_,Y_,Z_:Integer; const Item_:_TItem_ );
       function GetCellsP( const X_,Y_,Z_:Integer ) :_PItem_;
     public
       ///// プロパティ
       property Cells [ const X_,Y_,Z_:Integer ] :_TItem_ read GetCells  write SetCells; default;
       property CellsP[ const X_,Y_,Z_:Integer ] :_PItem_ read GetCellsP               ;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLCelPix3D<_TItem_>

     IGLCelPix3D = interface( IGLPixBuf3D )
     ['{4ED06E66-A90B-4FE4-B8D9-742FAF6025FB}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TGLCelPix3D<_TItem_:record> = class( TGLPixBuf3D<_TItem_,TGLCelPixIter3D<_TItem_>>, IGLCelPix3D )
     private
     protected
       ///// アクセス
       function GetPoinsX :Integer; override;
       procedure SetPoinsX( const PoinsX_:Integer ); override;
       function GetPoinsY :Integer; override;
       procedure SetPoinsY( const PoinsY_:Integer ); override;
       function GetPoinsZ :Integer; override;
       procedure SetPoinsZ( const PoinsZ_:Integer ); override;
       function GetCellsX :Integer; override;
       procedure SetCellsX( const CellsX_:Integer ); override;
       function GetCellsY :Integer; override;
       procedure SetCellsY( const CellsY_:Integer ); override;
       function GetCellsZ :Integer; override;
       procedure SetCellsZ( const CellsZ_:Integer ); override;
     public
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPixBufIter3D<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLPixBufIter3D<_TItem_>.GetParen :IGLPixBuf3D;
begin
     Result := _Paren as IGLPixBuf3D;
end;

function TGLPixBufIter3D<_TItem_>.GetElemsZ :Integer;
begin
     Result := Paren.ElemsZ;
end;

function TGLPixBufIter3D<_TItem_>.GetItemsZ :Integer;
begin
     Result := Paren.ItemsZ;
end;

function TGLPixBufIter3D<_TItem_>.GetMargsZ :Integer;
begin
     Result := Paren.MargsZ;
end;

function TGLPixBufIter3D<_TItem_>.GetPoinsZ :Integer;
begin
     Result := Paren.PoinsZ;
end;

function TGLPixBufIter3D<_TItem_>.GetCellsZ :Integer;
begin
     Result := Paren.CellsZ;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TGLPixBufIter3D<_TItem_>.ItemsI( const X_,Y_,Z_:Integer ) :Integer;
begin
     Result := ( ( MargsZ + Z_ ) * ElemsY + ( MargsY + Y_ ) ) * ElemsX + ( MargsX + X_ );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPixBuf3D<_TItem_,_TIter_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLPixBuf3D<_TItem_,_TIter_>.GetElemsN :Integer;
begin
     Result := ElemsZ * ElemsY * ElemsX;
end;

function TGLPixBuf3D<_TItem_,_TIter_>.GetPoinsN :Integer;
begin
     Result := PoinsZ * PoinsY * PoinsX;
end;

function TGLPixBuf3D<_TItem_,_TIter_>.GetCellsN :Integer;
begin
     Result := CellsZ * CellsY * CellsX;
end;

function TGLPixBuf3D<_TItem_,_TIter_>.GetElemsZ :Integer;
begin
     Result := _MargsZ + _ItemsZ + _MargsZ;
end;

//------------------------------------------------------------------------------

function TGLPixBuf3D<_TItem_,_TIter_>.GetItemsZ :Integer;
begin
     Result := _ItemsZ;
end;

procedure TGLPixBuf3D<_TItem_,_TIter_>.SetItemsZ( const ItemsZ_:Integer );
begin
     _ItemsZ := ItemsZ_;  MakeBuffer;
end;

//------------------------------------------------------------------------------

function TGLPixBuf3D<_TItem_,_TIter_>.GetMargsZ :Integer;
begin
     Result := _MargsZ;
end;

procedure TGLPixBuf3D<_TItem_,_TIter_>.SetMargsZ( const MargsZ_:Integer );
begin
     _MargsZ := MargsZ_;  MakeBuffer;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLPixBuf3D<_TItem_,_TIter_>.Create( const Usage_:GLenum );
begin
     inherited;

     _ItemsZ := 1;
     _MargsZ := 0;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLPixBuf3D<_TItem_,_TIter_>.Read( const Stream_:TStream );
var
   C, M :TCardinal3D;
begin
     with Stream_ do
     begin
          Read( C, SizeOf( TCardinal3D ) );
          Read( M, SizeOf( TCardinal3D ) );
     end;

     CellsX := C.X;
     CellsY := C.Y;
     CellsZ := C.Z;

     MargsX := M.X;
     MargsY := M.Y;
     MargsZ := M.Z;

     inherited;
end;

procedure TGLPixBuf3D<_TItem_,_TIter_>.Write( const Stream_:TStream );
var
   C, M :TCardinal3D;
begin
     with C do
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
          Write( C, SizeOf( TCardinal3D ) );
          Write( M, SizeOf( TCardinal3D ) );
     end;

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPoiPixIter3D<_TItem_>

/////////////////////////////////////////////////////////////////////// アクセス

function TGLPoiPixIter3D<_TItem_>.GetPoins( const X_,Y_,Z_:Integer ) :_TItem_;
begin
     Result := inherited Items[ ItemsI( X_, Y_, Z_ ) ];
end;

procedure TGLPoiPixIter3D<_TItem_>.SetPoins( const X_,Y_,Z_:Integer; const Item_:_TItem_ );
begin
     inherited Items[ ItemsI( X_, Y_, Z_ ) ] := Item_;
end;

//------------------------------------------------------------------------------

function TGLPoiPixIter3D<_TItem_>.GetPoinsP( const X_,Y_,Z_:Integer ) :_PItem_;
begin
     Result := inherited ItemsP[ ItemsI( X_, Y_, Z_ ) ];
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPoiPix3D<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLPoiPix3D<_TItem_>.GetPoinsX :Integer;
begin
     Result := ItemsX;
end;

procedure TGLPoiPix3D<_TItem_>.SetPoinsX( const PoinsX_:Integer );
begin
     ItemsX := PoinsX_;
end;

function TGLPoiPix3D<_TItem_>.GetPoinsY :Integer;
begin
     Result := ItemsY;
end;

procedure TGLPoiPix3D<_TItem_>.SetPoinsY( const PoinsY_:Integer );
begin
     ItemsY := PoinsY_;
end;

function TGLPoiPix3D<_TItem_>.GetPoinsZ :Integer;
begin
     Result := ItemsZ;
end;

procedure TGLPoiPix3D<_TItem_>.SetPoinsZ( const PoinsZ_:Integer );
begin
     ItemsZ := PoinsZ_;
end;

//------------------------------------------------------------------------------

function TGLPoiPix3D<_TItem_>.GetCellsX :Integer;
begin
     Result := ItemsX - 1;
end;

procedure TGLPoiPix3D<_TItem_>.SetCellsX( const CellsX_:Integer );
begin
     ItemsX := CellsX_ + 1;
end;

function TGLPoiPix3D<_TItem_>.GetCellsY :Integer;
begin
     Result := ItemsY - 1;
end;

procedure TGLPoiPix3D<_TItem_>.SetCellsY( const CellsY_:Integer );
begin
     ItemsY := CellsY_ + 1;
end;

function TGLPoiPix3D<_TItem_>.GetCellsZ :Integer;
begin
     Result := ItemsZ - 1;
end;

procedure TGLPoiPix3D<_TItem_>.SetCellsZ( const CellsZ_:Integer );
begin
     ItemsZ := CellsZ_ + 1;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLCelPixIter3D<_TItem_>

/////////////////////////////////////////////////////////////////////// アクセス

function TGLCelPixIter3D<_TItem_>.GetCells( const X_,Y_,Z_:Integer ) :_TItem_;
begin
     Result := inherited Items[ ItemsI( X_, Y_, Z_ ) ];
end;

procedure TGLCelPixIter3D<_TItem_>.SetCells( const X_,Y_,Z_:Integer; const Item_:_TItem_ );
begin
     inherited Items[ ItemsI( X_, Y_, Z_ ) ] := Item_;
end;

//------------------------------------------------------------------------------

function TGLCelPixIter3D<_TItem_>.GetCellsP( const X_,Y_,Z_:Integer ) :_PItem_;
begin
     Result := inherited ItemsP[ ItemsI( X_, Y_, Z_ ) ];
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLCelPix3D<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLCelPix3D<_TItem_>.GetPoinsX :Integer;
begin
     Result := ItemsX + 1;
end;

procedure TGLCelPix3D<_TItem_>.SetPoinsX( const PoinsX_:Integer );
begin
     ItemsX := PoinsX_ - 1;
end;

function TGLCelPix3D<_TItem_>.GetPoinsY :Integer;
begin
     Result := ItemsY + 1;
end;

procedure TGLCelPix3D<_TItem_>.SetPoinsY( const PoinsY_:Integer );
begin
     ItemsY := PoinsY_ - 1;
end;

function TGLCelPix3D<_TItem_>.GetPoinsZ :Integer;
begin
     Result := ItemsZ + 1;
end;

procedure TGLCelPix3D<_TItem_>.SetPoinsZ( const PoinsZ_:Integer );
begin
     ItemsZ := PoinsZ_ - 1;
end;

//------------------------------------------------------------------------------

function TGLCelPix3D<_TItem_>.GetCellsX :Integer;
begin
     Result := ItemsX;
end;

procedure TGLCelPix3D<_TItem_>.SetCellsX( const CellsX_:Integer );
begin
     ItemsX := CellsX_;
end;

function TGLCelPix3D<_TItem_>.GetCellsY :Integer;
begin
     Result := ItemsY;
end;

procedure TGLCelPix3D<_TItem_>.SetCellsY( const CellsY_:Integer );
begin
     ItemsY := CellsY_;
end;

function TGLCelPix3D<_TItem_>.GetCellsZ :Integer;
begin
     Result := ItemsZ;
end;

procedure TGLCelPix3D<_TItem_>.SetCellsZ( const CellsZ_:Integer );
begin
     ItemsZ := CellsZ_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■