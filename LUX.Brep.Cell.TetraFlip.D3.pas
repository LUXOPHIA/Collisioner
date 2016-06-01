unit LUX.Brep.Cell.TetraFlip.D3;

interface //#################################################################### ■

uses LUX, LUX.D3, LUX.Geometry.D3, LUX.Graph, LUX.Graph.Tree, LUX.Brep, LUX.Brep.Cell.TetraFlip;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     TTetraPoin3D = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTetraPoin3D

     TTetraPoin3D = class( TTetraPoin<TSingle3D> )
     private
     protected
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTetraCell3D<_TPoin_,_TCell_>

     TTetraCell3D<_TPoin_:TTetraPoin3D;_TCell_:class> = class( TTetraCell<_TPoin_,_TCell_> )
     private
     protected
       ///// アクセス
       function GetVolum2 :Single;
       function GetVolume :Single;
       function GetBarycenter :TSingle3D;
       function GetInnerCenter :TSingle3D;
       function GetInnerRadius :Single;
       function GetInnerSphere :TSingleSphere;
       function GetCircumCenter :TSingle3D;
       function GetCircumSpher2 :TSingleSpher2;
       function GetCircumSphere :TSingleSphere;
       function GetFaceArea( const I_:Byte ) :Single;
       function GetFaceNorm( const I_:Byte ) :TSingle3D;
       function GetVoroEdge( const I_:Byte ) :TSingle3D;
     public
       ///// プロパティ
       property Volum2                    :Single        read GetVolum2      ;
       property Volume                    :Single        read GetVolume      ;
       property Barycenter                :TSingle3D     read GetBarycenter  ;
       property InnerCenter               :TSingle3D     read GetInnerCenter ;
       property InnerRadius               :Single        read GetInnerRadius ;
       property InnerSphere               :TSingleSphere read GetInnerSphere ;
       property CircumCenter              :TSingle3D     read GetCircumCenter;
       property CircumSpher2              :TSingleSpher2 read GetCircumSpher2;
       property CircumSphere              :TSingleSphere read GetCircumSphere;
       property FaceArea[ const I_:Byte ] :Single        read GetFaceArea    ;
       property FaceNorm[ const I_:Byte ] :TSingle3D     read GetFaceNorm    ;
       property VoroEdge[ const I_:Byte ] :TSingle3D     read GetVoroEdge    ;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTetraCell3D

     TTetraCell3D = class( TTetraCell3D<TTetraPoin3D,TTetraCell3D> )
     private
     protected
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTetraModel3D<_TPoin_,_TCell_>

     TTetraModel3D<_TPoin_:class;_TCell_:class> = class( TTetraModel<_TPoin_,_TCell_> )
     private
     protected
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTetraModel3D

     TTetraModel3D = class( TTetraModel3D<TTetraPoin3D,TTetraCell3D> )
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

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTetraPoin3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTetraCell3D<_TPoin_,_TCell_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TTetraCell3D<_TPoin_,_TCell_>.GetVolum2 :Single;
begin
     Result := HeronVolum2( TTetraPoin3D( _Poin[ 0 ] ).Pos,                     {ToDo: 本来キャスト不要}
                            TTetraPoin3D( _Poin[ 1 ] ).Pos,
                            TTetraPoin3D( _Poin[ 2 ] ).Pos,
                            TTetraPoin3D( _Poin[ 3 ] ).Pos );
end;

function TTetraCell3D<_TPoin_,_TCell_>.GetVolume :Single;
begin
     Result := Roo2( GetVolum2 );
end;

//------------------------------------------------------------------------------

function TTetraCell3D<_TPoin_,_TCell_>.GetBarycenter :TSingle3D;
begin
     Result := LUX.Geometry.D3.Barycenter( TTetraPoin3D( _Poin[ 0 ] ).Pos,      {ToDo: 本来キャスト不要}
                                           TTetraPoin3D( _Poin[ 1 ] ).Pos,
                                           TTetraPoin3D( _Poin[ 2 ] ).Pos,
                                           TTetraPoin3D( _Poin[ 3 ] ).Pos );
end;

//------------------------------------------------------------------------------

function TTetraCell3D<_TPoin_,_TCell_>.GetInnerCenter :TSingle3D;
begin
     Result := LUX.Geometry.D3.InnerCenter( TTetraPoin3D( _Poin[ 0 ] ).Pos,     {ToDo: 本来キャスト不要}
                                            TTetraPoin3D( _Poin[ 1 ] ).Pos,
                                            TTetraPoin3D( _Poin[ 2 ] ).Pos,
                                            TTetraPoin3D( _Poin[ 3 ] ).Pos );
