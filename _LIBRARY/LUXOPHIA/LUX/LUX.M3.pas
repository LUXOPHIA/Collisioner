unit LUX.M3;

interface //#################################################################### ■

uses LUX, LUX.D1, LUX.D2, LUX.D3, LUX.M2;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleM3

     TSingleM3 = record
     private
       ///// アクセス
       function GetM( const Y_,X_:Integer ) :Single;
       procedure SetM( const Y_,X_:Integer; const M_:Single );
       function GetAxisX :TSingle3D;
       procedure SetAxisX( const AxisX_:TSingle3D );
       function GetAxisY :TSingle3D;
       procedure SetAxisY( const AxisY_:TSingle3D );
       function GetAxisZ :TSingle3D;
       procedure SetAxisZ( const AxisZ_:TSingle3D );
       function GetSum :Single;
     public
       constructor Create( const _11_,_12_,_13_,
                                 _21_,_22_,_23_,
                                 _31_,_32_,_33_:Single );
       ///// プロパティ
       property M[ const Y_,X_:Integer ] :Single    read GetM     write SetM    ; default;
       property AxisX                    :TSingle3D read GetAxisX write SetAxisX;
       property AxisY                    :TSingle3D read GetAxisY write SetAxisY;
       property AxisZ                    :TSingle3D read GetAxisZ write SetAxisZ;
       property Sum                      :Single    read GetSum;
       ///// 演算子
       class operator Negative( const V_:TSingleM3 ) :TSingleM3;
       class operator Positive( const V_:TSingleM3 ) :TSingleM3;
       class operator Add( const A_,B_:TSingleM3 ) :TSingleM3;
       class operator Subtract( const A_,B_:TSingleM3 ) :TSingleM3;
       class operator Multiply( const A_,B_:TSingleM3 ) :TSingleM3;
       class operator Multiply( const A_:TSingleM3; const B_:Single ) :TSingleM3;
       class operator Multiply( const A_:Single; const B_:TSingleM3 ) :TSingleM3;
       class operator Multiply( const A_:TSingle3D; const B_:TSingleM3 ) :TSingle3D;
       class operator Multiply( const A_:TSingleM3; const B_:TSingle3D ) :TSingle3D;
       class operator Divide( const A_:TSingleM3; const B_:Single ) :TSingleM3;
       ///// メソッド
       function Transpose :TSingleM3;
       function Det :Single;
       function Adjugate :TSingleM3;
       function Inverse :TSingleM3;

     case Integer of
      0:( _ :array [ 1..3, 1..3 ] of Single; );
      1:( _11, _12, _13,
          _21, _22, _23,
          _31, _32, _33 :Single;             );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleM3

     TDoubleM3 = record
     private
       ///// アクセス
       function GetM( const Y_,X_:Integer ) :Double;
       procedure SetM( const Y_,X_:Integer; const M_:Double );
       function GetAxisX :TDouble3D;
       procedure SetAxisX( const AxisX_:TDouble3D );
       function GetAxisY :TDouble3D;
       procedure SetAxisY( const AxisY_:TDouble3D );
       function GetAxisZ :TDouble3D;
       procedure SetAxisZ( const AxisZ_:TDouble3D );
     public
       constructor Create( const _11_,_12_,_13_,
                                 _21_,_22_,_23_,
                                 _31_,_32_,_33_:Double );
       ///// プロパティ
       property M[ const Y_,X_:Integer ] :Double    read GetM     write SetM    ; default;
       property AxisX                    :TDouble3D read GetAxisX write SetAxisX;
       property AxisY                    :TDouble3D read GetAxisY write SetAxisY;
       property AxisZ                    :TDouble3D read GetAxisZ write SetAxisZ;
       ///// 演算子
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

     case Integer of
      0:( _ :array [ 1..3, 1..3 ] of Double; );
      1:( _11, _12, _13,
          _21, _22, _23,
          _31, _32, _33 :Double;             );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdSingleM3

     TdSingleM3 = record
     private
       ///// アクセス
       function GetM( const Y_,X_:Integer ) :TdSingle;
       procedure SetM( const Y_,X_:Integer; const M_:TdSingle );
       function GetAxisX :TdSingle3D;
       procedure SetAxisX( const AxisX_:TdSingle3D );
       function GetAxisY :TdSingle3D;
       procedure SetAxisY( const AxisY_:TdSingle3D );
       function GetAxisZ :TdSingle3D;
       procedure SetAxisZ( const AxisZ_:TdSingle3D );
       function GetSum :TdSingle;
     public
       constructor Create( const _11_,_12_,_13_,
                                 _21_,_22_,_23_,
                                 _31_,_32_,_33_:TdSingle );
       ///// プロパティ
       property M[ const Y_,X_:Integer ] :TdSingle   read GetM     write SetM    ; default;
       property AxisX                    :TdSingle3D read GetAxisX write SetAxisX;
       property AxisY                    :TdSingle3D read GetAxisY write SetAxisY;
       property AxisZ                    :TdSingle3D read GetAxisZ write SetAxisZ;
       property Sum   :TdSingle    read GetSum;
       ///// 演算子
       class operator Negative( const V_:TdSingleM3 ) :TdSingleM3;
       class operator Positive( const V_:TdSingleM3 ) :TdSingleM3;
       class operator Add( const A_,B_:TdSingleM3 ) :TdSingleM3;
       class operator Subtract( const A_,B_:TdSingleM3 ) :TdSingleM3;
       class operator Multiply( const A_,B_:TdSingleM3 ) :TdSingleM3;
       class operator Multiply( const A_:TdSingleM3; const B_:TdSingle ) :TdSingleM3;
       class operator Multiply( const A_:TdSingle; const B_:TdSingleM3 ) :TdSingleM3;
       class operator Multiply( const A_:TdSingle3D; const B_:TdSingleM3 ) :TdSingle3D;
       class operator Multiply( const A_:TdSingleM3; const B_:TdSingle3D ) :TdSingle3D;
       class operator Divide( const A_:TdSingleM3; const B_:TdSingle ) :TdSingleM3;
       ///// メソッド
       function Transpose :TdSingleM3;
       function Det :TdSingle;
       function Adjugate :TdSingleM3;
       function Inverse :TdSingleM3;

     case Integer of
      0:( _ :array [ 1..3, 1..3 ] of TdSingle; );
      1:( _11, _12, _13,
          _21, _22, _23,
          _31, _32, _33 :TdSingle;             );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdDoubleM3

     TdDoubleM3 = record
     private
       ///// アクセス
       function GetM( const Y_,X_:Integer ) :TdDouble;
       procedure SetM( const Y_,X_:Integer; const M_:TdDouble );
       function GetAxisX :TdDouble3D;
       procedure SetAxisX( const AxisX_:TdDouble3D );
       function GetAxisY :TdDouble3D;
       procedure SetAxisY( const AxisY_:TdDouble3D );
       function GetAxisZ :TdDouble3D;
       procedure SetAxisZ( const AxisZ_:TdDouble3D );
     public
       constructor Create( const _11_,_12_,_13_,
                                 _21_,_22_,_23_,
                                 _31_,_32_,_33_:TdDouble );
       ///// プロパティ
       property M[ const Y_,X_:Integer ] :TdDouble   read GetM     write SetM    ; default;
       property AxisX                    :TdDouble3D read GetAxisX write SetAxisX;
       property AxisY                    :TdDouble3D read GetAxisY write SetAxisY;
       property AxisZ                    :TdDouble3D read GetAxisZ write SetAxisZ;
       ///// 演算子
       class operator Negative( const V_:TdDoubleM3 ) :TdDoubleM3;
       class operator Positive( const V_:TdDoubleM3 ) :TdDoubleM3;
       class operator Add( const A_,B_:TdDoubleM3 ) :TdDoubleM3;
       class operator Subtract( const A_,B_:TdDoubleM3 ) :TdDoubleM3;
       class operator Multiply( const A_,B_:TdDoubleM3 ) :TdDoubleM3;
       class operator Multiply( const A_:TdDoubleM3; const B_:TdDouble ) :TdDoubleM3;
       class operator Multiply( const A_:TdDouble; const B_:TdDoubleM3 ) :TdDoubleM3;
       class operator Multiply( const A_:TdDouble3D; const B_:TdDoubleM3 ) :TdDouble3D;
       class operator Multiply( const A_:TdDoubleM3; const B_:TdDouble3D ) :TdDouble3D;
       class operator Divide( const A_:TdDoubleM3; const B_:TdDouble ) :TdDoubleM3;
       ///// メソッド
       function Transpose :TdDoubleM3;
       function Det :TdDouble;
       function Adjugate :TdDoubleM3;
       function Inverse :TdDoubleM3;

     case Integer of
      0:( _ :array [ 1..3, 1..3 ] of TdDouble; );
      1:( _11, _12, _13,
          _21, _22, _23,
          _31, _32, _33 :TdDouble;             );
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function ArrowRot( const P0_,P1_:TSingle3D ) :TSingleM3; overload;
function ArrowRot( const P0_,P1_:TDouble3D ) :TDoubleM3; overload;

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleM3

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TSingleM3.GetM( const Y_,X_:Integer ) :Single;
begin
     Result := _[ Y_, X_ ];
