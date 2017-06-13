unit LUX.GPU.OpenGL.Shaper;

interface //#################################################################### ■

uses Winapi.OpenGL, Winapi.OpenGLext,
     LUX, LUX.D2, LUX.D3, LUX.M4, LUX.Tree,
     LUX.GPU.OpenGL,
     LUX.GPU.OpenGL.Buffer,
     LUX.GPU.OpenGL.Buffer.Unif,
     LUX.GPU.OpenGL.Buffer.Vert,
     LUX.GPU.OpenGL.Buffer.Elem,
     LUX.GPU.OpenGL.Matery;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     TGLScener = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     TCameraDat = record
     private
     public
       Proj :TSingleM4;
       Move :TSingleM4;
     end;

     TShaperDat = record
     private
     public
       Move :TSingleM4;
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLNode

     TGLNode = class( TTreeNode<TGLNode> )
     private
     protected
       _Move :TSingleM4;
       ///// アクセス
       procedure SetMove( const Move_:TSingleM4 ); virtual;
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       property Move :TSingleM4 read _Move write SetMove;
       ///// メソッド
       procedure Draw; virtual;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLWorld

     TGLScener = class( TGLNode )
     private
     protected
       _CameraUs :TGLBufferU<TCameraDat>;
       _GeometUs :TGLBufferU<TShaperDat>;
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       property CameraUs :TGLBufferU<TCameraDat> read _CameraUs;
       property GeometUs :TGLBufferU<TShaperDat> read _GeometUs;
       ///// メソッド
       procedure Compile;
       procedure Render;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLCamera

     TGLCamera = class( TGLNode )
     private
       ///// メソッド
       procedure RegBuf;
     protected
       _Proj :TSingleM4;
       ///// アクセス
       procedure SetMove( const Move_:TSingleM4 ); override;
       procedure SetProj( const Proj_:TSingleM4 ); virtual;
     public
       _No :Integer;
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       property Proj :TSingleM4 read _Proj write SetProj;
       ///// メソッド
       procedure Render;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShape

     TGLShaper = class( TGLNode )
     private
     protected
       _PosBuf   :TGLBufferVS<TSingle3D>;
       _NorBuf   :TGLBufferVS<TSingle3D>;
       _TexBuf   :TGLBufferVS<TSingle2D>;
       _EleBuf   :TGLBufferE32;
       _Material :TGLMaterial;
     public
       constructor Create( const Paren_:ITreeNode ); override;
       destructor Destroy; override;
       ///// プロパティ
       property PosBuf   :TGLBufferVS<TSingle3D> read _PosBuf;
       property NorBuf   :TGLBufferVS<TSingle3D> read _NorBuf;
       property EleBuf   :TGLBufferE32           read _EleBuf;
       property Material :TGLMaterial            read _Material write _Material;
       ///// メソッド
       procedure Draw; override;
       procedure LoadFromFileSTL( const FileName_:String );
       procedure LoadFromFunc( const Func_:TConstFunc<TdSingle2D,TdSingle3D>; const DivU_,DivV_:Integer );
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.SysUtils, System.Classes;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLNode

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

procedure TGLNode.SetMove( const Move_:TSingleM4 );
var
   D :TShaperDat;
begin
     _Move := Move_;

     D.Move := _Move;

     ( RootNode as TGLScener )._GeometUs[ Order ] := D;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLNode.Create;
begin
     inherited;

end;

destructor TGLNode.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLNode.Draw;
begin

end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLWorld

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLScener.Create;
begin
     inherited;

     _CameraUs := TGLBufferU<TCameraDat>.Create( GL_DYNAMIC_DRAW );
     _GeometUs := TGLBufferU<TShaperDat>.Create( GL_DYNAMIC_DRAW );
end;

destructor TGLScener.Destroy;
begin
     _CameraUs.Free;
     _GeometUs.Free;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLScener.Compile;
begin

end;

procedure TGLScener.Render;
var
   I :Integer;
begin
     for I := 0 to ChildsN-1 do Childs[ I ].Draw;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLCamera

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLCamera.RegBuf;
var
   C :TCameraDat;
begin
     C.Proj := _Proj;
     C.Move := _Move;

     ( RootNode as TGLScener ).CameraUs[ _No ] := C;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

procedure TGLCamera.SetMove( const Move_:TSingleM4 );
begin
     inherited;

     _Move := Move_;  RegBuf;
end;

procedure TGLCamera.SetProj( const Proj_:TSingleM4 );
begin
     _Proj := Proj_;  RegBuf;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLCamera.Create;
begin
     inherited;

end;

destructor TGLCamera.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLCamera.Render;
begin
     with ( RootNode as TGLScener ) do
     begin
          CameraUs.Use( 0{BinP}, _No{Offs} );

          Render;

          CameraUs.Unuse( 0{BinP} );
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShape

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLShaper.Create( const Paren_:ITreeNode );
begin
     inherited;

     _PosBuf := TGLBufferVS<TSingle3D>.Create( GL_STATIC_DRAW );
     _NorBuf := TGLBufferVS<TSingle3D>.Create( GL_STATIC_DRAW );
     _TexBuf := TGLBufferVS<TSingle2D>.Create( GL_STATIC_DRAW );
     _EleBuf := TGLBufferE32          .Create( GL_STATIC_DRAW );

     Move := TSingleM4.Identify;
end;

