unit LUX.Color;

interface //#################################################################### ■

uses System.UITypes,
     LUX;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TByteRGB

     TByteRGB = packed record
     private
     public
     {$IFDEF BIGENDIAN}
       R :Byte;
       G :Byte;
       B :Byte;
     {$ELSE}
       B :Byte;
       G :Byte;
       R :Byte;
     {$ENDIF}
       /////
       constructor Create( const L_:Byte ); overload;
       constructor Create( const R_,G_,B_:Byte ); overload;
       ///// プロパティ
       ///// 演算子
       class operator Positive( const V_:TByteRGB ) :TByteRGB;
       class operator Add( const A_,B_:TByteRGB ) :TByteRGB;
       class operator Subtract( const A_,B_:TByteRGB ) :TByteRGB;
       class operator Multiply( const A_:Byte; const B_:TByteRGB ): TByteRGB;
       class operator Multiply( const A_:TByteRGB; const B_:Byte ): TByteRGB;
       class operator Divide( const A_:TByteRGB; const B_:Byte ): TByteRGB;
       ///// 型変換
       class operator Implicit( const L_:Byte ) :TByteRGB;
       class operator Implicit( const C_:TAlphaColor ) :TByteRGB;
       class operator Implicit( const C_:TByteRGB ) :TAlphaColor;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TByteRGBA

     PByteRGBA = ^TByteRGBA;

     TByteRGBA = packed record
     private
       ///// アクセス
       function GetR :Byte;
       procedure SetR( const R_:Byte );
       function GetG :Byte;
       procedure SetG( const G_:Byte );
       function GetB :Byte;
       procedure SetB( const B_:Byte );
     public
     {$IFDEF BIGENDIAN}
       A :Byte;
       C :TByteRGB;
     {$ELSE}
       C :TByteRGB;
       A :Byte;
     {$ENDIF}
       /////
       constructor Create( const L_:Byte; const A_:Byte = $FF ); overload;
       constructor Create( const R_,G_,B_:Byte; const A_:Byte = $FF ); overload;
       ///// プロパティ
       property R :Byte read GetR write SetR;
       property G :Byte read GetG write SetG;
       property B :Byte read GetB write SetB;
       ///// 演算子
       class operator Positive( const V_:TByteRGBA ) :TByteRGBA;
       class operator Add( const A_,B_:TByteRGBA ) :TByteRGBA;
       class operator Subtract( const A_,B_:TByteRGBA ) :TByteRGBA;
       class operator Multiply( const A_:Byte; const B_:TByteRGBA ): TByteRGBA;
       class operator Multiply( const A_:TByteRGBA; const B_:Byte ): TByteRGBA;
       class operator Divide( const A_:TByteRGBA; const B_:Byte ): TByteRGBA;
       ///// 型変換
       class operator Implicit( const L_:Byte ) :TByteRGBA;
       class operator Implicit( const C_:TByteRGB ) :TByteRGBA;
       class operator Explicit( const C_:TByteRGBA ) :TByteRGB;
       class operator Implicit( const C_:TAlphaColor ) :TByteRGBA;
       class operator Implicit( const C_:TByteRGBA ) :TAlphaColor;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleRGB

     TSingleRGB = record
     private
     public
       R :Single;
       G :Single;
       B :Single;
       /////
       constructor Create( const L_:Single ); overload;
       constructor Create( const R_,G_,B_:Single ); overload;
       ///// プロパティ
       ///// 演算子
       class operator Negative( const V_:TSingleRGB ) :TSingleRGB;
       class operator Positive( const V_:TSingleRGB ) :TSingleRGB;
       class operator Add( const A_,B_:TSingleRGB ) :TSingleRGB;
       class operator Subtract( const A_,B_:TSingleRGB ) :TSingleRGB;
       class operator Multiply( const A_:Single; const B_:TSingleRGB ): TSingleRGB;
       class operator Multiply( const A_:TSingleRGB; const B_:Single ): TSingleRGB;
       class operator Divide( const A_:TSingleRGB; const B_:Single ): TSingleRGB;
       ///// 型変換
       class operator Implicit( const L_:Single ) :TSingleRGB;
       class operator Implicit( const C_:TByteRGB ) :TSingleRGB;
       class operator Implicit( const C_:TSingleRGB ) :TByteRGB;
       ///// メソッド
       function Gamma( const C_:Single = 2.2 ) :TSingleRGB;
       function ToneMap( const W_:Single = 1 ) :TSingleRGB;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleRGBA

     TSingleRGBA = record
     private
       ///// アクセス
       function GetR :Single;
       procedure SetR( const R_:Single );
       function GetG :Single;
       procedure SetG( const G_:Single );
       function GetB :Single;
       procedure SetB( const B_:Single );
     public
       C :TSingleRGB;
       A :Single;
       /////
       constructor Create( const L_:Single; const A_:Single = 1 ); overload;
       constructor Create( const R_,G_,B_:Single; const A_:Single = 1 ); overload;
       ///// プロパティ
       property R :Single read GetR write SetR;
       property G :Single read GetG write SetG;
       property B :Single read GetB write SetB;
       ///// 演算子
       class operator Negative( const V_:TSingleRGBA ) :TSingleRGBA;
       class operator Positive( const V_:TSingleRGBA ) :TSingleRGBA;
       class operator Add( const A_,B_:TSingleRGBA ) :TSingleRGBA;
       class operator Subtract( const A_,B_:TSingleRGBA ) :TSingleRGBA;
       class operator Multiply( const A_:Single; const B_:TSingleRGBA ): TSingleRGBA;
       class operator Multiply( const A_:TSingleRGBA; const B_:Single ): TSingleRGBA;
       class operator Divide( const A_:TSingleRGBA; const B_:Single ): TSingleRGBA;
       ///// 型変換
       class operator Implicit( const L_:Single ) :TSingleRGBA;
       class operator Implicit( const C_:TByteRGBA ) :TSingleRGBA;
       class operator Explicit( const C_:TSingleRGBA ) :TByteRGBA;
       class operator Implicit( const C_:TSingleRGB ) :TSingleRGBA;
       class operator Explicit( const C_:TSingleRGBA ) :TSingleRGB;
       class operator Implicit( const C_:TSingleRGBA ) :TAlphaColorF;
       class operator Implicit( const C_:TAlphaColorF ) :TSingleRGBA;
       ///// メソッド
       function Gamma( const C_:Single = 2.2 ) :TSingleRGBA;
       function ToneMap( const W_:Single = 1 ) :TSingleRGBA;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TByteRGBE

     TByteRGBE = packed record
     private
       ///// アクセス
       function GetR :Byte;
       procedure SetR( const R_:Byte );
       function GetG :Byte;
       procedure SetG( const G_:Byte );
       function GetB :Byte;
       procedure SetB( const B_:Byte );
     public
       C :TByteRGB;
       E :Byte;
       /////
       constructor Create( const L_:Byte; const E_:Byte = 128 ); overload;
       constructor Create( const R_,G_,B_:Byte; const E_:Byte = 128 ); overload;
       ///// プロパティ
       property R :Byte read GetR write SetR;
       property G :Byte read GetG write SetG;
       property B :Byte read GetB write SetB;
       ///// 演算子
       ///// 型変換
       class operator Implicit( const L_:Byte ) :TByteRGBE;
       class operator Implicit( const C_:TByteRGBE ) :TSingleRGB;
       class operator Implicit( const C_:TSingleRGB ) :TByteRGBE;
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.Math;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TByteRGB

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TByteRGB.Create( const L_:Byte );
begin
     R := L_;
     G := L_;
     B := L_;
