unit LUX.GPU.OpenGL.Atom.Imager.D2.Preset;

interface //#################################################################### ■

uses System.UITypes,
     Vcl.Graphics,
     LUX.GPU.OpenGL.Atom.Buffer.PixBuf.D2,
     LUX, LUX.GPU.OpenGL.Atom.Imager.D2;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPoiIma2D_TAlphaColorF

     TGLPoiIma2D_TAlphaColorF = class( TGLPoiIma2D<TAlphaColorF> )
     private
     protected
     public
       constructor Create;
       destructor Destroy; override;
       ///// メソッド
       procedure CopyFrom( const BMP_:TBitmap );
       procedure CopyTo( const BMP_:TBitmap );
       procedure LoadFromFile( const FileName_:String );
       procedure SaveToFile( const FileName_:String );
       procedure LoadFromFileHDR( const FileName_:String );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLCelIma2D_TAlphaColorF

     TGLCelIma2D_TAlphaColorF = class( TGLCelIma2D<TAlphaColorF> )
     private
     protected
     public
       constructor Create;
       destructor Destroy; override;
       ///// メソッド
       procedure CopyFrom( const BMP_:TBitmap );
       procedure CopyTo( const BMP_:TBitmap );
       procedure LoadFromFile( const FileName_:String );
       procedure SaveToFile( const FileName_:String );
       procedure LoadFromFileHDR( const FileName_:String );
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.Threading,
     Winapi.OpenGL, Winapi.OpenGLext,
     LUX.Color, LUX.Color.Format.HDR;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPoiIma2D_TAlphaColorF

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLPoiIma2D_TAlphaColorF.Create;
begin
     inherited;

     _TexelF := GL_RGBA32F;
     _PixelF := GL_RGBA;
     _PixelT := GL_FLOAT;
end;

destructor TGLPoiIma2D_TAlphaColorF.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLPoiIma2D_TAlphaColorF.CopyFrom( const BMP_:TBitmap );
var
   X, Y :Integer;
   D :TGLPoiPixIter2D<TAlphaColorF>;
   C :TAlphaColorF;
begin
     _Grid.PoinsX := BMP_.Width ;
     _Grid.PoinsY := BMP_.Height;

     D := _Grid.Map( GL_WRITE_ONLY );

     for Y := 0 to _Grid.PoinsY-1 do
     begin
          for X := 0 to _Grid.PoinsX-1 do
          begin
               with TColorRec( BMP_.Canvas.Pixels[ X, Y ] ) do
               begin
                    C.R := R / 255;
                    C.G := G / 255;
                    C.B := B / 255;
                    C.A := 1      ;
               end;

               D[ X, Y ] := C;
          end;
     end;

     D.DisposeOf;
end;

procedure TGLPoiIma2D_TAlphaColorF.CopyTo( const BMP_:TBitmap );
var
   X, Y :Integer;
   D :TGLPoiPixIter2D<TAlphaColorF>;
begin
     BMP_.SetSize( _Grid.PoinsX, _Grid.PoinsY );

     D := _Grid.Map( GL_READ_ONLY );

     for Y := 0 to _Grid.PoinsY-1 do
     begin
          for X := 0 to _Grid.PoinsX-1 do
          begin
               BMP_.Canvas.Pixels[ X, Y ] := D[ X, Y ].ToAlphaColor;
          end;
     end;

     D.DisposeOf;
end;

//------------------------------------------------------------------------------

procedure TGLPoiIma2D_TAlphaColorF.LoadFromFile( const FileName_:String );
var
   B :TBitmap;
begin
     B := TBitmap.Create;

     B.LoadFromFile( FileName_ );

     CopyFrom( B );

     B.DisposeOf;
end;

procedure TGLPoiIma2D_TAlphaColorF.SaveToFile( const FileName_:String );
var
   B :TBitmap;
begin
     B := TBitmap.Create;

     CopyTo( B );

     B.SaveToFile( FileName_ );

     B.DisposeOf;
end;

//------------------------------------------------------------------------------

