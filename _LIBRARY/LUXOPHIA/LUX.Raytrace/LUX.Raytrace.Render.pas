unit LUX.Raytrace.Render;

interface //#################################################################### ■

uses FMX.Graphics,
     LUX, LUX.D3, LUX.Map.D2, LUX.Color, LUX.Raytrace, LUX.Raytrace.Geometry, LUX.Raytrace.Material;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRayRender

     TRayRender = class
     private
       _Stop :Boolean;
     protected
       _Pixels :TBricArray2D<TSingleRGBA>;
       _Scene  :TRayWorld;
       _Camera :TRayCamera;
       ///// アクセス
     public
       constructor Create; overload;
       destructor Destroy; override;
       ///// プロパティ
       property Pixels :TBricArray2D<TSingleRGBA> read _Pixels              ;
       property Scene  :TRayWorld                 read _Scene  write _Scene ;
       property Camera :TRayCamera                read _Camera write _Camera;
       ///// メソッド
       procedure Run;
       procedure Stop;
       procedure CopyToBitmap( const Bitmap_:TBitmap );
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.Threading;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRayRender

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRayRender.Create;
begin
     inherited;

     _Pixels := TBricArray2D<TSingleRGBA>.Create( 640, 480 );
end;

destructor TRayRender.Destroy;
begin
     _Pixels.Free;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRayRender.Run;
begin
     _Stop := False;

     TParallel.For( 0, _Pixels.BricY-1, procedure( Y:Integer )
     var
        R :TSingleRay3D;
        X :Integer;
        H :TRayHit;
     begin
          R.Pos.Z := 10;
          R.Pos.Y := ( -3 - +3 ) * ( ( 0.5 + Y ) / _Pixels.BricY ) + +3;
          R.Vec := TSingle3D.Create( 0, 0, -1 );

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
     end );
end;

procedure TRayRender.Stop;
begin
     _Stop := True;
end;

procedure TRayRender.CopyToBitmap( const Bitmap_:TBitmap );
var
   B :TBitmapData;
begin
     Bitmap_.Map( TMapAccess.Write, B );

     TParallel.For( 0, _Pixels.BricY-1, procedure( Y:Integer )
     var
        X :Integer;
     begin
          for X := 0 to _Pixels.BricX-1 do
          begin
               B.Color[ X, Y ] := _Pixels[ X, Y ];
          end;
     end );

     Bitmap_.Unmap( B );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■