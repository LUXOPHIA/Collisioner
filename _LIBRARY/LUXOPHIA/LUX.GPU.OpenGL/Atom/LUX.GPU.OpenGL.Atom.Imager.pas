unit LUX.GPU.OpenGL.Atom.Imager;

interface //#################################################################### ■

uses Winapi.OpenGL, Winapi.OpenGLext,
     LUX,
     LUX.Data.Lattice,
     LUX.GPU.OpenGL.Atom,
     LUX.GPU.OpenGL.Atom.Textur;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLSampler

     IGLSampler = interface( IGLAtomer )
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

     TGLSampler = class( TGLAtomer, IGLSampler )
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

     IGLImager = interface( IGLTextur )
     ['{22F971D6-65FD-4F42-80ED-743253890A8C}']
       ///// アクセス
       function GetSampler :TGLSampler;
       ///// プロパティ
       property Sampler :TGLSampler read GetSampler;
     end;

     //-------------------------------------------------------------------------

     TGLImager<_TTexel_:record;_TTexels_:constructor,TCoreArray<_TTexel_>> = class( TGLTextur<_TTexel_,_TTexels_>, IGLImager )
     private
     protected
       _Sampler :TGLSampler;
       ///// アクセス
       function GetSampler :TGLSampler;
     public
       constructor Create( const Kind_:GLenum );
       destructor Destroy; override;
       ///// プロパティ
       property Sampler :TGLSampler read GetSampler;
       ///// メソッド
       procedure Use( const BindI_:GLuint ); override;
       procedure Unuse( const BindI_:GLuint ); override;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLSampler

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLSampler.GetWrapU :GLint;
begin
     Result := _WrapU;
end;

procedure TGLSampler.SetWrapU( const WrapU_:GLint );
begin
     _WrapU := WrapU_;

     SetParamI( GL_TEXTURE_WRAP_S, _WrapU );
end;

function TGLSampler.GetWrapV :GLint;
begin
     Result := _WrapV;
end;

procedure TGLSampler.SetWrapV( const WrapV_:GLint );
begin
     _WrapV := WrapV_;

     SetParamI( GL_TEXTURE_WRAP_T, _WrapV );
end;

function TGLSampler.GetWrapW :GLint;
begin
     Result := _WrapW;
end;

procedure TGLSampler.SetWrapW( const WrapW_:GLint );
begin
     _WrapW := WrapW_;

     SetParamI( GL_TEXTURE_WRAP_R, _WrapW );
end;

//------------------------------------------------------------------------------

function TGLSampler.GetMinFilter :GLint;
begin
     Result := _MinFilter;
end;

procedure TGLSampler.SetMinFilter( const MinFilter_:GLint );
begin
     _MinFilter := MinFilter_;

     SetParamI( GL_TEXTURE_MIN_FILTER, _MinFilter );
end;

function TGLSampler.GetMagFilter :GLint;
begin
     Result := _MagFilter;
end;

procedure TGLSampler.SetMagFilter( const MagFilter_:GLint );
begin
     _MagFilter := MagFilter_;

     SetParamI( GL_TEXTURE_MAG_FILTER, _MagFilter );
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLSampler.SetParamI( const Name_:GLenum; const Value_:GLint );
begin
     glSamplerParameteri( _ID, Name_, Value_ );
end;

procedure TGLSampler.SetParamF( const Name_:GLenum; const Value_:GLfloat );
begin
     glSamplerParameterf( _ID, Name_, Value_ );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLSampler.Create;
begin
     inherited;

     glGenSamplers( 1, @_ID );

     MinFilter := GL_LINEAR;
     MagFilter := GL_LINEAR;
end;

destructor TGLSampler.Destroy;
begin
     glDeleteSamplers( 1, @_ID );

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLSampler.Use( const BindI_:GLuint );
begin
     glBindSampler( BindI_, _ID );
end;

procedure TGLSampler.Unuse( const BindI_:GLuint );
begin
     glBindSampler( BindI_, 0 );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLImager

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLImager<_TTexel_,_TTexels_>.GetSampler :TGLSampler;
begin
     Result := _Sampler;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLImager<_TTexel_,_TTexels_>.Create( const Kind_:GLenum );
begin
     inherited;

     _Sampler := TGLSampler.Create;
end;

destructor TGLImager<_TTexel_,_TTexels_>.Destroy;
begin
     _Sampler.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLImager<_TTexel_,_TTexels_>.Use( const BindI_:GLuint );
begin
     inherited;

     _Sampler.Use( BindI_ );
end;

procedure TGLImager<_TTexel_,_TTexels_>.Unuse( const BindI_:GLuint );
begin
     _Sampler.Unuse( BindI_ );

     inherited;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■