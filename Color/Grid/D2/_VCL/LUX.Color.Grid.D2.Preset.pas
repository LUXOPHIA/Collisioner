unit LUX.Color.Grid.D2.Preset;

interface //#################################################################### ■

uses System.UITypes,
     Vcl.Graphics,
     LUX, LUX.Color, LUX.Color.Grid.D2;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TPoinColorGrid2D_TSingleRGB

     TPoinColorGrid2D_TSingleRGB = class( TPoinColorGrid2D<TSingleRGB> )
     private
     protected
       ///// メソッド
       procedure DrawTo( const BMP_:TBitmap; const Func_:TConstFunc<Integer,Integer,TSingleRGB>; const Gamm_:Single = 1; const Tone_:Single = 1 ); overload;
     public
       ///// メソッド
       procedure CopyTo( const BMP_:TBitmap; const Gamm_:Single = 1; const Tone_:Single = 1 );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TCellColorGrid2D_TSingleRGB

     TCellColorGrid2D_TSingleRGB = class( TCellColorGrid2D<TSingleRGB> )
     private
     protected
       ///// メソッド
       procedure DrawTo( const BMP_:TBitmap; const Func_:TConstFunc<Integer,Integer,TSingleRGB>; const Gamm_:Single = 1; const Tone_:Single = 1 ); overload;
     public
       ///// メソッド
       procedure CopyTo( const BMP_:TBitmap; const Gamm_:Single = 1; const Tone_:Single = 1 );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TPoinColorGrid2D_TByteRGBE

     TPoinColorGrid2D_TByteRGBE = class( TPoinColorGrid2D<TByteRGBE> )
     private
     protected
       ///// メソッド
       procedure DrawTo( const BMP_:TBitmap; const Func_:TConstFunc<Integer,Integer,TByteRGBE>; const Gamm_:Single = 1; const Tone_:Single = 1 ); overload;
     public
       ///// メソッド
       procedure CopyTo( const BMP_:TBitmap; const Gamm_:Single = 1; const Tone_:Single = 1 );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TCellColorGrid2D_TByteRGBE

     TCellColorGrid2D_TByteRGBE = class( TCellColorGrid2D<TByteRGBE> )
     private
     protected
       ///// メソッド
       procedure DrawTo( const BMP_:TBitmap; const Func_:TConstFunc<Integer,Integer,TByteRGBE>; const Gamm_:Single = 1; const Tone_:Single = 1 ); overload;
     public
       ///// メソッド
       procedure CopyTo( const BMP_:TBitmap; const Gamm_:Single = 1; const Tone_:Single = 1 );
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.Threading;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TPoinColorGrid2D_TSingleRGB

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TPoinColorGrid2D_TSingleRGB.DrawTo( const BMP_:TBitmap; const Func_:TConstFunc<Integer,Integer,TSingleRGB>; const Gamm_:Single = 1; const Tone_:Single = 1 );
begin
     DrawTo( BMP_, function( const X,Y:Integer ) :TAlphaColor
     begin
          Result := TByteRGBA( TSingleRGBA( TSingleRGB( Func_( X, Y ) ).ToneMap( Tone_ ).Gamma( Gamm_ ) ) );
     end );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TPoinColorGrid2D_TSingleRGB.CopyTo( const BMP_:TBitmap; const Gamm_:Single = 1; const Tone_:Single = 1 );
begin
     DrawTo( BMP_, function( const X,Y:Integer ) :TSingleRGB
     begin
          Result := Poins[ X, Y ];

     end, Gamm_, Tone_ );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TCellColorGrid2D_TSingleRGB

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TCellColorGrid2D_TSingleRGB.DrawTo( const BMP_:TBitmap; const Func_:TConstFunc<Integer,Integer,TSingleRGB>; const Gamm_:Single = 1; const Tone_:Single = 1 );
begin
     DrawTo( BMP_, function( const X,Y:Integer ) :TAlphaColor
     begin
          Result := TByteRGBA( TSingleRGBA( TSingleRGB( Func_( X, Y ) ).ToneMap( Tone_ ).Gamma( Gamm_ ) ) );
     end );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TCellColorGrid2D_TSingleRGB.CopyTo( const BMP_:TBitmap; const Gamm_:Single = 1; const Tone_:Single = 1 );
begin
     DrawTo( BMP_, function( const X,Y:Integer ) :TSingleRGB
     begin
          Result := Cells[ X, Y ];

     end, Gamm_, Tone_ );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TPoinColorGrid2D_TByteRGBE

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TPoinColorGrid2D_TByteRGBE.DrawTo( const BMP_:TBitmap; const Func_:TConstFunc<Integer,Integer,TByteRGBE>; const Gamm_:Single = 1; const Tone_:Single = 1 );
begin
     DrawTo( BMP_, function( const X,Y:Integer ) :TAlphaColor
     begin
          Result := TByteRGBA( TSingleRGBA( TSingleRGB( Func_( X, Y ) ).ToneMap( Tone_ ).Gamma( Gamm_ ) ) );
     end );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TPoinColorGrid2D_TByteRGBE.CopyTo( const BMP_:TBitmap; const Gamm_:Single = 1; const Tone_:Single = 1 );
begin
     DrawTo( BMP_, function( const X,Y:Integer ) :TByteRGBE
     begin
          Result := Poins[ X, Y ];

     end, Gamm_, Tone_ );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TCellColorGrid2D_TByteRGBE

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TCellColorGrid2D_TByteRGBE.DrawTo( const BMP_:TBitmap; const Func_:TConstFunc<Integer,Integer,TByteRGBE>; const Gamm_:Single = 1; const Tone_:Single = 1 );
begin
     DrawTo( BMP_, function( const X,Y:Integer ) :TAlphaColor
     begin
          Result := TByteRGBA( TSingleRGBA( TSingleRGB( Func_( X, Y ) ).ToneMap( Tone_ ).Gamma( Gamm_ ) ) );
     end );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TCellColorGrid2D_TByteRGBE.CopyTo( const BMP_:TBitmap; const Gamm_:Single = 1; const Tone_:Single = 1 );
begin
     DrawTo( BMP_, function( const X,Y:Integer ) :TByteRGBE
     begin
          Result := Cells[ X, Y ];

     end, Gamm_, Tone_ );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
