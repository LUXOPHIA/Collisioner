unit LUX.GPU.OpenGL.Shaper.Preset;

interface //#################################################################### ■

uses System.UITypes,
     Winapi.OpenGL, Winapi.OpenGLext,
     LUX, LUX.D2, LUX.D3, LUX.M4,
     LUX.GPU.OpenGL,
     LUX.GPU.OpenGL.Atom.Buffer,
     LUX.GPU.OpenGL.Atom.Buffer.Verter,
     LUX.GPU.OpenGL.Atom.Buffer.Elemer,
     LUX.GPU.OpenGL.Scener,
     LUX.GPU.OpenGL.Matery,
     LUX.GPU.OpenGL.Matery.Preset,
     LUX.GPU.OpenGL.Shaper;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     TGLShaperCopy     = class;
     TGLShaperLineCube = class;
     TGLDotCube        = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaperCopy

     TGLShaperCopy = class( TGLShaper )
     private
     protected
       _Shaper :TGLShaperPoin;
       ///// アクセス
       function GetShaper :TGLShaperPoin;
       procedure SetShaper( const Shaper_:TGLShaperPoin );
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       property Shaper :TGLShaperPoin read GetShaper write SetShaper;
       ///// メソッド
       procedure BeginDraw; override;
       procedure DrawMain; override;
       procedure EndDraw; override;
       procedure CalcBouBox; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaperLineCube

     TGLShaperLineCube = class( TGLShaperLine )
     private
       ///// メソッド
       procedure MakeModel;
     protected
       _SizeX :Single;
       _SizeY :Single;
       _SizeZ :Single;
       ///// アクセス
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
       property SizeX :Single       read GetSizeX write SetSizeX;
       property SizeY :Single       read GetSizeY write SetSizeY;
       property SizeZ :Single       read GetSizeZ write SetSizeZ;
       property Color :TAlphaColorF read GetColor write SetColor;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLDotCube

     TGLDotCube = class( TGLShaperPoin )
     private
       ///// メソッド
       procedure MakeModel;
     protected
       _SizeX :Single;
       _SizeY :Single;
       _SizeZ :Single;
       _DivNX :Integer;
       _DivNY :Integer;
       _DivNZ :Integer;
       ///// アクセス
       function GetSizeX :Single;
       procedure SetSizeX( const SizeX_:Single );
       function GetSizeY :Single;
       procedure SetSizeY( const SizeY_:Single );
       function GetSizeZ :Single;
       procedure SetSizeZ( const SizeZ_:Single );
       function GetDivNX :Integer;
       procedure SetDivNX( const DivNX_:Integer );
       function GetDivNY :Integer;
       procedure SetDivNY( const DivNY_:Integer );
       function GetDivNZ :Integer;
       procedure SetDivNZ( const DivNZ_:Integer );
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       property SizeX :Single  read GetSizeX write SetSizeX;
       property SizeY :Single  read GetSizeY write SetSizeY;
       property SizeZ :Single  read GetSizeZ write SetSizeZ;
       property DivNX :Integer read GetDivNX write SetDivNX;
       property DivNY :Integer read GetDivNY write SetDivNY;
       property DivNZ :Integer read GetDivNZ write SetDivNZ;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaperCopy

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLShaperCopy.GetShaper :TGLShaperPoin;
begin
     Result := _Shaper;
end;

procedure TGLShaperCopy.SetShaper( const Shaper_:TGLShaperPoin );
begin
     _Shaper := Shaper_;

     CalcBouBox;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLShaperCopy.Create;
begin
     inherited;

end;

destructor TGLShaperCopy.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLShaperCopy.BeginDraw;
begin
     inherited;

     with _Shaper do
     begin
          if not Assigned( Self._Matery ) then Matery.Use;

          PosBuf.Use( 0{BinP} );
          NorBuf.Use( 1{BinP} );
          TexBuf.Use( 2{BinP} );
     end;
end;

procedure TGLShaperCopy.DrawMain;
begin
     _Shaper.DrawMain;
end;

procedure TGLShaperCopy.EndDraw;
begin
     with _Shaper do
     begin
          PosBuf.Unuse( 0{BinP} );
          NorBuf.Unuse( 1{BinP} );
          TexBuf.Unuse( 2{BinP} );

          if not Assigned( Self._Matery ) then Matery.Use;
     end;

     inherited;
end;

//------------------------------------------------------------------------------

procedure TGLShaperCopy.CalcBouBox;
begin
     BouBox := _Shaper.BouBox;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaperLineCube

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLShaperLineCube.MakeModel;
var
   SX, SY, SZ :Single;
begin
     SX := _SizeX / 2;
     SY := _SizeY / 2;
     SZ := _SizeZ / 2;

     _PosBuf[ 0 ] := TSingle3D.Create( -SX, -SY, -SZ );
     _PosBuf[ 1 ] := TSingle3D.Create( +SX, -SY, -SZ );
     _PosBuf[ 2 ] := TSingle3D.Create( -SX, +SY, -SZ );
     _PosBuf[ 3 ] := TSingle3D.Create( +SX, +SY, -SZ );
     _PosBuf[ 4 ] := TSingle3D.Create( -SX, -SY, +SZ );
     _PosBuf[ 5 ] := TSingle3D.Create( +SX, -SY, +SZ );
     _PosBuf[ 6 ] := TSingle3D.Create( -SX, +SY, +SZ );
     _PosBuf[ 7 ] := TSingle3D.Create( +SX, +SY, +SZ );

     CalcBouBox;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLShaperLineCube.GetSizeX :Single;
begin
     Result := _SizeX;
end;

procedure TGLShaperLineCube.SetSizeX( const SizeX_:Single );
begin
     _SizeX := SizeX_;  MakeModel;
