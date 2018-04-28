unit LUX.GPU.OpenGL.Matery.Imager.Preset;

interface //#################################################################### ■

uses Winapi.OpenGL, Winapi.OpenGLext,
     LUX,
     LUX.GPU.OpenGL,
     LUX.GPU.OpenGL.Atom.Imager,
     LUX.GPU.OpenGL.Atom.Imager.D2.Preset,
     LUX.GPU.OpenGL.Matery;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLMateryImag

     IGLMateryImag = interface( IGLMatery )
     ['{426B4B0E-FDA1-44B2-9B2A-0B7371E2E7D0}']
     {protected}
       ///// アクセス
       function GetImager :TGLCelTex2D_TAlphaColorF;
     {public}
       ///// プロパティ
       property Imager :TGLCelTex2D_TAlphaColorF read GetImager;
     end;

     //-------------------------------------------------------------------------

     TGLMateryImag = class( TGLMateryNorTex, IGLMateryImag )
     private
     protected
       _Imager :TGLCelTex2D_TAlphaColorF;
       ///// アクセス
       function GetImager :TGLCelTex2D_TAlphaColorF;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property Imager :TGLCelTex2D_TAlphaColorF read GetImager;
       ///// メソッド
       procedure Use; override;
       procedure Unuse; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLMateryImagG

     IGLMateryImagG = interface( IGLMatery )
     ['{A3108C6C-0E37-467C-94DF-F99E30B528FA}']
     {protected}
       ///// アクセス
       function GetImager :TGLCelTex2D_TAlphaColorF;
     {public}
       ///// プロパティ
       property Imager :TGLCelTex2D_TAlphaColorF read GetImager;
     end;

     //-------------------------------------------------------------------------

     TGLMateryImagG = class( TGLMateryNorTexG, IGLMateryImagG )
     private
     protected
       _Imager :TGLCelTex2D_TAlphaColorF;
       ///// アクセス
       function GetImager :TGLCelTex2D_TAlphaColorF;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property Imager :TGLCelTex2D_TAlphaColorF read GetImager;
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

function TGLMateryImag.GetImager :TGLCelTex2D_TAlphaColorF;
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

     _Imager := TGLCelTex2D_TAlphaColorF.Create;
end;

destructor TGLMateryImag.Destroy;
begin
     _Imager.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLMateryImag.Use;
begin
     inherited;

     _Imager.Use( 0 );
end;

procedure TGLMateryImag.Unuse;
begin
     _Imager.Unuse( 0 );

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLMateryImagG

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLMateryImagG.GetImager :TGLCelTex2D_TAlphaColorF;
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

     _Imager := TGLCelTex2D_TAlphaColorF.Create;
end;

destructor TGLMateryImagG.Destroy;
begin
     _Imager.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLMateryImagG.Use;
begin
     inherited;

     _Imager.Use( 0 );
end;

procedure TGLMateryImagG.Unuse;
begin
     _Imager.Unuse( 0 );

     inherited;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
