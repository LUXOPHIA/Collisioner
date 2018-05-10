unit LUX.GPU.OpenGL.Shaper.Preset.TColorMarcubes;

interface //#################################################################### ■

uses Winapi.OpenGL, Winapi.OpenGLext,
     LUX, LUX.D2, LUX.D3, LUX.M4,
     LUX.GPU.OpenGL,
     LUX.GPU.OpenGL.Atom.Buffer.UniBuf,
     LUX.GPU.OpenGL.Atom.Textur.D2.Preset,
     LUX.GPU.OpenGL.Atom.Textur.D3.Preset,
     LUX.GPU.OpenGL.Matery,
     LUX.GPU.OpenGL.Shaper;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     TColorMarcubes = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TColorMarcubesMateryFaces

     IMarcubesMateryFaces = interface( IGLMateryNorTexG )
     ['{1FD800E2-12D5-4021-825F-368CEFFEFAA5}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TColorMarcubesMateryFaces = class( TGLMateryNorTexG, IMarcubesMateryFaces )
     private
     protected
       _Textur :TGLCelTex2D_TAlphaColorF;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property Textur :TGLCelTex2D_TAlphaColorF read _Textur;
       ///// メソッド
       procedure Use; override;
       procedure Unuse; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TColorMarcubes

     TColorMarcubes = class( TGLShaperZeroPoins )
     private
     protected
       _Textur    :TGLPoiTex3D_TAlphaColorF;
       _Size      :TGLUniBuf<TSingle3D>;
       _Threshold :TGLUniBuf<Single>;
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
       property Textur    :TGLPoiTex3D_TAlphaColorF read   _Textur                          ;
       property SizeX     :Single                   read GetSizeX       write SetSizeX      ;
       property SizeY     :Single                   read GetSizeY       write SetSizeY      ;
       property SizeZ     :Single                   read GetSizeZ       write SetSizeZ      ;
       property Threshold :Single                   read GetThreshold   write SetThreshold  ;
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

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TColorMarcubesMateryFaces

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TColorMarcubesMateryFaces.Create;
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
               Add( 4{BinP}, 'TGridSize'{Name} );
               Add( 5{BinP}, 'TThreshold'{Name} );
          end;

          with Texturs do
          begin
               Add( 0{BinP}, '_Grider'{Name} );
          end;

          ShaderV.LoadFromResource( 'LUX_GPU_OpenGL_Shaper_Preset_TColorMarcubes_Faces_V_glsl' );
          ShaderG.LoadFromResource( 'LUX_GPU_OpenGL_Shaper_Preset_TColorMarcubes_Faces_G_glsl' );
          ShaderF.LoadFromResource( 'LUX_GPU_OpenGL_Shaper_Preset_TColorMarcubes_Faces_F_glsl' );
     end;

     _Textur := TGLCelTex2D_TAlphaColorF.Create;
end;

destructor TColorMarcubesMateryFaces.Destroy;
begin
     _Textur.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TColorMarcubesMateryFaces.Use;
begin
     inherited;

     _Textur.Use( 1 );
end;

procedure TColorMarcubesMateryFaces.Unuse;
begin
     _Textur.Unuse( 1 );

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TColorMarcubes

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TColorMarcubes.GetSizeX :Single;
begin
     Result := _Size[ 0 ].X;
end;

procedure TColorMarcubes.SetSizeX( const SizeX_:Single );
begin
     _Size[ 0 ] := TSingle3D.Create( SizeX_, SizeY, SizeZ );
end;

function TColorMarcubes.GetSizeY :Single;
begin
     Result := _Size[ 0 ].Y;
end;

procedure TColorMarcubes.SetSizeY( const SizeY_:Single );
begin
     _Size[ 0 ] := TSingle3D.Create( SizeX, SizeY_, SizeZ );
end;
function TColorMarcubes.GetSizeZ :Single;
begin
     Result := _Size[ 0 ].Z;
end;

procedure TColorMarcubes.SetSizeZ( const SizeZ_:Single );
begin
     _Size[ 0 ] := TSingle3D.Create( SizeX, SizeY, SizeZ_ );
end;

//------------------------------------------------------------------------------

function TColorMarcubes.GetThreshold :Single;
begin
     Result := _Threshold[ 0 ];
end;

procedure TColorMarcubes.SetThreshold( const Threshold_:Single );
begin
     _Threshold[ 0 ] := Threshold_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TColorMarcubes.Create;
begin
     inherited;

     _Textur    := TGLPoiTex3D_TAlphaColorF.Create;
     _Size      := TGLUniBuf<TSingle3D>.Create( GL_STATIC_DRAW );  _Size.Count := 1;
     _Threshold := TGLUniBuf<Single>.Create( GL_STATIC_DRAW );  _Threshold.Count := 1;

     _Matery := TColorMarcubesMateryFaces.Create;

     with Textur.Imager.Grid do
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

     Threshold := 0;
end;

destructor TColorMarcubes.Destroy;
begin
     _Textur   .DisposeOf;
     _Size     .DisposeOf;
     _Threshold.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TColorMarcubes.BeginDraw;
begin
     inherited;

     _Textur   .Use( 0 );
     _Size     .Use( 4 );
     _Threshold.Use( 5 );
end;

procedure TColorMarcubes.EndDraw;
begin
     _Textur   .Unuse( 0 );
     _Size     .Unuse( 4 );
     _Threshold.Unuse( 5 );

     inherited;
end;

procedure TColorMarcubes.MakeModel;
begin
     PoinsN := _Textur.Imager.Grid.CellsN;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
