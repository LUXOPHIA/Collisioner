unit LUX.GPU.OpenGL.Buffer;

interface //#################################################################### ■

uses Winapi.OpenGL, Winapi.OpenGLext,
     LUX;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBufferData<TValue>

     TGLBufferData<TItem:record> = record
     private
       type PItem = ^TItem;
     private
       _Head   :Pointer;
       _Stride :GLint;
       ///// アクセス
       function GetItems( const I_:Integer ) :TItem;
       procedure SetItems( const I_:Integer; const Item_:TItem );
     public
       constructor Create( const Head_:Pointer; const Stride_:GLint );
       ///// プロパティ
       property Items[ const I_:Integer ] :TItem read GetItems write SetItems;
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBuffer<_TYPE_>

     IGLBuffer = interface
       ['{196C0785-DF74-480C-B1DB-76E689F19E32}']
       ///// アクセス
       function GetName :String;
       procedure SetName( Name_:String );
       ///// プロパティ
       property Name :String read GetName write SetName;
     end;

     TGLBuffer<_TYPE_:record> = class( TInterfacedObject, IGLBuffer )
     private
     protected
       _Name  :String;
       _BindL :GLuint;
       _ID    :GLuint;
       _Kind  :GLenum;
       _Usage :GLenum;
       _Count :Integer;
       ///// アクセス
       function GetName :String;
       procedure SetName( Name_:String );
       function GetStride :GLint; virtual;
       procedure SetCount( const Count_:Integer );
       function GetItems( const I_:Integer ) :_TYPE_;
       procedure SetItems( const I_:Integer; const Item_:_TYPE_ );
     public
       constructor Create( const Kind_:GLenum; const Usage_:GLenum );
       destructor Destroy; override;
       ///// プロパティ
       property Name                      :String  read GetName   write SetName ;
       property ID                        :GLuint  read   _ID                   ;
       property Kind                      :GLenum  read   _Kind                 ;
       property Usage                     :GLenum  read   _Usage                ;
       property Stride                    :GLint   read GetStride               ;
       property Count                     :Integer read   _Count  write SetCount;
       property Items[ const I_:Integer ] :_TYPE_  read GetItems  write SetItems;
       ///// メソッド
       procedure Bind;
       procedure Unbind;
       function Map( const Access_:GLenum = GL_READ_WRITE ) :TGLBufferData<_TYPE_>;
       procedure Unmap;
       procedure Import( const Array_:array of _TYPE_ );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBufferV<_TYPE_>

     IGLBufferV = interface( IGLBuffer )
       ['{1DDD600E-0FA5-4D07-A280-72B96722D0C7}']
       ///// アクセス
       function GetBindL :GLuint;
       procedure SetBindL( BindL_:GLuint );
       ///// プロパティ
       property BindL :GLuint read GetBindL write SetBindL;
     end;

     TGLBufferV<_TYPE_:record> = class( TGLBuffer<_TYPE_>, IGLBufferV )
     private
     protected
       ///// アクセス
       class function GetElemT :GLenum; virtual; abstract;
       class function GetElemN :GLint; virtual; abstract;
       function GetBindL :GLuint;
       procedure SetBindL( BindL_:GLuint );
     public
       constructor Create( const Usage_:GLenum );
       ///// プロパティ
       property ElemT :GLenum read GetElemT;
       property ElemN :GLint  read GetElemN;
       ///// メソッド
       procedure Use;
       procedure Unuse;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBufferVS<_TYPE_>

     TGLBufferVS<_TYPE_:record> = class( TGLBufferV<_TYPE_> )
     private
     protected
       ///// アクセス
       class function GetElemT :GLenum; override;
       class function GetElemN :GLint; override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBufferI<_TYPE_>

     IGLBufferI = interface( IGLBuffer )
       ['{BCD91AB4-D6E5-49E1-8670-D4C4ED39AFD3}']

     end;

     TGLBufferI<_TYPE_:record> = class( TGLBuffer<_TYPE_>, IGLBufferI )
     private
     protected
       ///// アクセス
       class function GetElemT :GLenum;
     public
       constructor Create( const Usage_:GLenum );
       ///// プロパティ
       property ElemT :GLenum read GetElemT;
       ///// メソッド
       procedure Draw;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBufferU<_TYPE_>

     IGLBufferU = interface( IGLBuffer )
       ['{923ECB97-7686-4B53-A9FC-AB4365C7CC4B}']
       ///// アクセス
       function GetBindI :GLuint;
       procedure SetBindI( BindI_:GLuint );
       ///// プロパティ
       property BindI :GLuint read GetBindI write SetBindI;
     end;

     TGLBufferU<_TYPE_:record> = class( TGLBuffer<_TYPE_>, IGLBufferU )
     private
     protected class var
       _Align :GLint;
     protected
       _BindI :GLuint;
       ///// アクセス
       function GetBindI :GLuint;
       procedure SetBindI( BindI_:GLuint );
       function GetStride :GLint; override;
     public
       class constructor Create;
       constructor Create( const Usage_:GLenum ); overload;
       constructor Create( const BindI_:GLuint; const Usage_:GLenum ); overload;
       ///// プロパティ
       class property Align :GLint read _Align;
       property BindI :GLuint read _BindI write _BindI;
       ///// メソッド
       procedure Use; overload;
       procedure Use( const I_:Integer; const N_:Integer = 1 ); overload;
       procedure Unuse;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBufferData<TValue>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

