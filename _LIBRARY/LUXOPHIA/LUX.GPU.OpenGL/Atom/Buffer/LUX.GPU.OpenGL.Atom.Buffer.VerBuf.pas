unit LUX.GPU.OpenGL.Atom.Buffer.VerBuf;

interface //#################################################################### ■

uses Winapi.OpenGL, Winapi.OpenGLext,
     LUX,
     LUX.GPU.OpenGL.Atom,
     LUX.GPU.OpenGL.Atom.Buffer;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLVerBuf<_TItem_>

     IGLVerBuf = interface( IGLBuffer )
     ['{1DDD600E-0FA5-4D07-A280-72B96722D0C7}']
       ///// アクセス
       function GetElemT :GLenum;
       function GetElemS :Integer;
       function GetElemN :GLint;
       ///// プロパティ
       property ElemT :GLenum read GetElemT;
       property ElemS :GLint  read GetElemS;
       property ElemN :GLint  read GetElemN;
       ///// メソッド
       procedure Use( const BinP_:GLuint );
       procedure Unuse( const BinP_:GLuint );
     end;

     //-------------------------------------------------------------------------

     TGLVerBuf<_TItem_:record> = class( TGLBuffer<_TItem_,TGLBufferData<_TItem_>>, IGLVerBuf )
     private
     protected
       ///// アクセス
       function GetKind :GLenum; override;
       function GetElemT :GLenum; virtual; abstract;
       function GetElemS :Integer; virtual; abstract;
       function GetElemN :GLint;
     public
       ///// プロパティ
       property ElemT :GLenum read GetElemT;
       property ElemS :GLint  read GetElemS;
       property ElemN :GLint  read GetElemN;
       ///// メソッド
       procedure Use( const BinP_:GLuint );
       procedure Unuse( const BinP_:GLuint );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLVerBufI<_TItem_>

     TGLVerBufI<_TItem_:record> = class( TGLVerBuf<_TItem_> )
     private
     protected
       ///// アクセス
       function GetElemT :GLenum; override;
       function GetElemS :Integer; override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLVerBufS<_TItem_>

     TGLVerBufS<_TItem_:record> = class( TGLVerBuf<_TItem_> )
     private
     protected
       ///// アクセス
       function GetElemT :GLenum; override;
       function GetElemS :Integer; override;
     public
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLVerBuf<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLVerBuf<_TItem_>.GetKind :GLenum;
begin
     Result := GL_ARRAY_BUFFER;
end;

function TGLVerBuf<_TItem_>.GetElemN :GLint;
begin
     Result := SizeOf( _TItem_ ) div GetElemS;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLVerBuf<_TItem_>.Use( const BinP_:GLuint );
begin
     glBindVertexBuffer( BinP_, _ID, 0, GetElemS * GetElemN );
end;

procedure TGLVerBuf<_TItem_>.Unuse( const BinP_:GLuint );
begin
     glBindVertexBuffer( BinP_, 0, 0, 0 );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLVerBufI<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLVerBufI<_TItem_>.GetElemT :GLenum;
begin
     Result := GL_INT;
end;

function TGLVerBufI<_TItem_>.GetElemS :Integer;
begin
     Result := SizeOf( Integer );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLVerBufS<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLVerBufS<_TItem_>.GetElemT :GLenum;
begin
     Result := GL_FLOAT;
end;

function TGLVerBufS<_TItem_>.GetElemS :Integer;
begin
     Result := SizeOf( Single );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■