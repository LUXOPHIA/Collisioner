unit LUX.Brep.Face.TriFlip.D2.Delaunay;

interface //######################################################################################## ■

uses System.Generics.Collections,
     LUX, LUX.D2, LUX.Geometry.D2;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     TPoin = class;
     TFace = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TPoin

     TPoin = class
     private
     protected
       _Position :TDouble2D;
       ///// アクセス
     public
       constructor Create( const Position_:TDouble2D );
       ///// プロパティ
       property Position :TDouble2D read _Position;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TFace

     TFace = class
     private
     protected
       _Poin   :array [ 1..3 ] of TPoin;
       _Face   :array [ 1..3 ] of TFace;
       _Corn   :array [ 1..3 ] of Byte;
       _Open   :Byte;
       _Circle :TDoubleCircle;
       ///// アクセス
       function GetPoin( const I_:Byte ) :TPoin;
       procedure SetPoin( const I_:Byte; const Poin_:TPoin );
       function GetFace( const I_:Byte ) :TFace;
       procedure SetFace( const I_:Byte; const Face_:TFace );
       function GetCorn( const I_:Byte ) :Byte;
       procedure SetCorn( const I_,Corn_:Byte );
     public
       constructor Create( const Poin1_,Poin2_,Poin3_:TPoin; const Open_:Byte );
       ///// プロパティ
       property Poin[ const I_:Byte ] :TPoin         read GetPoin write SetPoin;
       property Face[ const I_:Byte ] :TFace         read GetFace write SetFace;
       property Corn[ const I_:Byte ] :Byte          read GetCorn write SetCorn;
       property Open                  :Byte          read _Open   write _Open;
       property Circle                :TDoubleCircle read _Circle;
       /////
       function IsHitCircle( const Pos_:TDouble2D ) :Boolean;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDelaunay

     TDelaunay = class
     private
       _P1 :TPoin;
       _P2 :TPoin;
       /////
       procedure InitFace;
     protected
       _Poins :TObjectList<TPoin>;
       _Faces :TObjectList<TFace>;
       ///// メソッド
       function NewPoin( const Pos_:TDouble2D ) :TPoin;
       function NewFace( const Poin1_,Poin2_,Poin3_:TPoin; const Open_:Byte ) :TFace;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property Poins :TObjectList<TPoin> read _Poins;
       property Faces :TObjectList<TFace> read _Faces;
       ///// メソッド
       function HitCircleFace( const Pos_:TDouble2D ) :TFace;
       procedure AddPoin3( const Poin_:TPoin; const Face_:TFace ); overload;
       function AddPoin3( const Pos_:TDouble2D; const Face_:TFace ) :TPoin; overload;
       procedure AddPoin3( const Poin_:TPoin ); overload;
       function AddPoin3( const Pos_:TDouble2D ) :TPoin; overload;
       procedure AddPoin( const Poin_:TPoin ); overload;
       function AddPoin( const Pos_:TDouble2D ) :TPoin; overload;
       procedure Clear;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //################################################################################### ■

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVertLR

     TVertLR = record
     private
     public
       L :Byte;
       R :Byte;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TFaceJoint

     TFaceJoint = record
     private
     public
       FaceL :TFace;
       FaceR :TFace;
       VertL :Byte;
       VertR :Byte;
     end;

const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

      VertTable :array [ 1..3 ] of TVertLR
        = ( ( L:2; R:3 ), ( L:3; R:1 ), ( L:1; R:2 ) );

      OpenTable :array [ 1..3, 1..3, 0..3 ] of Byte
        = ( ( ( 0, 0, 3, 2 ), ( 0, 2, 0, 3 ), ( 0, 3, 2, 0 ) ),
            ( ( 0, 0, 1, 3 ), ( 0, 3, 0, 1 ), ( 0, 1, 3, 0 ) ),
            ( ( 0, 0, 2, 1 ), ( 0, 1, 0, 2 ), ( 0, 2, 1, 0 ) ) );

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVertLR

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TFaceJoint

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TPoin

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TPoin.Create( const Position_:TDouble2D );
begin
     inherited Create;

     _Position := Position_;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TFace

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////////////////////////// アクセス

