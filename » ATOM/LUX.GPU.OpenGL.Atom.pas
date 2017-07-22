unit LUX.GPU.OpenGL.Atom;

interface //#################################################################### ■

uses System.Classes, System.SysUtils,
     Winapi.OpenGL, Winapi.OpenGLext,
     LUX;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     ///%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLAtomer

     IGLAtomer = interface
     ['{7F595632-258C-41E9-B9FA-E71B18A2335A}']
       ///// アクセス
       function GetID :GLuint;
       ///// プロパティ
       property ID :GLuint read GetID;
     end;

     //-------------------------------------------------------------------------

     TGLAtomer = class( TInterfacedBase, IGLAtomer )
     private
     protected
       _ID :GLuint;
       ///// アクセス
       function GetID :GLuint;
     public
       ///// プロパティ
       property ID :GLuint read GetID;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLVarray

     TGLVarray = class( TGLAtomer )
     private
     protected
     public
       constructor Create;
       destructor Destroy; override;
       ///// メソッド
       procedure Bind;
       procedure Unbind;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShader

     IGLShader = interface( IGLAtomer )
     ['{1E06B97A-6947-4960-8CD7-8FAD5CBCC546}']
       ///// アクセス
       function GetKind :GLenum;
       function GetSource :TStringList;
       function GetStatus :Boolean;
       function GetErrors :TStringList;
       ///// プロパティ
       property Kind   :GLenum      read GetKind  ;
       property Source :TStringList read GetSource;
       property Status :Boolean     read GetStatus;
       property Errors :TStringList read GetErrors;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLProgra

     IGLProgra = interface( IGLAtomer )
     ['{0B2FDEDE-30D3-439B-AC76-E61F9E028CD0}']
     {protected}
       ///// アクセス
       function GetStatus :Boolean;
       function GetErrors :TStringList;
       ///// イベント
       function GetOnLinked :TProc;
       procedure SetOnLinked( const OnLinked_:TProc );
     {public}
       ///// プロパティ
       property Status  :Boolean     read GetStatus ;
       property Errors  :TStringList read GetErrors ;
       ///// イベント
       property OnLinked :TProc read GetOnLinked write SetOnLinked;
       ///// メソッド
       function glGetVertLoca( const Name_:String ) :GLuint;
       function glGetBlocLoca( const Name_:String ) :GLuint;
       function glGetUnifLoca( const Name_:String ) :GLuint;
       procedure Attach( const Shader_:IGLShader );
       procedure Detach( const Shader_:IGLShader );
       procedure Link;
       procedure Use;
       procedure Unuse;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLAtomer

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLAtomer.GetID :GLuint;
begin
     Result := _ID;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLVarray

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLVarray.Create;
begin
     inherited;

     glGenVertexArrays( 1, @_ID );
end;

destructor TGLVarray.Destroy;
begin
     glDeleteVertexArrays( 1, @_ID );

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLVarray.Bind;
begin
     glBindVertexArray( _ID );
end;

procedure TGLVarray.Unbind;
begin
     glBindVertexArray( 0 );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■