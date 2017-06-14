unit LUX.GPU.OpenGL.Buffer.Elemer;

interface //#################################################################### ■

uses Winapi.OpenGL, Winapi.OpenGLext,
     LUX, LUX.D3, LUX.GPU.OpenGL, LUX.GPU.OpenGL.Buffer;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLElemer<_TYPE_>

     IGLElemer = interface( IGLBuffer )
     ['{BCD91AB4-D6E5-49E1-8670-D4C4ED39AFD3}']
       ///// アクセス
       function GetElemT :GLenum;
       ///// プロパティ
       property ElemT :GLenum read GetElemT;
       ///// メソッド
       procedure Draw;
     end;

     //-------------------------------------------------------------------------

     TGLElemer<_TYPE_:record> = class( TGLBuffer<_TYPE_>, IGLElemer )
     private
     protected
       ///// アクセス
       function GetKind :GLenum; override;
       function GetElemT :GLenum;
     public
       ///// プロパティ
       property ElemT :GLenum read GetElemT;
       ///// メソッド
       procedure Draw;
     end;

     TGLElemer8  = TGLElemer<TByte3D>;
     TGLElemer16 = TGLElemer<TWord3D>;
     TGLElemer32 = TGLElemer<TCardinal3D>;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLElemer<_TYPE_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLElemer<_TYPE_>.GetKind :GLenum;
begin
     Result := GL_ELEMENT_ARRAY_BUFFER;
end;

function TGLElemer<_TYPE_>.GetElemT :GLenum;
begin
     case  SizeOf( _TYPE_ ) of
       3: Result := GL_UNSIGNED_BYTE;
       6: Result := GL_UNSIGNED_SHORT;
      12: Result := GL_UNSIGNED_INT;
     else Assert( False, 'Unkown Type!' );
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLElemer<_TYPE_>.Draw;
begin
     Bind;

       glDrawElements( GL_TRIANGLES, 3{Poin} * _Count, GetElemT, nil );

     Unbind;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■