unit LUX.Brep.Face.TriFlip.D2.Delaunay;

interface //#################################################################### ■

uses System.Generics.Collections,
     LUX, LUX.D2, LUX.Geometry.D2, LUX.Brep.Face.TriFlip.D2;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     TDelaPoin2D = class;
     TDelaFace2D = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TFaceJoint

     TFaceJoint = record
     private
     public
       FaceL :TDelaFace2D;
       FaceR :TDelaFace2D;
       VertL :Byte;
       VertR :Byte;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVertLR

     TVertLR = record
     private
     public
       L :Byte;
       R :Byte;
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDelaPoin2D

     TDelaPoin2D = class( TTriPoin2D )
     private
     protected
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDelaFace2D

     TDelaFace2D = class( TTriFace2D )
     private
     protected
       _Open :Byte;
       ///// アクセス
       function GetPoin( const I_:Byte ) :TDelaPoin2D; reintroduce; virtual;
       procedure SetPoin( const I_:Byte; const Poin_:TDelaPoin2D ); reintroduce; virtual;
       function GetFace( const I_:Byte ) :TDelaFace2D; reintroduce; virtual;
       procedure SetFace( const I_:Byte; const Face_:TDelaFace2D ); reintroduce; virtual;
       function GetCircle :TSingleCircle; virtual;
     public
       ///// プロパティ
       property Poin[ const I_:Byte ] :TDelaPoin2D   read GetPoin   write SetPoin;
       property Face[ const I_:Byte ] :TDelaFace2D   read GetFace   write SetFace;
       property Open                  :Byte          read   _Open   write   _Open;
       property Circle                :TSingleCircle read GetCircle              ;
       ///// メソッド
       function IsHitCircle( const Pos_:TSingle2D ) :Boolean;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDelaunay2D<_TPoin_,_TFace_>

     TDelaunay2D<_TPoin_:TDelaPoin2D,constructor;
                 _TFace_:TDelaFace2D,constructor> = class( TTriFaceModel2D<_TPoin_,_TFace_> )
     private
       ///// メソッド
       procedure InitFace;
       function FaceTree( const Poin_:_TPoin_; const Face_:_TFace_; const Vert_:Byte ) :TFaceJoint;
       procedure Connect( const J_,JL_,JR_:TFaceJoint );
     protected
       ///// メソッド
       function NewPoin( const Pos_:TSingle2D ) :_TPoin_;
       function NewFace( const Poin1_,Poin2_,Poin3_:_TPoin_; const Open_:Byte ) :_TFace_;
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// メソッド
       function HitCircleFace( const Pos_:TSingle2D ) :_TFace_;
       procedure AddPoin3( const Poin_:_TPoin_; const Face_:_TFace_ ); overload;
       function AddPoin3( const Pos_:TSingle2D; const Face_:_TFace_ ) :_TPoin_; overload;
       procedure AddPoin3( const Poin_:_TPoin_ ); overload;
       function AddPoin3( const Pos_:TSingle2D ) :_TPoin_; overload;
       procedure AddPoin( const Poin_:_TPoin_ ); overload;
       function AddPoin( const Pos_:TSingle2D ) :_TPoin_; overload;
     end;

const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

      VertTable :array [ 1..3 ] of TVertLR
        = ( ( L:2; R:3 ), ( L:3; R:1 ), ( L:1; R:2 ) );

      OpenTable :array [ 1..3, 1..3, 0..3 ] of Byte
        = ( ( ( 0, 0, 3, 2 ), ( 0, 2, 0, 3 ), ( 0, 3, 2, 0 ) ),
            ( ( 0, 0, 1, 3 ), ( 0, 3, 0, 1 ), ( 0, 1, 3, 0 ) ),
            ( ( 0, 0, 2, 1 ), ( 0, 1, 0, 2 ), ( 0, 2, 1, 0 ) ) );

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVertLR

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TFaceJoint

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDelaPoin2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDelaFace2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TDelaFace2D.GetPoin( const I_:Byte ) :TDelaPoin2D;
begin
     Result := TDelaPoin2D( inherited Poin[ I_ ] );
end;

