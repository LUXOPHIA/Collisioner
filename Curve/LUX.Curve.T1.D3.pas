unit LUX.Curve.T1.D3;

interface //#################################################################### ■

uses LUX,
     LUX.D1,
     LUX.D2, LUX.D2.V4,
     LUX.D3, LUX.D3.V4,
     LUX.D4,
     LUX.Curve.T1.D1, LUX.Curve.T1.D2;

//type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function CatmullRom( const P0_,P1_,P2_,P3_:TSingle3D; const T_:Single ) :TSingle3D; overload;
function CatmullRom( const P0_,P1_,P2_,P3_:TDouble3D; const T_:Double ) :TDouble3D; overload;
function CatmullRom( const P0_,P1_,P2_,P3_:TdSingle3D; const T_:TdSingle ) :TdSingle3D; overload;
function CatmullRom( const P0_,P1_,P2_,P3_:TdDouble3D; const T_:TdDouble ) :TdDouble3D; overload;

function Bezier4( const Ps_:TSingle3DV4; const T_:Single ) :TSingle3D; overload;
function Bezier4( const Ps_:TDouble3DV4; const T_:Double ) :TDouble3D; overload;
function Bezier4( const Ps_:TdSingle3DV4; const T_:TdSingle ) :TdSingle3D; overload;
function Bezier4( const Ps_:TdDouble3DV4; const T_:TdDouble ) :TdDouble3D; overload;

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function CatmullRom( const P0_,P1_,P2_,P3_:TSingle3D; const T_:Single ) :TSingle3D;
begin
     Result.X := CatmullRom( P0_.X, P1_.X, P2_.X, P3_.X, T_ );
     Result.Y := CatmullRom( P0_.Y, P1_.Y, P2_.Y, P3_.Y, T_ );
     Result.Z := CatmullRom( P0_.Z, P1_.Z, P2_.Z, P3_.Z, T_ );
end;

function CatmullRom( const P0_,P1_,P2_,P3_:TDouble3D; const T_:Double ) :TDouble3D;
begin
     Result.X := CatmullRom( P0_.X, P1_.X, P2_.X, P3_.X, T_ );
     Result.Y := CatmullRom( P0_.Y, P1_.Y, P2_.Y, P3_.Y, T_ );
     Result.Z := CatmullRom( P0_.Z, P1_.Z, P2_.Z, P3_.Z, T_ );
end;

function CatmullRom( const P0_,P1_,P2_,P3_:TdSingle3D; const T_:TdSingle ) :TdSingle3D;
begin
     Result.X := CatmullRom( P0_.X, P1_.X, P2_.X, P3_.X, T_ );
     Result.Y := CatmullRom( P0_.Y, P1_.Y, P2_.Y, P3_.Y, T_ );
     Result.Z := CatmullRom( P0_.Z, P1_.Z, P2_.Z, P3_.Z, T_ );
end;

function CatmullRom( const P0_,P1_,P2_,P3_:TdDouble3D; const T_:TdDouble ) :TdDouble3D;
begin
     Result.X := CatmullRom( P0_.X, P1_.X, P2_.X, P3_.X, T_ );
     Result.Y := CatmullRom( P0_.Y, P1_.Y, P2_.Y, P3_.Y, T_ );
     Result.Z := CatmullRom( P0_.Z, P1_.Z, P2_.Z, P3_.Z, T_ );
end;

//------------------------------------------------------------------------------

function Bezier4( const Ps_:TSingle3DV4; const T_:Single ) :TSingle3D;
var
   Ws :TSingle4D;
begin
     Bezier4( T_, Ws );

     with Ws do Result := _1 * Ps_._1
                        + _2 * Ps_._2
                        + _3 * Ps_._3
                        + _4 * Ps_._4;
end;

function Bezier4( const Ps_:TDouble3DV4; const T_:Double ) :TDouble3D;
var
   Ws :TDouble4D;
begin
     Bezier4( T_, Ws );

     with Ws do Result := _1 * Ps_._1
                        + _2 * Ps_._2
                        + _3 * Ps_._3
                        + _4 * Ps_._4;
end;

function Bezier4( const Ps_:TdSingle3DV4; const T_:TdSingle ) :TdSingle3D;
var
   Ws :TdSingle4D;
begin
     Bezier4( T_, Ws );

     with Ws do Result := _1 * Ps_._1
                        + _2 * Ps_._2
                        + _3 * Ps_._3
                        + _4 * Ps_._4;
end;

function Bezier4( const Ps_:TdDouble3DV4; const T_:TdDouble ) :TdDouble3D;
var
   Ws :TdDouble4D;
begin
     Bezier4( T_, Ws );

     with Ws do Result := _1 * Ps_._1
                        + _2 * Ps_._2
                        + _3 * Ps_._3
                        + _4 * Ps_._4;
end;

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