function TFace.GetPoin( const I_:Byte ) :TPoin;
begin
     Result := _Poin[ I_ ];
end;

procedure TFace.SetPoin( const I_:Byte; const Poin_:TPoin );
begin
     _Poin[ I_ ] := Poin_;
end;

function TFace.GetFace( const I_:Byte ) :TFace;
begin
     Result := _Face[ I_ ];
end;

procedure TFace.SetFace( const I_:Byte; const Face_:TFace );
begin
     _Face[ I_ ] := Face_;
end;

function TFace.GetCorn( const I_:Byte ) :Byte;
begin
     Result := _Corn[ I_ ];
end;

procedure TFace.SetCorn( const I_,Corn_:Byte );
begin
     _Corn[ I_ ] := Corn_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TFace.Create( const Poin1_,Poin2_,Poin3_:TPoin; const Open_:Byte );
//----------------------------------------------------------------------------
     function EdgeCircle( const P1_,P2_:TPoin ) :TDoubleCircle;
     begin
          with Result do
          begin
               Center := LineNormal( P1_.Position, P2_.Position ).Unitor;
               Radius := ( DotProduct( Center, P1_.Position ) + DotProduct( Center, P2_.Position ) ) / 2;
          end;
     end;
//----------------------------------------------------------------------------
begin
     inherited Create;

     Poin[ 1 ] := Poin1_;
     Poin[ 2 ] := Poin2_;
     Poin[ 3 ] := Poin3_;

     Open := Open_;

     case Open_ of
       0: _Circle := TDoubleCircle.Create( Poin1_.Position, Poin2_.Position, Poin3_.Position );
       1: _Circle := EdgeCircle( Poin2_, Poin3_ );
       2: _Circle := EdgeCircle( Poin3_, Poin1_ );
       3: _Circle := EdgeCircle( Poin1_, Poin2_ );
     end;
end;

/////////////////////////////////////////////////////////////////////////////////////////// メソッド

function TFace.IsHitCircle( const Pos_:TDouble2D ) :Boolean;
begin
     with _Circle do
     begin
          if Open = 0 then Result := ( Distance  ( Pos_, Center ) < Radius )
                      else Result := ( DotProduct( Pos_, Center ) < Radius );
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDelaunay

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

procedure TDelaunay.InitFace;
var
   C1, C2 :TFace;
begin
     C1 := NewFace( nil, _P1, _P2, 1 );
     C2 := NewFace( nil, _P2, _P1, 1 );

     with C1 do
     begin
          Face[ 1 ] := C2;  Corn[ 1 ] := 1;
          Face[ 2 ] := C2;  Corn[ 2 ] := 3;
          Face[ 3 ] := C2;  Corn[ 3 ] := 2;
     end;

     with C2 do
     begin
          Face[ 1 ] := C1;  Corn[ 1 ] := 1;
          Face[ 2 ] := C1;  Corn[ 2 ] := 3;
          Face[ 3 ] := C1;  Corn[ 3 ] := 2;
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////////////////////////// アクセス

/////////////////////////////////////////////////////////////////////////////////////////// メソッド

function TDelaunay.NewPoin( const Pos_:TDouble2D ) :TPoin;
begin
     Result := TPoin.Create( Pos_ );

     _Poins.Add( Result );
end;

function TDelaunay.NewFace( const Poin1_,Poin2_,Poin3_:TPoin; const Open_:Byte ) :TFace;
begin
     Result := TFace.Create( Poin1_, Poin2_, Poin3_, Open_ );

     _Faces.Add( Result );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TDelaunay.Create;
