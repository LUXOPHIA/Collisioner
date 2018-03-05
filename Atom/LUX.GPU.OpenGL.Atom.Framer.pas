unit LUX.GPU.OpenGL.Atom.Framer;

interface //#################################################################### ■

uses Winapi.OpenGL, Winapi.OpenGLext,
     System.Generics.Collections,
     LUX, LUX.GPU.OpenGL.Atom, LUX.GPU.OpenGL.Atom.Chaner;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     TGLColors  = class;
     TGLFramer  = class;
     TGLFramer1 = class;
     TGLFramerN = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLColors

     TGLColors = class( TDictionary<Integer,IGLChaner> )
     private
     protected
       _Paren :TGLFramer;
     public
       constructor Create( const Paren_:TGLFramer );
       destructor Destroy; override;
       ///// メソッド
       procedure Attach( const I_:Integer; const Render_:IGLChaner );
       procedure Detach( const I_:Integer );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLFramer

     TGLFramer = class( TGLAtomer )
     private
     protected
       _Depth  :IGLChaner;
       _Colors :TGLColors;
       _SizeX  :Integer;
       _SizeY  :Integer;
       ///// アクセス
       function GetDepth :IGLChaner;
       procedure SetDepth( const Depth_:IGLChaner );
       function GetSizeX :Integer;
       procedure SetSizeX( const SizeX_:Integer ); virtual;
       function GetSizeY :Integer;
       procedure SetSizeY( const SizeY_:Integer ); virtual;
       ///// メソッド
       procedure InitDepth( const Depth_:IGLChaner ); virtual; abstract;
       procedure InitColor( const Color_:IGLChaner ); virtual; abstract;
       procedure InitBuffers;
     public
       constructor Create;
       procedure AfterConstruction; override;
       destructor Destroy; override;
       ///// プロパティ
       property Depth  :IGLChaner read GetDepth  write SetDepth;
       property Colors :TGLColors read   _Colors               ;
       property SizeX  :Integer   read GetSizeX  write SetSizeX;
       property SizeY  :Integer   read GetSizeY  write SetSizeY;
       ///// メソッド
       procedure Bind( const Mode_:GLenum = GL_FRAMEBUFFER );
       procedure Unbind( const Mode_:GLenum = GL_FRAMEBUFFER );
       procedure Attach( const Channel_:GLenum; const Render_:TGLChaner );
       procedure Detach( const Channel_:GLenum );
       procedure DrawToView( const ViewX_,ViewY_:Integer );
       procedure DrawToFramer( const Framer_:TGLFramer );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLFramer1

     TGLFramer1 = class( TGLFramer )
     private
     protected
       ///// メソッド
       procedure InitDepth( const Depth_:IGLChaner ); override;
       procedure InitColor( const Color_:IGLChaner ); override;
     public
       constructor Create;
       destructor Destroy; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLFramerN

     TGLFramerN = class( TGLFramer )
     private
     protected
       _SampleN :Byte;
       ///// アクセス
       function GetSampleN :Byte;
       procedure SetSampleN( const SampleN_:Byte );
       ///// メソッド
       procedure InitDepth( const Depth_:IGLChaner ); override;
       procedure InitColor( const Color_:IGLChaner ); override;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property SampleN :Byte read GetSampleN write SetSampleN;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLColors

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLColors.Create( const Paren_:TGLFramer );
begin
     inherited Create;

     _Paren := Paren_;
end;

destructor TGLColors.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLColors.Attach( const I_:Integer; const Render_:IGLChaner );
begin
     inherited AddOrSetValue( I_, Render_ );

     _Paren.Attach( GL_COLOR_ATTACHMENT0 + I_, Render_ as TGLChaner );
end;

procedure TGLColors.Detach( const I_:Integer );
begin
     inherited Remove( I_ );

     _Paren.Detach( GL_COLOR_ATTACHMENT0 + I_ );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLFramer

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLFramer.GetDepth :IGLChaner;
begin
     Result := _Depth;
end;

procedure TGLFramer.SetDepth( const Depth_:IGLChaner );
begin
     if Assigned( _Depth ) then Detach( GL_DEPTH_ATTACHMENT );

                  _Depth := Depth_;

     if Assigned( _Depth ) then Attach( GL_DEPTH_ATTACHMENT, _Depth as TGLChaner );
end;

//------------------------------------------------------------------------------

function TGLFramer.GetSizeX :Integer;
begin
     Result := _SizeX;
end;

procedure TGLFramer.SetSizeX( const SizeX_:Integer );
begin
     _SizeX := SizeX_;  InitBuffers;
end;

function TGLFramer.GetSizeY :Integer;
begin
     Result := _SizeY;
