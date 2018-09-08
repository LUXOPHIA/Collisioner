unit LUX.GPU.OpenGL.Comput;

interface //#################################################################### ■

uses System.Generics.Collections,
     Winapi.OpenGL, Winapi.OpenGLext,
     LUX,
     LUX.Data.Dictionary,
     LUX.GPU.OpenGL,
     LUX.GPU.OpenGL.Atom.Buffer,
     LUX.GPU.OpenGL.Atom.Buffer.VerBuf,
     LUX.GPU.OpenGL.Atom.Buffer.StoBuf,
     LUX.GPU.OpenGL.Atom.Imager,
     LUX.GPU.OpenGL.Atom.Textur,
     LUX.GPU.OpenGL.Atom.Shader,
     LUX.GPU.OpenGL.Atom.Engine;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLComput

     IGLComput = interface
     ['{13071090-B024-474A-BDA2-AB604AD10B16}']
     {protected}
       ///// アクセス
       function GetEngine  :TGLEngine;
       function GetShaderC :TGLShaderC;
       function GetBuffers :TIndexDictionary<String,IGLBuffer>;
       function GetImagers :TIndexDictionary<String,IGLImager>;
       function GetItemsX :GLuint;
       procedure SetItemsX( const ItemsX_:GLuint );
       function GetItemsY :GLuint;
       procedure SetItemsY( const ItemsY_:GLuint );
       function GetItemsZ :GLuint;
       procedure SetItemsZ( const ItemsZ_:GLuint );
       function GetGrupsX :GLuint;
       procedure SetGrupsX( const GrupsX_:GLuint );
       function GetGrupsY :GLuint;
       procedure SetGrupsY( const GrupsY_:GLuint );
       function GetGrupsZ :GLuint;
       procedure SetGrupsZ( const GrupsZ_:GLuint );
       function GetWorksX :GLuint;
       procedure SetWorksX( const WorksX_:GLuint );
       function GetWorksY :GLuint;
       procedure SetWorksY( const WorksY_:GLuint );
       function GetWorksZ :GLuint;
       procedure SetWorksZ( const WorksZ_:GLuint );
     {public}
       ///// プロパティ
       property Engine  :TGLEngine                          read GetEngine  ;
       property ShaderC :TGLShaderC                         read GetShaderC ;
       property Buffers :TIndexDictionary<String,IGLBuffer> read GetBuffers ;
       property Imagers :TIndexDictionary<String,IGLImager> read GetImagers ;
       property ItemsX  :GLuint                             read GetItemsX  write SetItemsX;
       property ItemsY  :GLuint                             read GetItemsY  write SetItemsY;
       property ItemsZ  :GLuint                             read GetItemsZ  write SetItemsZ;
       property GrupsX  :GLuint                             read GetGrupsX  write SetGrupsX;
       property GrupsY  :GLuint                             read GetGrupsY  write SetGrupsY;
       property GrupsZ  :GLuint                             read GetGrupsZ  write SetGrupsZ;
       property WorksX  :GLuint                             read GetWorksX  write SetWorksX;
       property WorksY  :GLuint                             read GetWorksY  write SetWorksY;
       property WorksZ  :GLuint                             read GetWorksZ  write SetWorksZ;
       ///// メソッド
       procedure Run;
     end;

     //-------------------------------------------------------------------------

     TGLComput = class( TInterfacedObject, IGLComput )
     private
     protected
       _Engine  :TGLEngine;                           upEngine:Boolean;
       _ShaderC :TGLShaderC;
       _Buffers :TIndexDictionary<String,IGLBuffer>;
       _Imagers :TIndexDictionary<String,IGLImager>;
       _Texturs :TIndexDictionary<String,IGLTextur>;
       _ItemsX  :GLuint;
       _ItemsY  :GLuint;
       _ItemsZ  :GLuint;
       _GrupsX  :GLuint;
       _GrupsY  :GLuint;
       _GrupsZ  :GLuint;
       ///// アクセス
       function GetEngine  :TGLEngine;
       function GetShaderC :TGLShaderC;
       function GetBuffers :TIndexDictionary<String,IGLBuffer>;
       function GetImagers :TIndexDictionary<String,IGLImager>;
       function GetTexturs :TIndexDictionary<String,IGLTextur>;
       function GetItemsX :GLuint;
       procedure SetItemsX( const ItemsX_:GLuint );
       function GetItemsY :GLuint;
       procedure SetItemsY( const ItemsY_:GLuint );
       function GetItemsZ :GLuint;
       procedure SetItemsZ( const ItemsZ_:GLuint );
       function GetGrupsX :GLuint;
       procedure SetGrupsX( const GrupsX_:GLuint );
       function GetGrupsY :GLuint;
       procedure SetGrupsY( const GrupsY_:GLuint );
       function GetGrupsZ :GLuint;
       procedure SetGrupsZ( const GrupsZ_:GLuint );
       function GetWorksX :GLuint;
       procedure SetWorksX( const WorksX_:GLuint );
       function GetWorksY :GLuint;
       procedure SetWorksY( const WorksY_:GLuint );
       function GetWorksZ :GLuint;
       procedure SetWorksZ( const WorksZ_:GLuint );
       procedure SetBuffers( const Sender_:TDictItem<String,IGLBuffer> );
       procedure SetImagers( const Sender_:TDictItem<String,IGLImager> );
       procedure SetTexturs( const Sender_:TDictItem<String,IGLTextur> );
       procedure InitEngine;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property Engine  :TGLEngine                          read GetEngine  ;
       property ShaderC :TGLShaderC                         read GetShaderC ;
       property Buffers :TIndexDictionary<String,IGLBuffer> read GetBuffers ;
       property Imagers :TIndexDictionary<String,IGLImager> read GetImagers ;
       property Texturs :TIndexDictionary<String,IGLTextur> read GetTexturs ;
       property ItemsX  :GLuint                             read GetItemsX  write SetItemsX;
       property ItemsY  :GLuint                             read GetItemsY  write SetItemsY;
       property ItemsZ  :GLuint                             read GetItemsZ  write SetItemsZ;
       property GrupsX  :GLuint                             read GetGrupsX  write SetGrupsX;
       property GrupsY  :GLuint                             read GetGrupsY  write SetGrupsY;
       property GrupsZ  :GLuint                             read GetGrupsZ  write SetGrupsZ;
       property WorksX  :GLuint                             read GetWorksX  write SetWorksX;
       property WorksY  :GLuint                             read GetWorksY  write SetWorksY;
       property WorksZ  :GLuint                             read GetWorksZ  write SetWorksZ;
       ///// メソッド
       procedure Run;
       procedure RunARB;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLComput

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLComput.GetEngine :TGLEngine;
begin
     Result := _Engine;
