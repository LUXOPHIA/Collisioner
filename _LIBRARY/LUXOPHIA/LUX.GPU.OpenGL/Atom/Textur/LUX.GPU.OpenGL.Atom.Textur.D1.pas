unit LUX.GPU.OpenGL.Atom.Textur.D1;

interface //#################################################################### ■

uses Winapi.OpenGL, Winapi.OpenGLext,
     LUX,
     LUX.Data.Lattice.T1,
     LUX.GPU.OpenGL.Atom.Imager.D1,
     LUX.GPU.OpenGL.Atom.Textur;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLTextur1D<_TTexel_,_TTexels_>

     IGLTextur1D = interface( IGLTextur )
     ['{9802F2EE-57A9-4E2E-AE7F-CCC6A32DC3FE}']
     {protected}
     {public}
       ///// メソッド
       procedure SendData;
     end;

     //-------------------------------------------------------------------------

     TGLTextur1D<_TTexel_:record;_TTexels_:constructor,TArray1D<_TTexel_>> = class( TGLImager1D<_TTexel_,_TTexels_>, IGLTextur1D )
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

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLCelTex1D<_TTexel_>

     TGLCelTex1D<_TTexel_:record> = class( TGLTextur1D<_TTexel_,TCellArray1D<_TTexel_>> )
     private
     protected
     public
       constructor Create;
       destructor Destroy; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLPoiTex1D<_TTexel_>

     TGLPoiTex1D<_TTexel_:record> = class( TGLTextur1D<_TTexel_,TPoinArray1D<_TTexel_>> )
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

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLTextur1D<_TTexel_,_TTexels_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLTextur1D<_TTexel_,_TTexels_>.GetSamplr :TGLSamplr;
begin
     Result := _Samplr;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLTextur1D<_TTexel_,_TTexels_>.Create;
begin
     inherited;

     _Samplr := TGLSamplr.Create;
end;

destructor TGLTextur1D<_TTexel_,_TTexels_>.Destroy;
begin
     _Samplr.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLTextur1D<_TTexel_,_TTexels_>.Use( const BindI_:GLuint );
begin
     inherited;

     _Samplr.Use( BindI_ );
end;

procedure TGLTextur1D<_TTexel_,_TTexels_>.Unuse( const BindI_:GLuint );
begin
     _Samplr.Unuse( BindI_ );

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLCelTex1D<_TTexel_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLCelTex1D<_TTexel_>.Create;
begin
     inherited;

     with _Samplr do
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

     with _Samplr do
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