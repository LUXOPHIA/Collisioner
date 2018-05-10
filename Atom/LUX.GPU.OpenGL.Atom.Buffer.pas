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
     public type
       _PItem_ = ^_TItem_;
     protected
       _Paren :IGLBuffer;
       _Start :Pointer;
       _Strid :GLint;
       ///// アクセス
       function GetItemsP( const I_:Integer ) :_PItem_;
       function GetItems( const I_:Integer ) :_TItem_;
       procedure SetItems( const I_:Integer; const Item_:_TItem_ );
       function GetCount :Integer;
     public
       constructor Create( const Paren_:IGLBuffer; const Start_:Pointer; const Strid_:GLint );
       destructor Destroy; override;
       ///// プロパティ
       property Paren                      :IGLBuffer read   _Paren                ;
       property Start                      :Pointer   read   _Start                ;
       property Strid                      :GLint     read   _Strid                ;
       property Count                      :Integer   read GetCount                ;
       property ItemsP[ const I_:Integer ] :_PItem_   read GetItemsP               ;
       property Items[ const I_:Integer ]  :_TItem_   read GetItems  write SetItems; default;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBuffer<_TItem_,_TIter_>

     IGLBuffer = interface( IGLAtomer )
     ['{196C0785-DF74-480C-B1DB-76E689F19E32}']
       ///// アクセス
       function GetKind :GLenum;
       function GetAlign :GLint;
       function GetStrid :GLint;
       function GetUsage :GLenum;
       procedure SetUsage( const Usage_:GLenum );
       function GetCount :Integer;
       procedure SetCount( const Count_:Integer );
       ///// プロパティ
       property Kind  :GLenum  read GetKind                ;
       property Align :GLint   read GetAlign               ;
       property Strid :GLint   read GetStrid               ;
       property ID    :GLuint  read GetID                  ;
       property Usage :GLenum  read GetUsage write SetUsage;
       property Count :Integer read GetCount write SetCount;
       ///// メソッド
       procedure Bind;
       procedure Unbind;
       procedure Unmap;
     end;

     //-------------------------------------------------------------------------

     TGLBuffer<_TItem_:record;
               _TIter_:TGLBufferData<_TItem_>,constructor> = class( TGLAtomer, IGLBuffer )
     private
     private type
       _PItem_ = ^_TItem_;
     protected
       _Align :GLint;
       _Strid :GLint;
       _Usage :GLenum;
       _Count :Integer;
       ///// イベント
       _OnMap   :TConstProc<IGLBuffer>;
       _OnUnmap :TConstProc<IGLBuffer>;
       ///// アクセス
       function GetKind :GLenum; virtual; abstract;
       function GetAlign :GLint;
       function GetStrid :GLint;
       function GetUsage :GLenum;
       procedure SetUsage( const Usage_:GLenum );
       function GetCount :Integer;
       procedure SetCount( const Count_:Integer ); virtual;
       function GetItems( const I_:Integer ) :_TItem_;
       procedure SetItems( const I_:Integer; const Item_:_TItem_ );
       ///// メソッド
       function InitAlign :GLint; virtual;
       function InitStrid :GLint;
       procedure MakeBuffer; virtual;
     public
       constructor Create; overload;
       constructor Create( const Usage_:GLenum ); overload; virtual;
       procedure AfterConstruction; override;
       destructor Destroy; override;
       ///// プロパティ
       property Kind                      :GLenum  read GetKind                ;
       property Align                     :GLint   read GetAlign               ;
       property Strid                     :GLint   read GetStrid               ;
       property Usage                     :GLenum  read GetUsage write SetUsage;
       property Count                     :Integer read GetCount write SetCount;
       property Items[ const I_:Integer ] :_TItem_ read GetItems write SetItems; default;
       ///// イベント
       property OnMap   :TConstProc<IGLBuffer> read _OnMap   write _OnMap  ;
       property OnUnmap :TConstProc<IGLBuffer> read _OnUnmap write _OnUnmap;
       ///// メソッド
       procedure Bind;
       procedure Unbind;
       function Map( const Access_:GLenum = GL_READ_WRITE ) :_TIter_;
       procedure Unmap;
       procedure CopyFrom( const Array_:array of _TItem_ );
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

function TGLBufferData<_TItem_>.GetItemsP( const I_:Integer ) :_PItem_;
var
   P :PByte;
