unit LUX.Brep.TetraMesh.Delaunay;

interface //#################################################################### Å°

uses LUX, LUX.D3, LUX.Geometry, LUX.Geometry.D3, LUX.Graph, LUX.Graph.Tree,
     LUX.Brep, LUX.Brep.TetraMesh;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$Åyå^Åz

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ÅyÉåÉRÅ[ÉhÅz

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ÅyÉNÉâÉXÅz

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDelaPoin

     TDelaPoin = class( TTetraPoin )
     private
     protected
       _Value :Single;
     public
       ///// ÉvÉçÉpÉeÉB
       property Value :Single read _Value write _Value;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDelaCell

     TDelaCell = class( TTetraCell )
     private
     protected
       _Flag :Byte;
       _CS2  :TSingleSpher2;
       ///// ÉAÉNÉZÉX
       function GetPoin( const I_:Byte ) :TDelaPoin;
       procedure SetPoin( const I_:Byte; const Poin_:TDelaPoin );
       function GetCell( const I_:Byte ) :TDelaCell;
       procedure SetCell( const I_:Byte; const Cell_:TDelaCell );
       function GetCS :TSingleSphere;
     public
       ///// ÉvÉçÉpÉeÉB
       property Poin[ const I_:Byte ] :TDelaPoin     read GetPoin write SetPoin;
       property Cell[ const I_:Byte ] :TDelaCell     read GetCell write SetCell;
       property CS2                   :TSingleSpher2 read   _CS2               ;
       property CS                    :TSingleSphere read GetCS                ;
       /////
       function HitOK( const Pos_:TSingle3D ) :Boolean;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDelaunay3D

     TDelaunay3D = class( TTetraModel<TDelaPoin,TDelaCell> )
     type
       TJoint = record
         Cell1 :TDelaCell;  Vert1 :Byte;  Edge1 :Byte;
         Cell2 :TDelaCell;  Vert2 :Byte;  Edge2 :Byte;
         Cell3 :TDelaCell;  Vert3 :Byte;  Edge3 :Byte;
       end;
     private
       _TEMP :TFold;
     protected
       _InnerCells :TFold;
       _OuterCells :TFold;
       function GetCells( const I_:Integer ) :TDelaCell; override;
       function GetCellsN :Integer; override;
       ///// ÉÅÉ\ÉbÉh
       procedure Init3;
     public
       constructor Create; overload;
       constructor Create( const P1_,P2_,P3_:TSingle3D ); overload;
       //constructor Create( const P0_,P1_,P2_,P3_:TSingle3D );
       destructor Destroy; override;
       ///// ÉÅÉ\ÉbÉh
       function AddCell( const Poin0_,Poin1_,Poin2_,Poin3_:TDelaPoin ) :TDelaCell;
       function HitCell( const Pos_:TSingle3D ) :TDelaCell;
       function AddPoin( const Pos_:TSingle3D ) :TDelaPoin;
       procedure AddPoin3( const Poin_:TDelaPoin ); overload;
       //function AddPoin3( const Pos_:TSingle3D ) :TDelaPoin; overload;
       procedure AddPoin3( const Poin_:TDelaPoin; const Cell_:TDelaCell ); overload;
       //function AddPoin3( const Pos_:TSingle3D; const Cell_:TDelaCell ) :TDelaPoin; overload;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ÅyíËêîÅz

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ÅyïœêîÅz

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ÅyÉãÅ[É`ÉìÅz

implementation //############################################################### Å°

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ÅyÉåÉRÅ[ÉhÅz

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ÅyÉNÉâÉXÅz

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDelaPoin

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDelaCell

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

function TDelaCell.GetPoin( const I_:Byte ) :TDelaPoin;
begin
     Result := TDelaPoin( inherited Poin[ I_ ] )
end;

procedure TDelaCell.SetPoin( const I_:Byte; const Poin_:TDelaPoin );
begin
     inherited Poin[ I_ ] := Poin_
end;

function TDelaCell.GetCell( const I_:Byte ) :TDelaCell;
begin
     Result := TDelaCell( inherited Cell[ I_ ] )
end;

procedure TDelaCell.SetCell( const I_:Byte; const Cell_:TDelaCell );
begin
     inherited Cell[ I_ ] := Cell_
end;

function TDelaCell.GetCS :TSingleSphere;
begin
     Result := _CS2;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

function TDelaCell.HitOK( const Pos_:TSingle3D ) :Boolean;
begin
     with _CS2 do
     begin
          if Assigned( Poin[ 0 ] ) and
             Assigned( Poin[ 1 ] ) and
             Assigned( Poin[ 2 ] ) and
             Assigned( Poin[ 3 ] ) then Result := ( ( Pos_ - Center ).Siz2     < Radiu2 )
                                   else Result := ( DotProduct( Pos_, Center ) < Radiu2 );
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDelaunay3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

function TDelaunay3D.GetCells( const I_:Integer ) :TDelaCell;
begin
     Result := TDelaCell( _InnerCells[ I_ ] );
end;

function TDelaunay3D.GetCellsN :Integer;
begin
     Result := _InnerCells.ChildrenN;
end;

procedure TDelaunay3D.Init3;
var
   P1, P2, P3 :TDelaPoin;
   C0, C1 :TDelaCell;
begin
     P1 := Poins[ 0 ];
     P2 := Poins[ 1 ];
     P3 := Poins[ 2 ];

     C0 := AddCell( nil, P1, P2, P3 );
     C1 := AddCell( nil, P1, P3, P2 );

     with C0 do
     begin
          Cell[ 0 ] := C1;  Vert[ 0 ] := 0;  Bond[ 0 ] := 1;
          Cell[ 1 ] := C1;  Vert[ 1 ] := 1;  Bond[ 1 ] := 1;
          Cell[ 2 ] := C1;  Vert[ 2 ] := 3;  Bond[ 2 ] := 1;
          Cell[ 3 ] := C1;  Vert[ 3 ] := 2;  Bond[ 3 ] := 1;
     end;

     with C1 do
     begin
          Cell[ 0 ] := C0;  Vert[ 0 ] := 0;  Bond[ 0 ] := 1;
          Cell[ 1 ] := C0;  Vert[ 1 ] := 1;  Bond[ 1 ] := 1;
          Cell[ 2 ] := C0;  Vert[ 2 ] := 3;  Bond[ 2 ] := 1;
          Cell[ 3 ] := C0;  Vert[ 3 ] := 2;  Bond[ 3 ] := 1;
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TDelaunay3D.Create;
begin
     inherited;

     _InnerCells := TFold.Create( _Cells );
     _OuterCells := TFold.Create( _Cells );

     _TEMP := TFold.Create;
end;

constructor TDelaunay3D.Create( const P1_,P2_,P3_:TSingle3D );
begin
     Create;

     //////////

     TDelaPoin.Create( P1_, _Poins );
     TDelaPoin.Create( P2_, _Poins );
     TDelaPoin.Create( P3_, _Poins );

     Init3;
end;

{
constructor TDelaunay3D.Create( const P0_,P1_,P2_,P3_:TSingle3D );
var
   P0, P1, P2, P3 :TDelaPoin;
   C, C0, C1, C2, C3 :TDelaCell;
begin
     inherited Create;

     _OuterCells := TFold.Create;

     _TEMP := TFold.Create;

     //////////////////////////////////////////////////

     P0 := TDelaPoin.Create( P0_, _Poins );
     P1 := TDelaPoin.Create( P1_, _Poins );
     P2 := TDelaPoin.Create( P2_, _Poins );
     P3 := TDelaPoin.Create( P3_, _Poins );

     C := AddCell( P0, P1, P2, P3 );

     C0 := AddCell( nil, P1, P3, P2 );
     C1 := AddCell( nil, P0, P2, P3 );
     C2 := AddCell( nil, P3, P1, P0 );
     C3 := AddCell( nil, P2, P0, P1 );

     with C do
     begin
          Cell[ 0 ] := C0; Vert[ 0 ] := 0; Bond[ 0 ] := 1;
          Cell[ 1 ] := C1; Vert[ 1 ] := 0; Bond[ 1 ] := 1;
          Cell[ 2 ] := C2; Vert[ 2 ] := 0; Bond[ 2 ] := 1;
          Cell[ 3 ] := C3; Vert[ 3 ] := 0; Bond[ 3 ] := 1;
     end;

     with C0 do
     begin
          Cell[ 0 ] := C;  Vert[ 0 ] := 0; Bond[ 0 ] := 1;
          Cell[ 1 ] := C1; Vert[ 1 ] := 1; Bond[ 1 ] := 1;
          Cell[ 2 ] := C3; Vert[ 2 ] := 2; Bond[ 2 ] := 2;
          Cell[ 3 ] := C2; Vert[ 3 ] := 3; Bond[ 3 ] := 3;
     end;

     with C1 do
     begin
          Cell[ 0 ] := C;  Vert[ 0 ] := 1; Bond[ 0 ] := 1;
          Cell[ 1 ] := C0; Vert[ 1 ] := 1; Bond[ 1 ] := 1;
          Cell[ 2 ] := C2; Vert[ 2 ] := 2; Bond[ 2 ] := 2;
          Cell[ 3 ] := C3; Vert[ 3 ] := 3; Bond[ 3 ] := 3;
     end;

     with C2 do
     begin
          Cell[ 0 ] := C;  Vert[ 0 ] := 2; Bond[ 0 ] := 1;
          Cell[ 1 ] := C3; Vert[ 1 ] := 1; Bond[ 1 ] := 1;
          Cell[ 2 ] := C1; Vert[ 2 ] := 2; Bond[ 2 ] := 2;
          Cell[ 3 ] := C0; Vert[ 3 ] := 3; Bond[ 3 ] := 3;
     end;

     with C3 do
     begin
          Cell[ 0 ] := C;  Vert[ 0 ] := 3; Bond[ 0 ] := 1;
          Cell[ 1 ] := C2; Vert[ 1 ] := 1; Bond[ 1 ] := 1;
          Cell[ 2 ] := C0; Vert[ 2 ] := 2; Bond[ 2 ] := 2;
          Cell[ 3 ] := C1; Vert[ 3 ] := 3; Bond[ 3 ] := 3;
     end;
end;
}

destructor TDelaunay3D.Destroy;
begin
     _TEMP.Free;

     //_OuterCells.Free;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// ÉÅÉ\ÉbÉh

function TDelaunay3D.AddCell( const Poin0_,Poin1_,Poin2_,Poin3_:TDelaPoin ) :TDelaCell;
var
   I :Shortint;
begin
     Result := TDelaCell.Create;

     with Result do
     begin
          _Flag := 0;

          Poin[ 0 ] := Poin0_;
          Poin[ 1 ] := Poin1_;
          Poin[ 2 ] := Poin2_;
          Poin[ 3 ] := Poin3_;

          I := Open;

          if I < 0 then
          begin
               Parent := _InnerCells;

               _CS2 := CircumSpher2;
          end
          else
          begin
               Parent := _OuterCells;

               with _CS2 do
               begin
                    Center := VoroVec[ I ];
                    Radiu2 := DotProduct( Center, _Poin[ _VertTable[ I ]._[ 1 ] ].Position );
               end;
          end;

          {
          case Open of
            0: begin
                    Parent := _OuterCells;

                    with _CS2 do
                    begin
                         Center := CrossProduct( Poin1_.Position - Poin2_.Position, Poin2_.Position - Poin3_.Position );
                         Radiu2 := DotProduct( Center, Poin1_.Position );
                    end;
               end;
            1: begin
                    Parent := _OuterCells;

                    with _CS2 do
                    begin
                         Center := CrossProduct( Poin3_.Position - Poin0_.Position, Poin2_.Position - Poin0_.Position );
                         Radiu2 := DotProduct( Center, Poin0_.Position );
                    end;
               end;
            2: begin
                    Parent := _OuterCells;

                    with _CS2 do
                    begin
                         Center := CrossProduct( Poin1_.Position - Poin0_.Position, Poin3_.Position - Poin0_.Position );
                         Radiu2 := DotProduct( Center, Poin0_.Position );
                    end;
               end;
            3: begin
                    Parent := _OuterCells;

                    with _CS2 do
                    begin
                         Center := CrossProduct( Poin2_.Position - Poin0_.Position, Poin1_.Position - Poin0_.Position );
                         Radiu2 := DotProduct( Center, Poin0_.Position );
                    end;
               end;
          else begin
                    Parent := _InnerCells;

                    _CS2 := CircumSpher2;
               end;
          end;
          }
     end;
end;

function TDelaunay3D.HitCell( const Pos_:TSingle3D ) :TDelaCell;
var
   I :Integer;
begin
     with _OuterCells do
     begin
          for I := 0 to ChildrenN-1 do
          begin
               Result := TDelaCell( Children[ I ] );

               if Result.HitOK( Pos_ ) then Exit;
          end;
     end;

     with _InnerCells do
     begin
          for I := 0 to ChildrenN-1 do
          begin
               Result := TDelaCell( Children[ I ] );

               if Result.HitOK( Pos_ ) then Exit;
          end;
     end;

     Result := nil
end;

function TDelaunay3D.AddPoin( const Pos_:TSingle3D ) :TDelaPoin;
begin
     Result := TDelaPoin.Create( Pos_, _Poins );

     if PoinsN > 3 then AddPoin3( Result )
                   else
     if PoinsN = 3 then Init3;
end;

procedure TDelaunay3D.AddPoin3( const Poin_:TDelaPoin );
begin
     AddPoin3( Poin_, HitCell( Poin_.Position ) )
end;

{
function TDelaunay3D.AddPoin3( const Pos_:TSingle3D ) :TDelaPoin;
begin
     Result := AddPoin3( Pos_, HitCell( Pos_ ) )
end;
}

procedure TDelaunay3D.AddPoin3( const Poin_:TDelaPoin; const Cell_:TDelaCell );
//---------------------------------------------------------------------------
     function Tree( const Cell_:TDelaCell; const Vert_:Byte; const E1_,E2_,E3_:Byte ) :TJoint;
     //---------------------------------------------------------------------------
          procedure Connect( const J1_,J2_,J3_:TJoint );
          begin
               with J1_ do
               begin
                    with Cell2 do
                    begin
                         Cell[ Vert2 ] := J2_.Cell3;
                         Vert[ Vert2 ] := J2_.Vert3;
                         Bond[ Vert2 ] := _BondTable[ Edge2 ]._[ J2_.Edge3 ];
                    end;

                    with Cell3 do
                    begin
                         Cell[ Vert3 ] := J3_.Cell2;
                         Vert[ Vert3 ] := J3_.Vert2;
                         Bond[ Vert3 ] := _BondTable[ Edge3 ]._[ J3_.Edge2 ];
                    end;
               end
          end;
     //---------------------------------------------------------------------------
     var
        V1, V2, V3 :Byte;
        J1, J2, J3 :TJoint;
        P1, P2, P3 :TDelaPoin;
        C :TDelaCell;
     begin
          with _VertTable[ Vert_ ] do
          begin
               V1 := _[ E1_ ];
               V2 := _[ E2_ ];
               V3 := _[ E3_ ];
          end;

          with Cell_ do
          begin
               case _Flag of
                 0: begin
                         if HitOK( Poin_.Position ) then
                         begin
                              _Flag := 1;

                              with _BondTable[ Bond[ V1 ] ] do J1 := Tree( Cell[ V1 ], Vert[ V1 ], _[ E1_ ], _[ E3_ ], _[ E2_ ] );
                              with _BondTable[ Bond[ V2 ] ] do J2 := Tree( Cell[ V2 ], Vert[ V2 ], _[ E2_ ], _[ E1_ ], _[ E3_ ] );
                              with _BondTable[ Bond[ V3 ] ] do J3 := Tree( Cell[ V3 ], Vert[ V3 ], _[ E3_ ], _[ E2_ ], _[ E1_ ] );

                              Free;

                              Connect( J1, J2, J3 );
                              Connect( J2, J3, J1 );
                              Connect( J3, J1, J2 );
                                         
                              with Result do
                              begin
                                   Cell1 := J1.Cell1; Vert1 := J1.Vert1; Edge1 := J1.Edge1;
                                   Cell2 := J2.Cell1; Vert2 := J2.Vert1; Edge2 := J2.Edge1;
                                   Cell3 := J3.Cell1; Vert3 := J3.Vert1; Edge3 := J3.Edge1;
                              end
                         end
                         else
                         begin
                              P1 := Poin[ V1 ];
                              P2 := Poin[ V2 ];
                              P3 := Poin[ V3 ];

                              C := AddCell( Poin_, P1, P2, P3 );

                              with C do
                              begin
                                   Cell[ 0 ] := Cell_;
                                   Vert[ 0 ] := Vert_;
                                   Bond[ 0 ] := _BondTable[ 1 ]._[ E1_ ];
                              end;

                              Cell[ Vert_ ] := C;
                              Vert[ Vert_ ] := 0;
                              Bond[ Vert_ ] := _BondTable[ E1_ ]._[ 1 ];

                              with Result do
                              begin
                                   Cell1 := C; Vert1 := 1; Edge1 := 1;
                                   Cell2 := C; Vert2 := 2; Edge2 := 2;
                                   Cell3 := C; Vert3 := 3; Edge3 := 3;
                              end
                         end
                    end;
                 1: begin
                         C := TDelaCell.Create( _TEMP );

                         with C do
                         begin
                              _Flag := 2;

                         //   Cell[ 0 ] := Cell_;
                         //   Vert[ 0 ] := Vert_;
                         //   Bond[ 0 ] := BondTable[ 1 ]._[ E1_ ];

                              Cell[ 1 ] := C; Vert[ 1 ] := 0; //Bond[ 1 ] := 1;
                              Cell[ 2 ] := C; Vert[ 2 ] := 0; //Bond[ 2 ] := 2;
                              Cell[ 3 ] := C; Vert[ 3 ] := 0; //Bond[ 3 ] := 3;
                         end;
                              
                         Cell[ Vert_ ] := C;
                         Vert[ Vert_ ] := 0;
                         Bond[ Vert_ ] := _BondTable[ E1_ ]._[ 1 ];

                         with Result do
                         begin
                              Cell1 := C; Vert1 := 1; Edge1 := 1;
                              Cell2 := C; Vert2 := 2; Edge2 := 2;
                              Cell3 := C; Vert3 := 3; Edge3 := 3;
                         end
                    end;
                 2: begin
                         with Result do
                         begin
                              Cell1 := Cell[ V1 ]; Vert1 := Vert[ V1 ]; Edge1 := _BondTable[ Bond[ V1 ] ]._[ E1_ ];
                              Cell2 := Cell[ V2 ]; Vert2 := Vert[ V2 ]; Edge2 := _BondTable[ Bond[ V2 ] ]._[ E2_ ];
                              Cell3 := Cell[ V3 ]; Vert3 := Vert[ V3 ]; Edge3 := _BondTable[ Bond[ V3 ] ]._[ E3_ ];
                         end
                    end
               end
          end
     end;
     //----------------------------------------------------------------------
     procedure Connect( const J0_,J1_,J2_,J3_:TJoint );
     begin
          with J0_ do
          begin
               with Cell1 do
               begin
                    Cell[ Vert1 ] := J1_.Cell1;
                    Vert[ Vert1 ] := J1_.Vert1;
                    Bond[ Vert1 ] := _BondTable[ Edge1 ]._[ J1_.Edge1 ];
               end;
               with Cell2 do
               begin
                    Cell[ Vert2 ] := J2_.Cell2;
                    Vert[ Vert2 ] := J2_.Vert2;
                    Bond[ Vert2 ] := _BondTable[ Edge2 ]._[ J2_.Edge2 ];
               end;
               with Cell3 do
               begin
                    Cell[ Vert3 ] := J3_.Cell3;
                    Vert[ Vert3 ] := J3_.Vert3;
                    Bond[ Vert3 ] := _BondTable[ Edge3 ]._[ J3_.Edge3 ];
               end;
          end
     end;
//--------------------------------------------------------------------------- 
var
   J0, J1, J2, J3 :TJoint;
begin
     with Cell_ do
     begin
          _Flag := 1;

          with _BondTable[ Bond[ 0 ] ] do J0 := Tree( Cell[ 0 ], Vert[ 0 ], _[ 1 ], _[ 2 ], _[ 3 ] );
          with _BondTable[ Bond[ 1 ] ] do J1 := Tree( Cell[ 1 ], Vert[ 1 ], _[ 1 ], _[ 2 ], _[ 3 ] );
          with _BondTable[ Bond[ 2 ] ] do J2 := Tree( Cell[ 2 ], Vert[ 2 ], _[ 1 ], _[ 2 ], _[ 3 ] );
          with _BondTable[ Bond[ 3 ] ] do J3 := Tree( Cell[ 3 ], Vert[ 3 ], _[ 1 ], _[ 2 ], _[ 3 ] );

          Free
     end;

     Connect( J0, J1, J2, J3 );
     Connect( J1, J0, J3, J2 );
     Connect( J2, J3, J0, J1 );
     Connect( J3, J2, J1, J0 );
                
     _TEMP.DeleteChildren;
end;

{
function TDelaunay3D.AddPoin3( const Pos_:TSingle3D; const Cell_:TDelaCell ) :TDelaPoin;
var
   P0 :TDelaPoin;
//---------------------------------------------------------------------------
     function Tree( const Cell_:TDelaCell; const Vert_:Byte; const E1_,E2_,E3_:Byte ) :TJoint;
     //---------------------------------------------------------------------------
          procedure Connect( const J1_,J2_,J3_:TJoint );
          begin
               with J1_ do
               begin
                    with Cell2 do
                    begin
                         Cell[ Vert2 ] := J2_.Cell3;
                         Vert[ Vert2 ] := J2_.Vert3;
                         Bond[ Vert2 ] := _BondTable[ Edge2 ]._[ J2_.Edge3 ];
                    end;

                    with Cell3 do
                    begin
                         Cell[ Vert3 ] := J3_.Cell2;
                         Vert[ Vert3 ] := J3_.Vert2;
                         Bond[ Vert3 ] := _BondTable[ Edge3 ]._[ J3_.Edge2 ];
                    end;
               end
          end;
     //---------------------------------------------------------------------------
     var
        V1, V2, V3 :Byte;
        J1, J2, J3 :TJoint;
        P1, P2, P3 :TDelaPoin;
        C :TDelaCell;
     begin
          with _VertTable[ Vert_ ] do
          begin
               V1 := _[ E1_ ];
               V2 := _[ E2_ ];
               V3 := _[ E3_ ];
          end;

          with Cell_ do
          begin
               case _Flag of
                 0: begin
                         if HitOK( Pos_ ) then
                         begin
                              _Flag := 1;

                              with _BondTable[ Bond[ V1 ] ] do J1 := Tree( Cell[ V1 ], Vert[ V1 ], _[ E1_ ], _[ E3_ ], _[ E2_ ] );
                              with _BondTable[ Bond[ V2 ] ] do J2 := Tree( Cell[ V2 ], Vert[ V2 ], _[ E2_ ], _[ E1_ ], _[ E3_ ] );
                              with _BondTable[ Bond[ V3 ] ] do J3 := Tree( Cell[ V3 ], Vert[ V3 ], _[ E3_ ], _[ E2_ ], _[ E1_ ] );

                              Free;

                              Connect( J1, J2, J3 );
                              Connect( J2, J3, J1 );
                              Connect( J3, J1, J2 );

                              with Result do
                              begin
                                   Cell1 := J1.Cell1; Vert1 := J1.Vert1; Edge1 := J1.Edge1;
                                   Cell2 := J2.Cell1; Vert2 := J2.Vert1; Edge2 := J2.Edge1;
                                   Cell3 := J3.Cell1; Vert3 := J3.Vert1; Edge3 := J3.Edge1;
                              end
                         end
                         else
                         begin
                              P1 := Poin[ V1 ];
                              P2 := Poin[ V2 ];
                              P3 := Poin[ V3 ];

                              C := AddCell( P0, P1, P2, P3 );

                              with C do
                              begin
                                   Cell[ 0 ] := Cell_;
                                   Vert[ 0 ] := Vert_;
                                   Bond[ 0 ] := _BondTable[ 1 ]._[ E1_ ];
                              end;

                              Cell[ Vert_ ] := C;
                              Vert[ Vert_ ] := 0;
                              Bond[ Vert_ ] := _BondTable[ E1_ ]._[ 1 ];

                              with Result do
                              begin
                                   Cell1 := C; Vert1 := 1; Edge1 := 1;
                                   Cell2 := C; Vert2 := 2; Edge2 := 2;
                                   Cell3 := C; Vert3 := 3; Edge3 := 3;
                              end
                         end
                    end;
                 1: begin
                         C := TDelaCell.Create( _TEMP );

                         with C do
                         begin
                              _Flag := 2;

                         //   Cell[ 0 ] := Cell_;
                         //   Vert[ 0 ] := Vert_;
                         //   Bond[ 0 ] := BondTable[ 1 ]._[ E1_ ];

                              Cell[ 1 ] := C; Vert[ 1 ] := 0; //Bond[ 1 ] := 1;
                              Cell[ 2 ] := C; Vert[ 2 ] := 0; //Bond[ 2 ] := 2;
                              Cell[ 3 ] := C; Vert[ 3 ] := 0; //Bond[ 3 ] := 3;
                         end;

                         Cell[ Vert_ ] := C;
                         Vert[ Vert_ ] := 0;
                         Bond[ Vert_ ] := _BondTable[ E1_ ]._[ 1 ];

                         with Result do
                         begin
                              Cell1 := C; Vert1 := 1; Edge1 := 1;
                              Cell2 := C; Vert2 := 2; Edge2 := 2;
                              Cell3 := C; Vert3 := 3; Edge3 := 3;
                         end
                    end;
                 2: begin
                         with Result do
                         begin
                              Cell1 := Cell[ V1 ]; Vert1 := Vert[ V1 ]; Edge1 := _BondTable[ Bond[ V1 ] ]._[ E1_ ];
                              Cell2 := Cell[ V2 ]; Vert2 := Vert[ V2 ]; Edge2 := _BondTable[ Bond[ V2 ] ]._[ E2_ ];
                              Cell3 := Cell[ V3 ]; Vert3 := Vert[ V3 ]; Edge3 := _BondTable[ Bond[ V3 ] ]._[ E3_ ];
                         end
                    end
               end
          end
     end;
     //----------------------------------------------------------------------
     procedure Connect( const J0_,J1_,J2_,J3_:TJoint );
     begin
          with J0_ do
          begin
               with Cell1 do
               begin
                    Cell[ Vert1 ] := J1_.Cell1;
                    Vert[ Vert1 ] := J1_.Vert1;
                    Bond[ Vert1 ] := _BondTable[ Edge1 ]._[ J1_.Edge1 ];
               end;
               with Cell2 do
               begin
                    Cell[ Vert2 ] := J2_.Cell2;
                    Vert[ Vert2 ] := J2_.Vert2;
                    Bond[ Vert2 ] := _BondTable[ Edge2 ]._[ J2_.Edge2 ];
               end;
               with Cell3 do
               begin
                    Cell[ Vert3 ] := J3_.Cell3;
                    Vert[ Vert3 ] := J3_.Vert3;
                    Bond[ Vert3 ] := _BondTable[ Edge3 ]._[ J3_.Edge3 ];
               end;
          end
     end;
//---------------------------------------------------------------------------
var
   J0, J1, J2, J3 :TJoint;
begin
     P0 := TDelaPoin.Create( Pos_, _Poins );

     with Cell_ do
     begin
          _Flag := 1;

          with _BondTable[ Bond[ 0 ] ] do J0 := Tree( Cell[ 0 ], Vert[ 0 ], _[ 1 ], _[ 2 ], _[ 3 ] );
          with _BondTable[ Bond[ 1 ] ] do J1 := Tree( Cell[ 1 ], Vert[ 1 ], _[ 1 ], _[ 2 ], _[ 3 ] );
          with _BondTable[ Bond[ 2 ] ] do J2 := Tree( Cell[ 2 ], Vert[ 2 ], _[ 1 ], _[ 2 ], _[ 3 ] );
          with _BondTable[ Bond[ 3 ] ] do J3 := Tree( Cell[ 3 ], Vert[ 3 ], _[ 1 ], _[ 2 ], _[ 3 ] );

          Free
     end;

     Connect( J0, J1, J2, J3 );
     Connect( J1, J0, J3, J2 );
     Connect( J2, J3, J0, J1 );
     Connect( J3, J2, J1, J0 );

     _TEMP.DeleteChildren;

     Result := P0;
end;
}

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ÅyÉãÅ[É`ÉìÅz

//############################################################################## Å†

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ èâä˙âª

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ ç≈èIâª

end. //######################################################################### Å°