function TGLBufferData<TItem>.GetItems( const I_:Integer ) :TItem;
var
   P :PByte;
begin
     P := _Head;  Inc( P, _Stride * I_ );   Result := PItem( P )^;
end;

procedure TGLBufferData<TItem>.SetItems( const I_:Integer; const Item_:TItem );
var
   P :PByte;
begin
     P := _Head;  Inc( P, _Stride * I_ );   PItem( P )^ := Item_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLBufferData<TItem>.Create( const Head_:Pointer; const Stride_:GLint );
begin
     _Head   := Head_;
     _Stride := Stride_;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBuffer<_TYPE_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLBuffer<_TYPE_>.GetName :String;
begin
     Result := _Name;
end;

procedure TGLBuffer<_TYPE_>.SetName( Name_:String );
begin
     _Name := Name_;
end;

function TGLBuffer<_TYPE_>.GetStride :GLint;
begin
     Result := SizeOf( _TYPE_ );
end;

procedure TGLBuffer<_TYPE_>.SetCount( const Count_:Integer );
begin
     _Count := Count_;

     Bind;

       glBufferData( _Kind, GetStride * _Count, nil, _Usage );

     Unbind;
end;

function TGLBuffer<_TYPE_>.GetItems( const I_:Integer ) :_TYPE_;
begin
     with Map( GL_READ_ONLY ) do Result := GetItems( I_ );

     Unmap;
end;

procedure TGLBuffer<_TYPE_>.SetItems( const I_:Integer; const Item_:_TYPE_ );
begin
     with Map( GL_WRITE_ONLY ) do SetItems( I_, Item_ );

     Unmap;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLBuffer<_TYPE_>.Create( const Kind_:GLenum; const Usage_:GLenum );
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

       with Result do
       begin
            _Head   := glMapBuffer( _Kind, Access_ );
            _Stride := GetStride;
       end;

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

/////////////////////////////////////////////////////////////////////// アクセス

function TGLBufferV<_TYPE_>.GetBindL :GLuint;
begin
     Result := _BindL;
end;

procedure TGLBufferV<_TYPE_>.SetBindL( BindL_:GLuint );
begin
     _BindL := BindL_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLBufferV<_TYPE_>.Create( const Usage_:GLenum );
begin
     inherited Create( GL_ARRAY_BUFFER, Usage_ );

end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLBufferV<_TYPE_>.Use;
begin
     glEnableVertexAttribArray( _BindL );

     Bind;

       glVertexAttribPointer( _BindL, GetElemN, GetElemT, GL_FALSE, 0, nil );

     Unbind;
end;

procedure TGLBufferV<_TYPE_>.Unuse;
begin
     glDisableVertexAttribArray( _BindL );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBufferVS<_TYPE_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

class function TGLBufferVS<_TYPE_>.GetElemT :GLenum;
begin
     Result := GL_FLOAT;
end;

class function TGLBufferVS<_TYPE_>.GetElemN :GLint;
begin
     Result := SizeOf( _TYPE_ ) div SizeOf( Single );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBufferI<_TYPE_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

class function TGLBufferI<_TYPE_>.GetElemT :GLenum;
begin
     case  SizeOf( _TYPE_ ) of
       3: Result := GL_UNSIGNED_BYTE;
       6: Result := GL_UNSIGNED_SHORT;
      12: Result := GL_UNSIGNED_INT;
     else Assert( False, 'Unkown Type!' );
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLBufferI<_TYPE_>.Create( const Usage_:GLenum );
begin
     inherited Create( GL_ELEMENT_ARRAY_BUFFER, Usage_ );

end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLBufferI<_TYPE_>.Draw;
begin
     glDrawElements( GL_TRIANGLES, 3{Poin} * _Count, GetElemT, nil );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBufferU<_TYPE_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLBufferU<_TYPE_>.GetBindI :GLuint;
begin
     Result := _BindI;
end;

procedure TGLBufferU<_TYPE_>.SetBindI( BindI_:GLuint );
begin
     _BindI := BindI_;
end;

//------------------------------------------------------------------------------

function  TGLBufferU<_TYPE_>.GetStride :GLint;
var
   M :Integer;
begin
     Result := SizeOf( _TYPE_ );

     M := Result mod _Align;

     if M > 0 then Inc( Result, _Align - M );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

class constructor TGLBufferU<_TYPE_>.Create;
begin
     glGetIntegerv( GL_UNIFORM_BUFFER_OFFSET_ALIGNMENT, @_Align );
end;

//------------------------------------------------------------------------------

constructor TGLBufferU<_TYPE_>.Create( const Usage_:GLenum );
begin
     Create( 0, Usage_ );
end;

constructor TGLBufferU<_TYPE_>.Create( const BindI_:GLuint; const Usage_:GLenum );
begin
     inherited Create( GL_UNIFORM_BUFFER, Usage_ );

     _BindI := BindI_;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLBufferU<_TYPE_>.Use;
begin
     glBindBufferBase( _Kind, _BindI, _ID );
end;

procedure TGLBufferU<_TYPE_>.Use( const I_:Integer; const N_:Integer = 1 );
begin
     glBindBufferRange( _Kind, _BindI, _ID, GetStride * I_, GetStride * N_ );
end;

procedure TGLBufferU<_TYPE_>.Unuse;
begin
     glBindBufferBase( _Kind, _BindI, 0 );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■