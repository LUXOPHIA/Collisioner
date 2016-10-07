unit LUX.Matrix.L3;

interface //#################################################################### ■

uses LUX.D3, LUX.Matrix.L2;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleM31

     TSingleM31 = record
     private
       __11 :Single;
       __21 :Single;
       __31 :Single;
       ///// アクセス
     public
       constructor Create( const _11_,_21_,_31_:Single );
       ///// プロパティ
       property _11 :Single read __11 write __11;
       property _21 :Single read __21 write __21;
       property _31 :Single read __31 write __31;
       ///// 算術演算子
       ///// メソッド
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleM3

     TSingleM3 = record
     private
       ///// アクセス
       function GetAxisX :TSingle3D;  procedure SetAxisX( const AxisX_:TSingle3D );
       function GetAxisY :TSingle3D;  procedure SetAxisY( const AxisY_:TSingle3D );
       function GetAxisZ :TSingle3D;  procedure SetAxisZ( const AxisZ_:TSingle3D );
       function GetSum   :Single;
     public
       _11 :Single;
       _21 :Single;
       _31 :Single;
       _12 :Single;
       _22 :Single;
       _32 :Single;
       _13 :Single;
       _23 :Single;
       _33 :Single;
       /////
       constructor Create( const _11_,_12_,_13_,
                                 _21_,_22_,_23_,
                                 _31_,_32_,_33_:Single );
       ///// プロパティ
       property AxisX :TSingle3D read GetAxisX write SetAxisX;
       property AxisY :TSingle3D read GetAxisY write SetAxisY;
       property AxisZ :TSingle3D read GetAxisZ write SetAxisZ;
       property Sum   :Single    read GetSum;
       ///// 算術演算子
       class operator Negative( const V_:TSingleM3 ) :TSingleM3;
       class operator Positive( const V_:TSingleM3 ) :TSingleM3;
       class operator Add( const A_,B_:TSingleM3 ) :TSingleM3;
       class operator Subtract( const A_,B_:TSingleM3 ) :TSingleM3;
       class operator Multiply( const A_,B_:TSingleM3 ) :TSingleM3;
       class operator Multiply( const A_:TSingleM3; const B_:Single ) :TSingleM3;
       class operator Multiply( const A_:Single; const B_:TSingleM3 ) :TSingleM3;
       class operator Multiply( const A_:TSingle3D; const B_:TSingleM3 ) :TSingle3D;
       class operator Multiply( const A_:TSingleM3; const B_:TSingle3D ) :TSingle3D;
       class operator Multiply( const A_:TSingleM3; const B_:TSingleM31 ) :TSingleM31;
       class operator Divide( const A_:TSingleM3; const B_:Single ) :TSingleM3;
       ///// メソッド
       function Transpose :TSingleM3;
       function Det :Single;
       function Adjugate :TSingleM3;
       function Inverse :TSingleM3;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleM3

     TDoubleM3 = record
     private
       ///// アクセス
       function GetAxisX :TDouble3D;
       procedure SetAxisX( const AxisX_:TDouble3D );
       function GetAxisY :TDouble3D;
       procedure SetAxisY( const AxisY_:TDouble3D );
       function GetAxisZ :TDouble3D;
       procedure SetAxisZ( const AxisZ_:TDouble3D );
     public
       _11 :Double;
       _21 :Double;
       _31 :Double;
       _12 :Double;
       _22 :Double;
       _32 :Double;
       _13 :Double;
       _23 :Double;
       _33 :Double;
       /////
       constructor Create( const _11_,_12_,_13_,
                                 _21_,_22_,_23_,
                                 _31_,_32_,_33_:Double );
       ///// プロパティ
       property AxisX :TDouble3D read GetAxisX write SetAxisX;
       property AxisY :TDouble3D read GetAxisY write SetAxisY;
       property AxisZ :TDouble3D read GetAxisZ write SetAxisZ;
       ///// 算術演算子
       class operator Negative( const V_:TDoubleM3 ) :TDoubleM3;
       class operator Positive( const V_:TDoubleM3 ) :TDoubleM3;
       class operator Add( const A_,B_:TDoubleM3 ) :TDoubleM3;
       class operator Subtract( const A_,B_:TDoubleM3 ) :TDoubleM3;
       class operator Multiply( const A_,B_:TDoubleM3 ) :TDoubleM3;
       class operator Multiply( const A_:TDoubleM3; const B_:Double ) :TDoubleM3;
       class operator Multiply( const A_:Double; const B_:TDoubleM3 ) :TDoubleM3;
       class operator Multiply( const A_:TDouble3D; const B_:TDoubleM3 ) :TDouble3D;
       class operator Multiply( const A_:TDoubleM3; const B_:TDouble3D ) :TDouble3D;
       class operator Divide( const A_:TDoubleM3; const B_:Double ) :TDoubleM3;
       ///// メソッド
       function Transpose :TDoubleM3;
       function Det :Double;
       function Adjugate :TDoubleM3;
       function Inverse :TDoubleM3;
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleM31

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TSingleM31.Create( const _11_,_21_,_31_:Single );
begin
     _11 := _11_;
     _21 := _21_;
     _31 := _31_;
