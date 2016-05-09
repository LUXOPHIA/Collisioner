unit LUX.Brep.TetraMesh.FMX;

interface //#################################################################### ■

uses System.Classes, System.Math.Vectors,
     FMX.Types, FMX.Types3D, FMX.Controls3D, FMX.MaterialSources,
     LUX, LUX.D3, LUX.Geometry.D3, LUX.Brep.TetraMesh;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TEdges

     TEdges = class( TControl3D )
     private
     protected
       _Geometry   :TMeshData;
       _Material   :TMaterialSource;
       _TetraModel :TTetraModel;
       _EdgeRadius :Single;
       ///// アクセス
       procedure SetTetraModel( const TetraModel_:TTetraModel );
       procedure SetEdgeRadius( const EdgeRadius_:Single );
       ///// メソッド
       procedure Render; override;
       procedure MakeMesh( const Ps_:array of TSingle3D );
     public
       constructor Create( AOwner_:TComponent ); override;
       destructor Destroy; override;
       ///// プロパティ
       property Material   :TMaterialSource read _Material   write _Material    ;
       property TetraModel :TTetraModel     read _TetraModel write SetTetraModel;
       property EdgeRadius :Single          read _EdgeRadius write SetEdgeRadius;
       ///// メソッド
       procedure MakeModel; virtual; abstract;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDelaEdges

     TDelaEdges = class( TEdges )
     private
     protected
     public
       ///// メソッド
       procedure MakeModel; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVoroEdges

     TVoroEdges = class( TEdges )
     private
     protected
       _EdgeLength :Single;
       ///// アクセス
       procedure SetEdgeLength( const EdgeLength_:Single );
     public
       constructor Create( AOwner_:TComponent ); override;
       ///// プロパティ
       property EdgeLength :Single read _EdgeLength write SetEdgeLength;
       ///// メソッド
       procedure MakeModel; override;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.SysUtils, System.RTLConsts;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TEdges

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

procedure TEdges.SetTetraModel( const TetraModel_:TTetraModel );
begin
     _TetraModel := TetraModel_;  MakeModel;
end;

procedure TEdges.SetEdgeRadius( const EdgeRadius_:Single );
begin
     _EdgeRadius := EdgeRadius_;  MakeModel;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TEdges.Render;
begin
     Context.SetMatrix( AbsoluteMatrix );

     _Geometry.Render( Context, TMaterialSource.ValidMaterial( _Material ), AbsoluteOpacity );
end;

procedure TEdges.MakeMesh( const Ps_:array of TSingle3D );
var
   N, I :Integer;
begin
     N := Length( Ps_ );

     with _Geometry do
     begin
          with VertexBuffer do
          begin
               Length := N;

               for I := 0 to Length-1 do Vertices[ I ] := Ps_[ I ];
          end;

          with IndexBuffer do
          begin
               Length := N;

               for I := 0 to Length-1 do Indices[ I ] := I;
          end;

          CalcFaceNormals;
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TEdges.Create( AOwner_:TComponent );
begin
     inherited;

     HitTest := False;

     _Geometry := TMeshData.Create;
end;

destructor TEdges.Destroy;
begin
     _Geometry.Free;

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDelaEdges

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TDelaEdges.MakeModel;
var
   Ps :array of TSingle3D;
   I0, K :Integer;
   C0, C1 :TTetraCell;
   T0 :record
         P0, P1, P2, P3,
         C102, C203, P301,
         C021, C032, C013,
         C312, C123, C231 :TSingle3D;
       end;
