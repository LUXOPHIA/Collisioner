unit LUX.GPU.OpenGL.Shaper.Octree;

interface //#################################################################### ■

uses System.SysUtils, System.UITypes,
     LUX, LUX.D1, LUX.D2, LUX.D3, LUX.M4,
     LUX.Geometry.D3,
     LUX.GPU.OpenGL,
     LUX.GPU.OpenGL.Atom.Buffer.Unifor,
     LUX.GPU.OpenGL.Scener,
     LUX.GPU.OpenGL.Camera,
     LUX.GPU.OpenGL.Matery,
     LUX.GPU.OpenGL.Shaper,
     LUX.GPU.OpenGL.Shaper.Preset,
     LUX.GPU.OpenGL.Shaper.Voxels;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     TOcNode         = class;
     TOcKnot         = class;
     TOcLeaf         = class;
     TGLShaperOctree = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOcNode

     TOcNode = class
     private
     protected
       _Octree :TGLShaperOctree;
       _Paren  :TOcNode;
       _Lev    :Cardinal;
       _Ind    :TCardinal3D;
       ///// アクセス
       function GetParen :TOcNode;
       procedure SetParen( const Paren_:TOcNode );
       function GetChilds( const I_:Byte ) :TOcNode; virtual; abstract;
       procedure SetChilds( const I_:Byte; const Child_:TOcNode ); virtual; abstract;
       function GetBouBal :TSingleSphere;
     public
       constructor Create( const Octree_:TGLShaperOctree; const Paren_:TOcNode; const Lev_:Cardinal; const Ind_:TCardinal3D );
       destructor Destroy; override;
       ///// プロパティ
       property Paren                   :TOcNode       read GetParen  write SetParen ;
       property Lev                     :Cardinal      read   _Lev    write   _Lev   ;
       property Ind                     :TCardinal3D   read   _Ind    write   _Ind   ;
       property Childs[ const I_:Byte ] :TOcNode       read GetChilds write SetChilds;
       property BouBal                  :TSingleSphere read GetBouBal                ;
       ///// メソッド
       procedure Clear; virtual; abstract;
       procedure ForFamily( const Proc_:TConstProc<Cardinal,TCardinal3D> ); virtual; abstract;
       class function Collision( const Node0_:TOcNode; const Node1_:TOcNode ) :Boolean; overload;
       class function Collision( const Node0_:TOcKnot; const Node1_:TOcKnot ) :Boolean; overload;
       class function Collision( const Node0_:TOcNode; const Node1_:TOcLeaf ) :Boolean; overload;
       class function Collision( const Node0_:TOcKnot; const Node1_:TOcLeaf ) :Boolean; overload;
       class function Collision( const Node0_:TOcLeaf; const Node1_:TOcKnot ) :Boolean; overload;
       class function Collision( const Node0_:TOcLeaf; const Node1_:TOcLeaf ) :Boolean; overload;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOcKnot

     TOcKnot = class( TOcNode )
     private
     protected
       _Childs :array [ 0..7 ] of TOcNode;
       ///// アクセス
       function GetChilds( const I_:Byte ) :TOcNode; override;
       procedure SetChilds( const I_:Byte; const Child_:TOcNode ); override;
     public
       constructor Create( const Octree_:TGLShaperOctree; const Paren_:TOcNode; const Lev_:Cardinal; const Ind_:TCardinal3D );
       destructor Destroy; override;
       ///// プロパティ
       ///// メソッド
       procedure Clear; override;
       procedure ForFamily( const Proc_:TConstProc<Cardinal,TCardinal3D> ); override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOcLeaf

     TOcLeaf = class( TOcNode )
     private
     protected
       ///// アクセス
       function GetChilds( const I_:Byte ) :TOcNode; override;
       procedure SetChilds( const I_:Byte; const Child_:TOcNode ); override;
     public
       constructor Create( const Octree_:TGLShaperOctree; const Paren_:TOcNode; const Lev_:Cardinal; const Ind_:TCardinal3D );
       destructor Destroy; override;
       ///// プロパティ
       ///// メソッド
       procedure Clear; override;
       procedure ForFamily( const Proc_:TConstProc<Cardinal,TCardinal3D> ); override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaperOctree

     TGLShaperOctree = class( TGLShaperFace )
     private
     protected
       _Root :TOcNode;
       _Size :Single;
       _Cent :TSingle3D;
       _DivL :Cardinal;
       _DivN :Cardinal;
       _Reso :Single;
       ///// アクセス
       function GetReso :Single;
       procedure SetReso( const Reso_:Single );
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       property Root :TOcNode   read   _Root              ;
       property Size :Single    read   _Size              ;
       property Cent :TSingle3D read   _Cent              ;
       property DivL :Cardinal  read   _DivL              ;
       property DivN :Cardinal  read   _DivN              ;
       property Reso :Single    read GetReso write SetReso;
       ///// メソッド
       procedure Clear;
       procedure Add( const Ind_:TCardinal3D );
       procedure Generate;
       procedure MakeGrid;
       function Collision( const Octree_:TGLShaperOctree ) :Boolean;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.Math, System.Generics.Collections,
     Winapi.OpenGLext,
     LUX.D4,
     LUX.GPU.OpenGL.Atom.Buffer,
     LUX.GPU.OpenGL.Matery.Preset;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOcNode

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TOcNode.GetParen :TOcNode;
begin
     Result := _Paren;
