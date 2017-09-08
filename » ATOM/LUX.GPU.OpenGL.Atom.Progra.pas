unit LUX.GPU.OpenGL.Atom.Progra;

interface //#################################################################### ■

uses System.SysUtils, System.Classes,
     Winapi.OpenGL, Winapi.OpenGLext,
     LUX,
     LUX.GPU.OpenGL.Atom,
     LUX.GPU.OpenGL.Atom.Porter;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLProgra

     IGLProgra = interface( LUX.GPU.OpenGL.Atom.IGLProgra )
     ['{8EB00198-A04B-4632-8B23-1DF1B171A75F}']
     {protected}
       ///// アクセス
       function GetFramers :TGLPorterF;
     {public}
       ///// プロパティ
       property Framers :TGLPorterF read GetFramers;
     end;

     //-------------------------------------------------------------------------

     TGLProgra = class( TGLAtomer, IGLProgra )
     private
     protected
       _Status  :Boolean;
       _Errors  :TStringList;
       _Framers :TGLPorterF;
       ///// イベント
       _OnLinked :TProc;
       ///// アクセス
       function GetStatus :Boolean;
       function GetErrors :TStringList;
       function GetFramers :TGLPorterF;
       ///// イベント
       function GetOnLinked :TProc;
       procedure SetOnLinked( const OnLinked_:TProc );
       procedure DoOnLinked; virtual;
       ///// メソッド
       function glGetStatus :Boolean;
       function glGetErrors :String;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property Status  :Boolean     read GetStatus ;
       property Errors  :TStringList read GetErrors ;
       property Framers :TGLPorterF  read GetFramers;
       ///// イベント
       property OnLinked :TProc read GetOnLinked write SetOnLinked;
       ///// メソッド
       function glGetVertLoca( const Name_:String ) :GLuint;
       function glGetBlocLoca( const Name_:String ) :GLuint;
       function glGetUnifLoca( const Name_:String ) :GLuint;
	   function GetProgramResourceIndex( const Kind_:GLenum; const Name_:String ) :GLuint;
       procedure BindFragDataLocation( const BinP_:GLuint; const Name_:String );
       procedure Attach( const Shader_:IGLShader ); virtual;
       procedure Detach( const Shader_:IGLShader ); virtual;
       procedure Link;
       procedure Use; virtual;
       procedure Unuse; virtual;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLProgra

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLProgra.GetStatus :Boolean;
begin
     Result := _Status;
end;

function TGLProgra.GetErrors :TStringList;
begin
     Result := _Errors;
end;

//------------------------------------------------------------------------------

function TGLProgra.GetFramers :TGLPorterF;
begin
     Result := _Framers;
end;

/////////////////////////////////////////////////////////////////////// イベント

function TGLProgra.GetOnLinked :TProc;
begin
     Result := _OnLinked;
end;

procedure TGLProgra.SetOnLinked( const OnLinked_:TProc );
begin
     _OnLinked := OnLinked_;
end;

procedure TGLProgra.DoOnLinked;
begin
     if Assigned( _OnLinked ) then _OnLinked;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TGLProgra.glGetStatus :Boolean;
var
   S :GLint;
begin
     glGetProgramiv( _ID, GL_LINK_STATUS, @S );

     Result := ( S = GL_TRUE );
end;

function TGLProgra.glGetErrors :String;
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

constructor TGLProgra.Create;
begin
     inherited Create;

     _Errors := TStringList.Create;

     _Framers := TGLPorterF.Create( Self as IGLProgra );

     _ID     := glCreateProgram;
     _Status := False;

     _OnLinked := nil;
end;

destructor TGLProgra.Destroy;
begin
     glDeleteProgram( _ID );

     _Framers.DisposeOf;

     _Errors.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TGLProgra.glGetVertLoca( const Name_:String ) :GLuint;
begin
     Result := glGetAttribLocation( _ID, PAnsiChar( AnsiString( Name_ ) ) );
end;

function TGLProgra.glGetBlocLoca( const Name_:String ) :GLuint;
begin
     Result := glGetUniformBlockIndex( _ID, PAnsiChar( AnsiString( Name_ ) ) );
end;

function TGLProgra.glGetUnifLoca( const Name_:String ) :GLuint;
begin
     Result := glGetUniformLocation( _ID, PAnsiChar( AnsiString( Name_ ) ) );
end;

function TGLProgra.GetProgramResourceIndex( const Kind_:GLenum; const Name_:String ) :GLuint;
begin
     Result := glGetProgramResourceIndex( _ID, Kind_, PAnsiChar( AnsiString( Name_ ) ) );
end;

procedure TGLProgra.BindFragDataLocation( const BinP_:GLuint; const Name_:String );
begin
     glBindFragDataLocation( _ID, BinP_, PGLchar( AnsiString( Name_ ) ) );
end;

//------------------------------------------------------------------------------

procedure TGLProgra.Attach( const Shader_:IGLShader );
begin
     glAttachShader( _ID, Shader_.ID );
end;

procedure TGLProgra.Detach( const Shader_:IGLShader );
begin
     glDetachShader( _ID, Shader_.ID );
end;

//------------------------------------------------------------------------------

procedure TGLProgra.Link;
begin
     glLinkProgram( _ID );

     _Status      := glGetStatus;
     _Errors.Text := glGetErrors;

     DoOnLinked;
end;

//------------------------------------------------------------------------------

procedure TGLProgra.Use;
begin
     glUseProgram( _ID );
end;

procedure TGLProgra.Unuse;
begin
     glUseProgram( 0 );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■