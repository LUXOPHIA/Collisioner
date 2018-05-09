unit LUX.GPU.OpenGL.Atom.Buffer.PixBuf.D1;

interface //#################################################################### ■

uses Winapi.OpenGL, Winapi.OpenGLext,
     LUX,
     LUX.GPU.OpenGL.Atom,
     LUX.GPU.OpenGL.Atom.Buffer,
     LUX.GPU.OpenGL.Atom.Textur,
     LUX.GPU.OpenGL.Atom.Buffer.PixBuf;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     IGLPixBuf1D   = interface;
       IGLPoiPix1D = interface;
       IGLCelPix1D = interface;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPixBufIter1D<_TItem_>

     TGLPixBufIter1D<_TItem_:record> = class( TGLPixBufIter<_TItem_> )
     public type
       _PItem_ = TGLPixBufIter<_TItem_>._PItem_;
     protected
       ///// アクセス
       function GetParen :IGLPixBuf1D;
       function GetPoinsX :Integer;
       function GetCellsX :Integer;
     public
       ///// プロパティ
       property Paren  :IGLPixBuf1D read GetParen ;
       property PoinsX :Integer     read GetPoinsX;
       property CellsX :Integer     read GetCellsX;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPixBuf1D<_TItem_,_TIter_>

     IGLPixBuf1D = interface( IGLBuffer )
     ['{441F1A9D-EC3A-43DE-94D6-467ACF6AA0A8}']
     {protected}
       ///// アクセス
       function GetItemsX :Integer;
       procedure SetItemsX( const ItemsX_:Integer );
       function GetPoinsX :Integer;
       procedure SetPoinsX( const PoinsX_:Integer );
       function GetCellsX :Integer;
       procedure SetCellsX( const CellsX_:Integer );
     {public}
       ///// プロパティ
       property ItemsX :Integer read GetItemsX write SetItemsX;
       property PoinsX :Integer read GetPoinsX write SetPoinsX;
       property CellsX :Integer read GetCellsX write SetCellsX;
     end;

     //-------------------------------------------------------------------------

     TGLPixBuf1D<_TItem_:record;
                 _TIter_:TGLPixBufIter1D<_TItem_>,constructor> = class( TGLPixBuf<_TItem_,_TIter_>, IGLPixBuf1D )
     private
     protected
       _ItemsX :Integer;
       ///// アクセス
       function GetItemsX :Integer;
       procedure SetItemsX( const ItemsX_:Integer );
       function GetPoinsX :Integer; virtual; abstract;
       procedure SetPoinsX( const PoinsX_:Integer ); virtual; abstract;
       function GetCellsX :Integer; virtual; abstract;
       procedure SetCellsX( const CellsX_:Integer ); virtual; abstract;
       ///// メソッド
       procedure MakeCount; virtual;
     public
       ///// プロパティ
       property ItemsX :Integer read GetItemsX write SetItemsX;
       property PoinsX :Integer read GetPoinsX write SetPoinsX;
       property CellsX :Integer read GetCellsX write SetCellsX;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPoiPixIter1D<_TItem_>

     TGLPoiPixIter1D<_TItem_:record> = class( TGLPixBufIter1D<_TItem_> )
     public type
       _PItem_ = TGLPixBufIter1D<_TItem_>._PItem_;
     protected
       ///// アクセス
       function GetPoins( const X_:Integer ) :_TItem_;
       procedure SetPoins( const X_:Integer; const Item_:_TItem_ );
       function GetPoinsP( const X_:Integer ) :_PItem_;
       ///// メソッド
       function ItemsI( const X_:Integer ) :Integer;
     public
       ///// プロパティ
       property Poins [ const X_:Integer ] :_TItem_ read GetPoins  write SetPoins; default;
       property PoinsP[ const X_:Integer ] :_PItem_ read GetPoinsP               ;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPoiPix1D<_TItem_>

     IGLPoiPix1D = interface( IGLPixBuf1D )
     ['{E9A6BD3C-D3F2-461E-8EF6-2224AB77E315}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TGLPoiPix1D<_TItem_:record> = class( TGLPixBuf1D<_TItem_,TGLPoiPixIter1D<_TItem_>>, IGLPoiPix1D )
     private
     protected
       ///// アクセス
       function GetPoinsX :Integer; override;
       procedure SetPoinsX( const PoinsX_:Integer ); override;
       function GetCellsX :Integer; override;
       procedure SetCellsX( const CellsX_:Integer ); override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLCelPixIter1D<_TItem_>

     TGLCelPixIter1D<_TItem_:record> = class( TGLPixBufIter1D<_TItem_> )
     public type
       _PItem_ = TGLPixBufIter1D<_TItem_>._PItem_;
     protected
       ///// アクセス
       function GetCells( const X_:Integer ) :_TItem_;
       procedure SetCells( const X_:Integer; const Item_:_TItem_ );
       function GetCellsP( const X_:Integer ) :_PItem_;
       ///// メソッド
       function ItemsI( const X_:Integer ) :Integer;
     public
       ///// プロパティ
       property Cells [ const X_:Integer ] :_TItem_ read GetCells  write SetCells; default;
       property CellsP[ const X_:Integer ] :_PItem_ read GetCellsP               ;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLCelPix1D<_TItem_>

     IGLCelPix1D = interface( IGLPixBuf1D )
     ['{89BBCE48-2D21-44D0-AC4D-B4ED6110B674}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TGLCelPix1D<_TItem_:record> = class( TGLPixBuf1D<_TItem_,TGLCelPixIter1D<_TItem_>>, IGLCelPix1D )
     private
     protected
       ///// アクセス
       function GetPoinsX :Integer; override;
       procedure SetPoinsX( const PoinsX_:Integer ); override;
       function GetCellsX :Integer; override;
       procedure SetCellsX( const CellsX_:Integer ); override;
     public
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPixBufIter1D<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLPixBufIter1D<_TItem_>.GetParen :IGLPixBuf1D;
begin
     Result := _Paren as IGLPixBuf1D;
end;

function TGLPixBufIter1D<_TItem_>.GetPoinsX :Integer;
begin
     Result := Paren.PoinsX;
end;

function TGLPixBufIter1D<_TItem_>.GetCellsX :Integer;
begin
     Result := Paren.CellsX;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPixBuf1D<_TItem_,_TIter_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLPixBuf1D<_TItem_,_TIter_>.GetItemsX :Integer;
begin
     Result := _ItemsX;
end;

procedure TGLPixBuf1D<_TItem_,_TIter_>.SetItemsX( const ItemsX_:Integer );
begin
     _ItemsX := ItemsX_;  MakeCount;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLPixBuf1D<_TItem_,_TIter_>.MakeCount;
begin
     Count := _ItemsX;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPoiPixIter1D<_TItem_>

/////////////////////////////////////////////////////////////////////// アクセス

function TGLPoiPixIter1D<_TItem_>.GetPoins( const X_:Integer ) :_TItem_;
begin
     Result := inherited Items[ ItemsI( X_ ) ];
end;

procedure TGLPoiPixIter1D<_TItem_>.SetPoins( const X_:Integer; const Item_:_TItem_ );
begin
     inherited Items[ ItemsI( X_ ) ] := Item_;
end;

//------------------------------------------------------------------------------

function TGLPoiPixIter1D<_TItem_>.GetPoinsP( const X_:Integer ) :_PItem_;
begin
     Result := inherited ItemsP[ ItemsI( X_ ) ];
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TGLPoiPixIter1D<_TItem_>.ItemsI( const X_:Integer ) :Integer;
begin
     Result := X_;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPoiPix1D<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLPoiPix1D<_TItem_>.GetPoinsX :Integer;
begin
     Result := ItemsX;
end;

procedure TGLPoiPix1D<_TItem_>.SetPoinsX( const PoinsX_:Integer );
begin
     ItemsX := PoinsX_;
end;

//------------------------------------------------------------------------------

function TGLPoiPix1D<_TItem_>.GetCellsX :Integer;
begin
     Result := ItemsX - 1;
end;

procedure TGLPoiPix1D<_TItem_>.SetCellsX( const CellsX_:Integer );
begin
     ItemsX := CellsX_ + 1;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLCelPixIter1D<_TItem_>

/////////////////////////////////////////////////////////////////////// アクセス

function TGLCelPixIter1D<_TItem_>.GetCells( const X_:Integer ) :_TItem_;
begin
     Result := inherited Items[ ItemsI( X_ ) ];
end;

procedure TGLCelPixIter1D<_TItem_>.SetCells( const X_:Integer; const Item_:_TItem_ );
begin
     inherited Items[ ItemsI( X_ ) ] := Item_;
end;

//------------------------------------------------------------------------------

function TGLCelPixIter1D<_TItem_>.GetCellsP( const X_:Integer ) :_PItem_;
begin
     Result := inherited ItemsP[ ItemsI( X_ ) ];
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TGLCelPixIter1D<_TItem_>.ItemsI( const X_:Integer ) :Integer;
begin
     Result := X_;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLCelPix1D<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLCelPix1D<_TItem_>.GetPoinsX :Integer;
begin
     Result := ItemsX + 1;
end;

procedure TGLCelPix1D<_TItem_>.SetPoinsX( const PoinsX_:Integer );
begin
     ItemsX := PoinsX_ - 1;
end;

//------------------------------------------------------------------------------

function TGLCelPix1D<_TItem_>.GetCellsX :Integer;
begin
     Result := ItemsX;
end;

procedure TGLCelPix1D<_TItem_>.SetCellsX( const CellsX_:Integer );
begin
     ItemsX := CellsX_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■