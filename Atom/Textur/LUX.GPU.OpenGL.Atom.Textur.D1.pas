unit LUX.GPU.OpenGL.Atom.Textur.D1;

interface //#################################################################### ■

uses Winapi.OpenGL, Winapi.OpenGLext,
     LUX, LUX.Data.Lattice.T1, LUX.GPU.OpenGL.Atom.Textur;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLTextur1D<_TTexel_,_TTexels_>

     IGLTextur1D = interface( IGLTextur )
     ['{93701122-C0C0-4697-9E0E-C0D59EAB9706}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TGLTextur1D<_TTexel_:record;_TTexels_:constructor,TArray1D<_TTexel_>> = class( TGLTextur<_TTexel_,_TTexels_>, IGLTextur1D )
     private
     protected
     public
       constructor Create;
       destructor Destroy; override;
       ///// メソッド
       procedure SendData; override;
       procedure SendPixBuf; override;
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

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLTextur1D<_TTexel_,_TTexels_>.Create;
begin
     inherited Create( GL_TEXTURE_1D );

end;

destructor TGLTextur1D<_TTexel_,_TTexels_>.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLTextur1D<_TTexel_,_TTexels_>.SendData;
begin
     Bind;
       glTexImage1D( _Kind, 0, _TexelF, _Texels.ElemsX, 0,
                               _PixelF,
                               _PixelT,
                               _Texels.Elem0P );
     Unbind;
end;

//------------------------------------------------------------------------------

procedure TGLTextur1D<_TTexel_,_TTexels_>.SendPixBuf;
begin
     glTexImage1D( _Kind, 0, _TexelF, _Texels.ElemsX, 0,
                             _PixelF,
                             _PixelT, nil );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■