unit LUX.Color.Format.HDR;

interface //#################################################################### ■

uses System.SysUtils, System.Generics.Collections,
     LUX, LUX.Color, LUX.Color.Grid.D2.Preset;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TAxisType1D

     TAxisType1D = ( atX0 = $0,   // -X
                     atY0 = $1,   // -Y
                     at0X = $2,   // +X
                     at0Y = $3 ); // +Y

     HAxisType1D = record helper for TAxisType1D
     private
       ///// アクセス
       function GetSign :Byte;
       function GetKind :Byte;
     public
       constructor Create( const Axis_:String );
       ///// メソッド
       function ToString :String;
       ///// プロパティ
       property Sign :Byte read GetSign;
       property Kind :Byte read GetKind;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TAxisType2D

     TAxisType2D = ( ctX0Y0 = $1,   // -X -Y
                     ctX00Y = $3,   // -X +Y
                     ctY0X0 = $4,   // -Y -X
                     ctY00X = $6,   // -Y +X
                     ct0XY0 = $9,   // +X -Y
                     ct0X0Y = $B,   // +X +Y
                     ct0YX0 = $C,   // +Y -X
                     ct0Y0X = $E ); // +Y +X

     HAxisType2D = record helper for TAxisType2D
     private
       ///// アクセス
       function GetX :TAxisType1D;
       procedure SetX( const X_:TAxisType1D );
       function GetY :TAxisType1D;
       procedure SetY( const Y_:TAxisType1D );
     public
       ///// プロパティ
       property X :TAxisType1D read GetX write SetX;
       property Y :TAxisType1D read GetY write SetY;
       ///// メソッド
       function ToString :String;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRowHead

     TRowHead = packed record
     private
       _A :Byte;
       _B :Byte;
       _N :Word;
       ///// アクセス
       function GetN :Word;
     public
       ///// プロパティ
       property A :Byte read   _A;
       property B :Byte read   _B;
       property N :Word read GetN;
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TFileHDR

     TFileHDR = class
     private
     protected
       _Grid    :TCellColorGrid2D_TByteRGBE;
       _Kind    :String;
       _Format  :String;
       _Options :TDictionary<String,String>;
       _Axis   :TAxisType2D;
       _NewVer  :Boolean;
       ///// アクセス
       procedure SetKind( const Kind_:String );
       procedure SetFormat( const Format_:String );
       procedure SetCoord( const Coord_:TAxisType2D );
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property Grid    :TCellColorGrid2D_TByteRGBE read _Grid                   ;
       property Kind    :String                     read _Kind    write SetKind  ;
       property Format  :String                     read _Format  write SetFormat;
       property Options :TDictionary<String,String> read _Options                ;
       property Axis    :TAxisType2D                 read _Axis    write SetCoord ;
       ///// メソッド
       procedure LoadFromFile( FileName_:String );
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TAxisType

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function HAxisType1D.GetSign :Byte;
begin
     Result := Byte( Self ) and 2;
end;

function HAxisType1D.GetKind :Byte;
begin
     Result := Byte( Self ) and 1;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor HAxisType1D.Create( const Axis_:String );
var
   S, K :Byte;
begin
     case Axis_.Chars[ 0 ] of
     '-': S := 0;
     '+': S := 2;
     else S := 4; RunError;
     end;

     case Axis_.Chars[ 1 ] of
     'X': K := 0;
     'Y': K := 1;
     else K := 2; RunError;
     end;

     Self := TAxisType1D( S or K );
end;

/////////////////////////////////////////////////////////////////////// メソッド

function HAxisType1D.ToString :String;
begin
     case Self of
       atX0: Result := '-X';
       atY0: Result := '-Y';
       at0X: Result := '+X';
       at0Y: Result := '+Y';
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TCoordType

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function HAxisType2D.GetX :TAxisType1D;
begin
     Result := TAxisType1D( Byte( Self ) and 3 );
end;

procedure HAxisType2D.SetX( const X_:TAxisType1D );
begin
     Self := TAxisType2D( ( Byte( Self ) and 12 ) or Byte( X_ ) );
end;

function HAxisType2D.GetY :TAxisType1D;
begin
     Result := TAxisType1D( ( Byte( Self ) shr 2 ) and 3 );
end;

procedure HAxisType2D.SetY( const Y_:TAxisType1D );
begin
     Self := TAxisType2D( ( Byte( Y_ ) shl 2 ) or ( Byte( Self ) and 3 ) );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

function HAxisType2D.ToString :String;
begin
     case Self of
       ctX0Y0: Result := '-X -Y';
       ctX00Y: Result := '-X +Y';
       ctY0X0: Result := '-Y -X';
       ctY00X: Result := '-Y +X';
       ct0XY0: Result := '+X -Y';
       ct0X0Y: Result := '+X +Y';
       ct0YX0: Result := '+Y -X';
       ct0Y0X: Result := '+Y +X';
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRowHead

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TRowHead.GetN :Word;
begin
     Result := RevBytes( _N );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TFileHDR

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス
                  
procedure TFileHDR.SetKind( const Kind_:String );
begin
     _Kind := Kind_;
end;

procedure TFileHDR.SetFormat( const Format_:String );
begin
     _Format := Format_;
end;

