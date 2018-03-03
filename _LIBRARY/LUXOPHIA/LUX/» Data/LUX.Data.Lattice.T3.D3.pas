unit LUX.Data.Lattice.T3.D3;

interface //#################################################################### ■

uses System.SysUtils, System.Classes,
     LUX, LUX.D1, LUX.D3, LUX.Data.Lattice.T3;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     TSingleBricArray3D         = class;
     TSingleGridArray3D         = class;
     TSingleBricIterGridArray3D = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleBricArray3D

     ISingleBricArray3D = interface( IBricArray3D )
     ['{07DD7FC2-8BD0-4D64-86E5-7FFDE4CF7CA3}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TSingleBricArray3D = class( TBricArray3D<Single>, ISingleBricArray3D )
     private
     protected
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleGridArray3D

     ISingleGridArray3D = interface( IGridArray3D )
     ['{9E07E15D-0E29-4541-A755-53BABC4AC560}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TSingleGridArray3D = class( TGridArray3D<Single>, ISingleGridArray3D )
     private
     protected
     public
       ///// メソッド
       procedure ForBrics( const Proc_:TConstProc<TSingleBricIterGridArray3D> );
       procedure ForEdgesX( const Proc_:TConstProc<TSingleBricIterGridArray3D> );
       procedure ForEdgesY( const Proc_:TConstProc<TSingleBricIterGridArray3D> );
       procedure ForEdgesZ( const Proc_:TConstProc<TSingleBricIterGridArray3D> );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleBricIterGridArray3D

     ISingleBricIterGridArray3D = interface( IBricIterGridArray3D<Single> )
     ['{1FA11B62-B22A-4966-815F-48EF06FDBF3B}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TSingleBricIterGridArray3D = class( TBricIterGridArray3D<Single>, ISingleBricIterGridArray3D )
     private
     protected
     public
       ///// メソッド
       function Interp( const Xd_,Yd_,Zd_:Single ) :Single; override;
       function FracGrad( const Xd_,Yd_,Zd_:Single ) :TSingle3D; overload;
       function Grad( const d_:TSingle3D ) :TSingle3D; overload;
       function AbsoGrad( const X_,Y_,Z_:Single ) :TSingle3D;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.Math;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleBricArray3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleGridArray3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TSingleGridArray3D.ForBrics( const Proc_:TConstProc<TSingleBricIterGridArray3D> );
begin
     inherited ForBrics( procedure( const B_:TBricIterGridArray3D<Single> )
     begin
          Proc_( B_ as TSingleBricIterGridArray3D );
     end );
end;

procedure TSingleGridArray3D.ForEdgesX( const Proc_:TConstProc<TSingleBricIterGridArray3D> );
begin
     inherited ForEdgesX( procedure( const E_:TBricIterGridArray3D<Single> )
     begin
          Proc_( E_ as TSingleBricIterGridArray3D );
     end );
end;

procedure TSingleGridArray3D.ForEdgesY( const Proc_:TConstProc<TSingleBricIterGridArray3D> );
begin
     inherited ForEdgesY( procedure( const E_:TBricIterGridArray3D<Single> )
     begin
          Proc_( E_ as TSingleBricIterGridArray3D );
     end );
end;

procedure TSingleGridArray3D.ForEdgesZ( const Proc_:TConstProc<TSingleBricIterGridArray3D> );
begin
     inherited ForEdgesZ( procedure( const E_:TBricIterGridArray3D<Single> )
     begin
          Proc_( E_ as TSingleBricIterGridArray3D );
     end );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleBricIterGridArray3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

function TSingleBricIterGridArray3D.Interp( const Xd_,Yd_,Zd_:Single ) :Single;
var
   Y00, Y01, Y10, Y11, Z0, Z1 :Single;
begin
     Y00 := ( Grids[ 1, 0, 0 ] - Grids[ 0, 0, 0 ] ) * Xd_ + Grids[ 0, 0, 0 ];
     Y01 := ( Grids[ 1, 1, 0 ] - Grids[ 0, 1, 0 ] ) * Xd_ + Grids[ 0, 1, 0 ];
     Y10 := ( Grids[ 1, 0, 1 ] - Grids[ 0, 0, 1 ] ) * Xd_ + Grids[ 0, 0, 1 ];
     Y11 := ( Grids[ 1, 1, 1 ] - Grids[ 0, 1, 1 ] ) * Xd_ + Grids[ 0, 1, 1 ];

     Z0 := ( Y01 - Y00 ) * Yd_ + Y00;
     Z1 := ( Y11 - Y10 ) * Yd_ + Y10;

     Result := ( Z1 - Z0 ) * Zd_ + Z0;
end;

//------------------------------------------------------------------------------

function TSingleBricIterGridArray3D.FracGrad( const Xd_,Yd_,Zd_:Single ) :TSingle3D;
//······································
     function GetInterp( const X,Y,Z:Shortint ) :Single;
     var
        Y00, Y01, Y10, Y11, Z0, Z1 :Single;
     begin
          Y00 := ( Grids[ X+1, Y+0, Z+0 ] - Grids[ X+0, Y+0, Z+0 ] ) * Xd_ + Grids[ X+0, Y+0, Z+0 ];
          Y01 := ( Grids[ X+1, Y+1, Z+0 ] - Grids[ X+0, Y+1, Z+0 ] ) * Xd_ + Grids[ X+0, Y+1, Z+0 ];
          Y10 := ( Grids[ X+1, Y+0, Z+1 ] - Grids[ X+0, Y+0, Z+1 ] ) * Xd_ + Grids[ X+0, Y+0, Z+1 ];
          Y11 := ( Grids[ X+1, Y+1, Z+1 ] - Grids[ X+0, Y+1, Z+1 ] ) * Xd_ + Grids[ X+0, Y+1, Z+1 ];

          Z0 := ( Y01 - Y00 ) * Yd_ + Y00;
          Z1 := ( Y11 - Y10 ) * Yd_ + Y10;

          Result := ( Z1 - Z0 ) * Zd_ + Z0;
     end;
//······································
begin
     with Result do
     begin
          X := ( GetInterp( +1,  0,  0 ) - GetInterp( -1,  0,  0 ) ) / 2;
          Y := ( GetInterp(  0, +1,  0 ) - GetInterp(  0, -1,  0 ) ) / 2;
          Z := ( GetInterp(  0,  0, +1 ) - GetInterp(  0,  0, -1 ) ) / 2;
     end;
end;

function TSingleBricIterGridArray3D.Grad( const d_:TSingle3D ) :TSingle3D;
begin
     Result := FracGrad( d_.X, d_.Y, d_.Z );
end;

function TSingleBricIterGridArray3D.AbsoGrad( const X_,Y_,Z_:Single ) :TSingle3D;
var
   Xd, Yd, Zd :Single;
begin
     PosZ := Floor( Z_ );  Zd := Z_ - PosZ;
     PosY := Floor( Y_ );  Yd := Y_ - PosY;
     PosX := Floor( X_ );  Xd := X_ - PosX;

     Result := FracGrad( Xd, Yd, Zd );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
