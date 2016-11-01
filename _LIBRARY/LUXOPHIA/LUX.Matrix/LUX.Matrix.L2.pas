unit LUX.Matrix.L2;

interface //#################################################################### ■

uses LUX.D2;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleM2

     TSingleM2 = record
     private
     public
       _11 :Single;
       _21 :Single;
       _12 :Single;
       _22 :Single;
       /////
       constructor Create( const _11_,_12_,
                                 _21_,_22_:Single );
       ///// プロパティ
       ///// 演算子
       class operator Negative( const V_:TSingleM2 ) :TSingleM2;
       class operator Positive( const V_:TSingleM2 ) :TSingleM2;
       class operator Add( const A_,B_:TSingleM2 ) :TSingleM2;
       class operator Subtract( const A_,B_:TSingleM2 ) :TSingleM2;
       class operator Multiply( const A_,B_:TSingleM2 ) :TSingleM2;
       class operator Multiply( const A_:TSingleM2; const B_:Single ) :TSingleM2;
       class operator Multiply( const A_:Single; const B_:TSingleM2 ) :TSingleM2;
       class operator Multiply( const A_:TSingle2D; const B_:TSingleM2 ) :TSingle2D;
       class operator Multiply( const A_:TSingleM2; const B_:TSingle2D ) :TSingle2D;
       class operator Divide( const A_:TSingleM2; const B_:Single ) :TSingleM2;
       ///// メソッド
       function Det :Single;
       class function Rotate( const Angle_:Single ) :TSingleM2; static;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleM2

     TDoubleM2 = record
     private
     public
       _11 :Double;
       _21 :Double;
       _12 :Double;
       _22 :Double;
       /////
       constructor Create( const _11_,_12_,
                                 _21_,_22_:Double );
       ///// プロパティ
       ///// 演算子
       class operator Negative( const V_:TDoubleM2 ) :TDoubleM2;
       class operator Positive( const V_:TDoubleM2 ) :TDoubleM2;
       class operator Add( const A_,B_:TDoubleM2 ) :TDoubleM2;
       class operator Subtract( const A_,B_:TDoubleM2 ) :TDoubleM2;
       class operator Multiply( const A_,B_:TDoubleM2 ) :TDoubleM2;
       class operator Multiply( const A_:TDoubleM2; const B_:Double ) :TDoubleM2;
       class operator Multiply( const A_:Double; const B_:TDoubleM2 ) :TDoubleM2;
       class operator Multiply( const A_:TDouble2D; const B_:TDoubleM2 ) :TDouble2D;
       class operator Multiply( const A_:TDoubleM2; const B_:TDouble2D ) :TDouble2D;
       class operator Divide( const A_:TDoubleM2; const B_:Double ) :TDoubleM2;
       ///// メソッド
       function Det :Double;
       class function Rotate( const Angle_:Double ) :TDoubleM2; static;
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleM2

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TSingleM2.Create( const _11_,_12_, _21_,_22_:Single );
begin
     _11 := _11_;  _12 := _12_;
     _21 := _21_;  _22 := _22_;
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TSingleM2.Positive( const V_:TSingleM2 ) :TSingleM2;
begin
     with Result do
     begin
          _11 := +V_._11;  _12 := +V_._12;
          _21 := +V_._21;  _22 := +V_._22;
     end
end;

class operator TSingleM2.Negative( const V_:TSingleM2 ) :TSingleM2;
begin
     with Result do
     begin
          _11 := -V_._11;  _12 := -V_._12;
          _21 := -V_._21;  _22 := -V_._22;
     end
end;

class operator TSingleM2.Add( const A_,B_:TSingleM2 ) :TSingleM2;
begin
     with Result do
     begin
          _11 := A_._11 + B_._11;  _12 := A_._12 + B_._12;
          _21 := A_._21 + B_._21;  _22 := A_._22 + B_._22;
     end
end;

class operator TSingleM2.Subtract( const A_,B_:TSingleM2 ) :TSingleM2;
begin
     with Result do
     begin
          _11 := A_._11 - B_._11;  _12 := A_._12 - B_._12;
          _21 := A_._21 - B_._21;  _22 := A_._22 - B_._22;
     end
end;

class operator TSingleM2.Multiply( const A_,B_:TSingleM2 ) :TSingleM2;
begin
     // _11 _12    _11 _12
     // _21 _22 × _21 _22

     with Result do
     begin
          _11 := A_._11 * B_._11 + A_._12 * B_._21;
          _12 := A_._11 * B_._12 + A_._12 * B_._22;

          _21 := A_._21 * B_._11 + A_._22 * B_._21;
          _22 := A_._21 * B_._12 + A_._22 * B_._22;
     end
end;

class operator TSingleM2.Multiply( const A_:TSingleM2; const B_:Single ) :TSingleM2;
begin
     with Result do
     begin
          _11 := A_._11 * B_;  _12 := A_._12 * B_;
          _21 := A_._21 * B_;  _22 := A_._22 * B_;
     end
end;

class operator TSingleM2.Multiply( const A_:Single; const B_:TSingleM2 ) :TSingleM2;
begin
     with Result do
     begin
          _11 := A_ * B_._11;  _12 := A_ * B_._12;
          _21 := A_ * B_._21;  _22 := A_ * B_._22;
     end
end;

class operator TSingleM2.Multiply( const A_:TSingle2D; const B_:TSingleM2 ) :TSingle2D;
begin
     {
               _11 _12
        X Y × _21 _22
     }

     with Result do
     begin
          X := A_.X * B_._11 + A_.Y * B_._21;
          Y := A_.X * B_._12 + A_.Y * B_._22;
     end
