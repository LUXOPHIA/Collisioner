unit LUX.GPU.OpenGL.Buffer;

interface //#################################################################### ■

uses Winapi.OpenGL, Winapi.OpenGLext,
     LUX;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBufferData<TValue>

     TGLBufferData<TItem:record> = record
     private type
       PItem = ^TItem;
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

     //-------------------------------------------------------------------------

     TGLBuffer<_TYPE_:record> = class( TInterfacedObject, IGLBuffer )
     private
     protected
       _Name  :String;
       _BindL :GLuint;
       _ID    :GLuint;
       _Usage :GLenum;
       _Count :Integer;
       ///// アクセス
       function GetKind :GLenum; virtual; abstract;
       function GetName :String;
       procedure SetName( Name_:String );
       function GetStride :GLint; virtual;
       procedure SetCount( const Count_:Integer );
       function GetItems( const I_:Integer ) :_TYPE_;
       procedure SetItems( const I_:Integer; const Item_:_TYPE_ );
     public
       constructor Create( const Usage_:GLenum );
       destructor Destroy; override;
       ///// プロパティ
       property Kind                      :GLenum  read GetKind                 ;
       property Name                      :String  read GetName   write SetName ;
       property ID                        :GLuint  read   _ID                   ;
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

       glBufferData( GetKind, GetStride * _Count, nil, _Usage );

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

constructor TGLBuffer<_TYPE_>.Create( const Usage_:GLenum );
begin
     inherited Create;

     glGenBuffers( 1, @_ID );

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
     glBindBuffer( GetKind, _ID );
end;

procedure TGLBuffer<_TYPE_>.Unbind;
begin
     glBindBuffer( GetKind, 0 );
end;

//------------------------------------------------------------------------------

function TGLBuffer<_TYPE_>.Map( const Access_:GLenum = GL_READ_WRITE ) :TGLBufferData<_TYPE_>;
begin
     Bind;

       with Result do
       begin
            _Head   := glMapBuffer( GetKind, Access_ );
            _Stride := GetStride;
       end;

     Unbind;
end;

procedure TGLBuffer<_TYPE_>.Unmap;
begin
     Bind;

       glUnmapBuffer( GetKind );

     Unbind;
end;

//------------------------------------------------------------------------------

procedure TGLBuffer<_TYPE_>.Import( const Array_:array of _TYPE_ );
begin
     _Count := Length( Array_ );

     Bind;

       glBufferData( GetKind, SizeOf( Array_ ), @Array_[ 0 ], _Usage );

     Unbind;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■