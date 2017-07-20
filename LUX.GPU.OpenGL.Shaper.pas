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

     TGLShaper         = class;
     TGLShaperPoin     = class;
     TGLShaperLine     = class;
     TGLShaperFace     = class;
     TGLShaperCopy     = class;
     TGLShaperLineCube = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaper

     TGLShaper = class( TGLNode, IGLShaper )
     private
     protected
       _Matery :IGLMatery;
       ///// メソッド
       procedure BeginDraw; override;
       procedure EndDraw; override;
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       property Matery :IGLMatery read _Matery write _Matery;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaperPoin

     TGLShaperPoin = class( TGLShaper )
     private
     protected
       _PosBuf :TGLVerterS<TSingle3D>;
       _NorBuf :TGLVerterS<TSingle3D>;
       _TexBuf :TGLVerterS<TSingle2D>;
       ///// メソッド
       procedure BeginDraw; override;
       procedure DrawMain; override;
       procedure EndDraw; override;
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       property PosBuf :TGLVerterS<TSingle3D> read _PosBuf;
       property NorBuf :TGLVerterS<TSingle3D> read _NorBuf;
       property TexBuf :TGLVerterS<TSingle2D> read _TexBuf;
       ///// メソッド
       procedure CalcBouBox; override;
       procedure LoadFromFunc( const Func_:TConstFunc<TdSingle2D,TdSingle3D>; const DivU_,DivV_:Integer ); virtual;
       procedure LoadFromFileSTL( const FileName_:String );
       procedure LoadFromFileOBJ( const FileName_:String );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaperLine

     TGLShaperLine = class( TGLShaperPoin )
     private
     protected
       _EleBuf :TGLElemerLine32;
       _LineW  :Single;
       ///// メソッド
       procedure BeginDraw; override;
       procedure DrawMain; override;
       procedure EndDraw; override;
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       property EleBuf :TGLElemerLine32 read _EleBuf             ;
       property LineW  :Single          read _LineW  write _LineW;
       ///// メソッド
       procedure LoadFromFunc( const Func_:TConstFunc<TdSingle2D,TdSingle3D>; const DivU_,DivV_:Integer ); override;
       procedure LoadFromFileSTL( const FileName_:String );
       procedure LoadFromFileOBJ( const FileName_:String );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaperFace

     TGLShaperFace = class( TGLShaperPoin )
     private
     protected
       _EleBuf :TGLElemerFace32;
       ///// メソッド
       procedure DrawMain; override;
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       property EleBuf :TGLElemerFace32 read _EleBuf;
       ///// メソッド
       procedure LoadFromFunc( const Func_:TConstFunc<TdSingle2D,TdSingle3D>; const DivU_,DivV_:Integer ); override;
       procedure LoadFromFileSTL( const FileName_:String );
       procedure LoadFromFileOBJ( const FileName_:String );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaperCopy

     TGLShaperCopy = class( TGLShaper )
     private
     protected
       _Shaper :TGLShaperPoin;
       ///// アクセス
       function GetShaper :TGLShaperPoin;
       procedure SetShaper( const Shaper_:TGLShaperPoin );
       ///// メソッド
       procedure BeginDraw; override;
       procedure DrawMain; override;
       procedure EndDraw; override;
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       property Shaper :TGLShaperPoin read GetShaper write SetShaper;
       ///// メソッド
       procedure CalcBouBox; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaperLineCube

     TGLShaperLineCube = class( TGLShaperLine )
     private
       ///// メソッド
       procedure MakeModel;
     protected
       _SizeX :Single;
       _SizeY :Single;
       _SizeZ :Single;
       ///// アクセス
       function GetSizeX :Single;
       procedure SetSizeX( const SizeX_:Single );
       function GetSizeY :Single;
       procedure SetSizeY( const SizeY_:Single );
       function GetSizeZ :Single;
       procedure SetSizeZ( const SizeZ_:Single );
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       property SizeX :Single read GetSizeX write SetSizeX;
       property SizeY :Single read GetSizeY write SetSizeY;
       property SizeZ :Single read GetSizeZ write SetSizeZ;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.SysUtils, System.Classes, System.RegularExpressions, System.Generics.Collections;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaper

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLShaper.BeginDraw;
begin
     inherited;

     if Assigned( _Matery ) then _Matery.Use;
