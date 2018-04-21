unit LUX.GPU.OpenGL.Atom.Buffer.UniBuf;

interface //#################################################################### ■

uses Winapi.OpenGL, Winapi.OpenGLext,
     LUX,
     LUX.GPU.OpenGL.Atom,
     LUX.GPU.OpenGL.Atom.Buffer;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLUniBuf<_TItem_>

     IGLUniBuf = interface( IGLBuffer )
     ['{923ECB97-7686-4B53-A9FC-AB4365C7CC4B}']
       ///// メソッド
       procedure Use( const BinP_:GLuint ); overload;
       procedure Use( const BinP_:GLuint; const Offs_:Integer; const Size_:Integer = 1 ); overload;
       procedure Unuse( const BinP_:GLuint ); overload;
     end;

     //-------------------------------------------------------------------------

     TGLUniBuf<_TItem_:record> = class( TGLBuffer<_TItem_>, IGLUniBuf )
     private
     protected
       ///// アクセス
       function GetKind :GLenum; override;
       ///// メソッド
       function InitAlign :GLint; override;
     public
       ///// メソッド
       procedure Use( const BinP_:GLuint ); reintroduce; overload;
       procedure Use( const BinP_:GLuint; const Offs_:Integer; const Size_:Integer = 1 ); reintroduce; overload;
       procedure Unuse( const BinP_:GLuint ); reintroduce; overload;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLUniBuf<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLUniBuf<_TItem_>.GetKind :GLenum;
begin
     Result := GL_UNIFORM_BUFFER;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TGLUniBuf<_TItem_>.InitAlign :GLint;
begin
     //glGetIntegerv( GL_UNIFORM_BUFFER_OFFSET_ALIGNMENT, @Result );

     Result := 1{Byte};
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLUniBuf<_TItem_>.Use( const BinP_:GLuint );
begin
     inherited Use;

     glBindBufferBase( GetKind, BinP_, _ID );
end;

procedure TGLUniBuf<_TItem_>.Use( const BinP_:GLuint; const Offs_:Integer; const Size_:Integer = 1 );
begin
     inherited Use;

     glBindBufferRange( GetKind, BinP_, _ID, _Strid * Offs_, _Strid * Size_ );
end;

procedure TGLUniBuf<_TItem_>.Unuse( const BinP_:GLuint );
begin
     glBindBufferBase( GetKind, BinP_, 0 );

     inherited Unuse;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■