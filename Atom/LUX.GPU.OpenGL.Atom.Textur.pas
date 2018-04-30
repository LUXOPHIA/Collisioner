unit LUX.GPU.OpenGL.Atom.Textur;

interface //#################################################################### ■

uses Winapi.OpenGL, Winapi.OpenGLext,
     LUX,
     LUX.Data.Lattice,
     LUX.GPU.OpenGL.Atom,
     LUX.GPU.OpenGL.Atom.Imager;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLSamplr

     IGLSamplr = interface( IGLAtomer )
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

     TGLSamplr = class( TGLAtomer, IGLSamplr )
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

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLTextur

     IGLTextur = interface( IGLImager )
     ['{22F971D6-65FD-4F42-80ED-743253890A8C}']
       ///// アクセス
       function GetSamplr :TGLSamplr;
       ///// プロパティ
       property Samplr :TGLSamplr read GetSamplr;
     end;

     //-------------------------------------------------------------------------

     TGLTextur<_TTexel_:record;_TTexels_:constructor,TCoreArray<_TTexel_>> = class( TGLImager<_TTexel_,_TTexels_>, IGLTextur )
     private
     protected
       _Samplr :TGLSamplr;
       ///// アクセス
       function GetSamplr :TGLSamplr;
     public
       constructor Create( const Kind_:GLenum );
       destructor Destroy; override;
       ///// プロパティ
       property Samplr :TGLSamplr read GetSamplr;
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

function TGLSamplr.GetWrapU :GLint;
begin
     Result := _WrapU;
end;

procedure TGLSamplr.SetWrapU( const WrapU_:GLint );
begin
     _WrapU := WrapU_;

     SetParamI( GL_TEXTURE_WRAP_S, _WrapU );
end;

function TGLSamplr.GetWrapV :GLint;
begin
     Result := _WrapV;
end;

procedure TGLSamplr.SetWrapV( const WrapV_:GLint );
begin
     _WrapV := WrapV_;

     SetParamI( GL_TEXTURE_WRAP_T, _WrapV );
end;

function TGLSamplr.GetWrapW :GLint;
begin
     Result := _WrapW;
end;

procedure TGLSamplr.SetWrapW( const WrapW_:GLint );
begin
     _WrapW := WrapW_;

     SetParamI( GL_TEXTURE_WRAP_R, _WrapW );
end;

//------------------------------------------------------------------------------

function TGLSamplr.GetMinFilter :GLint;
begin
     Result := _MinFilter;
end;

procedure TGLSamplr.SetMinFilter( const MinFilter_:GLint );
begin
     _MinFilter := MinFilter_;

     SetParamI( GL_TEXTURE_MIN_FILTER, _MinFilter );
end;

function TGLSamplr.GetMagFilter :GLint;
begin
     Result := _MagFilter;
end;

procedure TGLSamplr.SetMagFilter( const MagFilter_:GLint );
begin
     _MagFilter := MagFilter_;

     SetParamI( GL_TEXTURE_MAG_FILTER, _MagFilter );
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLSamplr.SetParamI( const Name_:GLenum; const Value_:GLint );
begin
     glSamplerParameteri( _ID, Name_, Value_ );
end;

procedure TGLSamplr.SetParamF( const Name_:GLenum; const Value_:GLfloat );
begin
     glSamplerParameterf( _ID, Name_, Value_ );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLSamplr.Create;
begin
     inherited;

     glGenSamplers( 1, @_ID );

     MinFilter := GL_LINEAR;
     MagFilter := GL_LINEAR;
end;

destructor TGLSamplr.Destroy;
begin
     glDeleteSamplers( 1, @_ID );

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLSamplr.Use( const BindI_:GLuint );
begin
     glBindSampler( BindI_, _ID );
end;

procedure TGLSamplr.Unuse( const BindI_:GLuint );
begin
     glBindSampler( BindI_, 0 );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLTextur

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLTextur<_TTexel_,_TTexels_>.GetSamplr :TGLSamplr;
begin
     Result := _Samplr;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLTextur<_TTexel_,_TTexels_>.Create( const Kind_:GLenum );
begin
     inherited;

     _Samplr := TGLSamplr.Create;
end;

destructor TGLTextur<_TTexel_,_TTexels_>.Destroy;
begin
     _Samplr.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLTextur<_TTexel_,_TTexels_>.Use( const BindI_:GLuint );
begin
     inherited;

     _Samplr.Use( BindI_ );
end;

procedure TGLTextur<_TTexel_,_TTexels_>.Unuse( const BindI_:GLuint );
begin
     _Samplr.Unuse( BindI_ );

     inherited;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