end;

procedure TGLShaper.EndDraw;
begin
     if Assigned( _Matery ) then _Matery.Unuse;

     inherited;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLShaper.Create;
begin
     inherited;

end;

destructor TGLShaper.Destroy;
begin

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaperPoin

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLShaperPoin.BeginDraw;
begin
     inherited;

     _PosBuf.Use( 0{BinP} );
     _NorBuf.Use( 1{BinP} );
     _TexBuf.Use( 2{BinP} );
end;

procedure TGLShaperPoin.DrawMain;
begin
     glDrawArrays( GL_POINTS, 0, _PosBuf.Count );
end;

procedure TGLShaperPoin.EndDraw;
begin
     _PosBuf.Unuse( 0{BinP} );
     _NorBuf.Unuse( 1{BinP} );
     _TexBuf.Unuse( 2{BinP} );

     inherited;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLShaperPoin.Create;
begin
     inherited;

     _PosBuf := TGLVerterS<TSingle3D>.Create( GL_STATIC_DRAW );
     _NorBuf := TGLVerterS<TSingle3D>.Create( GL_STATIC_DRAW );
     _TexBuf := TGLVerterS<TSingle2D>.Create( GL_STATIC_DRAW );
end;

destructor TGLShaperPoin.Destroy;
begin
     _PosBuf.DisposeOf;
     _NorBuf.DisposeOf;
     _TexBuf.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLShaperPoin.CalcBouBox;
var
   P :TGLBufferData<TSingle3D>;
   I :Integer;
begin
     inherited;

     P := _PosBuf.Map( GL_READ_ONLY );

     for I := 0 to _PosBuf.Count-1 do
     begin
          with P[ I ] do
          begin
               if X < _BouBox.Min.X then _BouBox.Min.X := X
                                    else
               if _BouBox.Max.X < X then _BouBox.Max.X := X;

               if Y < _BouBox.Min.Y then _BouBox.Min.Y := Y
                                    else
               if _BouBox.Max.Y < Y then _BouBox.Max.Y := Y;

               if Z < _BouBox.Min.Z then _BouBox.Min.Z := Z
                                    else
               if _BouBox.Max.Z < Z then _BouBox.Max.Z := Z;
          end;
     end;

     _PosBuf.Unmap;
end;

//------------------------------------------------------------------------------

procedure TGLShaperPoin.LoadFromFunc( const Func_:TConstFunc<TdSingle2D,TdSingle3D>; const DivU_,DivV_:Integer );
//··································
     function XYtoI( const X_,Y_:Integer ) :Integer;
     begin
          Result := ( DivU_ + 1 ) * Y_ + X_;
     end;
//··································
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

     CalcBouBox;
end;

//------------------------------------------------------------------------------

procedure TGLShaperPoin.LoadFromFileSTL( const FileName_:String );
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

     Ps := _PosBuf.Map( GL_WRITE_ONLY );
     Ns := _NorBuf.Map( GL_WRITE_ONLY );

     E.X := 0;
     E.Y := 1;
     E.Z := 2;
     for I := 0 to FsN-1 do
     begin
          with Fs[ I ] do
          begin
               Ps.Items[ E.X ] := Pos1;
               Ps.Items[ E.Y ] := Pos2;
               Ps.Items[ E.Z ] := Pos3;

               Ns.Items[ E.X ] := Nor;
               Ns.Items[ E.Y ] := Nor;
               Ns.Items[ E.Z ] := Nor;
          end;

          Inc( E.X, 3 );
          Inc( E.Y, 3 );
          Inc( E.Z, 3 );
     end;

     _PosBuf.Unmap;
     _NorBuf.Unmap;

     CalcBouBox;
