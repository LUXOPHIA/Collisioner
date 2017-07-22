unit LUX.GPU.OpenGL.Scener;

interface //#################################################################### ■

uses System.Generics.Collections,
     Winapi.OpenGL, Winapi.OpenGLext,
     LUX, LUX.D1, LUX.D2, LUX.D3, LUX.M4, LUX.Tree,
     LUX.GPU.OpenGL,
     LUX.GPU.OpenGL.Atom.Buffer.Unifor;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     TGLNode   = class;
     TGLScener = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLNode

     IGLNode = interface
     ['{049DB60C-9F5D-45B9-89D8-E4AC58C807E3}']
     {protected}
       ///// アクセス
       function GetScener :TGLScener;
       function GetRelaPose :TSingleM4;
       procedure SetRelaPose( const RelaPose_:TSingleM4 );
       function GetAbsoPose :TSingleM4;
       procedure SetAbsoPose( const AbsoPose_:TSingleM4 );
     {public}
       ///// プロパティ
       property Scener   :TGLScener read GetScener                    ;
       property RelaPose :TSingleM4 read GetRelaPose write SetRelaPose;
       property AbsoPose :TSingleM4 read GetAbsoPose write SetAbsoPose;
       ///// メソッド
       procedure Draw;
     end;

     //-------------------------------------------------------------------------

     TGLNode = class( TTreeNode<TGLNode>, IGLNode )
     private
     protected
       _RelaPose :TSingleM4;
       _AbsoPose :TGLUnifor<TSingleM4>;  upAbsoPose :Boolean;
       _BouBox   :TSingleArea3D;
       _Visible  :Boolean;
       ///// アクセス
       function GetScener :TGLScener; virtual;
       function GetRelaPose :TSingleM4; virtual;
       procedure SetRelaPose( const RelaPose_:TSingleM4 ); virtual;
       procedure CalAbsoPose;
       function GetAbsoPose :TSingleM4; virtual;
       procedure SetAbsoPose( const AbsoPose_:TSingleM4 ); virtual;
       ///// メソッド
       procedure BeginDraw; virtual;
       procedure DrawMain; virtual;
       procedure EndDraw; virtual;
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       property Scener   :TGLScener     read GetScener                    ;
       property RelaPose :TSingleM4     read GetRelaPose write SetRelaPose;
       property AbsoPose :TSingleM4     read GetAbsoPose write SetAbsoPose;
       property BouBox   :TSingleArea3D read   _BouBox                    ;
       property Visible  :Boolean       read   _Visible  write   _Visible ;
       ///// メソッド
       procedure Draw; virtual;
       procedure CalcBouBox; virtual;
       function HitBouBox( const AbsoRay_:TSingleRay3D ) :TSingleArea;
       procedure HitRay( const AbsoRay_:TSingleRay3D; var Len_:Single; var Obj_:TGLNode ); overload;
       function HitRay( const AbsoRay_:TSingleRay3D ) :TGLNode; overload;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLCamera

     IGLCamera = interface( IGLNode )
     ['{648646AC-975D-464E-BD83-C39EA3EB4E1E}']
     {protected}
     {public}
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaper

     IGLShaper = interface( IGLNode )
     ['{8045CCEA-8FC4-4D0A-A6CE-A97FF6972A7F}']
     {protected}
     {public}
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLScener

     IGLScener = interface( IGLNode )
     ['{600C6A00-B748-4A1B-A841-A7135257ABCA}']
     {protected}
     {public}
       ///// プロパティ
       property RelaPose :TSingleM4 read GetRelaPose;
       property AbsoPose :TSingleM4 read GetAbsoPose;
     end;

     //-------------------------------------------------------------------------

     TGLScener = class( TGLNode, IGLScener )
     private
     protected
       ///// アクセス
       function GetRelaPose :TSingleM4; override;
       procedure SetRelaPose( const RelaPose_:TSingleM4 ); override;
       function GetAbsoPose :TSingleM4; override;
       procedure SetAbsoPose( const AbsoPose_:TSingleM4 ); override;
       ///// メソッド
       procedure BeginDraw; override;
       procedure DrawMain; override;
       procedure EndDraw; override;
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       property RelaPose :TSingleM4 read GetRelaPose;
       property AbsoPose :TSingleM4 read GetAbsoPose;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.SysUtils, System.Classes,
     LUX.GPU.OpenGL.Camera,
     LUX.GPU.OpenGL.Shaper;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLNode

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLNode.GetScener :TGLScener;
begin
     Result := RootNode as TGLScener;
end;

//------------------------------------------------------------------------------

function TGLNode.GetRelaPose :TSingleM4;
begin
     Result := _RelaPose;
end;

