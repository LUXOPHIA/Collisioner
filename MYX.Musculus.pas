unit MYX.Musculus;

interface //#################################################################### ■

uses System.Types, System.Classes, System.Math.Vectors,
     FMX.Types3D, FMX.Controls3D, FMX.MaterialSources,
     LUX, LUX.D2, LUX.D3, LUX.Brep.Face.TriFlip.D2.Triangulation;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     TMuscPoin  = class;
     TMuscVert  = class;
     TMuscFace  = class;
     TMuscModel = class;
     TMuscShape = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TMuscPoin  //筋肉格子点のクラス

     TMuscPoin = class( TTriGenPoin )
     private
     protected
       _Force :TSingle2D;
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       property Force :TSingle2D read _Force write _Force;  //筋肉に引っ張られる力
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TMuscVert  //筋肉三角点のクラス

     TMuscVert = class
     private
       _Face :TMuscFace;
       _Tex0 :TSingle2D;
       ///// アクセス
       function GetTex :TSingle2D;
     public
       constructor Create( const Face_:TMuscFace );
       destructor Destroy; override;
       ///// プロパティ
       property Face :TMuscFace read   _Face write _Face;  //帰属する筋肉三角形
       property Tex0 :TSingle2D read   _Tex0 write _Tex0;  //理想の座標
       property Tex  :TSingle2D read GetTex             ;  //収縮した際の理想の座標
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TMuscFace  //筋肉三角面のクラス

     TMuscFace = class( TTriGenFace )
     private
     protected
       _Vert     :array [ 1..3 ] of TMuscVert;
       _Contract :Single;
       ///// アクセス
       function GetPoin( const I_:Byte ) :TMuscPoin; reintroduce;
       procedure SetPoin( const I_:Byte; const Poin_:TMuscPoin ); reintroduce;
       function GetFace( const I_:Byte ) :TMuscFace; reintroduce;
       procedure SetFace( const I_:Byte; const Face_:TMuscFace ); reintroduce;
       function GetVert( const I_:Byte ) :TMuscVert;
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       property Poin[ const I_:Byte ] :TMuscPoin read GetPoin     write SetPoin    ;  //筋肉格子点
       property Face[ const I_:Byte ] :TMuscFace read GetFace     write SetFace    ;  //隣接する筋肉三角面
       property Vert[ const I_:Byte ] :TMuscVert read GetVert                      ;  //筋肉三角点
       property Contract              :Single    read   _Contract write   _Contract;  //筋肉収縮率
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TMuscModel  //筋肉メッシュのクラス

     TMuscModel = class( TTriGenModel<TMuscPoin,TMuscFace> )
     private
     protected
       ///// アクセス
       function GetChild( const I_:Integer ) :TMuscFace; reintroduce;
       procedure SetChild( const I_:Integer; const Child_:TMuscFace ); reintroduce;
     public
       ///// プロパティ
       property Childs[ const I_:Integer ] :TMuscFace read GetChild write SetChild;  //筋肉三角面
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TMuscShape  //筋肉ポリゴンのクラス

     TMuscShape = class( TControl3D )
     private
     protected
       _Geometry :TMeshData;
       _Material :TMaterialSource;
       _Model    :TMuscModel;
       ///// アクセス
       procedure SetModel( const Model_:TMuscModel );
       ///// メソッド
       procedure Render; override;
     public
       constructor Create( Owner_:TComponent ); override;
       destructor Destroy; override;
       ///// プロパティ
       property Material :TMaterialSource read _Material write   _Material;  //シェーダ
       property Model    :TMuscModel      read _Model    write SetModel   ;  //筋肉メッシュ
       ///// メソッド
       procedure MakeGeometry;    //メッシュの再構築
       procedure UpdateGeometry;  //メッシュ座標の更新
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.SysUtils, System.RTLConsts;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TMuscPoin

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TMuscPoin.Create;
begin
     inherited;

     _Force := TSingle2D.Create( 0, 0 );
end;

destructor TMuscPoin.Destroy;
begin

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TMuscVert

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TMuscVert.GetTex :TSingle2D;
begin
     Result.X := _Tex0.X * _Face.Contract;
     Result.Y := _Tex0.Y / _Face.Contract;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TMuscVert.Create( const Face_:TMuscFace );
begin
     inherited Create;

     _Face := Face_;
     _Tex0 := TSingle2D.Create( 0, 0 );
end;

destructor TMuscVert.Destroy;
begin

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TMuscFace

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TMuscFace.GetPoin( const I_:Byte ) :TMuscPoin;
begin
     Result := TMuscPoin( inherited Poin[ I_ ] );
end;

procedure TMuscFace.SetPoin( const I_:Byte; const Poin_:TMuscPoin );
begin
     inherited Poin[ I_ ] := Poin_;
end;

function TMuscFace.GetFace( const I_:Byte ) :TMuscFace;
begin
     Result := TMuscFace( inherited Face[ I_ ] );
end;

procedure TMuscFace.SetFace( const I_:Byte; const Face_:TMuscFace );
begin
     inherited Face[ I_ ] := Face_;
end;

function TMuscFace.GetVert( const I_:Byte ) :TMuscVert;
begin
     Result := _Vert[ I_ ];
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TMuscFace.Create;
begin
     inherited;

     _Vert[ 1 ] := TMuscVert.Create( Self );
     _Vert[ 2 ] := TMuscVert.Create( Self );
     _Vert[ 3 ] := TMuscVert.Create( Self );

     _Contract := 1;
end;

destructor TMuscFace.Destroy;
begin
     _Vert[ 1 ].Free;
     _Vert[ 2 ].Free;
     _Vert[ 3 ].Free;

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TMuscModel

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TMuscModel.GetChild( const I_:Integer ) :TMuscFace;
begin
     Result := TMuscFace( inherited Childs[ I_ ] );
end;

procedure TMuscModel.SetChild( const I_:Integer; const Child_:TMuscFace );
begin
     inherited Childs[ I_ ] := Child_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TMuscShape

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

procedure TMuscShape.SetModel( const Model_:TMuscModel );
begin
     _Model := Model_;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TMuscShape.Render;
begin
     Context.SetMatrix( AbsoluteMatrix );

     _Geometry.Render( Context, TMaterialSource.ValidMaterial(_Material), AbsoluteOpacity );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TMuscShape.Create( Owner_:TComponent );
begin
     inherited;

     _Geometry := TMeshData.Create;
end;

destructor TMuscShape.Destroy;
begin
     _Geometry.Free;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TMuscShape.MakeGeometry;
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

procedure TMuscShape.UpdateGeometry;
var
   Tc :TPointF;
   N, I, K :Integer;
   Pc :TSingle2D;
begin
     Tc := TPointF.Create( 0.5, 0.5 );

     with _Geometry.VertexBuffer do
     begin
          I := 0;
          for N := 0 to _Model.ChildsN-1 do
          begin
               with _Model.Childs[ N ] do
               begin
                    Pc := 0.1 * ( Poin[ 1 ].Pos
                                + Poin[ 2 ].Pos
                                + Poin[ 3 ].Pos ) / 3;

                    for K := 1 to 3 do
                    begin
                         Vertices [ I ] := TSingle3D( 0.9 * Poin[ K ].Pos + Pc );
                         TexCoord0[ I ] := Tc + Vert[ K ].Tex0 / ( 2 * _Model.Radius );

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