unit LUX.GPU.OpenGL.Matery.Preset;

interface //#################################################################### ■

uses System.SysUtils, System.UITypes,
     Winapi.OpenGL, Winapi.OpenGLext,
     LUX,
     LUX.GPU.OpenGL,
     LUX.GPU.OpenGL.Atom.Buffer.Unifor,
     LUX.GPU.OpenGL.Matery,
     LUX.GPU.OpenGL.Matery.Imager.Preset;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

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

     TGLMateryRGB = class( TGLMateryNor )
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

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLMateryPlastic

     TGLMateryPlastic = class( TGLMateryImag )
     private
     protected
       _Ambient :TGLUnifor<TAlphaColorF>;
       _Diffuse :TGLUnifor<TAlphaColorF>;
       _RefI    :TGLUnifor<Single>;
       ///// アクセス
       function GetAmbient :TAlphaColorF;
       procedure SetAmbient( const Ambient_:TAlphaColorF );
       function GetDiffuse :TAlphaColorF;
       procedure SetDiffuse( const Diffuse_:TAlphaColorF );
       function GetRefI :Single;
       procedure SetRefI( const RefI_:Single );
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property Ambient :TAlphaColorF read GetAmbient write SetAmbient;
       property Diffuse :TAlphaColorF read GetDiffuse write SetDiffuse;
       property RefI    :Single       read GetRefI    write SetRefI   ;
       ///// メソッド
       procedure Use; override;
       procedure Unuse; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLMateryMirror

     TGLMateryMirror = class( TGLMateryImag )
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

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLMateryGlass

     TGLMateryGlass = class( TGLMateryImag )
     private
     protected
       _RefI :TGLUnifor<Single>;
       ///// アクセス
       function GetRefI :Single;
       procedure SetRefI( const RefI_:Single );
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property RefI :Single read GetRefI write SetRefI;
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

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLMateryPlastic

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLMateryPlastic.GetAmbient :TAlphaColorF;
begin
     Result := _Ambient[ 0 ];
end;

procedure TGLMateryPlastic.SetAmbient( const Ambient_:TAlphaColorF );
begin
     _Ambient[ 0 ] := Ambient_;
end;

//------------------------------------------------------------------------------

function TGLMateryPlastic.GetDiffuse :TAlphaColorF;
begin
     Result := _Diffuse[ 0 ];
end;

procedure TGLMateryPlastic.SetDiffuse( const Diffuse_:TAlphaColorF );
begin
     _Diffuse[ 0 ] := Diffuse_;
end;

//------------------------------------------------------------------------------

function TGLMateryPlastic.GetRefI :Single;
begin
     Result := _RefI[ 0 ];
end;

procedure TGLMateryPlastic.SetRefI( const RefI_:Single );
begin
     _RefI[ 0 ] := RefI_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLMateryPlastic.Create;
begin
     inherited;

     _Ambient := TGLUnifor<TAlphaColorF>.Create( GL_STATIC_DRAW );
     _Ambient.Count := 1;
     _Diffuse := TGLUnifor<TAlphaColorF>.Create( GL_STATIC_DRAW );
     _Diffuse.Count := 1;
     _RefI    := TGLUnifor<Single>.Create( GL_STATIC_DRAW );
     _RefI   .Count := 1;

     with _ShaderF do
     begin
          with Source do
          begin
               BeginUpdate;
                 Clear;

                 Add( '#version 430' );

                 Add( 'const float Pi  = 3.141592653589793;' );
                 Add( 'const float Pi2 = Pi * 2.0;' );

                 Add( 'vec2 VecToSky( vec4 Vector_ )' );
                 Add( '{' );
                 Add( '    vec2 Result;' );

                 Add( '    Result.x = ( Pi - atan( -Vector_.x, -Vector_.z ) ) / Pi2;' );
                 Add( '    Result.y =        acos(  Vector_.y             )   / Pi ;' );

                 Add( '    return Result;' );
                 Add( '}' );

                 Add( 'float Pow2( float X_ )' );
                 Add( '{' );
                 Add( '    return X_ * X_;' );
                 Add( '}' );

                 Add( 'float Fresnel( vec4 EyeVec_, vec4 NorVec_, float RefI_ )' );
                 Add( '{' );
                 Add( '    float N = Pow2( RefI_ );' );
                 Add( '    float C = dot( EyeVec_, NorVec_ );' );
                 Add( '    float G = sqrt( N + Pow2( C ) - 1 );' );
                 Add( '    float NC = N * C;' );
                 Add( '    return ( Pow2( (  C - G ) / (  C + G ) )' );
                 Add( '           + Pow2( ( NC - G ) / ( NC + G ) ) ) / 2;' );
                 Add( '}' );

                 Add( 'layout( std140 ) uniform TViewerScal{ layout( row_major ) mat4 _ViewerScal; };' );
                 Add( 'layout( std140 ) uniform TCameraProj{ layout( row_major ) mat4 _CameraProj; };' );
                 Add( 'layout( std140 ) uniform TCameraPose{ layout( row_major ) mat4 _CameraPose; };' );
                 Add( 'layout( std140 ) uniform TShaperPose{ layout( row_major ) mat4 _ShaperPose; };' );

                 Add( 'uniform sampler2D _Imager;' );

                 Add( 'layout( std140 ) uniform TAmbient{ vec4  _Ambient; };' );
                 Add( 'layout( std140 ) uniform TDiffuse{ vec4  _Diffuse; };' );
                 Add( 'layout( std140 ) uniform TRefI   { float _RefI;    };' );

                 Add( 'in TSenderVF' );
                 Add( '{' );
                 Add( '  vec4 Pos;' );
                 Add( '  vec4 Nor;' );
                 Add( '  vec4 Tex;' );
                 Add( '}' );
                 Add( '_Sender;' );

                 Add( 'out vec4 _ResultCol;' );

                 Add( 'void main()' );
                 Add( '{' );
                 Add( '  vec4 C = _CameraPose[ 3 ];' );
                 Add( '  vec4 V = normalize( _Sender.Pos - C );' );
                 Add( '  vec4 N = normalize( _Sender.Nor );' );
                 Add( '  vec4 R = reflect( V, N );' );

                 Add( '  vec4 Cd = _Diffuse * N.y;' );
                 Add( '  vec4 Cr = texture( _Imager, VecToSky( R ) );' );

                 Add( 'float F = clamp( Fresnel( -V, N, _RefI ), 0, 1 );' );

                 Add( '  _ResultCol = _Ambient + ( Cr - Cd ) * F + Cd;' );
                 Add( '  _ResultCol.a = 1;' );
                 Add( '}' );

               EndUpdate;
          end;

          Assert( Status, Errors.Text );
     end;

     with _Engine do
     begin
          with Unifors do
          begin
               Add( 4{BinP}, 'TAmbient'{Name} );
               Add( 5{BinP}, 'TDiffuse'{Name} );
               Add( 6{BinP}, 'TRefI'{Name} );
          end;
     end;

     Ambient := TAlphaColorF.Create( 0.1, 0.1, 0.1 );
     Diffuse := TAlphaColorF.Create( 1, 1, 1 );
     RefI    := 1.5;
