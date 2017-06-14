unit LUX.GPU.OpenGL.Pluger;

interface //#################################################################### ■

uses System.Generics.Collections,
     Winapi.OpenGL, Winapi.OpenGLext,
     LUX, LUX.GPU.OpenGL, LUX.GPU.OpenGL.Buffer.Vert, LUX.GPU.OpenGL.Buffer.Unifor,
     LUX.GPU.OpenGL.Imager;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPlugV

     TGLPlugV = record
     private
     public
       Buff :IGLBufferV;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPlugU

     TGLPlugU = record
     private
     public
       Buff :IGLUnifor;
       Offs :Integer;
       Size :Integer;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPlugI

     TGLPlugI = record
     private
     public
       Samp :IGLSample;
       Imag :IGLImager;
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPlugs<_TPlug_>

     TGLPlugs<_TPlug_:record> = class( TDictionary<GLuint,_TPlug_> )
     private
     protected
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPluger<_TPorts_>

     IGLPluger = interface( IGLObject )
     ['{94CC0F36-95D2-41BE-8B64-0FD5FF78F18C}']
       ///// メソッド
       procedure Use;
       procedure Unuse;
     end;

     //-------------------------------------------------------------------------

     TGLPluger<_TPlug_:record> = class( TGLObject, IGLPluger )
     private
     protected
       _Plugs :TGLPlugs<_TPlug_>;
       ///// メソッド
       procedure UsePlug( const BinP_:GLuint; const Plug_:_TPlug_ ); virtual; abstract;
       procedure DisPlug( const BinP_:GLuint; const Plug_:_TPlug_ ); virtual; abstract;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property Plugs :TGLPlugs<_TPlug_> read _Plugs;
       ///// メソッド
       procedure Use;
       procedure Unuse;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPlugerV

     IGLPlugerV = interface( IGLPluger )
     ['{45DC202F-2E99-4BC6-AEAD-784FE81271D2}']
       ///// メソッド
       procedure Add( const BinP_:GLuint; const Buff_:IGLBufferV );
     end;

     //-------------------------------------------------------------------------

     TGLPlugerV = class( TGLPluger<TGLPlugV>, IGLPlugerV )
     private
     protected
       ///// メソッド
       procedure UsePlug( const BinP_:GLuint; const Plug_:TGLPlugV ); override;
       procedure DisPlug( const BinP_:GLuint; const Plug_:TGLPlugV ); override;
     public
       ///// メソッド
       procedure Add( const BinP_:GLuint; const Buff_:IGLBufferV );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPlugerU

     IGLPlugerU = interface( IGLPluger )
     ['{39DBA43A-6F44-4456-A96D-1A8A73459F61}']
       ///// メソッド
       procedure Add( const BinP_:GLuint; const Buff_:IGLUnifor;
                                          const Offs_:Integer = -1;
                                          const Size_:Integer = 1 );
     end;

     //-------------------------------------------------------------------------

     TGLPlugerU = class( TGLPluger<TGLPlugU>, IGLPlugerU )
     private
     protected
       ///// メソッド
       procedure UsePlug( const BinP_:GLuint; const Plug_:TGLPlugU ); override;
       procedure DisPlug( const BinP_:GLuint; const Plug_:TGLPlugU ); override;
     public
       ///// メソッド
       procedure Add( const BinP_:GLuint; const Buff_:IGLUnifor;
                                          const Offs_:Integer = -1;
                                          const Size_:Integer = 1 );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPlugerI

     IGLPlugerI = interface( IGLPluger )
     ['{A2CC92D0-EE47-4D1C-B868-850353966C6D}']
       ///// メソッド
       procedure Add( const BinP_:GLuint; const Samp_:IGLSample;
                                          const Imag_:IGLImager );
     end;

     //-------------------------------------------------------------------------

     TGLPlugerI = class( TGLPluger<TGLPlugI>, IGLPlugerI )
     private
     protected
       ///// メソッド
       procedure UsePlug( const BinP_:GLuint; const Plug_:TGLPlugI ); override;
       procedure DisPlug( const BinP_:GLuint; const Plug_:TGLPlugI ); override;
     public
       ///// メソッド
       procedure Add( const BinP_:GLuint; const Samp_:IGLSample;
                                          const Imag_:IGLImager );
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPlugV

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPlugU

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPlugI

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPlugs<_TPlug_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPluger<_TPorts_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLPluger<_TPlug_>.Create;
begin
     inherited;

     _Plugs := TGLPlugs<_TPlug_>.Create;
end;

destructor TGLPluger<_TPlug_>.Destroy;
begin
     _Plugs.DisposeOf;

     inherited;
end;

//------------------------------------------------------------------------------

procedure TGLPluger<_TPlug_>.Use;
var
   P :TPair<GLuint,_TPlug_>;
begin
     for P in _Plugs do
     begin
          with P do UsePlug( Key, Value );
     end;
end;

procedure TGLPluger<_TPlug_>.Unuse;
var
   P :TPair<GLuint,_TPlug_>;
begin
     for P in _Plugs do
     begin
          with P do DisPlug( Key, Value );
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPlugerV

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLPlugerV.UsePlug( const BinP_:GLuint; const Plug_:TGLPlugV );
begin
     Plug_.Buff.Use( BinP_ );
end;

procedure TGLPlugerV.DisPlug( const BinP_:GLuint; const Plug_:TGLPlugV );
begin
     Plug_.Buff.Unuse( BinP_ );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLPlugerV.Add( const BinP_:GLuint; const Buff_:IGLBufferV );
var
   P :TGLPlugV;
begin
     with P do
     begin
          Buff := Buff_;
     end;

     _Plugs.AddOrSetValue( BinP_, P );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPlugerU

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLPlugerU.UsePlug( const BinP_:GLuint; const Plug_:TGLPlugU );
begin
     with Plug_ do
     begin
          if Offs = -1 then Buff.Use( BinP_             )
                       else Buff.Use( BinP_, Offs, Size );
     end;
end;

procedure TGLPlugerU.DisPlug( const BinP_:GLuint; const Plug_:TGLPlugU );
begin
     Plug_.Buff.Unuse( BinP_ );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLPlugerU.Add( const BinP_:GLuint;
                          const Buff_:IGLUnifor;
                          const Offs_:Integer = -1;
                          const Size_:Integer = 1 );
var
   P :TGLPlugU;
begin
     with P do
     begin
          Buff := Buff_;
          Offs := Offs_;
          Size := Size_;
     end;

     _Plugs.AddOrSetValue( BinP_, P );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPlugerI

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLPlugerI.UsePlug( const BinP_:GLuint; const Plug_:TGLPlugI );
begin
     with Plug_ do
     begin
          Samp.Use( BinP_ );
          Imag.Use( BinP_ );
     end;
end;

procedure TGLPlugerI.DisPlug( const BinP_:GLuint; const Plug_:TGLPlugI );
begin
     with Plug_ do
     begin
          Samp.Unuse( BinP_ );
          Imag.Unuse( BinP_ );
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLPlugerI.Add( const BinP_:GLuint; const Samp_:IGLSample; const Imag_:IGLImager );
var
   P :TGLPlugI;
begin
     with P do
     begin
          Samp := Samp_;
          Imag := Imag_;
     end;

     _Plugs.AddOrSetValue( BinP_, P );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■