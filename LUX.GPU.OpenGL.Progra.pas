unit LUX.GPU.OpenGL.Progra;

interface //#################################################################### ■

uses System.SysUtils, System.Classes, System.Generics.Collections,
     Winapi.OpenGL, Winapi.OpenGLext,
     LUX, LUX.GPU.OpenGL, LUX.GPU.OpenGL.Buffer, LUX.GPU.OpenGL.Shader;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLProgram

     TGLProgram = class
     private
     protected
       _ID      :GLuint;
       _Success :Boolean;
       _Error   :TStringList;
       _Frags   :TDictionary<GLuint,String>;
       ///// イベント
       _OnLinked :TProc;
       ///// アクセス
       procedure SetFrags( Sender_:TObject; const Key_:GLuint; Action_:TCollectionNotification );
       ///// メソッド
       function GetState :Boolean;
       function GetError :String;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property ID      :GLuint                     read _ID     ;
       property Success :Boolean                    read _Success;
       property Error   :TStringList                read _Error  ;
       property Frags   :TDictionary<GLuint,String> read _Frags  ;
       ///// イベント
       property OnLinked :TProc read _OnLinked write _OnLinked;
       ///// メソッド
       procedure Attach( const Shader_:TGLShader ); overload;
       procedure Detach( const Shader_:TGLShader );
       procedure Link;
       procedure Use;
       class procedure Unuse;
       procedure Attach( const BufV_:IGLBufferV ); overload;
       procedure Attach( const BufU_:IGLBufferU ); overload;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLProgram

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

procedure TGLProgram.SetFrags( Sender_:TObject; const Key_:GLuint; Action_:TCollectionNotification );
begin
     if Action_ = TCollectionNotification.cnAdded then
     begin
          glBindFragDataLocation( _ID, Key_, PGLchar( AnsiString( _Frags.Items[ Key_ ] ) ) );
     end;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TGLProgram.GetState :Boolean;
var
   S :GLint;
begin
     glGetProgramiv( _ID, GL_LINK_STATUS, @S );

     Result := ( S = GL_TRUE );
end;

function TGLProgram.GetError :String;
var
   N :GLint;
   Cs :TArray<GLchar>;
   CsN :GLsizei;
begin
     glGetProgramiv( _ID, GL_INFO_LOG_LENGTH, @N );

     SetLength( Cs, N );

     glGetProgramInfoLog( _ID, N, @CsN, PGLchar( Cs ) );

     SetString( Result, PGLchar( Cs ), CsN );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLProgram.Create;
begin
     inherited Create;

     _Error := TStringList.Create;
     _Frags := TDictionary<GLuint,String>.Create;

     _Frags.OnKeyNotify := SetFrags;

     _ID      := glCreateProgram;
     _Success := False;

     _OnLinked := procedure begin end;
end;

destructor TGLProgram.Destroy;
begin
     glDeleteProgram( _ID );

     _Error.DisposeOf;
     _Frags.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLProgram.Attach( const Shader_:TGLShader );
begin
     glAttachShader( _ID, Shader_.ID );
end;

procedure TGLProgram.Detach( const Shader_:TGLShader );
begin
     glDetachShader( _ID, Shader_.ID );
end;

//------------------------------------------------------------------------------

procedure TGLProgram.Link;
begin
     glLinkProgram( _ID );

     _Success := GetState;

     _Error.Text := GetError;

     _OnLinked;
end;

//------------------------------------------------------------------------------

procedure TGLProgram.Use;
begin
     glUseProgram( _ID );

end;

class procedure TGLProgram.Unuse;
begin
     glUseProgram( 0 );
end;

//------------------------------------------------------------------------------

procedure TGLProgram.Attach( const BufV_:IGLBufferV );
begin
     BufV_.BindL := glGetAttribLocation( _ID, PAnsiChar( AnsiString( BufV_.Name ) ) );
end;

procedure TGLProgram.Attach( const BufU_:IGLBufferU );
begin
     BufU_.BindL := glGetUniformBlockIndex( _ID, PAnsiChar( AnsiString( BufU_.Name ) ) );

     glUniformBlockBinding( _ID, BufU_.BindL, BufU_.BindI );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■