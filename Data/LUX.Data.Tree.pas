unit LUX.Data.Tree;

interface //#################################################################### ■

uses LUX;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     ITreeItem = interface;
     ITreeNode = interface;

     TTreeItem                          = class;
     TTreeNode                          = class;
     TTreeNode<_TParen_,_TChild_:class> = class;
     TTreeNode<_TNode_:class>           = class;
     TTreeRoot<_TChild_:class>          = class;
     TTreeLeaf<_TParen_:class>          = class;

     TNodeProc<_INode_:class> = reference to procedure( const Node_:_INode_ );

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTreeNodeZero

     ITreeItem = interface
     ['{0F225B2F-E767-4D72-B2A9-A3DCCBF7C5CD}']
     {protected}
       ///// アクセス
       function Get_Prev :TTreeNode;
       procedure Set_Prev( const Prev_:TTreeNode );
       function Get_Next :TTreeNode;
       procedure Set_Next( const Next_:TTreeNode );
     {public}
       ///// プロパティ
       property _Prev :TTreeNode read Get_Prev write Set_Prev;
       property _Next :TTreeNode read Get_Next write Set_Next;
     end;

     //-------------------------------------------------------------------------

     TTreeItem = class( TInterfacedBase, ITreeItem )
     private
     protected
       FPrev :ITreeItem;
       FNext :ITreeItem;
       ///// アクセス
       function Get_Prev :TTreeNode;
       procedure Set_Prev( const Prev_:TTreeNode );
       function Get_Next :TTreeNode;
       procedure Set_Next( const Next_:TTreeNode );
     public
       constructor Create;
       ///// プロパティ
       property _Prev :TTreeNode read Get_Prev write Set_Prev;
       property _Next :TTreeNode read Get_Next write Set_Next;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTreeNode

     ITreeNode = interface( ItreeItem )
     ['{FCBA5E54-3C4C-476D-A1AA-4FFF50586477}']
     {private}
       ///// アクセス
       function Get_Paren :TTreeNode;
       procedure Set_Paren( const Paren_:TTreeNode );
     {protected}
       ///// アクセス
       function GetParen :ITreeNode;
       procedure SetParen( const Paren_:ITreeNode );
       function GetOrder :Integer;
       procedure SetOrder( const Order_:Integer );
       function GetHead :ITreeNode;
       function GetTail :ITreeNode;
       function GetChilds( const I_:Integer ) :ITreeNode;
       procedure SetChilds( const I_:Integer; const Child_:ITreeNode );
       function GetChildsN :Integer;
       ///// プロパティ
       property _Paren :TTreeNode read Get_Paren write Set_Paren;
     {public}
       ///// プロパティ
       property Paren                      :ITreeNode read GetParen   write SetParen ;
       property Order                      :Integer   read GetOrder   write SetOrder ;
       property Head                       :ITreeNode read GetHead                   ;
       property Tail                       :ITreeNode read GetTail                   ;
       property Childs[ const I_:Integer ] :ITreeNode read GetChilds  write SetChilds; default;
       property ChildsN                    :Integer   read GetChildsN                ;
       ///// メソッド
       procedure Remove;
       //class procedure RemoveChild( const Child_:TTreeNode );
       procedure DeleteChilds;
       procedure InsertHead( const Child_:TTreeNode );
       procedure InsertTail( const Child_:TTreeNode );
       procedure InsertPrev( const Sibli_:TTreeNode );
       procedure InsertNext( const Sibli_:TTreeNode );
       //class procedure Swap( const C1_,C2_:TTreeNode );
       procedure Swap( const I1_,I2_:Integer );
       procedure RunFamily( const Proc_:TNodeProc<TTreeNode> );
     end;

     //-------------------------------------------------------------------------

     TTreeNode = class( TTreeItem, ITreeNode )
     private
       ///// アクセス
       function Get_Paren :TTreeNode;
       procedure Set_Paren( const Paren_:TTreeNode );
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
       function GetParen :ITreeNode;
       procedure SetParen( const Paren_:ITreeNode );
       function GetOrder :Integer;
       procedure SetOrder( const Order_:Integer );
       function GetHead :ITreeNode;
       function GetTail :ITreeNode;
       function GetChilds( const I_:Integer ) :ITreeNode;
       procedure SetChilds( const I_:Integer; const Child_:ITreeNode );
       function GetChildsN :Integer;
       function GetRootNode :TTreeNode;
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
       procedure OnInsertChild( const Child_:TTreeNode ); virtual;
       procedure OnRemoveChild( const Child_:TTreeNode ); virtual;
     public
       constructor Create; overload; virtual;
       constructor Create( const Paren_:ITreeNode ); overload; virtual;
       procedure BeforeDestruction; override;
       destructor Destroy; override;
       ///// プロパティ
       property Paren                      :ITreeNode read GetParen   write SetParen ;
       property Order                      :Integer   read GetOrder   write SetOrder ;
       property Head                       :ITreeNode read GetHead                   ;
       property Tail                       :ITreeNode read GetTail                   ;
       property Childs[ const I_:Integer ] :ITreeNode read GetChilds  write SetChilds; default;
       property ChildsN                    :Integer   read GetChildsN                ;
       property RootNode                   :TTreeNode read GetRootNode               ;
       ///// メソッド
       procedure Remove;
       class procedure RemoveChild( const Child_:TTreeNode );
       procedure DeleteChilds; virtual;
       procedure InsertHead( const Child_:TTreeNode );
       procedure InsertTail( const Child_:TTreeNode );
       procedure InsertPrev( const Sibli_:TTreeNode );
       procedure InsertNext( const Sibli_:TTreeNode );
       class procedure Swap( const C1_,C2_:TTreeNode ); overload;
       procedure Swap( const I1_,I2_:Integer ); overload;
       procedure RunFamily( const Proc_:TNodeProc<TTreeNode> );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTreeNode<_TParen_,_TChild_>

     TTreeNode<_TParen_,_TChild_:class> = class( TTreeNode )
     private
     protected
       ///// アクセス
       function GetParen :_TParen_; reintroduce;
       procedure SetParen( const Paren_:_TParen_ ); reintroduce;
       function GetHead :_TChild_; reintroduce;
       function GetTail :_TChild_; reintroduce;
       function GetChilds( const I_:Integer ) :_TChild_; reintroduce;
       procedure SetChilds( const I_:Integer; const Child_:_TChild_ ); reintroduce;
     public
       ///// プロパティ
       property Paren                      :_TParen_ read GetParen  write SetParen ;
       property Head                       :_TChild_ read GetHead                  ;
       property Tail                       :_TChild_ read GetTail                  ;
       property Childs[ const I_:Integer ] :_TChild_ read GetChilds write SetChilds; default;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTreeNode<_TNode_>

     TTreeNode<_TNode_:class> = class( TTreeNode<_TNode_,_TNode_> )
     private
     protected
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTreeRoot<_TChild_>

     TTreeRoot<_TChild_:class> = class( TTreeNode<_TChild_> )
     private
     protected
       ///// プロパティ
       property Paren;
     public
       ///// プロパティ
       property Head  ;
       property Tail  ;
       property Childs;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTreeLeaf<_TParen_>

     TTreeLeaf<_TParen_:class> = class( TTreeNode<_TParen_> )
     private
     protected
       ///// プロパティ
       property Head  ;
       property Tail  ;
       property Childs;
     public
       ///// プロパティ
       property Paren;
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