procedure TGLPoiIma2D_TAlphaColorF.LoadFromFileHDR( const FileName_:String );
var
   F :TFileHDR;
   D :TGLPoiPixIter2D<TAlphaColorF>;
   X, Y :Integer;
begin
     F := TFileHDR.Create;

     F.LoadFromFile( FileName_ );

     _Grid.PoinsX := F.Grid.CellsX;
     _Grid.PoinsY := F.Grid.CellsY;

     D := _Grid.Map( GL_WRITE_ONLY );

     for Y := 0 to _Grid.PoinsY-1 do
     begin
          for X := 0 to _Grid.PoinsX-1 do
          begin
               D[ X, Y ] := TSingleRGBA( TSingleRGB( F.Grid[ X, Y ] ) );
          end;
     end;

     D.DisposeOf;

     F.DisposeOf;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLCelIma2D_TAlphaColorF

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLCelIma2D_TAlphaColorF.Create;
begin
     inherited;

     _TexelF := GL_RGBA32F;
     _PixelF := GL_RGBA;
     _PixelT := GL_FLOAT;
end;

destructor TGLCelIma2D_TAlphaColorF.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLCelIma2D_TAlphaColorF.CopyFrom( const BMP_:TBitmap );
var
   X, Y :Integer;
   D :TGLCelPixIter2D<TAlphaColorF>;
   C :TAlphaColorF;
begin
     _Grid.CellsX := BMP_.Width ;
     _Grid.CellsY := BMP_.Height;

     D := _Grid.Map( GL_WRITE_ONLY );

     for Y := 0 to _Grid.CellsY-1 do
     begin
          for X := 0 to _Grid.CellsX-1 do
          begin
               with TColorRec( BMP_.Canvas.Pixels[ X, Y ] ) do
               begin
                    C.R := R / 255;
                    C.G := G / 255;
                    C.B := B / 255;
                    C.A := 1      ;
               end;

               D[ X, Y ] := C;
          end;
     end;

     D.DisposeOf;
end;

procedure TGLCelIma2D_TAlphaColorF.CopyTo( const BMP_:TBitmap );
var
   X, Y :Integer;
   D :TGLCelPixIter2D<TAlphaColorF>;
begin
     BMP_.SetSize( _Grid.CellsX, _Grid.CellsY );

     D := _Grid.Map( GL_READ_ONLY );

     for Y := 0 to _Grid.CellsY-1 do
     begin
          for X := 0 to _Grid.CellsX-1 do
          begin
               BMP_.Canvas.Pixels[ X, Y ] := D[ X, Y ].ToAlphaColor;
          end;
     end;

     D.DisposeOf;
end;

//------------------------------------------------------------------------------

procedure TGLCelIma2D_TAlphaColorF.LoadFromFile( const FileName_:String );
var
   B :TBitmap;
begin
     B := TBitmap.Create;

     B.LoadFromFile( FileName_ );

     CopyFrom( B );

     B.DisposeOf;
end;

procedure TGLCelIma2D_TAlphaColorF.SaveToFile( const FileName_:String );
var
   B :TBitmap;
begin
     B := TBitmap.Create;

     CopyTo( B );

     B.SaveToFile( FileName_ );

     B.DisposeOf;
end;

//------------------------------------------------------------------------------

procedure TGLCelIma2D_TAlphaColorF.LoadFromFileHDR( const FileName_:String );
var
   F :TFileHDR;
   D :TGLCelPixIter2D<TAlphaColorF>;
   X, Y :Integer;
begin
     F := TFileHDR.Create;

     F.LoadFromFile( FileName_ );

     _Grid.CellsX := F.Grid.CellsX;
     _Grid.CellsY := F.Grid.CellsY;

     D := _Grid.Map( GL_WRITE_ONLY );

     for Y := 0 to _Grid.CellsY-1 do
     begin
          for X := 0 to _Grid.CellsX-1 do
          begin
               D[ X, Y ] := TSingleRGBA( TSingleRGB( F.Grid[ X, Y ] ) );
          end;
     end;

     D.DisposeOf;

     F.DisposeOf;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■