unit LUX.GPU.OpenGL.Shaper.Preset.TMarcubes;

interface //#################################################################### ■

uses Winapi.OpenGL, Winapi.OpenGLext,
     LUX, LUX.D2, LUX.D3, LUX.M4,
     LUX.GPU.OpenGL,
     LUX.GPU.OpenGL.Atom.Buffer.UniBuf,
     LUX.GPU.OpenGL.Atom.Texture.D2.Preset,
     LUX.GPU.OpenGL.Atom.Texture.D3.Preset,
     LUX.GPU.OpenGL.Matery,
     LUX.GPU.OpenGL.Shaper;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     TMarcubes = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TMarcubesMateryFacesRGB

     IMarcubesMateryFacesRGB = interface( IGLMateryNorTexG )
     ['{48DD7893-831C-4F39-ACA3-AFBC9F37DD73}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TMarcubesMateryFacesRGB = class( TGLMateryNorTexG, IMarcubesMateryFacesRGB )
     private
     protected
     public
       constructor Create;
       destructor Destroy; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TMarcubesMateryFacesMIR

     IMarcubesMateryFacesMIR = interface( IGLMateryNorTexG )
     ['{1FD800E2-12D5-4021-825F-368CEFFEFAA5}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TMarcubesMateryFacesMIR = class( TGLMateryNorTexG, IMarcubesMateryFacesMIR )
     private
     protected
       _Imager :TGLCelTex2D_TAlphaColorF;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property Imager :TGLCelTex2D_TAlphaColorF read _Imager;
       ///// メソッド
       procedure Use; override;
       procedure Unuse; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TMarcubesMateryCubes

     IMarcubesMateryCubes = interface( IGLMateryNorTexG )
     ['{9FD0E274-E7F3-4B90-85A5-21B0C52FC9CB}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TMarcubesMateryCubes = class( TGLMateryNorTexG, IMarcubesMateryCubes )
     private
     protected
     public
       constructor Create;
       destructor Destroy; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TMarcubes

     TMarcubes = class( TGLShaperZeroPoins )
     private
     protected
       _MaterC      :IMarcubesMateryCubes;
       _Grider      :TGLPoiTex3D_Single;
       _Size        :TGLUniBuf<TSingle3D>;
       _Threshold   :TGLUniBuf<Single>;
       _LineS       :Single;
       _IsShowCubes :Boolean;
       ///// アクセス
       function GetSizeX :Single;
       procedure SetSizeX( const SizeX_:Single );
       function GetSizeY :Single;
       procedure SetSizeY( const SizeY_:Single );
       function GetSizeZ :Single;
       procedure SetSizeZ( const SizeZ_:Single );
       function GetThreshold :Single;
       procedure SetThreshold( const Threshold_:Single );
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       property Grider      :TGLPoiTex3D_Single read   _Grider                          ;
       property SizeX       :Single             read GetSizeX       write SetSizeX      ;
       property SizeY       :Single             read GetSizeY       write SetSizeY      ;
       property SizeZ       :Single             read GetSizeZ       write SetSizeZ      ;
       property Threshold   :Single             read GetThreshold   write SetThreshold  ;
       property LineS       :Single             read   _LineS       write   _LineS      ;
       property IsShowCubes :Boolean            read   _IsShowCubes write   _IsShowCubes;
       ///// メソッド
       procedure BeginDraw; override;
       procedure EndDraw; override;
       procedure MakeModel;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TMarcubesMateryFacesRGB

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TMarcubesMateryFacesRGB.Create;
begin
     inherited;

     with _Engine do
     begin
          with VerBufs do
          begin
               Del( 0{BinP} );
               Del( 1{BinP} );
               Del( 2{BinP} );
          end;

          with UniBufs do
          begin
               Add( 4{BinP}, 'TGriderS'{Name} );
               Add( 5{BinP}, 'TThreshold'{Name} );
          end;

          with Textures do
          begin
               Add( 0{BinP}, '_Grider'{Name} );
          end;

          ShaderV.LoadFromResource( 'LUX_GPU_OpenGL_Shaper_Preset_TMarcubes_Faces_V_glsl' );
          ShaderG.LoadFromResource( 'LUX_GPU_OpenGL_Shaper_Preset_TMarcubes_Faces_G_glsl' );
          ShaderF.LoadFromResource( 'LUX_GPU_OpenGL_Shaper_Preset_TMarcubes_FacesRGB_F_glsl' );
     end;

end;

destructor TMarcubesMateryFacesRGB.Destroy;
begin

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TMarcubesMateryFacesMIR

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TMarcubesMateryFacesMIR.Create;
begin
     inherited;

     with _Engine do
     begin
          with VerBufs do
          begin
               Del( 0{BinP} );
               Del( 1{BinP} );
               Del( 2{BinP} );
          end;

          with UniBufs do
          begin
               Add( 4{BinP}, 'TGriderS'{Name} );
               Add( 5{BinP}, 'TThreshold'{Name} );
          end;

          with Textures do
          begin
               Add( 0{BinP}, '_Grider'{Name} );
               Add( 1{BinP}, '_Imager'{Name} );
          end;

          ShaderV.LoadFromResource( 'LUX_GPU_OpenGL_Shaper_Preset_TMarcubes_Faces_V_glsl' );
          ShaderG.LoadFromResource( 'LUX_GPU_OpenGL_Shaper_Preset_TMarcubes_Faces_G_glsl' );
          ShaderF.LoadFromResource( 'LUX_GPU_OpenGL_Shaper_Preset_TMarcubes_FacesMIR_F_glsl' );
     end;

     _Imager := TGLCelTex2D_TAlphaColorF.Create;
end;

destructor TMarcubesMateryFacesMIR.Destroy;
begin
     _Imager.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TMarcubesMateryFacesMIR.Use;
begin
     inherited;

     _Imager.Use( 1 );
end;

procedure TMarcubesMateryFacesMIR.Unuse;
begin
     _Imager.Unuse( 1 );

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TMarcubesMateryCubes

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TMarcubesMateryCubes.Create;
begin
     inherited;

     with _Engine do
     begin
          with VerBufs do
          begin
               Del( 0{BinP} );
               Del( 1{BinP} );
               Del( 2{BinP} );
          end;

          with UniBufs do
          begin
               Add( 4{BinP}, 'TGriderS'{Name} );
               Add( 5{BinP}, 'TThreshold'{Name} );
          end;

          with Textures do
          begin
               Add( 0{BinP}, '_Grider'{Name} );
          end;

          ShaderV.LoadFromResource( 'LUX_GPU_OpenGL_Shaper_Preset_TMarcubes_Cubes_V_glsl' );
          ShaderG.LoadFromResource( 'LUX_GPU_OpenGL_Shaper_Preset_TMarcubes_Cubes_G_glsl' );
          ShaderF.LoadFromResource( 'LUX_GPU_OpenGL_Shaper_Preset_TMarcubes_Cubes_F_glsl' );
     end;
end;

destructor TMarcubesMateryCubes.Destroy;
begin

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TMarcubes

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TMarcubes.GetSizeX :Single;
begin
     Result := _Size[ 0 ].X;
end;

procedure TMarcubes.SetSizeX( const SizeX_:Single );
begin
     _Size[ 0 ] := TSingle3D.Create( SizeX_, SizeY, SizeZ );
end;

function TMarcubes.GetSizeY :Single;
begin
     Result := _Size[ 0 ].Y;
end;

procedure TMarcubes.SetSizeY( const SizeY_:Single );
begin
     _Size[ 0 ] := TSingle3D.Create( SizeX, SizeY_, SizeZ );
end;
function TMarcubes.GetSizeZ :Single;
begin
     Result := _Size[ 0 ].Z;
end;

procedure TMarcubes.SetSizeZ( const SizeZ_:Single );
begin
     _Size[ 0 ] := TSingle3D.Create( SizeX, SizeY, SizeZ_ );
end;

//------------------------------------------------------------------------------

function TMarcubes.GetThreshold :Single;
begin
     Result := _Threshold[ 0 ];
end;

procedure TMarcubes.SetThreshold( const Threshold_:Single );
begin
     _Threshold[ 0 ] := Threshold_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TMarcubes.Create;
begin
     inherited;

     _Grider    := TGLPoiTex3D_Single.Create;
     _Size      := TGLUniBuf<TSingle3D>.Create( GL_STATIC_DRAW );
     _Threshold := TGLUniBuf<Single>.Create( GL_STATIC_DRAW );

     _Matery := TMarcubesMateryFacesRGB.Create;
     _MaterC := TMarcubesMateryCubes.Create;

     with Grider.Texels do
     begin
          MargsX := 1;
          MargsY := 1;
          MargsZ := 1;
          CellsX := 100;
          CellsY := 100;
          CellsZ := 100;
     end;

     SizeX := 2;
     SizeY := 2;
     SizeZ := 2;

     Threshold := 0.5;

     _LineS := 1;

     _IsShowCubes := False;
end;

destructor TMarcubes.Destroy;
begin
     _Grider   .DisposeOf;
     _Size     .DisposeOf;
     _Threshold.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TMarcubes.BeginDraw;
begin
     inherited;

     _Grider   .Use( 0 );
     _Size     .Use( 4 );
     _Threshold.Use( 5 );
end;

procedure TMarcubes.EndDraw;
begin
     if _IsShowCubes then
     begin
          _MaterC.Use;

            glLineWidth( _LineS );

            DrawMain;

          _MaterC.Unuse;
     end;

     _Grider   .Unuse( 0 );
     _Size     .Unuse( 4 );
     _Threshold.Unuse( 5 );

     inherited;
end;

procedure TMarcubes.MakeModel;
begin
     _Grider.SendData;

     PoinsN := _Grider.Texels.CellsN;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