end;

function TGLShaperLineCube.GetSizeY :Single;
begin
     Result := _SizeY;
end;

procedure TGLShaperLineCube.SetSizeY( const SizeY_:Single );
begin
     _SizeY := SizeY_;  MakeModel;
end;

function TGLShaperLineCube.GetSizeZ :Single;
begin
     Result := _SizeZ;
end;

procedure TGLShaperLineCube.SetSizeZ( const SizeZ_:Single );
begin
     _SizeZ := SizeZ_;  MakeModel;
end;

//------------------------------------------------------------------------------

function TGLShaperLineCube.GetColor :TAlphaColorF;
begin
     Result := TGLMateryColor( _Matery ).Color;
end;

procedure TGLShaperLineCube.SetColor( const Color_:TAlphaColorF );
begin
     TGLMateryColor( _Matery ).Color := Color_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLShaperLineCube.Create;
begin
     inherited;

     _PosBuf.Count :=  8;
     _NorBuf.Count :=  8;
     _EleBuf.Count := 12;

     _Matery := TGLMateryColor.Create;

     _NorBuf[ 0 ] := TSingle3D.Create( -1, -1, -1 ).Unitor;
     _NorBuf[ 1 ] := TSingle3D.Create( +1, -1, -1 ).Unitor;
     _NorBuf[ 2 ] := TSingle3D.Create( -1, +1, -1 ).Unitor;
     _NorBuf[ 3 ] := TSingle3D.Create( +1, +1, -1 ).Unitor;
     _NorBuf[ 4 ] := TSingle3D.Create( -1, -1, +1 ).Unitor;
     _NorBuf[ 5 ] := TSingle3D.Create( +1, -1, +1 ).Unitor;
     _NorBuf[ 6 ] := TSingle3D.Create( -1, +1, +1 ).Unitor;
     _NorBuf[ 7 ] := TSingle3D.Create( +1, +1, +1 ).Unitor;

     _EleBuf[ 00 ] := TCardinal2D.Create( 0, 1 );
     _EleBuf[ 01 ] := TCardinal2D.Create( 0, 2 );
     _EleBuf[ 02 ] := TCardinal2D.Create( 0, 4 );

     _EleBuf[ 03 ] := TCardinal2D.Create( 1, 3 );
     _EleBuf[ 04 ] := TCardinal2D.Create( 2, 6 );
     _EleBuf[ 05 ] := TCardinal2D.Create( 4, 5 );

     _EleBuf[ 06 ] := TCardinal2D.Create( 7, 6 );
     _EleBuf[ 07 ] := TCardinal2D.Create( 7, 5 );
     _EleBuf[ 08 ] := TCardinal2D.Create( 7, 3 );

     _EleBuf[ 09 ] := TCardinal2D.Create( 6, 4 );
     _EleBuf[ 10 ] := TCardinal2D.Create( 5, 1 );
     _EleBuf[ 11 ] := TCardinal2D.Create( 3, 2 );

     _SizeX := 1;
     _SizeY := 1;
     _SizeZ := 1;

     MakeModel;
end;

destructor TGLShaperLineCube.Destroy;
begin

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLDotCube

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLDotCube.MakeModel;
var
   X, Y, Z, I :Integer;
   P :TSingle3D;
begin
     PosBuf.Count := ( _DivNZ + 1 ) * ( _DivNY + 1 ) * ( _DivNX + 1 );

     I := 0;
     for Z := 0 to _DivNZ do
     begin
          P.Z := _SizeZ / _DivNZ * Z - _SizeZ / 2;

          for Y := 0 to _DivNY do
          begin
               P.Y := _SizeY / _DivNY * Y - _SizeY / 2;

               for X := 0 to _DivNX do
               begin
                    P.X := _SizeX / _DivNX * X - _SizeX / 2;

                    PosBuf[ I ] := P;  Inc( I );
               end;
          end;
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLDotCube.GetSizeX :Single;
begin
     Result := _SizeX;
end;

procedure TGLDotCube.SetSizeX( const SizeX_:Single );
begin
     _SizeX := SizeX_;  MakeModel;
end;

function TGLDotCube.GetSizeY :Single;
begin
     Result := _SizeY;
end;

procedure TGLDotCube.SetSizeY( const SizeY_:Single );
begin
     _SizeY := SizeY_;  MakeModel;
end;

function TGLDotCube.GetSizeZ :Single;
begin
     Result := _SizeZ;
end;

procedure TGLDotCube.SetSizeZ( const SizeZ_:Single );
begin
     _SizeZ := SizeZ_;  MakeModel;
end;

//------------------------------------------------------------------------------

function TGLDotCube.GetDivNX :Integer;
begin
     Result := _DivNX;
end;

procedure TGLDotCube.SetDivNX( const DivNX_:Integer );
begin
     _DivNX := DivNX_;  MakeModel;
end;

function TGLDotCube.GetDivNY :Integer;
begin
     Result := _DivNY;
end;

procedure TGLDotCube.SetDivNY( const DivNY_:Integer );
begin
     _DivNY := DivNY_;  MakeModel;
end;

function TGLDotCube.GetDivNZ :Integer;
begin
     Result := _DivNZ;
end;

procedure TGLDotCube.SetDivNZ( const DivNZ_:Integer );
begin
     _DivNZ := DivNZ_;  MakeModel;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLDotCube.Create;
begin
     inherited;

     _Matery := TGLMateryColor.Create;

     SizeX := 10;
     SizeY := 10;
     SizeZ := 10;
     DivNX := 10;
     DivNY := 10;
     DivNZ := 10;
end;

destructor TGLDotCube.Destroy;
begin

     inherited;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