end;

procedure TOcNode.SetParen( const Paren_:TOcNode );
begin
     _Paren := Paren_;
end;

//------------------------------------------------------------------------------

function TOcNode.GetBouBal :TSingleSphere;
var
   S :Single;
begin
     S := _Octree.Size / ( 1 shl _Lev );

     with Result do
     begin
          Center.X := _Octree.Cent.X - _Octree.Size/2 + S * ( 0.5 + _Ind.X );
          Center.Y := _Octree.Cent.Y - _Octree.Size/2 + S * ( 0.5 + _Ind.Y );
          Center.Z := _Octree.Cent.Z - _Octree.Size/2 + S * ( 0.5 + _Ind.Z );

          Center := _Octree.AbsoPose.MultPos( Center );

          Radius := S * Roo2(3) / 2;
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TOcNode.Create( const Octree_:TGLShaperOctree; const Paren_:TOcNode; const Lev_:Cardinal; const Ind_:TCardinal3D );
begin
     inherited Create;

     _Octree := Octree_;
     _Paren  := Paren_;
     _Lev    := Lev_;
     _Ind    := Ind_;
end;

destructor TOcNode.Destroy;
begin
     Clear;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

class function TOcNode.Collision( const Node0_:TOcNode; const Node1_:TOcNode ) :Boolean;
begin
     if Node0_ is TOcKnot then
     begin
          if Node1_ is TOcKnot then
          begin
               Result := TOcNode.Collision( Node0_ as TOcKnot,
                                            Node1_ as TOcKnot );
          end
          else
          begin
               Result := TOcNode.Collision( Node0_ as TOcKnot,
                                            Node1_ as TOcLeaf );
          end;
     end
     else
     begin
          if Node1_ is TOcKnot then
          begin
               Result := TOcNode.Collision( Node0_ as TOcLeaf,
                                            Node1_ as TOcKnot );
          end
          else
          begin
               Result := TOcNode.Collision( Node0_ as TOcLeaf,
                                            Node1_ as TOcLeaf );
          end;
     end;
end;

class function TOcNode.Collision( const Node0_:TOcKnot; const Node1_:TOcKnot ) :Boolean;
var
   B0, B1 :TSingleSphere;
   I0, I1 :Byte;
   C0, C1 :TOcNode;
begin
     B0 := Node0_.BouBal;
     B1 := Node1_.BouBal;

     Result := Distan( B0.Center, B1.Center ) <= ( B0.Radius + B1.Radius );

     if Result then
     begin
          for I0 := 0 to 7 do
          begin
               C0 := Node0_.Childs[ I0 ];
               if Assigned( C0 ) then
               begin
                    for I1 := 0 to 7 do
                    begin
                         C1 := Node1_.Childs[ I1 ];
                         if Assigned( C1 ) then
                         begin
                              if Collision( C0, C1 ) then Exit;
                         end;
                    end;
               end;
          end;

          Result := False;
     end;