end;

//------------------------------------------------------------------------------

procedure TGLShaperPoin.LoadFromFileOBJ( const FileName_:String );
type
    TVert = record
      P :Integer;
      N :Integer;
      T :Integer;
    end;
var
   Vs :TDictionary<TVert,Integer>;
//·····································
     function ReadVert( const M_:TMatch ) :Cardinal;
     var
        V :TVert;
     begin
          with V do
          begin
               P := StrToIntDef( M_.Groups[ 1 ].Value, 0 ) - 1;
               T := StrToIntDef( M_.Groups[ 2 ].Value, 0 ) - 1;
               N := StrToIntDef( M_.Groups[ 3 ].Value, 0 ) - 1;
          end;

          if Vs.ContainsKey( V ) then Result := Vs[ V ]
          else
          begin
               Result := Vs.Count;  Vs.Add( V, Result );
          end;
     end;
//·····································
var
   F :TStreamReader;
   RV, RN, RT, RF, RI :TRegEx;
   Ps, Ns :TArray<TSingle3D>;
   Ts :TArray<TSingle2D>;
   L :String; 
   P, N :TSingle3D;
   T :TSingle2D;
   Ms :TMatchCollection;
   K :Integer;
   V :TPair<TVert,Integer>;
begin
     Vs := TDictionary<TVert,Integer>.Create;

     F := TStreamReader.Create( FileName_, TEncoding.Default );
     try
          RV := TRegEx.Create( 'v[ \t]+([^ \t]+)[ \t]+([^ \t]+)[ \t]+([^ \t\n]+)' );
          RN := TRegEx.Create( 'vn[ \t]+([^ \t]+)[ \t]+([^ \t]+)[ \t]+([^ \t\n]+)' );
          RT := TRegEx.Create( 'vt[ \t]+([^ \t]+)[ \t]+([^ \t]+)' );
          RF := TRegEx.Create( 'f( [^\n]+)' );
          RI := TRegEx.Create( '[ \t]+(\d+)/?(\d*)/?(\d*)' );

          Ps := [];
          Ns := [];
          Ts := [];
          while not F.EndOfStream do
          begin
               L := F.ReadLine;

               with RV.Match( L ) do
               begin
                    if Success then
                    begin
                         P.X := Groups[ 1 ].Value.ToSingle;
                         P.Y := Groups[ 2 ].Value.ToSingle;
                         P.Z := Groups[ 3 ].Value.ToSingle;

                         Ps := Ps + [ P ];
                    end;
               end;

               with RN.Match( L ) do
               begin
                    if Success then
                    begin
                         N.X := Groups[ 1 ].Value.ToSingle;
                         N.Y := Groups[ 2 ].Value.ToSingle;
                         N.Z := Groups[ 3 ].Value.ToSingle;

                         Ns := Ns + [ N ];
                    end;
               end;

               with RT.Match( L ) do
               begin
                    if Success then
                    begin
                         T.X := Groups[ 1 ].Value.ToSingle;
                         T.Y := Groups[ 2 ].Value.ToSingle;

                         Ts := Ts + [ T ];
                    end;
               end;

               with RF.Match( L ) do
               begin
                    if Success then
                    begin
                         Ms := RI.Matches( Groups[ 1 ].Value );

                         for K := 0 to Ms.Count-1 do ReadVert( Ms[ K ] );
                    end;
               end;
          end;
     finally
            F.DisposeOf;
     end;

     if Length( Ps ) > 0 then
     begin
          with _PosBuf do
          begin
               Count := Vs.Count;

               with Map( GL_WRITE_ONLY ) do
               begin
                    for V in Vs do Items[ V.Value ] := Ps[ V.Key.P ];
               end;

               Unmap;
          end;
     end;

     if Length( Ns ) > 0 then
     begin
          with _NorBuf do
          begin
               Count := Vs.Count;

               with Map( GL_WRITE_ONLY ) do
               begin
                    for V in Vs do Items[ V.Value ] := Ns[ V.Key.N ];
               end;

               Unmap;
          end;
     end;

     if Length( Ts ) > 0 then
     begin
          with _TexBuf do
          begin
               Count := Vs.Count;

               with Map( GL_WRITE_ONLY ) do
               begin
                    for V in Vs do Items[ V.Value ] := Ts[ V.Key.T ];
               end;

               Unmap;
          end;
     end;

     Vs.DisposeOf;

     CalcBouBox;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaperLine

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLShaperLine.BeginDraw;
begin
     inherited;

     glLineWidth( _LineW );
