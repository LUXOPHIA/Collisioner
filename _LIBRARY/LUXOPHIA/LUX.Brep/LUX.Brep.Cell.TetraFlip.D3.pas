unit LUX.Brep.Cell.TetraFlip.D3;

interface //#################################################################### ■

uses LUX, LUX.D3, LUX.Geometry.D3, LUX.Graph, LUX.Graph.Tree, LUX.Brep, LUX.Brep.Cell.TetraFlip;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     TTetraPoin3D  = class;
     TTetraCell3D  = class;
     TTetraModel3D = class;

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
       ///// アクセス
       function Get_Self :TTetraModel3D; inline;
     protected
       ///// プロパティ
       property _Self :TTetraModel3D read Get_Self;
     public
       procedure LoadFromFile( const FileName_:String );
       procedure SaveToFile( const FileName_:String );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTetraModel3D

     TTetraModel3D = class( TTetraModel3D<TTetraPoin3D,TTetraCell3D> )
     private
     protected
     public
       procedure LoadFromFile( const FileName_:String );
       procedure SaveToFile( const FileName_:String );
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.Classes, System.SysUtils, System.RegularExpressions;

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

function TTetraModel3D<_TPoin_,_TCell_>.Get_Self :TTetraModel3D;
begin
     Result := TTetraModel3D( Self );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TTetraModel3D<_TPoin_,_TCell_>.LoadFromFile( const FileName_:String );
begin
     _Self.LoadFromFile( FileName_ );
end;

procedure TTetraModel3D<_TPoin_,_TCell_>.SaveToFile( const FileName_:String );
begin
     _Self.SaveToFile( FileName_ );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTetraModel3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TTetraModel3D.LoadFromFile( const FileName_:String );
var
   RP, RC :TRegEx;
   L :String;
   PoinN, CellN,
   I, J,
   PoinI, CellI, VertI, BondI :Integer;
begin
     RP := TRegEx.Create( 'PoinsN\s*=\s*(\d+)', [ roCompiled ] );
     RC := TRegEx.Create( 'CellsN\s*=\s*(\d+)', [ roCompiled ] );

     with TFileReader.Create( FileName_, TEncoding.UTF8 ) do
     begin
          L := ReadLine;

          Assert( L = '#TetraFlip', L );

          //////////

          PoinN := -1;
          CellN := -1;

          while not EndOfStream do
          begin
               L := ReadLine;

               if L = '' then Break;

               with RP.Match( L ) do
               begin
                    if Success then PoinN := Groups[ 1 ].Value.ToInteger;
               end;

               with RC.Match( L ) do
               begin
                    if Success then CellN := Groups[ 1 ].Value.ToInteger;
               end;
          end;

          Assert( not EndOfStream );

          Assert( PoinN >= 0, PoinN.ToString );
          Assert( CellN >= 0, CellN.ToString );

          //////////

          DeleteChilds;

          with _PoinModel do
          begin
               for I := 0 to PoinN-1 do
               begin
                    with TTetraPoin3D.Create( _PoinModel ) do
                    begin
                         Pos := TSingle3D.Create( ReadSingle,
                                                  ReadSingle,
                                                  ReadSingle );
                    end;
               end;
          end;

          for I := 0 to CellN-1 do
          begin
               with TTetraCell3D.Create( Self ) do
               begin
                    for J := 0 to 3 do
                    begin
                         PoinI := ReadInteger;

                         if PoinI >= 0 then
                         begin
                              Poin[ J ] := _PoinModel.Childs[ PoinI ];
                         end
                         else
                         begin
                              Poin[ J ] := nil;
                         end;
                    end;
               end;
          end;

          for I := 0 to CellN-1 do
          begin
               with Childs[ I ] do
               begin
                    for J := 0 to 3 do
                    begin
                         CellI := ReadInteger;
                         VertI := ReadByte;
                         BondI := ReadByte;

                         if CellI >= 0 then
                         begin
                              Cell[ J ] := Self.Childs[ CellI ];
                              Vert[ J ] := VertI               ;
                              Bond[ J ] := BondI               ;
                         end
                         else
                         begin
                              Cell[ J ] := nil;
                              Vert[ J ] := 0  ;
                              Bond[ J ] := 0  ;
                         end;
                    end;
               end;
          end;

          Free;
     end;
end;

procedure TTetraModel3D.SaveToFile( const FileName_:String );
var
   F :TFileStream;
   I, J :Integer;
begin
     F := TFileStream.Create( FileName_, fmCreate );

     with TStreamWriter.Create( F, TEncoding.UTF8 ) do
     begin
          WriteLine( '#TetraFlip' );

          WriteLine( 'PoinsN=' + _PoinModel.ChildsN.ToString );
          WriteLine( 'CellsN=' +            ChildsN.ToString );

          WriteLine( '' );

          Free;
     end;

     with TBinaryWriter.Create( F ) do
     begin
          with _PoinModel do
          begin
               for I := 0 to ChildsN-1 do
               begin
                    with Childs[ I ] do
                    begin
                         with Pos do
                         begin
                              Write( X );
                              Write( Y );
                              Write( Z );
                         end;
                    end;
               end;
          end;

          for I := 0 to ChildsN-1 do
          begin
               with Childs[ I ] do
               begin
                    for J := 0 to 3 do
                    begin
                         if Assigned( Poin[ J ] )
                         then Write( Poin[ J ].Order )
                         else Write( Integer( -1 )   );
                    end;
               end;
          end;

          for I := 0 to ChildsN-1 do
          begin
               with Childs[ I ] do
               begin
                    for J := 0 to 3 do
                    begin
                         if Assigned( Cell[ J ] ) then
                         begin
                              Write( Cell[ J ].Order );
                              Write( Vert[ J ]       );
                              Write( Bond[ J ]       );
                         end
                         else
                         begin
                              Write( Integer( -1 ) );
                              Write( Byte   (  0 ) );
                              Write( Byte   (  0 ) );
                         end;
                    end;
               end;
          end;

          Free;
     end;

     F.Free;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