end;

destructor TGLMateryPlastic.Destroy;
begin
     inherited;

     _Ambient.DisposeOf;
     _Diffuse.DisposeOf;
     _RefI   .DisposeOf;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLMateryPlastic.Use;
begin
     inherited;

     _Ambient.Use( 4 );
     _Diffuse.Use( 5 );
     _RefI   .Use( 6 );
end;

procedure TGLMateryPlastic.Unuse;
begin
     _Ambient.Unuse( 4 );
     _Diffuse.Unuse( 5 );
     _RefI   .Unuse( 6 );

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLMateryMirror

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLMateryMirror.GetColor :TAlphaColorF;
begin
     Result := _Color[ 0 ];
end;

procedure TGLMateryMirror.SetColor( const Color_:TAlphaColorF );
begin
     _Color[ 0 ] := Color_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLMateryMirror.Create;
begin
     inherited;

     _Color := TGLUnifor<TAlphaColorF>.Create( GL_STATIC_DRAW );
     _Color.Count := 1;

     with _ShaderF do
     begin
          with Source do
          begin
               BeginUpdate;
                 Clear;

                 Add( '#version 430' );

                 Add( 'const float Pi  = 3.141592653589793;' );
                 Add( 'const float Pi2 = Pi * 2.0;' );

                 Add( 'vec2 VecToSky( vec4 Vector_ )' );
                 Add( '{' );
                 Add( '    vec2 Result;' );

                 Add( '    Result.x = ( Pi - atan( -Vector_.x, -Vector_.z ) ) / Pi2;' );
                 Add( '    Result.y =        acos(  Vector_.y             )   / Pi ;' );

                 Add( '    return Result;' );
                 Add( '}' );

                 Add( 'layout( std140 ) uniform TViewerScal{ layout( row_major ) mat4 _ViewerScal; };' );
                 Add( 'layout( std140 ) uniform TCameraProj{ layout( row_major ) mat4 _CameraProj; };' );
                 Add( 'layout( std140 ) uniform TCameraPose{ layout( row_major ) mat4 _CameraPose; };' );
                 Add( 'layout( std140 ) uniform TShaperPose{ layout( row_major ) mat4 _ShaperPose; };' );

                 Add( 'uniform sampler2D _Imager;' );

                 Add( 'layout( std140 ) uniform TColor{ vec4 _Color; };' );

                 Add( 'in TSenderVF' );
                 Add( '{' );
                 Add( '  vec4 Pos;' );
                 Add( '  vec4 Nor;' );
                 Add( '  vec4 Tex;' );
                 Add( '}' );
                 Add( '_Sender;' );

                 Add( 'out vec4 _ResultCol;' );

                 Add( 'void main()' );
                 Add( '{' );
                 Add( '  vec4 C = _CameraPose[ 3 ];' );
                 Add( '  vec4 V = normalize( _Sender.Pos - C );' );
                 Add( '  vec4 N = normalize( _Sender.Nor );' );
                 Add( '  vec4 R = reflect( V, N );' );
                 Add( '  _ResultCol = _Color * texture( _Imager, VecToSky( R ) );' );
                 Add( '}' );

               EndUpdate;
          end;

          Assert( Status, Errors.Text );
     end;

     with _Engine do
     begin
          with Unifors do
          begin
               Add( 4{BinP}, 'TColor'{Name} );
          end;
     end;

     Color := TAlphaColorF.Create( 1, 1, 1 );