end;

constructor TByteRGB.Create( const R_,G_,B_:Byte );
begin
     R := R_;
     G := G_;
     B := B_;
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TByteRGB.Positive( const V_:TByteRGB ) :TByteRGB;
begin
     with Result do
     begin
          R := +V_.R;
          G := +V_.G;
          B := +V_.B;
     end;
end;

class operator TByteRGB.Add( const A_,B_:TByteRGB ) :TByteRGB;
begin
     with Result do
     begin
          R := A_.R + B_.R;
          G := A_.G + B_.G;
          B := A_.B + B_.B;
     end;
end;

class operator TByteRGB.Subtract( const A_,B_:TByteRGB ) :TByteRGB;
begin
     with Result do
     begin
          R := A_.R - B_.R;
          G := A_.G - B_.G;
          B := A_.B - B_.B;
     end;
end;

class operator TByteRGB.Multiply( const A_:Byte; const B_:TByteRGB ): TByteRGB;
begin
     with Result do
     begin
          R := A_ * B_.R;
          G := A_ * B_.G;
          B := A_ * B_.B;
     end;
end;

class operator TByteRGB.Multiply( const A_:TByteRGB; const B_:Byte ): TByteRGB;
begin
     with Result do
     begin
          R := A_.R * B_;
          G := A_.G * B_;
          B := A_.B * B_;
     end;
end;

class operator TByteRGB.Divide( const A_:TByteRGB; const B_:Byte ): TByteRGB;
begin
     with Result do
     begin
          R := A_.R div B_;
          G := A_.G div B_;
          B := A_.B div B_;
     end;