end;

procedure TGLFramer.SetSizeY( const SizeY_:Integer );
begin
     _SizeY := SizeY_;  InitBuffers;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLFramer.InitBuffers;
var
   C :IGLChaner;
begin
     if Assigned( _Depth ) then InitDepth( _Depth );

     for C in _Colors.Values do InitColor( C );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLFramer.Create;
begin
     inherited;

     _Colors := TGLColors.Create( Self );

     glGenFramebuffers( 1, @_ID );

     _SizeX := 1920;
     _SizeY := 1080;
end;

procedure TGLFramer.AfterConstruction;
begin
     inherited;

     InitBuffers;
end;

destructor TGLFramer.Destroy;
begin
     glDeleteFramebuffers( 1, @_ID );

     _Colors.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLFramer.Bind( const Mode_:GLenum = GL_FRAMEBUFFER );
begin
     glBindFramebuffer( Mode_, _ID );
end;

procedure TGLFramer.Unbind( const Mode_:GLenum = GL_FRAMEBUFFER );
begin
     glBindFramebuffer( Mode_, 0 );
end;

//------------------------------------------------------------------------------

procedure TGLFramer.Attach( const Channel_:GLenum; const Render_:TGLChaner );
begin
     Bind;

       glFramebufferRenderbuffer( GL_FRAMEBUFFER, Channel_, GL_RENDERBUFFER, Render_.ID );

     Unbind;
end;

procedure TGLFramer.Detach( const Channel_:GLenum );
begin
     Bind;

       glFramebufferRenderbuffer( GL_FRAMEBUFFER, Channel_, GL_RENDERBUFFER, 0 );

     Unbind;
end;

//------------------------------------------------------------------------------

procedure TGLFramer.DrawToView( const ViewX_,ViewY_:Integer );
begin
     Bind( GL_READ_FRAMEBUFFER );

     glBindFramebuffer( GL_DRAW_FRAMEBUFFER, 0 );

     glDrawBuffer( GL_BACK );

     glBlitFramebuffer( 0, 0, _SizeX, _SizeY, 0, 0, ViewX_, ViewY_, GL_COLOR_BUFFER_BIT, GL_NEAREST );

     Unbind( GL_READ_FRAMEBUFFER );
end;

procedure TGLFramer.DrawToFramer( const Framer_:TGLFramer );
begin
             Bind( GL_READ_FRAMEBUFFER );
     Framer_.Bind( GL_DRAW_FRAMEBUFFER );

     glBlitFramebuffer( 0, 0, _SizeX, _SizeY, 0, 0, Framer_.SizeX, Framer_.SizeY, GL_COLOR_BUFFER_BIT, GL_NEAREST );

             Unbind( GL_READ_FRAMEBUFFER );
     Framer_.Unbind( GL_DRAW_FRAMEBUFFER );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLFramer1

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLFramer1.InitDepth( const Depth_:IGLChaner );
begin
     with Depth_ as IGLChaner1 do
     begin
          SizeX := _SizeX;
          SizeY := _SizeY;
     end;
end;

procedure TGLFramer1.InitColor( const Color_:IGLChaner );
begin
     with Color_ as IGLChaner1 do
     begin
          SizeX := _SizeX;
          SizeY := _SizeY;
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLFramer1.Create;
begin
     inherited;

     Depth :=          TGLChaner1.Create( GL_DEPTH_COMPONENT );
     Colors.Attach( 0, TGLChaner1.Create( GL_RGBA            ) );

     _SizeX := 1920;
     _SizeY := 1080;
end;

destructor TGLFramer1.Destroy;
begin

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLFramerN

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLFramerN.GetSampleN :Byte;
begin
     Result := _SampleN;
end;

procedure TGLFramerN.SetSampleN( const SampleN_:Byte );
begin
     _SampleN := SampleN_;  InitBuffers;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLFramerN.InitDepth( const Depth_:IGLChaner );
begin
     with Depth_ as IGLChanerN do
     begin
          SizeX   := _SizeX;
          SizeY   := _SizeY;
          SampleN := _SampleN;
     end;
end;

procedure TGLFramerN.InitColor( const Color_:IGLChaner );
begin
     with Color_ as IGLChanerN do
     begin
          SizeX   := _SizeX;
          SizeY   := _SizeY;
          SampleN := _SampleN;
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLFramerN.Create;
begin
     inherited;

     Depth :=          TGLChanerN.Create( GL_DEPTH_COMPONENT );
     Colors.Attach( 0, TGLChanerN.Create( GL_RGBA            ) );

     _SampleN := 8;
end;

destructor TGLFramerN.Destroy;
begin

     inherited;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■