end;

procedure TGLShaperLine.DrawMain;
begin
     _EleBuf.Draw;
end;

procedure TGLShaperLine.EndDraw;
begin

     inherited;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLShaperLine.Create;
begin
     inherited;

     _EleBuf := TGLElemerLine32.Create( GL_STATIC_DRAW );

     _LineW := 1;
end;

destructor TGLShaperLine.Destroy;
begin
     _EleBuf.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLShaperLine.LoadFromFunc( const Func_:TConstFunc<TdSingle2D,TdSingle3D>; const DivU_,DivV_:Integer );
//··································
     function XYtoI( const X_,Y_:Integer ) :Integer;
     begin
          Result := ( DivU_ + 1 ) * Y_ + X_;
     end;
//··································
var
   X, Y, I, I0, I1 :Integer;
   Es :TGLBufferData<TCardinal2D>;
begin
     inherited;

     _EleBuf.Count := DivV_ * ( DivU_+1 ) + ( DivV_+1 ) * DivU_;

     Es := _EleBuf.Map( GL_WRITE_ONLY );

     I := 0;

     for Y := 0 to DivV_ do
     begin
          for X := 0 to DivU_-1 do
          begin
               I0 := XYtoI( X+0, Y );
               I1 := XYtoI( X+1, Y );

               Es[ I ] := TCardinal2D.Create( I0, I1 );  Inc( I );
          end;
     end;

     for X := 0 to DivU_ do
     begin
          for Y := 0 to DivV_-1 do
          begin
               I0 := XYtoI( X, Y+0 );
               I1 := XYtoI( X, Y+1 );

               Es[ I ] := TCardinal2D.Create( I0, I1 );  Inc( I );
          end;
     end;

     _EleBuf.Unmap;
end;

//------------------------------------------------------------------------------

procedure TGLShaperLine.LoadFromFileSTL( const FileName_:String );
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
   Es :TGLBufferData<TCardinal2D>;
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
     _EleBuf.Count := 3 * FsN;

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
               Ps.Items[ E.X ] := Pos1;
               Ps.Items[ E.Y ] := Pos2;
               Ps.Items[ E.Z ] := Pos3;

               Ns.Items[ E.X ] := Nor;
               Ns.Items[ E.Y ] := Nor;
               Ns.Items[ E.Z ] := Nor;
          end;

          Es.Items[ I*3+0 ] := TCardinal2D.Create( E.X, E.Y );
          Es.Items[ I*3+1 ] := TCardinal2D.Create( E.Y, E.Z );
          Es.Items[ I*3+2 ] := TCardinal2D.Create( E.Z, E.X );

          Inc( E.X, 3 );
          Inc( E.Y, 3 );
          Inc( E.Z, 3 );
     end;

     _PosBuf.Unmap;
     _NorBuf.Unmap;
     _EleBuf.Unmap;
end;

//------------------------------------------------------------------------------

procedure TGLShaperLine.LoadFromFileOBJ( const FileName_:String );
type
    TVert = record
      P :Integer;
      N :Integer;
      T :Integer;
    end;
var
   Vs :TDictionary<TVert,Integer>;
