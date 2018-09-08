unit LUX.GPU.OpenGL.Atom.Buffer.PixBuf;

interface //#################################################################### ■

uses System.Classes,
     Winapi.OpenGL, Winapi.OpenGLext,
     LUX,
     LUX.GPU.OpenGL.Atom,
     LUX.GPU.OpenGL.Atom.Buffer;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPixBufIter<_TItem_>

     TGLPixBufIter<_TItem_:record> = class( TGLBufferData<_TItem_> )
     public type
       _PItem_ = TGLBufferData<_TItem_>._PItem_;
     protected
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPixBuf<_TItem_,_TIter_>

     IGLPixBuf = interface( IGLBuffer )
     ['{60D83A80-BD20-414E-8E71-5B96473F13EC}']
     {protected}
       ///// アクセス
       function GetPoinsN :Integer;
       function GetCellsN :Integer;
     {public}
       ///// メソッド
       procedure BindRead;
       procedure UnbindRead;
       procedure BindWrite;
       procedure UnbindWrite;
     end;

     //-------------------------------------------------------------------------

     TGLPixBuf<_TItem_:record;
               _TIter_:TGLPixBufIter<_TItem_>,constructor> = class( TGLBuffer<_TItem_,_TIter_>, IGLPixBuf )
     private
     protected
       ///// アクセス
       function GetKind :GLenum; override;
       function GetElemsN :Integer; virtual; abstract;
       function GetPoinsN :Integer; virtual; abstract;
       function GetCellsN :Integer; virtual; abstract;
       ///// メソッド
       function InitAlign :GLint; override;
       procedure MakeBuffer; override;
     public
       ///// プロパティ
       property ElemsN :Integer read GetElemsN;
       property PoinsN :Integer read GetPoinsN;
       property CellsN :Integer read GetCellsN;
       ///// メソッド
       procedure BindRead;
       procedure UnbindRead;
       procedure BindWrite;
       procedure UnbindWrite;
       procedure Read( const Stream_:TStream );
       procedure Write( const Stream_:TStream );
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPixBufIter<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPixBuf<_TItem_,_TIter_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLPixBuf<_TItem_,_TIter_>.GetKind :GLenum;
begin
     Result := GL_ARRAY_BUFFER;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TGLPixBuf<_TItem_,_TIter_>.InitAlign :GLint;
begin
     Result := 1{Byte};
end;

//------------------------------------------------------------------------------

procedure TGLPixBuf<_TItem_,_TIter_>.MakeBuffer;
begin
     _Count := ElemsN;

     BindRead;

       glBufferData( GL_PIXEL_UNPACK_BUFFER, SizeOf( _TItem_ ) * _Count, nil, _Usage );

     UnbindRead;

     if Assigned( _OnUnmap ) then _OnUnmap( Self );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLPixBuf<_TItem_,_TIter_>.BindRead;
begin
     glBindBuffer( GL_PIXEL_UNPACK_BUFFER, _ID );
end;

procedure TGLPixBuf<_TItem_,_TIter_>.UnbindRead;
begin
     glBindBuffer( GL_PIXEL_UNPACK_BUFFER, 0 );
end;

//------------------------------------------------------------------------------

procedure TGLPixBuf<_TItem_,_TIter_>.BindWrite;
begin
     glBindBuffer( GL_PIXEL_PACK_BUFFER, _ID );
end;

procedure TGLPixBuf<_TItem_,_TIter_>.UnbindWrite;
begin
     glBindBuffer( GL_PIXEL_PACK_BUFFER, 0 );
end;

//------------------------------------------------------------------------------

procedure TGLPixBuf<_TItem_,_TIter_>.Read( const Stream_:TStream );
var
   D :TGLPixBufIter<_TItem_>;
begin
     D := Map( GL_READ_ONLY );

     Stream_.Read( D.Start^, SizeOf( _TItem_ ) * ElemsN );

     D.DisposeOf;
end;

procedure TGLPixBuf<_TItem_,_TIter_>.Write( const Stream_:TStream );
var
   D :TGLPixBufIter<_TItem_>;
begin
     D := Map( GL_READ_ONLY );

     Stream_.Write( D.Start^, SizeOf( _TItem_ ) * ElemsN );

     D.DisposeOf;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■