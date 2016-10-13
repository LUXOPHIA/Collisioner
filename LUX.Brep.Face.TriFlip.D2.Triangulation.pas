unit LUX.Brep.Face.TriFlip.D2.Triangulation;

interface //#################################################################### ■

uses LUX, LUX.D2, LUX.Brep.Face.TriFlip.D2.Delaunay;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTriGenPoin

     TTriGenPoin = class( TDelaPoin2D )
     private
     protected
       _Inside :ShortInt;
     public
       ///// プロパティ
       property Inside :ShortInt read _Inside write _Inside;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTriGenFace

     TTriGenFace = class( TDelaFace2D )
     private
     protected
       _Inside :Boolean;
       ///// アクセス
       procedure SetPoin( const I_:Byte; const Poin_:TDelaPoin2D ); override;
     public
       ///// プロパティ
       property Inside :Boolean read _Inside write _Inside;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTriGenModel

     TTriGenModel<_TPoin_:TTriGenPoin,constructor;
                  _TFace_:TTriGenFace,constructor> = class( TDelaunay2D<_TPoin_,_TFace_> )
     private
     protected
       _EdgePoins :array of TSingle2D;
     public
       /////
       constructor Create; override;
       destructor Destroy; override;
       ///// メソッド
       procedure MakeMesh( const Ps_:array of TSingle2D; const MinL_:Single );
       function InsideEdges( const P_:TSingle2D ) :Single;
       procedure PoissonSubDiv( const Radius_:Single );
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.Math,
     LUX.Geometry.D2;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTriGenPoin

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTriGenFace

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

procedure TTriGenFace.SetPoin( const I_:Byte; const Poin_:TDelaPoin2D );
begin
     inherited;

     _Inside := Assigned( Poin[1] )
            and Assigned( Poin[2] )
            and Assigned( Poin[3] )
            and ( TTriGenModel<TTriGenPoin,TTriGenFace>( Paren ).InsideEdges( Circle.Center ) < -0.5 );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTriGenModel

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TTriGenModel<_TPoin_,_TFace_>.Create;
begin
     inherited;

end;


destructor TTriGenModel<_TPoin_,_TFace_>.Destroy;
begin

     inherited;
end;

////////////////////////////////////////////////////////////////////////////////

procedure TTriGenModel<_TPoin_,_TFace_>.MakeMesh( const Ps_:array of TSingle2D; const MinL_:Single );
var
   A :TSingleArea2D;
   Ls :array of Single;
   IntL, L, T :Single;
   H, N, I, I0, I1 :Integer;
   P0, P1, P :TSingle2D;
begin
     DeleteChilds;

     A := BoundingBox( Ps_ );

     A.SizeX := A.SizeX * 2;
     A.SizeY := A.SizeY * 2;

     TTriGenPoin( AddPoin( A.Poin[ 0 ] ) ).Inside := +1;
     TTriGenPoin( AddPoin( A.Poin[ 1 ] ) ).Inside := +1;
     TTriGenPoin( AddPoin( A.Poin[ 2 ] ) ).Inside := +1;
     TTriGenPoin( AddPoin( A.Poin[ 3 ] ) ).Inside := +1;

     //////////

     SetLength( Ls, Length( Ps_ ) );

     H := High( Ps_ );

     P0 := Ps_[ 0 ];
     Ls[ 0 ] := 0;
     for I := 1 to H do
     begin
          P1 := Ps_[ I ];

          Ls[ I ] := Ls[ I-1 ] + Distance( P0, P1 );

          P0 := P1;
     end;

     N := Ceil( Ls[ H ] / MinL_ );

     IntL := Ls[ H ] / N;

     SetLength( _EdgePoins, N );

     I0 := 0;  I1 := 1;
     for I := 0 to N-1 do
     begin
          L := IntL * I;

          while Ls[ I1 ] <= L do
          begin
               I0 := I1;  Inc( I1 );
          end;

          T := ( L        - Ls[ I0 ] )
             / ( Ls[ I1 ] - Ls[ I0 ] );

          P0 := Ps_[ I0 ];
          P1 := Ps_[ I1 ];

          _EdgePoins[ I ] := ( P1 - P0 ) * T + P0;
     end;

     //////////

     for P in _EdgePoins do TTriGenPoin( AddPoin( P ) ).Inside := 0;
end;

//------------------------------------------------------------------------------

function TTriGenModel<_TPoin_,_TFace_>.InsideEdges( const P_:TSingle2D ) :Single;
var
   I :Integer;
   P0, P1, V0, V1 :TSingle2D;
   A :Single;
begin
     if not Assigned( _EdgePoins ) then
     begin
          Result := 0;  Exit;
     end;

     Result := 0;

     P0 := _EdgePoins[ 0 ];
     for I := 1 to High( _EdgePoins )-1 do
     begin
          P1 := _EdgePoins[ I ];

          V0 := P0 - P_;
          V1 := P1 - P_;

          A := ArcTan2( V0.X * V1.Y - V0.Y * V1.X,
                        V0.X * V1.X + V0.Y * V1.Y );

          Result := Result + A;

          P0 := P1;
     end;

     P1 := _EdgePoins[ I ];

     V0 := P0 - P_;
     V1 := P1 - P_;

     A := ArcTan2( V0.X * V1.Y - V0.Y * V1.X,
                   V0.X * V1.X + V0.Y * V1.Y );

     Result := Result + A;

     Result := Result / Pi2;
end;

//------------------------------------------------------------------------------

procedure TTriGenModel<_TPoin_,_TFace_>.PoissonSubDiv( const Radius_:Single );
var
   I :Integer;
   F :_TFace_;
label
     FIND;
begin
     FIND:
     for I := 0 to ChildsN-1 do
     begin
          F := _TFace_( Childs[ I ] );

          if ( F.Open = 0 ) and
             ( _TPoin_( F.Poin[1] ).Inside <= 0 ) and
             ( _TPoin_( F.Poin[2] ).Inside <= 0 ) and
             ( _TPoin_( F.Poin[3] ).Inside <= 0 ) and
               F.Inside and
             ( F.Circle.Radius > Radius_ ) then
          begin
               TTriGenPoin( AddPoin3( F.Circle.Center, F ) ).Inside := -1;

               goto FIND;
          end;
     end;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