/////////////////////////////////////////////////////////////////////// アクセス

function TTreeItem.Get_Prev :TTreeNode;
begin
     Result := TTreeNode( FPrev as TObject );
end;

procedure TTreeItem.Set_Prev( const Prev_:TTreeNode );
begin
     FPrev := Prev_;
end;

function TTreeItem.Get_Next :TTreeNode;
begin
     Result := TTreeNode( FNext as TObject );
end;

procedure TTreeItem.Set_Next( const Next_:TTreeNode );
begin
     FNext := Next_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TTreeItem.Create;
begin
     inherited;

     FPrev := Self;
     FNext := Self;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTreeNode

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TTreeNode.Get_Paren :TTreeNode;
begin
     Result := _Paren;
end;

procedure TTreeNode.Set_Paren( const Paren_:TTreeNode );
begin
     _Paren := Paren_;
end;

//------------------------------------------------------------------------------

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

function TTreeNode.GetParen :ITreeNode;
begin
     Result := _Paren;
end;

procedure TTreeNode.SetParen( const Paren_:ITreeNode );
begin
     Remove;

     if Assigned( Paren_ ) then ( Paren_ as TTreeNode )._InsertTail( Self );
end;

//------------------------------------------------------------------------------

function TTreeNode.GetOrder :Integer;
begin
     if not IsOrdered then _Paren.FindTo( Self );

     Result := _Order;
end;

procedure TTreeNode.SetOrder( const Order_:Integer );
begin
     Swap( Self, _Paren.Childs[ Order_ ] as TTreeNode );
end;