begin
     Ps := [];

     for I0 := 0 to _TetraModel.CellsN-1 do
     begin
          C0 := _TetraModel.Cells[ I0 ];

          for K := 0 to 3 do
          begin
               with _VertTable[ K ] do
               begin
                    T0.P0 := C0.Poin[ _[ 0 ] ].Position;
                    T0.P1 := C0.Poin[ _[ 1 ] ].Position;
                    T0.P2 := C0.Poin[ _[ 2 ] ].Position;
                    T0.P3 := C0.Poin[ _[ 3 ] ].Position;
               end;

               T0.C102 := MarginCorner( T0.P1, T0.P0, T0.P2, _EdgeRadius );
               T0.C203 := MarginCorner( T0.P2, T0.P0, T0.P3, _EdgeRadius );
               T0.P301 := MarginCorner( T0.P3, T0.P0, T0.P1, _EdgeRadius );

               T0.C021 := MarginCorner( T0.P0, T0.P2, T0.P1, _EdgeRadius );
               T0.C032 := MarginCorner( T0.P0, T0.P3, T0.P2, _EdgeRadius );
               T0.C013 := MarginCorner( T0.P0, T0.P1, T0.P3, _EdgeRadius );

               Ps := Ps + [ T0.C021, T0.C102, T0.C203,
                            T0.C032, T0.C203, T0.P301,
                            T0.C013, T0.P301, T0.C102,
                            T0.C102, T0.P301, T0.C203 ];

               C1 := C0.Cell[ K ];

               if not ( Assigned( C1 ) and Assigned( C1.Poin[ C0.Vert[ K ] ] ) ) then
               begin
                    T0.C312 := MarginCorner( T0.P3, T0.P1, T0.P2, _EdgeRadius );
                    T0.C123 := MarginCorner( T0.P1, T0.P2, T0.P3, _EdgeRadius );
                    T0.C231 := MarginCorner( T0.P2, T0.P3, T0.P1, _EdgeRadius );

                    Ps := Ps + [ T0.P2  , T0.P1  , T0.C312,
                                 T0.C312, T0.C123, T0.P2  ,
                                 T0.P3  , T0.P2  , T0.C123,
                                 T0.C123, T0.C231, T0.P3  ,
                                 T0.P1  , T0.P3  , T0.C231,
                                 T0.C231, T0.C312, T0.P1   ];
               end;
          end;
     end;

     MakeMesh( Ps );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVoroEdges

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

procedure TVoroEdges.SetEdgeLength( const EdgeLength_:Single );
begin
     _EdgeLength := EdgeLength_;  MakeModel;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TVoroEdges.Create( AOwner_:TComponent );
begin
     inherited;

     _EdgeLength := 10;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TVoroEdges.MakeModel;
var
   Ps :array of TSingle3D;
   I0, K :Integer;
   C0, C1 :TTetraCell;
   T0 :record
         S,
         V0, V1, V2, V3,
         C01, C02, C03,
         C23, C31, C13  :TSingle3D;
       end;
   T1 :record
         S,
         V0, V1, V2, V3,
         C01, C02, C03 :TSingle3D;
       end;
begin
     Ps := [];

     for I0 := 0 to _TetraModel.CellsN-1 do
     begin
          C0 := _TetraModel.Cells[ I0 ];

          T0.S := C0.CircumCenter;

          for K := 0 to 3 do
          begin
               with _VertTable[ K ] do
               begin
                    T0.V0 := C0.VoroVec[ _[ 0 ] ];
                    T0.V1 := C0.VoroVec[ _[ 1 ] ];
                    T0.V2 := C0.VoroVec[ _[ 2 ] ];
                    T0.V3 := C0.VoroVec[ _[ 3 ] ];
               end;

               T0.C23 := T0.S + MarginCorner( T0.V2, T0.V3, _EdgeRadius );
               T0.C31 := T0.S + MarginCorner( T0.V3, T0.V1, _EdgeRadius );
               T0.C13 := T0.S + MarginCorner( T0.V1, T0.V2, _EdgeRadius );

               Ps := Ps + [ T0.C23, T0.C31, T0.C13 ];

               T0.C01 := T0.S + MarginCorner( T0.V0, T0.V1, _EdgeRadius );
               T0.C02 := T0.S + MarginCorner( T0.V0, T0.V2, _EdgeRadius );
               T0.C03 := T0.S + MarginCorner( T0.V0, T0.V3, _EdgeRadius );

               C1 := C0.Cell[ K ];

               if Assigned( C1 ) and Assigned( C1.Poin[ C0.Vert[ K ] ] ) then
               begin
                    T1.S := C1.CircumCenter;

                    T1.V0 := C1.VoroVec[ C0.Join[ K, 0 ] ];
                    T1.V1 := C1.VoroVec[ C0.Join[ K, 1 ] ];
                    T1.V2 := C1.VoroVec[ C0.Join[ K, 2 ] ];
                    T1.V3 := C1.VoroVec[ C0.Join[ K, 3 ] ];

                    T1.C01 := T1.S + MarginCorner( T1.V0, T1.V1, _EdgeRadius );
                    T1.C02 := T1.S + MarginCorner( T1.V0, T1.V2, _EdgeRadius );
                    T1.C03 := T1.S + MarginCorner( T1.V0, T1.V3, _EdgeRadius );

                    Ps := Ps + [ T1.C01, T0.C01, T0.C03,
                                 T1.C02, T0.C02, T0.C01,
                                 T1.C03, T0.C03, T0.C02 ];
               end
               else
               begin
                    T1.S := T0.S + _EdgeLength * T0.V0;

                    Ps := Ps + [ T1.S, T0.C01, T0.C03,
                                 T1.S, T0.C02, T0.C01,
                                 T1.S, T0.C03, T0.C02 ];
               end;
          end;
     end;

     MakeMesh( Ps );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