//·····································
     function ReadVert( const M_:TMatch ) :Cardinal;
     var
        V :TVert;
     begin
          with V do
          begin
               P := StrToIntDef( M_.Groups[ 1 ].Value, 0 ) - 1;
               T := StrToIntDef( M_.Groups[ 2 ].Value, 0 ) - 1;
               N := StrToIntDef( M_.Groups[ 3 ].Value, 0 ) - 1;
          end;

          if Vs.ContainsKey( V ) then Result := Vs[ V ]
          else
          begin
               Result := Vs.Count;  Vs.Add( V, Result );
          end;
     end;
//·····································
var
   F :TStreamReader;
   RV, RN, RT, RF, RI :TRegEx;
   Ps, Ns :TArray<TSingle3D>;
   Ts :TArray<TSingle2D>;
   L :String; 
   P, N :TSingle3D;
   T :TSingle2D;
   Es :TArray<TCardinal2D>;
   Ms :TMatchCollection;
   E :TCardinal2D;
   K :Integer;
   V :TPair<TVert,Integer>;
begin
     Vs := TDictionary<TVert,Integer>.Create;

     F := TStreamReader.Create( FileName_, TEncoding.Default );
     try
          RV := TRegEx.Create( 'v[ \t]+([^ \t]+)[ \t]+([^ \t]+)[ \t]+([^ \t\n]+)' );
          RN := TRegEx.Create( 'vn[ \t]+([^ \t]+)[ \t]+([^ \t]+)[ \t]+([^ \t\n]+)' );
          RT := TRegEx.Create( 'vt[ \t]+([^ \t]+)[ \t]+([^ \t]+)' );
          RF := TRegEx.Create( 'f( [^\n]+)' );
          RI := TRegEx.Create( '[ \t]+(\d+)/?(\d*)/?(\d*)' );

          Ps := [];
          Ns := [];
          Ts := [];
          Es := [];
          while not F.EndOfStream do
          begin
               L := F.ReadLine;

               with RV.Match( L ) do
               begin
                    if Success then
                    begin
                         P.X := Groups[ 1 ].Value.ToSingle;
                         P.Y := Groups[ 2 ].Value.ToSingle;
                         P.Z := Groups[ 3 ].Value.ToSingle;

                         Ps := Ps + [ P ];
                    end;
               end;

               with RN.Match( L ) do
               begin
                    if Success then
                    begin
                         N.X := Groups[ 1 ].Value.ToSingle;
                         N.Y := Groups[ 2 ].Value.ToSingle;
                         N.Z := Groups[ 3 ].Value.ToSingle;

                         Ns := Ns + [ N ];
                    end;
               end;

               with RT.Match( L ) do
               begin
                    if Success then
                    begin
                         T.X := Groups[ 1 ].Value.ToSingle;
                         T.Y := Groups[ 2 ].Value.ToSingle;

                         Ts := Ts + [ T ];
                    end;
               end;

               with RF.Match( L ) do
               begin
                    if Success then
                    begin
                         Ms := RI.Matches( Groups[ 1 ].Value );

                         E.X := ReadVert( Ms[ 0 ] );
                         E.Y := ReadVert( Ms[ 1 ] );

                         Es := Es + [ E ];

                         for K := 2 to Ms.Count-1 do
                         begin
                              E.X := E.Y;  E.Y := ReadVert( Ms[ K ] );

                              Es := Es + [ E ];
                         end;
                    end;
               end;
          end;
     finally
            F.DisposeOf;
     end;

     if Length( Ps ) > 0 then
     begin
          with _PosBuf do
          begin
               Count := Vs.Count;

               with Map( GL_WRITE_ONLY ) do
               begin
                    for V in Vs do Items[ V.Value ] := Ps[ V.Key.P ];
               end;

               Unmap;
          end;
     end;

     if Length( Ns ) > 0 then
     begin
          with _NorBuf do
          begin
               Count := Vs.Count;

               with Map( GL_WRITE_ONLY ) do
               begin
                    for V in Vs do Items[ V.Value ] := Ns[ V.Key.N ];
               end;

               Unmap;
          end;
     end;

     if Length( Ts ) > 0 then
     begin
          with _TexBuf do
          begin
               Count := Vs.Count;

               with Map( GL_WRITE_ONLY ) do
               begin
                    for V in Vs do Items[ V.Value ] := Ts[ V.Key.T ];
               end;

               Unmap;
          end;
     end;

     Vs.DisposeOf;

     _EleBuf.Import( Es );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaperFace

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLShaperFace.DrawMain;
begin
     _EleBuf.Draw;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLShaperFace.Create;
