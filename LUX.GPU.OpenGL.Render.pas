unit LUX.GPU.OpenGL.Render;

interface //#################################################################### ■

uses System.UITypes,
     FMX.Graphics,
     Winapi.Windows, Winapi.OpenGL, Winapi.OpenGLext,
     LUX, LUX.M4,
     LUX.GPU.OpenGL.Atom.Buffer.Unifor,
     LUX.GPU.OpenGL.Atom.Framer,
     LUX.GPU.OpenGL.Camera;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     ///%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLRender

     TGLRender = class
     private
     protected
       _Frame1 :TGLFramer1;
       _FrameN :TGLFramerN;
       _Camera :TGLCamera;
       _SizeX  :Integer;
       _SizeY  :Integer;
       _Viewer :TGLUnifor<TSingleM4>;
       _Color  :TAlphaColorF;
       ///// アクセス
       function GetSizeX :Integer;
       procedure SetSizeX( const SizeX_:Integer );
       function GetSizeY :Integer;
       procedure SetSizeY( const SizeY_:Integer );
       function GetColor :TAlphaColorF;
       procedure SetColor( const Color_:TAlphaColorF );
       ///// メソッド
       procedure FitWindow;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property Camera  :TGLCamera    read   _Camera write   _Camera;
       property SizeX   :Integer      read GetSizeX  write SetSizeX ;
       property SizeY   :Integer      read GetSizeY  write SetSizeY ;
       property Color   :TAlphaColorF read GetColor  write SetColor ;
       ///// メソッド
       procedure Render;
       function MakeScreenShot :FMX.Graphics.TBitmap;
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

/////////////////////////////////////////////////////////////////////// アクセス

function TGLRender.GetSizeX :Integer;
begin
     Result := _SizeX;
end;

procedure TGLRender.SetSizeX( const SizeX_:Integer );
begin
     _SizeX := SizeX_;

     _Frame1.SizeX := _SizeX;
     _FrameN.SizeX := _SizeX;

     FitWindow;
end;

function TGLRender.GetSizeY :Integer;
begin
     Result := _SizeY;
end;

procedure TGLRender.SetSizeY( const SizeY_:Integer );
begin
     _SizeY := SizeY_;

     _Frame1.SizeY := _SizeY;
     _FrameN.SizeY := _SizeY;

     FitWindow;
end;

//------------------------------------------------------------------------------

function TGLRender.GetColor :TAlphaColorF;
begin
     Result := _Color;
end;

procedure TGLRender.SetColor( const Color_:TAlphaColorF );
begin
     _Color := Color_;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLRender.FitWindow;
begin
     if _SizeY < _SizeX then _Viewer[ 0 ] := TSingleM4.Scale( _SizeY / _SizeX, 1, 1 )
                        else
     if _SizeX < _SizeY then _Viewer[ 0 ] := TSingleM4.Scale( 1, _SizeX / _SizeY, 1 )
                        else _Viewer[ 0 ] := TSingleM4.Identity;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLRender.Create;
begin
     inherited;

     _Frame1 := TGLFramer1.Create;
     _FrameN := TGLFramerN.Create;

     _Viewer := TGLUnifor<TSingleM4>.Create( GL_DYNAMIC_DRAW ); _Viewer.Count := 1;

     SizeX := 1920;
     SizeY := 1080;

     _Color := TAlphaColorF.Create( 0, 0, 0, 1 );
end;

destructor TGLRender.Destroy;
begin
     _Viewer.DisposeOf;

     _Frame1.DisposeOf;
     _FrameN.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLRender.Render;
begin
       _FrameN.Bind;

         with _Color do glClearColor( R, G, B, A );

         glClear( GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT );

         _Viewer.Use( 0{BinP} );

           glViewport( 0, 0, _SizeX, _SizeY );

           if Assigned( _Camera ) then _Camera.Render;

         _Viewer.Unuse( 0{BinP} );

         glFlush;

       _FrameN.Unbind;
       _FrameN.DrawToFramer( _Frame1 );
end;

function TGLRender.MakeScreenShot :FMX.Graphics.TBitmap;
var
   Cs :TArray<TAlphaColor>;
   C, B :PAlphaColor;
   Bs :TBitmapData;
   S, Y :Integer;
begin
     Result := FMX.Graphics.TBitmap.Create;

     with Result do
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

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■