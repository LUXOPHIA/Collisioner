unit LUX.GPU.OpenGL.Buffer.Verter;

interface //#################################################################### ■

uses Winapi.OpenGL, Winapi.OpenGLext,
     LUX, LUX.GPU.OpenGL, LUX.GPU.OpenGL.Buffer;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLVerter<_TYPE_>

     IGLVerter = interface( IGLBuffer )
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

     TGLVerter<_TYPE_:record> = class( TGLBuffer<_TYPE_>, IGLVerter )
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
       procedure Use( const BinP_:GLuint );
       procedure Unuse( const BinP_:GLuint );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLVerterS<_TYPE_>

     TGLVerterS<_TYPE_:record> = class( TGLVerter<_TYPE_> )
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

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLVerter<_TYPE_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLVerter<_TYPE_>.GetKind :GLenum;
begin
     Result := GL_ARRAY_BUFFER;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLVerter<_TYPE_>.Use( const BinP_:GLuint );
begin
     glBindVertexBuffer( BinP_, _ID, 0, GetElemS * GetElemN );
end;

procedure TGLVerter<_TYPE_>.Unuse( const BinP_:GLuint );
begin
     glBindVertexBuffer( BinP_, 0, 0, 0 );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLVerterS<_TYPE_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLVerterS<_TYPE_>.GetElemT :GLenum;
begin
     Result := GL_FLOAT;
end;

function TGLVerterS<_TYPE_>.GetElemS :Integer;
begin
     Result := SizeOf( Single );
end;

function TGLVerterS<_TYPE_>.GetElemN :GLint;
begin
     Result := SizeOf( _TYPE_ ) div GetElemS;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■