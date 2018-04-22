unit LUX.GPU.OpenGL.Inform;

interface //#################################################################### ■

uses System.Generics.Collections,
     Winapi.OpenGL, Winapi.OpenGLext,
     LUX, LUX.D1, LUX.D2, LUX.D3,
     LUX.GPU.OpenGL,
     LUX.GPU.OpenGL.Atom.Buffer,
     LUX.GPU.OpenGL.Atom.Buffer.VerBuf,
     LUX.GPU.OpenGL.Atom.Buffer.EleBuf,
     LUX.GPU.OpenGL.Atom.Buffer.UniBuf,
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
       _PosBuf  :TGLVerBufS<TSingle3D>;
       _EleBuf  :TGLEleBufLine32;
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
               with _PosBuf.Map( GL_WRITE_ONLY ) do
               begin
                    Items[ 0 ] := TSingle3D.Create( Min.X, Min.Y, Min.Z );
                    Items[ 1 ] := TSingle3D.Create( Max.X, Min.Y, Min.Z );
                    Items[ 2 ] := TSingle3D.Create( Min.X, Max.Y, Min.Z );
                    Items[ 3 ] := TSingle3D.Create( Max.X, Max.Y, Min.Z );
                    Items[ 4 ] := TSingle3D.Create( Min.X, Min.Y, Max.Z );
                    Items[ 5 ] := TSingle3D.Create( Max.X, Min.Y, Max.Z );
                    Items[ 6 ] := TSingle3D.Create( Min.X, Max.Y, Max.Z );
                    Items[ 7 ] := TSingle3D.Create( Max.X, Max.Y, Max.Z );

                    DisposeOf;
               end;
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

     _PosBuf := TGLVerBufS<TSingle3D>.Create( GL_STATIC_DRAW );
     _EleBuf := TGLEleBufLine32      .Create( GL_STATIC_DRAW );

     _PosBuf.Count :=  8;
     _EleBuf.Count := 12;

     with _EleBuf.Map( GL_WRITE_ONLY ) do
     begin
          Items[ 00 ] := TCardinal2D.Create( 0, 1 );
          Items[ 01 ] := TCardinal2D.Create( 0, 2 );
          Items[ 02 ] := TCardinal2D.Create( 0, 4 );

          Items[ 03 ] := TCardinal2D.Create( 1, 3 );
          Items[ 04 ] := TCardinal2D.Create( 2, 6 );
          Items[ 05 ] := TCardinal2D.Create( 4, 5 );

          Items[ 06 ] := TCardinal2D.Create( 7, 6 );
          Items[ 07 ] := TCardinal2D.Create( 7, 5 );
          Items[ 08 ] := TCardinal2D.Create( 7, 3 );

          Items[ 09 ] := TCardinal2D.Create( 6, 4 );
          Items[ 10 ] := TCardinal2D.Create( 5, 1 );
          Items[ 11 ] := TCardinal2D.Create( 3, 2 );

          DisposeOf;
     end;

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
