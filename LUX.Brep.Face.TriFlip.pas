unit LUX.Brep.Face.TriFlip;

interface //#################################################################### ■

uses LUX, LUX.D3, LUX.Graph.Tree, LUX.Brep.Poin;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     TTriPoin<_TPos_>      = class;

     TTriFace<_TPos_>      = class;
     TTriFaceModel<_TPos_> = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TCornIter

     TCornIter<_TPos_> = record
     private
       _Face :TTriFace<_TPos_>;
       _Corn :Byte;
       ///// アクセス
       function GetFlip :TCornIter<_TPos_>;
       procedure SetFlip( Flip_:TCornIter<_TPos_> );
       function GetFacePrev :TCornIter<_TPos_>;
       function GetFaceNext :TCornIter<_TPos_>;
       function GetVertPrev :TCornIter<_TPos_>;
       procedure SetVertPrev( VertPrev_:TCornIter<_TPos_> );
       function GetVertNext :TCornIter<_TPos_>;
       procedure SetVertNext( VertNext_:TCornIter<_TPos_> );
       function GetVert :TTriPoin<_TPos_>;
     public
       constructor Create( Face_:TTriFace<_TPos_>; Corn_:Byte );
       ///// プロパティ
       property Face     :TTriFace<_TPos_>  read   _Face     write   _Face    ;
       property Corn     :Byte              read   _Corn     write   _Corn    ;
       property Flip     :TCornIter<_TPos_> read GetFlip     write SetFlip    ;
       property FacePrev :TCornIter<_TPos_> read GetFacePrev                  ;
       property FaceNext :TCornIter<_TPos_> read GetFaceNext                  ;
       property VertPrev :TCornIter<_TPos_> read GetVertPrev write SetVertPrev;
       property VertNext :TCornIter<_TPos_> read GetVertNext write SetVertNext;
       property Vert     :TTriPoin<_TPos_>  read GetVert                      ;
       ///// 演算子
       class operator Equal( const A_,B_:TCornIter<_TPos_> ) :Boolean;
       class operator NotEqual( const A_,B_:TCornIter<_TPos_> ) :Boolean;
       ///// メソッド
       procedure GoFlip;
       procedure GoFacePrev;
       procedure GoFaceNext;
       procedure GoVertPrev;
       procedure GoVertNext;
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTriPoin<_TPos_>

     TTriPoin<_TPos_> = class( TPoin<_TPos_> )
     private
     protected
       _Face :TTriFace<_TPos_>;
       _Corn :Byte;
       ///// アクセス
       function GetFace :TTriFace<_TPos_>;
       procedure SetFace( const Face_:TTriFace<_TPos_> );
       function GetCorn :Byte;
       procedure SetCorn( const Corn_:Byte );
       function GetFaceN :Integer;
     public
       ///// プロパティ
       property Face   :TTriFace<_TPos_> read GetFace  write SetFace;
       property Corn   :Byte             read GetCorn  write SetCorn;
       property FaceN  :Integer          read GetFaceN              ;
       ///// メソッド
       class function JoinOK( const C1_,C2_:TCornIter<_TPos_> ) :Boolean;
       procedure JoinEdge;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTriFace<_TPos_>

     TTriFace<_TPos_> = class( TTreeNode<TTriFace<_TPos_>> )
     private
       ///// メソッド
       procedure Insert( const I_:Byte );
       procedure Remove( const I_:Byte );
     protected
       _Poin :array [ 1..3 ] of TTriPoin<_TPos_>;
       _Face :array [ 1..3 ] of TTriFace<_TPos_>;
       _Data :Byte;
       ///// アクセス
       function GetPoin( const I_:Byte ) :TTriPoin<_TPos_>;
       procedure SetPoin( const I_:Byte; const Poin_:TTriPoin<_TPos_> );
       function GetFace( const I_:Byte ) :TTriFace<_TPos_>;
       procedure SetFace( const I_:Byte; const Face_:TTriFace<_TPos_> );
       function GetCorn( const I_:Byte ) :Byte;
       procedure SetCorn( const I_,Corn_:Byte );
       function GetFlip :Boolean;
       procedure SetFlip( const Flip_:Boolean );
       function GetFlag :Boolean;
       procedure SetFlag( const Flag_:Boolean );
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       property Poin[ const I_:Byte ] :TTriPoin<_TPos_> read GetPoin write SetPoin;
       property Face[ const I_:Byte ] :TTriFace<_TPos_> read GetFace write SetFace;
       property Corn[ const I_:Byte ] :Byte             read GetCorn write SetCorn;
       property Flip                  :Boolean          read GetFlip write SetFlip;
       property Flag                  :Boolean          read GetFlag write SetFlag;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTriFaceModel

     TTriFaceModel<_TPos_> = class( TTreeNode<TTriFace<_TPos_>> )
     private
     protected
       _PoinModel :TPoinModel<TTriPoin<_TPos_>>;
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       property PoinModel :TPoinModel<TTriPoin<_TPos_>> read _PoinModel;
       ///// メソッド
       function CheckEdges :Integer;
       function CheckFaceLings :Integer;
     end;

