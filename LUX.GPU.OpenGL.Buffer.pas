unit LUX.GPU.OpenGL.Buffer;

interface //#################################################################### ■

uses Winapi.OpenGL, Winapi.OpenGLext,
     LUX;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBufferData<TValue>

     TGLBufferData<TValue:record> = record
     public
       type PValue = ^TValue;
     private
       _Head :PValue;
       ///// アクセス
       function GetValue( const I_:Integer ) :TValue;
       procedure SetValue( const I_:Integer; const Value_:TValue );
     public
       ///// プロパティ
       property Values[ const I_:Integer ] :TValue read GetValue write SetValue;
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBuffer<_TYPE_>

     TGLBuffer<_TYPE_:record> = class
     private
     protected
       _ID    :GLuint;
       _Kind  :GLenum;
       _Usage :GLenum;
       _Count :Integer;
       ///// アクセス
       procedure SetCount( const Count_:Integer );
     public
       constructor Create( const Kind_:GLenum; const Usage_:GLenum = GL_STATIC_DRAW );
       destructor Destroy; override;
       ///// プロパティ
       property ID    :GLuint  read _ID;
       property Count :Integer read _Count write SetCount;
       ///// メソッド
       procedure Bind;
       procedure Unbind;
       function Map( const Access_:GLenum = GL_READ_WRITE ) :TGLBufferData<_TYPE_>;
       procedure Unmap;
       procedure Import( const Array_:array of _TYPE_ );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBufferV<_TYPE_>

     TGLBufferV<_TYPE_:record> = class( TGLBuffer<_TYPE_> )
     private
     protected
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       ///// メソッド
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBufferI<_TYPE_>

     TGLBufferI<_TYPE_:record> = class( TGLBuffer<_TYPE_> )
     private
     protected
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       ///// メソッド
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBufferU<_TYPE_>

     TGLBufferU<_TYPE_:record> = class( TGLBuffer<_TYPE_> )
     private
     protected
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       ///// メソッド
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBufferData<TValue>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

function TGLBufferData<TValue>.GetValue( const I_:Integer ) :TValue;
var
   P :PValue;
begin
     P := _Head;  Inc( P, I_ );   Result := P^;
end;

procedure TGLBufferData<TValue>.SetValue( const I_:Integer; const Value_:TValue );
var
   P :PValue;
begin
     P := _Head;  Inc( P, I_ );   P^ := Value_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBuffer<_TYPE_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

procedure TGLBuffer<_TYPE_>.SetCount( const Count_:Integer );
begin
     _Count := Count_;

     Bind;

       glBufferData( _Kind, SizeOf( _TYPE_ ) * _Count, nil, _Usage );

     Unbind;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLBuffer<_TYPE_>.Create( const Kind_:GLenum; const Usage_:GLenum = GL_STATIC_DRAW );
begin
     inherited Create;

     glGenBuffers( 1, @_ID );

     _Kind  := Kind_;
     _Usage := Usage_;
      Count := 0;
end;

destructor TGLBuffer<_TYPE_>.Destroy;
begin
     glDeleteBuffers( 1, @_ID );

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLBuffer<_TYPE_>.Bind;
begin
     glBindBuffer( _Kind, _ID );
end;

procedure TGLBuffer<_TYPE_>.Unbind;
begin
     glBindBuffer( _Kind, 0 );
end;

//------------------------------------------------------------------------------

function TGLBuffer<_TYPE_>.Map( const Access_:GLenum = GL_READ_WRITE ) :TGLBufferData<_TYPE_>;
begin
     Bind;

       Result._Head := glMapBuffer( _Kind, Access_ );

     Unbind;
end;

procedure TGLBuffer<_TYPE_>.Unmap;
begin
     Bind;

       glUnmapBuffer( _Kind );

     Unbind;
end;

//------------------------------------------------------------------------------

procedure TGLBuffer<_TYPE_>.Import( const Array_:array of _TYPE_ );
begin
     _Count := Length( Array_ );

     Bind;

       glBufferData( _Kind, SizeOf( Array_ ), @Array_[ 0 ], _Usage );

     Unbind;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBufferV<_TYPE_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLBufferV<_TYPE_>.Create;
begin
     inherited Create( GL_ARRAY_BUFFER );

end;

destructor TGLBufferV<_TYPE_>.Destroy;
begin

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBufferI<_TYPE_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLBufferI<_TYPE_>.Create;
begin
     inherited Create( GL_ELEMENT_ARRAY_BUFFER );

end;

destructor TGLBufferI<_TYPE_>.Destroy;
begin

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBufferU<_TYPE_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLBufferU<_TYPE_>.Create;
begin
     inherited Create( GL_UNIFORM_BUFFER );

end;

destructor TGLBufferU<_TYPE_>.Destroy;
begin

     inherited;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■