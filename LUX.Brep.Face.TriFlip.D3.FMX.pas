unit LUX.Brep.Face.TriFlip.D3.FMX;

interface //#################################################################### ■

uses System.Types, System.Classes, System.Math.Vectors,
     FMX.Types3D, FMX.Controls3D, FMX.MaterialSources,
     LUX, LUX.Brep.Face.TriFlip.D3;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTriFaceObject3D

     TTriFaceObject3D = class( TControl3D )
     private
       ///// メソッド
       procedure MakeGeometry;
     protected
       _Geometry :TMeshData;
       _Material :TMaterialSource;
       _Model    :TTriFaceModel3D;
       ///// アクセス
       procedure SetModel( const Model_:TTriFaceModel3D );
       ///// メソッド
       procedure Render; override;
     public
       constructor Create( Owner_:TComponent ); override;
       destructor Destroy; override;
       ///// プロパティ
       property Material :TMaterialSource read _Material write   _Material;
       property Model    :TTriFaceModel3D read _Model    write SetModel   ;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.SysUtils, System.RTLConsts;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTriFaceObject3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

procedure TTriFaceObject3D.MakeGeometry;
var
   I, N :Integer;
begin
     with _Geometry do
     begin
          with VertexBuffer do
          begin
               Length := _Model.PoinModel.ChildsN;

               for I := 0 to _Model.PoinModel.ChildsN-1 do
               begin
                    with TTriPoin3D( _Model.PoinModel.Childs[ I ] ) do
                    begin
                         Vertices [ I ] := Pos;
                         Normals  [ I ] := Nor;
                         TexCoord0[ I ] := TPointF.Create( Tex.X, Tex.Y );
                    end;
               end;
          end;

          with IndexBuffer do
          begin
               Length := 3{Poin} * _Model.ChildsN;

               I := 0;
               for N := 0 to _Model.ChildsN-1 do
               begin
                    with _Model.Childs[ N ] do
                    begin
                         Indices[ I ] := Poin[ 3 ].Order;  Inc( I );
                         Indices[ I ] := Poin[ 2 ].Order;  Inc( I );
                         Indices[ I ] := Poin[ 1 ].Order;  Inc( I );
                    end;
               end;
          end;
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

procedure TTriFaceObject3D.SetModel( const Model_:TTriFaceModel3D );
begin
     _Model := Model_;  MakeGeometry;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TTriFaceObject3D.Render;
begin
     Context.SetMatrix( AbsoluteMatrix );

     _Geometry.Render( Context, TMaterialSource.ValidMaterial(_Material), AbsoluteOpacity );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TTriFaceObject3D.Create( Owner_:TComponent );
begin
     inherited;

     _Geometry := TMeshData.Create;
end;

destructor TTriFaceObject3D.Destroy;
begin
     _Geometry.Free;

     inherited;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