end;

class function TOcNode.Collision( const Node0_:TOcNode; const Node1_:TOcLeaf ) :Boolean;
begin
     if Node0_ is TOcKnot then
     begin
          Result := Collision( Node0_ as TOcKnot, Node1_ );
     end
     else
     begin
          Result := Collision( Node0_ as TOcLeaf, Node1_ );
     end;
end;

class function TOcNode.Collision( const Node0_:TOcKnot; const Node1_:TOcLeaf ) :Boolean;
var
   B0, B1 :TSingleSphere;
   I0 :Byte;
   C0 :TOcNode;
begin
     B0 := Node0_.BouBal;
     B1 := Node1_.BouBal;

     Result := Distan( B0.Center, B1.Center ) <= ( B0.Radius + B1.Radius );

     if Result then
     begin
          for I0 := 0 to 7 do
          begin
               C0 := Node0_.Childs[ I0 ];
               if Assigned( C0 ) then
               begin
                    if Collision( C0, Node1_ ) then Exit;
               end;
          end;

          Result := False;
     end;
end;

class function TOcNode.Collision( const Node0_:TOcLeaf; const Node1_:TOcKnot ) :Boolean;
begin
     Result := Collision( Node1_, Node0_ );
end;

class function TOcNode.Collision( const Node0_:TOcLeaf; const Node1_:TOcLeaf ) :Boolean;
var
   B0, B1 :TSingleSphere;
begin
     B0 := Node0_.BouBal;
     B1 := Node1_.BouBal;

     Result := Distan( B0.Center, B1.Center ) <= ( B0.Radius + B1.Radius );
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

constructor TOcKnot.Create( const Octree_:TGLShaperOctree; const Paren_:TOcNode; const Lev_:Cardinal; const Ind_:TCardinal3D );
var
   I :Byte;
begin
     inherited;

     for I := 0 to 7 do _Childs[ I ] := nil;
end;

destructor TOcKnot.Destroy;
begin

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

procedure TOcKnot.ForFamily( const Proc_:TConstProc<Cardinal,TCardinal3D> );
var
   I :Integer;
begin
     Proc_( _Lev, _Ind );

     for I := 0 to 7 do
     begin
          if Assigned( _Childs[ I ] ) then _Childs[ I ].ForFamily( Proc_ );
     end;
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

constructor TOcLeaf.Create( const Octree_:TGLShaperOctree; const Paren_:TOcNode; const Lev_:Cardinal; const Ind_:TCardinal3D );
begin
     inherited;

end;

destructor TOcLeaf.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TOcLeaf.Clear;
begin

end;

//------------------------------------------------------------------------------

procedure TOcLeaf.ForFamily( const Proc_:TConstProc<Cardinal,TCardinal3D> );
begin
     Proc_( _Lev, _Ind );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaperOctree

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLShaperOctree.GetReso :Single;
begin
     Result := _Reso;
end;

procedure TGLShaperOctree.SetReso( const Reso_:Single );
begin
     _Reso := Reso_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLShaperOctree.Create;
begin
     inherited;

     _Root := TOcKnot.Create( Self, nil, 0, TCardinal3D.Create( 0, 0, 0 ) );
     _Reso := 0.05;
end;

destructor TGLShaperOctree.Destroy;
begin
     _Root.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLShaperOctree.Clear;
begin
     _Root.Clear;
end;

//------------------------------------------------------------------------------

procedure TGLShaperOctree.Add( const Ind_:TCardinal3D );
var
   P, C :TOcNode;
   L :Cardinal;
   I :TCardinal3D;
   Id :T1Bit3D;
begin
     P := _Root;
     for L := 1 to _DivL-1 do
     begin
          I  := Ind_ shr ( _DivL - L );
          Id := I.LSB;

          C := P.Childs[ Id.o ];

          if not Assigned( C ) then
          begin
               C := TOcKnot.Create( Self, P, L, I );

               P.Childs[ Id.o ] := C;
          end;

          P := C;
     end;

     Id := Ind_.LSB;

     C := P.Childs[ Id.o ];

     if not Assigned( C ) then
     begin
          C := TOcLeaf.Create( Self, P, _DivL, Ind_ );

          P.Childs[ Id.o ] := C;
     end;