end;

procedure TSingleM3.SetM( const Y_,X_:Integer; const M_:Single );
begin
     _[ Y_, X_ ] := M_;
end;

//------------------------------------------------------------------------------

function TSingleM3.GetAxisX :TSingle3D;
begin
     with Result do
     begin
          X := _11;
          Y := _21;
          Z := _31;
     end;
end;

procedure TSingleM3.SetAxisX( const AxisX_:TSingle3D );
begin
     with AxisX_ do
     begin
          _11 := X;
          _21 := Y;
          _31 := Z;
     end;
end;

function TSingleM3.GetAxisY :TSingle3D;
begin
     with Result do
     begin
          X := _12;
          Y := _22;
          Z := _32;
     end;
end;

procedure TSingleM3.SetAxisY( const AxisY_:TSingle3D );
begin
     with AxisY_ do
     begin
          _12 := X;
          _22 := Y;
          _32 := Z;
     end;
end;

function TSingleM3.GetAxisZ :TSingle3D;
begin
     with Result do
     begin
          X := _13;
          Y := _23;
          Z := _33;
     end;
end;

procedure TSingleM3.SetAxisZ( const AxisZ_:TSingle3D );
begin
     with AxisZ_ do
     begin
          _13 := X;
          _23 := Y;
          _33 := Z;
     end;
