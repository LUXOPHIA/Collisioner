unit LUX.Brep.Face.TriFlip.D2;

interface //#################################################################### Бб

uses LUX, LUX.D2, LUX.Geometry.D2, LUX.Brep.Face.TriFlip;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$БyМ^Бz

     TTriPoin2D      = class;

     TTriFace2D      = class;
     TTriFaceModel2D = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$БyГМГRБ[ГhБz

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$БyГNГЙГXБz

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTriPoin2D

     TTriPoin2D = class( TTriPoin<TSingle2D> )
     private
     protected
       _Tex :TSingle2D;
     public
       ///// ГvГНГpГeГB
       property Tex :TSingle2D read _Tex write _Tex;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTriFace2D

     TTriFace2D = class( TTriFace<TSingle2D> )
     private
     protected
       ///// ГAГNГZГX
       function GetEdge( const I_:Byte ) :TSingle2D;
       function GetCircumCircle :TSingleCircle;
     public
       ///// ГvГНГpГeГB
       property Edge[ const I_:Byte ] :TSingle2D     read GetEdge        ;
       property CircumCircle          :TSingleCircle read GetCircumCircle;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTriFaceModel2D

     TTriFaceModel2D = class( TTriFaceModel<TSingle2D> )
     private
     protected
     public
       ///// ГБГ\ГbГh
       procedure JoinEdges;
       procedure LoadFromFile( const FileName_:String );
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$БyТшРФБz

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$БyХ╧РФБz

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$БyГЛБ[Г`ГУБz

implementation //############################################################### Бб

uses System.Classes, System.SysUtils, System.RegularExpressions;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$БyГМГRБ[ГhБz

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$БyГNГЙГXБz

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTriPoin2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTriFace2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// ГAГNГZГX

function TTriFace2D.GetEdge( const I_:Byte ) :TSingle2D;
begin
     Result := Poin[ _Inc_[ I_ ] ].Pos.VectorTo( Poin[ _Dec_[ I_ ] ].Pos );
end;

function TTriFace2D.GetCircumCircle :TSingleCircle;
begin
     Result := TSingleCircle.Create( Poin[ 1 ].Pos, Poin[ 2 ].Pos, Poin[ 3 ].Pos );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTriFaceModel2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// ГБГ\ГbГh

procedure TTriFaceModel2D.JoinEdges;
var
   I :Integer;
begin
     with PoinModel do
     begin
          for I := 0 to ChildsN-1 do Childs[ I ].JoinEdge;
     end
end;

procedure TTriFaceModel2D.LoadFromFile( const FileName_:String );
var
   Ts :TArray<TSingle2D>;
//ееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееее
     function GetVec( const G_:TGroupCollection ) :TSingle2D;
     begin
          with Result do
          begin
               X := G_.Item[ 1 ].Value.ToSingle;
               Y := G_.Item[ 2 ].Value.ToSingle;
          end;
     end;
     //еееееееееееееееееееееееееееееееееееееееееееееееееееееееее
     function GetPoin( const M_:TMatch ) :TTriPoin2D;
     var
        N :Integer;
     begin
          if M_.Success and TryStrToInt( M_.Groups[ 1 ].Value, N ) then
          begin
               Result := TTriPoin2D( PoinModel.Childs[ N-1 ] );

               if TryStrToInt( M_.Groups[ 2 ].Value, N ) then Result._Tex := Ts[ N-1 ];
          end
          else Result := nil;
     end;
     //еееееееееееееееееееееееееееееееееееееееееееееееееееееееее
     procedure AddFace( const P1_,P2_,P3_:TTriPoin2D );
     begin
          with TTriFace2D( TTriFace2D.Create( Self ) ) do
          begin
               Poin[ 1 ] := P1_;
               Poin[ 2 ] := P2_;
               Poin[ 3 ] := P3_;
          end;
     end;
//ееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееее
var
   RV, RT, RF, RI :TRegEx;
   S :String;
   Ms :TMatchCollection;
   P1, P2, P3 :TTriPoin2D;
   I :Integer;
begin
     PoinModel.DeleteChilds;
     DeleteChilds;

     RV := TRegEx.Create(  'v[ \t]+([^ \t]+)[ \t]+([^ \t]+)[ \t]+([^ \t\n]+)' );
     RT := TRegEx.Create( 'vt[ \t]+([^ \t]+)[ \t]+([^ \t]+)[ \t]+([^ \t\n]+)' );

     Ts := [];
     with TStreamReader.Create( FileName_, TEncoding.Default ) do
     begin
          while not EndOfStream do
          begin
               S := ReadLine;

               with RV.Match( S ) do
               begin
                    if Success then TTriPoin2D( TTriPoin2D.Create( PoinModel ) ).Pos := GetVec( Groups );
               end;

               with RT.Match( S ) do
               begin
                    if Success then Ts := Ts + [ GetVec( Groups ) ];
               end;
          end;

          Free;
     end;

     RF := TRegEx.Create( 'f( [^\n]+)' );
     RI := TRegEx.Create( '[ \t]+(\d+)/?(\d*)/?(\d*)' );

     with TStreamReader.Create( FileName_, TEncoding.Default ) do
     begin
          while not EndOfStream do
          begin
               with RF.Match( ReadLine ) do
               begin
                    if Success then
                    begin
                         Ms := RI.Matches( Groups[ 1 ].Value );

                         P1 := GetPoin( Ms[ 0 ] );
                         P2 := GetPoin( Ms[ 1 ] );
                         P3 := GetPoin( Ms[ 2 ] );

                         AddFace( P1, P2, P3 );

                         for I := 3 to Ms.Count-1 do
                         begin
                              P2 := P3;  P3 := GetPoin( Ms[ I ] );

                              AddFace( P1, P2, P3 );
                         end;
                    end;
               end;
          end;

          Free;
     end;

     JoinEdges;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$БyГЛБ[Г`ГУБz

//############################################################################## Ба

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ ПЙК·Й╗

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ Н┼ПIЙ╗

end. //######################################################################### Бб

