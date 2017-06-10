unit LUX.GPU.OpenGL.Engine;

interface //#################################################################### ■

uses System.Generics.Collections,
     Winapi.OpenGL, Winapi.OpenGLext,
     LUX, LUX.GPU.OpenGL, LUX.GPU.OpenGL.Buffer, LUX.GPU.OpenGL.Buffer.Vert,
     LUX.GPU.OpenGL.Buffer.Unif, LUX.GPU.OpenGL.Shader, LUX.GPU.OpenGL.Progra;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLVerPort

     TGLVerPort = record
     private
     public
       Name :String;
       EleN :GLint;
       EleT :GLenum;
       Offs :GLuint;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLUniPort

     TGLUniPort = record
     private
     public
       Name :String;
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLVerPorts

     TGLVerPorts = class( TDictionary<GLuint,TGLVerPort> )
     private
     protected
     public
       procedure Add( const BindI_:GLuint; const Name_:String;
                                           const EleN_:GLint;
                                           const EleT_:GLenum;
                                           const Offs_:GLuint = 0 );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLUniPorts

     TGLUniPorts = class( TDictionary<GLuint,TGLUniPort> )
     private
     protected
     public
       procedure Add( const BindI_:GLuint; const Name_:String );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLEngine

     TGLEngine = class( TGLProgra )
     private
     protected
       _Varray   :TGLVarray;
       _VerPorts :TGLVerPorts;
       _UniPorts :TGLUniPorts;
       ///// アクセス
       procedure SetVerPorts( Sender_:TObject; const BindI_:GLuint; Action_:TCollectionNotification );
       procedure SetUniPorts( Sender_:TObject; const BindI_:GLuint; Action_:TCollectionNotification );
       ///// イベント
       procedure DoOnLinked; override;
       ///// メソッド
       procedure VerAdd( const BindI_:GLuint; const Port_:TGLVerPort );
       procedure VerDel( const BindI_:GLuint; const Port_:TGLVerPort );
       procedure UniAdd( const BindI_:GLuint; const Port_:TGLUniPort );
       procedure UniDel( const BindI_:GLuint; const Port_:TGLUniPort );
       procedure VerAdds;
       procedure UniAdds;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property VerPorts :TGLVerPorts read _VerPorts;
       property UniPorts :TGLUniPorts read _UniPorts;
       ///// メソッド
       procedure Use; override;
       procedure Unuse; override;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLVerPort

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLUniPort

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLVerPorts

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

procedure TGLVerPorts.Add( const BindI_:GLuint; const Name_:String;
                                                const EleN_:GLint;
                                                const EleT_:GLenum;
                                                const Offs_:GLuint = 0 );
var
   P :TGLVerPort;
begin
     with P do
     begin
          Name := Name_;
          EleN := EleN_;
          EleT := EleT_;
          Offs := Offs_;
     end;

     inherited AddOrSetValue( BindI_, P );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLUniPorts

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

procedure TGLUniPorts.Add( const BindI_:GLuint; const Name_:String );
var
   P :TGLUniPort;
begin
     with P do
     begin
          Name := Name_;
     end;

     inherited AddOrSetValue( BindI_, P );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLEngine

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

procedure TGLEngine.SetVerPorts( Sender_:TObject; const BindI_:GLuint; Action_:TCollectionNotification );
var
   T :TGLVerPort;
begin
     T := VerPorts.Items[ BindI_ ];

     case Action_ of
       TCollectionNotification.cnAdded:
          begin
               VerAdd( BindI_, T );
          end;
       TCollectionNotification.cnRemoved  ,
       TCollectionNotification.cnExtracted:
          begin
               VerDel( BindI_, T );
          end;
     end;
end;

procedure TGLEngine.SetUniPorts( Sender_:TObject; const BindI_:GLuint; Action_:TCollectionNotification );
var
   T :TGLUniPort;
begin
     T := UniPorts.Items[ BindI_ ];

     case Action_ of
       TCollectionNotification.cnAdded:
          begin
               UniAdd( BindI_, T );
          end;
       TCollectionNotification.cnRemoved  ,
       TCollectionNotification.cnExtracted:
          begin
               UniDel( BindI_, T );
          end;
     end;
end;

/////////////////////////////////////////////////////////////////////// イベント

procedure TGLEngine.DoOnLinked;
begin
     VerAdds;
     UniAdds;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLEngine.VerAdd( const BindI_:GLuint; const Port_:TGLVerPort );
var
   L :GLuint;
begin
     L := glGetAttribLocation( _ID, PAnsiChar( AnsiString( Port_.Name ) ) );

     with _Varray do
     begin
          Bind;

            glEnableVertexAttribArray( L );

            with Port_ do glVertexAttribFormat( L, EleN, EleT, GL_FALSE, Offs );

            glVertexAttribBinding( L, BindI_ );

          Unbind;
     end;
end;

procedure TGLEngine.VerDel( const BindI_:GLuint; const Port_:TGLVerPort );
var
   L :GLuint;
begin
     L := glGetAttribLocation( _ID, PAnsiChar( AnsiString( Port_.Name ) ) );

     with _Varray do
     begin
          Bind;

            glDisableVertexAttribArray( L );

          Unbind;
     end;
end;

//------------------------------------------------------------------------------

procedure TGLEngine.UniAdd( const BindI_:GLuint; const Port_:TGLUniPort );
var
   L :GLuint;
begin
     L := glGetUniformBlockIndex( _ID, PAnsiChar( AnsiString( Port_.Name ) ) );

     glUniformBlockBinding( _ID, L, BindI_ );
end;

procedure TGLEngine.UniDel( const BindI_:GLuint; const Port_:TGLUniPort );
begin

end;

//------------------------------------------------------------------------------

procedure TGLEngine.VerAdds;
var
   P :TPair<GLuint,TGLVerPort>;
begin
     for P in _VerPorts do
     begin
          with P do VerAdd( Key, Value );
     end;
end;

procedure TGLEngine.UniAdds;
var
   P :TPair<GLuint,TGLUniPort>;
begin
     for P in _UniPorts do
     begin
          with P do UniAdd( Key, Value );
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLEngine.Create;
begin
     inherited Create;

     _Varray   := TGLVarray  .Create;

     _VerPorts := TGLVerPorts.Create;
     _UniPorts := TGLUniPorts.Create;

     _VerPorts.OnKeyNotify := SetVerPorts;
     _UniPorts.OnKeyNotify := SetUniPorts;
end;

destructor TGLEngine.Destroy;
begin
     _VerPorts.DisposeOf;
     _UniPorts.DisposeOf;

     _Varray  .DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLEngine.Use;
begin
     inherited;

     _Varray.Bind;
end;

procedure TGLEngine.Unuse;
begin
     _Varray.Unbind;

     inherited;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■