end;

function TSingleM3.GetSum :Single;
begin
     Result := _11 + _12 + _13
             + _21 + _22 + _23
             + _31 + _32 + _33;
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
     end;
end;

class operator TSingleM3.Negative( const V_:TSingleM3 ) :TSingleM3;
begin
     with Result do
     begin
          _11 := -V_._11;  _12 := -V_._12;  _13 := -V_._13;
          _21 := -V_._21;  _22 := -V_._22;  _23 := -V_._23;
          _31 := -V_._31;  _32 := -V_._32;  _33 := -V_._33;
     end;
end;

class operator TSingleM3.Add( const A_,B_:TSingleM3 ) :TSingleM3;
begin
     with Result do
     begin
          _11 := A_._11 + B_._11;  _12 := A_._12 + B_._12;  _13 := A_._13 + B_._13;
          _21 := A_._21 + B_._21;  _22 := A_._22 + B_._22;  _23 := A_._23 + B_._23;
          _31 := A_._31 + B_._31;  _32 := A_._32 + B_._32;  _33 := A_._33 + B_._33;
     end;
end;

class operator TSingleM3.Subtract( const A_,B_:TSingleM3 ) :TSingleM3;
begin
     with Result do
     begin
          _11 := A_._11 - B_._11;  _12 := A_._12 - B_._12;  _13 := A_._13 - B_._13;
          _21 := A_._21 - B_._21;  _22 := A_._22 - B_._22;  _23 := A_._23 - B_._23;
          _31 := A_._31 - B_._31;  _32 := A_._32 - B_._32;  _33 := A_._33 - B_._33;
     end;
end;

class operator TSingleM3.Multiply( const A_,B_:TSingleM3 ) :TSingleM3;
begin
     {
       11 12 13    11 12 13
       21 22 23 × 21 22 23
       31 32 33    31 32 33
     }

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
     end;
end;

class operator TSingleM3.Multiply( const A_:TSingleM3; const B_:Single ) :TSingleM3;
begin
     with Result do
     begin
          _11 := A_._11 * B_;  _12 := A_._12 * B_;  _13 := A_._13 * B_;
          _21 := A_._21 * B_;  _22 := A_._22 * B_;  _23 := A_._23 * B_;
          _31 := A_._31 * B_;  _32 := A_._32 * B_;  _33 := A_._33 * B_;
     end;
end;

class operator TSingleM3.Multiply( const A_:Single; const B_:TSingleM3 ) :TSingleM3;
begin
     with Result do
     begin
          _11 := A_ * B_._11;  _12 := A_ * B_._12;  _13 := A_ * B_._13;
          _21 := A_ * B_._21;  _22 := A_ * B_._22;  _23 := A_ * B_._23;
          _31 := A_ * B_._31;  _32 := A_ * B_._32;  _33 := A_ * B_._33;
     end;
end;

class operator TSingleM3.Multiply( const A_:TSingle3D; const B_:TSingleM3 ) :TSingle3D;
begin
     {
                11 12 13
       X Y Z × 21 22 23
                31 32 33
     }

     with Result do
     begin
          X := A_.X * B_._11 + A_.Y * B_._21 + A_.Z * B_._31;
          Y := A_.X * B_._12 + A_.Y * B_._22 + A_.Z * B_._32;
          Z := A_.X * B_._13 + A_.Y * B_._23 + A_.Z * B_._33;
     end;
end;

class operator TSingleM3.Multiply( const A_:TSingleM3; const B_:TSingle3D ) :TSingle3D;
begin
     {
       11 12 13    X
       21 22 23 × Y
       31 32 33    Z
     }

     with Result do
     begin
          X := A_._11 * B_.X + A_._12 * B_.Y + A_._13 * B_.Z;
          Y := A_._21 * B_.X + A_._22 * B_.Y + A_._23 * B_.Z;
          Z := A_._31 * B_.X + A_._32 * B_.Y + A_._33 * B_.Z;
     end;
end;

class operator TSingleM3.Divide( const A_:TSingleM3; const B_:Single ) :TSingleM3;
begin
     with Result do
     begin
          _11 := A_._11 / B_;  _12 := A_._12 / B_;  _13 := A_._13 / B_;
          _21 := A_._21 / B_;  _22 := A_._22 / B_;  _23 := A_._23 / B_;
          _31 := A_._31 / B_;  _32 := A_._32 / B_;  _33 := A_._33 / B_;
     end;
end;

/////////////////////////////////////////////////////////////////////// メソッド

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
            + _13 * ( _21 * _32 - _22 * _31 );
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
                   + _13 * A._31 );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleM3

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TDoubleM3.GetM( const Y_,X_:Integer ) :Double;
begin
     Result := _[ Y_, X_ ];
end;

