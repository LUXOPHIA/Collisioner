unit LUX.GPU.OpenGL.Render;

interface //#################################################################### ■

uses System.UITypes,
     Vcl.Graphics,
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
       procedure CopyTo( const BMP_:Vcl.Graphics.TBitmap );
       function MakeScreenShot :Vcl.Graphics.TBitmap;
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

procedure TGLRender.CopyTo( const BMP_:Vcl.Graphics.TBitmap );
var
   Cs :TArray<TAlphaColor>;
   C, B :PAlphaColor;
   S, Y :Integer;
begin
     with BMP_ do
     begin
          PixelFormat := TPixelFormat.pf32bit;

          SetSize( _SizeX, _SizeY );

          SetLength( Cs, Height * Width );

          C := @Cs[ 0 ];

          _Frame1.Bind;

            glReadBuffer( GL_FRONT );
            glReadPixels( 0, 0, Width, Height, GL_BGRA, GL_UNSIGNED_BYTE, C );

          _Frame1.Unbind;

          S := SizeOf( TAlphaColor ) * Width;

          for Y := Height-1 downto 0 do
          begin
               B := Scanline[ Y ];

               System.Move( C^, B^, S );

               Inc( C, Width );
          end;
     end;
end;

function TGLRender.MakeScreenShot :Vcl.Graphics.TBitmap;
begin
     Result := Vcl.Graphics.TBitmap.Create;

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