end;

///////////////////////////////////////////////////////////////////////// 型変換

class operator TByteRGB.Implicit( const L_:Byte ) :TByteRGB;
begin
     with Result do
     begin
          R := L_;
          G := L_;
          B := L_;
     end;
end;

class operator TByteRGB.Implicit( const C_:TAlphaColor ) :TByteRGB;
begin
     Result := TByteRGBA( C_ ).C;
end;

class operator TByteRGB.Implicit( const C_:TByteRGB ) :TAlphaColor;
begin
     Result := TByteRGBA( C_ );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TByteRGBA

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TByteRGBA.GetR :Byte;
begin
     Result := C.R;
end;

procedure TByteRGBA.SetR( const R_:Byte );
begin
     C.R := R_;
end;

function TByteRGBA.GetG :Byte;
begin
     Result := C.G;
end;

procedure TByteRGBA.SetG( const G_:Byte );
begin
     C.G := G_;
end;

function TByteRGBA.GetB :Byte;
begin
     Result := C.B;
end;

procedure TByteRGBA.SetB( const B_:Byte );
begin
     C.B := B_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TByteRGBA.Create( const L_:Byte; const A_:Byte );
begin
     C := L_;
     A := A_;
end;

constructor TByteRGBA.Create( const R_,G_,B_:Byte; const A_:Byte );
begin
     R := R_;
     G := G_;
     B := B_;
     A := A_;
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TByteRGBA.Positive( const V_:TByteRGBA ) :TByteRGBA;
begin
     with Result do
     begin
          C := +V_.C;
          A := +V_.A;
     end;
end;

class operator TByteRGBA.Add( const A_,B_:TByteRGBA ) :TByteRGBA;
begin
     with Result do
     begin
          C := A_.C + B_.C;
          A := A_.A + B_.A;
     end;
end;

class operator TByteRGBA.Subtract( const A_,B_:TByteRGBA ) :TByteRGBA;
begin
     with Result do
     begin
          C := A_.C - B_.C;
          A := A_.A - B_.A;
     end;
end;

class operator TByteRGBA.Multiply( const A_:Byte; const B_:TByteRGBA ): TByteRGBA;
begin
     with Result do
     begin
          C := A_ * B_.C;
          A := A_ * B_.A;
     end;
end;

class operator TByteRGBA.Multiply( const A_:TByteRGBA; const B_:Byte ): TByteRGBA;
begin
     with Result do
     begin
          C := A_.C * B_;
          A := A_.A * B_;
     end;
end;

class operator TByteRGBA.Divide( const A_:TByteRGBA; const B_:Byte ): TByteRGBA;
begin
     with Result do
     begin
        //C := A_.C div B_;  //E2015 この型には指定した演算子は使えません
          R := A_.R div B_;
          G := A_.G div B_;
          B := A_.B div B_;

          A := A_.A div B_;
     end;
end;

///////////////////////////////////////////////////////////////////////// 型変換

class operator TByteRGBA.Implicit( const L_:Byte ) :TByteRGBA;
begin
     with Result do
     begin
          C := L_;
          A := $FF;
     end;
end;

class operator TByteRGBA.Implicit( const C_:TByteRGB ) :TByteRGBA;
begin
     with Result do
     begin
          C := C_;
          A := 255;
     end;
end;

class operator TByteRGBA.Explicit( const C_:TByteRGBA ) :TByteRGB;
begin
     Result := C_.C;
end;

class operator TByteRGBA.Implicit( const C_:TAlphaColor ) :TByteRGBA;
begin
     Result := PByteRGBA( @C_ )^;
end;

class operator TByteRGBA.Implicit( const C_:TByteRGBA ) :TAlphaColor;
begin
     Result := PAlphaColor( @C_ )^;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleRGB

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TSingleRGB.Create( const L_:Single );
begin
     R := L_;
     G := L_;
     B := L_;
end;

constructor TSingleRGB.Create( const R_,G_,B_:Single );
begin
     R := R_;
     G := G_;
     B := B_;
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TSingleRGB.Negative( const V_:TSingleRGB ) :TSingleRGB;
begin
     with Result do
     begin
          R := -V_.R;
          G := -V_.G;
          B := -V_.B;
     end;
end;

class operator TSingleRGB.Positive( const V_:TSingleRGB ) :TSingleRGB;
begin
     with Result do
     begin
          R := +V_.R;
          G := +V_.G;
          B := +V_.B;
     end;
end;

