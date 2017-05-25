unit LUX.GPU.OpenGL.Pluger;

interface //#################################################################### ■

uses System.Generics.Collections,
     Winapi.OpenGL, Winapi.OpenGLext,
     LUX, LUX.GPU.OpenGL, LUX.GPU.OpenGL.Buffer.Vert, LUX.GPU.OpenGL.Buffer.Unif,
     LUX.GPU.OpenGL.Imager;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLVertPlug

     TGLVertPlug = record
     private
     public
       Buff :IGLBufferV;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLUnifPlug

     TGLUnifPlug = record
     private
     public
       Buff :IGLBufferU;
       Offs :Integer;
       Size :Integer;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLImagPlug

     TGLImagPlug = record
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
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property Plugs :TGLPlugs<_TPlug_> read _Plugs;
       ///// メソッド
       procedure Use; virtual; abstract;
       procedure Unuse; virtual; abstract;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPlugerV

     IGLPlugerV = interface( IGLPluger )
     ['{45DC202F-2E99-4BC6-AEAD-784FE81271D2}']
       ///// メソッド
       procedure Add( const BinP_:GLuint; const Buff_:IGLBufferV );
     end;

     //-------------------------------------------------------------------------

     TGLPlugerV = class( TGLPluger<TGLVertPlug>, IGLPlugerV )
     private
     protected
     public
       ///// メソッド
       procedure Add( const BinP_:GLuint; const Buff_:IGLBufferV );
       procedure Use; override;
       procedure Unuse; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPlugerU

     IGLPlugerU = interface( IGLPluger )
     ['{39DBA43A-6F44-4456-A96D-1A8A73459F61}']
       ///// メソッド
       procedure Add( const BinP_:GLuint; const Buff_:IGLBufferU;
                                          const Offs_:Integer = -1;
                                          const Size_:Integer = 1 );
     end;

     //-------------------------------------------------------------------------

     TGLPlugerU = class( TGLPluger<TGLUnifPlug>, IGLPlugerU )
     private
     protected
     public
       ///// メソッド
       procedure Add( const BinP_:GLuint; const Buff_:IGLBufferU;
                                          const Offs_:Integer = -1;
                                          const Size_:Integer = 1 );
       procedure Use; override;
       procedure Unuse; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPlugerI

     IGLPlugerI = interface( IGLPluger )
     ['{A2CC92D0-EE47-4D1C-B868-850353966C6D}']
       ///// メソッド
       procedure Add( const BinP_:GLuint; const Samp_:IGLSample;
                                          const Imag_:IGLImager );
     end;

     //-------------------------------------------------------------------------

     TGLPlugerI = class( TGLPluger<TGLImagPlug>, IGLPlugerI )
     private
     protected
     public
       ///// メソッド
       procedure Add( const BinP_:GLuint; const Samp_:IGLSample;
                                          const Imag_:IGLImager );
       procedure Use; override;
       procedure Unuse; override;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLVertPlug

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLUnifPlug

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLImagPlug

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

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPlugerV

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLPlugerV.Add( const BinP_:GLuint; const Buff_:IGLBufferV );
var
   P :TGLVertPlug;
begin
     with P do
     begin
          Buff := Buff_;
     end;

     _Plugs.AddOrSetValue( BinP_, P );
end;

//------------------------------------------------------------------------------

procedure TGLPlugerV.Use;
var
   P :TPair<GLuint,TGLVertPlug>;
begin
     for P in _Plugs do
     begin
          with P do Value.Buff.Use( Key );
     end;
end;

procedure TGLPlugerV.Unuse;
var
   P :TPair<GLuint,TGLVertPlug>;
begin
     for P in _Plugs do
     begin
          with P do Value.Buff.Unuse( Key );
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPlugerU

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLPlugerU.Add( const BinP_:GLuint;
                          const Buff_:IGLBufferU;
                          const Offs_:Integer = -1;
                          const Size_:Integer = 1 );
var
   P :TGLUnifPlug;
begin
     with P do
     begin
          Buff := Buff_;
          Offs := Offs_;
          Size := Size_;
     end;

     _Plugs.AddOrSetValue( BinP_, P );
end;

//------------------------------------------------------------------------------

procedure TGLPlugerU.Use;
var
   P :TPair<GLuint,TGLUnifPlug>;
begin
     for P in _Plugs do
     begin
          with P, Value do
          begin
               if Offs = -1 then Buff.Use( Key             )
                            else Buff.Use( Key, Offs, Size );
          end;
     end;
end;

procedure TGLPlugerU.Unuse;
var
   P :TPair<GLuint,TGLUnifPlug>;
begin
     for P in _Plugs do
     begin
          with P do Value.Buff.Unuse( Key );
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPlugerI

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLPlugerI.Add( const BinP_:GLuint; const Samp_:IGLSample; const Imag_:IGLImager );
var
   P :TGLImagPlug;
begin
     with P do
     begin
          Samp := Samp_;
          Imag := Imag_;
     end;

     _Plugs.AddOrSetValue( BinP_, P );
end;

//------------------------------------------------------------------------------

procedure TGLPlugerI.Use;
var
   P :TPair<GLuint,TGLImagPlug>;
begin
     for P in _Plugs do
     begin
          with P do
          begin
               with Value do
               begin
                    Samp.Use( Key );
                    Imag.Use( Key );
               end;
          end;
     end;
end;

procedure TGLPlugerI.Unuse;
var
   P :TPair<GLuint,TGLImagPlug>;
begin
     for P in _Plugs do
     begin
          with P do
          begin
               with Value do
               begin
                    Samp.Unuse( Key );
                    Imag.Unuse( Key );
               end;
          end;
     end;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■