unit LUX.Curve.T2.D2;

interface //#################################################################### ■

uses LUX,
     LUX.D1,
     LUX.D2, LUX.D2.V4, LUX.D2.M4,
     LUX.D4,
     LUX.Curve.T1.D1, LUX.Curve.T1.D2,
     LUX.Curve.T2.D1;

//type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function Bezier4( const Ps_:TSingle2DM4; const T_:TSingle2D ) :TSingle2D; overload;
function Bezier4( const Ps_:TDouble2DM4; const T_:TDouble2D ) :TDouble2D; overload;
function Bezier4( const Ps_:TdSingle2DM4; const T_:TdSingle2D ) :TdSingle2D; overload;
function Bezier4( const Ps_:TdDouble2DM4; const T_:TdDouble2D ) :TdDouble2D; overload;

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function Bezier4( const Ps_:TSingle2DM4; const T_:TSingle2D ) :TSingle2D;
var
   WX, WY :TSingle4D;
   P1, P2, P3, P4 :TSingle2D;
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

function Bezier4( const Ps_:TDouble2DM4; const T_:TDouble2D ) :TDouble2D;
var
   WX, WY :TDouble4D;
   P1, P2, P3, P4 :TDouble2D;
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

function Bezier4( const Ps_:TdSingle2DM4; const T_:TdSingle2D ) :TdSingle2D;
var
   WX, WY :TdSingle4D;
   P1, P2, P3, P4 :TdSingle2D;
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

function Bezier4( const Ps_:TdDouble2DM4; const T_:TdDouble2D ) :TdDouble2D;
var
   WX, WY :TdDouble4D;
   P1, P2, P3, P4 :TdDouble2D;
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

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
