unit LUX.GPU.OpenGL.Matery;

interface //#################################################################### ■

uses System.SysUtils,
     Winapi.OpenGL, Winapi.OpenGLext,
     LUX,
     LUX.GPU.OpenGL,
     LUX.GPU.OpenGL.Shader,
     LUX.GPU.OpenGL.Engine;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLMatery

     IGLMatery = interface
     ['{13071090-B024-474A-BDA2-AB604AD10B16}']
     {protected}
       ///// アクセス
       function GetShaderV :TGLShaderV;
       function GetShaderG :TGLShaderG;
       function GetShaderF :TGLShaderF;
       function GetEngine  :TGLEngine;
       /////
       function GetOnBuilded :TProc;
       procedure SetOnBuilded( const OnBuilded_:TProc );
     {public}
       ///// プロパティ
       property ShaderV :TGLShaderV read GetShaderV;
       property ShaderG :TGLShaderG read GetShaderG;
       property ShaderF :TGLShaderF read GetShaderF;
       property Engine  :TGLEngine  read GetEngine ;
       ///// イベント
       property OnBuilded :TProc read GetOnBuilded write SetOnBuilded;
       ///// メソッド
       procedure Use;
       procedure Unuse;
     end;

     //-------------------------------------------------------------------------

     TGLMatery = class( TInterfacedObject, IGLMatery )
     private
     protected
       _ShaderV :TGLShaderV;
       _ShaderG :TGLShaderG;
       _ShaderF :TGLShaderF;
       _Engine  :TGLEngine;
       ///// イベント
       _OnBuilded :TProc;
       ///// アクセス
       function GetShaderV :TGLShaderV;
       function GetShaderG :TGLShaderG;
       function GetShaderF :TGLShaderF;
       function GetEngine  :TGLEngine;
       /////
       function GetOnBuilded :TProc;
       procedure SetOnBuilded( const OnBuilded_:TProc );
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property ShaderV :TGLShaderV read GetShaderV;
       property ShaderG :TGLShaderG read GetShaderG;
       property ShaderF :TGLShaderF read GetShaderF;
       property Engine  :TGLEngine  read GetEngine ;
       ///// イベント
       property OnBuilded :TProc read GetOnBuilded write SetOnBuilded;
       ///// メソッド
       procedure Use; virtual;
       procedure Unuse; virtual;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLMatery

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLMatery.GetShaderV :TGLShaderV;
begin
     Result := _ShaderV;
end;

function TGLMatery.GetShaderG :TGLShaderG;
begin
     Result := _ShaderG;
end;

function TGLMatery.GetShaderF :TGLShaderF;
begin
     Result := _ShaderF;
end;

function TGLMatery.GetEngine  :TGLEngine;
begin
     Result := _Engine;
end;

////////////////////////////////////////////////////////////////////////////////

function TGLMatery.GetOnBuilded :TProc;
begin
     Result := _OnBuilded;
end;

procedure TGLMatery.SetOnBuilded( const OnBuilded_:TProc );
begin
     _OnBuilded := OnBuilded_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLMatery.Create;
begin
     inherited;

     _OnBuilded := procedure begin end;

     _ShaderV := TGLShaderV.Create;
     _ShaderG := TGLShaderG.Create;
     _ShaderF := TGLShaderF.Create;
     _Engine  := TGLEngine .Create;

     with _ShaderV do
     begin
          OnCompiled := procedure
          begin
               _Engine.Link;
          end;
     end;

     with _ShaderG do
     begin
          OnCompiled := procedure
          begin
               _Engine.Link;
          end;
     end;

     with _ShaderF do
     begin
          OnCompiled := procedure
          begin
               _Engine.Link;
          end;
     end;

     with _Engine do
     begin
          with Shaders do
          begin
               Add( _ShaderV{Shad} );
               Add( _ShaderG{Shad} );
               Add( _ShaderF{Shad} );
          end;

          with Verters do
          begin
               Add( 0{BinP}, '_SenderPos'{Name}, 3{EleN}, GL_FLOAT{EleT} );
               Add( 1{BinP}, '_SenderNor'{Name}, 3{EleN}, GL_FLOAT{EleT} );
               Add( 2{BinP}, '_SenderTex'{Name}, 2{EleN}, GL_FLOAT{EleT} );
          end;

          with Unifors do
          begin
               Add( 0{BinP}, 'TViewerScal'{Name} );
               Add( 1{BinP}, 'TCameraProj'{Name} );
               Add( 2{BinP}, 'TCameraPose'{Name} );
               Add( 3{BinP}, 'TShaperPose'{Name} );
          end;

          with Imagers do
          begin
               Add( 0{BinP}, '_Imager'{Name} );
          end;

          with Framers do
          begin
               Add( 0{BinP}, '_ResultCol'{Name} );
          end;

          Onlinked := procedure
          begin
               _OnBuilded;
          end;
     end;
end;

destructor TGLMatery.Destroy;
begin
     _ShaderV.DisposeOf;
     _ShaderG.DisposeOf;
     _ShaderF.DisposeOf;
     _Engine .DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLMatery.Use;
begin
     _Engine.Use;
end;

procedure TGLMatery.Unuse;
begin
     _Engine.Unuse;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
