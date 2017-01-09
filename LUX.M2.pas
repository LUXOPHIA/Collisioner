unit LUX.M2;

interface //#################################################################### ■

uses LUX, LUX.D1, LUX.D2;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleM2

     TSingleM2 = record
     private
       ///// アクセス
       function GetM( const Y_,X_:Integer ) :Single;
       procedure SetM( const Y_,X_:Integer; const M_:Single );
       function GetAxisX :TSingle2D;
       procedure SetAxisX( const AxisX_:TSingle2D );
       function GetAxisY :TSingle2D;
       procedure SetAxisY( const AxisY_:TSingle2D );
     public
       constructor Create( const _11_,_12_,
                                 _21_,_22_:Single );
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
       ///// プロパティ
       property M[ const Y_,X_:Integer ] :Single    read GetM     write SetM    ; default;
       property AxisX                    :TSingle2D read GetAxisX write SetAxisX;
       property AxisY                    :TSingle2D read GetAxisY write SetAxisY;
       ///// メソッド
       function Det :Single;
       function Adjugate :TSingleM2;
       function Inverse :TSingleM2;
       class function Rotate( const Angle_:Single ) :TSingleM2; static;

     case Integer of
      0:( _ :array [ 1..2, 1..2 ] of Single; );
      1:( _11, _12,
          _21, _22 :Single;                  );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleM2

     TDoubleM2 = record
     private
       ///// アクセス
       function GetM( const Y_,X_:Integer ) :Double;
       procedure SetM( const Y_,X_:Integer; const M_:Double );
       function GetAxisX :TDouble2D;
       procedure SetAxisX( const AxisX_:TDouble2D );
       function GetAxisY :TDouble2D;
       procedure SetAxisY( const AxisY_:TDouble2D );
     public
       constructor Create( const _11_,_12_,
                                 _21_,_22_:Double );
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
       ///// プロパティ
       property M[ const Y_,X_:Integer ] :Double    read GetM     write SetM    ; default;
       property AxisX                    :TDouble2D read GetAxisX write SetAxisX;
       property AxisY                    :TDouble2D read GetAxisY write SetAxisY;
       ///// メソッド
       function Det :Double;
       function Adjugate :TDoubleM2;
       function Inverse :TDoubleM2;
       class function Rotate( const Angle_:Double ) :TDoubleM2; static;

     case Integer of
       0: ( _ :array [ 1..2, 1..2 ] of Double; );
       1: ( _11, _12,
            _21, _22 :Double;                  );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdSingleM2

     TdSingleM2 = record
     private
       ///// アクセス
       function GetM( const Y_,X_:Integer ) :TdSingle;
       procedure SetM( const Y_,X_:Integer; const M_:TdSingle );
       function GetAxisX :TdSingle2D;
       procedure SetAxisX( const AxisX_:TdSingle2D );
       function GetAxisY :TdSingle2D;
       procedure SetAxisY( const AxisY_:TdSingle2D );
     public
       constructor Create( const _11_,_12_,
                                 _21_,_22_:TdSingle );
       ///// 演算子
       class operator Negative( const V_:TdSingleM2 ) :TdSingleM2;
       class operator Positive( const V_:TdSingleM2 ) :TdSingleM2;
       class operator Add( const A_,B_:TdSingleM2 ) :TdSingleM2;
       class operator Subtract( const A_,B_:TdSingleM2 ) :TdSingleM2;
       class operator Multiply( const A_,B_:TdSingleM2 ) :TdSingleM2;
       class operator Multiply( const A_:TdSingleM2; const B_:TdSingle ) :TdSingleM2;
       class operator Multiply( const A_:TdSingle; const B_:TdSingleM2 ) :TdSingleM2;
       class operator Multiply( const A_:TdSingle2D; const B_:TdSingleM2 ) :TdSingle2D;
       class operator Multiply( const A_:TdSingleM2; const B_:TdSingle2D ) :TdSingle2D;
       class operator Divide( const A_:TdSingleM2; const B_:TdSingle ) :TdSingleM2;
       ///// プロパティ
       property M[ const Y_,X_:Integer ] :TdSingle   read GetM     write SetM    ; default;
       property AxisX                    :TdSingle2D read GetAxisX write SetAxisX;
       property AxisY                    :TdSingle2D read GetAxisY write SetAxisY;
       ///// メソッド
       function Det :TdSingle;
       function Adjugate :TdSingleM2;
       function Inverse :TdSingleM2;
       class function Rotate( const Angle_:TdSingle ) :TdSingleM2; static;

     case Integer of
      0:( _ :array [ 1..2, 1..2 ] of TdSingle; );
      1:( _11, _12,
          _21, _22 :TdSingle;                  );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdDoubleM2

     TdDoubleM2 = record
     private
       ///// アクセス
       function GetM( const Y_,X_:Integer ) :TdDouble;
       procedure SetM( const Y_,X_:Integer; const M_:TdDouble );
       function GetAxisX :TdDouble2D;
       procedure SetAxisX( const AxisX_:TdDouble2D );
       function GetAxisY :TdDouble2D;
       procedure SetAxisY( const AxisY_:TdDouble2D );
     public
       constructor Create( const _11_,_12_,
                                 _21_,_22_:TdDouble );
       ///// 演算子
       class operator Negative( const V_:TdDoubleM2 ) :TdDoubleM2;
       class operator Positive( const V_:TdDoubleM2 ) :TdDoubleM2;
       class operator Add( const A_,B_:TdDoubleM2 ) :TdDoubleM2;
       class operator Subtract( const A_,B_:TdDoubleM2 ) :TdDoubleM2;
       class operator Multiply( const A_,B_:TdDoubleM2 ) :TdDoubleM2;
       class operator Multiply( const A_:TdDoubleM2; const B_:TdDouble ) :TdDoubleM2;
       class operator Multiply( const A_:TdDouble; const B_:TdDoubleM2 ) :TdDoubleM2;
       class operator Multiply( const A_:TdDouble2D; const B_:TdDoubleM2 ) :TdDouble2D;
       class operator Multiply( const A_:TdDoubleM2; const B_:TdDouble2D ) :TdDouble2D;
       class operator Divide( const A_:TdDoubleM2; const B_:TdDouble ) :TdDoubleM2;
       ///// プロパティ
       property M[ const Y_,X_:Integer ] :TdDouble   read GetM     write SetM    ; default;
       property AxisX                    :TdDouble2D read GetAxisX write SetAxisX;
       property AxisY                    :TdDouble2D read GetAxisY write SetAxisY;
       ///// メソッド
       function Det :TdDouble;
       function Adjugate :TdDoubleM2;
       function Inverse :TdDoubleM2;
       class function Rotate( const Angle_:TdDouble ) :TdDoubleM2; static;

     case Integer of
       0: ( _ :array [ 1..2, 1..2 ] of TdDouble; );
       1: ( _11, _12,
            _21, _22 :TdDouble;                  );
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.Math;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleM2

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TSingleM2.GetM( const Y_,X_:Integer ) :Single;
begin
     Result := _[ Y_, X_ ];
