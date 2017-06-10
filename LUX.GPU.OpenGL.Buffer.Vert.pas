unit LUX.GPU.OpenGL.Buffer.Vert;

interface //#################################################################### ■

uses Winapi.OpenGL, Winapi.OpenGLext,
     LUX, LUX.GPU.OpenGL, LUX.GPU.OpenGL.Buffer;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBufferV<_TYPE_>

     IGLBufferV = interface( IGLBuffer )
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
       procedure Use( const BindI_:GLuint );
       procedure Unuse( const BindI_:GLuint );
     end;

     //-------------------------------------------------------------------------

     TGLBufferV<_TYPE_:record> = class( TGLBuffer<_TYPE_>, IGLBufferV )
     private
     protected
       ///// アクセス
       function GetKind :GLenum; override;
       function GetElemT :GLenum; virtual; abstract;
       function GetElemS :Integer; virtual; abstract;
       function GetElemN :GLint; virtual; abstract;
     public
       ///// プロパティ
       property ElemT :GLenum read GetElemT;
       property ElemS :GLint  read GetElemS;
       property ElemN :GLint  read GetElemN;
       ///// メソッド
       procedure Use( const BindI_:GLuint );
       procedure Unuse( const BindI_:GLuint );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBufferVS<_TYPE_>

     TGLBufferVS<_TYPE_:record> = class( TGLBufferV<_TYPE_> )
     private
     protected
       ///// アクセス
       function GetElemT :GLenum; override;
       function GetElemS :Integer; override;
       function GetElemN :GLint; override;
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

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLBufferV<_TYPE_>.Use( const BindI_:GLuint );
begin
     glBindVertexBuffer( BindI_, _ID, 0, GetElemS * GetElemN );
end;

procedure TGLBufferV<_TYPE_>.Unuse( const BindI_:GLuint );
begin
     glBindVertexBuffer( BindI_, 0, 0, 0 );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBufferVS<_TYPE_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLBufferVS<_TYPE_>.GetElemT :GLenum;
begin
     Result := GL_FLOAT;
end;

function TGLBufferVS<_TYPE_>.GetElemS :Integer;
begin
     Result := SizeOf( Single );
end;

function TGLBufferVS<_TYPE_>.GetElemN :GLint;
begin
     Result := SizeOf( _TYPE_ ) div GetElemS;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■