begin
     inherited;

     _EleBuf := TGLElemerFace32.Create( GL_STATIC_DRAW );
end;

destructor TGLShaperFace.Destroy;
begin
     _EleBuf.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLShaperFace.LoadFromFunc( const Func_:TConstFunc<TdSingle2D,TdSingle3D>; const DivU_,DivV_:Integer );
//··································
     function XYtoI( const X_,Y_:Integer ) :Integer;
     begin
          Result := ( DivU_ + 1 ) * Y_ + X_;
     end;
//··································
var
   X0, Y0, X1, Y1, I, I00, I01, I10, I11 :Integer;
   Es :TGLBufferData<TCardinal3D>;
begin
     inherited;

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

//------------------------------------------------------------------------------

procedure TGLShaperFace.LoadFromFileSTL( const FileName_:String );
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
               Ps.Items[ E.X ] := Pos1;
               Ps.Items[ E.Y ] := Pos2;
               Ps.Items[ E.Z ] := Pos3;

               Ns.Items[ E.X ] := Nor;
               Ns.Items[ E.Y ] := Nor;
               Ns.Items[ E.Z ] := Nor;
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

procedure TGLShaperFace.LoadFromFileOBJ( const FileName_:String );
type
    TVert = record
      P :Integer;
      N :Integer;
      T :Integer;
    end;
var
   Vs :TDictionary<TVert,Integer>;
//·····································
     function ReadVert( const M_:TMatch ) :Cardinal;
     var
        V :TVert;
     begin
          with V do
          begin
               P := StrToIntDef( M_.Groups[ 1 ].Value, 0 ) - 1;
               T := StrToIntDef( M_.Groups[ 2 ].Value, 0 ) - 1;
               N := StrToIntDef( M_.Groups[ 3 ].Value, 0 ) - 1;
          end;

          if Vs.ContainsKey( V ) then Result := Vs[ V ]
          else
          begin
               Result := Vs.Count;  Vs.Add( V, Result );
          end;
     end;
//·····································
var
   F :TStreamReader;
   RV, RN, RT, RF, RI :TRegEx;
   Ps, Ns :TArray<TSingle3D>;
   Ts :TArray<TSingle2D>;
   L :String; 
   P, N :TSingle3D;
   T :TSingle2D;
   Es :TArray<TCardinal3D>;
   Ms :TMatchCollection;
   E :TCardinal3D;
   K :Integer;
   V :TPair<TVert,Integer>;