procedure TDoubleM3.SetM( const Y_,X_:Integer; const M_:Double );
begin
     _[ Y_, X_ ] := M_;
end;

//------------------------------------------------------------------------------

function TDoubleM3.GetAxisX :TDouble3D;
begin
     with Result do
     begin
          X := _11;
          Y := _21;
          Z := _31;
     end;
end;

procedure TDoubleM3.SetAxisX( const AxisX_:TDouble3D );
begin
     with AxisX_ do
     begin
          _11 := X;
          _21 := Y;
          _31 := Z;
     end;
end;

function TDoubleM3.GetAxisY :TDouble3D;
begin
     with Result do
     begin
          X := _12;
          Y := _22;
          Z := _32;
     end;
end;

procedure TDoubleM3.SetAxisY( const AxisY_:TDouble3D );
begin
     with AxisY_ do
     begin
          _12 := X;
          _22 := Y;
          _32 := Z;
     end;
end;

function TDoubleM3.GetAxisZ :TDouble3D;
begin
     with Result do
     begin
          X := _13;
          Y := _23;
          Z := _33;
     end;
end;

procedure TDoubleM3.SetAxisZ( const AxisZ_:TDouble3D );
begin
     with AxisZ_ do
     begin
          _13 := X;
          _23 := Y;
          _33 := Z;
     end;
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
     end;
end;

class operator TDoubleM3.Negative( const V_:TDoubleM3 ) :TDoubleM3;
begin
     with Result do
     begin
          _11 := -V_._11;  _12 := -V_._12;  _13 := -V_._13;
          _21 := -V_._21;  _22 := -V_._22;  _23 := -V_._23;
          _31 := -V_._31;  _32 := -V_._32;  _33 := -V_._33;
     end;
end;

class operator TDoubleM3.Add( const A_,B_:TDoubleM3 ) :TDoubleM3;
begin
     with Result do
     begin
          _11 := A_._11 + B_._11;  _12 := A_._12 + B_._12;  _13 := A_._13 + B_._13;
          _21 := A_._21 + B_._21;  _22 := A_._22 + B_._22;  _23 := A_._23 + B_._23;
          _31 := A_._31 + B_._31;  _32 := A_._32 + B_._32;  _33 := A_._33 + B_._33;
     end;
end;

class operator TDoubleM3.Subtract( const A_,B_:TDoubleM3 ) :TDoubleM3;
begin
     with Result do
     begin
          _11 := A_._11 - B_._11;  _12 := A_._12 - B_._12;  _13 := A_._13 - B_._13;
          _21 := A_._21 - B_._21;  _22 := A_._22 - B_._22;  _23 := A_._23 - B_._23;
          _31 := A_._31 - B_._31;  _32 := A_._32 - B_._32;  _33 := A_._33 - B_._33;
     end;
end;

class operator TDoubleM3.Multiply( const A_,B_:TDoubleM3 ) :TDoubleM3;
begin
     {
       11 12 13    11 12 13
       21 22 23 × 21 22 23
       31 32 33    31 32 33
     }

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
     end;
end;

class operator TDoubleM3.Multiply( const A_:TDoubleM3; const B_:Double ) :TDoubleM3;
begin
     with Result do
     begin
          _11 := A_._11 * B_;  _12 := A_._12 * B_;  _13 := A_._13 * B_;
          _21 := A_._21 * B_;  _22 := A_._22 * B_;  _23 := A_._23 * B_;
          _31 := A_._31 * B_;  _32 := A_._32 * B_;  _33 := A_._33 * B_;
     end;
end;

class operator TDoubleM3.Multiply( const A_:Double; const B_:TDoubleM3 ) :TDoubleM3;
begin
     with Result do
     begin
          _11 := A_ * B_._11;  _12 := A_ * B_._12;  _13 := A_ * B_._13;
          _21 := A_ * B_._21;  _22 := A_ * B_._22;  _23 := A_ * B_._23;
          _31 := A_ * B_._31;  _32 := A_ * B_._32;  _33 := A_ * B_._33;
     end;
end;

class operator TDoubleM3.Multiply( const A_:TDouble3D; const B_:TDoubleM3 ) :TDouble3D;
begin
     {
                11 12 13
       X Y Z × 21 22 23
                31 32 33
     }

     with Result do
     begin
          X := A_.X * B_._11 + A_.Y * B_._21 + A_.Z * B_._31;
          Y := A_.X * B_._12 + A_.Y * B_._22 + A_.Z * B_._32;
          Z := A_.X * B_._13 + A_.Y * B_._23 + A_.Z * B_._33;
     end;
end;

class operator TDoubleM3.Multiply( const A_:TDoubleM3; const B_:TDouble3D ) :TDouble3D;
begin
     {
       11 12 13    X
       21 22 23 × Y
       31 32 33    Z
     }

     with Result do
     begin
          X := A_._11 * B_.X + A_._12 * B_.Y + A_._13 * B_.Z;
          Y := A_._21 * B_.X + A_._22 * B_.Y + A_._23 * B_.Z;
          Z := A_._31 * B_.X + A_._32 * B_.Y + A_._33 * B_.Z;
     end;
