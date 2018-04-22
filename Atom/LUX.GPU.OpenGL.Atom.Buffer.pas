unit LUX.GPU.OpenGL.Atom.Buffer;

interface //#################################################################### ■

uses Winapi.OpenGL, Winapi.OpenGLext,
     LUX,
     LUX.GPU.OpenGL.Atom;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     IGLBuffer = interface;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBufferData<_TItem_>

     TGLBufferData<_TItem_:record> = class
     private type
       _PItem_ = ^_TItem_;
     private
       _Paren :IGLBuffer;
       _Start :Pointer;
       _Strid :GLint;
       ///// アクセス
       function GetItemP( const I_:Integer ) :_PItem_;
       function GetItems( const I_:Integer ) :_TItem_;
       procedure SetItems( const I_:Integer; const Item_:_TItem_ );
       function GetCount :Integer;
     public
       constructor Create( const Paren_:IGLBuffer; const Start_:Pointer; const Strid_:GLint );
       destructor Destroy; override;
       ///// プロパティ
       property Paren                     :IGLBuffer read   _Paren               ;
       property Start                     :Pointer   read   _Start               ;
       property Strid                     :GLint     read   _Strid               ;
       property Count                     :Integer   read GetCount               ;
       property ItemP[ const I_:Integer ] :_PItem_   read GetItemP               ;
       property Items[ const I_:Integer ] :_TItem_   read GetItems write SetItems; default;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBuffer<_TItem_>

     IGLBuffer = interface( IGLAtomer )
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
       procedure Unmap;
     end;

     //-------------------------------------------------------------------------

     TGLBuffer<_TItem_:record> = class( TGLAtomer, IGLBuffer )
     private
     private type
       _PItem_ = ^_TItem_;
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
       procedure SetCount( const Count_:Integer ); virtual;
       function GetItems( const I_:Integer ) :_TItem_;
       procedure SetItems( const I_:Integer; const Item_:_TItem_ );
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
       property Items[ const I_:Integer ] :_TItem_ read GetItems write SetItems; default;
       ///// メソッド
       procedure Bind;
       procedure Unbind;
       function Map( const Access_:GLenum = GL_READ_WRITE ) :TGLBufferData<_TItem_>;
       procedure Unmap;
       procedure Import( const Array_:array of _TItem_ );
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBufferData<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TGLBufferData<_TItem_>.GetItemP( const I_:Integer ) :_PItem_;
var
   P :PByte;
begin
     P := _Start;  Inc( P, _Strid * I_ );  Result := _PItem_( P );
end;

//------------------------------------------------------------------------------

function TGLBufferData<_TItem_>.GetItems( const I_:Integer ) :_TItem_;
begin
     Result := GetItemP( I_ )^;
end;

procedure TGLBufferData<_TItem_>.SetItems( const I_:Integer; const Item_:_TItem_ );
begin
     GetItemP( I_ )^ := Item_;
end;

//------------------------------------------------------------------------------

function TGLBufferData<_TItem_>.GetCount :Integer;
begin
     Result := _Paren.Count;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLBufferData<_TItem_>.Create( const Paren_:IGLBuffer; const Start_:Pointer; const Strid_:GLint );
begin
     inherited Create;

     _Paren := Paren_;
     _Start := Start_;
     _Strid := Strid_;
end;

destructor TGLBufferData<_TItem_>.Destroy;
begin
     _Paren.Unmap;

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBuffer<_TItem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLBuffer<_TItem_>.GetAlign :GLint;
begin
     Result := _Align;
end;

function TGLBuffer<_TItem_>.GetStrid :GLint;
begin
     Result := _Strid;
end;

function TGLBuffer<_TItem_>.GetUsage :GLenum;
begin
     Result := _Usage;
end;

function TGLBuffer<_TItem_>.GetCount :Integer;
begin
     Result := _Count;
end;

procedure TGLBuffer<_TItem_>.SetCount( const Count_:Integer );
begin
     _Count := Count_;

     Bind;

       glBufferData( GetKind, _Strid * _Count, nil, _Usage );

     Unbind;
end;

function TGLBuffer<_TItem_>.GetItems( const I_:Integer ) :_TItem_;
begin
     with Map( GL_READ_ONLY ) do
     begin
          Result := Items[ I_ ];

          DisposeOf;
     end;
end;

procedure TGLBuffer<_TItem_>.SetItems( const I_:Integer; const Item_:_TItem_ );
begin
     with Map( GL_WRITE_ONLY ) do
     begin
          Items[ I_ ] := Item_;

          DisposeOf;
     end;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TGLBuffer<_TItem_>.InitAlign :GLint;
begin
     Result := 1;
end;

function TGLBuffer<_TItem_>.InitStrid :GLint;
var
   M :Integer;
begin
     Result := SizeOf( _TItem_ );

     M := Result mod _Align;

     if M > 0 then Inc( Result, _Align - M );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLBuffer<_TItem_>.Create( const Usage_:GLenum );
begin
     inherited Create;

     _Align := InitAlign;
     _Strid := InitStrid;

     glGenBuffers( 1, @_ID );

     _Usage := Usage_;
      Count := 1;
end;

destructor TGLBuffer<_TItem_>.Destroy;
begin
     glDeleteBuffers( 1, @_ID );

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLBuffer<_TItem_>.Bind;
begin
     glBindBuffer( GetKind, _ID );
end;

procedure TGLBuffer<_TItem_>.Unbind;
begin
     glBindBuffer( GetKind, 0 );
end;

//------------------------------------------------------------------------------

function TGLBuffer<_TItem_>.Map( const Access_:GLenum = GL_READ_WRITE ) :TGLBufferData<_TItem_>;
begin
     Bind;

       Result := TGLBufferData<_TItem_>.
                 Create( Self, glMapBuffer( GetKind, Access_ ), _Strid );

     Unbind;
end;

procedure TGLBuffer<_TItem_>.Unmap;
begin
     Bind;

       glUnmapBuffer( GetKind );

     Unbind;
end;

//------------------------------------------------------------------------------

procedure TGLBuffer<_TItem_>.Import( const Array_:array of _TItem_ );
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