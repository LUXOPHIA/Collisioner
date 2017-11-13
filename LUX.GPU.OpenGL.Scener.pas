unit LUX.GPU.OpenGL.Scener;

interface //#################################################################### ■

uses System.Generics.Collections,
     Winapi.OpenGL, Winapi.OpenGLext,
     LUX, LUX.D1, LUX.D2, LUX.D3, LUX.M4, LUX.Data.Tree,
     LUX.GPU.OpenGL,
     LUX.GPU.OpenGL.Atom.Buffer,
     LUX.GPU.OpenGL.Atom.Buffer.Unifor,
     LUX.GPU.OpenGL.Inform;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     IGLObject = interface;
     IGLCamera = interface;
     IGLShaper = interface;
     IGLScener = interface;

     TGLObject = class;
     TGLScener = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLObject

     IGLObject = interface
     ['{049DB60C-9F5D-45B9-89D8-E4AC58C807E3}']
     {protected}
       ///// アクセス
       function GetScener :TGLScener;
       function GetRelaPose :TSingleM4;
       procedure SetRelaPose( const RelaPose_:TSingleM4 );
       function GetAbsoPose :TSingleM4;
       procedure SetAbsoPose( const AbsoPose_:TSingleM4 );
       function GetBouBox :TSingleArea3D;
       procedure SetBouBox( const BouBox_:TSingleArea3D );
     {public}
       ///// プロパティ
       property Scener   :TGLScener     read GetScener                    ;
       property RelaPose :TSingleM4     read GetRelaPose write SetRelaPose;
       property AbsoPose :TSingleM4     read GetAbsoPose write SetAbsoPose;
       property BouBox   :TSingleArea3D read GetBouBox   write SetBouBox  ;
       ///// メソッド
       procedure BeginDraw;
       procedure DrawMain;
       procedure EndDraw;
       procedure Draw;
       procedure CalcBouBox;
       function HitBouBox( const AbsoRay_:TSingleRay3D; out Len_:TSingleArea ) :Boolean;
       procedure HitRay( const AbsoRay_:TSingleRay3D; var Len_:Single; var Obj_:TGLObject ); overload;
       function HitRay( const AbsoRay_:TSingleRay3D ) :TGLObject; overload;
     end;

     //-------------------------------------------------------------------------

     TGLObject = class( TTreeNode<TGLObject>, IGLObject )
     private
     protected
       _RelaPose :TSingleM4;
       _AbsoPose :TGLUnifor<TSingleM4>;  upAbsoPose :Boolean;
       _Visible  :Boolean;
       _HitTest  :Boolean;
       _Inform   :TGLInform;
       ///// アクセス
       function GetScener :TGLScener; virtual;
       function GetRelaPose :TSingleM4; virtual;
       procedure SetRelaPose( const RelaPose_:TSingleM4 ); virtual;
       procedure CalAbsoPose;
       function GetAbsoPose :TSingleM4; virtual;
       procedure SetAbsoPose( const AbsoPose_:TSingleM4 ); virtual;
       function GetBouBox :TSingleArea3D; virtual;
       procedure SetBouBox( const BouBox_:TSingleArea3D ); virtual;
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       property Scener   :TGLScener     read GetScener                    ;
       property     Pose :TSingleM4     read GetRelaPose write SetRelaPose;
       property RelaPose :TSingleM4     read GetRelaPose write SetRelaPose;
       property AbsoPose :TSingleM4     read GetAbsoPose write SetAbsoPose;
       property Visible  :Boolean       read   _Visible  write   _Visible ;
       property HitTest  :Boolean       read   _HitTest  write   _HitTest ;
       property Inform   :TGLInform     read   _Inform                    ;
       property BouBox   :TSingleArea3D read GetBouBox   write SetBouBox  ;
       ///// メソッド
       procedure BeginDraw; virtual;
       procedure DrawMain; virtual;
       procedure EndDraw; virtual;
       procedure Draw; virtual;
       procedure CalcBouBox; virtual;
       function HitBouBox( const AbsoRay_:TSingleRay3D; out Len_:TSingleArea ) :Boolean;
       procedure HitRay( const AbsoRay_:TSingleRay3D; var Len_:Single; var Obj_:TGLObject ); overload; virtual;
       function HitRay( const AbsoRay_:TSingleRay3D ) :TGLObject; overload;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLCamera

     IGLCamera = interface( IGLObject )
     ['{648646AC-975D-464E-BD83-C39EA3EB4E1E}']
     {protected}
     {public}
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaper

     IGLShaper = interface( IGLObject )
     ['{8045CCEA-8FC4-4D0A-A6CE-A97FF6972A7F}']
     {protected}
     {public}
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLScener

     IGLScener = interface( IGLObject )
     ['{600C6A00-B748-4A1B-A841-A7135257ABCA}']
     {protected}
     {public}
       ///// プロパティ
       property RelaPose :TSingleM4 read GetRelaPose;
       property AbsoPose :TSingleM4 read GetAbsoPose;
     end;

     //-------------------------------------------------------------------------

     TGLScener = class( TGLObject, IGLScener )
     private
     protected
       ///// アクセス
       function GetRelaPose :TSingleM4; override;
       procedure SetRelaPose( const RelaPose_:TSingleM4 ); override;
       function GetAbsoPose :TSingleM4; override;
       procedure SetAbsoPose( const AbsoPose_:TSingleM4 ); override;
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       property RelaPose :TSingleM4 read GetRelaPose;
       property AbsoPose :TSingleM4 read GetAbsoPose;
       ///// メソッド
       procedure BeginDraw; override;
       procedure DrawMain; override;
       procedure EndDraw; override;
       procedure HitRay( const AbsoRay_:TSingleRay3D; var Len_:Single; var Obj_:TGLObject ); override;
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

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLObject

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLObject.GetScener :TGLScener;
begin
     Result := RootNode as TGLScener;
