unit LUX.GPU.OpenGL.Atom.Imager.D3;

interface //#################################################################### ■

uses Winapi.OpenGL, Winapi.OpenGLext,
     LUX, LUX.Data.Lattice.T3, LUX.GPU.OpenGL.Atom.Imager;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLImager3D<_TTexel_,_TTexels_>

     IGLImager3D = interface( IGLImager )
     ['{9901BFAD-086D-4BC7-A870-56DB2A7A2BD0}']
     {protected}
     {public}
       ///// メソッド
       procedure SendData;
     end;

     //-------------------------------------------------------------------------

     TGLImager3D<_TTexel_:record;_TTexels_:constructor,TArray3D<_TTexel_>> = class( TGLImager, IGLImager3D )
     private
     protected
       _Texels :_TTexels_;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property Texels :_TTexels_ read _Texels;
       ///// メソッド
       procedure SendData; override;
       procedure ReceData; override;
       procedure SendPixBuf; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBricer3D<_TTexel_>

     TGLBricer3D<_TTexel_:record> = class( TGLImager3D<_TTexel_,TBricArray3D<_TTexel_>> )
     private
     protected
     public
       constructor Create;
       destructor Destroy; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLGrider3D<_TTexel_>

     TGLGrider3D<_TTexel_:record> = class( TGLImager3D<_TTexel_,TGridArray3D<_TTexel_>> )
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

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLImager3D<_TTexel_,_TTexels_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLImager3D<_TTexel_,_TTexels_>.Create;
begin
     inherited Create( GL_TEXTURE_3D );

     _Texels := _TTexels_.Create;
end;

destructor TGLImager3D<_TTexel_,_TTexels_>.Destroy;
begin
     _Texels.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLImager3D<_TTexel_,_TTexels_>.SendData;
begin
     Bind;
       glTexImage3D( _Kind, 0, _TexelF, _Texels.ElemsX,
                                        _Texels.ElemsY,
                                        _Texels.ElemsZ, 0,
                               _PixelF,
                               _PixelT,
                               _Texels.ElemsP0 );
     Unbind;
end;

procedure TGLImager3D<_TTexel_,_TTexels_>.ReceData;
begin
     Bind;
       glGetTexImage( _Kind, 0, _PixelF, _PixelT, _Texels.ElemsP0 );
     Unbind;
end;

//------------------------------------------------------------------------------

procedure TGLImager3D<_TTexel_,_TTexels_>.SendPixBuf;
begin
     glTexImage3D( _Kind, 0, _TexelF, _Texels.ElemsX,
                                      _Texels.ElemsY,
                                      _Texels.ElemsZ, 0,
                             _PixelF,
                             _PixelT, nil );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBricer3D<_TTexel_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLBricer3D<_TTexel_>.Create;
begin
     inherited;

     with _Field do
     begin
          WrapU := GL_MIRRORED_REPEAT;
          WrapV := GL_MIRRORED_REPEAT;
          WrapW := GL_MIRRORED_REPEAT;
     end;
end;

destructor TGLBricer3D<_TTexel_>.Destroy;
begin

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLGrider3D<_TTexel_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLGrider3D<_TTexel_>.Create;
begin
     inherited;

     with _Field do
     begin
          WrapU := GL_CLAMP_TO_EDGE;
          WrapV := GL_CLAMP_TO_EDGE;
          WrapW := GL_CLAMP_TO_EDGE;
     end;
end;

destructor TGLGrider3D<_TTexel_>.Destroy;
begin

     inherited;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■