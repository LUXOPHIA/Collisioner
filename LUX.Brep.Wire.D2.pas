unit LUX.Brep.Wire.D2;

interface //#################################################################### ■

uses LUX, LUX.D2, LUX.Brep.Poin, LUX.Brep.Wire;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     TWire2D<_TPoin_:TPoin<TSingle2D>> = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TWire2D<_TPos_>

     TWire2D<_TPoin_:TPoin<TSingle2D>> = class( TWire<TSingle2D,_TPoin_> )
     private
     protected
       ///// アクセス
       function GetLeng :Single;
       function GetVector :TSingle2D;
       function GetUnitor :TSingle2D;
     public
       property Leng   :Single    read GetLeng  ;
       property Vector :TSingle2D read GetVector;
       property Unitor :TSingle2D read GetUnitor;
       ///// メソッド
       function DistanTo( const Wire_:TWire2D<_TPoin_> ) :TSingle2D; overload;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TWireModel2D<_TPoin_,_TWire_>

     TWireModel2D<_TPoin_:TPoin<TSingle2D>;
                  _TWire_:TWire2D<_TPoin_>> = class( TWireModel<TSingle2D,_TPoin_,_TWire_> )
     private
     protected
     public
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TWire2D<_TPoin_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TWire2D<_TPoin_>.GetLeng :Single;
begin
     Result := Poin0.Pos.DistanTo( Poin1.Pos );
end;

function TWire2D<_TPoin_>.GetVector :TSingle2D;
begin
     Result := Poin0.Pos.VectorTo( Poin1.Pos );
end;

function TWire2D<_TPoin_>.GetUnitor :TSingle2D;
begin
     Result := Poin0.Pos.UnitorTo( Poin1.Pos );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

function TWire2D<_TPoin_>.DistanTo( const Wire_:TWire2D<_TPoin_> ) :TSingle2D;
var
   V, V0, V1, P0, P1 :TSingle2D;
   L0, L1, C0, C1, C, U, T0, T1 :Single;
begin
     V := Poin0.Pos.VectorTo( Wire_.Poin0.Pos );

     V0 :=       Vector;  L0 := V0.Siz2;  C0 := DotProduct( V0, V );
     V1 := Wire_.Vector;  L1 := V1.Siz2;  C1 := DotProduct( V1, V );

     C := DotProduct( V0, V1 );

     U := L0 * L1 - Pow2( C );

     if U > 0 then T0 := Clamp( ( C0 * L1 - C * C1 ) / U, 0, 1 )
              else T0 := 0;

     T1 := ( C * T0 - C1 ) / L1;

     if T1 < 0 then
     begin
          T0 := Clamp(       C0   / L0, 0, 1 );
          T1 :=                         0     ;
     end
     else
     if 1 < T1 then
     begin
          T0 := Clamp( ( C + C0 ) / L0, 0, 1 );
          T1 :=                            1  ;
     end;

     P0 := V0 * T0 +       Poin0.Pos;
     P1 := V1 * T1 + Wire_.Poin0.Pos;

     Result := P0.VectorTo( P1 );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TWireModel2D<_TPoin_,_TWire_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
