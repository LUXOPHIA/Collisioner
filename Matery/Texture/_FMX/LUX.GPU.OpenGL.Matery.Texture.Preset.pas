unit LUX.GPU.OpenGL.Matery.Texture.Preset;

interface //#################################################################### ■

uses Winapi.OpenGL, Winapi.OpenGLext,
     LUX,
     LUX.GPU.OpenGL,
     LUX.GPU.OpenGL.Atom.Texture,
     LUX.GPU.OpenGL.Atom.Texture.D2.Preset,
     LUX.GPU.OpenGL.Matery;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLMateryImag

     IGLMateryImag = interface( IGLMatery )
     ['{426B4B0E-FDA1-44B2-9B2A-0B7371E2E7D0}']
     {protected}
       ///// アクセス
       function GetTextur :TGLCelTex2D_TAlphaColorF;
     {public}
       ///// プロパティ
       property Textur :TGLCelTex2D_TAlphaColorF read GetTextur;
     end;

     //-------------------------------------------------------------------------

     TGLMateryImag = class( TGLMateryNorTex, IGLMateryImag )
     private
     protected
       _Textur :TGLCelTex2D_TAlphaColorF;
       ///// アクセス
       function GetTextur :TGLCelTex2D_TAlphaColorF;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property Textur :TGLCelTex2D_TAlphaColorF read GetTextur;
       ///// メソッド
       procedure Use; override;
       procedure Unuse; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLMateryImagG

     IGLMateryImagG = interface( IGLMatery )
     ['{A3108C6C-0E37-467C-94DF-F99E30B528FA}']
     {protected}
       ///// アクセス
       function GetTextur :TGLCelTex2D_TAlphaColorF;
     {public}
       ///// プロパティ
       property Textur :TGLCelTex2D_TAlphaColorF read GetTextur;
     end;

     //-------------------------------------------------------------------------

     TGLMateryImagG = class( TGLMateryNorTexG, IGLMateryImagG )
     private
     protected
       _Textur :TGLCelTex2D_TAlphaColorF;
       ///// アクセス
       function GetTextur :TGLCelTex2D_TAlphaColorF;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property Textur :TGLCelTex2D_TAlphaColorF read GetTextur;
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

function TGLMateryImag.GetTextur :TGLCelTex2D_TAlphaColorF;
begin
     Result := _Textur;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLMateryImag.Create;
begin
     inherited;

     with _Engine do
     begin
          with Texturs do
          begin
               Add( 0{BinP}, '_Textur'{Name} );
          end;
     end;

     _Textur := TGLCelTex2D_TAlphaColorF.Create;
end;

destructor TGLMateryImag.Destroy;
begin
     _Textur.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLMateryImag.Use;
begin
     inherited;

     _Textur.Use( 0 );
end;

procedure TGLMateryImag.Unuse;
begin
     _Textur.Unuse( 0 );

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLMateryImagG

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLMateryImagG.GetTextur :TGLCelTex2D_TAlphaColorF;
begin
     Result := _Textur;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLMateryImagG.Create;
begin
     inherited;

     with _Engine do
     begin
          with Texturs do
          begin
               Add( 0{BinP}, '_Textur'{Name} );
          end;
     end;

     _Textur := TGLCelTex2D_TAlphaColorF.Create;
end;

destructor TGLMateryImagG.Destroy;
begin
     _Textur.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLMateryImagG.Use;
begin
     inherited;

     _Textur.Use( 0 );
end;

procedure TGLMateryImagG.Unuse;
begin
     _Textur.Unuse( 0 );

     inherited;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
