unit LUX.Graph.Tree;

interface //#################################################################### ■

uses LUX, LUX.Graph;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     TTreeItem                = class;
     TTreeNode                = class;
     TTreeNode<_TNode_:class> = class;

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
       ///// アクセス
       function GetZero :TTreeNode;
       procedure SetZero( const Zero_:TTreeNode );
       function GetIsOrdered :Boolean;
       ///// メソッド
       class procedure Bind( const C0_,C1_:TTreeNode ); overload; inline;
       class procedure Bind( const C0_,C1_,C2_:TTreeNode ); overload; inline;
       class procedure Bind( const C0_,C1_,C2_,C3_:TTreeNode ); overload; inline;
     protected
       _Paren    :TTreeNode;
       _Order    :Integer;
       _Childs   :TMarginArray<TTreeNode>;
       _ChildsN  :Integer;
       _MaxOrder :Integer;
       ///// アクセス
       function GetParen :TTreeNode;
       procedure SetParen( const Paren_:TTreeNode );
       function GetOrder :Integer;
       procedure SetOrder( const Order_:Integer );
       function GetHead :TTreeNode;
       function GetTail :TTreeNode;
       function GetChilds( const I_:Integer ) :TTreeNode;
       procedure SetChilds( const I_:Integer; const Child_:TTreeNode );
       ///// プロパティ
       property Zero      :TTreeNode read GetZero      write SetZero;
       property IsOrdered :Boolean   read GetIsOrdered              ;
       ///// メソッド
       procedure FindTo( const Child_:TTreeNode ); overload;
       procedure FindTo( const Order_:Integer   ); overload;
       procedure _Insert( const C0_,C1_,C2_:TTreeNode );
       procedure _Remove;
       procedure _InsertHead( const Child_:TTreeNode );
       procedure _InsertTail( const Child_:TTreeNode );
       procedure _InsertPrev( const Sibli_:TTreeNode );
       procedure _InsertNext( const Sibli_:TTreeNode );
     public
       constructor Create; overload; virtual;
       constructor Create( const Paren_:TTreeNode ); overload; virtual;
       destructor Destroy; override;
       ///// プロパティ
       property Paren                      :TTreeNode read GetParen   write SetParen ;
       property Order                      :Integer   read GetOrder   write SetOrder ;
       property Head                       :TTreeNode read GetHead                   ;
       property Tail                       :TTreeNode read GetTail                   ;
       property Childs[ const I_:Integer ] :TTreeNode read GetChilds  write SetChilds; default;
       property ChildsN                    :Integer   read   _ChildsN                ;
       ///// メソッド
       procedure Remove;
       class procedure RemoveChild( const Child_:TTreeNode );
       procedure DeleteChilds;
       procedure InsertHead( const Child_:TTreeNode );
       procedure InsertTail( const Child_:TTreeNode );
       procedure InsertPrev( const Sibli_:TTreeNode );
       procedure InsertNext( const Sibli_:TTreeNode );
       class procedure Swap( const C1_,C2_:TTreeNode ); overload;
       procedure Swap( const I1_,I2_:Integer ); overload;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTreeNode<_TNode_>

     TTreeNode<_TNode_:class> = class( TTreeNode )
     private
     protected
       ///// アクセス
       function GetParen :_TNode_; reintroduce;
       procedure SetParen( const Paren_:_TNode_ ); reintroduce;
       function GetHead :_TNode_; reintroduce;
       function GetTail :_TNode_; reintroduce;
       function GetChilds( const I_:Integer ) :_TNode_; reintroduce;
       procedure SetChilds( const I_:Integer; const Child_:_TNode_ ); reintroduce;
     public
       ///// プロパティ
       property Paren                      :_TNode_ read GetParen  write SetParen ;
       property Head                       :_TNode_ read GetHead                  ;
       property Tail                       :_TNode_ read GetTail                  ;
       property Childs[ const I_:Integer ] :_TNode_ read GetChilds write SetChilds; default;
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

/////////////////////////////////////////////////////////////////////// アクセス

function TTreeNode.GetZero :TTreeNode;
begin
     Result := _Childs[ -1 ];
end;

procedure TTreeNode.SetZero( const Zero_:TTreeNode );
begin
     _Childs[ -1 ] := Zero_;
end;

//------------------------------------------------------------------------------

