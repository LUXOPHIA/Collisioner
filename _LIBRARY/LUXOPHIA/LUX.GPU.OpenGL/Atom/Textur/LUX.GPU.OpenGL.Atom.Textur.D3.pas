unit LUX.GPU.OpenGL.Atom.Textur.D3;

interface //#################################################################### ■

uses Winapi.OpenGL, Winapi.OpenGLext,
     LUX,
     LUX.Data.Lattice.T3,
     LUX.GPU.OpenGL.Atom.Image.D3,
     LUX.GPU.OpenGL.Atom.Textur;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLTextur3D<_TTexel_,_TTexels_>

     IGLTextur3D = interface( IGLTextur )
     ['{9901BFAD-086D-4BC7-A870-56DB2A7A2BD0}']
     {protected}
     {public}
       ///// メソッド
       procedure SendData;
     end;

     //-------------------------------------------------------------------------

     TGLTextur3D<_TTexel_:record;_TTexels_:constructor,TArray3D<_TTexel_>> = class( TGLImage3D<_TTexel_,_TTexels_>, IGLTextur3D )
     private
     protected
       _Samplr :TGLSamplr;
       ///// アクセス
       function GetSamplr :TGLSamplr;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property Samplr :TGLSamplr read GetSamplr;
       ///// メソッド
       procedure Use( const BindI_:GLuint ); override;
       procedure Unuse( const BindI_:GLuint ); override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLCelTex3D<_TTexel_>

     TGLCelTex3D<_TTexel_:record> = class( TGLTextur3D<_TTexel_,TCellArray3D<_TTexel_>> )
     private
     protected
     public
       constructor Create;
       destructor Destroy; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPoiTex3D<_TTexel_>

     TGLPoiTex3D<_TTexel_:record> = class( TGLTextur3D<_TTexel_,TPoinArray3D<_TTexel_>> )
     private
     protected
     public
       constructor Create;
       destructor Destroy; override;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.Math;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLTextur3D<_TTexel_,_TTexels_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLTextur3D<_TTexel_,_TTexels_>.GetSamplr :TGLSamplr;
begin
     Result := _Samplr;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLTextur3D<_TTexel_,_TTexels_>.Create;
begin
     inherited;

     _Samplr := TGLSamplr.Create;
end;

destructor TGLTextur3D<_TTexel_,_TTexels_>.Destroy;
begin
     _Samplr.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLTextur3D<_TTexel_,_TTexels_>.Use( const BindI_:GLuint );
begin
     inherited;

     _Samplr.Use( BindI_ );
end;

procedure TGLTextur3D<_TTexel_,_TTexels_>.Unuse( const BindI_:GLuint );
begin
     _Samplr.Unuse( BindI_ );

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLCelTex3D<_TTexel_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLCelTex3D<_TTexel_>.Create;
begin
     inherited;

     with _Samplr do
     begin
          WrapU := GL_MIRRORED_REPEAT;
          WrapV := GL_MIRRORED_REPEAT;
          WrapW := GL_MIRRORED_REPEAT;
     end;
end;

destructor TGLCelTex3D<_TTexel_>.Destroy;
begin

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPoiTex3D<_TTexel_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLPoiTex3D<_TTexel_>.Create;
begin
     inherited;

     with _Samplr do
     begin
          WrapU := GL_CLAMP_TO_EDGE;
          WrapV := GL_CLAMP_TO_EDGE;
          WrapW := GL_CLAMP_TO_EDGE;
     end;
end;

destructor TGLPoiTex3D<_TTexel_>.Destroy;
begin

     inherited;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■