procedure TDelaFace2D.SetPoin( const I_:Byte; const Poin_:TDelaPoin2D );
begin
     inherited Poin[ I_ ] := Poin_;
end;

function TDelaFace2D.GetFace( const I_:Byte ) :TDelaFace2D;
begin
     Result := TDelaFace2D( inherited Face[ I_ ] );
end;

procedure TDelaFace2D.SetFace( const I_:Byte; const Face_:TDelaFace2D );
begin
     inherited Face[ I_ ] := Face_;
end;

function TDelaFace2D.GetCircle :TSingleCircle;
//･･･････････････････････････････････････････
     function EdgeCircle( const P1_,P2_:TDelaPoin2D ) :TSingleCircle;
     begin
          with Result do
          begin
               Center := LineNormal( P1_.Pos, P2_.Pos ).Unitor;
               Radius := ( DotProduct( Center, P1_.Pos ) + DotProduct( Center, P2_.Pos ) ) / 2;
          end;
     end;
//･･･････････････････････････････････････････
begin
     case _Open of
       0: Result := TSingleCircle.Create( Poin[1].Pos, Poin[2].Pos, Poin[3].Pos );
       1: Result := EdgeCircle( Poin[2], Poin[3] );
       2: Result := EdgeCircle( Poin[3], Poin[1] );
       3: Result := EdgeCircle( Poin[1], Poin[2] );
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

function TDelaFace2D.IsHitCircle( const Pos_:TSingle2D ) :Boolean;
begin
     with Circle do
     begin
          if Open = 0 then Result := ( Distance  ( Pos_, Center ) < Radius )
                      else Result := ( DotProduct( Pos_, Center ) < Radius );
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDelaunay2D<_TPoin_,_TFace_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

procedure TDelaunay2D<_TPoin_,_TFace_>.InitFace;
var
   P1, P2 :_TPoin_;
   C1, C2 :_TFace_;
begin
     P1 := _TPoin_( PoinModel.Childs[ 0 ] );
     P2 := _TPoin_( PoinModel.Childs[ 1 ] );

     C1 := NewFace( nil, P1, P2, 1 );
     C2 := NewFace( nil, P2, P1, 1 );

     C1.Face[ 1 ] := C2;  C1.Corn[ 1 ] := 1;
     C1.Face[ 2 ] := C2;  C1.Corn[ 2 ] := 3;
     C1.Face[ 3 ] := C2;  C1.Corn[ 3 ] := 2;

     C2.Face[ 1 ] := C1;  C2.Corn[ 1 ] := 1;
     C2.Face[ 2 ] := C1;  C2.Corn[ 2 ] := 3;
     C2.Face[ 3 ] := C1;  C2.Corn[ 3 ] := 2;
end;

//------------------------------------------------------------------------------

function TDelaunay2D<_TPoin_,_TFace_>.FaceTree( const Poin_:_TPoin_; const Face_:_TFace_; const Vert_:Byte ) :TFaceJoint;
var
   JL, JR :TFaceJoint;
   C :_TFace_;
begin
          if Face_.IsHitCircle( Poin_.Pos ) then
          begin
               with VertTable[ Vert_ ] do
               begin
                    JL := FaceTree( Poin_, Face_.Face[ R ], Face_.Corn[ R ] );
                    JR := FaceTree( Poin_, Face_.Face[ L ], Face_.Corn[ L ] );
               end;

               with JL do
               begin
                    with FaceR do
                    begin
                         Face[ VertR ] := JR.FaceL;
                         Corn[ VertR ] := JR.VertL;
                    end
               end;
               with JR do
               begin
                    with FaceL do
                    begin
                         Face[ VertL ] := JL.FaceR;
                         Corn[ VertL ] := JL.VertR;
                    end
               end;

               Face_.Free;

               with Result do
               begin
                    FaceL := JL.FaceL;  VertL := JL.VertL;
                    FaceR := JR.FaceR;  VertR := JR.VertR;
               end;
          end
          else
          begin
               with VertTable[ Vert_ ] do C := NewFace( Face_.Poin[ L ], Poin_, Face_.Poin[ R ], OpenTable[ 2, Vert_, Face_.Open ] );

               C.Face[ 2 ] := Face_;
               C.Corn[ 2 ] := Vert_;

               Face_.Face[ Vert_ ] := C;
               Face_.Corn[ Vert_ ] := 2;

               with Result do
               begin
                    FaceL := C;  VertL := 3;
                    FaceR := C;  VertR := 1;
               end;
          end;
