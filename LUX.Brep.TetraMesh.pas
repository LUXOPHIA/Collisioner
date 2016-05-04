unit LUX.Brep.TetraMesh;

interface //#################################################################### ■

uses LUX, LUX.D3, LUX.Geometry.D3, LUX.Graph, LUX.Graph.Tree, LUX.Brep;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     TTetraPoin = class;
     TTetraCell = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TByteArray3

     TByteArray3 = record
       _ :array[ 1..3 ] of Byte;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TByteArray4

     TByteArray4 = record
       _ :array[ 0..3 ] of Byte;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTetraLink

     TTetraLink = record
       o :TTetraCell;
       i :Byte;
       n :Byte;
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTetraPoin

     TTetraPoin = class( TPoin )
     private
     protected
       _Position :TSingle3D;
     public
       constructor Create( const Position_:TSingle3D ); overload;
       constructor Create( const Position_:TSingle3D; const Parent_:TTreeNode ); overload;
       ///// プロパティ
       property Position :TSingle3D read _Position write _Position;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTetraCell

     TTetraCell = class( TCell )
     private
     protected
       _Poin :array[ 0..3 ] of TTetraPoin;
       _Cell :array[ 0..3 ] of TTetraCell;
       _Vert :Byte;
       _Bond :Byte;
       ///// アクセス
       function GetPoin( const I_:Byte ) :TTetraPoin;
       procedure SetPoin( const I_:Byte; const Poin_:TTetraPoin );
       function GetCell( const I_:Byte ) :TTetraCell;
       procedure SetCell( const I_:Byte; const Cell_:TTetraCell );
       function GetVert( const I_:Byte ) :Byte;
       procedure SetVert( const I_:Byte; const Vert_:Byte );
       function GetBond( const I_:Byte ) :Byte;
       procedure SetBond( const I_:Byte; const Bond_:Byte );
       function GetVolum2 :Single;
       function GetVolume :Single;
       function GetCircumCenter :TSingle3D;
       function GetCircumSpher2 :TSingleSpher2;
       function GetCircumSphere :TSingleSphere;
       function GetVoroVec( const I_:Byte ) :TSingle3D;
       function GetJoin( const K_,I_:Byte ) :Byte;
       function GetOpen :Shortint;
     public
       ///// プロパティ
       property Poin[ const I_:Byte ]    :TTetraPoin    read GetPoin         write SetPoin;
       property Cell[ const I_:Byte ]    :TTetraCell    read GetCell         write SetCell;
       property Vert[ const I_:Byte ]    :Byte          read GetVert         write SetVert;
       property Bond[ const I_:Byte ]    :Byte          read GetBond         write SetBond;
       property Volum2                   :Single        read GetVolum2                    ;
       property Volume                   :Single        read GetVolume                    ;
       property CircumCenter             :TSingle3D     read GetCircumCenter              ;
       property CircumSpher2             :TSingleSpher2 read GetCircumSpher2              ;
       property CircumSphere             :TSingleSphere read GetCircumSphere              ;
       property VoroVec[ const I_:Byte ] :TSingle3D     read GetVoroVec                   ;
       property Join[ const K_,I_:Byte ] :Byte          read GetJoin                      ;
       property Open                     :Shortint      read GetOpen                      ;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTetraModel

     TTetraModel = class( TModel )
     private
     protected
       _Poins :TFold;
       _Cells :TFold;
       ///// アクセス
       function Get_Poins( const I_:Integer ) :TTetraPoin; virtual;
       function GetPoinsN :Integer; virtual;
       function Get_Cells( const I_:Integer ) :TTetraCell; virtual;
       function GetCellsN :Integer; virtual;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property Poins[ const I_:Integer ] :TTetraPoin read Get_Poins;
       property PoinsN                    :Integer    read GetPoinsN;
       property Cells[ const I_:Integer ] :TTetraCell read Get_Cells;
       property CellsN                    :Integer    read GetCellsN;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTetraModel<_TPoin_,_TCell_>

     TTetraModel<_TPoin_:TTetraPoin;_TCell_:TTetraCell> = class( TTetraModel )
     private
     protected
       ///// アクセス
       function Get_Poins( const I_:Integer ) :TTetraPoin; override;
       function Get_Cells( const I_:Integer ) :TTetraCell; override;
       function GetPoins( const I_:Integer ) :_TPoin_; virtual;
       function GetCells( const I_:Integer ) :_TCell_; virtual;
     public
       ///// プロパティ
       property Poins[ const I_:Integer ] :_TPoin_ read GetPoins;
       property Cells[ const I_:Integer ] :_TCell_ read GetCells;
     end;

const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

      _VertTable :array[ 0..3 ] of TByteArray4 = ( ( _:( 0, 1, 2, 3 ) ),
                                                   ( _:( 1, 0, 3, 2 ) ),
                                                   ( _:( 2, 3, 0, 1 ) ),
                                                   ( _:( 3, 2, 1, 0 ) ) );

      _BondTable :array[ 1..3 ] of TByteArray4 = ( ( _:( 0, 1, 3, 2 ) ),
                                                   ( _:( 0, 3, 2, 1 ) ),
                                                   ( _:( 0, 2, 1, 3 ) ) );

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTetraPoin

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TTetraPoin.Create( const Position_:TSingle3D );
begin
     inherited Create;

     _Position := Position_;
