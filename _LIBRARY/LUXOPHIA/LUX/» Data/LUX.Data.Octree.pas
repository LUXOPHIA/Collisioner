unit LUX.Data.Octree;

interface //#################################################################### ■

uses LUX,
     LUX.Data.Octree.Atom;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOcLeaf<_INode_,_IRoot_>

     TOcLeaf<_INode_:IOcNode;
             _IRoot_:IOctree> = class( TOcLeaf, IOcLeaf, IOcNode )
     private
     protected class var {本来不要なキャスト関数}
       _CastNode :TConstFunc<IOcNode,_INode_>;
       _CastRoot :TConstFunc<IOctree,_IRoot_>;
     protected
       ///// アクセス
       function GetRoot :_IRoot_; reintroduce;
       function GetParen :_INode_; reintroduce;
       procedure SetParen( const Paren_:_INode_ ); reintroduce;
       function GetChilds( const I_:Byte ) :_INode_; reintroduce;
       procedure SetChilds( const I_:Byte; const Child_:_INode_ ); reintroduce;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property Root                    :_IRoot_ read GetRoot                  ;
       property Paren                   :_INode_ read GetParen  write SetParen ;
       property Childs[ const I_:Byte ] :_INode_ read GetChilds write SetChilds;
       ///// メソッド
       function ForChilds( const Func_:TConstFunc<_INode_,Boolean> ) :Boolean; reintroduce;
       procedure ForFamily( const Proc_:TConstProc<_INode_> ); reintroduce;
       function ForChildPairs( const Node_:_INode_; const Func_:TConstFunc<_INode_,_INode_,Boolean> ) :Boolean; reintroduce;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOcKnot<_INode_,_IRoot_>

     TOcKnot<_INode_:IOcNode;
             _IRoot_:IOctree> = class( TOcKnot, IOcKnot, IOcNode )
     private
     protected class var {本来不要なキャスト関数}
       _CastNode :TConstFunc<IOcNode,_INode_>;
       _CastRoot :TConstFunc<IOctree,_IRoot_>;
     protected
       ///// アクセス
       function GetRoot :_IRoot_; reintroduce;
       function GetParen :_INode_; reintroduce;
       procedure SetParen( const Paren_:_INode_ ); reintroduce;
       function GetChilds( const I_:Byte ) :_INode_; reintroduce;
       procedure SetChilds( const I_:Byte; const Child_:_INode_ ); reintroduce;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property Root                    :_IRoot_ read GetRoot                  ;
       property Paren                   :_INode_ read GetParen  write SetParen ;
       property Childs[ const I_:Byte ] :_INode_ read GetChilds write SetChilds;
       ///// メソッド
       function ForChilds( const Func_:TConstFunc<_INode_,Boolean> ) :Boolean; reintroduce;
       procedure ForFamily( const Proc_:TConstProc<_INode_> ); reintroduce;
       function ForChildPairs( const Node_:_INode_; const Func_:TConstFunc<_INode_,_INode_,Boolean> ) :Boolean; reintroduce;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOctree<_INode_,_IRoot_,_TKnot_,_TLeaf_>

     TOctree<_INode_:IOcNode;
             _IRoot_:IOctree;
             _TKnot_:TOcKnot<_INode_,_IRoot_>,constructor;
             _TLeaf_:TOcLeaf<_INode_,_IRoot_>,constructor> = class( TOctree<_TKnot_,_TLeaf_>, IOctree, IOcNode )
     private
     protected class var {本来不要なキャスト関数}
       _CastNode :TConstFunc<IOcNode,_INode_>;
       _CastRoot :TConstFunc<IOctree,_IRoot_>;
     protected
       ///// アクセス
       function GetRoot :_IRoot_; reintroduce;
       function GetParen :_INode_; reintroduce;
       procedure SetParen( const Paren_:_INode_ ); reintroduce;
       function GetChilds( const I_:Byte ) :_INode_; reintroduce;
       procedure SetChilds( const I_:Byte; const Child_:_INode_ ); reintroduce;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property Root                    :_IRoot_ read GetRoot                  ;
       property Paren                   :_INode_ read GetParen  write SetParen ;
       property Childs[ const I_:Byte ] :_INode_ read GetChilds write SetChilds;
       ///// メソッド
       function ForChilds( const Func_:TConstFunc<_INode_,Boolean> ) :Boolean; reintroduce;
       procedure ForFamily( const Proc_:TConstProc<_INode_> ); reintroduce;
       function ForChildPairs( const Node_:_INode_; const Func_:TConstFunc<_INode_,_INode_,Boolean> ) :Boolean; reintroduce;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOcLeaf<_INode_,_IRoot_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TOcLeaf<_INode_,_IRoot_>.GetRoot :_IRoot_;
begin
     Result := _CastRoot( inherited GetRoot );
end;

//------------------------------------------------------------------------------

function TOcLeaf<_INode_,_IRoot_>.GetParen :_INode_;
begin
     Result := _CastNode( inherited GetParen );
end;

procedure TOcLeaf<_INode_,_IRoot_>.SetParen( const Paren_:_INode_ );
begin
     inherited SetParen( Paren_ );
end;

function TOcLeaf<_INode_,_IRoot_>.GetChilds( const I_:Byte ) :_INode_;
begin
     Result := _CastNode( inherited GetChilds( I_ ) );
end;

procedure TOcLeaf<_INode_,_IRoot_>.SetChilds( const I_:Byte; const Child_:_INode_ );
begin
     inherited SetChilds( I_, Child_ );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TOcLeaf<_INode_,_IRoot_>.Create;
begin
     inherited;