end;

procedure TDelaunay2D<_TPoin_,_TFace_>.Connect( const J_,JL_,JR_:TFaceJoint );
begin
     with J_ do
     begin
          with FaceL do
          begin
               Face[ VertL ] := JL_.FaceR;
               Corn[ VertL ] := JL_.VertR;
          end;
          with FaceR do
          begin
               Face[ VertR ] := JR_.FaceL;
               Corn[ VertR ] := JR_.VertL;
          end;
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

function TDelaunay2D<_TPoin_,_TFace_>.NewPoin( const Pos_:TSingle2D ) :_TPoin_;
begin
     Result := _TPoin_.Create;

     Result.Paren := _TPoin_( _PoinModel );
     Result.Pos   := Pos_;
end;

function TDelaunay2D<_TPoin_,_TFace_>.NewFace( const Poin1_,Poin2_,Poin3_:_TPoin_; const Open_:Byte ) :_TFace_;
begin
     Result := _TFace_.Create;

     Result.Paren   := _TFace_( Self );
     Result.Open    := Open_;
     Result.Poin[1] := Poin1_;
     Result.Poin[2] := Poin2_;
     Result.Poin[3] := Poin3_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TDelaunay2D<_TPoin_,_TFace_>.Create;
begin
     inherited;

end;

destructor TDelaunay2D<_TPoin_,_TFace_>.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TDelaunay2D<_TPoin_,_TFace_>.HitCircleFace( const Pos_:TSingle2D ) :_TFace_;
var
   I :Integer;
begin
     for I := 0 to ChildsN-1 do
     begin
          Result := _TFace_( Childs[ I ] );

          if Result.IsHitCircle( Pos_ ) then Exit;
     end;

     Result := nil;
end;

//------------------------------------------------------------------------------

procedure TDelaunay2D<_TPoin_,_TFace_>.AddPoin3( const Poin_:_TPoin_; const Face_:_TFace_ );
var
   J1, J2, J3 :TFaceJoint;
begin
     J1 := FaceTree( Poin_, Face_.Face[ 1 ], Face_.Corn[ 1 ] );
     J2 := FaceTree( Poin_, Face_.Face[ 2 ], Face_.Corn[ 2 ] );
     J3 := FaceTree( Poin_, Face_.Face[ 3 ], Face_.Corn[ 3 ] );

     Face_.Free;

     Connect( J1, J2, J3 );
     Connect( J2, J3, J1 );
     Connect( J3, J1, J2 );
end;

//------------------------------------------------------------------------------

function TDelaunay2D<_TPoin_,_TFace_>.AddPoin3( const Pos_:TSingle2D; const Face_:_TFace_ ) :_TPoin_;
begin
     Result := NewPoin( Pos_ );  AddPoin3( Result, Face_ );
end;

procedure TDelaunay2D<_TPoin_,_TFace_>.AddPoin3( const Poin_:_TPoin_ );
begin
     AddPoin3( Poin_, HitCircleFace( Poin_.Pos ) );
end;

function TDelaunay2D<_TPoin_,_TFace_>.AddPoin3( const Pos_:TSingle2D ) :_TPoin_;
begin
     Result := NewPoin( Pos_ );  AddPoin3( Result );
end;

//------------------------------------------------------------------------------

procedure TDelaunay2D<_TPoin_,_TFace_>.AddPoin( const Poin_:_TPoin_ );
begin
     case PoinModel.ChildsN of
       1: ;
       2: InitFace;
     else AddPoin3( Poin_ );
     end;
end;

function TDelaunay2D<_TPoin_,_TFace_>.AddPoin( const Pos_:TSingle2D ) :_TPoin_;
begin
     Result := NewPoin( Pos_ );  AddPoin( Result );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
