unit LUX.GPU.OpenGL.Atom.Buffer.PixBuf.D2;

interface //#################################################################### ■

uses Winapi.OpenGL, Winapi.OpenGLext,
     LUX,
     LUX.GPU.OpenGL.Atom,
     LUX.GPU.OpenGL.Atom.Buffer,
     LUX.GPU.OpenGL.Atom.Textur,
     LUX.GPU.OpenGL.Atom.Buffer.PixBuf,
     LUX.GPU.OpenGL.Atom.Buffer.PixBuf.D1;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     IGLPixBuf2D   = interface;
       IGLPoiPix2D = interface;
       IGLCelPix2D = interface;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPixBufIter2D<_TItem_>

     TGLPixBufIter2D<_TItem_:record> = class( TGLPixBufIter1D<_TItem_> )
     public type
       _PItem_ = TGLPixBufIter1D<_TItem_>._PItem_;
     protected
       ///// アクセス
       function GetParen :IGLPixBuf2D;
       function GetElemsY :Integer;
       function GetItemsY :Integer;
       function GetMargsY :Integer;
       function GetPoinsY :Integer;
       function GetCellsY :Integer;
       ///// メソッド
       function ItemsI( const X_,Y_:Integer ) :Integer;
     public
       ///// プロパティ
       property Paren  :IGLPixBuf2D read GetParen ;
       property ElemsY :Integer     read GetElemsY;
       property ItemsY :Integer     read GetItemsY;
       property MargsY :Integer     read GetMargsY;
       property PoinsY :Integer     read GetPoinsY;
       property CellsY :Integer     read GetCellsY;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPixBuf2D<_TItem_,_TIter_>

     IGLPixBuf2D = interface( IGLPixBuf1D )
     ['{127179DF-CB40-4505-8805-59C0E3A6E411}']
     {protected}
       ///// アクセス
       function GetElemsY :Integer;
       function GetItemsY :Integer;
       procedure SetItemsY( const ItemsY_:Integer );
       function GetMargsY :Integer;
       procedure SetMargsY( const MargsY_:Integer );
       function GetPoinsY :Integer;
       procedure SetPoinsY( const PoinsY_:Integer );
       function GetCellsY :Integer;
       procedure SetCellsY( const CellsY_:Integer );
     {public}
       ///// プロパティ
       property ElemsY :Integer read GetElemsY                ;
       property ItemsY :Integer read GetItemsY write SetItemsY;
       property MargsY :Integer read GetMargsY write SetMargsY;
       property PoinsY :Integer read GetPoinsY write SetPoinsY;
       property CellsY :Integer read GetCellsY write SetCellsY;
     end;

     //-------------------------------------------------------------------------

     TGLPixBuf2D<_TItem_:record;
                 _TIter_:TGLPixBufIter2D<_TItem_>,constructor> = class( TGLPixBuf1D<_TItem_,_TIter_>, IGLPixBuf2D )
     private
     protected
       _ItemsY :Integer;
       _MargsY :Integer;
       ///// アクセス
       function GetElemsN :Integer; override;
       function GetPoinsN :Integer; override;
       function GetCellsN :Integer; override;
       function GetElemsY :Integer;
       function GetItemsY :Integer;
       procedure SetItemsY( const ItemsY_:Integer );
       function GetMargsY :Integer;
       procedure SetMargsY( const MargsY_:Integer );
       function GetPoinsY :Integer; virtual; abstract;
       procedure SetPoinsY( const PoinsY_:Integer ); virtual; abstract;
       function GetCellsY :Integer; virtual; abstract;
       procedure SetCellsY( const CellsY_:Integer ); virtual; abstract;
     public
       constructor Create( const Usage_:GLenum ); override;
       ///// プロパティ
       property ElemsY :Integer read GetElemsY                ;
       property ItemsY :Integer read GetItemsY write SetItemsY;
       property MargsY :Integer read GetMargsY write SetMargsY;
       property PoinsY :Integer read GetPoinsY write SetPoinsY;
       property CellsY :Integer read GetCellsY write SetCellsY;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPoiPixIter2D<_TItem_>

     TGLPoiPixIter2D<_TItem_:record> = class( TGLPixBufIter2D<_TItem_> )
     public type
       _PItem_ = TGLPixBufIter2D<_TItem_>._PItem_;
     protected
       ///// アクセス
       function GetPoins( const X_,Y_:Integer ) :_TItem_;
       procedure SetPoins( const X_,Y_:Integer; const Item_:_TItem_ );
       function GetPoinsP( const X_,Y_:Integer ) :_PItem_;
     public
       ///// プロパティ
       property Poins [ const X_,Y_:Integer ] :_TItem_ read GetPoins  write SetPoins; default;
       property PoinsP[ const X_,Y_:Integer ] :_PItem_ read GetPoinsP               ;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPoiPix2D<_TItem_>

     IGLPoiPix2D = interface( IGLPixBuf2D )
     ['{2BEE5402-3221-44CF-9278-5D489B0CAC4A}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TGLPoiPix2D<_TItem_:record> = class( TGLPixBuf2D<_TItem_,TGLPoiPixIter2D<_TItem_>>, IGLPoiPix2D )
     private
     protected
       ///// アクセス
       function GetPoinsX :Integer; override;
       procedure SetPoinsX( const PoinsX_:Integer ); override;
       function GetPoinsY :Integer; override;
       procedure SetPoinsY( const PoinsY_:Integer ); override;
       function GetCellsX :Integer; override;
       procedure SetCellsX( const CellsX_:Integer ); override;
       function GetCellsY :Integer; override;
       procedure SetCellsY( const CellsY_:Integer ); override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLCelPixIter2D<_TItem_>

     TGLCelPixIter2D<_TItem_:record> = class( TGLPixBufIter2D<_TItem_> )
     public type
       _PItem_ = TGLPixBufIter2D<_TItem_>._PItem_;
     protected
       ///// アクセス
       function GetCells( const X_,Y_:Integer ) :_TItem_;
       procedure SetCells( const X_,Y_:Integer; const Item_:_TItem_ );
       function GetCellsP( const X_,Y_:Integer ) :_PItem_;
     public
       ///// プロパティ
       property Cells [ const X_,Y_:Integer ] :_TItem_ read GetCells  write SetCells; default;
       property CellsP[ const X_,Y_:Integer ] :_PItem_ read GetCellsP               ;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLCelPix2D<_TItem_>

     IGLCelPix2D = interface( IGLPixBuf2D )
     ['{D44A1241-907E-4167-8E1D-F2A473767526}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TGLCelPix2D<_TItem_:record> = class( TGLPixBuf2D<_TItem_,TGLCelPixIter2D<_TItem_>>, IGLCelPix2D )
     private
     protected
       ///// アクセス
       function GetPoinsX :Integer; override;
       procedure SetPoinsX( const PoinsX_:Integer ); override;
       function GetPoinsY :Integer; override;
       procedure SetPoinsY( const PoinsY_:Integer ); override;
       function GetCellsX :Integer; override;
       procedure SetCellsX( const CellsX_:Integer ); override;
       function GetCellsY :Integer; override;
       procedure SetCellsY( const CellsY_:Integer ); override;
     public
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPixBufIter2D<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLPixBufIter2D<_TItem_>.GetParen :IGLPixBuf2D;
begin
     Result := _Paren as IGLPixBuf2D;
end;

function TGLPixBufIter2D<_TItem_>.GetElemsY :Integer;
begin
     Result := Paren.ElemsY;
end;

function TGLPixBufIter2D<_TItem_>.GetItemsY :Integer;
begin
     Result := Paren.ItemsY;
end;

function TGLPixBufIter2D<_TItem_>.GetMargsY :Integer;
begin
     Result := Paren.MargsY;
end;

function TGLPixBufIter2D<_TItem_>.GetPoinsY :Integer;
begin
     Result := Paren.PoinsY;
end;

function TGLPixBufIter2D<_TItem_>.GetCellsY :Integer;
begin
     Result := Paren.CellsY;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TGLPixBufIter2D<_TItem_>.ItemsI( const X_,Y_:Integer ) :Integer;
begin
     Result := ( MargsY + Y_ ) * ElemsX + ( MargsX + X_ );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPixBuf2D<_TItem_,_TIter_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLPixBuf2D<_TItem_,_TIter_>.GetElemsN :Integer;
begin
     Result := ElemsY * ElemsX;
end;

function TGLPixBuf2D<_TItem_,_TIter_>.GetPoinsN :Integer;
begin
     Result := PoinsY * PoinsX;
end;

function TGLPixBuf2D<_TItem_,_TIter_>.GetCellsN :Integer;
begin
     Result := CellsY * CellsX;
end;

function TGLPixBuf2D<_TItem_,_TIter_>.GetElemsY :Integer;
begin
     Result := _MargsY + _ItemsY + _MargsY;
end;

//------------------------------------------------------------------------------

function TGLPixBuf2D<_TItem_,_TIter_>.GetItemsY :Integer;
begin
     Result := _ItemsY;
end;

procedure TGLPixBuf2D<_TItem_,_TIter_>.SetItemsY( const ItemsY_:Integer );
begin
     _ItemsY := ItemsY_;  MakeBuffer;
end;

//------------------------------------------------------------------------------

function TGLPixBuf2D<_TItem_,_TIter_>.GetMargsY :Integer;
begin
     Result := _MargsY;
end;

procedure TGLPixBuf2D<_TItem_,_TIter_>.SetMargsY( const MargsY_:Integer );
begin
     _MargsY := MargsY_;  MakeBuffer;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLPixBuf2D<_TItem_,_TIter_>.Create( const Usage_:GLenum );
begin
     inherited;

     _ItemsY := 1;
     _MargsY := 0;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPoiPixIter2D<_TItem_>

/////////////////////////////////////////////////////////////////////// アクセス

function TGLPoiPixIter2D<_TItem_>.GetPoins( const X_,Y_:Integer ) :_TItem_;
begin
     Result := inherited Items[ ItemsI( X_, Y_ ) ];
end;

procedure TGLPoiPixIter2D<_TItem_>.SetPoins( const X_,Y_:Integer; const Item_:_TItem_ );
begin
     inherited Items[ ItemsI( X_, Y_ ) ] := Item_;
end;

//------------------------------------------------------------------------------

function TGLPoiPixIter2D<_TItem_>.GetPoinsP( const X_,Y_:Integer ) :_PItem_;
begin
     Result := inherited ItemsP[ ItemsI( X_, Y_ ) ];
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPoiPix2D<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLPoiPix2D<_TItem_>.GetPoinsX :Integer;
begin
     Result := ItemsX;
end;

procedure TGLPoiPix2D<_TItem_>.SetPoinsX( const PoinsX_:Integer );
begin
     ItemsX := PoinsX_;
end;

function TGLPoiPix2D<_TItem_>.GetPoinsY :Integer;
begin
     Result := ItemsY;
end;

procedure TGLPoiPix2D<_TItem_>.SetPoinsY( const PoinsY_:Integer );
begin
     ItemsY := PoinsY_;
end;

//------------------------------------------------------------------------------

function TGLPoiPix2D<_TItem_>.GetCellsX :Integer;
begin
     Result := ItemsX - 1;
end;

procedure TGLPoiPix2D<_TItem_>.SetCellsX( const CellsX_:Integer );
begin
     ItemsX := CellsX_ + 1;
end;

function TGLPoiPix2D<_TItem_>.GetCellsY :Integer;
begin
     Result := ItemsY - 1;
end;

procedure TGLPoiPix2D<_TItem_>.SetCellsY( const CellsY_:Integer );
begin
     ItemsY := CellsY_ + 1;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLCelPixIter2D<_TItem_>

/////////////////////////////////////////////////////////////////////// アクセス

function TGLCelPixIter2D<_TItem_>.GetCells( const X_,Y_:Integer ) :_TItem_;
begin
     Result := inherited Items[ ItemsI( X_, Y_ ) ];
end;

procedure TGLCelPixIter2D<_TItem_>.SetCells( const X_,Y_:Integer; const Item_:_TItem_ );
begin
     inherited Items[ ItemsI( X_, Y_ ) ] := Item_;
end;

//------------------------------------------------------------------------------

function TGLCelPixIter2D<_TItem_>.GetCellsP( const X_,Y_:Integer ) :_PItem_;
begin
     Result := inherited ItemsP[ ItemsI( X_, Y_ ) ];
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLCelPix2D<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLCelPix2D<_TItem_>.GetPoinsX :Integer;
begin
     Result := ItemsX + 1;
end;

procedure TGLCelPix2D<_TItem_>.SetPoinsX( const PoinsX_:Integer );
begin
     ItemsX := PoinsX_ - 1;
end;

function TGLCelPix2D<_TItem_>.GetPoinsY :Integer;
begin
     Result := ItemsY + 1;
end;

procedure TGLCelPix2D<_TItem_>.SetPoinsY( const PoinsY_:Integer );
begin
     ItemsY := PoinsY_ - 1;
end;

//------------------------------------------------------------------------------

function TGLCelPix2D<_TItem_>.GetCellsX :Integer;
begin
     Result := ItemsX;
end;

procedure TGLCelPix2D<_TItem_>.SetCellsX( const CellsX_:Integer );
begin
     ItemsX := CellsX_;
end;

function TGLCelPix2D<_TItem_>.GetCellsY :Integer;
begin
     Result := ItemsY;
end;

procedure TGLCelPix2D<_TItem_>.SetCellsY( const CellsY_:Integer );
begin
     ItemsY := CellsY_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■