end;

class operator TDoubleM3.Divide( const A_:TDoubleM3; const B_:Double ) :TDoubleM3;
begin
     with Result do
     begin
          _11 := A_._11 / B_;  _12 := A_._12 / B_;  _13 := A_._13 / B_;
          _21 := A_._21 / B_;  _22 := A_._22 / B_;  _23 := A_._23 / B_;
          _31 := A_._31 / B_;  _32 := A_._32 / B_;  _33 := A_._33 / B_;
     end;
end;

/////////////////////////////////////////////////////////////////////// メソッド

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
            + _13 * ( _21 * _32 - _22 * _31 );
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
                   + _13 * A._31 );
end;


//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdSingleM3

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TdSingleM3.GetM( const Y_,X_:Integer ) :TdSingle;
begin
     Result := _[ Y_, X_ ];
end;

procedure TdSingleM3.SetM( const Y_,X_:Integer; const M_:TdSingle );
begin
     _[ Y_, X_ ] := M_;
end;

//------------------------------------------------------------------------------

function TdSingleM3.GetAxisX :TdSingle3D;
begin
     with Result do
     begin
          X := _11;
          Y := _21;
          Z := _31;
     end;
end;

procedure TdSingleM3.SetAxisX( const AxisX_:TdSingle3D );
begin
     with AxisX_ do
     begin
          _11 := X;
          _21 := Y;
          _31 := Z;
     end;
end;

function TdSingleM3.GetAxisY :TdSingle3D;
begin
     with Result do
     begin
          X := _12;
          Y := _22;
          Z := _32;
     end;
end;

procedure TdSingleM3.SetAxisY( const AxisY_:TdSingle3D );
begin
     with AxisY_ do
     begin
          _12 := X;
          _22 := Y;
          _32 := Z;
     end;
end;

function TdSingleM3.GetAxisZ :TdSingle3D;
begin
     with Result do
     begin
          X := _13;
          Y := _23;
          Z := _33;
     end;
end;

procedure TdSingleM3.SetAxisZ( const AxisZ_:TdSingle3D );
begin
     with AxisZ_ do
     begin
          _13 := X;
          _23 := Y;
          _33 := Z;
     end;
end;

function TdSingleM3.GetSum :TdSingle;
begin
     Result := _11 + _12 + _13
             + _21 + _22 + _23
             + _31 + _32 + _33;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TdSingleM3.Create( const _11_,_12_,_13_,
                                     _21_,_22_,_23_,
                                     _31_,_32_,_33_:TdSingle );
begin
     _11 := _11_;  _12 := _12_;  _13 := _13_;
     _21 := _21_;  _22 := _22_;  _23 := _23_;
     _31 := _31_;  _32 := _32_;  _33 := _33_;
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TdSingleM3.Positive( const V_:TdSingleM3 ) :TdSingleM3;
begin
     with Result do
     begin
          _11 := +V_._11;  _12 := +V_._12;  _13 := +V_._13;
          _21 := +V_._21;  _22 := +V_._22;  _23 := +V_._23;
          _31 := +V_._31;  _32 := +V_._32;  _33 := +V_._33;
     end;
end;

class operator TdSingleM3.Negative( const V_:TdSingleM3 ) :TdSingleM3;
begin
     with Result do
     begin
          _11 := -V_._11;  _12 := -V_._12;  _13 := -V_._13;
          _21 := -V_._21;  _22 := -V_._22;  _23 := -V_._23;
          _31 := -V_._31;  _32 := -V_._32;  _33 := -V_._33;
     end;
end;

class operator TdSingleM3.Add( const A_,B_:TdSingleM3 ) :TdSingleM3;
begin
     with Result do
     begin
          _11 := A_._11 + B_._11;  _12 := A_._12 + B_._12;  _13 := A_._13 + B_._13;
          _21 := A_._21 + B_._21;  _22 := A_._22 + B_._22;  _23 := A_._23 + B_._23;
          _31 := A_._31 + B_._31;  _32 := A_._32 + B_._32;  _33 := A_._33 + B_._33;
     end;
end;

class operator TdSingleM3.Subtract( const A_,B_:TdSingleM3 ) :TdSingleM3;
begin
     with Result do
     begin
          _11 := A_._11 - B_._11;  _12 := A_._12 - B_._12;  _13 := A_._13 - B_._13;
          _21 := A_._21 - B_._21;  _22 := A_._22 - B_._22;  _23 := A_._23 - B_._23;
          _31 := A_._31 - B_._31;  _32 := A_._32 - B_._32;  _33 := A_._33 - B_._33;
     end;
end;

class operator TdSingleM3.Multiply( const A_,B_:TdSingleM3 ) :TdSingleM3;
begin
     {
       11 12 13    11 12 13
       21 22 23 × 21 22 23
       31 32 33    31 32 33
     }

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
     end;
end;

class operator TdSingleM3.Multiply( const A_:TdSingleM3; const B_:TdSingle ) :TdSingleM3;
begin
     with Result do
     begin
          _11 := A_._11 * B_;  _12 := A_._12 * B_;  _13 := A_._13 * B_;
          _21 := A_._21 * B_;  _22 := A_._22 * B_;  _23 := A_._23 * B_;
          _31 := A_._31 * B_;  _32 := A_._32 * B_;  _33 := A_._33 * B_;
     end;
