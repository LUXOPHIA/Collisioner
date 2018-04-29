unit LUX.GPU.OpenGL.Matery.Textur.Preset;

interface //#################################################################### ■

uses Winapi.OpenGL, Winapi.OpenGLext,
     LUX,
     LUX.GPU.OpenGL,
     LUX.GPU.OpenGL.Atom.Textur,
     LUX.GPU.OpenGL.Atom.Textur.D2.Preset,
     LUX.GPU.OpenGL.Matery;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLMateryImag

     IGLMateryImag = interface( IGLMatery )
     ['{00978DAD-C3D0-4B55-BD80-935C01F19066}']
     {protected}
       ///// アクセス
       function GetTextur :TGLCelTex2D_TAlphaColorF;
     {public}
       ///// プロパティ
       property Textur :TGLCelTex2D_TAlphaColorF read GetTextur;
       ///// メソッド
       procedure Use;
       procedure Unuse;
     end;

     //-------------------------------------------------------------------------

     TGLMateryImag = class( TGLMateryNorTex, IGLMateryImag )
     private
     protected
       _Textur :TGLCelTex2D_TAlphaColorF;
       ///// アクセス
       function GetTextur :TGLCelTex2D_TAlphaColorF;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property Textur :TGLCelTex2D_TAlphaColorF read GetTextur;
       ///// メソッド
       procedure Use; override;
       procedure Unuse; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLMateryImagG

     TGLMateryImagG = class( TGLMateryNorTexG, IGLMateryImag )
     private
     protected
       _Textur :TGLCelTex2D_TAlphaColorF;
       ///// アクセス
       function GetTextur :TGLCelTex2D_TAlphaColorF;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property Textur :TGLCelTex2D_TAlphaColorF read GetTextur;
       ///// メソッド
       procedure Use; override;
       procedure Unuse; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLMateryBB

     TGLMateryBB = class( TGLMateryImag )
     private
     protected
       ///// アクセス
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
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

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLMateryImag

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

function TGLMateryImag.GetTextur :TGLCelTex2D_TAlphaColorF;
begin
     Result := _Textur;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLMateryImag.Create;
begin
     inherited;

     _Textur := TGLCelTex2D_TAlphaColorF.Create;
end;

destructor TGLMateryImag.Destroy;
begin
     _Textur.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLMateryImag.Use;
begin
     inherited;

     _Textur.Use( 0 );
end;

procedure TGLMateryImag.Unuse;
begin
     _Textur.Unuse( 0 );

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLMateryImagG

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

function TGLMateryImagG.GetTextur :TGLCelTex2D_TAlphaColorF;
begin
     Result := _Textur;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLMateryImagG.Create;
begin
     inherited;

     _Textur := TGLCelTex2D_TAlphaColorF.Create;
end;

destructor TGLMateryImagG.Destroy;
begin
     _Textur.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLMateryImagG.Use;
begin
     inherited;

     _Textur.Use( 0 );
end;

procedure TGLMateryImagG.Unuse;
begin
     _Textur.Unuse( 0 );

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLMateryBB

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLMateryBB.Create;
begin
     inherited;

     with _ShaderV.Source do
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

            Add( '  mat4 M;' );
            Add( '  M[ 3 ] = _ShaperPose[ 3 ];' );
            Add( '  M[ 2 ] = normalize( _CameraPose[ 3 ] - _ShaperPose[ 3 ] );' );
            Add( '  M[ 1 ] = vec4( normalize( cross( M[ 2 ].xyz, _CameraPose[ 0 ].xyz ) ), 0 );' );
            Add( '  M[ 0 ] = vec4( normalize( cross( M[ 1 ].xyz, M[ 2 ].xyz ) ), 0 );' );

            Add( '  _Result.Pos =                     M     * _SenderPos;' );
            Add( '  _Result.Nor = transpose( inverse( _ShaperPose ) ) * _SenderNor;' );
            Add( '  _Result.Tex =                                       _SenderTex;' );
            Add( '  gl_Position = _ViewerScal * _CameraProj * inverse( _CameraPose ) * _Result.Pos;' );
            Add( '}' );

          EndUpdate;
     end;

     Assert( _ShaderV.Status, _ShaderV.Errors.Text );

     with _ShaderF.Source do
     begin
          BeginUpdate;
            Clear;

            Add( '#version 430' );

            Add( 'uniform sampler2D _Textur;' );

            Add( 'in TSenderVF' );
            Add( '{' );
            Add( '  vec4 Pos;' );
            Add( '  vec4 Nor;' );
            Add( '  vec2 Tex;' );
            Add( '}' );
            Add( '_Sender;' );

            Add( 'out vec4 _ResultCol;' );

            Add( 'void main(){' );
            Add( '  _ResultCol = texture( _Textur, _Sender.Tex );' );
            Add( '  if ( _ResultCol.r == 0 ) discard;' );
            Add( '}' );

          EndUpdate;
     end;

     Assert( _ShaderF.Status, _ShaderF.Errors.Text );
end;

destructor TGLMateryBB.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLMateryBB.Use;
begin
     inherited;

end;

procedure TGLMateryBB.Unuse;
begin

     inherited;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