begin
     Vs := TDictionary<TVert,Integer>.Create;

     F := TStreamReader.Create( FileName_, TEncoding.Default );
     try
          RV := TRegEx.Create( 'v[ \t]+([^ \t]+)[ \t]+([^ \t]+)[ \t]+([^ \t\n]+)' );
          RN := TRegEx.Create( 'vn[ \t]+([^ \t]+)[ \t]+([^ \t]+)[ \t]+([^ \t\n]+)' );
          RT := TRegEx.Create( 'vt[ \t]+([^ \t]+)[ \t]+([^ \t]+)' );
          RF := TRegEx.Create( 'f( [^\n]+)' );
          RI := TRegEx.Create( '[ \t]+(\d+)/?(\d*)/?(\d*)' );

          Ps := [];
          Ns := [];
          Ts := [];
          Es := [];
          while not F.EndOfStream do
          begin
               L := F.ReadLine;

               with RV.Match( L ) do
               begin
                    if Success then
                    begin
                         P.X := Groups[ 1 ].Value.ToSingle;
                         P.Y := Groups[ 2 ].Value.ToSingle;
                         P.Z := Groups[ 3 ].Value.ToSingle;

                         Ps := Ps + [ P ];
                    end;
               end;

               with RN.Match( L ) do
               begin
                    if Success then
                    begin
                         N.X := Groups[ 1 ].Value.ToSingle;
                         N.Y := Groups[ 2 ].Value.ToSingle;
                         N.Z := Groups[ 3 ].Value.ToSingle;

                         Ns := Ns + [ N ];
                    end;
               end;

               with RT.Match( L ) do
               begin
                    if Success then
                    begin
                         T.X := Groups[ 1 ].Value.ToSingle;
                         T.Y := Groups[ 2 ].Value.ToSingle;

                         Ts := Ts + [ T ];
                    end;
               end;

               with RF.Match( L ) do
               begin
                    if Success then
                    begin
                         Ms := RI.Matches( Groups[ 1 ].Value );

                         E.X := ReadVert( Ms[ 0 ] );
                         E.Y := ReadVert( Ms[ 1 ] );
                         E.Z := ReadVert( Ms[ 2 ] );

                         Es := Es + [ E ];

                         for K := 3 to Ms.Count-1 do
                         begin
                              E.Y := E.Z;  E.Z := ReadVert( Ms[ K ] );

                              Es := Es + [ E ];
                         end;
                    end;
               end;
          end;
     finally
            F.DisposeOf;
     end;

     if Length( Ps ) > 0 then
     begin
          with _PosBuf do
          begin
               Count := Vs.Count;

               with Map( GL_WRITE_ONLY ) do
               begin
                    for V in Vs do Items[ V.Value ] := Ps[ V.Key.P ];
               end;

               Unmap;
          end;
     end;

     if Length( Ns ) > 0 then
     begin
          with _NorBuf do
          begin
               Count := Vs.Count;

               with Map( GL_WRITE_ONLY ) do
               begin
                    for V in Vs do Items[ V.Value ] := Ns[ V.Key.N ];
               end;

               Unmap;
          end;
     end;

     if Length( Ts ) > 0 then
     begin
          with _TexBuf do
          begin
               Count := Vs.Count;

               with Map( GL_WRITE_ONLY ) do
               begin
                    for V in Vs do Items[ V.Value ] := Ts[ V.Key.T ];
               end;

               Unmap;
          end;
     end;

     Vs.DisposeOf;

     _EleBuf.Import( Es );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaperCopy

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLShaperCopy.GetShaper :TGLShaperPoin;
begin
     Result := _Shaper;
end;

procedure TGLShaperCopy.SetShaper( const Shaper_:TGLShaperPoin );
begin
     _Shaper := Shaper_;

     CalcBouBox;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLShaperCopy.BeginDraw;
begin
     inherited;

     with _Shaper do
     begin
          if not Assigned( Self._Matery ) then Matery.Use;

          PosBuf.Use( 0{BinP} );
          NorBuf.Use( 1{BinP} );
          TexBuf.Use( 2{BinP} );
     end;
end;

procedure TGLShaperCopy.DrawMain;
begin
     _Shaper.DrawMain;
end;

procedure TGLShaperCopy.EndDraw;
begin
     with _Shaper do
     begin
          PosBuf.Unuse( 0{BinP} );
          NorBuf.Unuse( 1{BinP} );
          TexBuf.Unuse( 2{BinP} );

          if not Assigned( Self._Matery ) then Matery.Use;
     end;

     inherited;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLShaperCopy.Create;
begin
     inherited;

end;

destructor TGLShaperCopy.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLShaperCopy.CalcBouBox;
begin
     _BouBox := _Shaper.BouBox;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaperLineCube

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLShaperLineCube.MakeModel;
var
   SX, SY, SZ :Single;