end;

class operator TdSingleM3.Multiply( const A_:TdSingle; const B_:TdSingleM3 ) :TdSingleM3;
begin
     with Result do
     begin
          _11 := A_ * B_._11;  _12 := A_ * B_._12;  _13 := A_ * B_._13;
          _21 := A_ * B_._21;  _22 := A_ * B_._22;  _23 := A_ * B_._23;
          _31 := A_ * B_._31;  _32 := A_ * B_._32;  _33 := A_ * B_._33;
     end;
end;

class operator TdSingleM3.Multiply( const A_:TdSingle3D; const B_:TdSingleM3 ) :TdSingle3D;
begin
     {
                11 12 13
       X Y Z × 21 22 23
                31 32 33
     }

     with Result do
     begin
          X := A_.X * B_._11 + A_.Y * B_._21 + A_.Z * B_._31;
          Y := A_.X * B_._12 + A_.Y * B_._22 + A_.Z * B_._32;
          Z := A_.X * B_._13 + A_.Y * B_._23 + A_.Z * B_._33;
     end;
end;

class operator TdSingleM3.Multiply( const A_:TdSingleM3; const B_:TdSingle3D ) :TdSingle3D;
begin
     {
       11 12 13    X
       21 22 23 × Y
       31 32 33    Z
     }

     with Result do
     begin
          X := A_._11 * B_.X + A_._12 * B_.Y + A_._13 * B_.Z;
          Y := A_._21 * B_.X + A_._22 * B_.Y + A_._23 * B_.Z;
          Z := A_._31 * B_.X + A_._32 * B_.Y + A_._33 * B_.Z;
     end;
end;

class operator TdSingleM3.Divide( const A_:TdSingleM3; const B_:TdSingle ) :TdSingleM3;
begin
     with Result do
     begin
          _11 := A_._11 / B_;  _12 := A_._12 / B_;  _13 := A_._13 / B_;
          _21 := A_._21 / B_;  _22 := A_._22 / B_;  _23 := A_._23 / B_;
          _31 := A_._31 / B_;  _32 := A_._32 / B_;  _33 := A_._33 / B_;
     end;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TdSingleM3.Transpose :TdSingleM3;
begin
     Result._11 := _11;  Result._12 := _21;  Result._13 := _31;
     Result._21 := _12;  Result._22 := _22;  Result._23 := _32;
     Result._31 := _13;  Result._32 := _23;  Result._33 := _33;
end;

function TdSingleM3.Det :TdSingle;
begin
     Result:= _11 * ( _22 * _33 - _23 * _32 )
            + _12 * ( _23 * _31 - _21 * _33 )
            + _13 * ( _21 * _32 - _22 * _31 );
end;

function TdSingleM3.Adjugate :TdSingleM3;
begin
     Result._11 := +TdSingleM2.Create( {11} {12} {13}
                                       {21} _22, _23,
                                       {31} _32, _33  ).Det;

     Result._21 := -TdSingleM2.Create( {11} {12} {13}
                                       _21, {22} _23,
                                       _31, {32} _33  ).Det;

     Result._31 := +TdSingleM2.Create( {11} {12} {13}
                                       _21, _22, {23}
                                       _31, _32  {33} ).Det;

     Result._12 := -TdSingleM2.Create( {11} _12, _13,
                                       {21} {22} {23}
                                       {31} _32, _33  ).Det;

     Result._22 := +TdSingleM2.Create( _11, {12} _13,
                                       {21} {22} {23}
                                       _31, {32} _33  ).Det;

     Result._32 := -TdSingleM2.Create( _11, _12, {13}
                                       {21} {22} {23}
                                       _31, _32  {33} ).Det;

     Result._13 := +TdSingleM2.Create( {11} _12, _13,
                                       {21} _22, _23
                                       {31} {32} {33} ).Det;

     Result._23 := -TdSingleM2.Create( _11, {12} _13,
                                       _21, {22} _23
                                       {31} {32} {33} ).Det;

     Result._33 := +TdSingleM2.Create( _11, _12, {13}
                                       _21, _22  {23}
                                       {31} {32} {33} ).Det;
end;

function TdSingleM3.Inverse :TdSingleM3;
var
   A :TdSingleM3;
begin
     A := Adjugate;

     Result := A / ( _11 * A._11
                   + _12 * A._21
                   + _13 * A._31 );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdDoubleM3

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TdDoubleM3.GetM( const Y_,X_:Integer ) :TdDouble;
begin
     Result := _[ Y_, X_ ];
end;

procedure TdDoubleM3.SetM( const Y_,X_:Integer; const M_:TdDouble );
begin
     _[ Y_, X_ ] := M_;
end;

//------------------------------------------------------------------------------

function TdDoubleM3.GetAxisX :TdDouble3D;
begin
     with Result do
     begin
          X := _11;
          Y := _21;
          Z := _31;
     end;
end;

