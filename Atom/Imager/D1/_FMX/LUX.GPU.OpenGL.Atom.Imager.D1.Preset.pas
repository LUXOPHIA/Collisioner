unit LUX.GPU.OpenGL.Atom.Imager.D1.Preset;

interface //#################################################################### ■

uses System.UITypes,
     FMX.Graphics,
     LUX, LUX.GPU.OpenGL.Atom.Imager.D1;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPoiIma1D_TAlphaColorF

     TGLPoiIma1D_TAlphaColorF = class( TGLPoiIma1D<TAlphaColorF> )
     private
     protected
     public
       constructor Create;
       destructor Destroy; override;
       ///// メソッド
       procedure ImportFrom( const BMP_:TBitmap );
       procedure ExportTo( const BMP_:TBitmap );
       procedure LoadFromFile( const FileName_:String );
       procedure SaveToFile( const FileName_:String );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLCelIma1D_TAlphaColorF

     TGLCelIma1D_TAlphaColorF = class( TGLCelIma1D<TAlphaColorF> )
     private
     protected
     public
       constructor Create;
       destructor Destroy; override;
       ///// メソッド
       procedure ImportFrom( const BMP_:TBitmap );
       procedure ExportTo( const BMP_:TBitmap );
       procedure LoadFromFile( const FileName_:String );
       procedure SaveToFile( const FileName_:String );
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses Winapi.OpenGL, Winapi.OpenGLext;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPoiIma1D_TAlphaColorF

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLPoiIma1D_TAlphaColorF.Create;
begin
     inherited;

     _TexelF := GL_RGBA32F;
     _PixelF := GL_RGBA;
     _PixelT := GL_FLOAT;
end;

destructor TGLPoiIma1D_TAlphaColorF.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLPoiIma1D_TAlphaColorF.ImportFrom( const BMP_:TBitmap );
var
   B :TBitmapData;
   X :Integer;
begin
     _Grider.PoinsX := BMP_.Width;

     BMP_.Map( TMapAccess.Read, B );

     for X := 0 to _Grider.PoinsX-1 do
     begin
          _Grider[ X ] := TAlphaColorF.Create( B.GetPixel( X, 0 ) );
     end;

     BMP_.Unmap( B );

     SendData;
end;

procedure TGLPoiIma1D_TAlphaColorF.ExportTo( const BMP_:TBitmap );
var
   B :TBitmapData;
   X :Integer;
begin
     BMP_.SetSize( _Grider.PoinsX, 1 );

     BMP_.Map( TMapAccess.Write, B );

     for X := 0 to _Grider.PoinsX-1 do
     begin
          B.SetPixel( X, 0, _Grider[ X ].ToAlphaColor );
     end;

     BMP_.Unmap( B );
end;

//------------------------------------------------------------------------------

procedure TGLPoiIma1D_TAlphaColorF.LoadFromFile( const FileName_:String );
var
   B :TBitmap;
begin
     B := TBitmap.Create;

     B.LoadFromFile( FileName_ );

     ImportFrom( B );

     B.DisposeOf;
end;

procedure TGLPoiIma1D_TAlphaColorF.SaveToFile( const FileName_:String );
var
   B :TBitmap;
begin
     B := TBitmap.Create;

     ExportTo( B );

     B.SaveToFile( FileName_ );

     B.DisposeOf;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLCelIma1D_TAlphaColorF

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLCelIma1D_TAlphaColorF.Create;
begin
     inherited;

     _TexelF := GL_RGBA32F;
     _PixelF := GL_RGBA;
     _PixelT := GL_FLOAT;
end;

destructor TGLCelIma1D_TAlphaColorF.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLCelIma1D_TAlphaColorF.ImportFrom( const BMP_:TBitmap );
var
   B :TBitmapData;
   X :Integer;
begin
     _Grider.CellsX := BMP_.Width;

     BMP_.Map( TMapAccess.Read, B );

     for X := 0 to _Grider.CellsX-1 do
     begin
          _Grider[ X ] := TAlphaColorF.Create( B.GetPixel( X, 0 ) );
     end;

     BMP_.Unmap( B );

     SendData;
end;

procedure TGLCelIma1D_TAlphaColorF.ExportTo( const BMP_:TBitmap );
var
   B :TBitmapData;
   X :Integer;
begin
     BMP_.SetSize( _Grider.CellsX, 1 );

     BMP_.Map( TMapAccess.Write, B );

     for X := 0 to _Grider.CellsX-1 do
     begin
          B.SetPixel( X, 0, _Grider[ X ].ToAlphaColor );
     end;

     BMP_.Unmap( B );
end;

//------------------------------------------------------------------------------

procedure TGLCelIma1D_TAlphaColorF.LoadFromFile( const FileName_:String );
var
   B :TBitmap;
begin
     B := TBitmap.Create;

     B.LoadFromFile( FileName_ );

     ImportFrom( B );

     B.DisposeOf;
end;

procedure TGLCelIma1D_TAlphaColorF.SaveToFile( const FileName_:String );
var
   B :TBitmap;
begin
     B := TBitmap.Create;

     ExportTo( B );

     B.SaveToFile( FileName_ );

     B.DisposeOf;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■