function TTreeNode.GetIsOrdered :Boolean;
begin
     Result := ( _Order <= _Paren._MaxOrder )
           and ( _Paren._Childs[ _Order ] = Self );
end;

/////////////////////////////////////////////////////////////////////// メソッド

class procedure TTreeNode.Bind( const C0_,C1_:TTreeNode );
begin
     C0_._Next := C1_;
     C1_._Prev := C0_;
end;

class procedure TTreeNode.Bind( const C0_,C1_,C2_:TTreeNode );
begin
     Bind( C0_, C1_ );
     Bind( C1_, C2_ );
end;

class procedure TTreeNode.Bind( const C0_,C1_,C2_,C3_:TTreeNode );
begin
     Bind( C0_, C1_ );
     Bind( C1_, C2_ );
     Bind( C2_, C3_ );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TTreeNode.GetParen :TTreeNode;
begin
     Result := _Paren;
end;

procedure TTreeNode.SetParen( const Paren_:TTreeNode );
begin
     Remove;

     if Assigned( Paren_ ) then Paren_._InsertTail( Self );
end;

//------------------------------------------------------------------------------

function TTreeNode.GetOrder :Integer;
begin
     if not IsOrdered then _Paren.FindTo( Self );

     Result := _Order;
end;

procedure TTreeNode.SetOrder( const Order_:Integer );
begin
     Swap( Self, _Paren.Childs[ Order_ ] );
end;

//------------------------------------------------------------------------------

function TTreeNode.GetHead :TTreeNode;
begin
     Result := Zero._Next;
end;

function TTreeNode.GetTail :TTreeNode;
begin
     Result := Zero._Prev;
end;

//------------------------------------------------------------------------------

function TTreeNode.GetChilds( const I_:Integer ) :TTreeNode;
begin
     if I_ > _MaxOrder then FindTo( I_ );

     Result := _Childs[ I_ ];
end;

procedure TTreeNode.SetChilds( const I_:Integer; const Child_:TTreeNode );
var
   S :TTreeNode;
begin
     with Childs[ I_ ] do
     begin
          S := Childs[ I_ ]._Prev;

          Remove;
     end;

     S.InsertNext( Child_ );
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TTreeNode.FindTo( const Child_:TTreeNode );
var
   P :TTreeNode;
begin
     if _ChildsN > _Childs.Count then _Childs.Count := _ChildsN;

     P := _Childs[ _MaxOrder ];

     repeat
           P := P._Next;

           Inc( _MaxOrder );

           _Childs[ _MaxOrder ] := P;  P._Order := _MaxOrder;

     until P = Child_;
end;

procedure TTreeNode.FindTo( const Order_:Integer );
var
   P :TTreeNode;
   I :Integer;
begin
     if _ChildsN > _Childs.Count then _Childs.Count := _ChildsN;

     P := _Childs[ _MaxOrder ];

     for I := _MaxOrder + 1 to Order_ do
     begin
           P := P._Next;

           _Childs[ I ] := P;  P._Order := I;
     end;

     _MaxOrder := Order_;
end;

//------------------------------------------------------------------------------

procedure TTreeNode._Insert( const C0_,C1_,C2_:TTreeNode );
begin
     C1_._Paren := Self;

     Bind( C0_, C1_, C2_ );

     Inc( _ChildsN );
end;

procedure TTreeNode._Remove;
begin
     Bind( _Prev, _Next );

     if IsOrdered then _Paren._MaxOrder := _Order - 1;

     with _Paren do
     begin
          Dec( _ChildsN );

          if _ChildsN * 2 < _Childs.Count then _Childs.Count := _ChildsN;
     end;

     _Paren := nil;  _Order := -1;
end;

//------------------------------------------------------------------------------

procedure TTreeNode._InsertHead( const Child_:TTreeNode );
begin
     _Insert( Zero, Child_, Head );

     _MaxOrder := -1;  { if Head.IsOrdered then _MaxOrder := Head._Order - 1; }
end;

procedure TTreeNode._InsertTail( const Child_:TTreeNode );
begin
     _Insert( Tail, Child_, Zero );

     { if Tail.IsOrdered then _MaxOrder := Tail._Order; }
end;

procedure TTreeNode._InsertPrev( const Sibli_:TTreeNode );
begin
     _Paren._Insert( _Prev, Sibli_, Self );

     if IsOrdered then _Paren._MaxOrder := _Order - 1;
