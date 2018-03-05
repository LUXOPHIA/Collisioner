unit LUX.GPU.OpenGL.Atom.Imager;

interface //#################################################################### ■

uses Winapi.OpenGL, Winapi.OpenGLext,
     LUX, LUX.GPU.OpenGL.Atom;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLSamper

     IGLSamper = interface( IGLAtomer )
     ['{E95328D2-B7D7-4A7C-9367-8A4E554E4F81}']
       ///// アクセス
       function GetWrapU :GLint;
       procedure SetWrapU( const WrapU_:GLint );
       function GetWrapV :GLint;
       procedure SetWrapV( const WrapV_:GLint );
       function GetWrapW :GLint;
       procedure SetWrapW( const WrapW_:GLint );
       function GetMinFilter :GLint;
       procedure SetMinFilter( const MinFilter_:GLint );
       function GetMagFilter :GLint;
       procedure SetMagFilter( const MagFilter_:GLint );
       ///// プロパティ
       property WrapU     :GLint read GetWrapU     write SetWrapU    ;
       property WrapV     :GLint read GetWrapV     write SetWrapV    ;
       property WrapW     :GLint read GetWrapW     write SetWrapW    ;
       property MinFilter :GLint read GetMinFilter write SetMinFilter;
       property MagFilter :GLint read GetMagFilter write SetMagFilter;
       /////メソッド
       procedure Use( const BindI_:GLuint );
       procedure Unuse( const BindI_:GLuint );
     end;

     //-------------------------------------------------------------------------

     TGLSamper = class( TGLAtomer, IGLSamper )
     private
     protected
       _WrapU     :GLint;
       _WrapV     :GLint;
       _WrapW     :GLint;
       _MinFilter :GLint;
       _MagFilter :GLint;
       ///// アクセス
       function GetWrapU :GLint;
       procedure SetWrapU( const WrapU_:GLint );
       function GetWrapV :GLint;
       procedure SetWrapV( const WrapV_:GLint );
       function GetWrapW :GLint;
       procedure SetWrapW( const WrapW_:GLint );
       function GetMinFilter :GLint;
       procedure SetMinFilter( const MinFilter_:GLint );
       function GetMagFilter :GLint;
       procedure SetMagFilter( const MagFilter_:GLint );
       ///// メソッド
       procedure SetParamI( const Name_:GLenum; const Value_:GLint );
       procedure SetParamF( const Name_:GLenum; const Value_:GLfloat );
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property WrapU     :GLint read GetWrapU     write SetWrapU    ;
       property WrapV     :GLint read GetWrapV     write SetWrapV    ;
       property WrapW     :GLint read GetWrapW     write SetWrapW    ;
       property MinFilter :GLint read GetMinFilter write SetMinFilter;
       property MagFilter :GLint read GetMagFilter write SetMagFilter;
       ///// メソッド
       procedure Use( const BindI_:GLuint );
       procedure Unuse( const BindI_:GLuint );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLImager

     IGLImager = interface( IGLAtomer )
     ['{22F971D6-65FD-4F42-80ED-743253890A8C}']
       ///// アクセス
       function GetKind :GLenum;
       procedure SetKind( const Kind_:GLenum );
       function GetTexelF :GLenum;
       procedure SetTexelF( const TexelF_:GLenum );
       function GetPixelF :GLenum;
       procedure SetPixelF( const PixelF_:GLenum );
       function GetPixelT :GLenum;
       procedure SetPixelT( const PixelT_:GLenum );
       ///// プロパティ
       property Kind   :GLenum read GetKind   write SetKind  ;
       property TexelF :GLenum read GetTexelF write SetTexelF;
       property PixelF :GLenum read GetPixelF write SetPixelF;
       property PixelT :GLenum read GetPixelT write SetPixelT;
       /////メソッド
       procedure Bind;
       procedure Unbind;
       procedure Use( const BindI_:GLuint );
       procedure Unuse( const BindI_:GLuint );
       procedure SendData;
     end;

     //-------------------------------------------------------------------------

     TGLImager = class( TGLAtomer, IGLImager )
     private
     protected
       _Field  :TGLSamper;
       _Kind   :GLenum;
       _TexelF :GLenum;
       _PixelF :GLenum;
       _PixelT :GLenum;
       ///// アクセス
       function GetKind :GLenum;
       procedure SetKind( const Kind_:GLenum );
       function GetTexelF :GLenum;
       procedure SetTexelF( const TexelF_:GLenum ); virtual;
       function GetPixelF :GLenum;
       procedure SetPixelF( const PixelF_:GLenum );
       function GetPixelT :GLenum;
       procedure SetPixelT( const PixelT_:GLenum );
     public
       constructor Create( const Kind_:GLenum );
       destructor Destroy; override;
       ///// プロパティ
       property Field  :TGLSamper read   _Field                 ;
       property Kind   :GLenum    read GetKind   write SetKind  ;
       property TexelF :GLenum    read GetTexelF write SetTexelF;
       property PixelF :GLenum    read GetPixelF write SetPixelF;
       property PixelT :GLenum    read GetPixelT write SetPixelT;
       ///// メソッド
       procedure Bind;
       procedure Unbind;
       procedure Use( const BindI_:GLuint );
       procedure Unuse( const BindI_:GLuint );
       procedure SendData; virtual; abstract;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLSamper

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLSamper.GetWrapU :GLint;
begin
     Result := _WrapU;