//------------------------------------------------------------------------------

function TTreeNode.GetHead :ITreeNode;
begin
     Result := Zero._Next;
end;

function TTreeNode.GetTail :ITreeNode;
begin
     Result := Zero._Prev;
end;

//------------------------------------------------------------------------------

function TTreeNode.GetChilds( const I_:Integer ) :ITreeNode;
begin
     if I_ > _MaxOrder then FindTo( I_ );

     Result := _Childs[ I_ ];
end;

procedure TTreeNode.SetChilds( const I_:Integer; const Child_:ITreeNode );
var
   S :TTreeNode;
begin
     with Childs[ I_ ] do
     begin
          S := Childs[ I_ ]._Prev;

          Remove;
     end;

     S.InsertNext( Child_ as TTreeNode );
end;

function TTreeNode.GetChildsN :Integer;
begin
     Result := _ChildsN;
end;

function TTreeNode.GetRootNode :TTreeNode;
begin
     Result := Self;

     while Assigned( Result.Paren ) do Result := Result.Paren as TTreeNode;
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

     OnInsertChild( C1_ );
end;

procedure TTreeNode._Remove;
begin
     Bind( _Prev, _Next );

     if IsOrdered then _Paren._MaxOrder := _Order - 1;

     with _Paren do
     begin
          Dec( _ChildsN );

          if _ChildsN * 2 < _Childs.Count then _Childs.Count := _ChildsN;

          OnRemoveChild( Self );
     end;

     _Paren := nil;  _Order := -1;
end;

//------------------------------------------------------------------------------

procedure TTreeNode._InsertHead( const Child_:TTreeNode );
begin
     _Insert( Zero, Child_, Zero._Next );                                       { TODO : なぜか Zero._Next = Head プロパティを使えない }

     _MaxOrder := -1;  { if Head.IsOrdered then _MaxOrder := Head._Order - 1; }
end;

procedure TTreeNode._InsertTail( const Child_:TTreeNode );
begin
     _Insert( Zero._Prev, Child_, Zero );                                       { TODO : なぜか Zero._Prev = Tail プロパティを使えない }

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

//------------------------------------------------------------------------------

procedure TTreeNode.OnInsertChild( const Child_:TTreeNode );
begin
     if Assigned( _Paren ) then _Paren.OnInsertChild( Child_ );
end;

procedure TTreeNode.OnRemoveChild( const Child_:TTreeNode );
begin
     if Assigned( _Paren ) then _Paren.OnRemoveChild( Child_ );
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

constructor TTreeNode.Create( const Paren_:ITreeNode );
begin
     Create;

     ( Paren_ as TTreeNode )._InsertTail( Self );
end;

procedure TTreeNode.BeforeDestruction;
begin
     Remove;

     DeleteChilds;
end;

destructor TTreeNode.Destroy;
begin
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
     for N := 1 to _ChildsN do Zero._Prev.Free;
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
     Swap( Childs[ I1_ ] as TTreeNode,
           Childs[ I2_ ] as TTreeNode );
end;

//------------------------------------------------------------------------------

procedure TTreeNode.RunFamily( const Proc_:TNodeProc<TTreeNode> );
var
   I :Integer;
begin
     Proc_( Self );

     for I := 0 to ChildsN-1 do Childs[ I ].RunFamily( Proc_ );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTreeNode<_TParen_,_TChild_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TTreeNode<_TParen_,_TChild_>.GetParen :_TParen_;
begin
     Result := _TParen_( inherited GetParen );
end;

procedure TTreeNode<_TParen_,_TChild_>.SetParen( const Paren_:_TParen_ );
begin
     inherited SetParen( TTreeNode( Paren_ ) );
end;

//------------------------------------------------------------------------------

function TTreeNode<_TParen_,_TChild_>.GetHead :_TChild_;
begin
     Result := _TChild_( inherited GetHead );
end;

function TTreeNode<_TParen_,_TChild_>.GetTail :_TChild_;
begin
     Result := _TChild_( inherited GetTail );
end;

//------------------------------------------------------------------------------

function TTreeNode<_TParen_,_TChild_>.GetChilds( const I_:Integer ) :_TChild_;
begin
     Result := _TChild_( inherited GetChilds( I_ ) );
end;

procedure TTreeNode<_TParen_,_TChild_>.SetChilds( const I_:Integer; const Child_:_TChild_ );
begin
     inherited SetChilds( I_, TTreeNode( Child_ ) );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTreeNode<_TNode_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTreeRoot<_TChild_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTreeLeaf<_TParen_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
