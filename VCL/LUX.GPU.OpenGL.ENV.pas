unit LUX.GPU.OpenGL.ENV;

interface //#################################################################### ■

uses Vcl.Forms,
     Winapi.Windows, Winapi.OpenGL, Winapi.OpenGLext,
     LUX;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% {RECORD}

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOepnGL

     TOepnGL = class
     private
       _Form :TCustomForm;
       _WND  :HWND;
       _DC   :HDC;
     protected
       _PFD :TPixelFormatDescriptor;
       _PFI :Integer;
	  _RC  :HGLRC;
       ///// アクセス
       procedure SetPFD( const PFD_:TPixelFormatDescriptor );
       procedure SetPFI( const PFI_:Integer );
       ///// メソッド
       procedure CreateWindow;
       procedure DestroyWindow;
       procedure ValidatePFD( const PFD_:TPixelFormatDescriptor );
       procedure ValidatePFI( const PFI_:Integer );
       procedure CreateDC;
       procedure DestroyDC;
       procedure CreateRC;
       procedure DestroyRC;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property PFD :TPixelFormatDescriptor read _PFD write SetPFD;
       property PFI :Integer                read _PFI write SetPFI;
       property RC  :HGLRC                  read _RC              ;
       ///// 定数
       class function DefaultPFD :TPixelFormatDescriptor;
       ///// メソッド
       procedure BeginGL;
       procedure EndGL;
       procedure InitOpenGL;
       procedure ApplyPixelFormat( const DC_:HDC );
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

    _OpenGL_ :TOepnGL;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% {RECORD}

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOepnGL

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

procedure TOepnGL.SetPFD( const PFD_:TPixelFormatDescriptor );
begin
     DestroyRC;
     DestroyDC;
     CreateDC;

     ValidatePFD( PFD_ );

     CreateRC;
end;

procedure TOepnGL.SetPFI( const PFI_:Integer );
begin
     DestroyRC;
     DestroyDC;
     CreateDC;

     ValidatePFI( PFI_ );

     CreateRC;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TOepnGL.CreateWindow;
begin
     _Form := TCustomForm.CreateNew( nil );

     _WND := _Form.Handle;
end;

procedure TOepnGL.DestroyWindow;
begin
     _Form.Free;
end;

//------------------------------------------------------------------------------

procedure TOepnGL.ValidatePFD( const PFD_:TPixelFormatDescriptor );
var
   I :Integer;
begin
     _PFD := PFD_;

     I := ChoosePixelFormat( _DC, @_PFD );

     Assert( I > 0, 'Not found the PixelFormat with a close setting!' );

     ValidatePFI( I );
end;

procedure TOepnGL.ValidatePFI( const PFI_:Integer );
begin
     _PFI := PFI_;

     Assert( DescribePixelFormat( _DC, _PFI, SizeOf( TPixelFormatDescriptor ), _PFD ), 'Not found the PixelFormat of the index!' );
end;

//------------------------------------------------------------------------------

procedure TOepnGL.CreateDC;
begin
     _DC := GetDC( _WND );
end;

procedure TOepnGL.DestroyDC;
begin
     ReleaseDC( 0, _DC );
end;

//------------------------------------------------------------------------------

procedure TOepnGL.CreateRC;
begin
     ApplyPixelFormat( _DC );

     _RC := wglCreateContext( _DC );
end;

procedure TOepnGL.DestroyRC;
begin
     wglDeleteContext( _RC );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TOepnGL.Create;
begin
     inherited;

     CreateWindow;

     CreateDC;

     ValidatePFD( DefaultPFD );

     CreateRC;

     InitOpenGL;
end;

destructor TOepnGL.Destroy;
begin
     DestroyRC;

     DestroyDC;

     DestroyWindow;

     inherited;
end;

/////////////////////////////////////////////////////////////////////////// 定数

class function TOepnGL.DefaultPFD :TPixelFormatDescriptor;
begin
     with Result do
     begin
          nSize           := SizeOf( TPixelFormatDescriptor );
          nVersion        := 1;
          dwFlags         := PFD_DRAW_TO_WINDOW or PFD_SUPPORT_OPENGL or PFD_DOUBLEBUFFER;
          iPixelType      := PFD_TYPE_RGBA;
          cColorBits      := 24;
          cRedBits        := 0;
          cRedShift       := 0;
          cGreenBits      := 0;
          cGreenShift     := 0;
          cBlueBits       := 0;
          cBlueShift      := 0;
          cAlphaBits      := 0;
          cAlphaShift     := 0;
          cAccumBits      := 0;
          cAccumRedBits   := 0;
          cAccumGreenBits := 0;
          cAccumBlueBits  := 0;
          cAccumAlphaBits := 0;
          cDepthBits      := 32;
          cStencilBits    := 0;
          cAuxBuffers     := 0;
          iLayerType      := PFD_MAIN_PLANE;
          bReserved       := 0;
          dwLayerMask     := 0;
          dwVisibleMask   := 0;
          dwDamageMask    := 0;
     end;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TOepnGL.BeginGL;
begin
     wglMakeCurrent( _DC, _RC );
end;

procedure TOepnGL.EndGL;
begin
     wglMakeCurrent( _DC, 0 );
end;

//------------------------------------------------------------------------------

procedure TOepnGL.InitOpenGL;
begin
     BeginGL;

     glEnable( GL_DEPTH_TEST );
     glEnable( GL_CULL_FACE  );

     EndGL;
end;

//------------------------------------------------------------------------------

procedure TOepnGL.ApplyPixelFormat( const DC_:HDC );
begin
     Assert( SetPixelFormat( DC_, _PFI, @_PFD ), 'SetPixelFormat() is failed!' );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

     _OpenGL_ := TOepnGL.Create;

     _OpenGL_.BeginGL;

     InitOpenGLext;

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

     _OpenGL_.EndGL;

     _OpenGL_.Free;

end. //######################################################################### ■