unit LUX.Data.Octree;

interface //#################################################################### ■

uses LUX, LUX.D3;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     IOcNode = interface;
       IOcKnot = interface;
         IOctree = interface;
       IOcLeaf = interface;

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
       function ForChilds( const Func_:TConstFunc<TOcNode,Boolean> ) :Boolean;
     end;

     //-------------------------------------------------------------------------

     TOcNode = class( TInterfacedObject, IOcNode )
     private
     protected
       _Paren :TOcNode;
       _Id    :T1Bit3D;
       ///// アクセス
       function GetRoot :TOcNode; virtual;
       function GetLev :Cardinal; virtual;
       function GetInd :TCardinal3D; virtual;
       function GetParen :TOcNode;
       procedure SetParen( const Paren_:TOcNode );
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
       function ForChilds( const Func_:TConstFunc<TOcNode,Boolean> ) :Boolean; virtual; abstract;
       class function ForChildPairs( const Node0_,Node1_:TOcNode; const Func_:TConstFunc<TOcNode,TOcNode,Boolean> ) :Boolean;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOcKnot

     IOcKnot = interface( IOcNode )
     ['{977955C9-F3FF-4FF2-BCE2-EA39B19E1216}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TOcKnot = class( TOcNode, IOcKnot )
     private
     protected
       _Childs :array [ 0..7 ] of TOcNode;
       ///// アクセス
       function GetChilds( const I_:Byte ) :TOcNode; override;
       procedure SetChilds( const I_:Byte; const Child_:TOcNode ); override;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       ///// メソッド
       procedure Clear;
       function ForChilds( const Func_:TConstFunc<TOcNode,Boolean> ) :Boolean; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOcLeaf

     IOcLeaf = interface( IOcNode )
     ['{D3D3C428-50D3-48B5-B1DD-0FD69EB041AA}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TOcLeaf = class( TOcNode, IOcLeaf )
     private
     protected
       ///// アクセス
       function GetChilds( const I_:Byte ) :TOcNode; override;
       procedure SetChilds( const I_:Byte; const Child_:TOcNode ); override;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       ///// メソッド
       function ForChilds( const Func_:TConstFunc<TOcNode,Boolean> ) :Boolean; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOctree<_TOcKnot_,_TOcLeaf_>

     IOctree = interface( IOcKnot )
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

     TOctree<_TOcKnot_,_TOcLeaf_:TOcNode,constructor> = class( TOcKnot, IOctree )
     private
     protected
       _DivL :Integer;
       ///// アクセス
       function GetRoot :TOcNode; override;
       function GetLev :Cardinal; override;
       function GetInd :TCardinal3D; override;
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
       function Add( const Ind_:TCardinal3D ) :_TOcLeaf_;
       function GetNode( const Lev_:cardinal; const Ind_:TCardinal3D ) :IOcNode;
       function GetLeaf( const Ind_:TCardinal3D ) :_TOcLeaf_;
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
     Result := _Paren.Root;
end;

//------------------------------------------------------------------------------

function TOcNode.GetLev :Cardinal;
begin
     Result := _Paren.Lev + 1;
end;

function TOcNode.GetInd :TCardinal3D;
begin
     with _Paren.Ind do
     begin
          Result.X := ( X shl 1 ) or _Id.X;
          Result.Y := ( Y shl 1 ) or _Id.Y;
          Result.Z := ( Z shl 1 ) or _Id.Z;
     end;
end;

//------------------------------------------------------------------------------

function TOcNode.GetParen :TOcNode;
begin
     Result := _Paren;
end;

procedure TOcNode.SetParen( const Paren_:TOcNode );
begin
     _Paren := Paren_;
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

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOcKnot

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

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

procedure TOcKnot.Clear;
var
   I :Byte;
begin
     for I := 0 to 7 do
     begin
          if Assigned( _Childs[ I ] ) then _Childs[ I ].DisposeOf;
     end;
end;

//------------------------------------------------------------------------------

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

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOcLeaf

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

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

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOctree<_TOcKnot_,_TOcLeaf_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TOctree<_TOcKnot_,_TOcLeaf_>.GetRoot :TOcNode;
begin
     Result := Self;
end;

//------------------------------------------------------------------------------

function TOctree<_TOcKnot_,_TOcLeaf_>.GetLev :Cardinal;
begin
     Result := 0;
end;

function TOctree<_TOcKnot_,_TOcLeaf_>.GetInd :TCardinal3D;
begin
     Result := TCardinal3D.Create( 0, 0, 0 );
end;

//------------------------------------------------------------------------------

function TOctree<_TOcKnot_,_TOcLeaf_>.GetDivL :Integer;
begin
     Result := _DivL;
end;

procedure TOctree<_TOcKnot_,_TOcLeaf_>.SetDivL( const DivL_:Integer );
begin
     _DivL := DivL_;

     Clear;
end;

function TOctree<_TOcKnot_,_TOcLeaf_>.GetDivN :Integer;
begin
     Result := DivLtoN( _DivL );
end;

procedure TOctree<_TOcKnot_,_TOcLeaf_>.SetDivN( const DivN_:Integer );
begin
     DivL := DivNtoL( DivN_ );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TOctree<_TOcKnot_,_TOcLeaf_>.Create;
begin
     inherited;

     _DivL := 0;
end;

destructor TOctree<_TOcKnot_,_TOcLeaf_>.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

class function TOctree<_TOcKnot_,_TOcLeaf_>.DivLtoN( const DivL_:Cardinal ) :Cardinal;
begin
     Result := 1 shl DivL_;
end;

class function TOctree<_TOcKnot_,_TOcLeaf_>.DivNtoL( const DivN_:Cardinal ) :Cardinal;
begin
     Result := Ceil( Log2( DivN_ ) );
end;

//------------------------------------------------------------------------------

function TOctree<_TOcKnot_,_TOcLeaf_>.Add( const Ind_:TCardinal3D ) :_TOcLeaf_;
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
               C := _TOcKnot_.Create;

               with C do
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
          C := _TOcLeaf_.Create;

          with C do
          begin
               _Paren := P;
               _Id    := Id;
          end;

          P.Childs[ Id.o ] := C;
     end;

     Result := C as _TOcLeaf_;
end;

//------------------------------------------------------------------------------

function TOctree<_TOcKnot_,_TOcLeaf_>.GetNode( const Lev_:cardinal; const Ind_:TCardinal3D ) :IOcNode;
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

function TOctree<_TOcKnot_,_TOcLeaf_>.GetLeaf( const Ind_:TCardinal3D ) :_TOcLeaf_;
begin
     Result := GetNode( _DivL, Ind_ ) as _TOcLeaf_;
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