end;

///////////////////////////////////////////////////////////////////////// 演算子

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleM3

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TSingleM3.GetAxisX :TSingle3D;
begin
     with Result do
     begin
          X := _11;
          Y := _21;
          Z := _31;
     end
end;

procedure TSingleM3.SetAxisX( const AxisX_:TSingle3D );
begin
     with AxisX_ do
     begin
          _11 := X;
          _21 := Y;
          _31 := Z;
     end
end;

function TSingleM3.GetAxisY :TSingle3D;
begin
     with Result do
     begin
          X := _12;
          Y := _22;
          Z := _32;
     end
end;

procedure TSingleM3.SetAxisY( const AxisY_:TSingle3D );
begin
     with AxisY_ do
     begin
          _12 := X;
          _22 := Y;
          _32 := Z;
     end
end;

function TSingleM3.GetAxisZ :TSingle3D;
begin
     with Result do
     begin
          X := _13;
          Y := _23;
          Z := _33;
     end
end;

procedure TSingleM3.SetAxisZ( const AxisZ_:TSingle3D );
begin
     with AxisZ_ do
     begin
          _13 := X;
          _23 := Y;
          _33 := Z;
     end
end;

function TSingleM3.GetSum :Single;
begin
     Result := _11 + _12 + _13
             + _21 + _22 + _23
             + _31 + _32 + _33
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TSingleM3.Create( const _11_,_12_,_13_,
                                    _21_,_22_,_23_,
                                    _31_,_32_,_33_:Single );
begin
     _11 := _11_;  _12 := _12_;  _13 := _13_;
     _21 := _21_;  _22 := _22_;  _23 := _23_;
     _31 := _31_;  _32 := _32_;  _33 := _33_;
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TSingleM3.Positive( const V_:TSingleM3 ) :TSingleM3;
begin
     with Result do
     begin
          _11 := +V_._11;  _12 := +V_._12;  _13 := +V_._13;
          _21 := +V_._21;  _22 := +V_._22;  _23 := +V_._23;
          _31 := +V_._31;  _32 := +V_._32;  _33 := +V_._33;
     end
end;

class operator TSingleM3.Negative( const V_:TSingleM3 ) :TSingleM3;
begin
     with Result do
     begin
          _11 := -V_._11;  _12 := -V_._12;  _13 := -V_._13;
          _21 := -V_._21;  _22 := -V_._22;  _23 := -V_._23;
          _31 := -V_._31;  _32 := -V_._32;  _33 := -V_._33;
     end
end;

class operator TSingleM3.Add( const A_,B_:TSingleM3 ) :TSingleM3;
begin
     with Result do
     begin
          _11 := A_._11 + B_._11;  _12 := A_._12 + B_._12;  _13 := A_._13 + B_._13;
          _21 := A_._21 + B_._21;  _22 := A_._22 + B_._22;  _23 := A_._23 + B_._23;
          _31 := A_._31 + B_._31;  _32 := A_._32 + B_._32;  _33 := A_._33 + B_._33;
     end
end;