end;

procedure TSingleM2.SetM( const Y_,X_:Integer; const M_:Single );
begin
     _[ Y_, X_ ] := M_;
end;

//------------------------------------------------------------------------------

function TSingleM2.GetAxisX :TSingle2D;
begin
     with Result do
     begin
          X := _11; {X := _12;}
          Y := _21; {Y := _22;}
     end;
end;

procedure TSingleM2.SetAxisX( const AxisX_:TSingle2D );
begin
     with AxisX_ do
     begin
          _11 := X; {_12 := X;}
          _21 := Y; {_22 := Y;}
     end;
end;

function TSingleM2.GetAxisY :TSingle2D;
begin
     with Result do
     begin
         {X := _11;} X := _12;
         {Y := _21;} Y := _22;
     end;
end;

procedure TSingleM2.SetAxisY( const AxisY_:TSingle2D );
begin
     with AxisY_ do
     begin
         {_11 := X;} _12 := X;
         {_21 := Y;} _22 := Y;
     end;
end;

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

/////////////////////////////////////////////////////////////////////// メソッド

function TSingleM2.Det :Single;
begin
     Result := _11 * _22 - _21 * _12;
end;

function TSingleM2.Adjugate :TSingleM2;
begin
     Result._11 := +_22;  Result._12 := -_12;
     Result._21 := -_21;  Result._22 := +_11;
