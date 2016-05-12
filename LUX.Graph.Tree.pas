unit LUX.Graph.Tree;

interface //#################################################################### ■

uses LUX, LUX.Graph;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     TTreeItem = class;
     TTreeNode = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTreeNodeZero

     TTreeItem = class( TNode )
     private
     protected
       _Prev :TTreeNode;
       _Next :TTreeNode;
     public
       constructor Create;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTreeNode

     TTreeNode = class( TTreeItem )
     private
     protected
       _Paren    :TTreeNode;
       _Order    :Integer;
       _Childs   :TRangeArray<TTreeNode>;
       _ChildsN  :Integer;
       _OrderMax :Integer;
       ///// アクセス
       function GetParen :TTreeNode;
       procedure SetParen( const Paren_:TTreeNode );
       function GetOrder :Integer;
       procedure SetOrder( const Paren_:Integer );
       function GetIsOrdered :Boolean;
       function GetChilds( const I_:Integer ) :TTreeNode;
       procedure SetChilds( const I_:Integer; const Child_:TTreeNode );
       function GetZero :TTreeNode;
       function GetHead :TTreeNode;
       function GetTail :TTreeNode;
       ///// メソッド
       procedure FindTo( const Child_:TTreeNode ); overload;
       procedure FindTo( const Order_:Integer   ); overload;
     public
       constructor Create; overload;
       constructor Create( const Parent_:TTreeNode ); overload;
       destructor Destroy; override;
       ///// プロパティ
       property Paren                      :TTreeNode read GetParen   write SetParen ;
       property Order                      :Integer   read GetOrder   write SetOrder ;
       property IsOrdered                  :Boolean   read GetIsOrdered              ;
       property Childs[ const I_:Integer ] :TTreeNode read GetChilds  write SetChilds; default;
       property ChildsN                    :Integer   read   _ChildsN                ;
       property Zero                       :TTreeNode read GetZero                   ;
       property Head                       :TTreeNode read GetHead                   ;
       property Tail                       :TTreeNode read GetTail                   ;
       ///// メソッド
       procedure JoinChild( const Child_:TTreeNode );
       procedure LeavChild( const Child_:TTreeNode );
       procedure DeleteChilds;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTreeItem

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TTreeItem.Create;
begin
     inherited;

     _Prev := TTreeNode( Self );
     _Next := TTreeNode( Self );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTreeNode

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TTreeNode.GetParen :TTreeNode;
begin
     Result := _Paren;
end;

procedure TTreeNode.SetParen( const Paren_:TTreeNode );
begin
     if Assigned( _Paren ) then _Paren.LeavChild( Self );

     if Assigned( Paren_ ) then Paren_.JoinChild( Self );
end;

function TTreeNode.GetOrder :Integer;
begin
     if not IsOrdered then _Paren.FindTo( Self );

     Result := _Order;
end;

procedure TTreeNode.SetOrder( const Paren_:Integer );
begin
     { ToDo }
end;

function TTreeNode.GetIsOrdered :Boolean;
begin
     Result := ( _Order <= _Paren._OrderMax )
           and ( _Paren._Childs[ _Order ] = Self );
end;

function TTreeNode.GetChilds( const I_:Integer ) :TTreeNode;
begin
     if I_ > _OrderMax then FindTo( I_ );

     Result := _Childs[ I_ ];
end;

procedure TTreeNode.SetChilds( const I_:Integer; const Child_:TTreeNode );
begin
     { ToDo }
end;

function TTreeNode.GetZero :TTreeNode;
begin
     Result := _Childs[ -1 ];
end;

function TTreeNode.GetHead :TTreeNode;
begin
     Result := Zero._Next;
end;

function TTreeNode.GetTail :TTreeNode;
begin
     Result := Zero._Prev;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TTreeNode.FindTo( const Child_:TTreeNode );
var
   P :TTreeNode;
begin
     if _ChildsN-1 > _Childs.MaxI then _Childs.MaxI := _ChildsN-1;

     P := _Childs[ _OrderMax ];

     repeat
           P := P._Next;

           Inc( _OrderMax );

           _Childs[ _OrderMax ] := P;  P._Order := _OrderMax;

     until P = Child_;
end;

procedure TTreeNode.FindTo( const Order_:Integer );
var
   P :TTreeNode;
   I :Integer;
begin
     if _ChildsN-1 > _Childs.MaxI then _Childs.MaxI := _ChildsN-1;

     P := _Childs[ _OrderMax ];

     for I := _OrderMax + 1 to Order_ do
     begin
           P := P._Next;

           _Childs[ I ] := P;  P._Order := I;
     end;

     _OrderMax := Order_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TTreeNode.Create;
begin
     inherited;

     _Paren := nil;

     _Childs.SetRange( -1 );
     _ChildsN := 0;

     _Childs[ -1 ] := TTreeNode( TTreeItem.Create );

     _OrderMax := -1;
end;

constructor TTreeNode.Create( const Parent_:TTreeNode );
begin
     Create;

     Parent_.JoinChild( Self );
end;

destructor TTreeNode.Destroy;
begin
     if Assigned( _Paren ) then _Paren.LeavChild( Self );

     DeleteChilds;

     Zero.Free;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TTreeNode.JoinChild( const Child_:TTreeNode );
var
   P0, P1, P2 :TTreeNode;
begin
     P0 := Tail;
     P1 := Child_;
     P2 := Zero;

     P0._Next := P1;
     P1._Prev := P0;
     P1._Next := P2;
     P2._Prev := P1;

     P1._Paren := Self;

     Inc( _ChildsN );
end;

procedure TTreeNode.LeavChild( const Child_:TTreeNode );
var
   P0, P1, P2 :TTreeNode;
begin
     P0 := Child_._Prev;
     P1 := Child_      ;
     P2 := Child_._Next;

     P0._Next := P2;  P1._Prev := P1;
     P2._Prev := P0;  P1._Next := P1;

     if P1.IsOrdered then _OrderMax := P1._Order-1;

     P1._Paren := nil;

     Dec( _ChildsN );

     if _ChildsN * 2 < _Childs.MaxI+1 then _Childs.MaxI := _ChildsN-1;
end;

procedure TTreeNode.DeleteChilds;
var
   N :Integer;
begin
     for N := 1 to _ChildsN do Tail.Free;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
