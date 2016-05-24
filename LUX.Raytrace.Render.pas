unit LUX.Raytrace.Render;

interface //#################################################################### ■

uses FMX.Graphics,
     LUX, LUX.D3, LUX.Map.D2, LUX.Color, LUX.Raytrace, LUX.Raytrace.Geometry, LUX.Raytrace.Material;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRender

     TRender = class
     private
       _Stop :Boolean;
     protected
       _Pixels :TBricArray2D<TSingleRGBA>;
       _Scene  :TWorld;
       _Camera :TCamera;
       ///// アクセス
     public
       constructor Create; overload;
       destructor Destroy; override;
       ///// プロパティ
       property Pixels :TBricArray2D<TSingleRGBA> read _Pixels              ;
       property Scene  :TWorld                    read _Scene  write _Scene ;
       property Camera :TCamera                   read _Camera write _Camera;
       ///// メソッド
       procedure Run;
       procedure Stop;
       procedure CopyToBitmap( const Bitmap_:TBitmap );
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRender

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRender.Create;
begin
     inherited;

     _Pixels := TBricArray2D<TSingleRGBA>.Create( 640, 480 );
end;

destructor TRender.Destroy;
begin
     _Pixels.Free;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRender.Run;
var
   X ,Y :Integer;
   R :TSingleRay3D;
   H :TRayHit;
begin
     _Stop := False;

     R.Vec := TSingle3D.Create( 0, 0, -1 );

     R.Pos.Z := 10;
     for Y := 0 to _Pixels.BricY-1 do
     begin
          R.Pos.Y := ( -3 - +3 ) * ( ( 0.5 + Y ) / _Pixels.BricY ) + +3;

          for X := 0 to _Pixels.BricX-1 do
          begin
               R.Pos.X := ( +4 - -4 ) * ( ( 0.5 + X ) / _Pixels.BricX ) + -4;

               H.Len := 100000;

               if _Scene.Raytraces( R, H ) then
               begin
                    _Pixels[ X, Y ] := TSingleRGBA.Create( ( H.Nor.X + 1 ) / 2, ( H.Nor.Y + 1 ) / 2, ( H.Nor.Z + 1 ) / 2, 1 );
               end
               else _Pixels[ X, Y ] := TSingleRGBA.Create( 0, 0, 0, 1 );
          end;
     end;
end;

procedure TRender.Stop;
begin
     _Stop := True;
end;

procedure TRender.CopyToBitmap( const Bitmap_:TBitmap );
var
   B :TBitmapData;
   X ,Y :Integer;
begin
     Bitmap_.Map( TMapAccess.Write, B );

     for Y := 0 to _Pixels.BricY-1 do
     begin
          for X := 0 to _Pixels.BricX-1 do
          begin
               B.Color[ X, Y ] := _Pixels[ X, Y ];
          end;
     end;

     Bitmap_.Unmap( B );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■