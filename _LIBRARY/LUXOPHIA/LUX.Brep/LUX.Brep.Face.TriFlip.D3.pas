unit LUX.Brep.Face.TriFlip.D3;

interface //#################################################################### ■

uses System.RegularExpressions,
     LUX, LUX.D3, LUX.Geometry.D3, LUX.Brep.Face.TriFlip;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     TTriPoin3D = class;
     TTriFace3D = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTriPoin3D

     TTriPoin3D = class( TTriPoin<TSingle3D> )
     private
     protected
       _Nor :TSingle3D;
       _Tex :TSingle3D;
     public
       ///// プロパティ
       property Nor :TSingle3D read _Nor write _Nor;
       property Tex :TSingle3D read _Tex write _Tex;
       ///// メソッド
       procedure MakeNormal;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTriFace3D

     TTriFace3D = class( TTriFace<TSingle3D> )
     private
     protected
       ///// アクセス
       function GetEdge( const I_:Byte ) :TSingle3D;
       function GetCircumSphere :TSingleSphere;
     public
       ///// プロパティ
       property Edge[ const I_:Byte ] :TSingle3D     read GetEdge        ;
       property CircumSphere          :TSingleSphere read GetCircumSphere;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTriFaceModel3D<_TPoin_,_TFace_>

     TTriFaceModel3D<_TPoin_:TTriPoin3D;
                     _TFace_:TTriFace3D> = class( TTriFaceModel<TSingle3D,_TPoin_,_TFace_> )
     private
       ///// メソッド
       function GetVec( const G_:TGroupCollection ) :TSingle3D;
       function GetPoin( const M_:TMatch; const Ts_,Ns_:TArray<TSingle3D> ) :TTriPoin3D;
       procedure AddFace( const P1_,P2_,P3_:TTriPoin3D );
     protected
     public
       ///// メソッド
       procedure JoinEdges;
       procedure MakeNormals;
       procedure LoadFromFile( const FileName_:String );
       function IsInside( const P_:TSingle3D ) :Boolean;
     end;

     TTriFaceModel3D = TTriFaceModel3D<TTriPoin3D,TTriFace3D>;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.Classes, System.SysUtils;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTriPoin3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

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

/////////////////////////////////////////////////////////////////////// アクセス

function TTriFace3D.GetEdge( const I_:Byte ) :TSingle3D;
begin
     Result := Poin[ _Inc_[ I_ ] ].Pos.VectorTo( Poin[ _Dec_[ I_ ] ].Pos );
end;

function TTriFace3D.GetCircumSphere :TSingleSphere;
begin
     Result := TSingleSphere.Create( Poin[ 1 ].Pos, Poin[ 2 ].Pos, Poin[ 3 ].Pos );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTriFaceModel3D<_TPoin_,_TFace_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// メソッド

function TTriFaceModel3D<_TPoin_,_TFace_>.GetVec( const G_:TGroupCollection ) :TSingle3D;
begin
     with Result do
     begin
          X := G_.Item[ 1 ].Value.ToSingle;
          Y := G_.Item[ 2 ].Value.ToSingle;
          Z := G_.Item[ 3 ].Value.ToSingle;
     end;
end;

function TTriFaceModel3D<_TPoin_,_TFace_>.GetPoin( const M_:TMatch; const Ts_,Ns_:TArray<TSingle3D> ) :TTriPoin3D;
var
   N :Integer;
begin
     if M_.Success and TryStrToInt( M_.Groups[ 1 ].Value, N ) then
     begin
          Result := TTriPoin3D( PoinModel.Childs[ N-1 ] );

          if TryStrToInt( M_.Groups[ 2 ].Value, N ) then Result._Tex := Ts_[ N-1 ];
          if TryStrToInt( M_.Groups[ 3 ].Value, N ) then Result._Nor := Ns_[ N-1 ];
     end
     else Result := nil;
end;

procedure TTriFaceModel3D<_TPoin_,_TFace_>.AddFace( const P1_,P2_,P3_:TTriPoin3D );
begin
     with TTriFace3D( TTriFace3D.Create( Self ) ) do
     begin
          Poin[ 1 ] := P1_;  BasteCorn( 1 );
          Poin[ 2 ] := P2_;  BasteCorn( 2 );
          Poin[ 3 ] := P3_;  BasteCorn( 3 );
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TTriFaceModel3D<_TPoin_,_TFace_>.JoinEdges;
var
   I :Integer;
begin
     with PoinModel do
     begin
          for I := 0 to ChildsN-1 do Childs[ I ].JoinEdge;
     end
end;

procedure TTriFaceModel3D<_TPoin_,_TFace_>.MakeNormals;
var
   I :Integer;
begin
     with PoinModel do
     begin
          for I := 0 to ChildsN-1 do TTriPoin3D( Childs[ I ] ).MakeNormal;
     end
end;

procedure TTriFaceModel3D<_TPoin_,_TFace_>.LoadFromFile( const FileName_:String );
var
   Ns, Ts :TArray<TSingle3D>;
   RV, RT, RN, RF, RI :TRegEx;
   S :String;
   Ms :TMatchCollection;
   P1, P2, P3 :TTriPoin3D;
   I :Integer;
begin
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

                         P1 := GetPoin( Ms[ 0 ], Ts, Ns );
                         P2 := GetPoin( Ms[ 1 ], Ts, Ns );
                         P3 := GetPoin( Ms[ 2 ], Ts, Ns );

                         AddFace( P1, P2, P3 );

                         for I := 3 to Ms.Count-1 do
                         begin
                              P2 := P3;  P3 := GetPoin( Ms[ I ], Ts, Ns );

                              AddFace( P1, P2, P3 );
                         end;
                    end;
               end;
          end;

          Free;
     end;

     JoinEdges;
end;

function TTriFaceModel3D<_TPoin_,_TFace_>.IsInside( const P_:TSingle3D ) :Boolean;
var
   A :Single;
   I :Integer;
begin
     A := 0;
     for I := 0 to ChildsN-1 do
     begin
          with TTriFace3D( Childs[ I ] ) do
          begin
               A := A + SolidAngle( Poin[ 1 ].Pos, Poin[ 2 ].Pos, Poin[ 3 ].Pos, P_ );
          end;
     end;

     Result := A > Pi2;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■

