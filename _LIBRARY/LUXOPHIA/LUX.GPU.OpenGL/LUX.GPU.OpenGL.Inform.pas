unit LUX.GPU.OpenGL.Inform;

interface //#################################################################### ■

uses System.Generics.Collections,
     Winapi.OpenGL, Winapi.OpenGLext,
     LUX, LUX.D1, LUX.D2, LUX.D3,
     LUX.GPU.OpenGL,
     LUX.GPU.OpenGL.Atom.Buffer,
     LUX.GPU.OpenGL.Atom.Buffer.Verter,
     LUX.GPU.OpenGL.Atom.Buffer.Elemer,
     LUX.GPU.OpenGL.Atom.Buffer.Unifor,
     LUX.GPU.OpenGL.Matery,
     LUX.GPU.OpenGL.Matery.Preset;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLInform

     TGLInform = class
     private
       ///// メソッド
       procedure MakeModel;
     protected
       _BouBox  :TSingleArea3D;
       _Matery  :IGLMateryColor;
       _PosBuf  :TGLVerterS<TSingle3D>;
       _EleBuf  :TGLElemerLine32;
       _Visible :Boolean;
       ///// アクセス
       function GetBouBox :TSingleArea3D; virtual;
       procedure SetBouBox( const BouBox_:TSingleArea3D ); virtual;
       ///// メソッド
       procedure BeginDraw; virtual;
       procedure DrawMain; virtual;
       procedure EndDraw; virtual;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property BouBox  :TSingleArea3D  read GetBouBox  write SetBouBox ;
       property Matery  :IGLMateryColor read   _Matery                  ;
       property Visible :Boolean        read   _Visible write   _Visible;
       ///// メソッド
       procedure Draw;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLInform

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLInform.MakeModel;
begin
     with _BouBox do
     begin
          if ( Min.X < Max.X ) and ( Min.Y < Max.Y ) and ( Min.Z < Max.Z ) then
          begin
               _PosBuf[ 0 ] := TSingle3D.Create( Min.X, Min.Y, Min.Z );
               _PosBuf[ 1 ] := TSingle3D.Create( Max.X, Min.Y, Min.Z );
               _PosBuf[ 2 ] := TSingle3D.Create( Min.X, Max.Y, Min.Z );
               _PosBuf[ 3 ] := TSingle3D.Create( Max.X, Max.Y, Min.Z );
               _PosBuf[ 4 ] := TSingle3D.Create( Min.X, Min.Y, Max.Z );
               _PosBuf[ 5 ] := TSingle3D.Create( Max.X, Min.Y, Max.Z );
               _PosBuf[ 6 ] := TSingle3D.Create( Min.X, Max.Y, Max.Z );
               _PosBuf[ 7 ] := TSingle3D.Create( Max.X, Max.Y, Max.Z );
          end;
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLInform.GetBouBox :TSingleArea3D;
begin
     Result := _BouBox;
end;

procedure TGLInform.SetBouBox( const BouBox_:TSingleArea3D );
begin
     _BouBox := BouBox_;  MakeModel;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLInform.BeginDraw;
begin
     _Matery.Use;

     glLineWidth( 1 );

     _PosBuf.Use( 0{BinP} );
end;

procedure TGLInform.DrawMain;
begin
     _EleBuf.Draw;
end;

procedure TGLInform.EndDraw;
begin
     _PosBuf.Unuse( 0{BinP} );

     _Matery.Unuse;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLInform.Create;
begin
     inherited;

     _Matery := TGLMateryColor.Create;

     _PosBuf := TGLVerterS<TSingle3D>.Create( GL_STATIC_DRAW );
     _EleBuf := TGLElemerLine32      .Create( GL_STATIC_DRAW );

     _PosBuf.Count :=  8;
     _EleBuf.Count := 12;

     _EleBuf[ 00 ] := TCardinal2D.Create( 0, 1 );
     _EleBuf[ 01 ] := TCardinal2D.Create( 0, 2 );
     _EleBuf[ 02 ] := TCardinal2D.Create( 0, 4 );

     _EleBuf[ 03 ] := TCardinal2D.Create( 1, 3 );
     _EleBuf[ 04 ] := TCardinal2D.Create( 2, 6 );
     _EleBuf[ 05 ] := TCardinal2D.Create( 4, 5 );

     _EleBuf[ 06 ] := TCardinal2D.Create( 7, 6 );
     _EleBuf[ 07 ] := TCardinal2D.Create( 7, 5 );
     _EleBuf[ 08 ] := TCardinal2D.Create( 7, 3 );

     _EleBuf[ 09 ] := TCardinal2D.Create( 6, 4 );
     _EleBuf[ 10 ] := TCardinal2D.Create( 5, 1 );
     _EleBuf[ 11 ] := TCardinal2D.Create( 3, 2 );

     _Visible := True;

     MakeModel;
end;

destructor TGLInform.Destroy;
begin
     _PosBuf.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLInform.Draw;
begin
     if _Visible then
     begin
          BeginDraw;

            DrawMain;

          EndDraw;
     end;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
