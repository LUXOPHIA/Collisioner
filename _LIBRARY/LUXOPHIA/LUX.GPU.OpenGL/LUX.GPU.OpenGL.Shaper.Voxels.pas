unit LUX.GPU.OpenGL.Shaper.Voxels;

interface //#################################################################### ■

uses System.SysUtils, System.UITypes,
     LUX, LUX.D1, LUX.D2, LUX.D3, LUX.M4,
     LUX.Geometry.D3,
     LUX.GPU.OpenGL,
     LUX.GPU.OpenGL.Atom.Buffer.Unifor,
     LUX.GPU.OpenGL.Scener,
     LUX.GPU.OpenGL.Camera,
     LUX.GPU.OpenGL.Matery,
     LUX.GPU.OpenGL.Shaper,
     LUX.GPU.OpenGL.Shaper.Preset;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLMateryVoxels

     TGLMateryVoxels = class( TGLMateryG )
     private
     protected
       ///// アクセス
     public
       constructor Create;
       destructor Destroy; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaperVoxels

     TGLShaperVoxels = class( TGLShaperPoin )
     private
     protected
       _Size :TGLUnifor<Single>;
       _Color :TGLUnifor<TAlphaColorF>;
       ///// アクセス
       function GetCount :Integer;
       function GetSizeX :Single;
       procedure SetSizeX( const SizeX_:Single );
       function GetSizeY :Single;
       procedure SetSizeY( const SizeY_:Single );
       function GetSizeZ :Single;
       procedure SetSizeZ( const SizeZ_:Single );
       function GetColor :TAlphaColorF;
       procedure SetColor( const Color_:TAlphaColorF );
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       property Count :Integer      read GetCount               ;
       property SizeX :Single       read GetSizeX write SetSizeX;
       property SizeY :Single       read GetSizeY write SetSizeY;
       property SizeZ :Single       read GetSizeZ write SetSizeZ;
       property Color :TAlphaColorF read GetColor write SetColor;
       ///// メソッド
       procedure BeginDraw; override;
       procedure EndDraw; override;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.Math,
     Winapi.OpenGL, Winapi.OpenGLext,
     LUX.GPU.OpenGL.Matery.Preset;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLMateryVoxels

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLMateryVoxels.Create;
begin
     inherited;

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

                 Add( 'out TSenderVG' );
                 Add( '{' );
                 Add( '  vec4 Pos;' );
                 Add( '}' );
                 Add( '_Result;' );

                 Add( 'void main()' );
                 Add( '{' );
                 Add( '  _Result.Pos = _SenderPos;' );
                 Add( '}' );

               EndUpdate;
          end;

          Assert( Status, Errors.Text );
     end;

     with _ShaderG do
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

                 Add( 'layout( std140 ) uniform TSize{ vec3 _Size; };' );

                 Add( 'layout( points ) in;' );
                 Add( 'in TSenderVG' );
                 Add( '{' );
                 Add( '  vec4 Pos;' );
                 Add( '}' );
                 Add( '_Sender[ 1 ];' );

                 Add( 'layout( line_strip, max_vertices = 24 ) out;' );
                 Add( 'out TSenderGF' );
                 Add( '{' );
                 Add( '  vec4 Pos;' );
                 Add( '}' );
                 Add( '_Result;' );

                 Add( 'void AddPoin( vec4 Poin_ )' );
                 Add( '{' );
                 Add( '  _Result.Pos = Poin_;' );
                 Add( '  gl_Position = _ViewerScal * _CameraProj * inverse( _CameraPose ) * _Result.Pos;' );
                 Add( '  EmitVertex();' );
                 Add( '}' );

                 Add( 'void AddLine( vec4 Pos1_, vec4 Pos2_ )' );
                 Add( '{' );
                 Add( '  AddPoin( Pos1_ );' );
                 Add( '  AddPoin( Pos2_ );' );
                 Add( '  EndPrimitive();' );
                 Add( '}' );

                 Add( 'void main()' );
                 Add( '{' );
                 Add( '  vec4 C = _Sender[ 0 ].Pos * vec4( _Size, 1 );' );

                 Add( '  vec4 P000 = _ShaperPose * ( C + vec4(       0,       0,       0, 0 ) );' );
                 Add( '  vec4 P001 = _ShaperPose * ( C + vec4( _Size.x,       0,       0, 0 ) );' );
                 Add( '  vec4 P010 = _ShaperPose * ( C + vec4(       0, _Size.y,       0, 0 ) );' );
                 Add( '  vec4 P011 = _ShaperPose * ( C + vec4( _Size.x, _Size.y,       0, 0 ) );' );
                 Add( '  vec4 P100 = _ShaperPose * ( C + vec4(       0,       0, _Size.z, 0 ) );' );
                 Add( '  vec4 P101 = _ShaperPose * ( C + vec4( _Size.x,       0, _Size.z, 0 ) );' );
                 Add( '  vec4 P110 = _ShaperPose * ( C + vec4(       0, _Size.y, _Size.z, 0 ) );' );
                 Add( '  vec4 P111 = _ShaperPose * ( C + vec4( _Size.x, _Size.y, _Size.z, 0 ) );' );

                 Add( '  AddLine( P000, P001 );' );
                 Add( '  AddLine( P010, P011 );' );
                 Add( '  AddLine( P100, P101 );' );
                 Add( '  AddLine( P110, P111 );' );

                 Add( '  AddLine( P000, P010 );' );
                 Add( '  AddLine( P100, P110 );' );
                 Add( '  AddLine( P001, P011 );' );
                 Add( '  AddLine( P101, P111 );' );

                 Add( '  AddLine( P000, P100 );' );
                 Add( '  AddLine( P001, P101 );' );
                 Add( '  AddLine( P010, P110 );' );
                 Add( '  AddLine( P011, P111 );' );

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

                 Add( 'layout( std140 ) uniform TViewerScal{ layout( row_major ) mat4 _ViewerScal; };' );
                 Add( 'layout( std140 ) uniform TCameraProj{ layout( row_major ) mat4 _CameraProj; };' );
                 Add( 'layout( std140 ) uniform TCameraPose{ layout( row_major ) mat4 _CameraPose; };' );
                 Add( 'layout( std140 ) uniform TShaperPose{ layout( row_major ) mat4 _ShaperPose; };' );

                 Add( 'layout( std140 ) uniform TColor{ vec4 _Color; };' );

                 Add( 'in TSenderGF' );
                 Add( '{' );
                 Add( '  vec4 Pos;' );
                 Add( '}' );
                 Add( '_Sender;' );

                 Add( 'out vec4 _ResultCol;' );

                 Add( 'void main()' );
                 Add( '{' );
                 Add( '  _ResultCol = _Color;' );
                 Add( '}' );

               EndUpdate;
          end;

          Assert( Status, Errors.Text );
     end;

     with _Engine do
     begin
          with Unifors do
          begin
               Add( 4, 'TSize' );
               Add( 5, 'TColor' );
          end;

          Assert( Status, Errors.Text );
     end;