end;

function TSingleM2.Inverse :TSingleM2;
begin
     Result := Adjugate / Det;
end;

//------------------------------------------------------------------------------

class function TSingleM2.Rotate( const Angle_:Single ) :TSingleM2;
var
   S, C :Single;
begin
     SinCos( Angle_, S, C );

     with Result do
     begin
          _11 :=  C;  _12 := -S;
          _21 := +S;  _22 :=  C;
     end
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleM2

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TDoubleM2.GetM( const Y_,X_:Integer ) :Double;
begin
     Result := _[ Y_, X_ ];
end;

procedure TDoubleM2.SetM( const Y_,X_:Integer; const M_:Double );
begin
     _[ Y_, X_ ] := M_;
end;

//------------------------------------------------------------------------------

function TDoubleM2.GetAxisX :TDouble2D;
begin
     with Result do
     begin
          X := _11; {X := _12;}
          Y := _21; {Y := _22;}
     end;
end;

procedure TDoubleM2.SetAxisX( const AxisX_:TDouble2D );
begin
     with AxisX_ do
     begin
          _11 := X; {_12 := X;}
          _21 := Y; {_22 := Y;}
     end;
end;

function TDoubleM2.GetAxisY :TDouble2D;
begin
     with Result do
     begin
         {X := _11;} X := _12;
         {Y := _21;} Y := _22;
     end;
end;

procedure TDoubleM2.SetAxisY( const AxisY_:TDouble2D );
begin
     with AxisY_ do
     begin
         {_11 := X;} _12 := X;
         {_21 := Y;} _22 := Y;
     end;
end;

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

/////////////////////////////////////////////////////////////////////// メソッド

function TDoubleM2.Det :Double;
begin
     Result := _11 * _22 - _21 * _12;
end;

function TDoubleM2.Adjugate :TDoubleM2;
begin
     Result._11 := +_22;  Result._12 := -_12;
     Result._21 := -_21;  Result._22 := +_11;
end;

function TDoubleM2.Inverse :TDoubleM2;
begin
     Result := Adjugate / Det;
end;

//------------------------------------------------------------------------------

class function TDoubleM2.Rotate( const Angle_:Double ) :TDoubleM2;
var
   S, C :Double;
begin
     SinCos( Angle_, S, C );

     with Result do
     begin
          _11 :=  C;  _12 := -S;
          _21 := +S;  _22 :=  C;
     end
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdSingleM2

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TdSingleM2.GetM( const Y_,X_:Integer ) :TdSingle;
begin
     Result := _[ Y_, X_ ];
end;

procedure TdSingleM2.SetM( const Y_,X_:Integer; const M_:TdSingle );
begin
     _[ Y_, X_ ] := M_;
end;

//------------------------------------------------------------------------------

function TdSingleM2.GetAxisX :TdSingle2D;
begin
     with Result do
     begin
          X := _11; {X := _12;}
          Y := _21; {Y := _22;}
     end;
end;

procedure TdSingleM2.SetAxisX( const AxisX_:TdSingle2D );
begin
     with AxisX_ do
     begin
          _11 := X; {_12 := X;}
          _21 := Y; {_22 := Y;}
     end;
end;

function TdSingleM2.GetAxisY :TdSingle2D;
begin
     with Result do
     begin
         {X := _11;} X := _12;
         {Y := _21;} Y := _22;
     end;
end;

