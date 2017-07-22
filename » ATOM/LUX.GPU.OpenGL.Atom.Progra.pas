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
       function GetVerters :TGLPorterV;
       function GetUnifors :TGLPorterU;
       function GetImagers :TGLPorterI;
     {public}
       ///// プロパティ
       property Framers :TGLPorterF read GetFramers;
       property Verters :TGLPorterV read GetVerters;
       property Unifors :TGLPorterU read GetUnifors;
       property Imagers :TGLPorterI read GetImagers;
     end;

     //-------------------------------------------------------------------------

     TGLProgra = class( TGLAtomer, IGLProgra )
     private
     protected
       _Status  :Boolean;
       _Errors  :TStringList;
       _Framers :TGLPorterF;
       _Verters :TGLPorterV;
       _Unifors :TGLPorterU;
       _Imagers :TGLPorterI;
       ///// イベント
       _OnLinked :TProc;
       ///// アクセス
       function GetStatus :Boolean;
       function GetErrors :TStringList;
       function GetFramers :TGLPorterF;
       function GetVerters :TGLPorterV;
       function GetUnifors :TGLPorterU;
       function GetImagers :TGLPorterI;
       ///// イベント
       function GetOnLinked :TProc;
       procedure SetOnLinked( const OnLinked_:TProc );
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
       property Verters :TGLPorterV  read GetVerters;
       property Unifors :TGLPorterU  read GetUnifors;
       property Imagers :TGLPorterI  read GetImagers;
       ///// イベント
       property OnLinked :TProc read GetOnLinked write SetOnLinked;
       ///// メソッド
       function glGetVertLoca( const Name_:String ) :GLuint;
       function glGetBlocLoca( const Name_:String ) :GLuint;
       function glGetUnifLoca( const Name_:String ) :GLuint;
       procedure Attach( const Shader_:IGLShader );
       procedure Detach( const Shader_:IGLShader );
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

function TGLProgra.GetVerters :TGLPorterV;
begin
     Result := _Verters;
end;

function TGLProgra.GetUnifors :TGLPorterU;
begin
     Result := _Unifors;
end;

function TGLProgra.GetImagers :TGLPorterI;
begin
     Result := _Imagers;
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
     _Verters := TGLPorterV.Create( Self as IGLProgra );
     _Unifors := TGLPorterU.Create( Self as IGLProgra );
     _Imagers := TGLPorterI.Create( Self as IGLProgra );

     _ID     := glCreateProgram;
     _Status := False;

     _OnLinked := nil;
end;

destructor TGLProgra.Destroy;
begin
     glDeleteProgram( _ID );

     _Framers.DisposeOf;
     _Verters.DisposeOf;
     _Unifors.DisposeOf;
     _Imagers.DisposeOf;

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

//------------------------------------------------------------------------------

procedure TGLProgra.Attach( const Shader_:IGLShader );
begin
     glAttachShader( _ID, Shader_.ID );

     Shader_.Progra := Self as IGLProgra;
end;

procedure TGLProgra.Detach( const Shader_:IGLShader );
begin
     glDetachShader( _ID, Shader_.ID );

     Shader_.Progra := nil;
end;

//------------------------------------------------------------------------------

procedure TGLProgra.Link;
begin
     glLinkProgram( _ID );

     _Status      := glGetStatus;
     _Errors.Text := glGetErrors;

     _Verters.AddPorts;
     _Unifors.AddPorts;
     _Imagers.AddPorts;

     if Assigned( _OnLinked ) then _OnLinked;
end;

//------------------------------------------------------------------------------

procedure TGLProgra.Use;
begin
     glUseProgram( _ID );

     _Verters.Use;
     _Unifors.Use;
     _Imagers.Use;
end;

procedure TGLProgra.Unuse;
begin
     _Verters.Unuse;
     _Unifors.Unuse;
     _Imagers.Unuse;

     glUseProgram( 0 );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■