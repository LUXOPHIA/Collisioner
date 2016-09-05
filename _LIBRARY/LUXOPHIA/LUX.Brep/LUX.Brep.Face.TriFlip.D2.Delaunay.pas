unit LUX.Brep.Face.TriFlip.D2.Delaunay;

interface //#################################################################### ■

uses System.Generics.Collections,
     LUX, LUX.D2, LUX.Geometry.D2, LUX.Brep.Face.TriFlip.D2;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     TDelaPoin2D = class;
     TDelaFace2D = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDelaPoin2D

     TDelaPoin2D = class
     private
     protected
       _Pos :TSingle2D;
       ///// アクセス
     public
       constructor Create( const Pos_:TSingle2D );
       ///// プロパティ
       property Pos :TSingle2D read _Pos;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDelaFace2D

     TDelaFace2D = class
     private
     protected
       _Poin   :array [ 1..3 ] of TDelaPoin2D;
       _Face   :array [ 1..3 ] of TDelaFace2D;
       _Corn   :array [ 1..3 ] of Byte;
       _Open   :Byte;
       _Circle :TSingleCircle;
       ///// アクセス
       function GetPoin( const I_:Byte ) :TDelaPoin2D;
       procedure SetPoin( const I_:Byte; const Poin_:TDelaPoin2D );
       function GetFace( const I_:Byte ) :TDelaFace2D;
       procedure SetFace( const I_:Byte; const Face_:TDelaFace2D );
       function GetCorn( const I_:Byte ) :Byte;
       procedure SetCorn( const I_,Corn_:Byte );
     public
       constructor Create( const Poin1_,Poin2_,Poin3_:TDelaPoin2D; const Open_:Byte );
       ///// プロパティ
       property Poin[ const I_:Byte ] :TDelaPoin2D         read GetPoin write SetPoin;
       property Face[ const I_:Byte ] :TDelaFace2D         read GetFace write SetFace;
       property Corn[ const I_:Byte ] :Byte          read GetCorn write SetCorn;
       property Open                  :Byte          read _Open   write _Open;
       property Circle                :TSingleCircle read _Circle;
       /////
       function IsHitCircle( const Pos_:TSingle2D ) :Boolean;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDelaunay2D

     TDelaunay2D = class
     private
       _P1 :TDelaPoin2D;
       _P2 :TDelaPoin2D;
       /////
       procedure InitFace;
     protected
       _Poins :TObjectList<TDelaPoin2D>;
       _Faces :TObjectList<TDelaFace2D>;
       ///// メソッド
       function NewPoin( const Pos_:TSingle2D ) :TDelaPoin2D;
       function NewFace( const Poin1_,Poin2_,Poin3_:TDelaPoin2D; const Open_:Byte ) :TDelaFace2D;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property Poins :TObjectList<TDelaPoin2D> read _Poins;
       property Faces :TObjectList<TDelaFace2D> read _Faces;
       ///// メソッド
       function HitCircleFace( const Pos_:TSingle2D ) :TDelaFace2D;
       procedure AddPoin3( const Poin_:TDelaPoin2D; const Face_:TDelaFace2D ); overload;
       function AddPoin3( const Pos_:TSingle2D; const Face_:TDelaFace2D ) :TDelaPoin2D; overload;
       procedure AddPoin3( const Poin_:TDelaPoin2D ); overload;
       function AddPoin3( const Pos_:TSingle2D ) :TDelaPoin2D; overload;
       procedure AddPoin( const Poin_:TDelaPoin2D ); overload;
       function AddPoin( const Pos_:TSingle2D ) :TDelaPoin2D; overload;
       procedure Clear;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TVertLR

     TVertLR = record
     private
     public
       L :Byte;
       R :Byte;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TFaceJoint

     TFaceJoint = record
     private
     public
       FaceL :TDelaFace2D;
       FaceR :TDelaFace2D;
       VertL :Byte;
       VertR :Byte;
     end;

const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

      VertTable :array [ 1..3 ] of TVertLR
        = ( ( L:2; R:3 ), ( L:3; R:1 ), ( L:1; R:2 ) );

      OpenTable :array [ 1..3, 1..3, 0..3 ] of Byte
        = ( ( ( 0, 0, 3, 2 ), ( 0, 2, 0, 3 ), ( 0, 3, 2, 0 ) ),
            ( ( 0, 0, 1, 3 ), ( 0, 3, 0, 1 ), ( 0, 1, 3, 0 ) ),
            ( ( 0, 0, 2, 1 ), ( 0, 1, 0, 2 ), ( 0, 2, 1, 0 ) ) );

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

constructor TDelaPoin2D.Create( const Pos_:TSingle2D );
begin
     inherited Create;

     _Pos := Pos_;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDelaFace2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TDelaFace2D.GetPoin( const I_:Byte ) :TDelaPoin2D;