procedure TGLNode.SetRelaPose( const RelaPose_:TSingleM4 );
begin
     _RelaPose := RelaPose_;

     RunFamily( procedure( const Node_:TTreeNode )
     begin
          ( Node_ as TGLNode ).upAbsoPose := True;
     end );
end;

//------------------------------------------------------------------------------

procedure TGLNode.CalAbsoPose;
begin
     if upAbsoPose then
     begin
          _AbsoPose[ 0 ] := Paren.AbsoPose * _RelaPose;

          upAbsoPose := False;
     end;
end;

function TGLNode.GetAbsoPose :TSingleM4;
begin
     CalAbsoPose;

     Result := _AbsoPose[ 0 ];
end;

procedure TGLNode.SetAbsoPose( const AbsoPose_:TSingleM4 );
begin
     RelaPose := Paren.AbsoPose.Inverse * AbsoPose_;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLNode.BeginDraw;
begin
     CalAbsoPose;

     _AbsoPose.Use( 3{BinP} );
end;

procedure TGLNode.DrawMain;
begin

end;

procedure TGLNode.EndDraw;
begin
     _AbsoPose.Unuse( 3{BinP} );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLNode.Create;
begin
     inherited;

     _AbsoPose := TGLUnifor<TSingleM4>.Create( GL_DYNAMIC_DRAW );
     _AbsoPose.Count := 1;

     RelaPose := TSingleM4.Identify;

     _Visible := True;
end;

destructor TGLNode.Destroy;
begin
     _AbsoPose.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLNode.Draw;
var
   I :Integer;
begin
     if _Visible then
     begin
          BeginDraw;

            DrawMain;

          EndDraw;

          for I := 0 to ChildsN-1 do Childs[ I ].Draw;
     end;
end;

//------------------------------------------------------------------------------

procedure TGLNode.CalcBouBox;
begin
     _BouBox := TSingleArea3D.NeMax;
end;

//------------------------------------------------------------------------------

function TGLNode.HitBouBox( const AbsoRay_:TSingleRay3D ) :TSingleArea;
//······································
     procedure Slab( const Min_,Max_,Pos_,Vec_:Single );
     var
        T0, T1 :Single;
     begin
          T0 := ( Min_ - Pos_ ) / Vec_;
          T1 := ( Max_ - Pos_ ) / Vec_;

          with Result do
          begin
               if Min < T0 then Min := T0;
               if T1 < Max then Max := T1;
          end;
     end;
//······································
var
   R :TSingleRay3D;
begin
     Result := TSingleArea.PoMax;

     R := AbsoPose.Inverse * AbsoRay_;

     with R, _BouBox do
     begin
          if Vec.X > 0 then Slab( Min.X, Max.X, Pos.X, Vec.X )
                       else
          if Vec.X < 0 then Slab( Max.X, Min.X, Pos.X, Vec.X );

          if Vec.Y > 0 then Slab( Min.Y, Max.Y, Pos.Y, Vec.Y )
                       else
          if Vec.Y < 0 then Slab( Max.Y, Min.Y, Pos.Y, Vec.Y );

          if Vec.Z > 0 then Slab( Min.Z, Max.Z, Pos.Z, Vec.Z )
                       else
          if Vec.Z < 0 then Slab( Max.Z, Min.Z, Pos.Z, Vec.Z );
     end;
end;

procedure TGLNode.HitRay( const AbsoRay_:TSingleRay3D; var Len_:Single; var Obj_:TGLNode );
var
   L :TSingleArea;
   I :Integer;
begin
     L := HitBouBox( AbsoRay_ );

     if L.Min <= L.Max then
     begin
          if L.Min < Len_ then
          begin
               Len_ := L.Min;
               Obj_ := Self;
          end;
     end;

     for I := 0 to ChildsN-1 do Childs[ I ].HitRay( AbsoRay_, Len_, Obj_ );
end;

function TGLNode.HitRay( const AbsoRay_:TSingleRay3D ) :TGLNode;
var
   L :Single;
begin
     L      := Single.MaxValue;
     Result := nil;

     HitRay( AbsoRay_, L, Result );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLScener

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLScener.GetRelaPose :TSingleM4;
begin
     Result := TSingleM4.Identify;
end;

procedure TGLScener.SetRelaPose( const RelaPose_:TSingleM4 );
begin

end;

function TGLScener.GetAbsoPose :TSingleM4;
begin
     Result := TSingleM4.Identify;
end;

procedure TGLScener.SetAbsoPose( const AbsoPose_:TSingleM4 );
begin

end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLScener.BeginDraw;
begin

end;

procedure TGLScener.DrawMain;
begin

end;

procedure TGLScener.EndDraw;
begin

end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLScener.Create;
begin
     inherited;

end;

destructor TGLScener.Destroy;
begin

     inherited;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