class operator TSingleRGB.Add( const A_,B_:TSingleRGB ) :TSingleRGB;
begin
     with Result do
     begin
          R := A_.R + B_.R;
          G := A_.G + B_.G;
          B := A_.B + B_.B;
     end;
end;

class operator TSingleRGB.Subtract( const A_,B_:TSingleRGB ) :TSingleRGB;
begin
     with Result do
     begin
          R := A_.R - B_.R;
          G := A_.G - B_.G;
          B := A_.B - B_.B;
     end;
end;

class operator TSingleRGB.Multiply( const A_:Single; const B_:TSingleRGB ): TSingleRGB;
begin
     with Result do
     begin
          R := A_ * B_.R;
          G := A_ * B_.G;
          B := A_ * B_.B;
     end;
end;

class operator TSingleRGB.Multiply( const A_:TSingleRGB; const B_:Single ): TSingleRGB;
begin
     with Result do
     begin
          R := A_.R * B_;
          G := A_.G * B_;
          B := A_.B * B_;
     end;
end;

class operator TSingleRGB.Divide( const A_:TSingleRGB; const B_:Single ): TSingleRGB;
begin
     with Result do
     begin
          R := A_.R / B_;
          G := A_.G / B_;
          B := A_.B / B_;
     end;
end;

///////////////////////////////////////////////////////////////////////// 型変換

class operator TSingleRGB.Implicit( const L_:Single ) :TSingleRGB;
begin
     with Result do
     begin
          R := L_;
          G := L_;
          B := L_;
     end;
end;

class operator TSingleRGB.Implicit( const C_:TByteRGB ) :TSingleRGB;
begin
     with Result do
     begin
          R := C_.R / 255;
          G := C_.G / 255;
          B := C_.B / 255;
     end;
end;

class operator TSingleRGB.Implicit( const C_:TSingleRGB ) :TByteRGB;
begin
     with Result do
     begin
          R := Round( 255 * Clamp( C_.R, 0, 1 ) );
          G := Round( 255 * Clamp( C_.G, 0, 1 ) );
          B := Round( 255 * Clamp( C_.B, 0, 1 ) );
     end;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TSingleRGB.Gamma( const C_:Single = 2.2 ) :TSingleRGB;
var
   C :Single;
begin
     C := 1 / C_;

     Result.R := Power( R, C );
     Result.G := Power( G, C );
     Result.B := Power( B, C );
end;

//------------------------------------------------------------------------------

function TSingleRGB.ToneMap( const W_:Single = 1 ) :TSingleRGB;
var
   W2 :Single;
begin
     W2 := Pow2( W_ );

     Result.R := Clamp( R * ( 1 + R / W2 ) / ( 1 + R ), 0, 1 );
     Result.G := Clamp( G * ( 1 + G / W2 ) / ( 1 + G ), 0, 1 );
     Result.B := Clamp( B * ( 1 + B / W2 ) / ( 1 + B ), 0, 1 );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleRGBA

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TSingleRGBA.GetR :Single;
begin
     Result := C.R;
end;

procedure TSingleRGBA.SetR( const R_:Single );
begin
     C.R := R_;
end;

function TSingleRGBA.GetG :Single;
begin
     Result := C.G;
end;

procedure TSingleRGBA.SetG( const G_:Single );
begin
     C.G := G_;
end;

function TSingleRGBA.GetB :Single;
begin
     Result := C.B;
end;

procedure TSingleRGBA.SetB( const B_:Single );
begin
     C.B := B_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TSingleRGBA.Create( const L_:Single; const A_:Single = 1 );
begin
     C := L_;
     A := A_;
end;

constructor TSingleRGBA.Create( const R_,G_,B_:Single; const A_:Single = 1 );
begin
     R := R_;
     G := G_;
     B := B_;
     A := A_;
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TSingleRGBA.Negative( const V_:TSingleRGBA ) :TSingleRGBA;
begin
     with Result do
     begin
          C := -V_.C;
          A := -V_.A;
     end;
end;

class operator TSingleRGBA.Positive( const V_:TSingleRGBA ) :TSingleRGBA;
begin
     with Result do
     begin
          C := +V_.C;
          A := +V_.A;
     end;
end;

class operator TSingleRGBA.Add( const A_,B_:TSingleRGBA ) :TSingleRGBA;
begin
     with Result do
     begin
          C := A_.C + B_.C;
          A := A_.A + B_.A;
     end;
end;

class operator TSingleRGBA.Subtract( const A_,B_:TSingleRGBA ) :TSingleRGBA;
begin
     with Result do
     begin
          C := A_.C - B_.C;
          A := A_.A - B_.A;
     end;
end;

