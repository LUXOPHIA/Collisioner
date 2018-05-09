unit LUX.GPU.OpenGL.Atom.Buffer.EleBuf;

interface //#################################################################### ■

uses Winapi.OpenGL, Winapi.OpenGLext,
     LUX, LUX.D2, LUX.D3,
     LUX.GPU.OpenGL.Atom,
     LUX.GPU.OpenGL.Atom.Buffer;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLEleBuf<_TItem_>

     IGLEleBuf = interface( IGLBuffer )
     ['{BCD91AB4-D6E5-49E1-8670-D4C4ED39AFD3}']
       ///// アクセス
       function GetElemT :GLenum;
       ///// プロパティ
       property ElemT :GLenum read GetElemT;
       ///// メソッド
       procedure Draw;
     end;

     //-------------------------------------------------------------------------

     TGLEleBuf<_TItem_:record> = class( TGLBuffer<_TItem_,TGLBufferData<_TItem_>>, IGLEleBuf )
     private
     protected
       ///// アクセス
       function GetKind :GLenum; override;
       function GetElemN :GLint; virtual; abstract;
       function GetElemT :GLenum; virtual; abstract;
     public
       ///// プロパティ
       property ElemT :GLenum read GetElemT;
       ///// メソッド
       procedure Draw; virtual; abstract;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLEleBufFace<_TItem_>

     IGLEleBufFace = interface( IGLBuffer )
     ['{8D7AA8F0-FDEF-4B6C-A537-D861D07CB6D4}']
     end;

     //-------------------------------------------------------------------------

     TGLEleBufFace<_TItem_:record> = class( TGLEleBuf<_TItem_>, IGLEleBufFace )
     private
     protected
       ///// アクセス
       function GetElemN :GLint; override;
       function GetElemT :GLenum; override;
     public
       ///// メソッド
       procedure Draw; override;
     end;

     TGLEleBufFace8  = TGLEleBufFace<TByte3D>;
     TGLEleBufFace16 = TGLEleBufFace<TWord3D>;
     TGLEleBufFace32 = TGLEleBufFace<TCardinal3D>;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLEleBufLine<_TItem_>

     IGLEleBufLine = interface( IGLBuffer )
     ['{7B63D84E-9B99-4661-94B5-0E508A59810A}']
     end;

     //-------------------------------------------------------------------------

     TGLEleBufLine<_TItem_:record> = class( TGLEleBuf<_TItem_>, IGLEleBufLine )
     private
     protected
       ///// アクセス
       function GetElemN :GLint; override;
       function GetElemT :GLenum; override;
     public
       ///// メソッド
       procedure Draw; override;
     end;

     TGLEleBufLine8  = TGLEleBufLine<TByte2D>;
     TGLEleBufLine16 = TGLEleBufLine<TWord2D>;
     TGLEleBufLine32 = TGLEleBufLine<TCardinal2D>;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLEleBuf<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLEleBuf<_TItem_>.GetKind :GLenum;
begin
     Result := GL_ELEMENT_ARRAY_BUFFER;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLEleBufFace<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLEleBufFace<_TItem_>.GetElemN :GLint;
begin
     Result := 3;
end;

function TGLEleBufFace<_TItem_>.GetElemT :GLenum;
begin
     case  SizeOf( _TItem_ ) of
       3: Result := GL_UNSIGNED_BYTE;
       6: Result := GL_UNSIGNED_SHORT;
      12: Result := GL_UNSIGNED_INT;
     else Assert( False, 'Unkown Type!' );
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLEleBufFace<_TItem_>.Draw;
begin
     Bind;

       glDrawElements( GL_TRIANGLES, GetElemN * _Count, GetElemT, nil );

     Unbind;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLEleBufLine<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLEleBufLine<_TItem_>.GetElemN :GLint;
begin
     Result := 2;
end;

function TGLEleBufLine<_TItem_>.GetElemT :GLenum;
begin
     case  SizeOf( _TItem_ ) of
       2: Result := GL_UNSIGNED_BYTE;
       4: Result := GL_UNSIGNED_SHORT;
       8: Result := GL_UNSIGNED_INT;
     else Assert( False, 'Unkown Type!' );
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLEleBufLine<_TItem_>.Draw;
begin
     Bind;

       glDrawElements( GL_LINES, GetElemN * _Count, GetElemT, nil );

     Unbind;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■