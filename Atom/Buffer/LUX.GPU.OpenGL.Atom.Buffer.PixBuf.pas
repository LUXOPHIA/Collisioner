unit LUX.GPU.OpenGL.Atom.Buffer.PixBuf;

interface //#################################################################### ■

uses Winapi.OpenGL, Winapi.OpenGLext,
     LUX,
     LUX.GPU.OpenGL.Atom,
     LUX.GPU.OpenGL.Atom.Buffer,
     LUX.GPU.OpenGL.Atom.Imager;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPixBuf<_TItem_>

     IGLPixBuf = interface( IGLBuffer )
     ['{60D83A80-BD20-414E-8E71-5B96473F13EC}']
     {protected}
     {public}
       ///// メソッド
       procedure BindRead;
       procedure UnbindRead;
       procedure BindWrite;
       procedure UnbindWrite;
       procedure CopyFrom( const Imager_:IGLImager );
       procedure CopyTo( const Imager_:IGLImager );
     end;

     //-------------------------------------------------------------------------

     TGLPixBuf<_TItem_:record> = class( TGLBuffer<_TItem_>, IGLPixBuf )
     private
     protected
       ///// アクセス
       function GetKind :GLenum; override;
       procedure SetCount( const Count_:Integer ); override;
       ///// メソッド
       function InitAlign :GLint; override;
     public
       ///// メソッド
       procedure BindRead;
       procedure UnbindRead;
       procedure BindWrite;
       procedure UnbindWrite;
       procedure CopyFrom( const Imager_:IGLImager );
       procedure CopyTo( const Imager_:IGLImager );
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPixBuf<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLPixBuf<_TItem_>.GetKind :GLenum;
begin
     Result := GL_ARRAY_BUFFER;
end;

//------------------------------------------------------------------------------

procedure TGLPixBuf<_TItem_>.SetCount( const Count_:Integer );
begin
     inherited;

     BindRead;

       glBufferData( GL_PIXEL_UNPACK_BUFFER_ARB, SizeOf( _TItem_ ) * _Count, nil, _Usage );

     UnbindRead;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TGLPixBuf<_TItem_>.InitAlign :GLint;
begin
     Result := 1{Byte};
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLPixBuf<_TItem_>.BindRead;
begin
     glBindBuffer( GL_PIXEL_UNPACK_BUFFER_ARB, _ID );
end;

procedure TGLPixBuf<_TItem_>.UnbindRead;
begin
     glBindBuffer( GL_PIXEL_UNPACK_BUFFER_ARB, 0 );
end;

//------------------------------------------------------------------------------

procedure TGLPixBuf<_TItem_>.BindWrite;
begin
     glBindBuffer( GL_PIXEL_PACK_BUFFER, _ID );
end;

procedure TGLPixBuf<_TItem_>.UnbindWrite;
begin
     glBindBuffer( GL_PIXEL_PACK_BUFFER, 0 );
end;

//------------------------------------------------------------------------------

procedure TGLPixBuf<_TItem_>.CopyFrom( const Imager_:IGLImager );
begin
     BindWrite;

       Imager_.RecePixBuf;

     UnbindWrite;
end;

procedure TGLPixBuf<_TItem_>.CopyTo( const Imager_:IGLImager );
begin
     BindRead;

       Imager_.SendPixBuf;

     UnbindRead;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■