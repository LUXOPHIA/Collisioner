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
       function GetShaderF :TGLShaderF;
       function GetEngine  :TGLEngine;
       /////
       function GetOnBuilded :TProc;
       procedure SetOnBuilded( const OnBuilded_:TProc );
     {public}
       ///// プロパティ
       property ShaderV :TGLShaderV read GetShaderV;
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
       _ShaderF :TGLShaderF;
       _Engine  :TGLEngine;
       ///// イベント
       _OnBuilded :TProc;
       ///// アクセス
       function GetShaderV :TGLShaderV;
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
     _ShaderF := TGLShaderF.Create;
     _Engine  := TGLEngine .Create;

     with _ShaderV do
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
               Add( _ShaderF{Shad} );
          end;

          with VerBufs do
          begin
               Add( 0{BinP}, '_Vertex_Pos'{Name}, 3{EleN}, GL_FLOAT{EleT} );
               Add( 1{BinP}, '_Vertex_Nor'{Name}, 3{EleN}, GL_FLOAT{EleT} );
               Add( 2{BinP}, '_Vertex_Tex'{Name}, 2{EleN}, GL_FLOAT{EleT} );
          end;

          with UniBufs do
          begin
               Add( 2{BinP}, 'TViewerDat'{Name} );
               Add( 0{BinP}, 'TCameraDat'{Name} );
               Add( 3{BinP}, 'TCameraPose'{Name} );
               Add( 1{BinP}, 'TShaperDat'{Name} );
          end;

          with Imagers do
          begin
               Add( 0{BinP}, '_Imager'{Name} );
          end;

          with Framers do
          begin
               Add( 0{BinP}, '_Frag_Col'{Name} );
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