const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

      _Inc_ :array [ 1..3 ] of Byte = ( 2, 3, 1 );
      _Dec_ :array [ 1..3 ] of Byte = ( 3, 1, 2 );

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TCornIter<_TPos_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

function TCornIter<_TPos_>.GetFlip :TCornIter<_TPos_>;
begin
     Result.Face := _Face.Face[ _Corn ];
     Result.Corn := _Face.Corn[ _Corn ];
end;

procedure TCornIter<_TPos_>.SetFlip( Flip_:TCornIter<_TPos_> );
begin
     _Face.Face[ _Corn ] := Flip_.Face;
     _Face.Corn[ _Corn ] := Flip_.Corn;
end;

function TCornIter<_TPos_>.GetFacePrev :TCornIter<_TPos_>;
begin
     Result.Face :=        _Face  ;
     Result.Corn := _Dec_[ _Corn ];
end;

function TCornIter<_TPos_>.GetFaceNext :TCornIter<_TPos_>;
begin
     Result.Face :=        _Face  ;
     Result.Corn := _Inc_[ _Corn ];
end;

function TCornIter<_TPos_>.GetVertPrev :TCornIter<_TPos_>;
begin
     Result := FaceNext.Flip;
end;

procedure TCornIter<_TPos_>.SetVertPrev( VertPrev_:TCornIter<_TPos_> );
begin
     FaceNext.Flip := VertPrev_;
end;

function TCornIter<_TPos_>.GetVertNext :TCornIter<_TPos_>;
begin
     Result := Flip.FacePrev;
end;

procedure TCornIter<_TPos_>.SetVertNext( VertNext_:TCornIter<_TPos_> );
begin
     Flip := VertNext_.FaceNext;
end;

function TCornIter<_TPos_>.GetVert :TTriPoin<_TPos_>;
begin
     Result := _Face.Poin[ _Corn ];
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TCornIter<_TPos_>.Create( Face_:TTriFace<_TPos_>; Corn_:Byte );
begin
     _Face := Face_;
     _Corn := Corn_;
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TCornIter<_TPos_>.Equal( const A_,B_:TCornIter<_TPos_> ) :Boolean;
begin
     Result := ( A_.Face = B_.Face ) and ( A_.Corn = B_.Corn )
end;

class operator TCornIter<_TPos_>.NotEqual( const A_,B_:TCornIter<_TPos_> ) :Boolean;
begin
     Result := not ( A_ = B_ );
end;

/////////////////////////////////////////////////////////////////////// アクセス

procedure TCornIter<_TPos_>.GoFlip;
var
   F :TCornIter<_TPos_>;
begin
     F.Face := _Face;
     F.Corn := _Corn;

     _Face := F.Face.Face[ F.Corn ];
     _Corn := F.Face.Corn[ F.Corn ];
end;

procedure TCornIter<_TPos_>.GoFacePrev;
begin
     _Corn := _Dec_[ _Corn ];
end;

procedure TCornIter<_TPos_>.GoFaceNext;
begin
     _Corn := _Inc_[ _Corn ];
end;

procedure TCornIter<_TPos_>.GoVertPrev;
begin
     GoFaceNext;
     GoFlip;
end;

procedure TCornIter<_TPos_>.GoVertNext;
begin
     GoFlip;
     GoFacePrev;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTriPoin<_TPos_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TTriPoin<_TPos_>.GetFace :TTriFace<_TPos_>;
begin
     Result := _Face;
end;