begin
     P := _Start;  Inc( P, _Strid * I_ );  Result := _PItem_( P );
end;

//------------------------------------------------------------------------------

function TGLBufferData<_TItem_>.GetItems( const I_:Integer ) :_TItem_;
begin
     Result := GetItemsP( I_ )^;
end;

procedure TGLBufferData<_TItem_>.SetItems( const I_:Integer; const Item_:_TItem_ );
begin
     GetItemsP( I_ )^ := Item_;
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

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLBuffer<_TItem_,_TIter_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLBuffer<_TItem_,_TIter_>.GetAlign :GLint;
begin
     Result := _Align;
end;

function TGLBuffer<_TItem_,_TIter_>.GetStrid :GLint;
begin
     Result := _Strid;
end;

//------------------------------------------------------------------------------

function TGLBuffer<_TItem_,_TIter_>.GetUsage :GLenum;
begin
     Result := _Usage;
end;

procedure TGLBuffer<_TItem_,_TIter_>.SetUsage( const Usage_:GLenum );
begin
     _Usage := Usage_;  MakeBuffer;
end;

//------------------------------------------------------------------------------

function TGLBuffer<_TItem_,_TIter_>.GetCount :Integer;
begin
     Result := _Count;
end;

procedure TGLBuffer<_TItem_,_TIter_>.SetCount( const Count_:Integer );
begin
     _Count := Count_;  MakeBuffer;
end;

//------------------------------------------------------------------------------

function TGLBuffer<_TItem_,_TIter_>.GetItems( const I_:Integer ) :_TItem_;
var
   D :_TIter_;
begin
     D := Map( GL_READ_ONLY );

     Result := D.Items[ I_ ];

     D.DisposeOf;
end;

procedure TGLBuffer<_TItem_,_TIter_>.SetItems( const I_:Integer; const Item_:_TItem_ );
var
   D :_TIter_;
begin
     D := Map( GL_WRITE_ONLY );

     D.Items[ I_ ] := Item_;

     D.DisposeOf;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TGLBuffer<_TItem_,_TIter_>.InitAlign :GLint;
begin
     Result := 1;
end;

function TGLBuffer<_TItem_,_TIter_>.InitStrid :GLint;
var
   M :Integer;
begin
     Result := SizeOf( _TItem_ );

     M := Result mod _Align;

     if M > 0 then Inc( Result, _Align - M );
end;

//------------------------------------------------------------------------------

procedure TGLBuffer<_TItem_,_TIter_>.MakeBuffer;
begin
     Bind;

       glBufferData( GetKind, _Strid * _Count, nil, _Usage );

     Unbind;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLBuffer<_TItem_,_TIter_>.Create;
begin
     Create( GL_STATIC_DRAW );
end;

constructor TGLBuffer<_TItem_,_TIter_>.Create( const Usage_:GLenum );
begin
     inherited Create;

     _Align := InitAlign;
     _Strid := InitStrid;

     glGenBuffers( 1, @_ID );

     _Usage := Usage_;
     _Count := 1;
end;

procedure TGLBuffer<_TItem_,_TIter_>.AfterConstruction;
begin
     inherited;

     MakeBuffer;
end;

destructor TGLBuffer<_TItem_,_TIter_>.Destroy;
begin
     glDeleteBuffers( 1, @_ID );

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLBuffer<_TItem_,_TIter_>.Bind;
begin
     glBindBuffer( GetKind, _ID );
end;

procedure TGLBuffer<_TItem_,_TIter_>.Unbind;
begin
     glBindBuffer( GetKind, 0 );
end;

//------------------------------------------------------------------------------

function TGLBuffer<_TItem_,_TIter_>.Map( const Access_:GLenum = GL_READ_WRITE ) :_TIter_;
begin
     if Assigned( _OnMap ) then _OnMap( Self );

     Bind;

       Result := _TIter_.Create;

       Result._Paren := Self;
       Result._Start := glMapBuffer( GetKind, Access_ );
       Result._Strid := _Strid;

     Unbind;
end;

procedure TGLBuffer<_TItem_,_TIter_>.Unmap;
begin
     Bind;

       glUnmapBuffer( GetKind );

     Unbind;

     if Assigned( _OnUnmap ) then _OnUnmap( Self );
end;

//------------------------------------------------------------------------------

procedure TGLBuffer<_TItem_,_TIter_>.CopyFrom( const Array_:array of _TItem_ );
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