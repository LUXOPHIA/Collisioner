unit LUX.GPU.OpenGL.Shaper;

interface //#################################################################### ■

uses Winapi.OpenGL, Winapi.OpenGLext,
     LUX, LUX.D2, LUX.D3, LUX.M4, LUX.Tree,
     LUX.GPU.OpenGL,
     LUX.GPU.OpenGL.Buffer,
     LUX.GPU.OpenGL.Buffer.Verter,
     LUX.GPU.OpenGL.Buffer.Elemer,
     LUX.GPU.OpenGL.Scener,
     LUX.GPU.OpenGL.Matery;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaper

     TGLShaper = class( TGLNode, IGLShaper )
     private
     protected
       _Matery :IGLMatery;
     public
       constructor Create( const Paren_:ITreeNode ); override;
       destructor Destroy; override;
       ///// プロパティ
       property Matery :IGLMatery read _Matery write _Matery;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaperPoly

     TGLShaperPoly = class( TGLShaper )
     private
     protected
       _PosBuf :TGLVerterS<TSingle3D>;
       _NorBuf :TGLVerterS<TSingle3D>;
       _TexBuf :TGLVerterS<TSingle2D>;
       _EleBuf :TGLElemer32;
     public
       constructor Create( const Paren_:ITreeNode ); override;
       destructor Destroy; override;
       ///// プロパティ
       property PosBuf :TGLVerterS<TSingle3D> read _PosBuf;
       property NorBuf :TGLVerterS<TSingle3D> read _NorBuf;
       property TexBuf :TGLVerterS<TSingle2D> read _TexBuf;
       property EleBuf :TGLElemer32           read _EleBuf;
       ///// メソッド
       procedure Draw; override;
       procedure LoadFromFunc( const Func_:TConstFunc<TdSingle2D,TdSingle3D>; const DivU_,DivV_:Integer );
       procedure LoadFromFileSTL( const FileName_:String );
       procedure LoadFromFileOBJ( const FileName_:String );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaperCopy

     TGLShaperCopy = class( TGLShaper )
     private
     protected
       _Shaper :TGLShaperPoly;
     public
       constructor Create( const Paren_:ITreeNode ); override;
       destructor Destroy; override;
       ///// プロパティ
       property Shaper :TGLShaperPoly read _Shaper write _Shaper;
       ///// メソッド
       procedure Draw; override;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.SysUtils, System.Classes, System.RegularExpressions;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaper

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLShaper.Create( const Paren_:ITreeNode );
begin
     inherited;

end;

destructor TGLShaper.Destroy;
begin

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaperPoly

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLShaperPoly.Create( const Paren_:ITreeNode );
begin
     inherited;

     _PosBuf := TGLVerterS<TSingle3D>.Create( GL_STATIC_DRAW );
     _NorBuf := TGLVerterS<TSingle3D>.Create( GL_STATIC_DRAW );
     _TexBuf := TGLVerterS<TSingle2D>.Create( GL_STATIC_DRAW );
     _EleBuf := TGLElemer32          .Create( GL_STATIC_DRAW );
end;

destructor TGLShaperPoly.Destroy;
begin
     _PosBuf.DisposeOf;
     _NorBuf.DisposeOf;
     _TexBuf.DisposeOf;
     _EleBuf.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLShaperPoly.Draw;
begin
     inherited;

     _Matery.Use;

     _PosBuf.Use( 0{BinP} );
     _NorBuf.Use( 1{BinP} );
     _TexBuf.Use( 2{BinP} );

     _EleBuf.Draw;
end;

//------------------------------------------------------------------------------

procedure TGLShaperPoly.LoadFromFunc( const Func_:TConstFunc<TdSingle2D,TdSingle3D>; const DivU_,DivV_:Integer );
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

//------------------------------------------------------------------------------

procedure TGLShaperPoly.LoadFromFileSTL( const FileName_:String );
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
     try
        F.Read( Hs, SizeOf( Hs ) );

        F.Read( FsN, SizeOf( FsN ) );

        SetLength( Fs, FsN );

        F.Read( Fs[0], 50 * FsN );
     finally
            F.DisposeOf;
     end;

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

procedure TGLShaperPoly.LoadFromFileOBJ( const FileName_:String );
var
   S :TStreamReader;
   L :String;
   RP, RN, RT, RF, RI :TRegEx;
   MP, MN, MT :TMatch;
   MIs :TMatchCollection;
   P, N :TSingle3D;
   Ps, Ns, Ps2 :TArray<TSingle3D>;
   FP, FN :TCardinal3D;
   FPs, FNs :TArray<TCardinal3D>;
   I :Integer;
