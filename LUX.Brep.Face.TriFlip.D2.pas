unit LUX.Brep.Face.TriFlip.D2;

interface //#################################################################### ■

uses System.RegularExpressions,
     LUX, LUX.D2, LUX.D3, LUX.Geometry.D2, LUX.Brep.Face.TriFlip;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     TTriPoin2D = class;
     TTriFace2D = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTriPoin2D

     TTriPoin2D = class( TTriPoin<TSingle2D> )
     private
     protected
       _Tex :TSingle2D;
     public
       ///// プロパティ
       property Tex :TSingle2D read _Tex write _Tex;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTriFace2D

     TTriFace2D = class( TTriFace<TSingle2D> )
     private
     protected
       ///// アクセス
       function GetEdge( const I_:Byte ) :TSingle2D;
       function GetNorv( const I_:Byte ) :TSingle2D;
       function GetCircumCircle :TSingleCircle;
       function GetBarycenter :TSingle2D;
     public
       ///// プロパティ
       property Edge[ const I_:Byte ] :TSingle2D     read GetEdge        ;
       property Norv[ const I_:Byte ] :TSingle2D     read GetNorv        ;
       property CircumCircle          :TSingleCircle read GetCircumCircle;
       property Barycenter            :TSingle2D     read GetBarycenter  ;
       ///// メソッド
       function BaryPos( const P_:TSingle2D ) :TSingle3D;
       function IsInside( const P_:TSingle2D ) :Boolean;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTriFaceModel2D<_TPoin_>

     TTriFaceModel2D<_TPoin_:TTriPoin2D;
                     _TFace_:TTriFace2D> = class( TTriFaceModel<TSingle2D,_TPoin_,_TFace_> )
     private
       ///// メソッド
       function GetVec( const G_:TGroupCollection ) :TSingle2D;
       function GetPoin( const M_:TMatch; const Ts_:TArray<TSingle2D> ) :TTriPoin2D;
       procedure AddFace( const P1_,P2_,P3_:TTriPoin2D );
     protected
     public
       ///// メソッド
       procedure JoinEdges;
       procedure LoadFromFile( const FileName_:String );
       function FindHit( const P_:TSingle2D; out B_:TSingle3D ) :_TFace_;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.Classes, System.SysUtils,
     LUX.M3;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTriPoin2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTriFace2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TTriFace2D.GetEdge( const I_:Byte ) :TSingle2D;
begin
     Result := Poin[ _Inc_[ I_ ] ].Pos.VectorTo( Poin[ _Dec_[ I_ ] ].Pos );
end;

function TTriFace2D.GetNorv( const I_:Byte ) :TSingle2D;
begin
     Result := GetEdge( I_ ).RotR90.Unitor;
end;

function TTriFace2D.GetCircumCircle :TSingleCircle;
begin
     Result := TSingleCircle.Create( Poin[ 1 ].Pos, Poin[ 2 ].Pos, Poin[ 3 ].Pos );
end;

function TTriFace2D.GetBarycenter :TSingle2D;
begin
     Result := Ave( Poin[ 1 ].Pos, Poin[ 2 ].Pos, Poin[ 3 ].Pos );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

function TTriFace2D.BaryPos( const P_:TSingle2D ) :TSingle3D;
var
   P1, P2, P3 :TSingle2D;
   M :TSingleM3;
begin
     P1 := Poin[1].Pos;
     P2 := Poin[2].Pos;
     P3 := Poin[3].Pos;

     with M do
     begin
          _11 := P1.X;  _12 := P2.X;  _13 := P3.X;
          _21 := P1.Y;  _22 := P2.Y;  _23 := P3.Y;
          _31 :=    1;  _32 :=    1;  _33 :=    1;
     end;

     Result := M.Inverse * TSingle3D.Create( P_.X, P_.Y, 1 );
end;

function TTriFace2D.IsInside( const P_:TSingle2D ) :Boolean;
begin
     with BaryPos( P_ ) do
     begin
          Result := ( _1 > 0 ) and ( _2 > 0 ) and ( _3 > 0 );
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTriFaceModel2D<_TPoin_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

function TTriFaceModel2D<_TPoin_,_TFace_>.GetVec( const G_:TGroupCollection ) :TSingle2D;
begin
     with Result do
     begin
          X := G_.Item[ 1 ].Value.ToSingle;
          Y := G_.Item[ 2 ].Value.ToSingle;
     end;
end;

function TTriFaceModel2D<_TPoin_,_TFace_>.GetPoin( const M_:TMatch; const Ts_:TArray<TSingle2D> ) :TTriPoin2D;
var
   N :Integer;
begin
     if M_.Success and TryStrToInt( M_.Groups[ 1 ].Value, N ) then
     begin
          Result := TTriPoin2D( PoinModel.Childs[ N-1 ] );

          if TryStrToInt( M_.Groups[ 2 ].Value, N ) then Result._Tex := Ts_[ N-1 ];
     end
     else Result := nil;
end;

procedure TTriFaceModel2D<_TPoin_,_TFace_>.AddFace( const P1_,P2_,P3_:TTriPoin2D );
begin
     with TTriFace2D( TTriFace2D.Create( Self ) ) do
     begin
          Poin[ 1 ] := P1_;
          Poin[ 2 ] := P2_;
          Poin[ 3 ] := P3_;
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TTriFaceModel2D<_TPoin_,_TFace_>.JoinEdges;
var
   I :Integer;
begin
     with PoinModel do
     begin
          for I := 0 to ChildsN-1 do Childs[ I ].JoinEdge;
     end
end;

procedure TTriFaceModel2D<_TPoin_,_TFace_>.LoadFromFile( const FileName_:String );
var
   Ts :TArray<TSingle2D>;
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

                         P1 := GetPoin( Ms[ 0 ], Ts );
                         P2 := GetPoin( Ms[ 1 ], Ts );
                         P3 := GetPoin( Ms[ 2 ], Ts );

                         AddFace( P1, P2, P3 );

                         for I := 3 to Ms.Count-1 do
                         begin
                              P2 := P3;  P3 := GetPoin( Ms[ I ], Ts );

                              AddFace( P1, P2, P3 );
                         end;
                    end;
               end;
          end;

          Free;
     end;

     JoinEdges;
end;

//------------------------------------------------------------------------------

function TTriFaceModel2D<_TPoin_,_TFace_>.FindHit( const P_:TSingle2D; out B_:TSingle3D ) :_TFace_;
var
   I :Integer;
   F :_TFace_;
   B :TSingle3D;
begin
     for I := 0 to ChildsN-1 do
     begin
          F := Childs[ I ];

          B := F.BaryPos( P_ );

          with B do
          begin
               if ( _1 > 0 ) and ( _2 > 0 ) and ( _3 > 0 ) then
               begin
                    Result := F;

                    B_ := B;

                    Exit;
               end;
          end;
     end;

     Result := nil;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■