begin
     inherited;

     _Poins := TObjectList<TPoin>.Create;
     _Faces := TObjectList<TFace>.Create;
end;

destructor TDelaunay.Destroy;
begin
     _Poins.Free;
     _Faces.Free;

     inherited;
end;

/////////////////////////////////////////////////////////////////////////////////////////// メソッド

function TDelaunay.HitCircleFace( const Pos_:TDouble2D ) :TFace;
begin
     with _Faces do
     begin
          for Result in _Faces do
          begin
               if Result.IsHitCircle( Pos_ ) then Exit;
          end;
     end;

     Result := nil;
end;

////////////////////////////////////////////////////////////////////////////////////////////////////

procedure TDelaunay.AddPoin3( const Poin_:TPoin; const Face_:TFace );
//---------------------------------------------------------------------------
     function FaceTree( const Face_:TFace; const Vert_:Byte ) :TFaceJoint;
     var
        JL, JR :TFaceJoint;
        C :TFace;
     begin
          with Face_ do
          begin
               if IsHitCircle( Poin_.Position ) then
               begin
                    with VertTable[ Vert_ ] do
                    begin
                         JL := FaceTree( Face[ R ], Corn[ R ] );
                         JR := FaceTree( Face[ L ], Corn[ L ] );
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

                    _Faces.Remove( Face_ );

                    with Result do
                    begin
                         FaceL := JL.FaceL;  VertL := JL.VertL;
                         FaceR := JR.FaceR;  VertR := JR.VertR;
                    end;
               end
               else
               begin
                    with VertTable[ Vert_ ] do C := NewFace( Poin[ L ], Poin_, Poin[ R ], OpenTable[ 2, Vert_, Open ] );

                    with C do
                    begin
                         Face[ 2 ] := Face_;
                         Corn[ 2 ] := Vert_;
                    end;

                    Face[ Vert_ ] := C;
                    Corn[ Vert_ ] := 2;

                    with Result do
                    begin
                         FaceL := C;  VertL := 3;
                         FaceR := C;  VertR := 1;
                    end;
               end;
          end;
     end;
     //----------------------------------------------------------------------
     procedure Connect( const J_,JL_,JR_:TFaceJoint );
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
//---------------------------------------------------------------------------
var
   J1, J2, J3 :TFaceJoint;
begin
     with Face_ do
     begin
          J1 := FaceTree( Face[ 1 ], Corn[ 1 ] );
          J2 := FaceTree( Face[ 2 ], Corn[ 2 ] );
          J3 := FaceTree( Face[ 3 ], Corn[ 3 ] );

          _Faces.Remove( Face_ );
     end;

     Connect( J1, J2, J3 );
     Connect( J2, J3, J1 );
     Connect( J3, J1, J2 );
end;

function TDelaunay.AddPoin3( const Pos_:TDouble2D; const Face_:TFace ) :TPoin;
begin
     Result := NewPoin( Pos_ );  AddPoin3( Result, Face_ );
end;

procedure TDelaunay.AddPoin3( const Poin_:TPoin );
begin
     AddPoin3( Poin_, HitCircleFace( Poin_.Position ) );
end;

function TDelaunay.AddPoin3( const Pos_:TDouble2D ) :TPoin;
begin
     Result := NewPoin( Pos_ );  AddPoin3( Result );
end;

procedure TDelaunay.AddPoin( const Poin_:TPoin );
begin
     case _Poins.Count of
       1: _P1 := Poin_;
       2: begin
               _P2 := Poin_;

               InitFace;
          end;
     else AddPoin3( Poin_ );
     end;
end;

function TDelaunay.AddPoin( const Pos_:TDouble2D ) :TPoin;
begin
     Result := NewPoin( Pos_ );  AddPoin( Result );
end;

procedure TDelaunay.Clear;
begin
     _Poins.Clear;
     _Faces.Clear;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//################################################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //############################################################################################# ■
