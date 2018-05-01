unit LUX.GPU.OpenGL.Comput;

interface //#################################################################### ■

uses System.SysUtils, System.UITypes,
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
       _Engine  :TGLEngine;
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

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLComput.Create;
begin
     inherited;

     _Engine  := TGLEngine .Create;
     _ShaderC := TGLShaderC.Create;

     _Buffers := TIndexDictionary<String,IGLBuffer>.Create;
     _Imagers := TIndexDictionary<String,IGLImager>.Create;
     _Texturs := TIndexDictionary<String,IGLTextur>.Create;

     _Engine.Attach( _ShaderC{Shad} );

     _GrupsX := 16;  _ItemsX := 16;
     _GrupsY := 16;  _ItemsY := 16;
     _GrupsZ := 16;  _ItemsZ := 16;
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
var
   K :String;
begin
     for K in _Buffers.Keys do
     begin
          with _Buffers[ K ] do
          begin
               _Engine.StoBufs.Add( Index{BinP}, K{Name} );
          end;
     end;

     for K in _Imagers.Keys do
     begin
          with _Imagers[ K ] do
          begin
               _Engine.Texturs.Add( Index{BinP}, K{Name} );
          end;
     end;

     for K in _Texturs.Keys do
     begin
          with _Texturs[ K ] do
          begin
               _Engine.Texturs.Add( _Imagers.Count + Index{BinP}, K{Name} );
          end;
     end;

     _Engine.Link;

     _Engine.Use;

     for K in _Buffers.Keys do
     begin
          with _Buffers[ K ] do glBindBufferBase( GL_SHADER_STORAGE_BUFFER, Index, Value.ID );
     end;

     for K in _Imagers.Keys do
     begin
          with _Imagers[ K ] do Value.UseComput( Index );
     end;

     for K in _Texturs.Keys do
     begin
          with _Texturs[ K ] do Value.Use( _Imagers.Count + Index );
     end;

     glDispatchCompute( _GrupsX, _GrupsY, _GrupsZ );

     _Engine.Unuse;
end;

procedure TGLComput.RunARB;
var
   K :String;
begin
     for K in _Buffers.Keys do
     begin
          with _Buffers[ K ] do
          begin
               _Engine.StoBufs.Add( Index{BinP}, K{Name} );
          end;
     end;

     for K in _Imagers.Keys do
     begin
          with _Imagers[ K ] do
          begin
               _Engine.Texturs.Add( Index{BinP}, K{Name} );
          end;
     end;

     for K in _Texturs.Keys do
     begin
          with _Texturs[ K ] do
          begin
               _Engine.Texturs.Add( _Imagers.Count + Index{BinP}, K{Name} );
          end;
     end;

     _Engine.Link;

     _Engine.Use;

     for K in _Buffers.Keys do
     begin
          with _Buffers[ K ] do glBindBufferBase( GL_SHADER_STORAGE_BUFFER, Index, Value.ID );
     end;

     for K in _Imagers.Keys do
     begin
          with _Imagers[ K ] do Value.UseComput( Index );
     end;

     for K in _Texturs.Keys do
     begin
          with _Texturs[ K ] do Value.Use( _Imagers.Count + Index );
     end;

     glDispatchComputeGroupSizeARB( _GrupsX, _GrupsY, _GrupsZ,
                                    _ItemsX, _ItemsY, _ItemsZ );

     _Engine.Unuse;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
