unit LUX.GPU.OpenGL.Comput;

interface //#################################################################### ■

uses System.SysUtils, System.UITypes,
     Winapi.OpenGL, Winapi.OpenGLext,
     LUX,
     LUX.Data.Dictionary,
     LUX.GPU.OpenGL,
     LUX.GPU.OpenGL.Atom.Buffer.VerBuf,
     LUX.GPU.OpenGL.Atom.Buffer.StoBuf,
     LUX.GPU.OpenGL.Atom.Imager,
     LUX.GPU.OpenGL.Atom.Shader,
     LUX.GPU.OpenGL.Atom.Engine;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLComput

     IGLComput = interface
     ['{13071090-B024-474A-BDA2-AB604AD10B16}']
     {protected}
       ///// アクセス
       function GetEngine  :TGLEngine;
       function GetShaderC :TGLShaderC;
     {public}
       ///// プロパティ
       property Engine  :TGLEngine  read GetEngine ;
       property ShaderC :TGLShaderC read GetShaderC;
       ///// メソッド
       procedure Run( const WorksX_,WorksY_,WorksZ_:GLuint );
     end;

     //-------------------------------------------------------------------------

     TGLComput = class( TInterfacedObject, IGLComput )
     private
     protected
       _Engine  :TGLEngine;
       _ShaderC :TGLShaderC;
       _StoBufs :TIndexDictionary<String,IGLStoBuf>;
       _Imagers :TIndexDictionary<String,IGLImager>;
       ///// アクセス
       function GetEngine  :TGLEngine;
       function GetShaderC :TGLShaderC;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property Engine  :TGLEngine                          read GetEngine ;
       property ShaderC :TGLShaderC                         read GetShaderC;
       property StoBufs :TIndexDictionary<String,IGLStoBuf> read   _StoBufs;
       property Imagers :TIndexDictionary<String,IGLImager> read   _Imagers;
       ///// メソッド
       procedure Run( const WorksX_,WorksY_,WorksZ_:GLuint );
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLComput

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLComput.GetEngine :TGLEngine;
begin
     Result := _Engine;
end;

function TGLComput.GetShaderC :TGLShaderC;
begin
     Result := _ShaderC;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLComput.Create;
begin
     inherited;

     _Engine  := TGLEngine .Create;
     _ShaderC := TGLShaderC.Create;

     _Imagers := TIndexDictionary<String,IGLImager>.Create;
     _StoBufs := TIndexDictionary<String,IGLStoBuf>.Create;

     with _Engine do
     begin
          Attach( _ShaderC{Shad} );
     end;
end;

destructor TGLComput.Destroy;
begin
     _Imagers.DisposeOf;
     _StoBufs.DisposeOf;

     _Engine .DisposeOf;
     _ShaderC.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLComput.Run( const WorksX_,WorksY_,WorksZ_:GLuint );
var
   K :String;
begin
     for K in _Imagers.Keys do
     begin
          with _Imagers[ K ] do
          begin
               _Engine.Imagers.Add( Index{BinP}, K{Name} );
          end;
     end;

     for K in _StoBufs.Keys do
     begin
          with _StoBufs[ K ] do
          begin
               _Engine.StoBufs.Add( Index{BinP}, K{Name} );
          end;
     end;

     _Engine.Link;

     _Engine.Use;

     for K in _Imagers.Keys do
     begin
          with _Imagers[ K ] do Value.UseComput( Index );
     end;

     for K in _StoBufs.Keys do
     begin
          with _StoBufs[ K ] do Value.Use( Index );
     end;

     glDispatchCompute( WorksX_, WorksY_, WorksZ_ );

     _Engine.Unuse;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
