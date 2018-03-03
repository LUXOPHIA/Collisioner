﻿unit LUX.GPU.OpenGL.Atom.Buffer.StoBuf;

interface //#################################################################### ■

uses Winapi.OpenGL, Winapi.OpenGLext,
     LUX,
     LUX.GPU.OpenGL.Atom,
     LUX.GPU.OpenGL.Atom.Buffer;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLStoBuf<_TYPE_>

     IGLStoBuf = interface( IGLBuffer )
     ['{89D4B899-EE43-4FBD-AACB-29F40C86F2ED}']
       ///// メソッド
       procedure Use( const BinP_:GLuint ); overload;
       procedure Use( const BinP_:GLuint; const Offs_:Integer; const Size_:Integer = 1 ); overload;
       procedure Unuse( const BinP_:GLuint ); overload;
     end;

     //-------------------------------------------------------------------------

     TGLStoBuf<_TYPE_:record> = class( TGLBuffer<_TYPE_>, IGLStoBuf )
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

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLStoBuf<_TYPE_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLStoBuf<_TYPE_>.GetKind :GLenum;
begin
     Result := GL_SHADER_STORAGE_BUFFER;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TGLStoBuf<_TYPE_>.InitAlign :GLint;
begin
     Result := 1{Byte};
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLStoBuf<_TYPE_>.Use( const BinP_:GLuint );
begin
     inherited Use;

     glBindBufferBase( GetKind, BinP_, _ID );
end;

procedure TGLStoBuf<_TYPE_>.Use( const BinP_:GLuint; const Offs_:Integer; const Size_:Integer = 1 );
begin
     inherited Use;

     glBindBufferRange( GetKind, BinP_, _ID, _Strid * Offs_, _Strid * Size_ );
end;

procedure TGLStoBuf<_TYPE_>.Unuse( const BinP_:GLuint );
begin
     glBindBufferBase( GetKind, BinP_, 0 );

     inherited Unuse;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■