class operator TSingleM3.Subtract( const A_,B_:TSingleM3 ) :TSingleM3;
begin
     with Result do
     begin
          _11 := A_._11 - B_._11;  _12 := A_._12 - B_._12;  _13 := A_._13 - B_._13;
          _21 := A_._21 - B_._21;  _22 := A_._22 - B_._22;  _23 := A_._23 - B_._23;
          _31 := A_._31 - B_._31;  _32 := A_._32 - B_._32;  _33 := A_._33 - B_._33;
     end
end;

class operator TSingleM3.Multiply( const A_,B_:TSingleM3 ) :TSingleM3;
begin
     // _11 _12 _13    _11 _12 _13
     // _21 _22 _23 × _21 _22 _23
     // _31 _32 _33    _31 _32 _33

     with Result do
     begin
          _11 := A_._11 * B_._11 + A_._12 * B_._21 + A_._13 * B_._31;
          _12 := A_._11 * B_._12 + A_._12 * B_._22 + A_._13 * B_._32;
          _13 := A_._11 * B_._13 + A_._12 * B_._23 + A_._13 * B_._33;

          _21 := A_._21 * B_._11 + A_._22 * B_._21 + A_._23 * B_._31;
          _22 := A_._21 * B_._12 + A_._22 * B_._22 + A_._23 * B_._32;
          _23 := A_._21 * B_._13 + A_._22 * B_._23 + A_._23 * B_._33;

          _31 := A_._31 * B_._11 + A_._32 * B_._21 + A_._33 * B_._31;
          _32 := A_._31 * B_._12 + A_._32 * B_._22 + A_._33 * B_._32;
          _33 := A_._31 * B_._13 + A_._32 * B_._23 + A_._33 * B_._33;
     end
end;

class operator TSingleM3.Multiply( const A_:TSingleM3; const B_:Single ) :TSingleM3;
begin
     with Result do
     begin
          _11 := A_._11 * B_;  _12 := A_._12 * B_;  _13 := A_._13 * B_;
          _21 := A_._21 * B_;  _22 := A_._22 * B_;  _23 := A_._23 * B_;
          _31 := A_._31 * B_;  _32 := A_._32 * B_;  _33 := A_._33 * B_;
     end
end;

class operator TSingleM3.Multiply( const A_:Single; const B_:TSingleM3 ) :TSingleM3;
begin
     with Result do
     begin
          _11 := A_ * B_._11;  _12 := A_ * B_._12;  _13 := A_ * B_._13;
          _21 := A_ * B_._21;  _22 := A_ * B_._22;  _23 := A_ * B_._23;
          _31 := A_ * B_._31;  _32 := A_ * B_._32;  _33 := A_ * B_._33;
     end
end;

class operator TSingleM3.Multiply( const A_:TSingle3D; const B_:TSingleM3 ) :TSingle3D;
begin
     {
                 _11 _12 _13
        X Y Z × _21 _22 _23
                 _31 _32 _33
     }

     with Result do
     begin
          X := A_.X * B_._11 + A_.Y * B_._21 + A_.Z * B_._31;
          Y := A_.X * B_._12 + A_.Y * B_._22 + A_.Z * B_._32;
          Z := A_.X * B_._13 + A_.Y * B_._23 + A_.Z * B_._33;
     end
end;

class operator TSingleM3.Multiply( const A_:TSingleM3; const B_:TSingle3D ) :TSingle3D;
begin
     {
       _11 _12 _13    X
       _21 _22 _23 × Y
       _31 _32 _33    Z
     }

     with Result do
     begin
          X := A_._11 * B_.X + A_._12 * B_.Y + A_._13 * B_.Z;
          Y := A_._21 * B_.X + A_._22 * B_.Y + A_._23 * B_.Z;
          Z := A_._31 * B_.X + A_._32 * B_.Y + A_._33 * B_.Z;
     end
end;

class operator TSingleM3.Multiply( const A_:TSingleM3; const B_:TSingleM31 ) :TSingleM31;
begin
     {
       A_._11 A_._12 A_._13    B_._11
       A_._21 A_._22 A_._23 × B_._21
       A_._31 A_._32 A_._33    B_._31
     }

     with Result do
     begin
          _11 := A_._11 * B_._11 + A_._12 * B_._21 + A_._13 * B_._31;
          _21 := A_._21 * B_._11 + A_._22 * B_._21 + A_._23 * B_._31;
          _31 := A_._31 * B_._11 + A_._32 * B_._21 + A_._33 * B_._31;
     end
