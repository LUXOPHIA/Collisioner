unit Main;

interface //#################################################################### ■

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  System.Math.Vectors, System.Threading,
  FMX.Objects, FMX.StdCtrls, FMX.Controls.Presentation, FMX.TabControl,
  FMX.Viewport3D, FMX.MaterialSources, FMX.Controls3D, FMX.Objects3D,
  LUX, LUX.D2, LUX.Matrix.L2, LUX.Geometry.D2,
  YKX.Swellart;

type
  TForm1 = class(TForm)
    TabControl1: TTabControl;
      TabItem1: TTabItem;
        Viewport3D1: TViewport3D;
        Camera1: TCamera;
        Grid3D1: TGrid3D;
        TextureMaterialSource1: TTextureMaterialSource;
      TabItem2: TTabItem;
        Image1: TImage;
    Panel1: TPanel;
      Button1: TButton;
      GroupBox1: TGroupBox;
        Timer1: TTimer;
        Button2: TButton;
        Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Viewport3D1Resize(Sender: TObject);
    procedure Viewport3D1Paint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
    procedure Viewport3D1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure Viewport3D1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
    procedure Viewport3D1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure Image1Paint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { private 宣言 }
    _MouseState :TShiftState;  //マウスのボタン状態
    _ViewS      :Single;       //画面座標と内部座標の比率
    _ViewC      :TPointF;      //ビューポートの中心座標
    ///// メソッド
    function ScrToPos( const S_:TPointF ) :TSingle2D;                                                 //画面座標を内部座標へ
    function PosToScr( const P_:TSingle2D ) :TPointF;                                                 //画面座標を内部座標へ
    procedure DrawCurve( const Canvas_   :TCanvas;
                         const Thickness_:Single;
                         const Color_    :TAlphaColor;
                         const Curve_    :TArray<TSingle2D> );                                        //カーブを描画
    procedure DrawPoins( const Canvas_:TCanvas; const Radius_:Single; const Color_:TAlphaColor );     //すべての格子点を描画
    procedure DrawFaces( const Canvas_:TCanvas; const Thickness_:Single; const Color_:TAlphaColor );  //すべての三角面を描画
  public
    { public 宣言 }
    _DougCurve :TArray<TSingle2D>;  //手描カーブの配列
    _MoldCurve :TArray<TSingle2D>;  //手描カーブの配列
    _DougModel :TDougModel;         //メッシュ
    _DougShape :TDougShape;         //ポリゴン
  end;

var
  Form1: TForm1;

implementation //############################################################### ■

{$R *.fmx}

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

function TForm1.ScrToPos( const S_:TPointF ) :TSingle2D;  //画面座標を内部座標へ
begin
     Result := ( S_ - _ViewC ) * _ViewS;
end;

function TForm1.PosToScr( const P_:TSingle2D ) :TPointF;  //内部座標を画面座標へ
begin
     Result := TPointF( P_ ) / _ViewS + _ViewC;
end;

//------------------------------------------------------------------------------

procedure TForm1.DrawCurve( const Canvas_   :TCanvas;
                            const Thickness_:Single;
                            const Color_    :TAlphaColor;
                            const Curve_    :TArray<TSingle2D> );  //カーブを描画
var
   N, I :Integer;
   Vs :TPolygon;
begin
     if Assigned( Curve_ ) then  //カーブ配列が空でない場合
     begin
          N := Length( Curve_ );  //カーブ配列の要素数

          SetLength( Vs, N );  //多角形配列の要素数を設定

          for I := 0 to N-1 do Vs[ I ] := PosToScr( Curve_[ I ] );  //カーブの座標を画面座標へ変換

          with Canvas_ do
          begin
               with Stroke do  //ペン先の設定
               begin
                    Kind      := TBrushKind.Solid;
                    Color     := Color_;
                    Thickness := Thickness_ / _ViewS;
                    Join      := TStrokeJoin.Round;
               end;

               DrawPolygon( Vs, 1 );  //多角形を描画
          end;
     end;
end;

//------------------------------------------------------------------------------

procedure TForm1.DrawPoins( const Canvas_:TCanvas; const Radius_:Single; const Color_:TAlphaColor );  //すべての格子点を描画
var
   R :Single;
   I :Integer;
begin
     R := Radius_ / _ViewS;  //円の半径

     with Canvas_ do
     begin
          with Fill do
          begin
               Kind  := TBrushKind.Solid;
               Color := Color_;
          end;

          for I := 0 to _DougModel.PoinModel.ChildsN-1 do  //すべての格子点を走査
          begin
               with PosToScr( _DougModel.PoinModel.Childs[ I ].Pos ) do  //格子点
               begin
                    FillEllipse( TRectF.Create( X-R, Y-R,
                                                X+R, Y+R ), 1 );  //円を描画
               end;
          end;
     end;
end;

//------------------------------------------------------------------------------