end;

procedure TTreeNode._InsertNext( const Sibli_:TTreeNode );
begin
     _Paren._Insert( Self, Sibli_, _Next );

     if IsOrdered then _Paren._MaxOrder := _Order;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TTreeNode.Create;
begin
     inherited;

     _Paren := nil;  _Order := -1;

     _ChildsN := 0;

     _Childs := TMarginArray<TTreeNode>.Create( 1, _ChildsN, 0 );

     Zero := TTreeNode( TTreeItem.Create );

     _MaxOrder := -1;
end;

constructor TTreeNode.Create( const Paren_:TTreeNode );
begin
     Create;

     Paren_._InsertTail( Self );
end;

destructor TTreeNode.Destroy;
begin
     Remove;

     DeleteChilds;

     Zero.Free;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TTreeNode.Remove;
begin
     if Assigned( _Paren ) then _Remove;
end;

class procedure TTreeNode.RemoveChild( const Child_:TTreeNode );
begin
     Child_.Remove;
end;

//------------------------------------------------------------------------------

procedure TTreeNode.DeleteChilds;
var
   N :Integer;
begin
     for N := 1 to _ChildsN do Tail.Free;
end;

//------------------------------------------------------------------------------

procedure TTreeNode.InsertHead( const Child_:TTreeNode );
begin
     Child_.Remove;  _InsertHead( Child_ );
end;

procedure TTreeNode.InsertTail( const Child_:TTreeNode );
begin
     Child_.Remove;  _InsertTail( Child_ );
end;

procedure TTreeNode.InsertPrev( const Sibli_:TTreeNode );
begin
     Sibli_.Remove;  _InsertPrev( Sibli_ );
end;

procedure TTreeNode.InsertNext( const Sibli_:TTreeNode );
begin
     Sibli_.Remove;  _InsertNext( Sibli_ );
end;

//------------------------------------------------------------------------------

class procedure TTreeNode.Swap( const C1_,C2_:TTreeNode );
var
   P1, P2,
   C1n, C1u,
   C2n, C2u :TTreeNode;
   B1, B2 :Boolean;
   I1, I2 :Integer;
begin
     with C1_ do
     begin
          P1 := _Paren    ;
          B1 :=  IsOrdered;
          I1 := _Order    ;

          C1n := _Prev;
          C1u := _Next;
     end;

     with C2_ do
     begin
          P2 := _Paren    ;
          B2 :=  IsOrdered;
          I2 := _Order    ;

          C2n := _Prev;
          C2u := _Next;
     end;

     C1_._Paren := P2;
     C2_._Paren := P1;

     if C1_ = C2n then Bind( C1n, C2_, C1_, C2u )
     else
     if C1_ = C2u then Bind( C2n, C1_, C2_, C1u )
     else
     begin
          Bind( C1n, C2_, C1u );
          Bind( C2n, C1_, C2u );
     end;

     if B1 then
     begin
          P1._Childs[ I1 ] := C2_;  C2_._Order := I1;
     end;

     if B2 then
     begin
          P2._Childs[ I2 ] := C1_;  C1_._Order := I2;
     end;
end;

procedure TTreeNode.Swap( const I1_,I2_:Integer );
begin
     Swap( Childs[ I1_ ], Childs[ I2_ ] );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTreeNode<_TNode_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TTreeNode<_TNode_>.GetParen :_TNode_;
begin
     Result := _TNode_( inherited GetParen );
end;

procedure TTreeNode<_TNode_>.SetParen( const Paren_:_TNode_ );
begin
     inherited SetParen( TTreeNode( Paren_ ) );
end;

//------------------------------------------------------------------------------

function TTreeNode<_TNode_>.GetHead :_TNode_;
begin
     Result := _TNode_( inherited GetHead );
end;

function TTreeNode<_TNode_>.GetTail :_TNode_;
begin
     Result := _TNode_( inherited GetTail );
end;

//------------------------------------------------------------------------------

function TTreeNode<_TNode_>.GetChilds( const I_:Integer ) :_TNode_;
begin
     Result := _TNode_( inherited GetChilds( I_ ) );
end;

procedure TTreeNode<_TNode_>.SetChilds( const I_:Integer; const Child_:_TNode_ );
begin
     inherited SetChilds( I_, TTreeNode( Child_ ) );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