end;

destructor TGLMateryMirror.Destroy;
begin
     inherited;

     _Color.DisposeOf;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLMateryMirror.Use;
begin
     inherited;

     _Color.Use( 4 );
end;

procedure TGLMateryMirror.Unuse;
begin
     _Color.Unuse( 4 );

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLMateryGlass

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLMateryGlass.GetRefI :Single;
begin
     Result := _RefI[ 0 ];
end;

procedure TGLMateryGlass.SetRefI( const RefI_:Single );
begin
     _RefI[ 0 ] := RefI_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLMateryGlass.Create;
begin
     inherited;

     _RefI := TGLUnifor<Single>.Create( GL_STATIC_DRAW );
     _RefI.Count := 1;

     with _ShaderF do
     begin
          with Source do
          begin
               BeginUpdate;
                 Clear;

                 Add( '#version 430' );

                 Add( 'const float Pi  = 3.141592653589793;' );
                 Add( 'const float Pi2 = Pi * 2.0;' );

                 Add( 'vec2 VecToSky( vec4 Vector_ )' );
                 Add( '{' );
                 Add( '    vec2 Result;' );

                 Add( '    Result.x = ( Pi - atan( -Vector_.x, -Vector_.z ) ) / Pi2;' );
                 Add( '    Result.y =        acos(  Vector_.y             )   / Pi ;' );

                 Add( '    return Result;' );
                 Add( '}' );

                 Add( 'float Pow2( float X_ )' );
                 Add( '{' );
                 Add( '    return X_ * X_;' );
                 Add( '}' );

                 Add( 'float Fresnel( vec4 EyeVec_, vec4 NorVec_, float RefI_ )' );
                 Add( '{' );
                 Add( '    float N = Pow2( RefI_ );' );
                 Add( '    float C = dot( EyeVec_, NorVec_ );' );
                 Add( '    float G = sqrt( N + Pow2( C ) - 1 );' );
                 Add( '    float NC = N * C;' );
                 Add( '    return ( Pow2( (  C - G ) / (  C + G ) )' );
                 Add( '           + Pow2( ( NC - G ) / ( NC + G ) ) ) / 2;' );
                 Add( '}' );

                 Add( 'layout( std140 ) uniform TViewerScal{ layout( row_major ) mat4 _ViewerScal; };' );
                 Add( 'layout( std140 ) uniform TCameraProj{ layout( row_major ) mat4 _CameraProj; };' );
                 Add( 'layout( std140 ) uniform TCameraPose{ layout( row_major ) mat4 _CameraPose; };' );
                 Add( 'layout( std140 ) uniform TShaperPose{ layout( row_major ) mat4 _ShaperPose; };' );

                 Add( 'uniform sampler2D _Imager;' );

                 Add( 'layout( std140 ) uniform TRefI{ float _RefI; };' );

                 Add( 'in TSenderVF' );
                 Add( '{' );
                 Add( '  vec4 Pos;' );
                 Add( '  vec4 Nor;' );
                 Add( '  vec4 Tex;' );
                 Add( '}' );
                 Add( '_Sender;' );

                 Add( 'out vec4 _ResultCol;' );

                 Add( 'void main()' );
                 Add( '{' );
                 Add( '  vec4 C = _CameraPose[ 3 ];' );
                 Add( '  vec4 V = normalize( _Sender.Pos - C );' );
                 Add( '  vec4 N = normalize( _Sender.Nor );' );
                 Add( '  vec4 Re = reflect( V, N );' );
                 Add( '  vec4 Ra = refract( V, N, 1.0/_RefI );' );

                 Add( '  vec4 Ce = texture( _Imager, VecToSky( Re ) );' );
                 Add( '  vec4 Ca = texture( _Imager, VecToSky( Ra ) );' );

                 Add( 'float F = clamp( Fresnel( -V, N, _RefI ), 0, 1 );' );

                 Add( '  _ResultCol = ( Ce - Ca ) * F + Ca;' );
                 Add( '  _ResultCol.a = 1;' );
                 Add( '}' );

               EndUpdate;
          end;

          Assert( Status, Errors.Text );
     end;

     with _Engine do
     begin
          with Unifors do
          begin
               Add( 4{BinP}, 'TRefI'{Name} );
          end;
     end;

     RefI := 1.5;
end;

destructor TGLMateryGlass.Destroy;
begin
     inherited;

     _RefI.DisposeOf;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLMateryGlass.Use;
begin
     inherited;

     _RefI.Use( 4 );
end;

procedure TGLMateryGlass.Unuse;
begin
     _RefI.Unuse( 4 );

     inherited;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
