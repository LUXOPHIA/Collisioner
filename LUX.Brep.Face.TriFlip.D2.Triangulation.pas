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
       _EdgePoins :TArray<TSingle2D>;
     protected
       _Radius :Single;
     public
       /////
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       property Radius :Single read _Radius write _Radius;
       ///// メソッド
       procedure MakeMesh( const Ps_:TArray<TSingle2D> );
       function InsideEdges( const P_:TSingle2D ) :Single;
       procedure PoissonSubDiv;
       procedure FairMesh;
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

     _Radius := 1;
end;


destructor TTriGenModel<_TPoin_,_TFace_>.Destroy;
begin

     inherited;
end;

////////////////////////////////////////////////////////////////////////////////

procedure TTriGenModel<_TPoin_,_TFace_>.MakeMesh( const Ps_:TArray<TSingle2D> );
var
   A :TSingleArea2D;
   Ps :TArray<TSingle2D>;
   Ls :array of Single;
   EL, L, Ld, T :Single;
   PsN, PsH, EsN, I, I0, I1 :Integer;
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

     Ps := Ps_ + [ Ps_[0] ];

     PsN := Length( Ps );
     PsH := High  ( Ps );

     SetLength( Ls, PsN );

     Ls[ 0 ] := 0;
     P0 := Ps[ 0 ];
     for I := 1 to PsH do
     begin
          P1 := Ps[ I ];

          Ls[ I ] := Ls[ I-1 ] + Distance( P0, P1 );

          P0 := P1;
     end;

     //////////

     EL := _Radius * Roo2(2);

     EsN := Ceil( Ls[ PsH ] / EL );

     Ld := Ls[ PsH ] / EsN;

     SetLength( _EdgePoins, EsN );

     L  := 0;
     I0 := 0;  I1 := 1;
     for I := 0 to EsN-1 do
     begin
          while Ls[ I1 ] <= L do
          begin
               I0 := I1;  Inc( I1 );
          end;

          T := ( L        - Ls[ I0 ] )
             / ( Ls[ I1 ] - Ls[ I0 ] );

          P0 := Ps[ I0 ];
          P1 := Ps[ I1 ];

          _EdgePoins[ I ] := ( P1 - P0 ) * T + P0;

          L := L + Ld;
     end;

     //////////

     for P in _EdgePoins do TTriGenPoin( AddPoin( P ) ).Inside := 0;

     PoissonSubDiv;
end;

//------------------------------------------------------------------------------

function TTriGenModel<_TPoin_,_TFace_>.InsideEdges( const P_:TSingle2D ) :Single;
begin
     if Assigned( _EdgePoins ) then Result := InsideLoop( P_, _EdgePoins )
                               else Result := 0;
end;

//------------------------------------------------------------------------------

procedure TTriGenModel<_TPoin_,_TFace_>.PoissonSubDiv;
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
             ( F.Circle.Radius > _Radius ) then
          begin
               TTriGenPoin( AddPoin3( F.Circle.Center, F ) ).Inside := -1;

               goto FIND;
          end;
     end;
end;

//------------------------------------------------------------------------------

procedure TTriGenModel<_TPoin_,_TFace_>.FairMesh;
var
   I :Integer;
begin
     for I := ChildsN-1 downto 0 do
     begin
          with TTriGenFace( Childs[ I ] ) do
          begin
               if not Inside then
               begin
                    if Assigned( Face[ 1 ] ) then Face[ 1 ].Face[ Corn[ 1 ] ] := nil;
                    if Assigned( Face[ 2 ] ) then Face[ 2 ].Face[ Corn[ 2 ] ] := nil;
                    if Assigned( Face[ 3 ] ) then Face[ 3 ].Face[ Corn[ 3 ] ] := nil;

                    Free;
               end;
          end;
     end;

     for I := 3 downto 0 do PoinModel.Childs[ I ].Free;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
