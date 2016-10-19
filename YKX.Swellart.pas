unit YKX.Swellart;

interface //#################################################################### ■

uses System.Types, System.Classes, System.Math.Vectors,
     FMX.Types3D, FMX.Controls3D, FMX.MaterialSources,
     LUX, LUX.D2, LUX.D3, LUX.Brep.Face.TriFlip.D2.Triangulation;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     TSwelPoin  = class;
     TSwelVert  = class;
     TSwelFace  = class;
     TSwelModel = class;
     TSwelShape = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSwelPoin  //格子点のクラス

     TSwelPoin = class( TTriGenPoin )
     private
     protected
     public
       constructor Create; override;
       destructor Destroy; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSwelVert  //三角点のクラス

     TSwelVert = class
     private
       _Face :TSwelFace;
       _Tex  :TSingle2D;
     public
       constructor Create( const Face_:TSwelFace );
       destructor Destroy; override;
       ///// プロパティ
       property Face :TSwelFace read   _Face write _Face;  //帰属する三角面
       property Tex  :TSingle2D read   _Tex  write _Tex ;  //テクスチャ座標
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSwelFace  //三角面のクラス

     TSwelFace = class( TTriGenFace )
     private
     protected
       _Vert :array [ 1..3 ] of TSwelVert;
       ///// アクセス
       function GetPoin( const I_:Byte ) :TSwelPoin; reintroduce;
       procedure SetPoin( const I_:Byte; const Poin_:TSwelPoin ); reintroduce;
       function GetFace( const I_:Byte ) :TSwelFace; reintroduce;
       procedure SetFace( const I_:Byte; const Face_:TSwelFace ); reintroduce;
       function GetVert( const I_:Byte ) :TSwelVert;
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       property Poin[ const I_:Byte ] :TSwelPoin read GetPoin     write SetPoin    ;  //格子点
       property Face[ const I_:Byte ] :TSwelFace read GetFace     write SetFace    ;  //隣接する三角面
       property Vert[ const I_:Byte ] :TSwelVert read GetVert                      ;  //三角点
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSwelModel  //メッシュのクラス

     TSwelModel = class( TTriGenModel<TSwelPoin,TSwelFace> )
     private
     protected
       ///// アクセス
       function GetChild( const I_:Integer ) :TSwelFace; reintroduce;
       procedure SetChild( const I_:Integer; const Child_:TSwelFace ); reintroduce;
     public
       ///// プロパティ
       property Childs[ const I_:Integer ] :TSwelFace read GetChild write SetChild;  //三角面
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSwelShape  //ポリゴンのクラス

     TSwelShape = class( TControl3D )
     private
     protected
       _Geometry :TMeshData;
       _Material :TMaterialSource;
       _Model    :TSwelModel;
       ///// アクセス
       procedure SetModel( const Model_:TSwelModel );
       ///// メソッド
       procedure Render; override;
     public
       constructor Create( Owner_:TComponent ); override;
       destructor Destroy; override;
       ///// プロパティ
       property Material :TMaterialSource read _Material write   _Material;  //シェーダ
       property Model    :TSwelModel      read _Model    write SetModel   ;  //メッシュ
       ///// メソッド
       procedure MakeGeometry;    //三角面の再構築
       procedure UpdateGeometry;  //三角点の更新
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.SysUtils, System.RTLConsts;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSwelPoin

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TSwelPoin.Create;
begin
     inherited;

end;

destructor TSwelPoin.Destroy;
begin

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSwelVert

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TSwelVert.Create( const Face_:TSwelFace );
begin
     inherited Create;

     _Face := Face_;
     _Tex  := TSingle2D.Create( 0, 0 );
end;

destructor TSwelVert.Destroy;
begin

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSwelFace

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TSwelFace.GetPoin( const I_:Byte ) :TSwelPoin;
begin
     Result := TSwelPoin( inherited Poin[ I_ ] );
end;

procedure TSwelFace.SetPoin( const I_:Byte; const Poin_:TSwelPoin );
begin
     inherited Poin[ I_ ] := Poin_;
end;

function TSwelFace.GetFace( const I_:Byte ) :TSwelFace;
begin
     Result := TSwelFace( inherited Face[ I_ ] );
end;

procedure TSwelFace.SetFace( const I_:Byte; const Face_:TSwelFace );
begin
     inherited Face[ I_ ] := Face_;
end;

function TSwelFace.GetVert( const I_:Byte ) :TSwelVert;
begin
     Result := _Vert[ I_ ];
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TSwelFace.Create;
begin
     inherited;

     _Vert[ 1 ] := TSwelVert.Create( Self );
     _Vert[ 2 ] := TSwelVert.Create( Self );
     _Vert[ 3 ] := TSwelVert.Create( Self );

     with _Vert[ 1 ] do
     begin
          Tex := TSingle2D.Create( -1, -1 );
     end;

     with _Vert[ 2 ] do
     begin
          Tex := TSingle2D.Create( +1, -1 );
     end;

     with _Vert[ 3 ] do
     begin
          Tex := TSingle2D.Create( -1, +1 );
     end;
end;

destructor TSwelFace.Destroy;
begin
     _Vert[ 1 ].Free;
     _Vert[ 2 ].Free;
     _Vert[ 3 ].Free;

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSwelModel

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TSwelModel.GetChild( const I_:Integer ) :TSwelFace;
begin
     Result := TSwelFace( inherited Childs[ I_ ] );
end;

procedure TSwelModel.SetChild( const I_:Integer; const Child_:TSwelFace );
begin
     inherited Childs[ I_ ] := Child_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSwelShape

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

procedure TSwelShape.SetModel( const Model_:TSwelModel );
begin
     _Model := Model_;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TSwelShape.Render;
begin
     Context.SetMatrix( AbsoluteMatrix );

     _Geometry.Render( Context, TMaterialSource.ValidMaterial(_Material), AbsoluteOpacity );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TSwelShape.Create( Owner_:TComponent );
begin
     inherited;

     _Geometry := TMeshData.Create;
end;

destructor TSwelShape.Destroy;
begin
     _Geometry.Free;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TSwelShape.MakeGeometry;
var
   N, K, I :Integer;
begin
     with _Geometry do
     begin
          VertexBuffer.Length := 3{Poin} * _Model.ChildsN{Face};

          with IndexBuffer do
          begin
               Length := 3{Poin} * _Model.ChildsN{Face};

               I := 0;
               for N := 0 to _Model.ChildsN-1 do
               begin
                    for K := 1 to 3 do
                    begin
                         Indices[ I ] := I;  Inc( I );
                    end;
               end;
          end;
     end;

     UpdateGeometry;
end;

procedure TSwelShape.UpdateGeometry;
var
   Tc :TPointF;
   N, I, K :Integer;
begin
     Tc := TPointF.Create( 0.5, 0.5 );

     with _Geometry.VertexBuffer do
     begin
          I := 0;
          for N := 0 to _Model.ChildsN-1 do
          begin
               with _Model.Childs[ N ] do
               begin
                    for K := 1 to 3 do
                    begin
                         Vertices [ I ] := TSingle3D( Poin[ K ].Pos );
                         TexCoord0[ I ] := Tc + Vert[ K ].Tex / 2;

                         Inc( I );
                    end;
               end;
          end;
     end;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■