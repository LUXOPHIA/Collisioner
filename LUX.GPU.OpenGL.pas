unit LUX.GPU.OpenGL;

interface //#################################################################### ■

uses Winapi.Windows, Winapi.OpenGL, Winapi.OpenGLext,
     LUX;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     ///%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOepnGL

     IOpenGL = interface
     ['{836B9BB2-77E5-4553-B115-EF40C24D0251}']
       ///// アクセス
       function GetPFD :TPixelFormatDescriptor;
       procedure SetPFD( const PFD_:TPixelFormatDescriptor );
       function GetPFI :Integer;
       procedure SetPFI( const PFI_:Integer );
       function GetRC :HGLRC;
       ///// プロパティ
       property PFD :TPixelFormatDescriptor read GetPFD write SetPFD;
       property PFI :Integer                read GetPFI write SetPFI;
       property RC  :HGLRC                  read GetRC              ;
       ///// メソッド
       procedure BeginGL;
       procedure EndGL;
       procedure InitOpenGL;
       procedure ApplyPixelFormat( const DC_:HDC );
       function glGetString( const Name_:GLenum ) :String;
       function glGetInteger( const Name_:GLenum ) :GLint;
     end;

     TOpenGL = class( TInterfacedObject, IOpenGL )
     private
     protected
       _WND :HWND;
       _DC  :HDC;
       _PFD :TPixelFormatDescriptor;
       _PFI :Integer;
       _RC  :HGLRC;
       ///// アクセス
       function GetPFD :TPixelFormatDescriptor;
       procedure SetPFD( const PFD_:TPixelFormatDescriptor );
       function GetPFI :Integer;
       procedure SetPFI( const PFI_:Integer );
       function GetRC :HGLRC;
       ///// メソッド
       procedure CreateWindow; virtual; abstract;
       procedure DestroyWindow; virtual; abstract;
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
       property PFD :TPixelFormatDescriptor read GetPFD write SetPFD;
       property PFI :Integer                read GetPFI write SetPFI;
       property RC  :HGLRC                  read GetRC              ;
       ///// 定数
       class function DefaultPFD :TPixelFormatDescriptor;
       ///// メソッド
       procedure BeginGL;
       procedure EndGL;
       procedure InitOpenGL;
       procedure ApplyPixelFormat( const DC_:HDC );
       function glGetString( const Name_:GLenum ) :String;
       function glGetInteger( const Name_:GLenum ) :GLint;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

    _OpenGL_ :IOpenGL;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOepnGL

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TOpenGL.GetPFD :TPixelFormatDescriptor;
begin
     Result := _PFD;
end;

procedure TOpenGL.SetPFD( const PFD_:TPixelFormatDescriptor );
begin
     DestroyRC;
     DestroyDC;
     CreateDC;

     ValidatePFD( PFD_ );

     CreateRC;
end;

function TOpenGL.GetPFI :Integer;
begin
     Result := _PFI;
end;

procedure TOpenGL.SetPFI( const PFI_:Integer );
begin
     DestroyRC;
     DestroyDC;
     CreateDC;

     ValidatePFI( PFI_ );

     CreateRC;
end;

function TOpenGL.GetRC :HGLRC;
begin
     Result := _RC;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TOpenGL.ValidatePFD( const PFD_:TPixelFormatDescriptor );
var
   I :Integer;
begin
     _PFD := PFD_;

     I := ChoosePixelFormat( _DC, @_PFD );

     Assert( I > 0, 'Not found the PixelFormat with a close setting!' );

     ValidatePFI( I );
end;

procedure TOpenGL.ValidatePFI( const PFI_:Integer );
begin
     _PFI := PFI_;

     Assert( DescribePixelFormat( _DC, _PFI, SizeOf( TPixelFormatDescriptor ), _PFD ), 'Not found the PixelFormat of the index!' );
end;

//------------------------------------------------------------------------------

procedure TOpenGL.CreateDC;
begin
     _DC := GetDC( _WND );
end;

procedure TOpenGL.DestroyDC;
begin
     ReleaseDC( 0, _DC );
end;

//------------------------------------------------------------------------------

procedure TOpenGL.CreateRC;
begin
     ApplyPixelFormat( _DC );

     _RC := wglCreateContext( _DC );
end;

procedure TOpenGL.DestroyRC;
begin
     wglDeleteContext( _RC );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TOpenGL.Create;
begin
     inherited;

     CreateWindow;

     CreateDC;

     ValidatePFD( DefaultPFD );

     CreateRC;

     BeginGL;

       InitOpenGL;

     EndGL;

     if wglGetCurrentContext = 0 then BeginGL;
end;

destructor TOpenGL.Destroy;
begin
     if wglGetCurrentContext = _RC then EndGL;

     DestroyRC;

     DestroyDC;

     DestroyWindow;

     inherited;
end;

/////////////////////////////////////////////////////////////////////////// 定数

class function TOpenGL.DefaultPFD :TPixelFormatDescriptor;
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

procedure TOpenGL.BeginGL;
begin
     wglMakeCurrent( _DC, _RC );
end;

procedure TOpenGL.EndGL;
begin
     wglMakeCurrent( _DC, 0 );
end;

//------------------------------------------------------------------------------

procedure TOpenGL.InitOpenGL;
begin
     glEnable( GL_DEPTH_TEST         );
     glEnable( GL_CULL_FACE          );
     glEnable( GL_BLEND              );
     glEnable( GL_PROGRAM_POINT_SIZE );

     glBlendFunc( GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA );
end;

//------------------------------------------------------------------------------

procedure TOpenGL.ApplyPixelFormat( const DC_:HDC );
begin
     Assert( SetPixelFormat( DC_, _PFI, @_PFD ), 'SetPixelFormat() is failed!' );
end;

//------------------------------------------------------------------------------

function TOpenGL.glGetString( const Name_:GLenum ) :String;
var
   P :PGLchar;
begin
     P := Winapi.OpenGL.glGetString( Name_ );

     SetString( Result, P, Length( P ) );
end;

function TOpenGL.glGetInteger( const Name_:GLenum ) :GLint;
begin
     Winapi.OpenGL.glGetIntegerv( Name_, @Result );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■