procedure TTriPoin<_TPos_>.SetFace( const Face_:TTriFace<_TPos_> );
begin
     _Face := Face_;
end;

function TTriPoin<_TPos_>.GetCorn :Byte;
begin
     Result := _Corn;
end;

procedure TTriPoin<_TPos_>.SetCorn( const Corn_:Byte );
begin
     _Corn := Corn_;
end;

function TTriPoin<_TPos_>.GetFaceN :Integer;
var
   F, F0 :TTriFace<_TPos_>;
   C, C0 :Byte;
begin
     Result := 0;

     if Face <> nil then
     begin
          F := Face;
          C := _Inc_[ Corn ];

          repeat
                Inc( Result );

                F0 := F;
                C0 := C;

                F :=        F0.Face[ C0 ];
                C := _Dec_[ F0.Corn[ C0 ] ];

          until F = Face;
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

class function TTriPoin<_TPos_>.JoinOK( const C1_,C2_:TCornIter<_TPos_> ) :Boolean;
begin
     Result := ( C1_.FaceNext.Vert = C2_.Vert );
end;

procedure TTriPoin<_TPos_>.JoinEdge;
var
   T,  C,
   C0, C1,
   P0, P1, P2,
   H0, H1,
   T0, T1,
   S0, S1, S2, S3 :TCornIter<_TPos_>;
begin
     T := TCornIter<_TPos_>.Create( nil, 0 );

     C := TCornIter<_TPos_>.Create( _Face, _Corn ).FaceNext;

     C1 := C;

     repeat
           C0 := C1;  C1 := C0.VertNext;

           if  T.Face = nil then
           begin
                C0.VertNext := C0;

                T := C0;
           end
           else
           begin
                P0 := T;
                P1 := C0;
                P2 := T.VertNext;

                P0.VertNext := P1;  P1.VertNext := P2;

                T0 := P0;  T1 := P1;
                           H0 := P1;  H1 := P2;

                ///// 後方

                S0 := H0;  S1 := H1;
                           S2 := H1;
                repeat
                     S3 := S2.VertNext;

                     if JoinOK( S2, S3 ) then
                     begin
                                     S2 := S3;
                     end
                     else
                     if JoinOK( S2, T1 ) then
                     begin
                          S0.VertNext := S3;  H1 := H0.VertNext;

                          T0.VertNext := S1;  S2.VertNext := T1;

                          T1 := S1;

                          S0 := H0;  S1 := H1;
                                     S2 := H1;
                     end
                     else
                     begin
                          S0 := S2;  S1 := S3;
                                     S2 := S3;
                     end;

                until S3 = T0;

                ///// 前方

                S0 := H0;  S1 := H1;
                           S2 := H1;
                repeat
                      S3 := S2.VertNext;

                      if JoinOK( S2, S3 ) then
                      begin
                                     S2 := S3;
                      end
                      else
                      if JoinOK( H0, S1 ) then
                      begin
                           S0.VertNext := S3;  H1 := H0.VertNext;

                           H0.VertNext := S1;  S2.VertNext := H1;

                           H0 := S2;

                           S0 := H0;  S1 := H1;
                                      S2 := H1;
                      end
                      else
                      begin
                           S0 := S2;  S1 := S3;
                                      S2 := S3;
                      end;

                until S3 = T1;

                T := H0;
           end;
     until C1 = C;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTriFace<_TPos_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

procedure TTriFace<_TPos_>.Insert( const I_:Byte );
var
   V :TTriPoin<_TPos_>;
   C0, C1, C2 :TCornIter<_TPos_>;
begin
     V := _Poin[ I_ ];

     C1 := TCornIter<_TPos_>.Create( Self, I_ ).FaceNext;

     if Assigned( V._Face ) then
     begin
          C0 := TCornIter<_TPos_>.Create( V._Face, V._Corn ).FaceNext;

          C2 := C0.VertNext;

          C0.VertNext := C1;  C1.VertNext := C2;
     end
     else
     begin
          C1.VertNext := C1;
     end;

     V._Face := Self;
     V._Corn := I_;
end;

procedure TTriFace<_TPos_>.Remove( const I_:Byte );
begin

end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TTriFace<_TPos_>.GetPoin( const I_:Byte ) :TTriPoin<_TPos_>;
begin
     Result := _Poin[ I_ ];