procedure TForm1.DrawFaces( const Canvas_:TCanvas; const Thickness_:Single; const Color_:TAlphaColor );  //すべての三角面を描画
var
   I :Integer;
   P1, P2, P3 :TPointF;
begin
     with Canvas_ do
     begin
          with Stroke do  //ペン先の設定
          begin
               Kind      := TBrushKind.Solid;
               Color     := Color_;
               Thickness := Thickness_ / _ViewS;
               Join      := TStrokeJoin.Round;
          end;

          for I := 0 to _DougModel.ChildsN-1 do
          begin
               with _DougModel.Childs[ I ] do
               begin
                    if Open = 0 then
                    begin
                         P1 := PosToScr( Poin[ 1 ].Pos0 );
                         P2 := PosToScr( Poin[ 2 ].Pos0 );
                         P3 := PosToScr( Poin[ 3 ].Pos0 );

                         DrawPolygon( [ P1, P2, P3 ], 0.5 );
                    end;
               end;
          end;
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

procedure TForm1.FormCreate(Sender: TObject);  //アプリを起動した場合
begin
     Image1.Bitmap.LoadFromFile( '..\..\_DATA\Dough.jpg' );  //テクスチャを読込み

     TextureMaterialSource1.Texture.Assign( Image1.Bitmap );  //テクスチャをシェーダへコピー

     _DougModel := TDougModel.Create;  //メッシュを生成

     with _DougModel do
     begin
          Radius := 2;  //三角面の最小外接円半径
     end;

     _DougShape := TDougShape.Create( Self );  //ポリゴンを生成

     with _DougShape do
     begin
          Parent   := Viewport3D1;             //ビューポートへ登録
          Model    := _DougModel;              //メッシュモデルを登録
          Material := TextureMaterialSource1;  //シェーダを登録
     end;

     Viewport3D1Resize( Sender );
end;

procedure TForm1.FormDestroy(Sender: TObject);  //アプリを終了した場合
begin
     _DougModel.Free;  //メッシュを廃棄
end;

////////////////////////////////////////////////////////////////////////////////

procedure TForm1.Viewport3D1Resize(Sender: TObject);  //ビューポートがリサイズされる場合
begin
     _ViewS := 60 / Viewport3D1.Height;                   //画面座標と内部座標の比率

     _ViewC := TPointF.Create( Viewport3D1.Width  / 2,
                               Viewport3D1.Height / 2 );  //ビューポートの中心座標
end;

procedure TForm1.Viewport3D1Paint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);  //ビューポートが描画される時
begin
     DrawCurve( Canvas, 0.4, TAlphaCOlors.Blue , _MoldCurve );  //手描カーブを描画
     DrawPoins( Canvas, 0.2, TAlphaCOlors.White             );  //すべての格子点を描画
end;

//------------------------------------------------------------------------------

procedure TForm1.Viewport3D1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);  //マウスを押した時
begin
     if Button2.Enabled then  //最適化が実行されていない場合
     begin
          _MouseState := Shift;  //マウスボタンの状態を保存

          _MoldCurve := [ ScrToPos( TPointF.Create( X, Y ) ) ];  //描き始めの座標を追加

          _DougModel.DeleteChilds;  //メッシュをクリア

          _DougShape.MakeGeometry;  //ポリゴンを再構築
     end;
end;

procedure TForm1.Viewport3D1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);  //マウスを動かした時
begin
     if ssLeft in _MouseState then  //左クリックの場合
     begin
          _MoldCurve := _MoldCurve + [ ScrToPos( TPointF.Create( X, Y ) ) ];  //移動した座標を追加

          Viewport3D1.Repaint;  //ビューを再描画
     end;
end;

procedure TForm1.Viewport3D1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);  //マウスを離した時
begin
     if ssLeft in _MouseState then
     begin
          _MoldCurve := _MoldCurve + [ ScrToPos( TPointF.Create( X, Y ) ) ];  //描き終わりの座標を追加

          if Length( _MoldCurve ) >= 3 then
          begin
               {型輪郭の処理}
          end
          else _MoldCurve := [];

          Viewport3D1.Repaint;  //ビューを再描画

          _MouseState := [];
     end;
end;

//------------------------------------------------------------------------------

procedure TForm1.Image1Paint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
begin
     DrawCurve( Canvas, 0.4, TAlphaCOlors.Red  ,_DougCurve );  //手描カーブを描画
     DrawFaces( Canvas, 0.1, TAlphaCOlors.White            );  //すべての三角面を描画
end;