end;

destructor TOcLeaf<_INode_,_IRoot_>.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TOcLeaf<_INode_,_IRoot_>.ForChilds( const Func_:TConstFunc<_INode_,Boolean> ) :Boolean;
begin
     Result := inherited ForChilds( function( const Child_:IOcNode ) :Boolean
                         begin
                              Result := Func_( _CastNode( Child_ ) );
                         end );
end;

procedure TOcLeaf<_INode_,_IRoot_>.ForFamily( const Proc_:TConstProc<_INode_> );
begin
     inherited ForFamily( procedure( const Node_:IOcNode )
               begin
                    Proc_( _CastNode( Node_ ) );
               end );
end;

function TOcLeaf<_INode_,_IRoot_>.ForChildPairs( const Node_:_INode_; const Func_:TConstFunc<_INode_,_INode_,Boolean> ) :Boolean;
begin
     Result := inherited ForChildPairs( Node_, function( const N0,N1:IOcNode ) :Boolean
                         begin
                              Result := Func_( _CastNode( N0 ),
                                               _CastNode( N1 ) );
                         end );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOcKnot<_INode_,_IRoot_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TOcKnot<_INode_,_IRoot_>.GetRoot :_IRoot_;
begin
     Result := _CastRoot( inherited GetRoot );
end;

//------------------------------------------------------------------------------

function TOcKnot<_INode_,_IRoot_>.GetParen :_INode_;
begin
     Result := _CastNode( inherited GetParen );
end;

procedure TOcKnot<_INode_,_IRoot_>.SetParen( const Paren_:_INode_ );
begin
     inherited SetParen( Paren_ );
end;

function TOcKnot<_INode_,_IRoot_>.GetChilds( const I_:Byte ) :_INode_;
begin
     Result := _CastNode( inherited GetChilds( I_ ) );
end;

procedure TOcKnot<_INode_,_IRoot_>.SetChilds( const I_:Byte; const Child_:_INode_ );
begin
     inherited SetChilds( I_, Child_ );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TOcKnot<_INode_,_IRoot_>.Create;
begin
     inherited;

end;

destructor TOcKnot<_INode_,_IRoot_>.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TOcKnot<_INode_,_IRoot_>.ForChilds( const Func_:TConstFunc<_INode_,Boolean> ) :Boolean;
begin
     Result := inherited ForChilds( function( const Child_:IOcNode ) :Boolean
                         begin
                              Result := Func_( _CastNode( Child_ ) );
                         end );
end;

procedure TOcKnot<_INode_,_IRoot_>.ForFamily( const Proc_:TConstProc<_INode_> );
begin
     inherited ForFamily( procedure( const Node_:IOcNode )
               begin
                    Proc_( _CastNode( Node_ ) );
               end );
end;

function TOcKnot<_INode_,_IRoot_>.ForChildPairs( const Node_:_INode_; const Func_:TConstFunc<_INode_,_INode_,Boolean> ) :Boolean;
begin
     Result := inherited ForChildPairs( Node_, function( const N0,N1:IOcNode ) :Boolean
                         begin
                              Result := Func_( _CastNode( N0 ),
                                               _CastNode( N1 ) );
                         end );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOctree<_INode_,_IRoot_,_TKnot_,_TLeaf_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TOctree<_INode_,_IRoot_,_TKnot_,_TLeaf_>.GetRoot :_IRoot_;
begin
     Result := _CastRoot( inherited GetRoot );
end;

//------------------------------------------------------------------------------

function TOctree<_INode_,_IRoot_,_TKnot_,_TLeaf_>.GetParen :_INode_;
begin
     Result := _CastNode( inherited GetParen );
end;

procedure TOctree<_INode_,_IRoot_,_TKnot_,_TLeaf_>.SetParen( const Paren_:_INode_ );
begin
     inherited SetParen( Paren_ );
end;

function TOctree<_INode_,_IRoot_,_TKnot_,_TLeaf_>.GetChilds( const I_:Byte ) :_INode_;
begin
     Result := _CastNode( inherited GetChilds( I_ ) );
end;

procedure TOctree<_INode_,_IRoot_,_TKnot_,_TLeaf_>.SetChilds( const I_:Byte; const Child_:_INode_ );
begin
     inherited SetChilds( I_, Child_ );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TOctree<_INode_,_IRoot_,_TKnot_,_TLeaf_>.Create;
begin
     inherited;

end;

destructor TOctree<_INode_,_IRoot_,_TKnot_,_TLeaf_>.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TOctree<_INode_,_IRoot_,_TKnot_,_TLeaf_>.ForChilds( const Func_:TConstFunc<_INode_,Boolean> ) :Boolean;
begin
     Result := inherited ForChilds( function( const Child_:IOcNode ) :Boolean
                         begin
                              Result := Func_( _CastNode( Child_ ) );
                         end );
end;

procedure TOctree<_INode_,_IRoot_,_TKnot_,_TLeaf_>.ForFamily( const Proc_:TConstProc<_INode_> );
begin
     inherited ForFamily( procedure( const Node_:IOcNode )
               begin
                    Proc_( _CastNode( Node_ ) );
               end );
end;

function TOctree<_INode_,_IRoot_,_TKnot_,_TLeaf_>.ForChildPairs( const Node_:_INode_; const Func_:TConstFunc<_INode_,_INode_,Boolean> ) :Boolean;
begin
     Result := inherited ForChildPairs( Node_, function( const N0,N1:IOcNode ) :Boolean
                         begin
                              Result := Func_( _CastNode( N0 ),
                                               _CastNode( N1 ) );
                         end );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■