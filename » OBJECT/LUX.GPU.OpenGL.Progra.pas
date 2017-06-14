unit LUX.GPU.OpenGL.Progra;

interface //#################################################################### ■

uses System.SysUtils, System.Classes, System.Generics.Collections,
     Winapi.OpenGL, Winapi.OpenGLext,
     LUX, LUX.GPU.OpenGL, LUX.GPU.OpenGL.Shader;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     TGLProgra = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPortS

     TGLPortS = record
     private
     public
       Shad :IGLShader;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPortF

     TGLPortF = record
     private
     public
       Name :String;
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPorts<_TPort_>

     TGLPorts<_TPort_:record> = class( TDictionary<GLuint,_TPort_> )
     private
     protected
       _Progra :TGLProgra;
       ///// メソッド
       procedure AddPort( const BinP_:GLuint; const Port_:_TPort_ ); virtual; abstract;
       procedure DelPort( const BinP_:GLuint; const Port_:_TPort_ ); virtual; abstract;
     public
       constructor Create( const Progra_:TGLProgra );
       ///// プロパティ
       property Progra :TGLProgra read _Progra;
       ///// メソッド
       procedure Add( const BindI_:GLuint; const Port_:_TPort_ );
       procedure Remove( const BindI_:GLuint );
       procedure Del( const BindI_:GLuint );
       procedure AddPorts;
       procedure DelPorts;
       procedure Use; virtual;
       procedure Unuse; virtual;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPortsS

     TGLPortsS = class( TGLPorts<TGLPortS> )
     private
     protected
       ///// メソッド
       procedure AddPort( const BinP_:GLuint; const Port_:TGLPortS ); override;
       procedure DelPort( const BinP_:GLuint; const Port_:TGLPortS ); override;
     public
       ///// メソッド
       procedure Add( const Shad_:IGLShader );
       procedure Del( const Shad_:IGLShader );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPortsF

     TGLPortsF = class( TGLPorts<TGLPortF> )
     private
     protected
       ///// メソッド
       procedure AddPort( const BinP_:GLuint; const Port_:TGLPortF ); override;
       procedure DelPort( const BinP_:GLuint; const Port_:TGLPortF ); override;
     public
       ///// メソッド
       procedure Add( const BinP_:GLuint; const Name_:String );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLProgra

     IGLProgra = interface( IGLObject )
     ['{0B2FDEDE-30D3-439B-AC76-E61F9E028CD0}']
     {protected}
       ///// アクセス
       function GetStatus :Boolean;
       function GetErrors :TStringList;
       function GetShaders :TGLPortsS;
       function GetFramers :TGLPortsF;
       ///// イベント
       function GetOnLinked :TProc;
       procedure SetOnLinked( const OnLinked_:TProc );
     {public}
       ///// プロパティ
       property Status  :Boolean     read GetStatus ;
       property Errors  :TStringList read GetErrors ;
       property Shaders :TGLPortsS   read GetShaders;
       property Framers :TGLPortsF   read GetFramers;
       ///// イベント
       property OnLinked :TProc read GetOnLinked write SetOnLinked;
       ///// メソッド
       procedure Attach( const Shader_:IGLShader );
       procedure Detach( const Shader_:IGLShader );
       procedure Link;
       procedure Use;
       procedure Unuse;
     end;

     //-------------------------------------------------------------------------

     TGLProgra = class( TGLObject, IGLProgra )
     private
     protected
       _Status  :Boolean;
       _Errors  :TStringList;
       _Shaders :TGLPortsS;
       _Framers :TGLPortsF;
       ///// イベント
       _OnLinked :TProc;
       ///// アクセス
       function GetStatus :Boolean;
       function GetErrors :TStringList;
       function GetShaders :TGLPortsS;
       function GetFramers :TGLPortsF;
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
       property Shaders :TGLPortsS   read GetShaders;
       property Framers :TGLPortsF   read GetFramers;
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

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPortS

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPortF

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPorts<_TPort_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLPorts<_TPort_>.Create( const Progra_:TGLProgra );
begin
     inherited Create;

     _Progra := Progra_;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLPorts<_TPort_>.Add( const BindI_:GLuint; const Port_:_TPort_ );
begin
     inherited AddOrSetValue( BindI_, Port_ );

     AddPort( BindI_, Port_ );
end;

procedure TGLPorts<_TPort_>.Remove( const BindI_:GLuint );
begin
     DelPort( BindI_, Items[ BindI_ ] );

     inherited Remove( BindI_ );
end;

procedure TGLPorts<_TPort_>.Del( const BindI_:GLuint );
begin
     Remove( BindI_ );
end;

//------------------------------------------------------------------------------

procedure TGLPorts<_TPort_>.AddPorts;
var
   P :TPair<GLuint,_TPort_>;
begin
     for P in Self do
     begin
          with P do AddPort( Key, Value );
     end;
end;

procedure TGLPorts<_TPort_>.DelPorts;
var
   P :TPair<GLuint,_TPort_>;
begin
     for P in Self do
     begin
          with P do DelPort( Key, Value );
     end;
end;

//------------------------------------------------------------------------------

procedure TGLPorts<_TPort_>.Use;
begin

end;

procedure TGLPorts<_TPort_>.Unuse;
begin

end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPortsS

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLPortsS.AddPort( const BinP_:GLuint; const Port_:TGLPortS );
begin
     _Progra.Attach( Port_.Shad );
end;

procedure TGLPortsS.DelPort( const BinP_:GLuint; const Port_:TGLPortS );
begin
     _Progra.Detach( Port_.Shad );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLPortsS.Add( const Shad_:IGLShader );
var
   P :TGLPortS;
begin
     with P do
     begin
          Shad := Shad_;
     end;

     inherited Add( Shad_.Kind, P );
end;

procedure TGLPortsS.Del( const Shad_:IGLShader );
begin
     inherited Del( Shad_.Kind );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPortsF

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLPortsF.AddPort( const BinP_:GLuint; const Port_:TGLPortF );
begin
     glBindFragDataLocation( _Progra.ID, BinP_, PGLchar( AnsiString( Port_.Name ) ) );
end;

procedure TGLPortsF.DelPort( const BinP_:GLuint; const Port_:TGLPortF );
begin

end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLPortsF.Add( const BinP_:GLuint; const Name_:String );
var
   P :TGLPortF;
begin
     with P do
     begin
          Name := Name_;
     end;

     inherited Add( BinP_, P );
end;

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

function TGLProgra.GetShaders :TGLPortsS;
begin
     Result := _Shaders;
end;

function TGLProgra.GetFramers :TGLPortsF;
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
     _OnLinked;
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

     _Shaders := TGLPortsS.Create( Self );
     _Framers := TGLPortsF.Create( Self );

     _ID     := glCreateProgram;
     _Status := False;

     _OnLinked := procedure begin end;
end;

destructor TGLProgra.Destroy;
begin
     glDeleteProgram( _ID );

     _Shaders.DisposeOf;
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