end;

//------------------------------------------------------------------------------

function TGLObject.GetRelaPose :TSingleM4;
begin
     Result := _RelaPose;
end;

procedure TGLObject.SetRelaPose( const RelaPose_:TSingleM4 );
begin
     _RelaPose := RelaPose_;

     RunFamily( procedure( const Node_:TTreeNode )
     begin
          ( Node_ as TGLObject ).upAbsoPose := True;
     end );
end;

//------------------------------------------------------------------------------

procedure TGLObject.CalAbsoPose;
begin
     if upAbsoPose then
     begin
          _AbsoPose[ 0 ] := Paren.AbsoPose * _RelaPose;

          upAbsoPose := False;
     end;
end;

function TGLObject.GetAbsoPose :TSingleM4;
begin
     CalAbsoPose;

     Result := _AbsoPose[ 0 ];
end;

procedure TGLObject.SetAbsoPose( const AbsoPose_:TSingleM4 );
begin
     RelaPose := Paren.AbsoPose.Inverse * AbsoPose_;
end;

//------------------------------------------------------------------------------

function TGLObject.GetBouBox :TSingleArea3D;
begin
     Result := _Inform.BouBox;
end;

procedure TGLObject.SetBouBox( const BouBox_:TSingleArea3D );
begin
     _Inform.BouBox := BouBox_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLObject.Create;
begin
     inherited;

     _Inform := TGLInform.Create;

     _AbsoPose := TGLUnifor<TSingleM4>.Create( GL_DYNAMIC_DRAW );
     _AbsoPose.Count := 1;

     RelaPose := TSingleM4.Identity;

     _Visible := True;
     _HitTest := False;
end;

destructor TGLObject.Destroy;
begin
     _AbsoPose.DisposeOf;

     _Inform.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLObject.BeginDraw;
begin
     CalAbsoPose;

     _AbsoPose.Use( 3{BinP} );
end;

procedure TGLObject.DrawMain;
begin

end;

procedure TGLObject.EndDraw;
begin
     _Inform.Draw;

     _AbsoPose.Unuse( 3{BinP} );
end;

procedure TGLObject.Draw;
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

procedure TGLObject.CalcBouBox;
begin

end;

//------------------------------------------------------------------------------

function TGLObject.HitBouBox( const AbsoRay_:TSingleRay3D; out Len_:TSingleArea ) :Boolean;
//······································
     procedure Slab( const Min_,Max_,Pos_,Vec_:Single );
     var
        T0, T1 :Single;
     begin
          T0 := ( Min_ - Pos_ ) / Vec_;
          T1 := ( Max_ - Pos_ ) / Vec_;

          with Len_ do
          begin
               if Min < T0 then Min := T0;
               if T1 < Max then Max := T1;
          end;
     end;
//······································
var
   R :TSingleRay3D;
begin
     Result := False;

     if BouBox.Sign > 0 then
     begin
          Len_ := TSingleArea.PoMax;

          R := AbsoPose.Inverse * AbsoRay_;

          with R, BouBox do
          begin
               if Vec.X > 0 then Slab( Min.X, Max.X, Pos.X, Vec.X )
                            else
               if Vec.X < 0 then Slab( Max.X, Min.X, Pos.X, Vec.X )
                            else
               if ( Pos.X < Min.X ) or ( Max.X < Pos.X ) then Exit;

               if Vec.Y > 0 then Slab( Min.Y, Max.Y, Pos.Y, Vec.Y )
                            else
               if Vec.Y < 0 then Slab( Max.Y, Min.Y, Pos.Y, Vec.Y )
                            else
               if ( Pos.Y < Min.Y ) or ( Max.Y < Pos.Y ) then Exit;

               if Vec.Z > 0 then Slab( Min.Z, Max.Z, Pos.Z, Vec.Z )
                            else
               if Vec.Z < 0 then Slab( Max.Z, Min.Z, Pos.Z, Vec.Z )
                            else
               if ( Pos.Z < Min.Z ) or ( Max.Z < Pos.Z ) then Exit;
          end;

          Result := ( Len_.Min <= Len_.Max );
     end;
end;

procedure TGLObject.HitRay( const AbsoRay_:TSingleRay3D; var Len_:Single; var Obj_:TGLObject );
var
   L :TSingleArea;
   I :Integer;
begin
     if _Visible and _HitTest then
     begin
          if HitBouBox( AbsoRay_, L ) and ( L.Min < Len_ ) then
          begin
               Len_ := L.Min;
               Obj_ := Self;
          end;

          for I := 0 to ChildsN-1 do Childs[ I ].HitRay( AbsoRay_, Len_, Obj_ );
     end;
end;

function TGLObject.HitRay( const AbsoRay_:TSingleRay3D ) :TGLObject;
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
     Result := TSingleM4.Identity;
end;

procedure TGLScener.SetRelaPose( const RelaPose_:TSingleM4 );
begin

end;

function TGLScener.GetAbsoPose :TSingleM4;
begin
     Result := TSingleM4.Identity;
end;

procedure TGLScener.SetAbsoPose( const AbsoPose_:TSingleM4 );
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

procedure TGLScener.HitRay( const AbsoRay_:TSingleRay3D; var Len_:Single; var Obj_:TGLObject );
var
   I :Integer;
begin
     for I := 0 to ChildsN-1 do Childs[ I ].HitRay( AbsoRay_, Len_, Obj_ );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
