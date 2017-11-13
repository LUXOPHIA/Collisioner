unit LUX.Data.Octree;

interface //#################################################################### ■

uses LUX, LUX.D3;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     IOcNode   = interface;
       IOcKnot = interface;
       IOcLeaf = interface;
       IOctree = interface;

     TOcNode   = class;
       TOcKnot = class;
       TOcLeaf = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOcNode

     IOcNode = interface
     ['{2330A1DE-B3EC-4072-8F50-CEAB5A583E02}']
     {protected}
       ///// アクセス
       function GetRoot :TOcNode;
       function GetLev :Cardinal;
       function GetInd :TCardinal3D;
       function GetParen :TOcNode;
       procedure SetParen( const Paren_:TOcNode );
       function GetChilds( const I_:Byte ) :TOcNode;
       procedure SetChilds( const I_:Byte; const Child_:TOcNode );
     {public}
       ///// プロパティ
       property Root                    :TOcNode     read GetRoot                  ;
       property Lev                     :Cardinal    read GetLev                   ;
       property Ind                     :TCardinal3D read GetInd                   ;
       property Paren                   :TOcNode     read GetParen  write SetParen ;
       property Childs[ const I_:Byte ] :TOcNode     read GetChilds write SetChilds;
       ///// メソッド
       procedure Clear;
       function ForChilds( const Func_:TConstFunc<TOcNode,Boolean> ) :Boolean;
       procedure ForFamily( const Proc_:TConstProc<TOcNode> );
     end;

     //-------------------------------------------------------------------------

     TOcNode = class( TInterfacedBase, IOcNode )
     private
     protected
       ///// アクセス
       function GetRoot :TOcNode; virtual;
       function GetLev :Cardinal; virtual;
       function GetInd :TCardinal3D;  virtual; abstract;
       function GetParen :TOcNode; virtual; abstract;
       procedure SetParen( const Paren_:TOcNode ); virtual; abstract;
       function GetChilds( const I_:Byte ) :TOcNode; virtual; abstract;
       procedure SetChilds( const I_:Byte; const Child_:TOcNode ); virtual; abstract;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property Root                    :TOcNode     read GetRoot                  ;
       property Lev                     :Cardinal    read GetLev                   ;
       property Ind                     :TCardinal3D read GetInd                   ;
       property Paren                   :TOcNode     read GetParen  write SetParen ;
       property Childs[ const I_:Byte ] :TOcNode     read GetChilds write SetChilds;
       ///// メソッド
       procedure Clear;
       function ForChilds( const Func_:TConstFunc<TOcNode,Boolean> ) :Boolean; virtual; abstract;
       procedure ForFamily( const Proc_:TConstProc<TOcNode> ); virtual; abstract;
       class function ForChildPairs( const Node0_,Node1_:TOcNode; const Func_:TConstFunc<TOcNode,TOcNode,Boolean> ) :Boolean;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOcLeaf

     IOcLeaf = interface( IOcNode )
     ['{D3D3C428-50D3-48B5-B1DD-0FD69EB041AA}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TOcLeaf = class( TOcNode, IOcLeaf, IOcNode )
     private
     protected
       _Paren :TOcNode;
       _Id    :T1Bit3D;
       ///// アクセス
       function GetInd :TCardinal3D;  override;
       function GetParen :TOcNode; override;
       procedure SetParen( const Paren_:TOcNode ); override;
       function GetChilds( const I_:Byte ) :TOcNode; override;
       procedure SetChilds( const I_:Byte; const Child_:TOcNode ); override;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       ///// メソッド
       function ForChilds( const Func_:TConstFunc<TOcNode,Boolean> ) :Boolean; override;
       procedure ForFamily( const Proc_:TConstProc<TOcNode> ); override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOcKnot

     IOcKnot = interface( IOcNode )
     ['{977955C9-F3FF-4FF2-BCE2-EA39B19E1216}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TOcKnot = class( TOcNode, IOcKnot, IOcNode )
     private
     protected
       _Paren  :TOcNode;
       _Id     :T1Bit3D;
       _Childs :array [ 0..7 ] of TOcNode;
       ///// アクセス
       function GetInd :TCardinal3D;  override;
       function GetParen :TOcNode; override;
       procedure SetParen( const Paren_:TOcNode ); override;
       function GetChilds( const I_:Byte ) :TOcNode; override;
       procedure SetChilds( const I_:Byte; const Child_:TOcNode ); override;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       ///// メソッド
       function ForChilds( const Func_:TConstFunc<TOcNode,Boolean> ) :Boolean; override;
       procedure ForFamily( const Proc_:TConstProc<TOcNode> ); override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOctree<_TOcKnot_,_TOcLeaf_>

     IOctree = interface( IOcNode )
     ['{C4E87A83-EA71-4145-913A-E856DC00B6B1}']
     {protected}
       ///// アクセス
       function GetRoot :TOcNode;
       function GetLev :Cardinal;
       function GetInd :TCardinal3D;
       function GetDivL :Integer;
       procedure SetDivL( const DivL_:Integer );
       function GetDivN :Integer;
       procedure SetDivN( const DivN_:Integer );
     {public}
       ///// プロパティ
       property DivL :Integer read GetDivL write SetDivL;
       property DivN :Integer read GetDivN write SetDivN;
       ///// メソッド
       function GetNode( const Lev_:cardinal; const Ind_:TCardinal3D ) :IOcNode;
     end;

     //-------------------------------------------------------------------------

     TOctree<_INode_:IOcNode;
             _TKnot_:TOcKnot,constructor;
             _TLeaf_:TOcLeaf,constructor> = class( TOcNode, IOctree, IOcNode )
     private
     protected
       _Childs :array [ 0..7 ] of TOcNode;
       _DivL   :Integer;
       ///// アクセス
       function GetRoot :TOcNode; override;
       function GetLev :Cardinal; override;
       function GetInd :TCardinal3D; override;
       function GetParen :TOcNode; override;
       procedure SetParen( const Paren_:TOcNode ); override;
       function GetChilds( const I_:Byte ) :TOcNode; override;
       procedure SetChilds( const I_:Byte; const Child_:TOcNode ); override;
       function GetDivL :Integer;
       procedure SetDivL( const DivL_:Integer );
       function GetDivN :Integer;
       procedure SetDivN( const DivN_:Integer );
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property DivL :Integer read GetDivL write SetDivL;
       property DivN :Integer read GetDivN write SetDivN;
       ///// メソッド
       class function DivLtoN( const DivL_:Cardinal ) :Cardinal;
       class function DivNtoL( const DivN_:Cardinal ) :Cardinal;
       function ForChilds( const Func_:TConstFunc<TOcNode,Boolean> ) :Boolean; override;
       procedure ForFamily( const Proc_:TConstProc<TOcNode> ); override;
       function Add( const Ind_:TCardinal3D ) :_TLeaf_;
       function GetNode( const Lev_:cardinal; const Ind_:TCardinal3D ) :IOcNode;
       function GetLeaf( const Ind_:TCardinal3D ) :_TLeaf_;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.SysUtils, System.Math;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOcNode

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TOcNode.GetRoot :TOcNode;
begin
     Result := Paren.Root;
end;

//------------------------------------------------------------------------------

function TOcNode.GetLev :Cardinal;
begin
     Result := Paren.Lev + 1;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TOcNode.Create;
begin
     inherited;

end;

destructor TOcNode.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TOcNode.Clear;
var
   I :Byte;
begin
     for I := 0 to 7 do
     begin
          if Assigned( Childs[ I ] ) then Childs[ I ].DisposeOf;
     end;
end;

//------------------------------------------------------------------------------

class function TOcNode.ForChildPairs( const Node0_,Node1_:TOcNode; const Func_:TConstFunc<TOcNode,TOcNode,Boolean> ) :Boolean;
begin
     Result := Node0_.ForChilds( function( const N0:TOcNode ) :Boolean
     begin
          Result := Node1_.ForChilds( function( const N1:TOcNode ) :Boolean
          begin
               Result := Func_( N0, N1 );
          end );
     end );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOcLeaf

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TOcLeaf.GetInd :TCardinal3D;
begin
     with Paren.Ind do
     begin
          Result.X := ( X shl 1 ) or _Id.X;
          Result.Y := ( Y shl 1 ) or _Id.Y;
          Result.Z := ( Z shl 1 ) or _Id.Z;
     end;
end;

//------------------------------------------------------------------------------

function TOcLeaf.GetParen :TOcNode;
begin
     Result := _Paren;
end;

procedure TOcLeaf.SetParen( const Paren_:TOcNode );
begin
     _Paren := Paren_;
end;

//------------------------------------------------------------------------------

function TOcLeaf.GetChilds( const I_:Byte ) :TOcNode;
begin
     Result := nil;
end;

procedure TOcLeaf.SetChilds( const I_:Byte; const Child_:TOcNode );
begin

end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TOcLeaf.Create;
begin
     inherited;

end;

destructor TOcLeaf.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TOcLeaf.ForChilds( const Func_:TConstFunc<TOcNode,Boolean> ) :Boolean;
begin
     Result := Func_( Self );
end;

procedure TOcLeaf.ForFamily( const Proc_:TConstProc<TOcNode> );
begin
     Proc_( Self );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOcKnot

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TOcKnot.GetInd :TCardinal3D;
begin
     with Paren.Ind do
     begin
          Result.X := ( X shl 1 ) or _Id.X;
          Result.Y := ( Y shl 1 ) or _Id.Y;
          Result.Z := ( Z shl 1 ) or _Id.Z;
     end;
end;

//------------------------------------------------------------------------------

function TOcKnot.GetParen :TOcNode;
begin
     Result := _Paren;
end;

procedure TOcKnot.SetParen( const Paren_:TOcNode );
begin
     _Paren := Paren_;
end;

//------------------------------------------------------------------------------

function TOcKnot.GetChilds( const I_:Byte ) :TOcNode;
begin
     Result := _Childs[ I_ ];
end;

procedure TOcKnot.SetChilds( const I_:Byte; const Child_:TOcNode );
begin
     _Childs[ I_ ] := Child_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TOcKnot.Create;
var
   I :Byte;
begin
     inherited;

     for I := 0 to 7 do _Childs[ I ] := nil;
end;

destructor TOcKnot.Destroy;
begin
     Clear;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TOcKnot.ForChilds( const Func_:TConstFunc<TOcNode,Boolean> ) :Boolean;
var
   I :Byte;
   C :TOcNode;
begin
     for I := 0 to 7 do
     begin
          C := _Childs[ I ];

          if Assigned( C ) and Func_( C ) then Exit( True );
     end;

     Result := False;
end;

procedure TOcKnot.ForFamily( const Proc_:TConstProc<TOcNode> );
var
   I :Byte;
   C :TOcNode;
begin
     Proc_( Self );

     for I := 0 to 7 do
     begin
          C := _Childs[ I ];

          if Assigned( C ) then C.ForFamily( Proc_ );
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOctree<_TOcKnot_,_TOcLeaf_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TOctree<_INode_,_TKnot_,_TLeaf_>.GetRoot :TOcNode;
begin
     Result := Self;
end;

//------------------------------------------------------------------------------

function TOctree<_INode_,_TKnot_,_TLeaf_>.GetLev :Cardinal;
begin
     Result := 0;
end;

function TOctree<_INode_,_TKnot_,_TLeaf_>.GetInd :TCardinal3D;
begin
     Result := TCardinal3D.Create( 0, 0, 0 );
end;

//------------------------------------------------------------------------------

function TOctree<_INode_,_TKnot_,_TLeaf_>.GetParen :TOcNode;
begin
     Result := nil;
end;

procedure TOctree<_INode_,_TKnot_,_TLeaf_>.SetParen( const Paren_:TOcNode );
begin

end;

//------------------------------------------------------------------------------

function TOctree<_INode_,_TKnot_,_TLeaf_>.GetChilds( const I_:Byte ) :TOcNode;
begin
     Result := _Childs[ I_ ];
end;

procedure TOctree<_INode_,_TKnot_,_TLeaf_>.SetChilds( const I_:Byte; const Child_:TOcNode );
begin
     _Childs[ I_ ] := Child_;
end;

//------------------------------------------------------------------------------

function TOctree<_INode_,_TKnot_,_TLeaf_>.GetDivL :Integer;
begin
     Result := _DivL;
end;

procedure TOctree<_INode_,_TKnot_,_TLeaf_>.SetDivL( const DivL_:Integer );
begin
     _DivL := DivL_;

     Clear;
end;

function TOctree<_INode_,_TKnot_,_TLeaf_>.GetDivN :Integer;
begin
     Result := DivLtoN( _DivL );
end;

procedure TOctree<_INode_,_TKnot_,_TLeaf_>.SetDivN( const DivN_:Integer );
begin
     DivL := DivNtoL( DivN_ );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TOctree<_INode_,_TKnot_,_TLeaf_>.Create;
begin
     inherited;

     _DivL := 0;
end;

destructor TOctree<_INode_,_TKnot_,_TLeaf_>.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

class function TOctree<_INode_,_TKnot_,_TLeaf_>.DivLtoN( const DivL_:Cardinal ) :Cardinal;
begin
     Result := 1 shl DivL_;
end;

class function TOctree<_INode_,_TKnot_,_TLeaf_>.DivNtoL( const DivN_:Cardinal ) :Cardinal;
begin
     Result := Ceil( Log2( DivN_ ) );
end;

//------------------------------------------------------------------------------

function TOctree<_INode_,_TKnot_,_TLeaf_>.ForChilds( const Func_:TConstFunc<TOcNode,Boolean> ) :Boolean;
var
   I :Byte;
   C :TOcNode;
begin
     for I := 0 to 7 do
     begin
          C := _Childs[ I ];

          if Assigned( C ) and Func_( C ) then Exit( True );
     end;

     Result := False;
end;

procedure TOctree<_INode_,_TKnot_,_TLeaf_>.ForFamily( const Proc_:TConstProc<TOcNode> );
var
   I :Byte;
   C :TOcNode;
begin
     Proc_( Self );

     for I := 0 to 7 do
     begin
          C := _Childs[ I ];

          if Assigned( C ) then C.ForFamily( Proc_ );
     end;
end;

//------------------------------------------------------------------------------

function TOctree<_INode_,_TKnot_,_TLeaf_>.Add( const Ind_:TCardinal3D ) :_TLeaf_;
var
   P, C :TOcNode;
   L :Integer;
   I :TCardinal3D;
   Id :T1Bit3D;
begin
     P := Self;
     for L := 1 to _DivL-1 do
     begin
          I  := Ind_ shr ( _DivL - L );
          Id := I.LSB;

          C := P.Childs[ Id.o ];

          if not Assigned( C ) then
          begin
               C := _TKnot_.Create;

               with C as TOcKnot do
               begin
                    _Paren := P;
                    _Id    := Id;
               end;

               P.Childs[ Id.o ] := C;
          end;

          P := C;
     end;

     Id := Ind_.LSB;

     C := P.Childs[ Id.o ];

     if not Assigned( C ) then
     begin
          C := _TLeaf_.Create;

          with C as TOcLeaf do
          begin
               _Paren := P;
               _Id    := Id;
          end;

          P.Childs[ Id.o ] := C;
     end;

     Result := C as _TLeaf_;
end;

//------------------------------------------------------------------------------

function TOctree<_INode_,_TKnot_,_TLeaf_>.GetNode( const Lev_:cardinal; const Ind_:TCardinal3D ) :IOcNode;
var
   L :Integer;
   I :TCardinal3D;
   Id :T1Bit3D;
begin
     Result := Self;

     for L := 1 to Lev_ do
     begin
          I  := Ind_ shr ( _DivL - L );
          Id := I.LSB;

          Result := Result.Childs[ Id.o ];

          if not Assigned( Result ) then Exit;
     end;
end;

function TOctree<_INode_,_TKnot_,_TLeaf_>.GetLeaf( const Ind_:TCardinal3D ) :_TLeaf_;
begin
     Result := GetNode( _DivL, Ind_ ) as _TLeaf_;
end;

//------------------------------------------------------------------------------

{
procedure TOctree.Add( const Pos_:TCardinal3D );
var
   I :TCardinal3D;
   P, C :TOcKnot;
   Id :T1Bit3D;
   L :Integer;
   F :TOcLeaf;
begin
     if _DivL < 0 then
     begin
          _RootN := TOcLeaf.Create;
          _RootI := Pos_;

          Inc( _DivL );
     end
     else
     begin
          I := Pos_ shr _DivL;
          while I <> _RootI do
          begin
               P := TOcKnot.Create;

               Id := _RootI.LSB;

               P.Childs[ Id ] := _RootN;

               _RootN := P;

               _RootI := _RootI shr 1;
                    I :=      I shr 1;

               Inc( _DivL );
          end;

          P := _RootN as TOcKnot;
          for L := _DivL-1 downto 1 do
          begin
               I := Pos_ shr L;

               Id := I.LSB;

               C := P.Childs[ Id ] as TOcKnot;

               if not Assigned( C ) then
               begin
                    C := TOcKnot.Create;

                    P.Childs[ Id ] := C;
               end;

               P := C;
          end;

          Id := Pos_.LSB;

          F := P.Childs[ Id ] as TOcLeaf;

          if not Assigned( F ) then P.Childs[ Id ] := TOcLeaf.Create;
     end;
end;
}

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■