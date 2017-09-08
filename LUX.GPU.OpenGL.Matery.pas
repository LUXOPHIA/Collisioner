unit LUX.GPU.OpenGL.Matery;

interface //#################################################################### ■

uses System.SysUtils, System.UITypes,
     Winapi.OpenGL, Winapi.OpenGLext,
     LUX,
     LUX.GPU.OpenGL,
     LUX.GPU.OpenGL.Atom.Buffer.Unifor,
     LUX.GPU.OpenGL.Atom.Shader,
     LUX.GPU.OpenGL.Atom.Engine;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLMatery

     IGLMatery = interface
     ['{13071090-B024-474A-BDA2-AB604AD10B16}']
     {protected}
       ///// アクセス
       function GetEngine  :TGLEngine;
       function GetShaderV :TGLShaderV;
       function GetShaderF :TGLShaderF;
     {public}
       ///// プロパティ
       property Engine  :TGLEngine  read GetEngine ;
       property ShaderV :TGLShaderV read GetShaderV;
       property ShaderF :TGLShaderF read GetShaderF;
       ///// メソッド
       procedure Use;
       procedure Unuse;
     end;

     //-------------------------------------------------------------------------

     TGLMatery = class( TInterfacedObject, IGLMatery )
     private
     protected
       _Engine  :TGLEngine;
       _ShaderV :TGLShaderV;
       _ShaderF :TGLShaderF;
       ///// アクセス
       function GetEngine  :TGLEngine;
       function GetShaderV :TGLShaderV;
       function GetShaderF :TGLShaderF;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property Engine  :TGLEngine  read GetEngine ;
       property ShaderV :TGLShaderV read GetShaderV;
       property ShaderF :TGLShaderF read GetShaderF;
       ///// メソッド
       procedure Use; virtual;
       procedure Unuse; virtual;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLMateryG

     IGLMateryG = interface( IGLMatery )
     ['{6BF0D994-51C2-4884-9C64-4E02EF5B5226}']
     {protected}
       ///// アクセス
       function GetShaderG :TGLShaderG;
     {public}
       ///// プロパティ
       property ShaderG :TGLShaderG read GetShaderG;
     end;

     //-------------------------------------------------------------------------

     TGLMateryG = class( TGLMatery, IGLMateryG )
     private
     protected
       _ShaderG :TGLShaderG;
       ///// アクセス
       function GetShaderG :TGLShaderG;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property ShaderG :TGLShaderG read GetShaderG;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLMateryColor

     TGLMateryColor = class( TGLMatery )
     private
     protected
       _Color :TGLUnifor<TAlphaColorF>;
       ///// アクセス
       function GetColor :TAlphaColorF;
       procedure SetColor( const Color_:TAlphaColorF );
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property Color :TAlphaColorF read GetColor write SetColor;
       ///// メソッド
       procedure Use; override;
       procedure Unuse; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLMateryRGB

     TGLMateryRGB = class( TGLMatery )
     private
     protected
       _Ambient :TGLUnifor<TAlphaColorF>;
       ///// アクセス
       function GetAmbient :TAlphaColorF;
       procedure SetAmbient( const Ambient_:TAlphaColorF );
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property Ambient :TAlphaColorF read GetAmbient write SetAmbient;
       ///// メソッド
       procedure Use; override;
       procedure Unuse; override;
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

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLMatery.Create;
begin
     inherited;

     _Engine  := TGLEngine .Create;
     _ShaderV := TGLShaderV.Create;
     _ShaderF := TGLShaderF.Create;

     with _ShaderV do
     begin
          with Source do
          begin
               BeginUpdate;
                 Clear;

                 Add( '#version 430' );

                 Add( 'layout( std140 ) uniform TViewerScal{ layout( row_major ) mat4 _ViewerScal; };' );
                 Add( 'layout( std140 ) uniform TCameraProj{ layout( row_major ) mat4 _CameraProj; };' );
                 Add( 'layout( std140 ) uniform TCameraPose{ layout( row_major ) mat4 _CameraPose; };' );
                 Add( 'layout( std140 ) uniform TShaperPose{ layout( row_major ) mat4 _ShaperPose; };' );

                 Add( 'in vec4 _SenderPos;' );
                 Add( 'in vec4 _SenderNor;' );
                 Add( 'in vec2 _SenderTex;' );

                 Add( 'out TSenderVF' );
                 Add( '{' );
                 Add( '  vec4 Pos;' );
                 Add( '  vec4 Nor;' );
                 Add( '  vec2 Tex;' );
                 Add( '}' );
                 Add( '_Result;' );

                 Add( 'void main()' );
                 Add( '{' );
                 Add( '  _Result.Pos =                     _ShaperPose     * _SenderPos;' );
                 Add( '  _Result.Nor = transpose( inverse( _ShaperPose ) ) * _SenderNor;' );
                 Add( '  _Result.Tex =                                       _SenderTex;' );
                 Add( '  gl_Position = _ViewerScal * _CameraProj * inverse( _CameraPose ) * _Result.Pos;' );
                 Add( '}' );

               EndUpdate;
          end;

          Assert( Status, Errors.Text );
     end;

     with _Engine do
     begin
          Attach( _ShaderV{Shad} );
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
     end;
