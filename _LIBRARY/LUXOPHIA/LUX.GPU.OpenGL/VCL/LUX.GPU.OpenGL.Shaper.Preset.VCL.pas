unit LUX.GPU.OpenGL.Shaper.Preset.VCL;

interface //#################################################################### ■

uses System.UITypes, System.Classes,
     Winapi.OpenGL, Winapi.OpenGLext,
     Vcl.Graphics,
     LUX, LUX.D2, LUX.D3, LUX.M4, LUX.Tree,
     LUX.GPU.OpenGL,
     LUX.GPU.OpenGL.Atom.Buffer,
     LUX.GPU.OpenGL.Atom.Buffer.Verter,
     LUX.GPU.OpenGL.Atom.Buffer.Elemer,
     LUX.GPU.OpenGL.Scener,
     LUX.GPU.OpenGL.Matery,
     LUX.GPU.OpenGL.Matery.Imager.Preset,
     LUX.GPU.OpenGL.Matery.Preset,
     LUX.GPU.OpenGL.Shaper;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaperText

     TGLShaperText = class( TGLShaperFace )
     private
       ///// メソッド
       procedure MakeModel;
     protected
       _SizeX :Single;
       _SizeY :Single;
       _Text  :String;
       _BMP   :TBitmap;
       _Font  :TFont;
       ///// アクセス
       function GetText :String;
       procedure SetText( const Text_:String );
       function GetFont :TFont;
       procedure SetFont( Sender:TObject );
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       property Text :String read GetText write SetText;
       property Font :TFont  read GetFont              ;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.Types, System.Math, System.SysUtils;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaperBB

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLShaperText.MakeModel;
var
   SX, SY :Single;
begin
     SX := _SizeX / 2;
     SY := _SizeY / 2;

     _PosBuf[ 0 ] := TSingle3D.Create( -SX, -SY, 0 );
     _PosBuf[ 1 ] := TSingle3D.Create( +SX, -SY, 0 );
     _PosBuf[ 2 ] := TSingle3D.Create( -SX, +SY, 0 );
     _PosBuf[ 3 ] := TSingle3D.Create( +SX, +SY, 0 );

     CalcBouBox;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLShaperText.GetText :String;
begin
     Result := _Text;
end;

procedure TGLShaperText.SetText( const Text_:String );
var
   S :TSize;
begin
     _Text := Text_;

     S := _BMP.Canvas.TextExtent( _Text );

     _SizeX := S.Width  / 2;
     _SizeY := S.Height / 2;

     with _BMP do
     begin
          SetSize( S.Width, S.Height );

          with Canvas do
          begin
               Brush.Color := TColors.Black;
               FillRect( TRect.Create( 0, 0, S.Width, S.Height ) );

               TextOut( 0, 0, _Text );
          end;
     end;

     TGLMateryBB( Matery ).Imager.ImportFrom( _BMP );

     MakeModel;
end;

function TGLShaperText.GetFont :TFont;
begin
     Result := _Font;
end;

procedure TGLShaperText.SetFont( Sender:TObject );
begin
     _BMP.Canvas.Font.Assign( _Font );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLShaperText.Create;
begin
     inherited;

     _Font := TFont.Create;
     _Font.OnChange := SetFont;

     _PosBuf.Count := 4;
     _NorBuf.Count := 4;
     _TexBuf.Count := 4;
     _EleBuf.Count := 2;

     _Matery := TGLMateryColor.Create;

     _NorBuf[ 0 ] := TSingle3D.Create( 0, 0, 1 );
     _NorBuf[ 1 ] := TSingle3D.Create( 0, 0, 1 );
     _NorBuf[ 2 ] := TSingle3D.Create( 0, 0, 1 );
     _NorBuf[ 3 ] := TSingle3D.Create( 0, 0, 1 );

     _TexBuf[ 0 ] := TSingle2D.Create( 0, 1 );
     _TexBuf[ 1 ] := TSingle2D.Create( 1, 1 );
     _TexBuf[ 2 ] := TSingle2D.Create( 0, 0 );
     _TexBuf[ 3 ] := TSingle2D.Create( 1, 0 );

     _EleBuf[ 0 ] := TCardinal3D.Create( 0, 1, 2 );
     _EleBuf[ 1 ] := TCardinal3D.Create( 3, 2, 1 );

     Matery := TGLMateryBB.Create;

     _BMP := TBitmap.Create;

     Text := '';
     Font.Size := 100;
end;

destructor TGLShaperText.Destroy;
begin
     _BMP.Free;

     _Font.Free;

     inherited;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