procedure TFileHDR.SetCoord( const Coord_:TAxisType2D );
begin
     _Axis := Coord_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TFileHDR.Create;
begin
     inherited;

     _Grid    := TCellColorGrid2D_TByteRGBE.Create;
     _Options := TDictionary<String,String>.Create;

     _Kind   := 'RADIANCE';
     _Format := '32-bit_rle_rgbe';
     _Axis  := TAxisType2D.ctY00X;
end;

destructor TFileHDR.Destroy;
begin
     _Options.DisposeOf;
     _Grid   .DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TFileHDR.LoadFromFile( FileName_:String );
var
   F :TFileReader;
   L :String;
   Ws :TArray<String>;
   EsX, EsY :Integer;
   ProcGrid :TConstProc<Integer,Integer,TByteRGBE>;
   CsN, Y, I, K, X :Integer;
   Cs :TArray<Byte>;
   H :TRowHead;
   N, R :Byte;
   PR, PG, PB, PE :PByte;
   C :TByteRGBE;
begin
     F := TFileReader.Create( FileName_, TEncoding.ANSI );

     ////////// Kind の取得

     L := F.ReadLine;

     Assert( L = '#?RADIANCE', 'This file is not "#?RADIANCE"!' );

     _Kind := L.Substring( 2 );

     ////////// Options の取得

     _Options.Clear;

     while not F.EndOfStream do
     begin
          L := F.ReadLine;

          if L = '' then Break;

          if L.Chars[ 0 ] = '#' then Continue;

          Ws := L.Split( ['='] );

          _Options.Add( Ws[ 0 ].Trim, Ws[ 1 ].Trim );
     end;

     ////////// AxisX, AxisY, ElemsY, ElemsX の取得

     L := F.ReadLine;

     Ws := L.Split( [' '] );

     _Axis.Y := TAxisType1D.Create( Ws[ 0 ] );
     _Axis.X := TAxisType1D.Create( Ws[ 2 ] );

     EsY := Ws[ 1 ].ToInteger;
     EsX := Ws[ 3 ].ToInteger;

     ////////// CellsX, CellsY の設定

     case _Axis.Y.Kind of
       0: _Grid.CellsX := EsY;
       1: _Grid.CellsY := EsY;
     end;

     case _Axis.X.Kind of
       0: _Grid.CellsX := EsX;
       1: _Grid.CellsY := EsX;
     end;

     ////////// 行列の順序

     case _Axis of
       ctX0Y0: ProcGrid := procedure( const X_,Y_:Integer; const C_:TByteRGBE )
               begin
                    _Grid[       Y_, EsX-1-X_ ] := C_;
               end;
       ctX00Y: ProcGrid := procedure( const X_,Y_:Integer; const C_:TByteRGBE )
               begin
                    _Grid[ EsY-1-Y_, EsX-1-X_ ] := C_;
               end;
       ctY0X0: ProcGrid := procedure( const X_,Y_:Integer; const C_:TByteRGBE )
               begin
                    _Grid[ EsX-1-X_,       Y_ ] := C_;
               end;
       ctY00X: ProcGrid := procedure( const X_,Y_:Integer; const C_:TByteRGBE )
               begin
                    _Grid[       X_,       Y_ ] := C_;
               end;
       ct0XY0: ProcGrid := procedure( const X_,Y_:Integer; const C_:TByteRGBE )
               begin
                    _Grid[       Y_,       X_ ] := C_;
               end;
       ct0X0Y: ProcGrid := procedure( const X_,Y_:Integer; const C_:TByteRGBE )
               begin
                    _Grid[ EsY-1-Y_,       X_ ] := C_;
               end;
       ct0YX0: ProcGrid := procedure( const X_,Y_:Integer; const C_:TByteRGBE )
               begin
                    _Grid[ EsX-1-X_, EsY-1-Y_ ] := C_;
               end;
       ct0Y0X: ProcGrid := procedure( const X_,Y_:Integer; const C_:TByteRGBE )
               begin
                    _Grid[       X_, EsY-1-Y_ ] := C_;
               end;
     end;

     CsN := 4 * EsX;

     SetLength( Cs, CsN );

     for Y := 0 to EsY-1 do
     begin
          F.Read( H, 4 );

          Assert( H.A =   2, 'H.A = ' + H.A.ToString );
          Assert( H.B =   2, 'H.B = ' + H.B.ToString );
          Assert( H.N = EsX, 'H.N = ' + H.N.ToString );

          I := 0;
          repeat
                F.Read( N, 1 );

                if N > $80 then
                begin
                     F.Read( R, 1 );

                     for K := $81 to N do
                     begin
                          Cs[ I ] := R;  Inc( I );
                     end;
                end
                else
                begin
                     F.Read( Cs[ I ], N );  Inc( I, N );
                end;

          until I = CsN;

          PR := @Cs[ 0 ];
          PG := PR;  Inc( PG, EsX );
          PB := PG;  Inc( PB, EsX );
          PE := PB;  Inc( PE, EsX );
          for X := 0 to EsX-1 do
          begin
               C.R := PR^;  Inc( PR );
               C.G := PG^;  Inc( PG );
               C.B := PB^;  Inc( PB );
               C.E := PE^;  Inc( PE );

               ProcGrid( X, Y, C );
          end;
     end;

     F.DisposeOf;
end;

end. //######################################################################### ■
