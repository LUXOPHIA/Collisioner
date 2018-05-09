unit LUX.GPU.OpenGL.Shaper.Octree;

interface //#################################################################### ■

uses System.SysUtils, System.UITypes,
     LUX, LUX.D1, LUX.D2, LUX.D3, LUX.M4,
     LUX.Data.Octree.D3,
     LUX.Geometry.D3,
     LUX.GPU.OpenGL,
     LUX.GPU.OpenGL.Atom.Buffer.UniBuf,
     LUX.GPU.OpenGL.Scener,
     LUX.GPU.OpenGL.Camera,
     LUX.GPU.OpenGL.Matery,
     LUX.GPU.OpenGL.Shaper,
     LUX.GPU.OpenGL.Shaper.Preset,
     LUX.GPU.OpenGL.Shaper.Voxels;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaperOctree

     TGLShaperOctree = class( TGLShaperFace )
     private
     protected
       _Size :Single;
       _Cent :TSingle3D;
       _DivL :Cardinal;
       _DivN :Cardinal;
       _Reso :Single;
       _Tree :TOctree3D;
       ///// アクセス
       function GetReso :Single;
       procedure SetReso( const Reso_:Single );
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       property Size :Single    read   _Size              ;
       property Cent :TSingle3D read   _Cent              ;
       property Reso :Single    read GetReso write SetReso;
       property Tree :TOctree3D read   _Tree              ;
       ///// メソッド
       procedure Generate;
       procedure MakeGrid;
       function Collision( const Shaper_:TGLShaperOctree ) :Boolean; overload;
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

     _Tree := TOctree3D.Create;

     _Reso := 0.05;
end;

destructor TGLShaperOctree.Destroy;
begin
     _Tree.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLShaperOctree.Generate;
var
   S :Single;
   G :TSingle3D;
   Vs :TDictionary<TCardinal3D,Byte>;
   Ps :TGLBufferData<TSingle3D>;
   Es :TGLBufferData<TCardinal3D>;
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

     Ps := PosBuf.Map;
     Es := EleBuf.Map;

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

     Ps.DisposeOf;
     Es.DisposeOf;

     with _Tree do
     begin
          DivL := _DivL;
          Area := TSingleArea3D.Create( _Cent.X - _Size/2,
                                        _Cent.Y - _Size/2,
                                        _Cent.Z - _Size/2,
                                        _Cent.X + _Size/2,
                                        _Cent.Y + _Size/2,
                                        _Cent.Z + _Size/2 );

          for V in Vs.Keys do Add( V );
     end;

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

     _Tree.ForFamily( procedure( const Node_:IOcNode3D )
     var
        L :Cardinal;
        I :TCardinal3D;
     begin
          with Node_ do
          begin
               L := Lev;
               I := Ind;
          end;

          Ps[ L ] := Ps[ L ] + [ TSingle3D.Create( I.X, I.Y, I.Z ) ];
     end );

     DeleteChilds;

     for L := _DivL downto 0 do
     begin
          V := TGLShaperVoxels.Create( Self );

          V.Color := TAlphaColorF.Create( 1, 1, 1, 0.5 );

          S := _Size / ( 1 shl L );

          V.SizeX := S;
          V.SizeY := S;
          V.SizeZ := S;

          V.PosBuf.CopyFrom( Ps[ L ] );

          V.Pose := TSingleM4.Translate( _Cent.X - _Size/2, _Cent.Y - _Size/2, _Cent.Z - _Size/2 );
     end;
end;

//------------------------------------------------------------------------------

function TGLShaperOctree.Collision( const Shaper_:TGLShaperOctree ) :Boolean;
var
   T0, T1 :TOctree3D;
begin
     T0 :=         Tree;
     T1 := Shaper_.Tree;

     T0.Pose :=         AbsoPose;
     T1.Pose := Shaper_.AbsoPose;

     Result := T0.Collision( T1 );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■