end;

//------------------------------------------------------------------------------

procedure TGLShaperOctree.Generate;
var
   S :Single;
   G :TSingle3D;
   Vs :TDictionary<TCardinal3D,Byte>;
   Es :TGLBufferData<TCardinal3D>;
   Ps :TGLBufferData<TSingle3D>;
   I, X0, X1, Y0, Y1, Z0, Z1, X, Y, Z :Integer;
   T :TSingleTria3D;
   V :TCardinal3D;
   B :TSingleArea3D;
begin
     with Inform.BouBox do
     begin
          _Cent := Center;

          S := LUX.Max( SizeX, SizeY, SizeZ );
     end;

     _DivL := Ceil( Log2( S / _Reso ) );
     _DivN := 1 shl _DivL;

     _Size := _Reso * _DivN;

     G.X := _Cent.X - _Size / 2;
     G.Y := _Cent.Y - _Size / 2;
     G.Z := _Cent.Z - _Size / 2;

     Vs := TDictionary<TCardinal3D,Byte>.Create;

     Es := EleBuf.Map( GL_READ_ONLY );
     Ps := PosBuf.Map( GL_READ_ONLY );

     for I := 0 to EleBuf.Count-1 do
     begin
          with Es[ I ] do
          begin
               T.Poin1 := Ps[ _1 ] - G;
               T.Poin2 := Ps[ _2 ] - G;
               T.Poin3 := Ps[ _3 ] - G;
          end;

          with T.AABB do
          begin
               X0 := Floor( Min.X / _Reso );  X1 := Floor( Max.X / _Reso );
               Y0 := Floor( Min.Y / _Reso );  Y1 := Floor( Max.Y / _Reso );
               Z0 := Floor( Min.Z / _Reso );  Z1 := Floor( Max.Z / _Reso );
          end;

          for Z := Z0 to Z1 do
          begin
               V.Z := Z;

               B.Min.Z := (Z+0) * _Reso;
               B.Max.Z := (Z+1) * _Reso;

               for Y := Y0 to Y1 do
               begin
                    V.Y := Y;

                    B.Min.Y := (Y+0) * _Reso;
                    B.Max.Y := (Y+1) * _Reso;

                    for X := X0 to X1 do
                    begin
                         V.X := X;

                         B.Min.X := (X+0) * _Reso;
                         B.Max.X := (X+1) * _Reso;

                         if T.CollisionPEF( B ) and not Vs.ContainsKey( V ) then Vs.Add( V, 0 );
                    end;
               end;
          end;
     end;

     EleBuf.Unmap;
     PosBuf.Unmap;

     for V in Vs.Keys do Add( V );

     Vs.DisposeOf;
end;

//------------------------------------------------------------------------------

procedure TGLShaperOctree.MakeGrid;
var
   Ps :TArray2<TSingle3D>;
   L :Integer;
   V :TGLShaperVoxels;
   S :Single;
begin
     SetLength( Ps, _DivL+1 );

     _Root.ForFamily( procedure( const L:Cardinal; const I:TCardinal3D )
     begin
          Ps[ L ] := Ps[ L ] + [ TSingle3D.Create( I.X, I.Y, I.Z ) ];
     end );

     DeleteChilds;

     for L := 0 to _DivL do
     begin
          V := TGLShaperVoxels.Create( Self );

          S := _Size / ( 1 shl L );

          V.SizeX := S;
          V.SizeY := S;
          V.SizeZ := S;

          V.PosBuf.Import( Ps[ L ] );

          V.Pose := TSingleM4.Translate( _Cent.X - _Size/2, _Cent.Y - _Size/2, _Cent.Z - _Size/2 );
     end;
end;

//------------------------------------------------------------------------------

function TGLShaperOctree.Collision( const Octree_:TGLShaperOctree ) :Boolean;
begin
     Result := TOcNode.Collision( Root, Octree_.Root );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■