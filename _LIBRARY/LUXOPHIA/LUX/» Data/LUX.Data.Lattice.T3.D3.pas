unit LUX.Data.Lattice.T3.D3;

interface //#################################################################### ■

uses System.SysUtils, System.Classes,
     LUX, LUX.D3, LUX.Data.Lattice.T3;

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
       function FracInterp( const Xd_,Yd_,Zd_:Single ) :Single; override;
       function Grad( const X_,Y_,Z_:Single ) :TSingle3D;
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

function TSingleBricIterGridArray3D.FracInterp( const Xd_,Yd_,Zd_:Single ) :Single;
var
   Z, Y :Integer;
   Ys :array [ -1..+2, -1..+2 ] of Single;
   Zs :array [ -1..+2 ] of Single;
begin
     for Z := 0 to 1 do
     begin
          for Y := 0 to 1 do Ys[ Z, Y ] := ( Grids[ 1, Y, Z ] - Grids[ 0, Y, Z ] ) * Xd_ + Grids[ 0, Y, Z ];
     end;

     for Z := 0 to 1 do Zs[ Z ] := ( Ys[ Z, 1 ] - Ys[ Z, 0 ] ) * Yd_ + Ys[ Z, 0 ];

     Result := ( Zs[ 1 ] - Zs[ 0 ] ) * Zd_ + Zs[ 0 ];
end;

//------------------------------------------------------------------------------

function TSingleBricIterGridArray3D.Grad( const X_,Y_,Z_:Single ) :TSingle3D;
begin
     with Result do
     begin
          X := ( Interp( X_+1, Y_  , Z_   ) - Interp( X_-1, Y_  , Z_   ) ) / 2;
          Y := ( Interp( X_  , Y_+1, Z_   ) - Interp( X_  , Y_-1, Z_   ) ) / 2;
          Z := ( Interp( X_  , Y_  , Z_+1 ) - Interp( X_  , Y_  , Z_-1 ) ) / 2;
     end;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