begin
     Result := _Poin[ I_ ];
end;

procedure TDelaFace2D.SetPoin( const I_:Byte; const Poin_:TDelaPoin2D );
begin
     _Poin[ I_ ] := Poin_;
end;

function TDelaFace2D.GetFace( const I_:Byte ) :TDelaFace2D;
begin
     Result := _Face[ I_ ];
end;

procedure TDelaFace2D.SetFace( const I_:Byte; const Face_:TDelaFace2D );
begin
     _Face[ I_ ] := Face_;
end;

function TDelaFace2D.GetCorn( const I_:Byte ) :Byte;
begin
     Result := _Corn[ I_ ];
end;

procedure TDelaFace2D.SetCorn( const I_,Corn_:Byte );
begin
     _Corn[ I_ ] := Corn_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TDelaFace2D.Create( const Poin1_,Poin2_,Poin3_:TDelaPoin2D; const Open_:Byte );
//----------------------------------------------------------------------------
     function EdgeCircle( const P1_,P2_:TDelaPoin2D ) :TSingleCircle;
     begin
          with Result do
          begin
               Center := LineNormal( P1_.Pos, P2_.Pos ).Unitor;
               Radius := ( DotProduct( Center, P1_.Pos ) + DotProduct( Center, P2_.Pos ) ) / 2;
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
       0: _Circle := TSingleCircle.Create( Poin1_.Pos, Poin2_.Pos, Poin3_.Pos );
       1: _Circle := EdgeCircle( Poin2_, Poin3_ );
       2: _Circle := EdgeCircle( Poin3_, Poin1_ );
       3: _Circle := EdgeCircle( Poin1_, Poin2_ );
     end;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TDelaFace2D.IsHitCircle( const Pos_:TSingle2D ) :Boolean;
begin
     with _Circle do
     begin
          if Open = 0 then Result := ( Distance  ( Pos_, Center ) < Radius )
                      else Result := ( DotProduct( Pos_, Center ) < Radius );
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDelaunay2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

procedure TDelaunay2D.InitFace;
var
   C1, C2 :TDelaFace2D;
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

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

function TDelaunay2D.NewPoin( const Pos_:TSingle2D ) :TDelaPoin2D;
begin
     Result := TDelaPoin2D.Create( Pos_ );

     _Poins.Add( Result );
end;

function TDelaunay2D.NewFace( const Poin1_,Poin2_,Poin3_:TDelaPoin2D; const Open_:Byte ) :TDelaFace2D;
begin
     Result := TDelaFace2D.Create( Poin1_, Poin2_, Poin3_, Open_ );

     _Faces.Add( Result );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TDelaunay2D.Create;
begin
     inherited;

     _Poins := TObjectList<TDelaPoin2D>.Create;
     _Faces := TObjectList<TDelaFace2D>.Create;
end;

destructor TDelaunay2D.Destroy;
begin
     _Poins.Free;
     _Faces.Free;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TDelaunay2D.HitCircleFace( const Pos_:TSingle2D ) :TDelaFace2D;
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

//------------------------------------------------------------------------------

procedure TDelaunay2D.AddPoin3( const Poin_:TDelaPoin2D; const Face_:TDelaFace2D );
//････････････････････････････････････････････････････････････････････････････････
     function FaceTree( const Face_:TDelaFace2D; const Vert_:Byte ) :TFaceJoint;
     var
        JL, JR :TFaceJoint;
        C :TDelaFace2D;
     begin
          with Face_ do
          begin
               if IsHitCircle( Poin_.Pos ) then
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
     //･･･････････････････････････････････････････････････････････････････････････
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
//････････････････････････････････････････････････････････････････････････････････
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

//------------------------------------------------------------------------------

function TDelaunay2D.AddPoin3( const Pos_:TSingle2D; const Face_:TDelaFace2D ) :TDelaPoin2D;
begin
     Result := NewPoin( Pos_ );  AddPoin3( Result, Face_ );
end;

procedure TDelaunay2D.AddPoin3( const Poin_:TDelaPoin2D );
begin
     AddPoin3( Poin_, HitCircleFace( Poin_.Pos ) );
end;

function TDelaunay2D.AddPoin3( const Pos_:TSingle2D ) :TDelaPoin2D;
begin
     Result := NewPoin( Pos_ );  AddPoin3( Result );
end;

//------------------------------------------------------------------------------

procedure TDelaunay2D.AddPoin( const Poin_:TDelaPoin2D );
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

function TDelaunay2D.AddPoin( const Pos_:TSingle2D ) :TDelaPoin2D;
begin
     Result := NewPoin( Pos_ );  AddPoin( Result );
end;

//------------------------------------------------------------------------------

procedure TDelaunay2D.Clear;
begin
     _Poins.Clear;
     _Faces.Clear;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
