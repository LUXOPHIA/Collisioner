unit LUX.Brep.Face.TriFlip.D3;

interface //#################################################################### Бб

uses LUX, LUX.D3, LUX.Brep.Face.TriFlip;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$БyМ^Бz

     TTriPoin3D      = class;

     TTriFace3D      = class;
     TTriFaceModel3D = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$БyГМГRБ[ГhБz

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$БyГNГЙГXБz

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTriPoin3D

     TTriPoin3D = class( TTriPoin<TSingle3D> )
     private
     protected
       _Nor :TSingle3D;
       _Tex :TSingle3D;
     public
       ///// ГvГНГpГeГB
       property Nor :TSingle3D read _Nor write _Nor;
       property Tex :TSingle3D read _Tex write _Tex;
       ///// ГБГ\ГbГh
       procedure MakeNormal;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTriFace3D

     TTriFace3D = class( TTriFace<TSingle3D> )
     private
     protected
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTriFaceModel3D

     TTriFaceModel3D = class( TTriFaceModel<TSingle3D> )
     private
     protected
     public
       ///// ГБГ\ГbГh
       procedure JoinEdges;
       procedure MakeNormals;
       procedure LoadFromFile( const FileName_:String );
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$БyТшРФБz

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$БyХ╧РФБz

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$БyГЛБ[Г`ГУБz

implementation //############################################################### Бб

uses System.Classes, System.SysUtils, System.RegularExpressions;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$БyГМГRБ[ГhБz

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$БyГNГЙГXБz

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTriPoin3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// ГБГ\ГbГh

procedure TTriPoin3D.MakeNormal;
var
   N, K, X1, X2, X3, Y1, Y2, Y3 :Integer;
   XF, YF :TTriFace3D;
   V, P1, P2, P3 :TSingle3D;
   L2 :Single;
begin
     N := FaceN;

     V := TSingle3D.Create( 0, 0, 0 );

     XF := TTriFace3D( Face );
     X1 := Corn;
     X2 := _Inc_[ X1 ];
     X3 := _Inc_[ X2 ];
     for K := 1 to N do
     begin
          P1 := XF.Poin[ X1 ].Pos;
          P2 := XF.Poin[ X2 ].Pos;
          P3 := XF.Poin[ X3 ].Pos;

          V := V + CrossProduct( P2 - P1, P3 - P2 );

          YF := TTriFace3D( XF.Face[ X2 ] );
          Y3 := XF.Corn[ X2 ];
          Y2 := _Dec_[ Y3 ];
          Y1 := _Dec_[ Y2 ];

          XF := YF;  X1 := Y1;  X2 := Y2;  X3 := Y3;
     end;

     L2 := V.Siz2;

     if L2 < 0.000001 then _Nor := TSingle3D.Create( 0, 0, 0 )
                      else _Nor := V / Roo2( L2 );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTriFace3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTriFaceModel3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// ГБГ\ГbГh

procedure TTriFaceModel3D.JoinEdges;
var
   I :Integer;
begin
     with PoinModel do
     begin
          for I := 0 to ChildsN-1 do Childs[ I ].JoinEdge;
     end
end;

procedure TTriFaceModel3D.MakeNormals;
var
   I :Integer;
begin
     with PoinModel do
     begin
          for I := 0 to ChildsN-1 do TTriPoin3D( Childs[ I ] ).MakeNormal;
     end
end;

procedure TTriFaceModel3D.LoadFromFile( const FileName_:String );
var
   Ns, Ts :TArray<TSingle3D>;
//ееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееее
     function GetVec( const G_:TGroupCollection ) :TSingle3D;
     begin
          with Result do
          begin
               X := G_.Item[ 1 ].Value.ToSingle;
               Y := G_.Item[ 2 ].Value.ToSingle;
               Z := G_.Item[ 3 ].Value.ToSingle;
          end;
     end;
     //еееееееееееееееееееееееееееееееееееееееееееееееееееееееее
     function GetPoin( const M_:TMatch ) :TTriPoin3D;
     var
        N :Integer;
     begin
          if M_.Success and TryStrToInt( M_.Groups[ 1 ].Value, N ) then
          begin
               Result := TTriPoin3D( PoinModel.Childs[ N-1 ] );

               if TryStrToInt( M_.Groups[ 2 ].Value, N ) then Result._Tex := Ts[ N-1 ];
               if TryStrToInt( M_.Groups[ 3 ].Value, N ) then Result._Nor := Ns[ N-1 ];
          end
          else Result := nil;
     end;
     //еееееееееееееееееееееееееееееееееееееееееееееееееееееееее
     procedure AddFace( const P1_,P2_,P3_:TTriPoin3D );
     begin
          with TTriFace3D( TTriFace3D.Create( Self ) ) do
          begin
               Poin[ 1 ] := P1_;
               Poin[ 2 ] := P2_;
               Poin[ 3 ] := P3_;
          end;
     end;
//ееееееееееееееееееееееееееееееееееееееееееееееееееееееееееееее
var
   RV, RT, RN, RF, RI :TRegEx;
   S :String;
   Ms :TMatchCollection;
   P1, P2, P3 :TTriPoin3D;
   I :Integer;
begin
     PoinModel.DeleteChilds;
     DeleteChilds;

     RV := TRegEx.Create(  'v[ \t]+([^ \t]+)[ \t]+([^ \t]+)[ \t]+([^ \t\n]+)' );
     RT := TRegEx.Create( 'vt[ \t]+([^ \t]+)[ \t]+([^ \t]+)[ \t]+([^ \t\n]+)' );
     RN := TRegEx.Create( 'vn[ \t]+([^ \t]+)[ \t]+([^ \t]+)[ \t]+([^ \t\n]+)' );

     Ns := [];
     Ts := [];
     with TStreamReader.Create( FileName_, TEncoding.Default ) do
     begin
          while not EndOfStream do
          begin
               S := ReadLine;

               with RV.Match( S ) do
               begin
                    if Success then TTriPoin3D( TTriPoin3D.Create( PoinModel ) ).Pos := GetVec( Groups );
               end;

               with RT.Match( S ) do
               begin
                    if Success then Ts := Ts + [ GetVec( Groups ) ];
               end;

               with RN.Match( S ) do
               begin
                    if Success then Ns := Ns + [ GetVec( Groups ) ];
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

