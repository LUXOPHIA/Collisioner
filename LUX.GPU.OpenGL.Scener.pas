unit LUX.GPU.OpenGL.Scener;

interface //#################################################################### ■

uses System.Generics.Collections,
     Winapi.OpenGL, Winapi.OpenGLext,
     LUX, LUX.D2, LUX.D3, LUX.M4, LUX.Tree,
     LUX.GPU.OpenGL,
     LUX.GPU.OpenGL.Buffer,
     LUX.GPU.OpenGL.Buffer.Unif,
     LUX.GPU.OpenGL.Buffer.Vert,
     LUX.GPU.OpenGL.Buffer.Elem,
     LUX.GPU.OpenGL.Matery;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     TGLScener = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     TCameraDat = record
     private
     public
       Proj :TSingleM4;
       Move :TSingleM4;
     end;

     TNodeDat = record
     private
     public
       Move :TSingleM4;
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLNode

     IGLNode = interface
     ['{049DB60C-9F5D-45B9-89D8-E4AC58C807E3}']
     {protected}
       ///// アクセス
       function GetScener :TGLScener;
       function GetMove :TSingleM4;
       procedure SetMove( const Move_:TSingleM4 );
     {public}
       ///// プロパティ
       property Scener :TGLScener read GetScener              ;
       property Move   :TSingleM4 read GetMove   write SetMove;
       ///// メソッド
       procedure RegBuf;
       procedure Draw;
     end;

     TGLNode = class( TTreeNode<TGLNode>, IGLNode )
     private
     protected
       _Move :TSingleM4;
       ///// アクセス
       function GetScener :TGLScener;
       function GetNodI :Integer;
       function GetMove :TSingleM4;
       procedure SetMove( const Move_:TSingleM4 ); virtual;
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       property Scener :TGLScener read GetScener              ;
       property NodI   :Integer   read GetNodI                ;
       property Move   :TSingleM4 read GetMove   write SetMove;
       ///// メソッド
       procedure RegBuf; virtual;
       procedure Draw; virtual;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLScener

     IGLCamera = interface( IGLNode )
     ['{648646AC-975D-464E-BD83-C39EA3EB4E1E}']
     {protected}
     {public}
       ///// メソッド
       procedure RegBuf;
     end;

     IGLShaper = interface( IGLNode )
     ['{8045CCEA-8FC4-4D0A-A6CE-A97FF6972A7F}']
     {protected}
     {public}
     end;

     IGLScener = interface( IGLNode )
     ['{600C6A00-B748-4A1B-A841-A7135257ABCA}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TGLScener = class( TGLNode, IGLScener )
     private
       _Cameras :TDictionary<IGLCamera,Integer>;
       _Nodes   :TDictionary<IGLNode,Integer>;
     protected
       _CameraUs :TGLBufferU<TCameraDat>;
       _NodeUs   :TGLBufferU<TNodeDat>;
       ///// メソッド
       procedure OnInsertChild( const Child_:TTreeNode ); override;
       procedure OnRemoveChild( const Child_:TTreeNode ); override;
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       property Cameras  :TDictionary<IGLCamera,Integer> read _Cameras ;
       property Nodes    :TDictionary<IGLNode,Integer>   read _Nodes   ;
       property CameraUs :TGLBufferU<TCameraDat>         read _CameraUs;
       property NodeUs   :TGLBufferU<TNodeDat>           read _NodeUs  ;
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

function TGLNode.GetNodI :Integer;
begin
     Result := Scener.Nodes[ Self ];
end;

function TGLNode.GetMove :TSingleM4;
begin
     Result := _Move;
end;

procedure TGLNode.SetMove( const Move_:TSingleM4 );
begin
     _Move := Move_;  RegBuf;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLNode.Create;
begin
     inherited;

end;

destructor TGLNode.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLNode.RegBuf;
var
   D :TNodeDat;
begin
     D.Move := _Move;

     Scener._NodeUs[ NodI ] := D;
end;

//------------------------------------------------------------------------------

procedure TGLNode.Draw;
var
   I :Integer;
begin
     for I := 0 to ChildsN-1 do Childs[ I ].Draw;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLScener

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLScener.OnInsertChild( const Child_:TTreeNode );
var
   C :IGLCamera;
   N :IGLNode;
begin
     if Child_ is TGLCamera then
     begin
          _Cameras.Add( Child_ as IGLCamera, _Cameras.Count );

          _CameraUs.Count := _Cameras.Count;

          for C in _Cameras.Keys do C.RegBuf;
     end;

     _Nodes.Add( Child_ as IGLNode, _Nodes.Count );

     _NodeUs.Count := _Nodes.Count;

     for N in _Nodes.Keys do N.RegBuf;

     inherited;
end;

procedure TGLScener.OnRemoveChild( const Child_:TTreeNode );
begin
     if Child_ is TGLCamera then _Cameras.Remove( Child_ as IGLCamera );

     _Nodes.Remove( Child_ as IGLNode );

     inherited;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLScener.Create;
begin
     inherited;

     _Cameras  := TDictionary<IGLCamera,Integer>.Create;
     _Nodes    := TDictionary<IGLNode,Integer>.Create;

     _CameraUs := TGLBufferU<TCameraDat>.Create( GL_DYNAMIC_DRAW );
     _NodeUs := TGLBufferU<TNodeDat>.Create( GL_DYNAMIC_DRAW );
end;

destructor TGLScener.Destroy;
begin
     _CameraUs.DisposeOf;
     _NodeUs.DisposeOf;

     _Cameras .DisposeOf;
     _Nodes   .DisposeOf;

     inherited;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
