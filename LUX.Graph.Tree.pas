unit LUX.Graph.Tree;

interface //#################################################################### ■

uses LUX, LUX.Graph;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTreeNode

     TTreeNode = class( TNode )
     private
       _UpdateL :Byte;
       ///// メソッド
       procedure AddChild( const Child_:TTreeNode );
       procedure DelChild( const I_:Integer );
       procedure ReduceChildren;
     protected
       _Parent    :TNodeLink<TTreeNode>;
       _Children  :TArray<TTreeNode>;
       _ChildrenN :Integer;
       ///// アクセス
       function GetParent :TTreeNode;
       procedure SetParent( const Parent_:TTreeNode );
       function GetOrder :Integer;
       function GetChildren( const I_:Integer ) :TTreeNode;
       procedure SetChildren( const I_:Integer; const Child_:TTreeNode );
     public
       constructor Create; overload;
       constructor Create( const Parent_:TTreeNode ); overload;
       procedure BeforeDestruction; override;
       destructor Destroy; override;
       ///// プロパティ
       property Parent                       :TTreeNode read GetParent   write SetParent  ;
       property Order                        :Integer   read GetOrder                     ;
       property Children[ const I_:Integer ] :TTreeNode read GetChildren write SetChildren; default;
       property ChildrenN                    :Integer   read _ChildrenN                   ;
       ///// メソッド
       procedure BeginUpdate;
       procedure EndUpdate;
       procedure DeleteChildren;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTreeNode

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// メソッド

procedure TTreeNode.AddChild( const Child_:TTreeNode );
begin
     _Children := _Children + [ Child_ ];

     Child_._Parent := TNodeLink<TTreeNode>.Create( Self, _ChildrenN );

     Inc( _ChildrenN );
end;

procedure TTreeNode.DelChild( const I_:Integer );
begin
     _Children[ I_ ]._Parent := nil;

     _Children[ I_ ] := nil;

     if _UpdateL = 0 then ReduceChildren;
end;

procedure TTreeNode.ReduceChildren;
var
   P :TTreeNode;
begin
     _ChildrenN := 0;

     for P in _Children do
     begin
          if Assigned( P ) then
          begin
               _Children[ _ChildrenN ] := P;

               P._Parent.i := _ChildrenN;

               Inc( _ChildrenN );
          end;
     end;

     SetLength( _Children, _ChildrenN );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TTreeNode.GetParent :TTreeNode;
begin
     Result := _Parent;
end;

procedure TTreeNode.SetParent( const Parent_:TTreeNode );
begin
     with _Parent do
     begin
          if Assigned( o ) then o.DelChild( i );
     end;

     if Assigned( Parent_ ) then Parent_.AddChild( Self );
end;

function TTreeNode.GetOrder :Integer;
begin
     Result := _Parent.i;
end;

function TTreeNode.GetChildren( const I_:Integer ) :TTreeNode;
begin
     Result := _Children[ I_ ];
end;

procedure TTreeNode.SetChildren( const I_:Integer; const Child_:TTreeNode );
begin
     if Assigned( _Children[ I_ ] ) then _Children[ I_ ]._Parent := nil;

                  _Children[ I_ ] := Child_;

     if Assigned( _Children[ I_ ] ) then _Children[ I_ ]._Parent := TNodeLink<TTreeNode>.Create( Self, I_ );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TTreeNode.Create;
begin
     inherited;

     _Parent    := nil;
     _Children  := [];
     _ChildrenN := 0;
end;

constructor TTreeNode.Create( const Parent_:TTreeNode );
begin
     inherited Create;

     _Children  := [];
     _ChildrenN := 0;

     Parent_.AddChild( Self );
end;

procedure TTreeNode.BeforeDestruction;
begin
     with _Parent do
     begin
          if Assigned( o ) then o.DelChild( i );
     end;

     DeleteChildren;

     inherited;
end;

destructor TTreeNode.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TTreeNode.BeginUpdate;
begin
     Inc( _UpdateL );
end;

procedure TTreeNode.EndUpdate;
begin
     Dec( _UpdateL );

     if _UpdateL = 0 then ReduceChildren;
end;

procedure TTreeNode.DeleteChildren;
var
   C :TTreeNode;
begin
     BeginUpdate;

     for C in _Children do C.Free;

     EndUpdate;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
