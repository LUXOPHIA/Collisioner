unit LUX.GPU.OpenGL.Atom.Buffer;

interface //#################################################################### ■

uses Winapi.OpenGL, Winapi.OpenGLext,
     LUX,
     LUX.GPU.OpenGL.Atom;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBufferData<TValue>

     TGLBufferData<TItem:record> = record
     private type
       PItem = ^TItem;
     private
       Start :Pointer;
       Strid :GLint;
       ///// アクセス
       function GetItemP( const I_:Integer ) :PItem;
       function GetItems( const I_:Integer ) :TItem;
       procedure SetItems( const I_:Integer; const Item_:TItem );
     public
       constructor Create( const Start_:Pointer; const Strid_:GLint );
       ///// プロパティ
       property ItemP[ const I_:Integer ] :PItem read GetItemP               ;
       property Items[ const I_:Integer ] :TItem read GetItems write SetItems; default;
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBuffer<_TYPE_>

     IGLBuffer = interface( IGLObject )
     ['{196C0785-DF74-480C-B1DB-76E689F19E32}']
       ///// アクセス
       function GetKind :GLenum;
       function GetAlign :GLint;
       function GetStrid :GLint;
       function GetUsage :GLenum;
       function GetCount :Integer;
       procedure SetCount( const Count_:Integer );
       ///// プロパティ
       property Kind  :GLenum  read GetKind                ;
       property Align :GLint   read GetAlign               ;
       property Strid :GLint   read GetStrid               ;
       property ID    :GLuint  read GetID                  ;
       property Usage :GLenum  read GetUsage               ;
       property Count :Integer read GetCount write SetCount;
       ///// メソッド
       procedure Bind;
       procedure Unbind;
     end;

     //-------------------------------------------------------------------------

     TGLBuffer<_TYPE_:record> = class( TGLObject, IGLBuffer )
     private
     protected
       _Align :GLint;
       _Strid :GLint;
       _Usage :GLenum;
       _Count :Integer;
       ///// アクセス
       function GetKind :GLenum; virtual; abstract;
       function GetAlign :GLint;
       function GetStrid :GLint;
       function GetUsage :GLenum;
       function GetCount :Integer;
       procedure SetCount( const Count_:Integer );
       function GetItems( const I_:Integer ) :_TYPE_;
       procedure SetItems( const I_:Integer; const Item_:_TYPE_ );
       ///// メソッド
       function InitAlign :GLint; virtual;
       function InitStrid :GLint;
     public
       constructor Create( const Usage_:GLenum );
       destructor Destroy; override;
       ///// プロパティ
       property Kind                      :GLenum  read GetKind                ;
       property Align                     :GLint   read GetAlign               ;
       property Strid                     :GLint   read GetStrid               ;
       property Usage                     :GLenum  read GetUsage               ;
       property Count                     :Integer read GetCount write SetCount;
       property Items[ const I_:Integer ] :_TYPE_  read GetItems write SetItems; default;
       ///// メソッド
       procedure Bind;
       procedure Unbind;
       function Map( const Access_:GLenum = GL_READ_WRITE ) :TGLBufferData<_TYPE_>;
       procedure Unmap;
       procedure Import( const Array_:array of _TYPE_ );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLVarray

     TGLVarray = class( TGLObject )
     private
     protected
     public
       constructor Create;
       destructor Destroy; override;
       ///// メソッド
       procedure Bind;
       procedure Unbind;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBufferData<TValue>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TGLBufferData<TItem>.GetItemP( const I_:Integer ) :PItem;
var
   P :PByte;
begin
     P := Start;  Inc( P, Strid * I_ );  Result := PItem( P );
end;

//------------------------------------------------------------------------------

function TGLBufferData<TItem>.GetItems( const I_:Integer ) :TItem;
begin
     Result := GetItemP( I_ )^;
end;

procedure TGLBufferData<TItem>.SetItems( const I_:Integer; const Item_:TItem );
begin
     GetItemP( I_ )^ := Item_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLBufferData<TItem>.Create( const Start_:Pointer; const Strid_:GLint );
begin
     Start := Start_;
     Strid := Strid_;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBuffer<_TYPE_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLBuffer<_TYPE_>.GetAlign :GLint;
begin
     Result := _Align;
end;

function TGLBuffer<_TYPE_>.GetStrid :GLint;
begin
     Result := _Strid;
end;

function TGLBuffer<_TYPE_>.GetUsage :GLenum;
begin
     Result := _Usage;
end;

function TGLBuffer<_TYPE_>.GetCount :Integer;
begin
     Result := _Count;
end;

procedure TGLBuffer<_TYPE_>.SetCount( const Count_:Integer );
begin
     _Count := Count_;

     Bind;

       glBufferData( GetKind, _Strid * _Count, nil, _Usage );

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

/////////////////////////////////////////////////////////////////////// メソッド

function TGLBuffer<_TYPE_>.InitAlign :GLint;
begin
     Result := 1;
end;

function TGLBuffer<_TYPE_>.InitStrid :GLint;
var
   M :Integer;
begin
     Result := SizeOf( _TYPE_ );

     M := Result mod _Align;

     if M > 0 then Inc( Result, _Align - M );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLBuffer<_TYPE_>.Create( const Usage_:GLenum );
begin
     inherited Create;

     _Align := InitAlign;
     _Strid := InitStrid;

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
            Start := glMapBuffer( GetKind, Access_ );
            Strid := _Strid;
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

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLVarray

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLVarray.Create;
begin
     inherited;

     glGenVertexArrays( 1, @_ID );
end;

destructor TGLVarray.Destroy;
begin
     glDeleteVertexArrays( 1, @_ID );

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLVarray.Bind;
begin
     glBindVertexArray( _ID );
end;

procedure TGLVarray.Unbind;
begin
     glBindVertexArray( 0 );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■