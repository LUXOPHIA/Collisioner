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
       ///// メソッド
       procedure JoinParen;
       procedure LeavParen;
     protected
       _Paren   :TTreeNode;
       _Order   :Integer;
       _Childs  :TRangeArray<TTreeNode>;
       _ChildsN :Integer;
       _OrderOK :Integer;
       ///// アクセス
       function GetParen :TTreeNode;
       procedure SetParen( const Paren_:TTreeNode );
       function GetOrder :Integer;
       procedure SetOrder( const Paren_:Integer );
       function GetCacheOK :Boolean;
       function GetChilds( const I_:Integer ) :TTreeNode;
       procedure SetChilds( const I_:Integer; const Child_:TTreeNode );
       function GetZero :TTreeNode;
       function GetHead :TTreeNode;
       function GetTail :TTreeNode;
       ///// メソッド
       procedure IncChildsN( const N_:Integer );
       procedure FindTo( const Child_:TTreeNode ); overload;
       procedure FindTo( const Order_:Integer   ); overload;
     public
       constructor Create( const Parent_:TTreeNode = nil );
       destructor Destroy; override;
       ///// プロパティ
       property Paren                      :TTreeNode read GetParen   write SetParen ;
       property Order                      :Integer   read GetOrder   write SetOrder ;
       property CacheOK                    :Boolean   read GetCacheOK                ;
       property Childs[ const I_:Integer ] :TTreeNode read GetChilds  write SetChilds; default;
       property ChildsN                    :Integer   read   _ChildsN                ;
       property Zero                       :TTreeNode read GetZero                   ;
       property Head                       :TTreeNode read GetHead                   ;
       property Tail                       :TTreeNode read GetTail                   ;
       ///// メソッド
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

/////////////////////////////////////////////////////////////////////// メソッド

procedure TTreeNode.JoinParen;
var
   P0, P1, P2 :TTreeNode;
begin
     if Assigned( _Paren ) then
     begin
          P2 := _Paren._Childs[ -1 ];
          P1 := Self;
          P0 := P2._Prev;

          P0._Next := P1;
          P1._Prev := P0;
          P1._Next := P2;
          P2._Prev := P1;

          _Order := _Paren._ChildsN;

          _Paren.IncChildsN( +1 );
     end;
end;

procedure TTreeNode.LeavParen;
var
   P0, P1, P2 :TTreeNode;
begin
     if Assigned( _Paren ) then
     begin
          P0 := _Prev;
          P1 := Self;
          P2 := _Next;

          P0._Next := P2;  P1._Prev := P1;
          P2._Prev := P0;  P1._Next := P1;

          if CacheOK then _Paren._OrderOK := _Order - 1;

          _Paren.IncChildsN( -1 );

          _Paren := nil;
          _Order := -1;
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TTreeNode.GetParen :TTreeNode;
begin
     Result := _Paren;
end;

procedure TTreeNode.SetParen( const Paren_:TTreeNode );
begin
     LeavParen;

     _Paren := Paren_;

     JoinParen;
end;

function TTreeNode.GetOrder :Integer;
begin
     if Assigned( _Paren ) then
     begin
          if not CacheOK then _Paren.FindTo( Self );
     end;

     Result := _Order;
end;

procedure TTreeNode.SetOrder( const Paren_:Integer );
begin
     { ToDo }
end;

function TTreeNode.GetCacheOK :Boolean;
begin
     Result := ( _Order >= 0 )
           and ( _Order <= _Paren._OrderOK )
           and ( _Paren._Childs[ _Order ] = Self );
end;

function TTreeNode.GetChilds( const I_:Integer ) :TTreeNode;
begin
     if I_ > _OrderOK then FindTo( I_ );

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

procedure TTreeNode.IncChildsN( const N_:Integer );
begin
     Inc( _ChildsN, N_ );

     _Childs.MaxI := _ChildsN - 1;
end;

procedure TTreeNode.FindTo( const Child_:TTreeNode );
var
   P :TTreeNode;
begin
     P := _Childs[ _OrderOK ];

     repeat
           P := P._Next;

           Inc( _OrderOK );

           _Childs[ _OrderOK ] := P;  P._Order := _OrderOK;

     until P = Child_;
end;

procedure TTreeNode.FindTo( const Order_:Integer );
var
   P :TTreeNode;
   I :Integer;
begin
     P := _Childs[ _OrderOK ];

     for I := _OrderOK + 1 to Order_ do
     begin
           P := P._Next;

           _Childs[ I ] := P;  P._Order := I;
     end;

     _OrderOK := Order_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TTreeNode.Create( const Parent_:TTreeNode = nil );
begin
     inherited Create;

     _Paren   := Parent_;
     _Order   := -1;

     _Childs.SetRange( -1 );
     _ChildsN := 0;

     _Childs[ -1 ] := TTreeNode( TTreeItem.Create );

     _OrderOK := -1;

     JoinParen;
end;

destructor TTreeNode.Destroy;
begin
     LeavParen;

     DeleteChilds;

     Zero.Free;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

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