procedure TdDoubleM3.SetAxisX( const AxisX_:TdDouble3D );
begin
     with AxisX_ do
     begin
          _11 := X;
          _21 := Y;
          _31 := Z;
     end;
end;

function TdDoubleM3.GetAxisY :TdDouble3D;
begin
     with Result do
     begin
          X := _12;
          Y := _22;
          Z := _32;
     end;
end;

procedure TdDoubleM3.SetAxisY( const AxisY_:TdDouble3D );
begin
     with AxisY_ do
     begin
          _12 := X;
          _22 := Y;
          _32 := Z;
     end;
end;

function TdDoubleM3.GetAxisZ :TdDouble3D;
begin
     with Result do
     begin
          X := _13;
          Y := _23;
          Z := _33;
     end;
end;

procedure TdDoubleM3.SetAxisZ( const AxisZ_:TdDouble3D );
begin
     with AxisZ_ do
     begin
          _13 := X;
          _23 := Y;
          _33 := Z;
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TdDoubleM3.Create( const _11_,_12_,_13_,
                                     _21_,_22_,_23_,
                                     _31_,_32_,_33_:TdDouble );
begin
     _11 := _11_;  _12 := _12_;  _13 := _13_;
     _21 := _21_;  _22 := _22_;  _23 := _23_;
     _31 := _31_;  _32 := _32_;  _33 := _33_;
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TdDoubleM3.Positive( const V_:TdDoubleM3 ) :TdDoubleM3;
begin
     with Result do
     begin
          _11 := +V_._11;  _12 := +V_._12;  _13 := +V_._13;
          _21 := +V_._21;  _22 := +V_._22;  _23 := +V_._23;
          _31 := +V_._31;  _32 := +V_._32;  _33 := +V_._33;
     end;
end;

class operator TdDoubleM3.Negative( const V_:TdDoubleM3 ) :TdDoubleM3;
begin
     with Result do
     begin
          _11 := -V_._11;  _12 := -V_._12;  _13 := -V_._13;
          _21 := -V_._21;  _22 := -V_._22;  _23 := -V_._23;
          _31 := -V_._31;  _32 := -V_._32;  _33 := -V_._33;
     end;
end;

class operator TdDoubleM3.Add( const A_,B_:TdDoubleM3 ) :TdDoubleM3;
begin
     with Result do
     begin
          _11 := A_._11 + B_._11;  _12 := A_._12 + B_._12;  _13 := A_._13 + B_._13;
          _21 := A_._21 + B_._21;  _22 := A_._22 + B_._22;  _23 := A_._23 + B_._23;
          _31 := A_._31 + B_._31;  _32 := A_._32 + B_._32;  _33 := A_._33 + B_._33;
     end;
end;

class operator TdDoubleM3.Subtract( const A_,B_:TdDoubleM3 ) :TdDoubleM3;
begin
     with Result do
     begin
          _11 := A_._11 - B_._11;  _12 := A_._12 - B_._12;  _13 := A_._13 - B_._13;
          _21 := A_._21 - B_._21;  _22 := A_._22 - B_._22;  _23 := A_._23 - B_._23;
          _31 := A_._31 - B_._31;  _32 := A_._32 - B_._32;  _33 := A_._33 - B_._33;
     end;
end;

class operator TdDoubleM3.Multiply( const A_,B_:TdDoubleM3 ) :TdDoubleM3;
begin
     {
       11 12 13    11 12 13
       21 22 23 × 21 22 23
       31 32 33    31 32 33
     }

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
     end;
end;

class operator TdDoubleM3.Multiply( const A_:TdDoubleM3; const B_:TdDouble ) :TdDoubleM3;
begin
     with Result do
     begin
          _11 := A_._11 * B_;  _12 := A_._12 * B_;  _13 := A_._13 * B_;
          _21 := A_._21 * B_;  _22 := A_._22 * B_;  _23 := A_._23 * B_;
          _31 := A_._31 * B_;  _32 := A_._32 * B_;  _33 := A_._33 * B_;
     end;
end;

class operator TdDoubleM3.Multiply( const A_:TdDouble; const B_:TdDoubleM3 ) :TdDoubleM3;
begin
     with Result do
     begin
          _11 := A_ * B_._11;  _12 := A_ * B_._12;  _13 := A_ * B_._13;
          _21 := A_ * B_._21;  _22 := A_ * B_._22;  _23 := A_ * B_._23;
          _31 := A_ * B_._31;  _32 := A_ * B_._32;  _33 := A_ * B_._33;
     end;
end;

class operator TdDoubleM3.Multiply( const A_:TdDouble3D; const B_:TdDoubleM3 ) :TdDouble3D;
begin
     {
                11 12 13
       X Y Z × 21 22 23
                31 32 33
     }

     with Result do
     begin
          X := A_.X * B_._11 + A_.Y * B_._21 + A_.Z * B_._31;
          Y := A_.X * B_._12 + A_.Y * B_._22 + A_.Z * B_._32;
          Z := A_.X * B_._13 + A_.Y * B_._23 + A_.Z * B_._33;
     end;
end;