end;

destructor TGLMateryVoxels.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaperVoxels

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

function TGLShaperVoxels.GetCount :Integer;
begin
     Result := PosBuf.Count;
end;

//------------------------------------------------------------------------------

function TGLShaperVoxels.GetSizeX :Single;
begin
     Result := _Size[ 0 ];
end;

procedure TGLShaperVoxels.SetSizeX( const SizeX_:Single );
begin
     _Size[ 0 ] := SizeX_;
end;

function TGLShaperVoxels.GetSizeY :Single;
begin
     Result := _Size[ 1 ];
end;

procedure TGLShaperVoxels.SetSizeY( const SizeY_:Single );
begin
     _Size[ 1 ] := SizeY_;
end;

function TGLShaperVoxels.GetSizeZ :Single;
begin
     Result := _Size[ 2 ];
end;

procedure TGLShaperVoxels.SetSizeZ( const SizeZ_:Single );
begin
     _Size[ 2 ] := SizeZ_;
end;

//------------------------------------------------------------------------------

function TGLShaperVoxels.GetColor :TAlphaColorF;
begin
     Result := _Color[ 0 ];
end;

procedure TGLShaperVoxels.SetColor( const Color_:TAlphaColorF );
begin
     _Color[ 0 ] := Color_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLShaperVoxels.Create;
begin
     inherited;

     _Matery := TGLMateryVoxels.Create;

     _Size := TGLUnifor<Single>.Create( GL_STATIC_DRAW );
     _Size.Count := 3;

     _Color := TGLUnifor<TAlphaColorF>.Create( GL_STATIC_DRAW );
     _Color.Count := 1;

     SizeX := 0.05;
     SizeY := 0.05;
     SizeZ := 0.05;

     Color := TAlphaColorF.Create( 1, 1, 1, 0.5 );
end;

destructor TGLShaperVoxels.Destroy;
begin
     _Size .DisposeOf;
     _Color.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLShaperVoxels.BeginDraw;
begin
     inherited;

     _Size .Use( 4 );
     _Color.Use( 5 );
end;

procedure TGLShaperVoxels.EndDraw;
begin
     _Size .Unuse( 4 );
     _Color.Unuse( 5 );

     inherited;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■