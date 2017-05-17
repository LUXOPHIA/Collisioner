unit LUX.GPU.OpenGL.Buffer.Vert;

interface //#################################################################### ■

uses Winapi.OpenGL, Winapi.OpenGLext,
     LUX, LUX.GPU.OpenGL.Buffer;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBufferV<_TYPE_>

     IGLBufferV = interface( IGLBuffer )
     ['{1DDD600E-0FA5-4D07-A280-72B96722D0C7}']
       ///// アクセス
       function GetBindL :GLuint;
       procedure SetBindL( BindL_:GLuint );
       ///// プロパティ
       property BindL :GLuint read GetBindL write SetBindL;
     end;

     //-------------------------------------------------------------------------

     TGLBufferV<_TYPE_:record> = class( TGLBuffer<_TYPE_>, IGLBufferV )
     private
     protected
       ///// アクセス
       function GetKind :GLenum; override;
       class function GetElemT :GLenum; virtual; abstract;
       class function GetElemN :GLint; virtual; abstract;
       function GetBindL :GLuint;
       procedure SetBindL( BindL_:GLuint );
     public
       ///// プロパティ
       property ElemT :GLenum read GetElemT;
       property ElemN :GLint  read GetElemN;
       ///// メソッド
       procedure Use;
       procedure Unuse;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBufferVS<_TYPE_>

     TGLBufferVS<_TYPE_:record> = class( TGLBufferV<_TYPE_> )
     private
     protected
       ///// アクセス
       class function GetElemT :GLenum; override;
       class function GetElemN :GLint; override;
     public
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBufferV<_TYPE_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLBufferV<_TYPE_>.GetKind :GLenum;
begin
     Result := GL_ARRAY_BUFFER;
end;

function TGLBufferV<_TYPE_>.GetBindL :GLuint;
begin
     Result := _BindL;
end;

procedure TGLBufferV<_TYPE_>.SetBindL( BindL_:GLuint );
begin
     _BindL := BindL_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLBufferV<_TYPE_>.Use;
begin
     glEnableVertexAttribArray( _BindL );

     Bind;

       glVertexAttribPointer( _BindL, GetElemN, GetElemT, GL_FALSE, 0, nil );

     Unbind;
end;

procedure TGLBufferV<_TYPE_>.Unuse;
begin
     glDisableVertexAttribArray( _BindL );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBufferVS<_TYPE_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

class function TGLBufferVS<_TYPE_>.GetElemT :GLenum;
begin
     Result := GL_FLOAT;
end;

class function TGLBufferVS<_TYPE_>.GetElemN :GLint;
begin
     Result := SizeOf( _TYPE_ ) div SizeOf( Single );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■