end;

constructor TTetraPoin.Create( const Position_:TSingle3D; const Parent_:TTreeNode );
begin
     inherited Create( Parent_ );

     _Position := Position_;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTetraCell

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TTetraCell.GetPoin( const I_:Byte ) :TTetraPoin;
begin
     Result := _Poin[ I_ ];
end;

procedure TTetraCell.SetPoin( const I_:Byte; const Poin_:TTetraPoin );
begin
     _Poin[ I_ ] := Poin_;
end;

function TTetraCell.GetCell( const I_:Byte ) :TTetraCell;
begin
     Result := _Cell[ I_ ];
end;

procedure TTetraCell.SetCell( const I_:Byte; const Cell_:TTetraCell );
begin
     _Cell[ I_ ] := Cell_;
end;

function TTetraCell.GetVert( const I_:Byte ) :Byte;
begin
     Result := _Vert shr I_ shr I_ and 3;
end;

procedure TTetraCell.SetVert( const I_:Byte; const Vert_:Byte );
begin
     _Vert := not ( 3 shl I_ shl I_ ) and _Vert or ( Vert_ shl I_ shl I_ );
end;

function TTetraCell.GetBond( const I_:Byte ) :Byte;
begin
     Result := _Bond shr I_ shr I_ and 3;
end;

procedure TTetraCell.SetBond( const I_:Byte; const Bond_:Byte );
begin
     _Bond := not ( 3 shl I_ shl I_ ) and _Bond or ( Bond_ shl I_ shl I_ );
end;

////////////////////////////////////////////////////////////////////////////////

function TTetraCell.GetVolum2 :Single;
begin
     Result := HeronVolum2( _Poin[ 0 ].Position,
                            _Poin[ 1 ].Position,
                            _Poin[ 2 ].Position,
                            _Poin[ 3 ].Position );
end;

function TTetraCell.GetVolume :Single;
begin
     Result := Roo2( GetVolum2 );
end;

////////////////////////////////////////////////////////////////////////////////

function TTetraCell.GetCircumCenter :TSingle3D;
begin
     Result := LUX.Geometry.D3.CircumCenter( _Poin[ 0 ].Position,
                                             _Poin[ 1 ].Position,
                                             _Poin[ 2 ].Position,
                                             _Poin[ 3 ].Position );
end;

function TTetraCell.GetCircumSpher2 :TSingleSpher2;
begin
     Result := TSingleSpher2.Create( _Poin[ 0 ].Position,
                                     _Poin[ 1 ].Position,
                                     _Poin[ 2 ].Position,
                                     _Poin[ 3 ].Position );
end;

function TTetraCell.GetCircumSphere :TSingleSphere;
begin
     Result := GetCircumSpher2;
end;

function TTetraCell.GetVoroVec( const I_:Byte ) :TSingle3D;
begin
     with _VertTable[ I_ ] do
     begin
          Result := TriNormal( _Poin[ _[ 1 ] ].Position,
                               _Poin[ _[ 2 ] ].Position,
                               _Poin[ _[ 3 ] ].Position );
     end;
end;

function TTetraCell.GetJoin( const K_,I_:Byte ) :Byte;
begin
     Result := _VertTable[ Vert[ K_ ] ]._[ _BondTable[ Bond[ K_ ] ]._[ I_ ] ];
end;

function TTetraCell.GetOpen :Shortint;
begin
     for Result := 0 to 3 do
     begin
          if not Assigned( _Poin[ Result ] ) then Exit;
     end;

     Result := -1;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTetraModel

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

function TTetraModel.Get_Poins( const I_:Integer ) :TTetraPoin;
begin
     Result := TTetraPoin( _Poins[ I_ ] );
end;

function TTetraModel.GetPoinsN :Integer;
begin
     Result := _Poins.ChildrenN;
end;

function TTetraModel.Get_Cells( const I_:Integer ) :TTetraCell;
begin
     Result := TTetraCell( _Cells[ I_ ] );
end;

function TTetraModel.GetCellsN :Integer;
begin
     Result := _Cells.ChildrenN;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TTetraModel.Create;
begin
     inherited;

     _Poins := TFold.Create;
     _Cells := TFold.Create;
end;

destructor TTetraModel.Destroy;
begin
     _Cells.Free;
     _Poins.Free;

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTetraModel<_TPoin_,_TCell_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

function TTetraModel<_TPoin_,_TCell_>.Get_Poins( const I_:Integer ) :TTetraPoin;
begin
     Result := GetPoins( I_ );
end;

function TTetraModel<_TPoin_,_TCell_>.Get_Cells( const I_:Integer ) :TTetraCell;
begin
     Result := GetCells( I_ );
end;

function TTetraModel<_TPoin_,_TCell_>.GetPoins( const I_:Integer ) :_TPoin_;
begin
     Result := _TPoin_( _Poins[ I_ ] );
end;

function TTetraModel<_TPoin_,_TCell_>.GetCells( const I_:Integer ) :_TCell_;
begin
     Result := _TCell_( _Cells[ I_ ] );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