class operator TSingleRGBA.Multiply( const A_:Single; const B_:TSingleRGBA ): TSingleRGBA;
begin
     with Result do
     begin
          C := A_ * B_.C;
          A := A_ * B_.A;
     end;
end;

class operator TSingleRGBA.Multiply( const A_:TSingleRGBA; const B_:Single ): TSingleRGBA;
begin
     with Result do
     begin
          C := A_.C * B_;
          A := A_.A * B_;
     end;
end;

class operator TSingleRGBA.Divide( const A_:TSingleRGBA; const B_:Single ): TSingleRGBA;
begin
     with Result do
     begin
          C := A_.C / B_;
          A := A_.A / B_;
     end;
end;

///////////////////////////////////////////////////////////////////////// 型変換

class operator TSingleRGBA.Implicit( const L_:Single ) :TSingleRGBA;
begin
     with Result do
     begin
          C := L_;
          A := 1;
     end;
end;

//------------------------------------------------------------------------------

class operator TSingleRGBA.Implicit( const C_:TByteRGBA ) :TSingleRGBA;
begin
     with Result do
     begin
          C := C_.C;

          A := C_.A / 255;
     end;
end;

class operator TSingleRGBA.Explicit( const C_:TSingleRGBA ) :TByteRGBA;
begin
     with Result do
     begin
          C := C_.C;

          A := Round( 255 * Clamp( C_.A, 0, 1 ) );
     end;
end;

//------------------------------------------------------------------------------

class operator TSingleRGBA.Implicit( const C_:TSingleRGB ) :TSingleRGBA;
begin
     Result.C := C_;
     Result.A := 1 ;
end;

class operator TSingleRGBA.Explicit( const C_:TSingleRGBA ) :TSingleRGB;
begin
     Result := C_.C;
end;

//------------------------------------------------------------------------------

class operator TSingleRGBA.Implicit( const C_:TSingleRGBA ) :TAlphaColorF;
begin
     with Result do
     begin
          R := C_.R;
          G := C_.G;
          B := C_.B;
          A := C_.A;
     end;
end;

class operator TSingleRGBA.Implicit( const C_:TAlphaColorF ) :TSingleRGBA;
begin
     with Result do
     begin
          R := C_.R;
          G := C_.G;
          B := C_.B;
          A := C_.A;
     end;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TSingleRGBA.Gamma( const C_:Single = 2.2 ) :TSingleRGBA;
begin
     Result.C := C.Gamma( C_ );
     Result.A := A;
end;

//------------------------------------------------------------------------------

function TSingleRGBA.ToneMap( const W_:Single = 1 ) :TSingleRGBA;
begin
     Result.C := C.ToneMap( W_ );
     Result.A := A;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TByteRGBE

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TByteRGBE.GetR :Byte;
begin
     Result := C.R;
end;

procedure TByteRGBE.SetR( const R_:Byte );
begin
     C.R := R_;
end;

function TByteRGBE.GetG :Byte;
begin
     Result := C.G;
end;

procedure TByteRGBE.SetG( const G_:Byte );
begin
     C.G := G_;
end;

function TByteRGBE.GetB :Byte;
begin
     Result := C.B;
end;

procedure TByteRGBE.SetB( const B_:Byte );
begin
     C.B := B_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TByteRGBE.Create( const L_:Byte; const E_:Byte = 128 );
begin
     C := L_;
     E := E_;
end;

constructor TByteRGBE.Create( const R_,G_,B_:Byte; const E_:Byte = 128 );
begin
     R := R_;
     G := G_;
     B := B_;
     E := E_;
end;

///////////////////////////////////////////////////////////////////////// 演算子

///////////////////////////////////////////////////////////////////////// 型変換

class operator TByteRGBE.Implicit( const L_:Byte ) :TByteRGBE;
begin
     with Result do
     begin
          C := L_;
          E := 128;
     end;
end;

class operator TByteRGBE.Implicit( const C_:TByteRGBE ) :TSingleRGB;
var
   E :Shortint;
   S :Single;
begin
     E := C_.E - 128;

     S := IntPower( 2, +E ) / 255;

     Result.R := S * C_.R;
     Result.G := S * C_.G;
     Result.B := S * C_.B;
end;

class operator TByteRGBE.Implicit( const C_:TSingleRGB ) :TByteRGBE;
var
   L :Single;
   E :Shortint;
   S :Single;
begin
     with C_ do L := Max( R, G, B );

     E := Ceil( Log2( L ) );

     S := IntPower( 2, -E ) * 255;

     Result.R := Round( S * C_.R );
     Result.G := Round( S * C_.G );
     Result.B := Round( S * C_.B );
     Result.E := 128 + E;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
