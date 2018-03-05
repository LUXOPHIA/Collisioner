unit LUX.GPU.OpenGL.Atom.Chaner;

interface //#################################################################### ■

uses Winapi.OpenGL, Winapi.OpenGLext,
     LUX, LUX.GPU.OpenGL.Atom;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLChaner

     IGLChaner = interface
     ['{F8641443-EDC3-4EB0-AA1F-4B35C82B0515}']
     {protected}
       ///// アクセス
       function GetFormat :GLenum;
       procedure SetFormat( const Format_:GLenum );
       function GetSizeX :Integer;
       procedure SetSizeX( const SizeX_:Integer );
       function GetSizeY :Integer;
       procedure SetSizeY( const SizeY_:Integer );
       ///// メソッド
       procedure MakeBuffer;
     {public}
       ///// プロパティ
       property Format :GLenum  read GetFormat write SetFormat;
       property SizeX  :Integer read GetSizeX  write SetSizeX ;
       property SizeY  :Integer read GetSizeY  write SetSizeY ;
       ///// メソッド
       procedure Bind;
       procedure Unbind;
     end;

     //-------------------------------------------------------------------------

     TGLChaner = class( TGLAtomer, IGLChaner )
     private
     protected
       _Format :GLenum;
       _SizeX  :Integer;
       _SizeY  :Integer;
       ///// アクセス
       function GetFormat :GLenum;
       procedure SetFormat( const Format_:GLenum );
       function GetSizeX :Integer;
       procedure SetSizeX( const SizeX_:Integer );
       function GetSizeY :Integer;
       procedure SetSizeY( const SizeY_:Integer );
       ///// メソッド
       procedure MakeBuffer; virtual; abstract;
     public
       constructor Create( const Format_:Integer );
       procedure AfterConstruction; override;
       destructor Destroy; override;
       ///// プロパティ
       property Format :GLenum  read GetFormat write SetFormat;
       property SizeX  :Integer read GetSizeX  write SetSizeX ;
       property SizeY  :Integer read GetSizeY  write SetSizeY ;
       ///// メソッド
       procedure Bind;
       procedure Unbind;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLChaner1

     IGLChaner1 = interface( IGLChaner )
     ['{FD4E38E6-4CFD-432E-8C7E-F6E8605CD5F8}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TGLChaner1 = class( TGLChaner, IGLChaner1 )
     private
     protected
       ///// メソッド
       procedure MakeBuffer; override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLChanerN

     IGLChanerN = interface( IGLChaner )
     ['{756CB1F9-93C5-4AD6-A3AE-C7F94381BF26}']
     {protected}
       ///// アクセス
       function GetSampleN :Byte;
       procedure SetSampleN( const SampleN_:Byte );
       ///// メソッド
       procedure MakeBuffer;
     {public}
       ///// プロパティ
       property SampleN :Byte read GetSampleN write SetSampleN;
     end;

     //-------------------------------------------------------------------------

     TGLChanerN = class( TGLChaner, IGLChanerN )
     private
     protected
       _SampleN :Byte;
       ///// アクセス
       function GetSampleN :Byte;
       procedure SetSampleN( const SampleN_:Byte );
       ///// メソッド
       procedure MakeBuffer; override;
     public
       constructor Create( const Format_:Integer );
       destructor Destroy; override;
       ///// プロパティ
       property SampleN :Byte read GetSampleN write SetSampleN;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLChaner

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLChaner.GetFormat :GLenum;
begin
     Result := _Format;
end;

procedure TGLChaner.SetFormat( const Format_:GLenum );
begin
     _Format := Format_;  MakeBuffer;
end;

//------------------------------------------------------------------------------

function TGLChaner.GetSizeX :Integer;
begin
     Result := _SizeX;
end;

procedure TGLChaner.SetSizeX( const SizeX_:Integer );
begin
     _SizeX := SizeX_;  MakeBuffer;
end;

function TGLChaner.GetSizeY :Integer;
begin
     Result := _SizeY;
end;

procedure TGLChaner.SetSizeY( const SizeY_:Integer );
begin
     _SizeY := SizeY_;  MakeBuffer;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLChaner.Create( const Format_:Integer );
begin
     inherited Create;

     glGenRenderbuffers( 1, @_ID );

     _Format := Format_;
end;

procedure TGLChaner.AfterConstruction;
begin
     inherited;

     MakeBuffer;
end;

destructor TGLChaner.Destroy;
begin
     glDeleteRenderbuffers( 1, @_ID );

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLChaner.Bind;
begin
     glBindRenderbuffer( GL_RENDERBUFFER, _ID );
end;

procedure TGLChaner.Unbind;
begin
     glBindRenderbuffer( GL_RENDERBUFFER, 0 );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLChaner1

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLChaner1.MakeBuffer;
begin
     Bind;

       glRenderbufferStorage( GL_RENDERBUFFER, _Format, _SizeX, _SizeY );

     Unbind;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLChanerN

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLChanerN.GetSampleN :Byte;
begin
     Result := _SampleN;
end;

procedure TGLChanerN.SetSampleN( const SampleN_:Byte );
begin
     _SampleN := SampleN_;  MakeBuffer;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLChanerN.MakeBuffer;
begin
     Bind;

       glRenderbufferStorageMultisample( GL_RENDERBUFFER, _SampleN, _Format, _SizeX, _SizeY );

     Unbind;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLChanerN.Create( const Format_:Integer );
begin
     inherited;

     _SampleN := 8;
end;

destructor TGLChanerN.Destroy;
begin

     inherited;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■