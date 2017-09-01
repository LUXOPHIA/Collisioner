unit LUX.GPU.OpenGL.Atom.Porter;

interface //#################################################################### ■

uses System.Generics.Collections,
     Winapi.OpenGL, Winapi.OpenGLext,
     LUX,
     LUX.GPU.OpenGL.Atom;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPortF

     TGLPortF = record
     private
     public
       Name :String;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPortV

     TGLPortV = record
     private
     public
       Name :String;
       EleN :GLint;
       EleT :GLenum;
       Offs :GLuint;
       /////
       constructor Create( const Name_:String;
                           const EleN_:GLint;
                           const EleT_:GLenum;
                           const Offs_:GLuint = 0 );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPortU

     TGLPortU = record
     private
     public
       Name :String;
       /////
       constructor Create( const Name_:String );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPortI

     TGLPortI = record
     private
     public
       Name :String;
       /////
       constructor Create( const Name_:String );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPortS

     TGLPortS = record
     private
     public
       Name :String;
       /////
       constructor Create( const Name_:String );
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPorter<_TPort_>

     TGLPorter<_TPort_:record> = class( TDictionary<GLuint,_TPort_> )
     private
     protected
       _Progra :IGLProgra;
       ///// メソッド
       procedure AddPort( const BinP_:GLuint; const Port_:_TPort_ ); virtual; abstract;
       procedure DelPort( const BinP_:GLuint; const Port_:_TPort_ ); virtual; abstract;
     public
       constructor Create( const Progra_:IGLProgra );
       ///// プロパティ
       property Progra :IGLProgra read _Progra;
       ///// メソッド
       procedure Add( const BindI_:GLuint; const Port_:_TPort_ );
       procedure Remove( const BindI_:GLuint );
       procedure Del( const BindI_:GLuint );
       procedure AddPorts;
       procedure DelPorts;
       procedure Use; virtual;
       procedure Unuse; virtual;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPorterF

     TGLPorterF = class( TGLPorter<TGLPortF> )
     private
     protected
       ///// メソッド
       procedure AddPort( const BinP_:GLuint; const Port_:TGLPortF ); override;
       procedure DelPort( const BinP_:GLuint; const Port_:TGLPortF ); override;
     public
       ///// メソッド
       procedure Add( const BinP_:GLuint; const Name_:String );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPorterV

     TGLPorterV = class( TGLPorter<TGLPortV> )
     private
     protected
       _Varray :TGLVarray;
       ///// メソッド
       procedure AddPort( const BinP_:GLuint; const Port_:TGLPortV ); override;
       procedure DelPort( const BinP_:GLuint; const Port_:TGLPortV ); override;
     public
       constructor Create( const Progra_:IGLProgra );
       destructor Destroy; override;
       ///// メソッド
       procedure Add( const BinP_:GLuint; const Name_:String;
                                          const EleN_:GLint;
                                          const EleT_:GLenum;
                                          const Offs_:GLuint = 0 );
       procedure Use; override;
       procedure Unuse; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPorterU

     TGLPorterU = class( TGLPorter<TGLPortU> )
     private
     protected
       ///// メソッド
       procedure AddPort( const BinP_:GLuint; const Port_:TGLPortU ); override;
       procedure DelPort( const BinP_:GLuint; const Port_:TGLPortU ); override;
     public
       ///// メソッド
       procedure Add( const BinP_:GLuint; const Name_:String );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPorterI

     TGLPorterI = class( TGLPorter<TGLPortI> )
     private
     protected
       ///// メソッド
       procedure AddPort( const BinP_:GLuint; const Port_:TGLPortI ); override;
       procedure DelPort( const BinP_:GLuint; const Port_:TGLPortI ); override;
     public
       ///// メソッド
       procedure Add( const BinP_:GLuint; const Name_:String );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPorterS

     TGLPorterS = class( TGLPorter<TGLPortS> )
     private
     protected
       ///// メソッド
       procedure AddPort( const BinP_:GLuint; const Port_:TGLPortS ); override;
       procedure DelPort( const BinP_:GLuint; const Port_:TGLPortS ); override;
     public
       ///// メソッド
       procedure Add( const BinP_:GLuint; const Name_:String );
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPortF

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPortV

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLPortV.Create( const Name_:String;
                             const EleN_:GLint;
                             const EleT_:GLenum;
                             const Offs_:GLuint );
begin
     Name := Name_;
     EleN := EleN_;
     EleT := EleT_;
     Offs := Offs_;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPortU

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLPortU.Create( const Name_:String );
begin
     Name := Name_;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPortI

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLPortI.Create( const Name_:String );
begin
     Name := Name_;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPortS

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLPortS.Create( const Name_:String );
begin
     Name := Name_;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPorter<_TPort_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLPorter<_TPort_>.Create( const Progra_:IGLProgra );
begin
     inherited Create;

     _Progra := Progra_;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLPorter<_TPort_>.Add( const BindI_:GLuint; const Port_:_TPort_ );
begin
     inherited AddOrSetValue( BindI_, Port_ );

     AddPort( BindI_, Port_ );
end;

procedure TGLPorter<_TPort_>.Remove( const BindI_:GLuint );
begin
     DelPort( BindI_, Items[ BindI_ ] );

     inherited Remove( BindI_ );