class operator TdDoubleM3.Multiply( const A_:TdDoubleM3; const B_:TdDouble3D ) :TdDouble3D;
begin
     {
       11 12 13    X
       21 22 23 × Y
       31 32 33    Z
     }

     with Result do
     begin
          X := A_._11 * B_.X + A_._12 * B_.Y + A_._13 * B_.Z;
          Y := A_._21 * B_.X + A_._22 * B_.Y + A_._23 * B_.Z;
          Z := A_._31 * B_.X + A_._32 * B_.Y + A_._33 * B_.Z;
     end;
end;

class operator TdDoubleM3.Divide( const A_:TdDoubleM3; const B_:TdDouble ) :TdDoubleM3;
begin
     with Result do
     begin
          _11 := A_._11 / B_;  _12 := A_._12 / B_;  _13 := A_._13 / B_;
          _21 := A_._21 / B_;  _22 := A_._22 / B_;  _23 := A_._23 / B_;
          _31 := A_._31 / B_;  _32 := A_._32 / B_;  _33 := A_._33 / B_;
     end;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TdDoubleM3.Transpose :TdDoubleM3;
begin
     Result._11 := _11;  Result._12 := _21;  Result._13 := _31;
     Result._21 := _12;  Result._22 := _22;  Result._23 := _32;
     Result._31 := _13;  Result._32 := _23;  Result._33 := _33;
end;

function TdDoubleM3.Det :TdDouble;
begin
     Result:= _11 * ( _22 * _33 - _23 * _32 )
            + _12 * ( _23 * _31 - _21 * _33 )
            + _13 * ( _21 * _32 - _22 * _31 );
end;

function TdDoubleM3.Adjugate :TdDoubleM3;
begin
     Result._11 := +TdDoubleM2.Create( {11} {12} {13}
                                       {21} _22, _23,
                                       {31} _32, _33  ).Det;

     Result._21 := -TdDoubleM2.Create( {11} {12} {13}
                                       _21, {22} _23,
                                       _31, {32} _33  ).Det;

     Result._31 := +TdDoubleM2.Create( {11} {12} {13}
                                       _21, _22, {23}
                                       _31, _32  {33} ).Det;

     Result._12 := -TdDoubleM2.Create( {11} _12, _13,
                                       {21} {22} {23}
                                       {31} _32, _33  ).Det;

     Result._22 := +TdDoubleM2.Create( _11, {12} _13,
                                       {21} {22} {23}
                                       _31, {32} _33  ).Det;

     Result._32 := -TdDoubleM2.Create( _11, _12, {13}
                                       {21} {22} {23}
                                       _31, _32  {33} ).Det;

     Result._13 := +TdDoubleM2.Create( {11} _12, _13,
                                       {21} _22, _23
                                       {31} {32} {33} ).Det;

     Result._23 := -TdDoubleM2.Create( _11, {12} _13,
                                       _21, {22} _23
                                       {31} {32} {33} ).Det;

     Result._33 := +TdDoubleM2.Create( _11, _12, {13}
                                       _21, _22  {23}
                                       {31} {32} {33} ).Det;
end;

function TdDoubleM3.Inverse :TdDoubleM3;
var
   A :TdDoubleM3;
begin
     A := Adjugate;

     Result := A / ( _11 * A._11
                   + _12 * A._21
                   + _13 * A._31 );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function ArrowRot( const P0_,P1_:TSingle3D ) :TSingleM3;
var
   AX, AY ,AZ, E :TSingle3D;
begin
     AZ := P0_.UnitorTo( P1_ );

     with AZ do
     begin
          case MinI( Abs( X ), Abs( Y ) ,Abs( Z ) ) of
            1: E := TSingle3D.Create( 1, 0, 0 );
            2: E := TSingle3D.Create( 0, 1, 0 );
            3: E := TSingle3D.Create( 0, 0, 1 );
          end;
     end;

     AY := CrossProduct( AZ, E ).Unitor;

     AX := CrossProduct( AY, AZ );

     with Result do
     begin
          _11 := AX.X;  _12 := AY.X;  _13 := AZ.X;
          _21 := AX.Y;  _22 := AY.Y;  _23 := AZ.Y;
          _31 := AX.Z;  _32 := AY.Z;  _33 := AZ.Z;
     end;
end;

function ArrowRot( const P0_,P1_:TDouble3D ) :TDoubleM3;
var
   AX, AY ,AZ, E :TDouble3D;
begin
     AZ := P0_.UnitorTo( P1_ );

     with AZ do
     begin
          case MinI( Abs( X ), Abs( Y ) ,Abs( Z ) ) of
            1: E := TDouble3D.Create( 1, 0, 0 );
            2: E := TDouble3D.Create( 0, 1, 0 );
            3: E := TDouble3D.Create( 0, 0, 1 );
          end;
     end;

     AY := CrossProduct( AZ, E ).Unitor;

     AX := CrossProduct( AY, AZ );

     with Result do
     begin
          _11 := AX.X;  _12 := AY.X;  _13 := AZ.X;
          _21 := AX.Y;  _22 := AY.Y;  _23 := AZ.Y;
          _31 := AX.Z;  _32 := AY.Z;  _33 := AZ.Z;
     end;
end;

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
