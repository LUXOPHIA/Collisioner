unit Main;

interface //#################################################################### ■

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  System.Math.Vectors,
  FMX.Objects, FMX.StdCtrls, FMX.Controls.Presentation,
  FMX.Viewport3D, FMX.MaterialSources, FMX.Controls3D, FMX.Objects3D,
  LUX, LUX.D2, LUX.Brep.Face.TriFlip.D2.Delaunay,
  MYX.Musculus;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    Viewport3D1: TViewport3D;
      Camera1: TCamera;
      Grid3D1: TGrid3D;
      TextureMaterialSource1: TTextureMaterialSource;
    Panel1: TPanel;
      Image1: TImage;
      ScrollBar1: TScrollBar;
      Button1: TButton;
      GroupBox1: TGroupBox;
        Button2: TButton;
        Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Viewport3D1Paint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
    procedure Viewport3D1Resize(Sender: TObject);
    procedure Viewport3D1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure Viewport3D1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
    procedure Viewport3D1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure ScrollBar1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { private 宣言 }
    _MouseState :TShiftState;  //マウスのボタン状態
    _ViewS      :Single;       //画面座標と内部座標の比率
    _ViewC      :TPointF;      //ビューポートの中心座標
    ///// メソッド
    function ScrToPos( const S_:TPointF ) :TSingle2D;  //画面座標を内部座標へ
    function PosToScr( const P_:TSingle2D ) :TPointF;  //画面座標を内部座標へ
    procedure DrawCurve( const Canvas_:TCanvas; const Thickness_:Single; const Color_:TAlphaColor );  //手描カーブを描画
    procedure DrawPoins( const Canvas_:TCanvas; const Radius_:Single; const Color_:TAlphaColor );  //すべての筋肉格子点を描画
  public
    { public 宣言 }
    _MuscCurve :TArray<TSingle2D>;  //手描きカーブの配列
    _MuscModel :TMuscModel;         //筋肉メッシュ
    _MuscShape :TMuscShape;         //筋肉ポリゴン
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

procedure TForm1.DrawCurve( const Canvas_:TCanvas; const Thickness_:Single; const Color_:TAlphaColor );  //手描カーブを描画
var
   N, I :Integer;
   Vs :TPolygon;
begin
     if Assigned( _MuscCurve ) then  //手描カーブ配列が空でない場合
     begin
          N := Length( _MuscCurve );  //手描カーブ配列の長さ

          SetLength( Vs, N );  //多角形配列の要素数を設定

          for I := 0 to N-1 do Vs[ I ] := PosToScr( _MuscCurve[ I ] );  //手描カーブの座標を画面座標へ変換

          with Canvas_ do
          begin
               with Stroke do
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

procedure TForm1.DrawPoins( const Canvas_:TCanvas; const Radius_:Single; const Color_:TAlphaColor );  //すべての筋肉格子点を描画
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

          for I := 0 to _MuscModel.PoinModel.ChildsN-1 do  //すべての筋肉格子点を走査
          begin
               with PosToScr( _MuscModel.PoinModel.Childs[ I ].Pos ) do  //筋肉格子点
               begin
                    FillEllipse( TRectF.Create( X-R, Y-R,
                                                X+R, Y+R ), 1 );  //円を描画
               end;
          end;
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

procedure TForm1.FormCreate(Sender: TObject);  //アプリを起動した場合
begin
     Image1.Bitmap.LoadFromFile( '..\..\_DATA\Muscle.png' );  //テクスチャを読込み

     TextureMaterialSource1.Texture.Assign( Image1.Bitmap );  //テクスチャをシェーダへコピー

     _MuscModel := TMuscModel.Create;  //筋肉メッシュを生成

     with _MuscModel do
     begin
          Radius := 2;  //筋肉三角面の最小外接円半径
     end;

     _MuscShape := TMuscShape.Create( Self );  //筋肉ポリゴンを生成

     with _MuscShape do
     begin
          Parent   := Viewport3D1;             //ビューポートへ登録
          Model    := _MuscModel;              //筋肉メッシュモデルを登録
          Material := TextureMaterialSource1;  //シェーダを登録
     end;

     Viewport3D1Resize( Sender );
end;

procedure TForm1.FormDestroy(Sender: TObject);  //アプリを終了した場合
begin
     _MuscShape.Free;  //筋肉ポリゴンを廃棄
     _MuscModel.Free;  //筋肉メッシュを廃棄
end;

////////////////////////////////////////////////////////////////////////////////

procedure TForm1.Timer1Timer(Sender: TObject);
var
   I :Integer;
   Vert1, Vert2, Vert3 :TMuscVert;
   Poin1, Poin2, Poin3 :TMuscPoin;
   T1, T2, T3, P1, P2, P3, E1, E2, E3 :TSingle2D;
   L1o, L2o, L3o, L1, L2, L3 :Single;