end;

destructor TGLMatery.Destroy;
begin
     _Engine .DisposeOf;
     _ShaderV.DisposeOf;
     _ShaderF.DisposeOf;

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

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLMateryG

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLMateryG.GetShaderG :TGLShaderG;
begin
     Result := _ShaderG;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLMateryG.Create;
begin
     inherited;

     _ShaderG := TGLShaderG.Create;

     with _Engine do
     begin
          Attach( _ShaderG{Shad} );
     end;
end;

destructor TGLMateryG.Destroy;
begin
     _ShaderG.DisposeOf;

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLMateryColor

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLMateryColor.GetColor :TAlphaColorF;
begin
     Result := _Color[ 0 ];
end;

procedure TGLMateryColor.SetColor( const Color_:TAlphaColorF );
begin
     _Color[ 0 ] := Color_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLMateryColor.Create;
begin
     inherited;

     _Color := TGLUnifor<TAlphaColorF>.Create( GL_STATIC_DRAW );
     _Color.Count := 1;

     with _ShaderV do
     begin
          with Source do
          begin
               BeginUpdate;
                 Clear;

                 Add( '#version 430' );

                 Add( 'layout( std140 ) uniform TViewerScal{ layout( row_major ) mat4 _ViewerScal; };' );
                 Add( 'layout( std140 ) uniform TCameraProj{ layout( row_major ) mat4 _CameraProj; };' );
                 Add( 'layout( std140 ) uniform TCameraPose{ layout( row_major ) mat4 _CameraPose; };' );
                 Add( 'layout( std140 ) uniform TShaperPose{ layout( row_major ) mat4 _ShaperPose; };' );

                 Add( 'in vec4 _SenderPos;' );

                 Add( 'out TSenderVF' );
                 Add( '{' );
                 Add( '  vec4 Pos;' );
                 Add( '}' );
                 Add( '_Result;' );

                 Add( 'void main()' );
                 Add( '{' );
                 Add( '  _Result.Pos = _ShaperPose * _SenderPos;' );
                 Add( '  gl_Position = _ViewerScal * _CameraProj * inverse( _CameraPose ) * _Result.Pos;' );
                 Add( '}' );

               EndUpdate;
          end;

          Assert( Status, Errors.Text );
     end;

     with _ShaderF do
     begin
          with Source do
          begin
               BeginUpdate;
                 Clear;

                 Add( '#version 430' );

                 Add( 'layout( std140 ) uniform TMateryCol{ vec4 _MateryCol; };' );

                 Add( 'in TSenderVF' );
                 Add( '{' );
                 Add( '  vec4 Pos;' );
                 Add( '}' );
                 Add( '_Sender;' );

                 Add( 'out vec4 _ResultCol;' );

                 Add( 'void main(){ _ResultCol = _MateryCol; }' );

               EndUpdate;
          end;

          Assert( Status, Errors.Text );
     end;

     with _Engine do
     begin
          with Verters do
          begin
               Del( 1{BinP} );
               Del( 2{BinP} );
          end;

          with Unifors do
          begin
               Add( 4{BinP}, 'TMateryCol'{Name} );
          end;
     end;

     Color := TAlphaColorF.Create( 1, 0, 0, 1 );