end;

function TTetraCell3D<_TPoin_,_TCell_>.GetInnerRadius :Single;
begin
     Result := LUX.Geometry.D3.InnerRadius( TTetraPoin3D( _Poin[ 0 ] ).Pos,     {ToDo: 本来キャスト不要}
                                            TTetraPoin3D( _Poin[ 1 ] ).Pos,
                                            TTetraPoin3D( _Poin[ 2 ] ).Pos,
                                            TTetraPoin3D( _Poin[ 3 ] ).Pos );
end;

function TTetraCell3D<_TPoin_,_TCell_>.GetInnerSphere :TSingleSphere;
begin
     Result := TSingleSphere.Inner( TTetraPoin3D( _Poin[ 0 ] ).Pos,             {ToDo: 本来キャスト不要}
                                    TTetraPoin3D( _Poin[ 1 ] ).Pos,
                                    TTetraPoin3D( _Poin[ 2 ] ).Pos,
                                    TTetraPoin3D( _Poin[ 3 ] ).Pos );
end;

//------------------------------------------------------------------------------

function TTetraCell3D<_TPoin_,_TCell_>.GetCircumCenter :TSingle3D;
begin
     Result := LUX.Geometry.D3.CircumCenter( TTetraPoin3D( _Poin[ 0 ] ).Pos,    {ToDo: 本来キャスト不要}
                                             TTetraPoin3D( _Poin[ 1 ] ).Pos,
                                             TTetraPoin3D( _Poin[ 2 ] ).Pos,
                                             TTetraPoin3D( _Poin[ 3 ] ).Pos );
end;

function TTetraCell3D<_TPoin_,_TCell_>.GetCircumSpher2 :TSingleSpher2;
begin
     Result := TSingleSpher2.Create( TTetraPoin3D( _Poin[ 0 ] ).Pos,            {ToDo: 本来キャスト不要}
                                     TTetraPoin3D( _Poin[ 1 ] ).Pos,
                                     TTetraPoin3D( _Poin[ 2 ] ).Pos,
                                     TTetraPoin3D( _Poin[ 3 ] ).Pos );
end;

function TTetraCell3D<_TPoin_,_TCell_>.GetCircumSphere :TSingleSphere;
begin
     Result := TSingleSphere.Create( TTetraPoin3D( _Poin[ 0 ] ).Pos,            {ToDo: 本来キャスト不要}
                                     TTetraPoin3D( _Poin[ 1 ] ).Pos,
                                     TTetraPoin3D( _Poin[ 2 ] ).Pos,
                                     TTetraPoin3D( _Poin[ 3 ] ).Pos );
end;

//------------------------------------------------------------------------------

function TTetraCell3D<_TPoin_,_TCell_>.GetFaceArea( const I_:Byte ) :Single;
begin
     with _VertTable[ I_ ] do
     begin
          Result := HeronArea( TTetraPoin3D( _Poin[ _[ 1 ] ] ).Pos,             {ToDo: 本来キャスト不要}
                               TTetraPoin3D( _Poin[ _[ 2 ] ] ).Pos,
                               TTetraPoin3D( _Poin[ _[ 3 ] ] ).Pos );
     end;
end;

//------------------------------------------------------------------------------

function TTetraCell3D<_TPoin_,_TCell_>.GetFaceNorm( const I_:Byte ) :TSingle3D;
begin
     with _VertTable[ I_ ] do
     begin
          Result := TriNormal( TTetraPoin3D( _Poin[ _[ 1 ] ] ).Pos,             {ToDo: 本来キャスト不要}
                               TTetraPoin3D( _Poin[ _[ 2 ] ] ).Pos,
                               TTetraPoin3D( _Poin[ _[ 3 ] ] ).Pos );
     end;
end;

function TTetraCell3D<_TPoin_,_TCell_>.GetVoroEdge( const I_:Byte ) :TSingle3D;
var
   C :TTetraCell3D;
begin
     C := TTetraCell3D( Cell[ I_ ] );

     if Assigned( C ) and ( C.Open = -1 ) then Result := CircumCenter.VectorTo( C.CircumCenter )
                                          else Result := FaceNorm[ I_ ];
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTetraCell3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTetraModel3D<_TPoin_,_TCell_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTetraModel3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
