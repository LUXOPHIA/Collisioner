unit LUX.GPU.OpenGL.Buffer.Unif;

interface //#################################################################### ■

uses Winapi.OpenGL, Winapi.OpenGLext,
     LUX, LUX.GPU.OpenGL.Buffer;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBufferU<_TYPE_>

     IGLBufferU = interface( IGLBuffer )
     ['{923ECB97-7686-4B53-A9FC-AB4365C7CC4B}']
       ///// アクセス
       function GetBindI :GLuint;
       procedure SetBindI( BindI_:GLuint );
       ///// プロパティ
       property BindI :GLuint read GetBindI write SetBindI;
     end;

     //-------------------------------------------------------------------------

     TGLBufferU<_TYPE_:record> = class( TGLBuffer<_TYPE_>, IGLBufferU )
     private
     protected class var
       _Align :GLint;
     protected
       _BindI :GLuint;
       ///// アクセス
       function GetKind :GLenum; override;
       function GetBindI :GLuint;
       procedure SetBindI( BindI_:GLuint );
       function GetStride :GLint; override;
     public
       class constructor Create;
       constructor Create( const Usage_:GLenum );
       ///// プロパティ
       class property Align :GLint read _Align;
       property BindI :GLuint read _BindI write _BindI;
       ///// メソッド
       procedure Use; overload;
       procedure Use( const I_:Integer; const N_:Integer = 1 ); overload;
       procedure Unuse;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBufferU<_TYPE_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLBufferU<_TYPE_>.GetKind :GLenum;
begin
     Result := GL_UNIFORM_BUFFER;
end;

function TGLBufferU<_TYPE_>.GetBindI :GLuint;
begin
     Result := _BindI;
end;

procedure TGLBufferU<_TYPE_>.SetBindI( BindI_:GLuint );
begin
     _BindI := BindI_;
end;

//------------------------------------------------------------------------------

function  TGLBufferU<_TYPE_>.GetStride :GLint;
var
   M :Integer;
begin
     Result := SizeOf( _TYPE_ );

     M := Result mod _Align;

     if M > 0 then Inc( Result, _Align - M );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

class constructor TGLBufferU<_TYPE_>.Create;
begin
     glGetIntegerv( GL_UNIFORM_BUFFER_OFFSET_ALIGNMENT, @_Align );
end;

//------------------------------------------------------------------------------

constructor TGLBufferU<_TYPE_>.Create( const Usage_:GLenum );
begin
     inherited Create( Usage_ );

     _BindI := 0;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLBufferU<_TYPE_>.Use;
begin
     glBindBufferBase( GetKind, _BindI, _ID );
end;

procedure TGLBufferU<_TYPE_>.Use( const I_:Integer; const N_:Integer = 1 );
begin
     glBindBufferRange( GetKind, _BindI, _ID, GetStride * I_, GetStride * N_ );
end;

procedure TGLBufferU<_TYPE_>.Unuse;
begin
     glBindBufferBase( GetKind, _BindI, 0 );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■