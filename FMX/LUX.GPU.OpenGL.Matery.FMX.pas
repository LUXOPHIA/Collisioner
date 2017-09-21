unit LUX.GPU.OpenGL.Matery.FMX;

interface //#################################################################### ■

uses Winapi.OpenGL, Winapi.OpenGLext,
     LUX,
     LUX.GPU.OpenGL,
     LUX.GPU.OpenGL.Atom.Imager,
     LUX.GPU.OpenGL.Atom.Imager.FMX,
     LUX.GPU.OpenGL.Matery;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLMateryImag

     IGLMateryImag = interface( IGLMatery )
     ['{426B4B0E-FDA1-44B2-9B2A-0B7371E2E7D0}']
     {protected}
       ///// アクセス
       function GetSample :TGLSample;
       function GetImager :TGLImager2D_RGBA;
     {public}
       ///// プロパティ
       property Sample :TGLSample        read GetSample;
       property Imager :TGLImager2D_RGBA read GetImager;
       ///// メソッド
       procedure Use;
       procedure Unuse;
     end;

     //-------------------------------------------------------------------------

     TGLMateryImag = class( TGLMateryNorTex, IGLMateryImag )
     private
     protected
       _Sample :TGLSample;
       _Imager :TGLImager2D_RGBA;
       ///// アクセス
       function GetSample :TGLSample;
       function GetImager :TGLImager2D_RGBA;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property Sample :TGLSample        read GetSample;
       property Imager :TGLImager2D_RGBA read GetImager;
       ///// メソッド
       procedure Use; override;
       procedure Unuse; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLMateryImagG

     TGLMateryImagG = class( TGLMateryNorTexG, IGLMateryImag )
     private
     protected
       _Sample :TGLSample;
       _Imager :TGLImager2D_RGBA;
       ///// アクセス
       function GetSample :TGLSample;
       function GetImager :TGLImager2D_RGBA;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property Sample :TGLSample        read GetSample;
       property Imager :TGLImager2D_RGBA read GetImager;
       ///// メソッド
       procedure Use; override;
       procedure Unuse; override;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLMateryImag

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLMateryImag.GetSample :TGLSample;
begin
     Result := _Sample;
end;

function TGLMateryImag.GetImager :TGLImager2D_RGBA;
begin
     Result := _Imager;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLMateryImag.Create;
begin
     inherited;

     with _Engine do
     begin
          with Imagers do
          begin
               Add( 0{BinP}, '_Imager'{Name} );
          end;
     end;

     _Sample := TGLSample       .Create;
     _Imager := TGLImager2D_RGBA.Create;
end;

destructor TGLMateryImag.Destroy;
begin
     _Sample.DisposeOf;
     _Imager.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLMateryImag.Use;
begin
     inherited;

     _Sample.Use( 0 );
     _Imager.Use( 0 );
end;

procedure TGLMateryImag.Unuse;
begin
     _Sample.Unuse( 0 );
     _Imager.Unuse( 0 );

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLMateryImagG

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLMateryImagG.GetSample :TGLSample;
begin
     Result := _Sample;
end;

function TGLMateryImagG.GetImager :TGLImager2D_RGBA;
begin
     Result := _Imager;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLMateryImagG.Create;
begin
     inherited;

     with _Engine do
     begin
          with Imagers do
          begin
               Add( 0{BinP}, '_Imager'{Name} );
          end;
     end;

     _Sample := TGLSample       .Create;
     _Imager := TGLImager2D_RGBA.Create;
end;

destructor TGLMateryImagG.Destroy;
begin
     _Sample.DisposeOf;
     _Imager.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLMateryImagG.Use;
begin
     inherited;

     _Sample.Use( 0 );
     _Imager.Use( 0 );
end;

procedure TGLMateryImagG.Unuse;
begin
     _Sample.Unuse( 0 );
     _Imager.Unuse( 0 );

     inherited;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