destructor TGLShaper.Destroy;
begin
     _PosBuf.Free;
     _NorBuf.Free;
     _TexBuf.Free;
     _EleBuf.Free;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLShaper.Draw;
begin
     ( RootNode as TGLScener ).GeometUs.Use( 1{BinP}, Order{Offs} );

     _Material.Use;

       _PosBuf.Use( 0 );
       _NorBuf.Use( 1 );
       _TexBuf.Use( 2 );

         _EleBuf.Draw;

       _PosBuf.Unuse( 0 );
       _NorBuf.Unuse( 1 );
       _TexBuf.Unuse( 2 );

     _Material.Unuse;

     ( RootNode as TGLScener ).GeometUs.Unuse( 1{BinP} );
end;

//------------------------------------------------------------------------------

procedure TGLShaper.LoadFromFileSTL( const FileName_:String );
var
   F :TFileStream;
   Hs :array [ 0..80-1 ] of AnsiChar;
   FsN, I :Cardinal;
   Fs :array of packed record
                  Nor  :TSingle3D;
                  Pos1 :TSingle3D;
                  Pos2 :TSingle3D;
                  Pos3 :TSingle3D;
                  _    :Word;
                end;
   E :TCardinal3D;
   Ps, Ns :TGLBufferData<TSingle3D>;
   Es :TGLBufferData<TCardinal3D>;
begin
     F := TFileStream.Create( FileName_, fmOpenRead );

     F.Read( Hs, SizeOf( Hs ) );

     F.Read( FsN, SizeOf( FsN ) );

     SetLength( Fs, FsN );

     F.Read( Fs[0], 50 * FsN );

     F.DisposeOf;

     _PosBuf.Count := 3 * FsN;
     _NorBuf.Count := 3 * FsN;
     _EleBuf.Count :=     FsN;

     Ps := _PosBuf.Map( GL_WRITE_ONLY );
     Ns := _NorBuf.Map( GL_WRITE_ONLY );
     Es := _EleBuf.Map( GL_WRITE_ONLY );

     E.X := 0;
     E.Y := 1;
     E.Z := 2;
     for I := 0 to FsN-1 do
     begin
          with Fs[ I ] do
          begin
               Ns.Items[ E.X ] := Nor;
               Ns.Items[ E.Y ] := Nor;
               Ns.Items[ E.Z ] := Nor;

               Ps.Items[ E.X ] := Pos1;
               Ps.Items[ E.Y ] := Pos2;
               Ps.Items[ E.Z ] := Pos3;
          end;

          Es.Items[ I ] := E;

          Inc( E.X, 3 );
          Inc( E.Y, 3 );
          Inc( E.Z, 3 );
     end;

     _PosBuf.Unmap;
     _NorBuf.Unmap;
     _EleBuf.Unmap;
end;

//------------------------------------------------------------------------------

procedure TGLShaper.LoadFromFunc( const Func_:TConstFunc<TdSingle2D,TdSingle3D>; const DivU_,DivV_:Integer );
//·····························
     function XYtoI( const X_,Y_:Integer ) :Integer;
     begin
          Result := ( DivU_ + 1 ) * Y_ + X_;
     end;
     //························
     procedure MakeVerts;
     var
        C, X, Y, I :Integer;
        Ps, Ns :TGLBufferData<TSingle3D>;
        Ts :TGLBufferData<TSingle2D>;
        T :TSingle2D;
        M :TSingleM4;
     begin
          C := ( DivV_ + 1 ) * ( DivU_ + 1 );

          _PosBuf.Count := C;
          _NorBuf.Count := C;
          _TexBuf.Count := C;

          Ps := _PosBuf.Map( GL_WRITE_ONLY );
          Ns := _NorBuf.Map( GL_WRITE_ONLY );
          Ts := _TexBuf.Map( GL_WRITE_ONLY );

          for Y := 0 to DivV_ do
          begin
               T.V := Y / DivV_;
               for X := 0 to DivU_ do
               begin
                    T.U := X / DivU_;

                    I := XYtoI( X, Y );

                    Ts[ I ] := T;

                    M := Tensor( T, Func_ );

                    Ps[ I ] := M.AxisP;
                    Ns[ I ] := M.AxisZ;
               end;
          end;

          _PosBuf.Unmap;
          _NorBuf.Unmap;
          _TexBuf.Unmap;
     end;
     //························
     procedure MakeElems;
     var
        X0, Y0, X1, Y1, I, I00, I01, I10, I11 :Integer;
        Es :TGLBufferData<TCardinal3D>;
     begin
          _EleBuf.Count := 2 * DivV_ * DivU_;

          Es := _EleBuf.Map( GL_WRITE_ONLY );

          I := 0;
          for Y0 := 0 to DivV_-1 do
          begin
               Y1 := Y0 + 1;
               for X0 := 0 to DivU_-1 do
               begin
                    X1 := X0 + 1;

                    I00 := XYtoI( X0, Y0 );  I01 := XYtoI( X1, Y0 );
                    I10 := XYtoI( X0, Y1 );  I11 := XYtoI( X1, Y1 );

                    //  00───01
                    //  │      │
                    //  │      │
                    //  │      │
                    //  10───11

                    Es[ I ] := TCardinal3D.Create( I00, I10, I11 );  Inc( I );
                    Es[ I ] := TCardinal3D.Create( I11, I01, I00 );  Inc( I );
               end;
          end;

          _EleBuf.Unmap;
     end;
//·····························
begin
     MakeVerts;
     MakeElems;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
