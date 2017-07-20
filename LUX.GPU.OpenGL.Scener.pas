unit LUX.GPU.OpenGL.Scener;

interface //#################################################################### ■

uses System.Generics.Collections,
     Winapi.OpenGL, Winapi.OpenGLext,
     LUX, LUX.D2, LUX.D3, LUX.M4, LUX.Tree,
     LUX.GPU.OpenGL,
     LUX.GPU.OpenGL.Buffer.Unifor;

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
       property Scener   :TGLScener read GetScener                    ;
       property RelaPose :TSingleM4 read GetRelaPose write SetRelaPose;
       property AbsoPose :TSingleM4 read GetAbsoPose write SetAbsoPose;
       ///// メソッド
       procedure Draw; virtual;
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
     BeginDraw;

       DrawMain;

     EndDraw;

     for I := 0 to ChildsN-1 do Childs[ I ].Draw;
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