end;

procedure TGLSamper.SetWrapU( const WrapU_:GLint );
begin
     _WrapU := WrapU_;

     SetParamI( GL_TEXTURE_WRAP_S, _WrapU );
end;

function TGLSamper.GetWrapV :GLint;
begin
     Result := _WrapV;
end;

procedure TGLSamper.SetWrapV( const WrapV_:GLint );
begin
     _WrapV := WrapV_;

     SetParamI( GL_TEXTURE_WRAP_T, _WrapV );
end;

function TGLSamper.GetWrapW :GLint;
begin
     Result := _WrapW;
end;

procedure TGLSamper.SetWrapW( const WrapW_:GLint );
begin
     _WrapW := WrapW_;

     SetParamI( GL_TEXTURE_WRAP_R, _WrapW );
end;

//------------------------------------------------------------------------------

function TGLSamper.GetMinFilter :GLint;
begin
     Result := _MinFilter;
end;

procedure TGLSamper.SetMinFilter( const MinFilter_:GLint );
begin
     _MinFilter := MinFilter_;

     SetParamI( GL_TEXTURE_MIN_FILTER, _MinFilter );
end;

function TGLSamper.GetMagFilter :GLint;
begin
     Result := _MagFilter;
end;

procedure TGLSamper.SetMagFilter( const MagFilter_:GLint );
begin
     _MagFilter := MagFilter_;

     SetParamI( GL_TEXTURE_MAG_FILTER, _MagFilter );
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLSamper.SetParamI( const Name_:GLenum; const Value_:GLint );
begin
     glSamplerParameteri( _ID, Name_, Value_ );
end;

procedure TGLSamper.SetParamF( const Name_:GLenum; const Value_:GLfloat );
begin
     glSamplerParameterf( _ID, Name_, Value_ );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLSamper.Create;
begin
     inherited;

     glGenSamplers( 1, @_ID );

     MinFilter := GL_LINEAR;
     MagFilter := GL_LINEAR;
end;

destructor TGLSamper.Destroy;
begin
     glDeleteSamplers( 1, @_ID );

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLSamper.Use( const BindI_:GLuint );
begin
     glBindSampler( BindI_, _ID );
end;

procedure TGLSamper.Unuse( const BindI_:GLuint );
begin
     glBindSampler( BindI_, 0 );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLImager

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLImager.GetKind :GLenum;
begin
     Result := _Kind;
end;

procedure TGLImager.SetKind( const Kind_:GLenum );
begin
     _Kind := Kind_;
end;

function TGLImager.GetTexelF :GLenum;
begin
     Result := _TexelF;
end;

procedure TGLImager.SetTexelF( const TexelF_:GLenum );
begin
     _TexelF := TexelF_;
end;

function TGLImager.GetPixelF :GLenum;
begin
     Result := _PixelF;
end;

procedure TGLImager.SetPixelF( const PixelF_:GLenum );
begin
     _PixelF := PixelF_;
end;

function TGLImager.GetPixelT :GLenum;
begin
     Result := _PixelT;
end;

procedure TGLImager.SetPixelT( const PixelT_:GLenum );
begin
     _PixelT := PixelT_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLImager.Create( const Kind_:GLenum );
begin
     inherited Create;

     _Field := TGLSamper.Create;

     glGenTextures( 1, @_ID );

     _Kind := Kind_;

     Bind;
       glTexParameteri( _Kind, GL_TEXTURE_MAX_LEVEL, 0 );
     Unbind;
end;

destructor TGLImager.Destroy;
begin
     glDeleteTextures( 1, @_ID );

     _Field.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLImager.Bind;
begin
     glBindTexture( _Kind, _ID );
end;

procedure TGLImager.Unbind;
begin
     glBindTexture( _Kind, 0 );
end;

//------------------------------------------------------------------------------

procedure TGLImager.Use( const BindI_:GLuint );
begin
     _Field.Use( BindI_ );

     glActiveTexture( GL_TEXTURE0 + BindI_ );

       Bind;

     glActiveTexture( GL_TEXTURE0 );
end;

procedure TGLImager.Unuse( const BindI_:GLuint );
begin
     glActiveTexture( GL_TEXTURE0 + BindI_ );

       Unbind;

     glActiveTexture( GL_TEXTURE0 );

     _Field.Unuse( BindI_ );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■