begin
     SX := _SizeX / 2;
     SY := _SizeY / 2;
     SZ := _SizeZ / 2;

     _PosBuf[ 0 ] := TSingle3D.Create( -SX, -SY, -SZ );
     _PosBuf[ 1 ] := TSingle3D.Create( +SX, -SY, -SZ );
     _PosBuf[ 2 ] := TSingle3D.Create( -SX, +SY, -SZ );
     _PosBuf[ 3 ] := TSingle3D.Create( +SX, +SY, -SZ );
     _PosBuf[ 4 ] := TSingle3D.Create( -SX, -SY, +SZ );
     _PosBuf[ 5 ] := TSingle3D.Create( +SX, -SY, +SZ );
     _PosBuf[ 6 ] := TSingle3D.Create( -SX, +SY, +SZ );
     _PosBuf[ 7 ] := TSingle3D.Create( +SX, +SY, +SZ );

     _BouBox.Min.X := -SX;  _BouBox.Max.X := +SX;
     _BouBox.Min.Y := -SY;  _BouBox.Max.Y := +SY;
     _BouBox.Min.Z := -SZ;  _BouBox.Max.Z := +SZ;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLShaperLineCube.GetSizeX :Single;
begin
     Result := _SizeX;
end;

procedure TGLShaperLineCube.SetSizeX( const SizeX_:Single );
begin
     _SizeX := SizeX_;  MakeModel;
end;

function TGLShaperLineCube.GetSizeY :Single;
begin
     Result := _SizeY;
end;

procedure TGLShaperLineCube.SetSizeY( const SizeY_:Single );
begin
     _SizeY := SizeY_;  MakeModel;
end;

function TGLShaperLineCube.GetSizeZ :Single;
begin
     Result := _SizeZ;
end;

procedure TGLShaperLineCube.SetSizeZ( const SizeZ_:Single );
begin
     _SizeZ := SizeZ_;  MakeModel;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLShaperLineCube.Create;
begin
     inherited;

     _PosBuf.Count :=  8;
     _NorBuf.Count :=  8;
     _EleBuf.Count := 12;

     _Matery := TGLMateryColor.Create;

     _NorBuf[ 0 ] := TSingle3D.Create( -1, -1, -1 ).Unitor;
     _NorBuf[ 1 ] := TSingle3D.Create( +1, -1, -1 ).Unitor;
     _NorBuf[ 2 ] := TSingle3D.Create( -1, +1, -1 ).Unitor;
     _NorBuf[ 3 ] := TSingle3D.Create( +1, +1, -1 ).Unitor;
     _NorBuf[ 4 ] := TSingle3D.Create( -1, -1, +1 ).Unitor;
     _NorBuf[ 5 ] := TSingle3D.Create( +1, -1, +1 ).Unitor;
     _NorBuf[ 6 ] := TSingle3D.Create( -1, +1, +1 ).Unitor;
     _NorBuf[ 7 ] := TSingle3D.Create( +1, +1, +1 ).Unitor;

     _EleBuf[ 00 ] := TCardinal2D.Create( 0, 1 );
     _EleBuf[ 01 ] := TCardinal2D.Create( 0, 2 );
     _EleBuf[ 02 ] := TCardinal2D.Create( 0, 4 );

     _EleBuf[ 03 ] := TCardinal2D.Create( 1, 3 );
     _EleBuf[ 04 ] := TCardinal2D.Create( 2, 6 );
     _EleBuf[ 05 ] := TCardinal2D.Create( 4, 5 );

     _EleBuf[ 06 ] := TCardinal2D.Create( 7, 6 );
     _EleBuf[ 07 ] := TCardinal2D.Create( 7, 5 );
     _EleBuf[ 08 ] := TCardinal2D.Create( 7, 3 );

     _EleBuf[ 09 ] := TCardinal2D.Create( 6, 4 );
     _EleBuf[ 10 ] := TCardinal2D.Create( 5, 1 );
     _EleBuf[ 11 ] := TCardinal2D.Create( 3, 2 );

     _SizeX := 1;
     _SizeY := 1;
     _SizeZ := 1;

     MakeModel;
end;

destructor TGLShaperLineCube.Destroy;
begin

     inherited;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