end;

procedure TTriFace<_TPos_>.SetPoin( const I_:Byte; const Poin_:TTriPoin<_TPos_> );
begin
     if Assigned( _Poin[ I_ ] ) then Remove( I_ );

                  _Poin[ I_ ] := Poin_;

     if Assigned( _Poin[ I_ ] ) then Insert( I_ );
end;

function TTriFace<_TPos_>.GetFace( const I_:Byte ) :TTriFace<_TPos_>;
begin
     Result := _Face[ I_ ];
end;

procedure TTriFace<_TPos_>.SetFace( const I_:Byte; const Face_:TTriFace<_TPos_> );
begin
     _Face[ I_ ] := Face_;
end;

function TTriFace<_TPos_>.GetCorn( const I_:Byte ) :Byte;
begin
     Result := ( _Data shr ( I_ shl 1 ) ) and 3;
end;

procedure TTriFace<_TPos_>.SetCorn( const I_,Corn_:Byte );
var
   I :Integer;
begin
     I := I_ shl 1;

     _Data := ( _Data and ( $FF - ( 3 shl I ) ) ) or ( Corn_ shl I );
end;

function TTriFace<_TPos_>.GetFlip :Boolean;
begin
     Result := ( _Data and 1 <> 0 );
end;

procedure TTriFace<_TPos_>.SetFlip( const Flip_:Boolean );
begin
     _Data := _Data and ($FF-1);  if Flip_ then _Data := _Data or 1;
end;

function TTriFace<_TPos_>.GetFlag :Boolean;
begin
     Result := ( _Data and 2 <> 0 );
end;

procedure TTriFace<_TPos_>.SetFlag( const Flag_:Boolean );
begin
     _Data := _Data and ($FF-2);  if Flag_ then _Data := _Data or 2;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TTriFace<_TPos_>.Create;
begin
     inherited;

     Poin[ 1 ] := nil;
     Poin[ 2 ] := nil;
     Poin[ 3 ] := nil;

     Face[ 1 ] := Self;  Corn[ 1 ] := 2;
     Face[ 2 ] := Self;  Corn[ 2 ] := 3;
     Face[ 3 ] := Self;  Corn[ 3 ] := 1;

     Flip := True;
     Flag := False;
end;

destructor TTriFace<_TPos_>.Destroy;
begin
     if Assigned( _Poin[ 1 ] ) then Remove( 1 );
     if Assigned( _Poin[ 2 ] ) then Remove( 2 );
     if Assigned( _Poin[ 3 ] ) then Remove( 3 );

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTriFaceModel

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TTriFaceModel<_TPos_>.Create;
begin
     inherited;

     _PoinModel := TPoinModel<TTriPoin<_TPos_>>.Create;
end;

destructor TTriFaceModel<_TPos_>.Destroy;
begin
     _PoinModel.Free;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TTriFaceModel<_TPos_>.CheckEdges :Integer;
var
   I, C0, C1 :Integer;
   F0, F1 :TTriFace<_TPos_>;
begin
     Result := 0;

     for I := 0 to ChildsN-1 do
     begin
          F0 := Childs[ I ];

          for C0 := 1 to 3 do
          begin
               C1 := F0.Corn[ C0 ];

               if C1 > 0 then
               begin
                    F1 := F0.Face[ C0 ];

                    if F1 = nil            then Inc( Result )
                                           else
                    if F1.Face[ C1 ] <> F0 then Inc( Result );
               end
               else Inc( Result );
          end;
     end;
end;

function TTriFaceModel<_TPos_>.CheckFaceLings :Integer;
var
   V :TTriPoin<_TPos_>;
   F0, F, F1 :TTriFace<_TPos_>;
   I, K, C0, C, C1 :Integer;
begin
     Result := 0;

     for I := 0 to PoinModel.ChildsN-1 do
     begin
          V := PoinModel.Childs[ I ];

          F0 :=      V.Face;
          C0 := _Inc_[ V.Corn ];

          F1 := F0;
          C1 := C0;
          for K := 1 to V.FaceN do
          begin
                F := F1;
                C := C1;

                F1 :=        F.Face[ C ];
                C1 := _Dec_[ F.Corn[ C ] ];
          end;

          if F1 <> F0 then Inc( Result );
     end
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
