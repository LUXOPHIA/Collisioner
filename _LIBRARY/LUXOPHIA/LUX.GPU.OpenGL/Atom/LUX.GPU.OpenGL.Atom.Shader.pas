unit LUX.GPU.OpenGL.Atom.Shader;

interface //#################################################################### ■

uses System.SysUtils, System.Classes,
     Winapi.OpenGL, Winapi.OpenGLext,
     LUX,
     LUX.GPU.OpenGL.Atom;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShader

     TGLShader = class( TGLAtomer, IGLShader )
     private
     protected
       _Kind   :GLenum;
       _Source :TStringList;
       _Status :Boolean;
       _Errors :TStringList;
       _Progra :IGLProgra;
       ///// イベント
       _OnCompiled :TProc;
       ///// アクセス
       function GetKind :GLenum;
       function GetSource :TStringList;
       procedure SetSource( Sender_:TObject );
       function GetStatus :Boolean;
       function GetErrors :TStringList;
       ///// メソッド
       procedure Compile( const Source_:String );
       function glGetStatus :Boolean;
       function glGetErrors :String;
     public
       constructor Create( const Kind_:GLenum );
       destructor Destroy; override;
       ///// プロパティ
       property Kind   :GLenum      read GetKind  ;
       property Source :TStringList read GetSource;
       property Status :Boolean     read GetStatus;
       property Errors :TStringList read GetErrors;
       ///// イベント
       property OnCompiled :TProc read _OnCompiled write _OnCompiled;
       ///// メソッド
       procedure Attach( const Progra_:IGLProgra );
       procedure Detach( const Progra_:IGLProgra );
       procedure LoadFromResource( const Name_:String );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaderC

     TGLShaderC = class( TGLShader )
     private
     protected
     public
       constructor Create;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaderV

     TGLShaderV = class( TGLShader )
     private
     protected
     public
       constructor Create;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaderG

     TGLShaderG = class( TGLShader )
     private
     protected
     public
       constructor Create;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaderF

     TGLShaderF = class( TGLShader )
     private
     protected
     public
       constructor Create;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.Types;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShader

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLShader.GetKind :GLenum;
begin
     Result := _Kind;
end;

//------------------------------------------------------------------------------

function TGLShader.GetSource :TStringList;
begin
     Result := _Source;
end;

procedure TGLShader.SetSource( Sender_:TObject );
begin
     Compile( _Source.Text );

     _Status      := glGetStatus;
     _Errors.Text := glGetErrors;

     if Assigned( _OnCompiled ) then _OnCompiled;

     if Assigned( _Progra ) then _Progra.Link;
end;

//------------------------------------------------------------------------------

function TGLShader.GetStatus :Boolean;
begin
     Result := _Status;
end;

function TGLShader.GetErrors :TStringList;
begin
     Result := _Errors;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLShader.Compile( const Source_:String );
var
   P :PGLchar;
   N :GLint;
begin
     P := PGLchar( AnsiString( Source_ ) );
     N := Length( Source_ );

     glShaderSource( _ID, 1, @P, @N );

     glCompileShader( _ID );
end;

function TGLShader.glGetStatus :Boolean;
var
   S :GLint;
begin
     glGetShaderiv( _ID, GL_COMPILE_STATUS, @S );

     Result := ( S = GL_TRUE );
end;

function TGLShader.glGetErrors :String;
var
   N :GLint;
   Cs :TArray<GLchar>;
   CsN :GLsizei;
begin
     glGetShaderiv( _ID, GL_INFO_LOG_LENGTH, @N );

     SetLength( Cs, N );

     glGetShaderInfoLog( _ID, N, @CsN, PGLchar( Cs ) );

     SetString( Result, PGLchar( Cs ), CsN );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLShader.Create( const Kind_:GLenum );
begin
     inherited Create;

     _Source := TStringList.Create;
     _Errors := TStringList.Create;

     _Source.OnChange := SetSource;

     _Kind := Kind_;

     _ID := glCreateShader( _Kind );
end;

destructor TGLShader.Destroy;
begin
     glDeleteShader( _ID );

     _Source.DisposeOf;
     _Errors.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLShader.Attach( const Progra_:IGLProgra );
begin
     _Progra := Progra_;
end;

procedure TGLShader.Detach( const Progra_:IGLProgra );
begin
     _Progra := nil;
end;

//------------------------------------------------------------------------------

procedure TGLShader.LoadFromResource( const Name_:String );
var
   RS :TResourceStream;
begin
     RS := TResourceStream.Create( hInstance, Name_, RT_RCDATA );
     try
        Source.LoadFromStream( RS );

     finally
            RS.DisposeOf;
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaderC

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLShaderC.Create;
begin
     inherited Create( GL_COMPUTE_SHADER );

end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaderV

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLShaderV.Create;
begin
     inherited Create( GL_VERTEX_SHADER );

end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaderG

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLShaderG.Create;
begin
     inherited Create( GL_GEOMETRY_SHADER );

end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaderF

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLShaderF.Create;
begin
     inherited Create( GL_FRAGMENT_SHADER );

end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■