end;

class operator TSingleM3.Divide( const A_:TSingleM3; const B_:Single ) :TSingleM3;
begin
     with Result do
     begin
          _11 := A_._11 / B_;  _12 := A_._12 / B_;  _13 := A_._13 / B_;
          _21 := A_._21 / B_;  _22 := A_._22 / B_;  _23 := A_._23 / B_;
          _31 := A_._31 / B_;  _32 := A_._32 / B_;  _33 := A_._33 / B_;
     end
end;

///////////////////////////////////////////////////////////////////////// 型変換

////////////////////////////////////////////////////////////////////////////////

function TSingleM3.Transpose :TSingleM3;
begin
     Result._11 := _11;  Result._12 := _21;  Result._13 := _31;
     Result._21 := _12;  Result._22 := _22;  Result._23 := _32;
     Result._31 := _13;  Result._32 := _23;  Result._33 := _33;
end;

function TSingleM3.Det :Single;
begin
     Result:= _11 * ( _22 * _33 - _23 * _32 )
            + _12 * ( _23 * _31 - _21 * _33 )
            + _13 * ( _21 * _32 - _22 * _31 )
end;

function TSingleM3.Adjugate :TSingleM3;
begin
     Result._11 := +TSingleM2.Create( {11} {12} {13}
                                      {21} _22, _23,
                                      {31} _32, _33  ).Det;

     Result._21 := -TSingleM2.Create( {11} {12} {13}
                                      _21, {22} _23,
                                      _31, {32} _33  ).Det;

     Result._31 := +TSingleM2.Create( {11} {12} {13}
                                      _21, _22, {23}
                                      _31, _32  {33} ).Det;

     Result._12 := -TSingleM2.Create( {11} _12, _13,
                                      {21} {22} {23}
                                      {31} _32, _33  ).Det;

     Result._22 := +TSingleM2.Create( _11, {12} _13,
                                      {21} {22} {23}
                                      _31, {32} _33  ).Det;

     Result._32 := -TSingleM2.Create( _11, _12, {13}
                                      {21} {22} {23}
                                      _31, _32  {33} ).Det;

     Result._13 := +TSingleM2.Create( {11} _12, _13,
                                      {21} _22, _23
                                      {31} {32} {33} ).Det;

     Result._23 := -TSingleM2.Create( _11, {12} _13,
                                      _21, {22} _23
                                      {31} {32} {33} ).Det;

     Result._33 := +TSingleM2.Create( _11, _12, {13}
                                      _21, _22  {23}
                                      {31} {32} {33} ).Det;
end;

function TSingleM3.Inverse :TSingleM3;
var
   A :TSingleM3;
begin
     A := Adjugate;

     Result := A / ( _11 * A._11
                   + _12 * A._21
                   + _13 * A._31 )
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleM3

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TDoubleM3.GetAxisX :TDouble3D;
begin
     with Result do
     begin
          X := _11;
          Y := _21;
          Z := _31;
     end
end;

procedure TDoubleM3.SetAxisX( const AxisX_:TDouble3D );
begin
     with AxisX_ do
     begin
          _11 := X;
          _21 := Y;
          _31 := Z;
     end
end;

function TDoubleM3.GetAxisY :TDouble3D;
begin
     with Result do
     begin
          X := _12;
          Y := _22;
          Z := _32;
     end
end;

procedure TDoubleM3.SetAxisY( const AxisY_:TDouble3D );
begin
     with AxisY_ do
     begin
          _12 := X;
          _22 := Y;
          _32 := Z;
     end
end;

function TDoubleM3.GetAxisZ :TDouble3D;
begin
     with Result do
     begin
          X := _13;
          Y := _23;
          Z := _33;
     end
end;

procedure TDoubleM3.SetAxisZ( const AxisZ_:TDouble3D );
begin
     with AxisZ_ do
     begin
          _13 := X;
          _23 := Y;
          _33 := Z;
     end
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TDoubleM3.Create( const _11_,_12_,_13_,
                                    _21_,_22_,_23_,
                                    _31_,_32_,_33_:Double );