end;

procedure TGLPorter<_TPort_>.Del( const BindI_:GLuint );
begin
     Remove( BindI_ );
end;

//------------------------------------------------------------------------------

procedure TGLPorter<_TPort_>.AddPorts;
var
   P :TPair<GLuint,_TPort_>;
begin
     for P in Self do
     begin
          with P do AddPort( Key, Value );
     end;
end;

procedure TGLPorter<_TPort_>.DelPorts;
var
   P :TPair<GLuint,_TPort_>;
begin
     for P in Self do
     begin
          with P do DelPort( Key, Value );
     end;
end;

//------------------------------------------------------------------------------

procedure TGLPorter<_TPort_>.Use;
begin

end;

procedure TGLPorter<_TPort_>.Unuse;
begin

end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPorterF

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLPorterF.AddPort( const BinP_:GLuint; const Port_:TGLPortF );
begin
     glBindFragDataLocation( _Progra.ID, BinP_, PGLchar( AnsiString( Port_.Name ) ) );
end;

procedure TGLPorterF.DelPort( const BinP_:GLuint; const Port_:TGLPortF );
begin

end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLPorterF.Add( const BinP_:GLuint; const Name_:String );
var
   P :TGLPortF;
begin
     with P do
     begin
          Name := Name_;
     end;

     inherited Add( BinP_, P );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPorterV

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLPorterV.AddPort( const BinP_:GLuint; const Port_:TGLPortV );
var
   L :GLuint;
begin
     L := _Progra.GetProgramResourceIndex( GL_PROGRAM_INPUT, Port_.Name );

     with _Varray do
     begin
          Bind;

            glEnableVertexAttribArray( L );

            with Port_ do
            begin
                 case EleT of
                 GL_INT   :glVertexAttribIFormat( L, EleN, EleT, Offs );
                 GL_FLOAT :glVertexAttribFormat( L, EleN, EleT, GL_FALSE, Offs );
                 end;
            end;

            glVertexAttribBinding( L, BinP_ );

          Unbind;
     end;
end;

procedure TGLPorterV.DelPort( const BinP_:GLuint; const Port_:TGLPortV );
var
   L :GLuint;
begin
     L := _Progra.GetProgramResourceIndex( GL_PROGRAM_INPUT, Port_.Name );

     with _Varray do
     begin
          Bind;

            glDisableVertexAttribArray( L );

          Unbind;
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLPorterV.Create( const Progra_:IGLProgra );
begin
     inherited;

     _Varray := TGLVarray.Create;
end;

destructor TGLPorterV.Destroy;
begin
     _Varray.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLPorterV.Use;
begin
     _Varray.Bind;
end;

procedure TGLPorterV.Unuse;
begin
     _Varray.Unbind;
end;

//------------------------------------------------------------------------------

procedure TGLPorterV.Add( const BinP_:GLuint; const Name_:String;
                                              const EleN_:GLint;
                                              const EleT_:GLenum;
                                              const Offs_:GLuint = 0 );
var
   P :TGLPortV;
begin
     with P do
     begin
          Name := Name_;
          EleN := EleN_;
          EleT := EleT_;
          Offs := Offs_;
     end;

     inherited Add( BinP_, P );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPorterU

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLPorterU.AddPort( const BinP_:GLuint; const Port_:TGLPortU );
var
   L :GLuint;
begin
     with _Progra do
     begin
          L := GetProgramResourceIndex( GL_UNIFORM_BLOCK, Port_.Name );

          glUniformBlockBinding( ID, L, BinP_ );
     end;
end;

procedure TGLPorterU.DelPort( const BinP_:GLuint; const Port_:TGLPortU );
begin

end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLPorterU.Add( const BinP_:GLuint; const Name_:String );
var
   P :TGLPortU;
begin
     with P do
     begin
          Name := Name_;
     end;

     inherited Add( BinP_, P );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPorterI

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLPorterI.AddPort( const BinP_:GLuint; const Port_:TGLPortI );
var
   L :GLuint;
begin
     with _Progra do
     begin
          L := GetProgramResourceIndex( GL_UNIFORM, Port_.Name );

          glProgramUniform1i( ID, L, BinP_ );
     end;
end;

procedure TGLPorterI.DelPort( const BinP_:GLuint; const Port_:TGLPortI );
begin

end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLPorterI.Add( const BinP_:GLuint; const Name_:String );
var
   P :TGLPortI;
begin
     with P do
     begin
          Name := Name_;
     end;

     inherited Add( BinP_, P );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPorterS

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLPorterS.AddPort( const BinP_:GLuint; const Port_:TGLPortS );
var
   L :GLuint;
begin
     with _Progra do
     begin
          L := GetProgramResourceIndex( GL_SHADER_STORAGE_BLOCK, Port_.Name );

          glShaderStorageBlockBinding( ID, L, BinP_ );
     end;
end;

procedure TGLPorterS.DelPort( const BinP_:GLuint; const Port_:TGLPortS );
begin

end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLPorterS.Add( const BinP_:GLuint; const Name_:String );
var
   P :TGLPortS;
begin
     with P do
     begin
          Name := Name_;
     end;

     inherited Add( BinP_, P );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■