end;

class operator TSingleM2.Multiply( const A_:TSingleM2; const B_:TSingle2D ) :TSingle2D;
begin
     {
       _11 _12    X
       _21 _22 × Y
     }

     with Result do
     begin
          X := A_._11 * B_.X + A_._12 * B_.Y;
          Y := A_._21 * B_.X + A_._22 * B_.Y;
     end
end;

class operator TSingleM2.Divide( const A_:TSingleM2; const B_:Single ) :TSingleM2;
begin
     with Result do
     begin
          _11 := A_._11 / B_;  _12 := A_._12 / B_;
          _21 := A_._21 / B_;  _22 := A_._22 / B_;
     end
end;

///////////////////////////////////////////////////////////////////////// 型変換

////////////////////////////////////////////////////////////////////////////////

function TSingleM2.Det :Single;
begin
     Result := _11 * _22 - _21 * _12;
end;

class function TSingleM2.Rotate( const Angle_:Single ) :TSingleM2;
var
   C, S :Single;
begin
     C := Cos( Angle_ );
     S := Sin( Angle_ );

     with Result do
     begin
          _11 :=  C;  _12 := -S;
          _21 := +S;  _22 :=  C;
     end
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleM2

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TDoubleM2.Create( const _11_,_12_, _21_,_22_:Double );
begin
     _11 := _11_;  _12 := _12_;
     _21 := _21_;  _22 := _22_;
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TDoubleM2.Positive( const V_:TDoubleM2 ) :TDoubleM2;
begin
     with Result do
     begin
          _11 := +V_._11;  _12 := +V_._12;
          _21 := +V_._21;  _22 := +V_._22;
     end
end;

class operator TDoubleM2.Negative( const V_:TDoubleM2 ) :TDoubleM2;
begin
     with Result do
     begin
          _11 := -V_._11;  _12 := -V_._12;
          _21 := -V_._21;  _22 := -V_._22;
     end
end;

class operator TDoubleM2.Add( const A_,B_:TDoubleM2 ) :TDoubleM2;
begin
     with Result do
     begin
          _11 := A_._11 + B_._11;  _12 := A_._12 + B_._12;
          _21 := A_._21 + B_._21;  _22 := A_._22 + B_._22;
     end
end;

class operator TDoubleM2.Subtract( const A_,B_:TDoubleM2 ) :TDoubleM2;
begin
     with Result do
     begin
          _11 := A_._11 - B_._11;  _12 := A_._12 - B_._12;
          _21 := A_._21 - B_._21;  _22 := A_._22 - B_._22;
     end
end;

class operator TDoubleM2.Multiply( const A_,B_:TDoubleM2 ) :TDoubleM2;
begin
     // _11 _12    _11 _12
     // _21 _22 × _21 _22

     with Result do
     begin
          _11 := A_._11 * B_._11 + A_._12 * B_._21;
          _12 := A_._11 * B_._12 + A_._12 * B_._22;

          _21 := A_._21 * B_._11 + A_._22 * B_._21;
          _22 := A_._21 * B_._12 + A_._22 * B_._22;
     end
end;

class operator TDoubleM2.Multiply( const A_:TDoubleM2; const B_:Double ) :TDoubleM2;
begin
     with Result do
     begin
          _11 := A_._11 * B_;  _12 := A_._12 * B_;
          _21 := A_._21 * B_;  _22 := A_._22 * B_;
     end
end;

class operator TDoubleM2.Multiply( const A_:Double; const B_:TDoubleM2 ) :TDoubleM2;
begin
     with Result do
     begin
          _11 := A_ * B_._11;  _12 := A_ * B_._12;
          _21 := A_ * B_._21;  _22 := A_ * B_._22;
     end
end;

class operator TDoubleM2.Multiply( const A_:TDouble2D; const B_:TDoubleM2 ) :TDouble2D;
begin
     {
               _11 _12
        X Y × _21 _22
     }

     with Result do
     begin
          X := A_.X * B_._11 + A_.Y * B_._21;
          Y := A_.X * B_._12 + A_.Y * B_._22;
     end
end;

class operator TDoubleM2.Multiply( const A_:TDoubleM2; const B_:TDouble2D ) :TDouble2D;
begin
     {
       _11 _12    X
       _21 _22 × Y
     }

     with Result do
     begin
          X := A_._11 * B_.X + A_._12 * B_.Y;
          Y := A_._21 * B_.X + A_._22 * B_.Y;
     end
end;

class operator TDoubleM2.Divide( const A_:TDoubleM2; const B_:Double ) :TDoubleM2;
begin
     with Result do
     begin
          _11 := A_._11 / B_;  _12 := A_._12 / B_;
          _21 := A_._21 / B_;  _22 := A_._22 / B_;
     end
end;

///////////////////////////////////////////////////////////////////////// 型変換

////////////////////////////////////////////////////////////////////////////////

function TDoubleM2.Det :Double;
begin
     Result := _11 * _22 - _21 * _12;
end;

class function TDoubleM2.Rotate( const Angle_:Double ) :TDoubleM2;
var
   C, S :Double;
begin
     C := Cos( Angle_ );
     S := Sin( Angle_ );

     with Result do
     begin
          _11 :=  C;  _12 := -S;
          _21 := +S;  _22 :=  C;
     end
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 終了化

end. //######################################################################### ■