procedure TdSingleM2.SetAxisY( const AxisY_:TdSingle2D );
begin
     with AxisY_ do
     begin
         {_11 := X;} _12 := X;
         {_21 := Y;} _22 := Y;
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TdSingleM2.Create( const _11_,_12_, _21_,_22_:TdSingle );
begin
     _11 := _11_;  _12 := _12_;
     _21 := _21_;  _22 := _22_;
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TdSingleM2.Positive( const V_:TdSingleM2 ) :TdSingleM2;
begin
     with Result do
     begin
          _11 := +V_._11;  _12 := +V_._12;
          _21 := +V_._21;  _22 := +V_._22;
     end
end;

class operator TdSingleM2.Negative( const V_:TdSingleM2 ) :TdSingleM2;
begin
     with Result do
     begin
          _11 := -V_._11;  _12 := -V_._12;
          _21 := -V_._21;  _22 := -V_._22;
     end
end;

class operator TdSingleM2.Add( const A_,B_:TdSingleM2 ) :TdSingleM2;
begin
     with Result do
     begin
          _11 := A_._11 + B_._11;  _12 := A_._12 + B_._12;
          _21 := A_._21 + B_._21;  _22 := A_._22 + B_._22;
     end
end;

class operator TdSingleM2.Subtract( const A_,B_:TdSingleM2 ) :TdSingleM2;
begin
     with Result do
     begin
          _11 := A_._11 - B_._11;  _12 := A_._12 - B_._12;
          _21 := A_._21 - B_._21;  _22 := A_._22 - B_._22;
     end
end;

class operator TdSingleM2.Multiply( const A_,B_:TdSingleM2 ) :TdSingleM2;
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

class operator TdSingleM2.Multiply( const A_:TdSingleM2; const B_:TdSingle ) :TdSingleM2;
begin
     with Result do
     begin
          _11 := A_._11 * B_;  _12 := A_._12 * B_;
          _21 := A_._21 * B_;  _22 := A_._22 * B_;
     end
end;

class operator TdSingleM2.Multiply( const A_:TdSingle; const B_:TdSingleM2 ) :TdSingleM2;
begin
     with Result do
     begin
          _11 := A_ * B_._11;  _12 := A_ * B_._12;
          _21 := A_ * B_._21;  _22 := A_ * B_._22;
     end
end;

class operator TdSingleM2.Multiply( const A_:TdSingle2D; const B_:TdSingleM2 ) :TdSingle2D;
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

class operator TdSingleM2.Multiply( const A_:TdSingleM2; const B_:TdSingle2D ) :TdSingle2D;
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

class operator TdSingleM2.Divide( const A_:TdSingleM2; const B_:TdSingle ) :TdSingleM2;
begin
     with Result do
     begin
          _11 := A_._11 / B_;  _12 := A_._12 / B_;
          _21 := A_._21 / B_;  _22 := A_._22 / B_;
     end
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TdSingleM2.Det :TdSingle;
begin
     Result := _11 * _22 - _21 * _12;
end;

function TdSingleM2.Adjugate :TdSingleM2;
begin
     Result._11 := +_22;  Result._12 := -_12;
     Result._21 := -_21;  Result._22 := +_11;
end;

function TdSingleM2.Inverse :TdSingleM2;
begin
     Result := Adjugate / Det;
end;

//------------------------------------------------------------------------------

class function TdSingleM2.Rotate( const Angle_:TdSingle ) :TdSingleM2;
var
   S, C :TdSingle;
begin
     SinCos( Angle_, S, C );

     with Result do
     begin
          _11 :=  C;  _12 := -S;
          _21 := +S;  _22 :=  C;
     end
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdDoubleM2

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TdDoubleM2.GetM( const Y_,X_:Integer ) :TdDouble;
begin
     Result := _[ Y_, X_ ];
end;

procedure TdDoubleM2.SetM( const Y_,X_:Integer; const M_:TdDouble );
begin
     _[ Y_, X_ ] := M_;
end;

//------------------------------------------------------------------------------

function TdDoubleM2.GetAxisX :TdDouble2D;
begin
     with Result do
     begin
          X := _11; {X := _12;}
          Y := _21; {Y := _22;}
     end;
end;

