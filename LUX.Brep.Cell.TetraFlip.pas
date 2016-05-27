unit LUX.Brep.Cell.TetraFlip;

interface //#################################################################### ■

uses LUX, LUX.Graph, LUX.Graph.Tree, LUX.Brep, LUX.Brep.Poin;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     TTetraPoin<_TPos_>                      = class;
     TTetraCell<_TPoin_:class;_TCell_:class> = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TByteArray4

     TByteArray4 = record
       _ :array[ 0..3 ] of Byte;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTetraLink<_TPos_>

     TTetraLink<_TPoin_:class;_TCell_:class> = record
       o :TTetraCell<_TPoin_,_TCell_>;
       i :Byte;
       n :Byte;
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTetraPoin<_TPos_>

     TTetraPoin<_TPos_> = class( TPoin<_TPos_> )
     private
     protected
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTetraCell<_TPoin_,_TCell_>

     TTetraCell<_TPoin_:class;_TCell_:class> = class( TTreeNode<_TCell_> )
     private
     protected
       _Poin :array[ 0..3 ] of _TPoin_;
       _Cell :array[ 0..3 ] of _TCell_;
       _Vert :Byte;
       _Bond :Byte;
       ///// アクセス
       function GetPoin( const I_:Byte ) :_TPoin_;
       procedure SetPoin( const I_:Byte; const Poin_:_TPoin_ );
       function GetCell( const I_:Byte ) :_TCell_;
       procedure SetCell( const I_:Byte; const Cell_:_TCell_ );
       function GetVert( const I_:Byte ) :Byte;
       procedure SetVert( const I_:Byte; const Vert_:Byte );
       function GetBond( const I_:Byte ) :Byte;
       procedure SetBond( const I_:Byte; const Bond_:Byte );
       function GetJoin( const K_,I_:Byte ) :Byte;
       function GetOpen :Shortint;
     public
       ///// プロパティ
       property Poin[ const I_:Byte ]    :_TPoin_  read GetPoin write SetPoin;
       property Cell[ const I_:Byte ]    :_TCell_  read GetCell write SetCell;
       property Vert[ const I_:Byte ]    :Byte     read GetVert write SetVert;
       property Bond[ const I_:Byte ]    :Byte     read GetBond write SetBond;
       property Join[ const K_,I_:Byte ] :Byte     read GetJoin              ;
       property Open                     :Shortint read GetOpen              ;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTetraModel<_TPoin_,_TCell_>

     TTetraModel<_TPoin_:class;_TCell_:class> = class( TTreeNode<_TCell_> )
     private
     protected
       _PoinModel :TPoinModel<_TPoin_>;
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       property PoinModel :TPoinModel<_TPoin_>          read   _PoinModel;
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

uses System.SysUtils;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTetraPoin<_TPos_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTetraCell<_TPos_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TTetraCell<_TPoin_,_TCell_>.GetPoin( const I_:Byte ) :_TPoin_;
begin
     Result := _Poin[ I_ ];
end;

procedure TTetraCell<_TPoin_,_TCell_>.SetPoin( const I_:Byte; const Poin_:_TPoin_ );
begin
     _Poin[ I_ ] := Poin_;
end;

function TTetraCell<_TPoin_,_TCell_>.GetCell( const I_:Byte ) :_TCell_;
begin
     Result := _Cell[ I_ ];
end;

procedure TTetraCell<_TPoin_,_TCell_>.SetCell( const I_:Byte; const Cell_:_TCell_ );
begin
     _Cell[ I_ ] := Cell_;
end;

function TTetraCell<_TPoin_,_TCell_>.GetVert( const I_:Byte ) :Byte;
begin
     Result := _Vert shr I_ shr I_ and 3;
end;

procedure TTetraCell<_TPoin_,_TCell_>.SetVert( const I_:Byte; const Vert_:Byte );
begin
     _Vert := not ( 3 shl I_ shl I_ ) and _Vert or ( Vert_ shl I_ shl I_ );
end;

function TTetraCell<_TPoin_,_TCell_>.GetBond( const I_:Byte ) :Byte;
begin
     Result := _Bond shr I_ shr I_ and 3;
end;

procedure TTetraCell<_TPoin_,_TCell_>.SetBond( const I_:Byte; const Bond_:Byte );
begin
     _Bond := not ( 3 shl I_ shl I_ ) and _Bond or ( Bond_ shl I_ shl I_ );
end;

function TTetraCell<_TPoin_,_TCell_>.GetJoin( const K_,I_:Byte ) :Byte;
begin
     Result := _VertTable[ Vert[ K_ ] ]._[ _BondTable[ Bond[ K_ ] ]._[ I_ ] ];
end;

function TTetraCell<_TPoin_,_TCell_>.GetOpen :Shortint;
begin
     for Result := 0 to 3 do
     begin
          if not Assigned( _Poin[ Result ] ) then Exit;
     end;

     Result := -1;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTetraModel<_TPos_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TTetraModel<_TPoin_,_TCell_>.Create;
begin
     inherited;

     _PoinModel := TPoinModel<_TPoin_>.Create;
end;

destructor TTetraModel<_TPoin_,_TCell_>.Destroy;
begin
     _PoinModel.Free;

     inherited;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
