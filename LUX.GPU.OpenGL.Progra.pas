unit LUX.GPU.OpenGL.Progra;

interface //#################################################################### ■

uses System.SysUtils, System.Classes, System.Generics.Collections,
     Winapi.OpenGL, Winapi.OpenGLext,
     LUX, LUX.GPU.OpenGL, LUX.GPU.OpenGL.Shader;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLFraPort

     TGLFraPort = record
     private
     public
       Name :String;
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaders

     TGLShaders = class( TDictionary<IGLShader,IGLShader> )
     private
     protected
     public
       procedure Add( const Shader_:IGLShader );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLFraPorts

     TGLFraPorts = class( TDictionary<GLuint,TGLFraPort> )
     private
     protected
     public
       procedure Add( const BindI_:GLuint; const Name_:String );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLProgra

     IGLProgra = interface( IGLObject )
     ['{0B2FDEDE-30D3-439B-AC76-E61F9E028CD0}']
       ///// アクセス
       function GetShaders :TGLShaders;
       function GetFraPorts :TGLFraPorts;
       function GetStatus :Boolean;
       function GetErrors :TStringList;
       ///// イベント
       function GetOnLinked :TProc;
       procedure SetOnLinked( const OnLinked_:TProc );
       ///// プロパティ
       property Shaders  :TGLShaders  read GetShaders ;
       property FraPorts :TGLFraPorts read GetFraPorts;
       property Status   :Boolean     read GetStatus  ;
       property Errors   :TStringList read GetErrors  ;
       ///// イベント
       property OnLinked :TProc read GetOnLinked write SetOnLinked;
       ///// メソッド
       procedure Attach( const Shader_:IGLShader );
       procedure Detach( const Shader_:IGLShader );
       procedure Link;
       procedure Use;
       procedure Unuse;
     end;

     TGLProgra = class( TGLObject, IGLProgra )
     private
     protected
       _Shaders  :TGLShaders;
       _FraPorts :TGLFraPorts;
       _Status   :Boolean;
       _Errors   :TStringList;
       ///// イベント
       _OnLinked :TProc;
       ///// アクセス
       function GetShaders :TGLShaders;
       function GetFraPorts :TGLFraPorts;
       procedure SetShaders( Sender_:TObject; const Shader_:IGLShader; Action_:TCollectionNotification );
       procedure SetFraPorts( Sender_:TObject; const BindI_:GLuint; Action_:TCollectionNotification );
       function GetStatus :Boolean;
       function GetErrors :TStringList;
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
       property Shaders  :TGLShaders  read _Shaders ;
       property FraPorts :TGLFraPorts read _FraPorts;
       property Status   :Boolean     read _Status  ;
       property Errors   :TStringList read _Errors  ;
       ///// イベント
       property OnLinked :TProc read GetOnLinked write SetOnLinked;
       ///// メソッド
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

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLFraPort

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaders

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLShaders.Add( const Shader_:IGLShader );
begin
     inherited AddOrSetValue( Shader_, Shader_ );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLFraPorts

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLFraPorts.Add( const BindI_:GLuint; const Name_:String );
var
   P :TGLFraPort;
begin
     with P do
     begin
          Name := Name_;
     end;

     inherited AddOrSetValue( BindI_, P );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLProgra

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLProgra.GetShaders :TGLShaders;
begin
     Result := _Shaders;
end;

procedure TGLProgra.SetShaders( Sender_:TObject; const Shader_:IGLShader; Action_:TCollectionNotification );
begin
     case Action_ of
       TCollectionNotification.cnAdded:
          begin
               Attach( Shader_ );
          end;
       TCollectionNotification.cnRemoved  ,
       TCollectionNotification.cnExtracted:
          begin
               Detach( Shader_ );
          end;
     end;
end;

//------------------------------------------------------------------------------

function TGLProgra.GetFraPorts :TGLFraPorts;
begin
     Result := _FraPorts;
end;

procedure TGLProgra.SetFraPorts( Sender_:TObject; const BindI_:GLuint; Action_:TCollectionNotification );
var
   P :TGLFraPort;
begin
     P := _FraPorts.Items[ BindI_ ];

     case Action_ of
       TCollectionNotification.cnAdded:
          begin
               glBindFragDataLocation( _ID, BindI_, PGLchar( AnsiString( P.Name ) ) );
          end;
       TCollectionNotification.cnRemoved  ,
       TCollectionNotification.cnExtracted:
          begin

          end;
     end;
end;

//------------------------------------------------------------------------------

function TGLProgra.GetStatus :Boolean;
begin
     Result := _Status;
end;

function TGLProgra.GetErrors :TStringList;
begin
     Result := _Errors;
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

     _Shaders  := TGLShaders .Create;
     _FraPorts := TGLFraPorts.Create;
     _Errors   := TStringList.Create;

     _Shaders .OnKeyNotify := SetShaders ;
     _FraPorts.OnKeyNotify := SetFraPorts;

     _ID     := glCreateProgram;
     _Status := False;

     _OnLinked := procedure begin end;
end;

destructor TGLProgra.Destroy;
begin
     glDeleteProgram( _ID );

     _Errors  .DisposeOf;
     _FraPorts.DisposeOf;
     _Shaders .DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

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