begin
     S := TStreamReader.Create( FileName_, TEncoding.Default );

     RP := TRegEx.Create( 'v +([^ ]+) +([^ ]+) +([^ ]+)', [ roIgnoreCase, roCompiled ] );
     RN := TRegEx.Create( 'vn +([^ ]+) +([^ ]+) +([^ ]+)', [ roIgnoreCase, roCompiled ] );
     RT := TRegEx.Create( 'vt +([^ ]+) +([^ ]+)', [ roIgnoreCase, roCompiled ] );

     RF := TRegEx.Create( '^f +', [ roIgnoreCase, roCompiled ] );
     RI := TRegEx.Create( '(\d+)/?(\d*)/?(\d*)', [ roIgnoreCase, roCompiled ] );

     Ps := [];  FPs := [];
     Ns := [];  FNs := [];

     while not S.EndOfStream do
     begin
          L := S.ReadLine;

          MP := RP.Match( L );
          MN := RN.Match( L );
          MT := RT.Match( L );

          if MP.Success then
          begin
               Assert( MP.Groups.Count = 4 );

               P.X := MP.Groups[ 1 ].Value.ToSingle;
               P.Y := MP.Groups[ 2 ].Value.ToSingle;
               P.Z := MP.Groups[ 3 ].Value.ToSingle;

               N := TSingle3D.Create( 0, 0, 1 );

               Ps := Ps + [ P ];
          end
          else
          if MN.Success then
          begin
               Assert( MN.Groups.Count = 4 );

               N.X := MN.Groups[ 1 ].Value.ToSingle;
               N.Y := MN.Groups[ 2 ].Value.ToSingle;
               N.Z := MN.Groups[ 3 ].Value.ToSingle;

               Ns := Ns + [ N ];
          end
          else
          if MT.Success then
          begin
               Assert( MT.Groups.Count = 3 );

          end
          else
          if RF.IsMatch( L ) then
          begin
               MIs := RI.Matches( L );

               Assert( MIs.Count >= 3 );

               FP.X := MIs[ 0 ].Groups[ 1 ].Value.ToInteger - 1;
               FP.Y := MIs[ 1 ].Groups[ 1 ].Value.ToInteger - 1;
               FP.Z := MIs[ 2 ].Groups[ 1 ].Value.ToInteger - 1;

               FN.X := MIs[ 0 ].Groups[ 3 ].Value.ToInteger - 1;
               FN.Y := MIs[ 1 ].Groups[ 3 ].Value.ToInteger - 1;
               FN.Z := MIs[ 2 ].Groups[ 3 ].Value.ToInteger - 1;

               FPs := FPs + [ FP ];
               FNs := FNs + [ FN ];

               if MIs.Count = 4 then
               begin
                    FP.X := MIs[ 2 ].Groups[ 1 ].Value.ToInteger - 1;
                    FP.Y := MIs[ 3 ].Groups[ 1 ].Value.ToInteger - 1;
                    FP.Z := MIs[ 0 ].Groups[ 1 ].Value.ToInteger - 1;

                    FN.X := MIs[ 2 ].Groups[ 3 ].Value.ToInteger - 1;
                    FN.Y := MIs[ 3 ].Groups[ 3 ].Value.ToInteger - 1;
                    FN.Z := MIs[ 0 ].Groups[ 3 ].Value.ToInteger - 1;

                    FPs := FPs + [ FP ];
                    FNs := FNs + [ FN ];
               end;
          end;
     end;

     S.DisposeOf;

     SetLength( Ps2, Length( FNs ) );

     for I := 0 to High( FNs ) do
     begin
          with FNs[ I ] do
          begin
               Ps2[ X ] := Ps[ FPs[ I ].X ];
               Ps2[ Y ] := Ps[ FPs[ I ].Y ];
               Ps2[ Z ] := Ps[ FPs[ I ].Z ];
          end;
     end;

     _PosBuf.Import( Ps2 );
     _NorBuf.Import( Ns  );
     _EleBuf.Import( FNs );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaperCopy

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLShaperCopy.Create( const Paren_:ITreeNode );
begin
     inherited;

end;

destructor TGLShaperCopy.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLShaperCopy.Draw;
begin
     inherited;

     _Matery.Use;

     _Shaper.PosBuf.Use( 0{BinP} );
     _Shaper.NorBuf.Use( 1{BinP} );
     _Shaper.TexBuf.Use( 2{BinP} );

     _Shaper.EleBuf.Draw;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
