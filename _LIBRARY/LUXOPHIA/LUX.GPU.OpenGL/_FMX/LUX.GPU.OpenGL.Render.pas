unit LUX.GPU.OpenGL.Render;

interface //#################################################################### ■

uses System.UITypes,
     FMX.Graphics,
     Winapi.Windows, Winapi.OpenGL, Winapi.OpenGLext,
     LUX.GPU.OpenGL.Render_;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     ///%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLRender

     TGLRender = class( TGL_Render )
     private
     protected
     public
       ///// メソッド
       procedure CopyTo( const BMP_:FMX.Graphics.TBitmap );
       function MakeScreenShot :FMX.Graphics.TBitmap;
       procedure SaveToFile( const FileName_:String );
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLRender

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLRender.CopyTo( const BMP_:FMX.Graphics.TBitmap );
var
   Cs :TArray<TAlphaColor>;
   C, B :PAlphaColor;
   Bs :TBitmapData;
   S, Y :Integer;
begin
     with BMP_ do
     begin
          SetSize( _SizeX, _SizeY );

          SetLength( Cs, _SizeY * _SizeX );

          C := @Cs[ 0 ];

          _Frame1.Bind;

            glReadBuffer( GL_COLOR_ATTACHMENT0 );
            glReadPixels( 0, 0, _SizeX, _SizeY, GL_BGRA, GL_UNSIGNED_BYTE, C );

          _Frame1.Unbind;

          Map( TMapAccess.Write, Bs );

          S := SizeOf( TAlphaColor ) * _SizeX;

          for Y := _SizeY-1 downto 0 do
          begin
               B := Bs.GetScanline( Y );

               System.Move( C^, B^, S );

               Inc( C, _SizeX );
          end;

          Unmap( Bs );
     end;
end;

function TGLRender.MakeScreenShot :FMX.Graphics.TBitmap;
begin
     Result := FMX.Graphics.TBitmap.Create;

     CopyTo( Result );
end;

procedure TGLRender.SaveToFile( const FileName_:String );
begin
     with MakeScreenShot do
     begin
          SaveToFile( FileName_ );

          DisposeOf;
     end;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