end;

destructor TGLMateryColor.Destroy;
begin
     _Color.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLMateryColor.Use;
begin
     inherited;

     _Color.Use( 4 );
end;

procedure TGLMateryColor.Unuse;
begin
     _Color.Unuse( 4 );

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLMateryRGB

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLMateryRGB.GetAmbient :TAlphaColorF;
begin
     Result := _Ambient[ 0 ];
end;

procedure TGLMateryRGB.SetAmbient( const Ambient_:TAlphaColorF );
begin
     _Ambient[ 0 ] := Ambient_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLMateryRGB.Create;
begin
     inherited;

     _Ambient := TGLUnifor<TAlphaColorF>.Create( GL_STATIC_DRAW );
     _Ambient.Count := 1;

     with _ShaderV do
     begin
          with Source do
          begin
               BeginUpdate;
                 Clear;

                 Add( '#version 430' );

                 Add( 'layout( std140 ) uniform TViewerScal{ layout( row_major ) mat4 _ViewerScal; };' );
                 Add( 'layout( std140 ) uniform TCameraProj{ layout( row_major ) mat4 _CameraProj; };' );
                 Add( 'layout( std140 ) uniform TCameraPose{ layout( row_major ) mat4 _CameraPose; };' );
                 Add( 'layout( std140 ) uniform TShaperPose{ layout( row_major ) mat4 _ShaperPose; };' );

                 Add( 'in vec4 _SenderPos;' );
                 Add( 'in vec4 _SenderNor;' );

                 Add( 'out TSenderVF' );
                 Add( '{' );
                 Add( '  vec4 Pos;' );
                 Add( '  vec4 Nor;' );
                 Add( '}' );
                 Add( '_Result;' );

                 Add( 'void main()' );
                 Add( '{' );
                 Add( '  _Result.Pos =                     _ShaperPose     * _SenderPos;' );
                 Add( '  _Result.Nor = transpose( inverse( _ShaperPose ) ) * _SenderNor;' );
                 Add( '  gl_Position = _ViewerScal * _CameraProj * inverse( _CameraPose ) * _Result.Pos;' );
                 Add( '}' );

               EndUpdate;
          end;

          Assert( Status, Errors.Text );
     end;

     with _ShaderF do
     begin
          with Source do
          begin
               BeginUpdate;
                 Clear;

                 Add( '#version 430' );

                 Add( 'layout( std140 ) uniform TAmbient{ vec4 _Ambient; };' );

                 Add( 'in TSenderVF' );
                 Add( '{' );
                 Add( '  vec4 Pos;' );
                 Add( '  vec4 Nor;' );
                 Add( '}' );
                 Add( '_Sender;' );

                 Add( 'out vec4 _ResultCol;' );

                 Add( 'void main()' );
                 Add( '{' );
                 Add( '  _ResultCol = vec4( _Ambient.rgb + ( 1 + normalize( _Sender.Nor.xyz ) ) / 2, 1 );' );
                 Add( '}' );

               EndUpdate;
          end;

          Assert( Status, Errors.Text );
     end;

     with _Engine do
     begin
          with Verters do
          begin
               Del( 2{BinP} );
          end;

          with Unifors do
          begin
               Add( 4{BinP}, 'TAmbient'{Name} );
          end;
     end;

     Ambient := TAlphaColorF.Create( 0, 0, 0 );
end;

destructor TGLMateryRGB.Destroy;
begin
     inherited;

     _Ambient.DisposeOf;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLMateryRGB.Use;
begin
     inherited;

     _Ambient.Use( 4 );
end;

procedure TGLMateryRGB.Unuse;
begin
     _Ambient.Unuse( 4 );

     inherited;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
