unit LUX.GPU.OpenGL.Buffer.Elemer;

interface //#################################################################### ■

uses Winapi.OpenGL, Winapi.OpenGLext,
     LUX, LUX.D2, LUX.D3, LUX.GPU.OpenGL, LUX.GPU.OpenGL.Buffer;

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
       function GetElemN :GLint; virtual; abstract;
       function GetElemT :GLenum; virtual; abstract;
     public
       ///// プロパティ
       property ElemT :GLenum read GetElemT;
       ///// メソッド
       procedure Draw; virtual; abstract;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLElemerTria<_TYPE_>

     IGLElemerTria = interface( IGLBuffer )
     ['{8D7AA8F0-FDEF-4B6C-A537-D861D07CB6D4}']
     end;

     //-------------------------------------------------------------------------

     TGLElemerTria<_TYPE_:record> = class( TGLElemer<_TYPE_>, IGLElemerTria )
     private
     protected
       ///// アクセス
       function GetElemN :GLint; override;
       function GetElemT :GLenum; override;
     public
       ///// メソッド
       procedure Draw; override;
     end;

     TGLElemerTria8  = TGLElemerTria<TByte3D>;
     TGLElemerTria16 = TGLElemerTria<TWord3D>;
     TGLElemerTria32 = TGLElemerTria<TCardinal3D>;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLElemerLine<_TYPE_>

     IGLElemerLine = interface( IGLBuffer )
     ['{7B63D84E-9B99-4661-94B5-0E508A59810A}']
     end;

     //-------------------------------------------------------------------------

     TGLElemerLine<_TYPE_:record> = class( TGLElemer<_TYPE_>, IGLElemerLine )
     private
     protected
       ///// アクセス
       function GetElemN :GLint; override;
       function GetElemT :GLenum; override;
     public
       ///// メソッド
       procedure Draw; override;
     end;

     TGLElemerLine8  = TGLElemerLine<TByte2D>;
     TGLElemerLine16 = TGLElemerLine<TWord2D>;
     TGLElemerLine32 = TGLElemerLine<TCardinal2D>;

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

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLElemerTria<_TYPE_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLElemerTria<_TYPE_>.GetElemN :GLint;
begin
     Result := 3;
end;

function TGLElemerTria<_TYPE_>.GetElemT :GLenum;
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

procedure TGLElemerTria<_TYPE_>.Draw;
begin
     Bind;

       glDrawElements( GL_TRIANGLES, GetElemN * _Count, GetElemT, nil );

     Unbind;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLElemerLine<_TYPE_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLElemerLine<_TYPE_>.GetElemN :GLint;
begin
     Result := 2;
end;

function TGLElemerLine<_TYPE_>.GetElemT :GLenum;
begin
     case  SizeOf( _TYPE_ ) of
       2: Result := GL_UNSIGNED_BYTE;
       4: Result := GL_UNSIGNED_SHORT;
       8: Result := GL_UNSIGNED_INT;
     else Assert( False, 'Unkown Type!' );
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLElemerLine<_TYPE_>.Draw;
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