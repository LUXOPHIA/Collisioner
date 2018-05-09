unit LUX.GPU.OpenGL.Atom.Imager.D1.Preset;

interface //#################################################################### ■

uses System.UITypes,
     FMX.Graphics,
     LUX,
     LUX.GPU.OpenGL.Atom.Buffer.PixBuf.D1,
     LUX.GPU.OpenGL.Atom.Imager.D1;

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
       procedure CopyFrom( const BMP_:TBitmap ); overload;
       procedure CopyTo( const BMP_:TBitmap ); overload;
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
       procedure CopyFrom( const BMP_:TBitmap ); overload;
       procedure CopyTo( const BMP_:TBitmap ); overload;
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

procedure TGLPoiIma1D_TAlphaColorF.CopyFrom( const BMP_:TBitmap );
var
   B :TBitmapData;
   D :TGLPoiPixIter1D<TAlphaColorF>;
   X :Integer;
begin
     _Grid.PoinsX := BMP_.Width;

     BMP_.Map( TMapAccess.Read, B );

     D := _Grid.Map( GL_WRITE_ONLY );

     for X := 0 to _Grid.PoinsX-1 do
     begin
          D[ X ] := TAlphaColorF.Create( B.GetPixel( X, 0 ) );
     end;

     D.DisposeOf;

     BMP_.Unmap( B );
end;

procedure TGLPoiIma1D_TAlphaColorF.CopyTo( const BMP_:TBitmap );
var
   B :TBitmapData;
   D :TGLPoiPixIter1D<TAlphaColorF>;
   X :Integer;
begin
     BMP_.SetSize( _Grid.PoinsX, 1 );

     BMP_.Map( TMapAccess.Write, B );

     D := _Grid.Map( GL_READ_ONLY );

     for X := 0 to _Grid.PoinsX-1 do
     begin
          B.SetPixel( X, 0, D[ X ].ToAlphaColor );
     end;

     D.DisposeOf;

     BMP_.Unmap( B );
end;

//------------------------------------------------------------------------------

procedure TGLPoiIma1D_TAlphaColorF.LoadFromFile( const FileName_:String );
var
   B :TBitmap;
begin
     B := TBitmap.Create;

     B.LoadFromFile( FileName_ );

     CopyFrom( B );

     B.DisposeOf;
end;

procedure TGLPoiIma1D_TAlphaColorF.SaveToFile( const FileName_:String );
var
   B :TBitmap;
begin
     B := TBitmap.Create;

     CopyTo( B );

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

procedure TGLCelIma1D_TAlphaColorF.CopyFrom( const BMP_:TBitmap );
var
   B :TBitmapData;
   D :TGLCelPixIter1D<TAlphaColorF>;
   X :Integer;
begin
     _Grid.CellsX := BMP_.Width;

     BMP_.Map( TMapAccess.Read, B );

     D := _Grid.Map( GL_WRITE_ONLY );

     for X := 0 to _Grid.CellsX-1 do
     begin
          D[ X ] := TAlphaColorF.Create( B.GetPixel( X, 0 ) );
     end;

     D.DisposeOf;

     BMP_.Unmap( B );
end;

procedure TGLCelIma1D_TAlphaColorF.CopyTo( const BMP_:TBitmap );
var
   B :TBitmapData;
   D :TGLCelPixIter1D<TAlphaColorF>;
   X :Integer;
begin
     BMP_.SetSize( _Grid.CellsX, 1 );

     BMP_.Map( TMapAccess.Write, B );

     D := _Grid.Map( GL_READ_ONLY );

     for X := 0 to _Grid.CellsX-1 do
     begin
          B.SetPixel( X, 0, D[ X ].ToAlphaColor );
     end;

     D.DisposeOf;

     BMP_.Unmap( B );
end;

//------------------------------------------------------------------------------

procedure TGLCelIma1D_TAlphaColorF.LoadFromFile( const FileName_:String );
var
   B :TBitmap;
begin
     B := TBitmap.Create;

     B.LoadFromFile( FileName_ );

     CopyFrom( B );

     B.DisposeOf;
end;

procedure TGLCelIma1D_TAlphaColorF.SaveToFile( const FileName_:String );
var
   B :TBitmap;
begin
     B := TBitmap.Create;

     CopyTo( B );

     B.SaveToFile( FileName_ );

     B.DisposeOf;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■