end;

//------------------------------------------------------------------------------

function TGLComput.GetShaderC :TGLShaderC;
begin
     Result := _ShaderC;
end;

//------------------------------------------------------------------------------

function TGLComput.GetBuffers :TIndexDictionary<String,IGLBuffer>;
begin
     Result := _Buffers;
end;

function TGLComput.GetImagers :TIndexDictionary<String,IGLImager>;
begin
     Result := _Imagers;
end;

function TGLComput.GetTexturs :TIndexDictionary<String,IGLTextur>;
begin
     Result := _Texturs;
end;

//------------------------------------------------------------------------------

function TGLComput.GetItemsX :GLuint;
begin
     Result := _ItemsX;
end;

procedure TGLComput.SetItemsX( const ItemsX_:GLuint );
begin
     _ItemsX := ItemsX_;
end;

function TGLComput.GetItemsY :GLuint;
begin
     Result := _ItemsY;
end;

procedure TGLComput.SetItemsY( const ItemsY_:GLuint );
begin
     _ItemsY := ItemsY_;
end;

function TGLComput.GetItemsZ :GLuint;
begin
     Result := _ItemsZ;
end;

procedure TGLComput.SetItemsZ( const ItemsZ_:GLuint );
begin
     _ItemsZ := ItemsZ_;
end;

//------------------------------------------------------------------------------

function TGLComput.GetGrupsX :GLuint;
begin
     Result := _GrupsX;
end;

procedure TGLComput.SetGrupsX( const GrupsX_:GLuint );
begin
     _GrupsX := GrupsX_;
end;

function TGLComput.GetGrupsY :GLuint;
begin
     Result := _GrupsY;
end;

procedure TGLComput.SetGrupsY( const GrupsY_:GLuint );
begin
     _GrupsY := GrupsY_;
end;