begin
     for I := 0 to _MuscModel.ChildsN-1 do  //すべての筋肉三角面を走査
     begin
          with _MuscModel.Childs[ I ] do  //筋肉三角面
          begin
               Vert1 := Vert[ 1 ];  //理想の筋肉格子点
               Vert2 := Vert[ 2 ];
               Vert3 := Vert[ 3 ];

               Poin1 := Poin[ 1 ];  //現在の筋肉格子点
               Poin2 := Poin[ 2 ];
               Poin3 := Poin[ 3 ];

               T1 := Vert1.Tex;  //理想の座標
               T2 := Vert2.Tex;
               T3 := Vert3.Tex;

               P1 := Poin1.Pos;  //現在の座標
               P2 := Poin2.Pos;
               P3 := Poin3.Pos;

               E1 := P2.VectorTo( P3 );  //現在の辺のベクトル
               E2 := P3.VectorTo( P1 );
               E3 := P1.VectorTo( P2 );

               L1o := T2.DistanTo( T3 );  //理想の辺の長さ
               L2o := T3.DistanTo( T1 );
               L3o := T1.DistanTo( T2 );

               L1 := P2.DistanTo( P3 );  //現在の辺の長さ
               L2 := P3.DistanTo( P1 );
               L3 := P1.DistanTo( P2 );

               Poin1.Force := E3 * ( L3 - L3o ) - E2 * ( L2 - L2o );
               Poin2.Force := E1 * ( L1 - L1o ) - E3 * ( L3 - L3o );
               Poin3.Force := E2 * ( L2 - L2o ) - E1 * ( L1 - L1o );
          end;
     end;

     for I := 0 to _MuscModel.PoinModel.ChildsN-1 do  //すべての筋肉格子点を走査
     begin
          with TMuscPoin( _MuscModel.PoinModel.Childs[ I ] ) do  //筋肉格子点
          begin
               Pos := Pos + Force * 0.1;  //格子点を理想位置へ移動
          end;
     end;

     _MuscShape.UpdateGeometry;  //筋肉ポリゴンの座標を更新

     Viewport3D1.Repaint;  //ピューポートを更新
end;

//------------------------------------------------------------------------------

procedure TForm1.Viewport3D1Paint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);  //ビューポートが描画される場合
begin
     DrawCurve( Canvas, 0.4, TAlphaCOlors.Red   );  //手描カーブを描画
     DrawPoins( Canvas, 0.2, TAlphaCOlors.Black );  //筋肉格子点を描画
end;

procedure TForm1.Viewport3D1Resize(Sender: TObject);  //ビューポートがリサイズされる場合
begin
     _ViewS := 60 / Viewport3D1.Height;  //画面座標と内部座標の比率

     _ViewC := TPointF.Create( Viewport3D1.Width  / 2,
                               Viewport3D1.Height / 2 );  //ビューポートの中心座標
end;

//------------------------------------------------------------------------------

procedure TForm1.Viewport3D1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);  //マウスを押した場合
begin
     if Button2.Enabled then  //シミュレーションが実行されていない場合
     begin
          _MouseState := Shift;  //マウスボタンの状態を保存

          _MuscCurve := [ ScrToPos( TPointF.Create( X, Y ) ) ];  //描き始め座標を追加

          _MuscModel.DeleteChilds;  //筋肉メッシュをクリア

          _MuscShape.MakeGeometry;  //筋肉ポリゴンを再構築
     end;
end;

procedure TForm1.Viewport3D1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);  //マウスを動かした場合
begin
     if ssLeft in _MouseState then  //左クリックの場合
     begin
          _MuscCurve := _MuscCurve + [ ScrToPos( TPointF.Create( X, Y ) ) ];  //移動した座標を追加

          Viewport3D1.Repaint;  //ビューポートを再描画
     end;
end;

procedure TForm1.Viewport3D1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);  //マウスを離した場合
begin
     if ssLeft in _MouseState then
     begin
          _MuscCurve := _MuscCurve + [ ScrToPos( TPointF.Create( X, Y ) ) ];  //描き終わりの座標を追加

          with _MuscModel do
          begin
               MakeMesh( _MuscCurve );  //メッシュを生成
               FairMesh;                //不要な格子点と三角面を削除
          end;

          _MuscShape.MakeGeometry;  //筋肉ポリゴンを再構築

          Viewport3D1.Repaint;  //ビューポートを再描画

          _MuscCurve := [];

          _MouseState := [];
     end;
end;

//------------------------------------------------------------------------------

procedure TForm1.ScrollBar1Change(Sender: TObject);  //スクロールバーを動かした場合
var
   I :Integer;
begin
     for I := 0 to _MuscModel.ChildsN-1 do  //すべての筋肉三角面を走査
     begin
          _MuscModel.Childs[ I ].Contract := ScrollBar1.Value / 100;  //収縮率をスクロールバーの値に変更
     end;
end;

procedure TForm1.Button1Click(Sender: TObject);  //"筋繊維生成"ボタンを押した場合
var
   I :Integer;
   P1, P2, P3, C, T1, T2, T3 :TSingle2D;
begin
     for I := 0 to _MuscModel.ChildsN-1 do  //すべての筋肉三角面を走査
     begin
          with _MuscModel.Childs[ I ] do  //筋肉三角面
          begin
               P1 := Poin[ 1 ].Pos;
               P2 := Poin[ 2 ].Pos;
               P3 := Poin[ 3 ].Pos;

               C := CircumCircle.Center;  //筋肉三角面の外心

               T1 := P1 - C;
               T2 := P2 - C;
               T3 := P3 - C;

               Vert[ 1 ].Tex0 := T1;
               Vert[ 2 ].Tex0 := T2;
               Vert[ 3 ].Tex0 := T3;
          end;
     end;

     _MuscShape.UpdateGeometry;  //筋肉ポリゴンを更新

     Viewport3D1.Repaint;  //ビューポートを再描画
end;

procedure TForm1.Button2Click(Sender: TObject);  //実行ボタンを押した場合
begin
     Button2.Enabled := False;
     Button3.Enabled := True ;

     ScrollBar1Change( Sender );  //スクロールバーの値を適用

     Timer1.Enabled := True ;  //シミュレーション開始
end;

procedure TForm1.Button3Click(Sender: TObject);  //停止ボタンを押した場合
begin
     Timer1.Enabled := False;  //シミュレーション停止

     Button2.Enabled := True ;
     Button3.Enabled := False;
end;

end. //######################################################################### ■
