unit LUX.GPU.OpenGL.Atom.Imager.D1;

interface //#################################################################### ■

uses Winapi.OpenGL, Winapi.OpenGLext,
     LUX,
     LUX.Data.Lattice.T1,
     LUX.GPU.OpenGL.Atom.Textur.D1,
     LUX.GPU.OpenGL.Atom.Imager;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLImager1D<_TTexel_,_TTexels_>

     IGLImager1D = interface( IGLImager )
     ['{9802F2EE-57A9-4E2E-AE7F-CCC6A32DC3FE}']
     {protected}
     {public}
       ///// メソッド
       procedure SendData;
     end;

     //-------------------------------------------------------------------------

     TGLImager1D<_TTexel_:record;_TTexels_:constructor,TArray1D<_TTexel_>> = class( TGLTextur1D<_TTexel_,_TTexels_>, IGLImager1D )
     private
     protected
       _Sampler :TGLSampler;
       ///// アクセス
       function GetSampler :TGLSampler;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property Sampler :TGLSampler read GetSampler;
       ///// メソッド
       procedure Use( const BindI_:GLuint ); override;
       procedure Unuse( const BindI_:GLuint ); override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLCelTex1D<_TTexel_>

     TGLCelTex1D<_TTexel_:record> = class( TGLImager1D<_TTexel_,TCellArray1D<_TTexel_>> )
     private
     protected
     public
       constructor Create;
       destructor Destroy; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPoiTex1D<_TTexel_>

     TGLPoiTex1D<_TTexel_:record> = class( TGLImager1D<_TTexel_,TPoinArray1D<_TTexel_>> )
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

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLImager1D<_TTexel_,_TTexels_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLImager1D<_TTexel_,_TTexels_>.GetSampler :TGLSampler;
begin
     Result := _Sampler;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLImager1D<_TTexel_,_TTexels_>.Create;
begin
     inherited;

     _Sampler := TGLSampler.Create;
end;

destructor TGLImager1D<_TTexel_,_TTexels_>.Destroy;
begin
     _Sampler.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLImager1D<_TTexel_,_TTexels_>.Use( const BindI_:GLuint );
begin
     inherited;

     _Sampler.Use( BindI_ );
end;

procedure TGLImager1D<_TTexel_,_TTexels_>.Unuse( const BindI_:GLuint );
begin
     _Sampler.Unuse( BindI_ );

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLCelTex1D<_TTexel_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLCelTex1D<_TTexel_>.Create;
begin
     inherited;

     with _Sampler do
     begin
          WrapU := GL_MIRRORED_REPEAT;
     end;
end;

destructor TGLCelTex1D<_TTexel_>.Destroy;
begin

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPoiTex1D<_TTexel_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLPoiTex1D<_TTexel_>.Create;
begin
     inherited;

     with _Sampler do
     begin
          WrapU := GL_CLAMP_TO_EDGE;
     end;
end;

destructor TGLPoiTex1D<_TTexel_>.Destroy;
begin

     inherited;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■