procedure TdDoubleM2.SetAxisX( const AxisX_:TdDouble2D );
begin
     with AxisX_ do
     begin
          _11 := X; {_12 := X;}
          _21 := Y; {_22 := Y;}
     end;
end;

function TdDoubleM2.GetAxisY :TdDouble2D;
begin
     with Result do
     begin
         {X := _11;} X := _12;
         {Y := _21;} Y := _22;
     end;
end;

procedure TdDoubleM2.SetAxisY( const AxisY_:TdDouble2D );
begin
     with AxisY_ do
     begin
         {_11 := X;} _12 := X;
         {_21 := Y;} _22 := Y;
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TdDoubleM2.Create( const _11_,_12_, _21_,_22_:TdDouble );
begin
     _11 := _11_;  _12 := _12_;
     _21 := _21_;  _22 := _22_;
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TdDoubleM2.Positive( const V_:TdDoubleM2 ) :TdDoubleM2;
begin
     with Result do
     begin
          _11 := +V_._11;  _12 := +V_._12;
          _21 := +V_._21;  _22 := +V_._22;
     end
end;

class operator TdDoubleM2.Negative( const V_:TdDoubleM2 ) :TdDoubleM2;
begin
     with Result do
     begin
          _11 := -V_._11;  _12 := -V_._12;
          _21 := -V_._21;  _22 := -V_._22;
     end
end;

class operator TdDoubleM2.Add( const A_,B_:TdDoubleM2 ) :TdDoubleM2;
begin
     with Result do
     begin
          _11 := A_._11 + B_._11;  _12 := A_._12 + B_._12;
          _21 := A_._21 + B_._21;  _22 := A_._22 + B_._22;
     end
end;

class operator TdDoubleM2.Subtract( const A_,B_:TdDoubleM2 ) :TdDoubleM2;
begin
     with Result do
     begin
          _11 := A_._11 - B_._11;  _12 := A_._12 - B_._12;
          _21 := A_._21 - B_._21;  _22 := A_._22 - B_._22;
     end
end;

class operator TdDoubleM2.Multiply( const A_,B_:TdDoubleM2 ) :TdDoubleM2;
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

class operator TdDoubleM2.Multiply( const A_:TdDoubleM2; const B_:TdDouble ) :TdDoubleM2;
begin
     with Result do
     begin
          _11 := A_._11 * B_;  _12 := A_._12 * B_;
          _21 := A_._21 * B_;  _22 := A_._22 * B_;
     end
end;

class operator TdDoubleM2.Multiply( const A_:TdDouble; const B_:TdDoubleM2 ) :TdDoubleM2;
begin
     with Result do
     begin
          _11 := A_ * B_._11;  _12 := A_ * B_._12;
          _21 := A_ * B_._21;  _22 := A_ * B_._22;
     end
end;

class operator TdDoubleM2.Multiply( const A_:TdDouble2D; const B_:TdDoubleM2 ) :TdDouble2D;
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

class operator TdDoubleM2.Multiply( const A_:TdDoubleM2; const B_:TdDouble2D ) :TdDouble2D;
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

class operator TdDoubleM2.Divide( const A_:TdDoubleM2; const B_:TdDouble ) :TdDoubleM2;
begin
     with Result do
     begin
          _11 := A_._11 / B_;  _12 := A_._12 / B_;
          _21 := A_._21 / B_;  _22 := A_._22 / B_;
     end
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TdDoubleM2.Det :TdDouble;
begin
     Result := _11 * _22 - _21 * _12;
end;

function TdDoubleM2.Adjugate :TdDoubleM2;
begin
     Result._11 := +_22;  Result._12 := -_12;
     Result._21 := -_21;  Result._22 := +_11;
end;

function TdDoubleM2.Inverse :TdDoubleM2;
begin
     Result := Adjugate / Det;
end;

//------------------------------------------------------------------------------

class function TdDoubleM2.Rotate( const Angle_:TdDouble ) :TdDoubleM2;
var
   S, C :TdDouble;
begin
     SinCos( Angle_, S, C );

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