begin
     _11 := _11_;  _12 := _12_;  _13 := _13_;
     _21 := _21_;  _22 := _22_;  _23 := _23_;
     _31 := _31_;  _32 := _32_;  _33 := _33_;
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TDoubleM3.Positive( const V_:TDoubleM3 ) :TDoubleM3;
begin
     with Result do
     begin
          _11 := +V_._11;  _12 := +V_._12;  _13 := +V_._13;
          _21 := +V_._21;  _22 := +V_._22;  _23 := +V_._23;
          _31 := +V_._31;  _32 := +V_._32;  _33 := +V_._33;
     end
end;

class operator TDoubleM3.Negative( const V_:TDoubleM3 ) :TDoubleM3;
begin
     with Result do
     begin
          _11 := -V_._11;  _12 := -V_._12;  _13 := -V_._13;
          _21 := -V_._21;  _22 := -V_._22;  _23 := -V_._23;
          _31 := -V_._31;  _32 := -V_._32;  _33 := -V_._33;
     end
end;

class operator TDoubleM3.Add( const A_,B_:TDoubleM3 ) :TDoubleM3;
begin
     with Result do
     begin
          _11 := A_._11 + B_._11;  _12 := A_._12 + B_._12;  _13 := A_._13 + B_._13;
          _21 := A_._21 + B_._21;  _22 := A_._22 + B_._22;  _23 := A_._23 + B_._23;
          _31 := A_._31 + B_._31;  _32 := A_._32 + B_._32;  _33 := A_._33 + B_._33;
     end
end;

class operator TDoubleM3.Subtract( const A_,B_:TDoubleM3 ) :TDoubleM3;
begin
     with Result do
     begin
          _11 := A_._11 - B_._11;  _12 := A_._12 - B_._12;  _13 := A_._13 - B_._13;
          _21 := A_._21 - B_._21;  _22 := A_._22 - B_._22;  _23 := A_._23 - B_._23;
          _31 := A_._31 - B_._31;  _32 := A_._32 - B_._32;  _33 := A_._33 - B_._33;
     end
end;

class operator TDoubleM3.Multiply( const A_,B_:TDoubleM3 ) :TDoubleM3;
begin
     // _11 _12 _13    _11 _12 _13
     // _21 _22 _23 × _21 _22 _23
     // _31 _32 _33    _31 _32 _33

     with Result do
     begin
          _11 := A_._11 * B_._11 + A_._12 * B_._21 + A_._13 * B_._31;
          _12 := A_._11 * B_._12 + A_._12 * B_._22 + A_._13 * B_._32;
          _13 := A_._11 * B_._13 + A_._12 * B_._23 + A_._13 * B_._33;

          _21 := A_._21 * B_._11 + A_._22 * B_._21 + A_._23 * B_._31;
          _22 := A_._21 * B_._12 + A_._22 * B_._22 + A_._23 * B_._32;
          _23 := A_._21 * B_._13 + A_._22 * B_._23 + A_._23 * B_._33;

          _31 := A_._31 * B_._11 + A_._32 * B_._21 + A_._33 * B_._31;
          _32 := A_._31 * B_._12 + A_._32 * B_._22 + A_._33 * B_._32;
          _33 := A_._31 * B_._13 + A_._32 * B_._23 + A_._33 * B_._33;
     end
end;

class operator TDoubleM3.Multiply( const A_:TDoubleM3; const B_:Double ) :TDoubleM3;
begin
     with Result do
     begin
          _11 := A_._11 * B_;  _12 := A_._12 * B_;  _13 := A_._13 * B_;
          _21 := A_._21 * B_;  _22 := A_._22 * B_;  _23 := A_._23 * B_;
          _31 := A_._31 * B_;  _32 := A_._32 * B_;  _33 := A_._33 * B_;
     end
end;

class operator TDoubleM3.Multiply( const A_:Double; const B_:TDoubleM3 ) :TDoubleM3;
begin
     with Result do
     begin
          _11 := A_ * B_._11;  _12 := A_ * B_._12;  _13 := A_ * B_._13;
          _21 := A_ * B_._21;  _22 := A_ * B_._22;  _23 := A_ * B_._23;
          _31 := A_ * B_._31;  _32 := A_ * B_._32;  _33 := A_ * B_._33;
     end
