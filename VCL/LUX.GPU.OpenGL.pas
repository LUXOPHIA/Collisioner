unit LUX.GPU.OpenGL;

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

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShader

     TGLShader = class
     private
     protected
       _ID :GLuint;
     public
       constructor Create( const Kind_:GLenum );
       destructor Destroy; override;
       ///// プロパティ
       property ID :GLuint read _ID;
       ///// メソッド
       procedure SetSource( const Source_:String );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaderV

     TGLShaderV = class( TGLShader )
     private
     protected
     public
       constructor Create;
       destructor Destroy; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaderG

     TGLShaderG = class( TGLShader )
     private
     protected
     public
       constructor Create;
       destructor Destroy; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaderF

     TGLShaderF = class( TGLShader )
     private
     protected
     public
       constructor Create;
       destructor Destroy; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLProgram

     TGLProgram = class
     private
     protected
       _ID :GLuint;
     public
       constructor Create;
       destructor Destroy; override;
       ///// メソッド
       procedure Attach( const Shader_:TGLShader );
       procedure Detach( const Shader_:TGLShader );
       procedure Link;
       procedure Use;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBuffer<_TYPE_>

     TGLBuffer<_TYPE_:record> = class
     public
       type _PValue_ = ^_TYPE_;
     private
     protected
       _ID    :GLuint;
       _Kind  :GLenum;
       _Count :Integer;
       _Head  :_PValue_;
       ///// アクセス
       procedure SetCount( const Count_:Integer );
     public
       constructor Create( const Kind_:GLenum );
       destructor Destroy; override;
       ///// プロパティ
       property ID    :GLuint  read _ID;
       property Count :Integer read _Count write SetCount;
       ///// メソッド
       procedure Bind;
       procedure Unbind;
       procedure Map;
       procedure Unmap;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBufferV<_TYPE_>

     TGLBufferV<_TYPE_:record> = class( TGLBuffer<_TYPE_> )
     private
     protected
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       ///// メソッド
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBufferI<_TYPE_>

     TGLBufferI<_TYPE_:record> = class( TGLBuffer<_TYPE_> )
     private
     protected
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       ///// メソッド
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBufferU<_TYPE_>

     TGLBufferU<_TYPE_:record> = class( TGLBuffer<_TYPE_> )
     private
     protected
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       ///// メソッド
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLArray

     TGLArray = class
     private
     protected
       _ID :GLuint;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property ID :GLuint read _ID;
       ///// メソッド
       procedure BeginBind;
       procedure EndBind;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

    _OpenGL_ :TOepnGL;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.SysUtils;

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

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShader

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLShader.Create( const Kind_:GLenum );
begin
     inherited Create;

     _ID := glCreateShader( Kind_ );
end;

destructor TGLShader.Destroy;
begin
     glDeleteShader( _ID );

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLShader.SetSource( const Source_:String );
var
   P :PAnsiChar;
   N :GLint;
   E :GLint;
   Cs :array of PGLchar;
   CsN :GLsizei;
begin
     P := PAnsiChar( AnsiString( Source_ ) );
     N := Length( Source_ );

     glShaderSource( _ID, 1, @P, @N );

     glCompileShader( _ID );

     glGetShaderiv( _ID, GL_COMPILE_STATUS, @E );

     if E = GL_FALSE then
     begin
          glGetShaderiv( _ID, GL_INFO_LOG_LENGTH , @N );

          SetLength( Cs, N );

          glGetShaderInfoLog( _ID, N, @CsN, @Cs[0] );

          Assert( False, AnsiString( Cs ) );
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaderV

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLShaderV.Create;
begin
     inherited Create( GL_VERTEX_SHADER );

end;

destructor TGLShaderV.Destroy;
begin

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaderG

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLShaderG.Create;
begin
     inherited Create( GL_GEOMETRY_SHADER );

end;

destructor TGLShaderG.Destroy;
begin

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLShaderF

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLShaderF.Create;
begin
     inherited Create( GL_FRAGMENT_SHADER );

end;

destructor TGLShaderF.Destroy;
begin

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLProgram

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLProgram.Create;
begin
     inherited;

     _ID := glCreateProgram;
end;

destructor TGLProgram.Destroy;
begin
     glDeleteProgram( _ID );

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLProgram.Attach( const Shader_:TGLShader );
begin
     glAttachShader( _ID, Shader_.ID );
end;

procedure TGLProgram.Detach( const Shader_:TGLShader );
begin
     glDetachShader( _ID, Shader_.ID );
end;

//------------------------------------------------------------------------------

procedure TGLProgram.Link;
begin
     glLinkProgram( _ID );
end;

//------------------------------------------------------------------------------

procedure TGLProgram.Use;
begin
     glUseProgram( _ID );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBuffer<_TYPE_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

procedure TGLBuffer<_TYPE_>.SetCount( const Count_:Integer );
begin
     _Count := Count_;

     Bind;

     glBufferData( _Kind, SizeOf( _TYPE_ ) * _Count, nil, GL_DYNAMIC_DRAW );

     Unbind;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLBuffer<_TYPE_>.Create( const Kind_:GLenum );
begin
     inherited Create;

     glGenBuffers( 1, @_ID );

     _Kind := Kind_;

     Count := 0;
end;

destructor TGLBuffer<_TYPE_>.Destroy;
begin
     glDeleteBuffers( 1, @_ID );

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLBuffer<_TYPE_>.Bind;
begin
     glBindBuffer( _Kind, _ID );
end;

procedure TGLBuffer<_TYPE_>.Unbind;
begin
     glBindBuffer( _Kind, 0 );
end;

//------------------------------------------------------------------------------

procedure TGLBuffer<_TYPE_>.Map;
begin
     Bind;

     _Head := glMapBuffer( _Kind, GL_READ_WRITE );
end;

procedure TGLBuffer<_TYPE_>.Unmap;
begin
     glUnmapBuffer( _Kind );

     Unbind;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBufferV<_TYPE_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLBufferV<_TYPE_>.Create;
begin
     inherited Create( GL_ARRAY_BUFFER );

end;

destructor TGLBufferV<_TYPE_>.Destroy;
begin

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBufferI<_TYPE_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLBufferI<_TYPE_>.Create;
begin
     inherited Create( GL_ELEMENT_ARRAY_BUFFER );

end;

destructor TGLBufferI<_TYPE_>.Destroy;
begin

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBufferU<_TYPE_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLBufferU<_TYPE_>.Create;
begin
     inherited Create( GL_UNIFORM_BUFFER );

end;

destructor TGLBufferU<_TYPE_>.Destroy;
begin

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLArray

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLArray.Create;
begin
     inherited Create;

     glGenVertexArrays( 1, @_ID );
end;

destructor TGLArray.Destroy;
begin
     glDeleteVertexArrays( 1, @_ID );

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLArray.BeginBind;
begin
     glBindVertexArray( _ID );
end;

procedure TGLArray.EndBind;
begin
     glBindVertexArray( 0 );
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