function TGLComput.GetGrupsZ :GLuint;
begin
     Result := _GrupsZ;
end;

procedure TGLComput.SetGrupsZ( const GrupsZ_:GLuint );
begin
     _GrupsZ := GrupsZ_;
end;

//------------------------------------------------------------------------------

function TGLComput.GetWorksX :GLuint;
begin
     Result := _GrupsX * _ItemsX;
end;

procedure TGLComput.SetWorksX( const WorksX_:GLuint );
begin
     _GrupsX := WorksX_ div _ItemsX;
end;

function TGLComput.GetWorksY :GLuint;
begin
     Result := _GrupsY * _ItemsY;
end;

procedure TGLComput.SetWorksY( const WorksY_:GLuint );
begin
     _GrupsY := WorksY_ div _ItemsY;
end;

function TGLComput.GetWorksZ :GLuint;
begin
     Result := _GrupsZ * _ItemsZ;
end;

procedure TGLComput.SetWorksZ( const WorksZ_:GLuint );
begin
     _GrupsZ := WorksZ_ div _ItemsZ;
end;

//------------------------------------------------------------------------------

procedure TGLComput.SetBuffers( const Sender_:TDictItem<String,IGLBuffer> );
begin
     upEngine := True;
end;

procedure TGLComput.SetImagers( const Sender_:TDictItem<String,IGLImager> );
begin
     upEngine := True;
end;

procedure TGLComput.SetTexturs( const Sender_:TDictItem<String,IGLTextur> );
begin
     upEngine := True;
end;

//------------------------------------------------------------------------------

procedure TGLComput.InitEngine;
var
   K :String;
begin
     if upEngine then
     begin
          with _Engine do
          begin
               for K in _Buffers.Keys do
               begin
                    with _Buffers[ K ] do
                    begin
                         StoBufs.Add( Order{BinP}, K{Name} );
                    end;
               end;

               for K in _Imagers.Keys do
               begin
                    with _Imagers[ K ] do
                    begin
                         Texturs.Add( Order{BinP}, K{Name} );
                    end;
               end;

               for K in _Texturs.Keys do
               begin
                    with _Texturs[ K ] do
                    begin
                         Texturs.Add( _Imagers.Count + Order{BinP}, K{Name} );
                    end;
               end;

               Link;

               Use;

               for K in _Buffers.Keys do
               begin
                    with _Buffers[ K ] do glBindBufferBase( GL_SHADER_STORAGE_BUFFER, Order, Value.ID );
               end;

               for K in _Imagers.Keys do
               begin
                    with _Imagers[ K ] do Value.UseComput( Order );
               end;

               for K in _Texturs.Keys do
               begin
                    with _Texturs[ K ] do Value.Use( _Imagers.Count + Order );
               end;

               Unuse;
          end;

          upEngine := False;
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLComput.Create;
begin
     inherited;

     _Engine  := TGLEngine .Create;  upEngine := True;
     _ShaderC := TGLShaderC.Create;

     _Buffers := TIndexDictionary<String,IGLBuffer>.Create;
     _Imagers := TIndexDictionary<String,IGLImager>.Create;
     _Texturs := TIndexDictionary<String,IGLTextur>.Create;

     _Buffers.OnChange := SetBuffers;
     _Imagers.OnChange := SetImagers;
     _Texturs.OnChange := SetTexturs;

     _Engine.Attach( _ShaderC{Shad} );

     _GrupsX := 10;  _ItemsX := 10;
     _GrupsY := 10;  _ItemsY := 10;
     _GrupsZ := 10;  _ItemsZ := 10;
end;

destructor TGLComput.Destroy;
begin
     _Buffers.DisposeOf;
     _Imagers.DisposeOf;
     _Texturs.DisposeOf;

     _Engine .DisposeOf;
     _ShaderC.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLComput.Run;
begin
     InitEngine;

     with _Engine do
     begin
          Use;
            glDispatchCompute( _GrupsX, _GrupsY, _GrupsZ );
          Unuse;
     end;
end;

procedure TGLComput.RunARB;
begin
     InitEngine;

     with _Engine do
     begin
          Use;
            glDispatchComputeGroupSizeARB( _GrupsX, _GrupsY, _GrupsZ,
                                           _ItemsX, _ItemsY, _ItemsZ );
          Unuse;
     end;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