end;

class operator TDoubleM3.Multiply( const A_:TDouble3D; const B_:TDoubleM3 ) :TDouble3D;
begin
     {
                 _11 _12 _13
        X Y Z × _21 _22 _23
                 _31 _32 _33
     }

     with Result do
     begin
          X := A_.X * B_._11 + A_.Y * B_._21 + A_.Z * B_._31;
          Y := A_.X * B_._12 + A_.Y * B_._22 + A_.Z * B_._32;
          Z := A_.X * B_._13 + A_.Y * B_._23 + A_.Z * B_._33;
     end
end;

class operator TDoubleM3.Multiply( const A_:TDoubleM3; const B_:TDouble3D ) :TDouble3D;
begin
     {
       _11 _12 _13    X
       _21 _22 _23 × Y
       _31 _32 _33    Z
     }

     with Result do
     begin
          X := A_._11 * B_.X + A_._12 * B_.Y + A_._13 * B_.Z;
          Y := A_._21 * B_.X + A_._22 * B_.Y + A_._23 * B_.Z;
          Z := A_._31 * B_.X + A_._32 * B_.Y + A_._33 * B_.Z;
     end
end;

class operator TDoubleM3.Divide( const A_:TDoubleM3; const B_:Double ) :TDoubleM3;
begin
     with Result do
     begin
          _11 := A_._11 / B_;  _12 := A_._12 / B_;  _13 := A_._13 / B_;
          _21 := A_._21 / B_;  _22 := A_._22 / B_;  _23 := A_._23 / B_;
          _31 := A_._31 / B_;  _32 := A_._32 / B_;  _33 := A_._33 / B_;
     end
end;

///////////////////////////////////////////////////////////////////////// 型変換

////////////////////////////////////////////////////////////////////////////////

function TDoubleM3.Transpose :TDoubleM3;
begin
     Result._11 := _11;  Result._12 := _21;  Result._13 := _31;
     Result._21 := _12;  Result._22 := _22;  Result._23 := _32;
     Result._31 := _13;  Result._32 := _23;  Result._33 := _33;
end;

function TDoubleM3.Det :Double;
begin
     Result:= _11 * ( _22 * _33 - _23 * _32 )
            + _12 * ( _23 * _31 - _21 * _33 )
            + _13 * ( _21 * _32 - _22 * _31 )
end;

function TDoubleM3.Adjugate :TDoubleM3;
begin
     Result._11 := +TDoubleM2.Create( {11} {12} {13}
                                      {21} _22, _23,
                                      {31} _32, _33  ).Det;

     Result._21 := -TDoubleM2.Create( {11} {12} {13}
                                      _21, {22} _23,
                                      _31, {32} _33  ).Det;

     Result._31 := +TDoubleM2.Create( {11} {12} {13}
                                      _21, _22, {23}
                                      _31, _32  {33} ).Det;

     Result._12 := -TDoubleM2.Create( {11} _12, _13,
                                      {21} {22} {23}
                                      {31} _32, _33  ).Det;

     Result._22 := +TDoubleM2.Create( _11, {12} _13,
                                      {21} {22} {23}
                                      _31, {32} _33  ).Det;

     Result._32 := -TDoubleM2.Create( _11, _12, {13}
                                      {21} {22} {23}
                                      _31, _32  {33} ).Det;

     Result._13 := +TDoubleM2.Create( {11} _12, _13,
                                      {21} _22, _23
                                      {31} {32} {33} ).Det;

     Result._23 := -TDoubleM2.Create( _11, {12} _13,
                                      _21, {22} _23
                                      {31} {32} {33} ).Det;

     Result._33 := +TDoubleM2.Create( _11, _12, {13}
                                      _21, _22  {23}
                                      {31} {32} {33} ).Det;
end;

function TDoubleM3.Inverse :TDoubleM3;
var
   A :TDoubleM3;
begin
     A := Adjugate;

     Result := A / ( _11 * A._11
                   + _12 * A._21
                   + _13 * A._31 )
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
