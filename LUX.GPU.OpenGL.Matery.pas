unit LUX.GPU.OpenGL.Matery;

interface //#################################################################### ■

uses System.SysUtils,
     Winapi.OpenGL, Winapi.OpenGLext,
     LUX,
     LUX.GPU.OpenGL,
     LUX.GPU.OpenGL.Atom.Shader,
     LUX.GPU.OpenGL.Atom.Progra;

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
       function GetProgra  :TGLProgra;
       /////
       function GetOnBuilded :TProc;
       procedure SetOnBuilded( const OnBuilded_:TProc );
     {public}
       ///// プロパティ
       property ShaderV :TGLShaderV read GetShaderV;
       property ShaderG :TGLShaderG read GetShaderG;
       property ShaderF :TGLShaderF read GetShaderF;
       property Progra  :TGLProgra  read GetProgra ;
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
       _Progra  :TGLProgra;
       ///// イベント
       _OnBuilded :TProc;
       ///// アクセス
       function GetShaderV :TGLShaderV;
       function GetShaderG :TGLShaderG;
       function GetShaderF :TGLShaderF;
       function GetProgra  :TGLProgra;
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
       property Progra  :TGLProgra  read GetProgra ;
       ///// イベント
       property OnBuilded :TProc read GetOnBuilded write SetOnBuilded;
       ///// メソッド
       procedure Use; virtual;
       procedure Unuse; virtual;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLMateryColor

     TGLMateryColor = class( TInterfacedObject, IGLMatery )
     private
     protected
       _ShaderV :TGLShaderV;
       _ShaderG :TGLShaderG;
       _ShaderF :TGLShaderF;
       _Progra  :TGLProgra;
       ///// イベント
       _OnBuilded :TProc;
       ///// アクセス
       function GetShaderV :TGLShaderV;
       function GetShaderG :TGLShaderG;
       function GetShaderF :TGLShaderF;
       function GetProgra  :TGLProgra;
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
       property Progra  :TGLProgra  read GetProgra ;
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

function TGLMatery.GetProgra  :TGLProgra;
begin
     Result := _Progra;
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
     _Progra  := TGLProgra .Create;

     with _ShaderV do
     begin
          OnCompiled := procedure
          begin
               _Progra.Link;
          end;
     end;

     with _ShaderG do
     begin
          OnCompiled := procedure
          begin
               _Progra.Link;
          end;
     end;

     with _ShaderF do
     begin
          OnCompiled := procedure
          begin
               _Progra.Link;
          end;
     end;

     with _Progra do
     begin
          Attach( _ShaderV{Shad} );
          Attach( _ShaderG{Shad} );
          Attach( _ShaderF{Shad} );

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
     _Progra .DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLMatery.Use;
begin
     _Progra.Use;
end;

procedure TGLMatery.Unuse;
begin
     _Progra.Unuse;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLMateryColor

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLMateryColor.GetShaderV :TGLShaderV;
begin
     Result := _ShaderV;
end;

function TGLMateryColor.GetShaderG :TGLShaderG;
begin
     Result := _ShaderG;
end;

function TGLMateryColor.GetShaderF :TGLShaderF;
begin
     Result := _ShaderF;
end;

function TGLMateryColor.GetProgra  :TGLProgra;
begin
     Result := _Progra;
end;

////////////////////////////////////////////////////////////////////////////////

function TGLMateryColor.GetOnBuilded :TProc;
begin
     Result := _OnBuilded;
end;

procedure TGLMateryColor.SetOnBuilded( const OnBuilded_:TProc );
begin
     _OnBuilded := OnBuilded_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLMateryColor.Create;
begin
     inherited;

     _OnBuilded := procedure begin end;

     _ShaderV := TGLShaderV.Create;
     _ShaderF := TGLShaderF.Create;
     _Progra  := TGLProgra .Create;

     with _ShaderV do
     begin
          OnCompiled := procedure
          begin
               _Progra.Link;
          end;
     end;

     with _ShaderF do
     begin
          OnCompiled := procedure
          begin
               _Progra.Link;
          end;
     end;

     with _Progra do
     begin
          Attach( _ShaderV{Shad} );
          Attach( _ShaderF{Shad} );

          with Verters do
          begin
               Add( 0{BinP}, '_SenderPos'{Name}, 3{EleN}, GL_FLOAT{EleT} );
          end;

          with Unifors do
          begin
               Add( 0{BinP}, 'TViewerScal'{Name} );
               Add( 1{BinP}, 'TCameraProj'{Name} );
               Add( 2{BinP}, 'TCameraPose'{Name} );
               Add( 3{BinP}, 'TShaperPose'{Name} );
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

     with _ShaderV.Source do
     begin
          BeginUpdate;
          Add( '#version 430' );
          Add( 'layout( std140 ) uniform TViewerScal{ layout( row_major ) mat4 _ViewerScal; };' );
          Add( 'layout( std140 ) uniform TCameraProj{ layout( row_major ) mat4 _CameraProj; };' );
          Add( 'layout( std140 ) uniform TCameraPose{ layout( row_major ) mat4 _CameraPose; };' );
          Add( 'layout( std140 ) uniform TShaperPose{ layout( row_major ) mat4 _ShaperPose; };' );
          Add( 'in vec4 _SenderPos;' );
          Add( 'void main(){ gl_Position = _ViewerScal * _CameraProj * inverse( _CameraPose ) * _ShaperPose * _SenderPos; }' );
          EndUpdate;
     end;

     with _ShaderF.Source do
     begin
          BeginUpdate;
          Add( '#version 430' );
          Add( 'out vec4 _ResultCol;' );
          Add( 'void main(){ _ResultCol = vec4( 1, 0, 0, 1 ); }' );
          EndUpdate;
     end;
end;

destructor TGLMateryColor.Destroy;
begin
     _ShaderV.DisposeOf;
     _ShaderF.DisposeOf;
     _Progra .DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLMateryColor.Use;
begin
     _Progra.Use;
end;

procedure TGLMateryColor.Unuse;
begin
     _Progra.Unuse;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
