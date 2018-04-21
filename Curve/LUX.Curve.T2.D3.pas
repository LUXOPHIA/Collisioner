unit LUX.Curve.T2.D3;

interface //#################################################################### ■

uses LUX,
     LUX.D1,
     LUX.D2, LUX.D2.V4, LUX.D2.M4,
     LUX.D3, LUX.D3.V4, LUX.D3.M4,
     LUX.D4,
     LUX.M4,
     LUX.Curve.T1.D1, LUX.Curve.T1.D2, LUX.Curve.T1.D3,
     LUX.Curve.T2.D1, LUX.Curve.T2.D2;

//type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function Bezier4( const Ps_:TSingle3DM4; const T_:TSingle2D ) :TSingle3D; overload;
function Bezier4( const Ps_:TDouble3DM4; const T_:TDouble2D ) :TDouble3D; overload;
function Bezier4( const Ps_:TdSingle3DM4; const T_:TdSingle2D ) :TdSingle3D; overload;
function Bezier4( const Ps_:TdDouble3DM4; const T_:TdDouble2D ) :TdDouble3D; overload;

function TensorBezier4( const Ps_:TSingle3DM4; const T_:TSingle2D ) :TSingleM4; overload;
function TensorBezier4( const Ps_:TDouble3DM4; const T_:TDouble2D ) :TDoubleM4; overload;

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function Bezier4( const Ps_:TSingle3DM4; const T_:TSingle2D ) :TSingle3D;
var
   WX, WY :TSingle4D;
   P1, P2, P3, P4 :TSingle3D;
begin
     Bezier4( T_.X, WX );
     Bezier4( T_.Y, WY );

     with WX do
     begin
          P1 := _1 * Ps_._11 + _2 * Ps_._12 + _3 * Ps_._13 + _4 * Ps_._14;
          P2 := _1 * Ps_._21 + _2 * Ps_._22 + _3 * Ps_._23 + _4 * Ps_._24;
          P3 := _1 * Ps_._31 + _2 * Ps_._32 + _3 * Ps_._33 + _4 * Ps_._34;
          P4 := _1 * Ps_._41 + _2 * Ps_._42 + _3 * Ps_._43 + _4 * Ps_._44;
     end;

     with WY do
     begin
          Result := _1 * P1 + _2 * P2 + _3 * P3 + _4 * P4;
     end;
end;

function Bezier4( const Ps_:TDouble3DM4; const T_:TDouble2D ) :TDouble3D;
var
   WX, WY :TDouble4D;
   P1, P2, P3, P4 :TDouble3D;
begin
     Bezier4( T_.X, WX );
     Bezier4( T_.Y, WY );

     with WX do
     begin
          P1 := _1 * Ps_._11 + _2 * Ps_._12 + _3 * Ps_._13 + _4 * Ps_._14;
          P2 := _1 * Ps_._21 + _2 * Ps_._22 + _3 * Ps_._23 + _4 * Ps_._24;
          P3 := _1 * Ps_._31 + _2 * Ps_._32 + _3 * Ps_._33 + _4 * Ps_._34;
          P4 := _1 * Ps_._41 + _2 * Ps_._42 + _3 * Ps_._43 + _4 * Ps_._44;
     end;

     with WY do
     begin
          Result := _1 * P1 + _2 * P2 + _3 * P3 + _4 * P4;
     end;
end;

function Bezier4( const Ps_:TdSingle3DM4; const T_:TdSingle2D ) :TdSingle3D;
var
   WX, WY :TdSingle4D;
   P1, P2, P3, P4 :TdSingle3D;
begin
     Bezier4( T_.X, WX );
     Bezier4( T_.Y, WY );

     with WX do
     begin
          P1 := _1 * Ps_._11 + _2 * Ps_._12 + _3 * Ps_._13 + _4 * Ps_._14;
          P2 := _1 * Ps_._21 + _2 * Ps_._22 + _3 * Ps_._23 + _4 * Ps_._24;
          P3 := _1 * Ps_._31 + _2 * Ps_._32 + _3 * Ps_._33 + _4 * Ps_._34;
          P4 := _1 * Ps_._41 + _2 * Ps_._42 + _3 * Ps_._43 + _4 * Ps_._44;
     end;

     with WY do
     begin
          Result := _1 * P1 + _2 * P2 + _3 * P3 + _4 * P4;
     end;
end;

function Bezier4( const Ps_:TdDouble3DM4; const T_:TdDouble2D ) :TdDouble3D;
var
   WX, WY :TdDouble4D;
   P1, P2, P3, P4 :TdDouble3D;
begin
     Bezier4( T_.X, WX );
     Bezier4( T_.Y, WY );

     with WX do
     begin
          P1 := _1 * Ps_._11 + _2 * Ps_._12 + _3 * Ps_._13 + _4 * Ps_._14;
          P2 := _1 * Ps_._21 + _2 * Ps_._22 + _3 * Ps_._23 + _4 * Ps_._24;
          P3 := _1 * Ps_._31 + _2 * Ps_._32 + _3 * Ps_._33 + _4 * Ps_._34;
          P4 := _1 * Ps_._41 + _2 * Ps_._42 + _3 * Ps_._43 + _4 * Ps_._44;
     end;

     with WY do
     begin
          Result := _1 * P1 + _2 * P2 + _3 * P3 + _4 * P4;
     end;
end;

//------------------------------------------------------------------------------

function TensorBezier4( const Ps_:TSingle3DM4; const T_:TSingle2D ) :TSingleM4;
var
   Ps :TdSingle3DM4;
   T :TdSingle2D;
   AP, AX, AY, AZ :TSingle3D;
begin
     Ps := Ps_;
     T  := T_ ;

     T.X.d := +1;
     T.Y.d :=  0;

     with Bezier4( Ps_, T ) do
     begin
          AP := o;
          AX := d;
     end;

     T.X.d :=  0;
     T.Y.d := -1;

     with Bezier4( Ps_, T ) do
     begin
          AY := d;
     end;

     AZ := CrossProduct( AX, AY );

     Result := TSingleM4.Identity;

     with Result do
     begin
          AxisP := AP;
          AxisX := AX.Unitor;
          AxisY := AY.Unitor;
          AxisZ := AZ.Unitor;
     end;
end;

function TensorBezier4( const Ps_:TDouble3DM4; const T_:TDouble2D ) :TDoubleM4;
var
   Ps :TdDouble3DM4;
   T :TdDouble2D;
   AP, AX, AY, AZ :TDouble3D;
begin
     Ps := Ps_;
     T  := T_ ;

     T.X.d := +1;
     T.Y.d :=  0;

     with Bezier4( Ps_, T ) do
     begin
          AP := o;
          AX := d;
     end;

     T.X.d :=  0;
     T.Y.d := -1;

     with Bezier4( Ps_, T ) do
     begin
          AY := d;
     end;

     AZ := CrossProduct( AX, AY );

     Result := TDoubleM4.Identity;

     with Result do
     begin
          AxisP := AP;
          AxisX := AX.Unitor;
          AxisY := AY.Unitor;
          AxisZ := AZ.Unitor;
     end;
end;

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