//------------------------------------------------------------------------------

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     if Button2.Enabled then  //最適化が実行されていない場合
     begin
          _MouseState := Shift;  //マウスボタンの状態を保存

          _DougCurve := [ ScrToPos( TPointF.Create( X, Y ) ) ];  //描き始めの座標を追加

          _DougModel.DeleteChilds;  //メッシュをクリア

          _DougShape.MakeGeometry;  //ポリゴンを再構築
     end;
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
begin
     if ssLeft in _MouseState then  //左クリックの場合
     begin
          _DougCurve := _DougCurve + [ ScrToPos( TPointF.Create( X, Y ) ) ];  //移動した座標を追加

          Image1.Repaint;  //ビューを再描画
     end;
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     if ssLeft in _MouseState then
     begin
          _DougCurve := _DougCurve + [ ScrToPos( TPointF.Create( X, Y ) ) ];  //描き終わりの座標を追加

          if Length( _DougCurve ) >= 3 then
          begin
               with _DougModel do
               begin
                    MakeMesh( _DougCurve );  //メッシュを生成
                    FairMesh;                //不要な格子点と三角面を削除
               end;

               _DougShape.MakeGeometry;  //ポリゴンを再構築

               Button1Click( Sender );  //「初期化」ボタンを実行
          end;

          _DougCurve := [];

          Image1.Repaint;

          _MouseState := [];
     end;
end;

//------------------------------------------------------------------------------

procedure TForm1.Button1Click(Sender: TObject);  //「初期化」ボタンを押した時
var
   I :Integer;
   P, T :TPointF;
begin
     for I := 0 to _DougModel.PoinModel.ChildsN-1 do  //すべての三角面を走査
     begin
          with _DougModel.PoinModel.Childs[ I ] do  //三角面
          begin
               Pos0 := Pos;  //初期の座標を保存

               P := PosToScr( Pos0 );

               T.X := P.X / Image1.Width ;
               T.Y := P.Y / Image1.Height;

               Tex := T;
          end;
     end;

     _DougShape.UpdateGeometry;  //ポリゴンを更新

     Viewport3D1.Repaint;  //ビューを再描画
end;

//------------------------------------------------------------------------------

procedure TForm1.Timer1Timer(Sender: TObject);  //最適化の１フレーム
var
   N, I, K :Integer;
   G0, G1 :TSingle2D;
   P0, P1, P2, V0, V1 :array [1..3] of TSingle2D;
   M :TSingleM2;
begin
     for N := 1 to 10 do
     begin
          TParallel.For( 0, _DougModel.PoinModel.ChildsN-1, procedure( I:Integer )  //すべての格子点を走査(並列化)
          begin
               with _DougModel.PoinModel.Childs[ I ] do  //格子点
               begin
                    Force := TSingle2D.Create( 0, 0 );  //格子点の力を初期化
               end;
          end,
          _ThreadPool );

          for I := 0 to _DougModel.ChildsN-1 do  //すべての三角面を走査
          begin
               with _DougModel.Childs[ I ] do  //三角面
               begin
                    G0 := Barycenter0;  //初期の重心
                    G1 := Barycenter ;  //現在の重心

                    for K := 1 to 3 do
                    begin
                         P0[K] := Poin[K].Pos0;  //初期の座標
                         P1[K] := Poin[K].Pos ;  //現在の座標

                         V0[K] := P0[K] - G0;    //初期のベクトル
                         V1[K] := P1[K] - G1;    //現在のベクトル

                         V0[K] := V0[K] * 2;     //理想とする形
                    end;

                    M := ShapeMatch( V0, V1 );  //最適な回転行列

                    for K := 1 to 3 do
                    begin
                         P2[K] := M * V0[K] + G1;  //理想の座標

                         ///// 位置の制約

                         if P2[K].X < -30 then P2[K].X := -30
                                          else
                         if +30 < P2[K].X then P2[K].X := +30;

                         if P2[K].Y < -30 then P2[K].Y := -30
                                          else
                         if +30 < P2[K].Y then P2[K].Y := +30;

                         /////

                         with Poin[K] do Force := Force + ( P2[K] - P1[K] );  //力を格子点へ加算
                    end;
               end;
          end;

          TParallel.For( 0, _DougModel.PoinModel.ChildsN-1, procedure( I:Integer )  //すべての格子点を走査(並列化)
          begin
               with _DougModel.PoinModel.Childs[ I ] do  //格子点
               begin
                    Pos := Pos + 0.1 * Force;  //格子点を移動
               end;
          end,
          _ThreadPool );
     end;

     _DougShape.UpdateGeometry;  //ポリゴンの座標を更新

     Viewport3D1.Repaint;  //ピューポートを更新
end;

procedure TForm1.Button2Click(Sender: TObject);  //「実行」ボタンを押した時
begin
     Button2.Enabled := False;
     Button3.Enabled := True ;

     TabControl1.TabIndex := 0;  //タブを１ページ目に切り替え

     Timer1.Enabled := True ;  //最適化開始
end;

procedure TForm1.Button3Click(Sender: TObject);  //「停止」ボタンを押した時
begin
     Timer1.Enabled := False;  //最適化停止

     Button2.Enabled := True ;
     Button3.Enabled := False;
end;

end. //######################################################################### ■
