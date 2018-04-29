unit LUX.Data.Lattice.T1.D1;

interface //#################################################################### ■

uses LUX.Data.Lattice.T1, LUX.Curve.T1.D1;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleIrreMap1D

     TSingleIrreMap1D = class( TIrreMap1D<Single> )
     private
     protected
       ///// メソッド
       function Interp( const G0_,G1_,G2_,G3_:Single; const Id_:Single ) :Single; overload; override;
       function InterpPos( const G0_,G1_,G2_,G3_:TPosval1D<Single>; const Pos_:Single ) :Single; overload; override;
     public
       ///// メソッド
       procedure MakeEdgeExtra;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleIrreMap1D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

function TSingleIrreMap1D.Interp( const G0_,G1_,G2_,G3_:Single; const Id_:Single ) :Single;
begin
     Result := CatmullRom( G0_, G1_, G2_, G3_, Id_ );
end;

function TSingleIrreMap1D.InterpPos( const G0_,G1_,G2_,G3_:TPosval1D<Single>; const Pos_:Single ) :Single;
begin
     Result := CatmullRom( G0_.Val, G1_.Val, G2_.Val, G3_.Val,
                           G0_.Pos, G1_.Pos, G2_.Pos, G3_.Pos, Pos_ );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TSingleIrreMap1D.MakeEdgeExtra;
var
   H, X :Integer;
   G0, G1, Gd, G :TPosval1D<Single>;
begin
     {                                      H
                                            |
       -3  -2  -1  00  +1  +2  +3  +4  +5  +6  +7  +8  +9
       ┠─╂─╂─┣━╋━╋━╋━╋━╋━┫─╂─╂─┨
       -3  -2  -1  ・  ・  ・  ・  ・  ・  ・  +7  +8  +9
                   G0  G1              G0  G1             }

     H := CellsX;

     G0 := Items[ 0 ];
     G1 := Items[ 1 ];

     Gd.Pos := G0.Pos - G1.Pos;
     Gd.Val := G0.Val - G1.Val;

     for X := 1 to _MargsX do
     begin
          with G do
          begin
               Pos := G0.Pos + X * Gd.Pos;
               Val := G0.Val + X * Gd.Val;
          end;

          Poins[ 0-X ] := G;
     end;

     G0 := Items[ H-1 ];
     G1 := Items[ H   ];

     Gd.Pos := G1.Pos - G0.Pos;
     Gd.Val := G1.Val - G0.Val;

     for X := 1 to _MargsX do
     begin
          with G do
          begin
               Pos := G1.Pos + X * Gd.Pos;
               Val := G1.Val + X * Gd.Pos;
          end;

          Poins[ H+X ] := G;
     end;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
