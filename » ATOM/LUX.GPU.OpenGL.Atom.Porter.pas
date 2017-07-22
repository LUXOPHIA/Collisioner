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

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPorts<_TPort_>

     TGLPorts<_TPort_:record> = class( TDictionary<GLuint,_TPort_> )
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

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPortsV

     TGLPortsV = class( TGLPorts<TGLPortV> )
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

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPortsU

     TGLPortsU = class( TGLPorts<TGLPortU> )
     private
     protected
       ///// メソッド
       procedure AddPort( const BinP_:GLuint; const Port_:TGLPortU ); override;
       procedure DelPort( const BinP_:GLuint; const Port_:TGLPortU ); override;
     public
       ///// メソッド
       procedure Add( const BinP_:GLuint; const Name_:String );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPortsI

     TGLPortsI = class( TGLPorts<TGLPortI> )
     private
     protected
       ///// メソッド
       procedure AddPort( const BinP_:GLuint; const Port_:TGLPortI ); override;
       procedure DelPort( const BinP_:GLuint; const Port_:TGLPortI ); override;
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

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPorts<_TPort_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLPorts<_TPort_>.Create( const Progra_:IGLProgra );
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

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPortsV

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLPortsV.AddPort( const BinP_:GLuint; const Port_:TGLPortV );
var
   L :GLuint;
begin
     L := _Progra.glGetVertLoca( Port_.Name );

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

procedure TGLPortsV.DelPort( const BinP_:GLuint; const Port_:TGLPortV );
var
   L :GLuint;
begin
     L := _Progra.glGetVertLoca( Port_.Name );

     with _Varray do
     begin
          Bind;

            glDisableVertexAttribArray( L );

          Unbind;
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLPortsV.Create( const Progra_:IGLProgra );
begin
     inherited;

     _Varray := TGLVarray.Create;
end;

destructor TGLPortsV.Destroy;
begin
     _Varray.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLPortsV.Use;
begin
     _Varray.Bind;
end;

procedure TGLPortsV.Unuse;
begin
     _Varray.Unbind;
end;

//------------------------------------------------------------------------------

procedure TGLPortsV.Add( const BinP_:GLuint; const Name_:String;
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

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPortsU

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLPortsU.AddPort( const BinP_:GLuint; const Port_:TGLPortU );
var
   L :GLuint;
begin
     L := _Progra.glGetBlocLoca( Port_.Name );

     glUniformBlockBinding( _Progra.ID, L, BinP_ );
end;

procedure TGLPortsU.DelPort( const BinP_:GLuint; const Port_:TGLPortU );
begin

end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLPortsU.Add( const BinP_:GLuint; const Name_:String );
var
   P :TGLPortU;
begin
     with P do
     begin
          Name := Name_;
     end;

     inherited Add( BinP_, P );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPortsI

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLPortsI.AddPort( const BinP_:GLuint; const Port_:TGLPortI );
var
   L :GLuint;
begin
     with _Progra do
     begin
          L := glGetUnifLoca( Port_.Name );

          Use;

            glUniform1i( L, BinP_ );

          Unuse;
     end;
end;

procedure TGLPortsI.DelPort( const BinP_:GLuint; const Port_:TGLPortI );
begin

end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLPortsI.Add( const BinP_:GLuint; const Name_:String );
var
   P :TGLPortI;
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