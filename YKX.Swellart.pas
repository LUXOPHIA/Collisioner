unit YKX.Swellart;

interface //#################################################################### ■

uses System.Types, System.Classes, System.Math.Vectors, System.Threading,
     FMX.Types3D, FMX.Controls3D, FMX.MaterialSources,
     LUX, LUX.D2, LUX.D3, LUX.Brep.Face.TriFlip.D2.Triangulation;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     TDougPoin  = class;
     TDougFace  = class;
     TDougModel = class;
     TDougShape = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDougEdge

     TDougEdge = record
     private
       function GetPoin0 :TDougPoin;
       function GetPoin1 :TDougPoin;
       function GetEdge :TSingle2D;
       function GetNorv :TSingle2D;
     public
       Face :TDougFace;
       Vert :Byte;
       ///// プロパティ
       property Poin0 :TDougPoin read GetPoin0;
       property Poin1 :TDougPoin read GetPoin1;
       property Edge  :TSingle2D read GetEdge ;
       property Norv  :TSingle2D read GetNorv ;
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDougPoin  //格子点のクラス

     TDougPoin = class( TTriGenPoin )
     private
     protected
       _Pos0  :TSingle2D;
       _Tex   :TPointF;
       _Force :TSingle2D;
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       property Pos0  :TSingle2D read _Pos0  write _Pos0 ;  //初期の座標
       property Tex   :TPointF   read _Tex   write _Tex  ;  //テクスチャ座標
       property Force :TSingle2D read _Force write _Force;  //力
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDougFace  //三角面のクラス

     TDougFace = class( TTriGenFace )
     private
     protected
       ///// アクセス
       function GetPoin( const I_:Byte ) :TDougPoin; reintroduce;
       procedure SetPoin( const I_:Byte; const Poin_:TDougPoin ); reintroduce;
       function GetFace( const I_:Byte ) :TDougFace; reintroduce;
       procedure SetFace( const I_:Byte; const Face_:TDougFace ); reintroduce;
       function GerBarycenter0 :TSingle2D;
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       property Poin[ const I_:Byte ] :TDougPoin read GetPoin        write SetPoin;  //格子点
       property Face[ const I_:Byte ] :TDougFace read GetFace        write SetFace;  //隣接する三角面
       property Barycenter0           :TSingle2D read GerBarycenter0              ;  //初期の重心
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDougModel  //メッシュのクラス

     TDougModel = class( TTriGenModel<TDougPoin,TDougFace> )
     private
     protected
       ///// アクセス
       function GetChild( const I_:Integer ) :TDougFace; reintroduce;
       procedure SetChild( const I_:Integer; const Child_:TDougFace ); reintroduce;
     public
       ///// プロパティ
       property Childs[ const I_:Integer ] :TDougFace read GetChild write SetChild;  //三角面
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDougShape  //ポリゴンのクラス

     TDougShape = class( TControl3D )
     private
     protected
       _Geometry :TMeshData;
       _Material :TMaterialSource;
       _Model    :TDougModel;
       ///// アクセス
       procedure SetModel( const Model_:TDougModel );
       ///// メソッド
       procedure Render; override;
     public
       constructor Create( Owner_:TComponent ); override;
       destructor Destroy; override;
       ///// プロパティ
       property Material :TMaterialSource read _Material write   _Material;  //シェーダ
       property Model    :TDougModel      read _Model    write SetModel   ;  //メッシュ
       ///// メソッド
       procedure MakeGeometry;    //三角面の再構築
       procedure UpdateGeometry;  //三角点の更新
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

    _ThreadPool_ :TThreadPool;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.SysUtils, System.RTLConsts,
     LUX.Brep.Face.TriFlip;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDougEdge

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

function TDougEdge.GetPoin0 :TDougPoin;
begin
     Result := Face.Poin[ _Inc_[ Vert ] ];
end;

function TDougEdge.GetPoin1 :TDougPoin;
begin
     Result := Face.Poin[ _Dec_[ Vert ] ];
end;

function TDougEdge.GetEdge :TSingle2D;
begin
     Result := Face.Edge[ Vert ];
end;

function TDougEdge.GetNorv :TSingle2D;
begin
     Result := Face.Norv[ Vert ];
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDougPoin

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TDougPoin.Create;
begin
     inherited;

     _Tex := TPointF.Create( 0, 0 );
end;

destructor TDougPoin.Destroy;
begin

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDougFace

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TDougFace.GetPoin( const I_:Byte ) :TDougPoin;
begin
     Result := TDougPoin( inherited Poin[ I_ ] );
end;

procedure TDougFace.SetPoin( const I_:Byte; const Poin_:TDougPoin );
begin
     inherited Poin[ I_ ] := Poin_;
end;

function TDougFace.GetFace( const I_:Byte ) :TDougFace;
begin
     Result := TDougFace( inherited Face[ I_ ] );
end;

procedure TDougFace.SetFace( const I_:Byte; const Face_:TDougFace );
begin
     inherited Face[ I_ ] := Face_;
end;

function TDougFace.GerBarycenter0 :TSingle2D;
begin
     Result := Ave( Poin[ 1 ].Pos0, Poin[ 2 ].Pos0, Poin[ 3 ].Pos0 );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TDougFace.Create;
begin
     inherited;

end;

destructor TDougFace.Destroy;
begin

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDougModel

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TDougModel.GetChild( const I_:Integer ) :TDougFace;
begin
     Result := TDougFace( inherited Childs[ I_ ] );
end;

procedure TDougModel.SetChild( const I_:Integer; const Child_:TDougFace );
begin
     inherited Childs[ I_ ] := Child_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDougShape

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

procedure TDougShape.SetModel( const Model_:TDougModel );
begin
     _Model := Model_;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TDougShape.Render;
begin
     Context.SetMatrix( AbsoluteMatrix );

     _Geometry.Render( Context, TMaterialSource.ValidMaterial(_Material), AbsoluteOpacity );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TDougShape.Create( Owner_:TComponent );
begin
     inherited;

     _Geometry := TMeshData.Create;
end;

destructor TDougShape.Destroy;
begin
     _Geometry.Free;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TDougShape.MakeGeometry;
var
   I, J, K :Integer;
begin
     with _Geometry do
     begin
          VertexBuffer.Length := _Model.PoinModel.ChildsN{Poin};

          with IndexBuffer do
          begin
               Length := 3{Poin} * _Model.ChildsN{Face};

               J := 0;
               for I := 0 to _Model.ChildsN-1 do
               begin
                    with _Model.Childs[ I ] do
                    begin
                         for K := 1 to 3 do
                         begin
                              Indices[ J ] := Poin[ K ].Order;

                              Inc( J );
                         end;
                    end;
               end;
          end;
     end;

     UpdateGeometry;
end;

procedure TDougShape.UpdateGeometry;
var
   I, J :Integer;
begin
     with _Geometry.VertexBuffer do
     begin
          J := 0;
          for I := 0 to _Model.PoinModel.ChildsN-1 do
          begin
               with _Model.PoinModel.Childs[ I ] do
               begin
                    Vertices [ J ] := TSingle3D( Pos );
                    TexCoord0[ J ] :=            Tex  ;

                    Inc( J );
               end;
          end;
     end;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

     _ThreadPool_ := TThreadPool.Create;

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

     _ThreadPool_.Free;

end. //######################################################################### ■