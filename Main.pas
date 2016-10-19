unit Main;

interface //#################################################################### ■

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  System.Math.Vectors,
  FMX.Objects, FMX.StdCtrls, FMX.Controls.Presentation,
  FMX.Viewport3D, FMX.MaterialSources, FMX.Controls3D, FMX.Objects3D,
  LUX, LUX.D2, LUX.Brep.Face.TriFlip.D2.Delaunay,
  YKX.Swellart;

type
  TForm1 = class(TForm)
    Viewport3D1: TViewport3D;
      Camera1: TCamera;
      Grid3D1: TGrid3D;
      TextureMaterialSource1: TTextureMaterialSource;
    Panel1: TPanel;
      Image1: TImage;
      Button1: TButton;
      GroupBox1: TGroupBox;
        Button2: TButton;
        Button3: TButton;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Viewport3D1Paint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
    procedure Viewport3D1Resize(Sender: TObject);
    procedure Viewport3D1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure Viewport3D1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
    procedure Viewport3D1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
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
    procedure DrawCurve( const Canvas_:TCanvas; const Thickness_:Single; const Color_:TAlphaColor );  //手描カーブを描画
    procedure DrawPoins( const Canvas_:TCanvas; const Radius_:Single; const Color_:TAlphaColor );     //すべての格子点を描画
    procedure DrawFaces( const Canvas_:TCanvas; const Thickness_:Single; const Color_:TAlphaColor );  //すべての三角面を描画
    procedure DrawVolos( const Canvas_:TCanvas; const Thickness_:Single; const Color_:TAlphaColor );  //ボロノイ図を描画
  public
    { public 宣言 }
    _SwelCurve :TArray<TSingle2D>;  //手描カーブの配列
    _SwelModel :TSwelModel;         //メッシュ
    _SwelShape :TSwelShape;         //ポリゴン
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
     if Assigned( _SwelCurve ) then  //手描カーブ配列が空でない場合
     begin
          N := Length( _SwelCurve );  //手描カーブ配列の要素数

          SetLength( Vs, N );  //多角形配列の要素数を設定

          for I := 0 to N-1 do Vs[ I ] := PosToScr( _SwelCurve[ I ] );  //手描カーブの座標を画面座標へ変換

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

          for I := 0 to _SwelModel.PoinModel.ChildsN-1 do  //すべての格子点を走査
          begin
               with PosToScr( _SwelModel.PoinModel.Childs[ I ].Pos ) do  //格子点
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
   Ps :TPolygon;
begin
     SetLength( Ps, 3 );

     with Canvas_ do
     begin
          with Stroke do  //ペン先の設定
          begin
               Kind      := TBrushKind.Solid;
               Color     := Color_;
               Thickness := Thickness_ / _ViewS;
               Join      := TStrokeJoin.Round;
          end;

          for I := 0 to _SwelModel.ChildsN-1 do
          begin
               with _SwelModel.Childs[ I ] do
               begin
                    if Open = 0 then
                    begin
                         Ps[ 0 ] := PosToScr( Poin[ 1 ].Pos );
                         Ps[ 1 ] := PosToScr( Poin[ 2 ].Pos );
                         Ps[ 2 ] := PosToScr( Poin[ 3 ].Pos );

                         DrawPolygon( Ps, 1 );
                    end;
               end;
          end;
     end;
end;

//------------------------------------------------------------------------------

procedure TForm1.DrawVolos( const Canvas_:TCanvas; const Thickness_:Single; const Color_:TAlphaColor );  //ボロノイ図を描画
var
   I :Integer;
   C, P1, P2, P3 :TSingle2D;
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

          for I := 0 to _SwelModel.ChildsN-1 do
          begin
               with _SwelModel.Childs[ I ] do
               begin
                    C := Circle.Center;

                    if Assigned( Face[ 1 ] ) then P1 := Ave( C, Face[ 1 ].CircumCircle.Center )
                                             else P1 := Ave( Poin[ 2 ].Pos, Poin[ 3 ].Pos );

                    if Assigned( Face[ 2 ] ) then P2 := Ave( C, Face[ 2 ].CircumCircle.Center )
                                             else P2 := Ave( Poin[ 3 ].Pos, Poin[ 1 ].Pos );

                    if Assigned( Face[ 3 ] ) then P3 := Ave( C, Face[ 3 ].CircumCircle.Center )
                                             else P3 := Ave( Poin[ 1 ].Pos, Poin[ 2 ].Pos );

                    DrawLine( PosToScr( C ), PosToScr( P1 ), 1 );
                    DrawLine( PosToScr( C ), PosToScr( P2 ), 1 );
                    DrawLine( PosToScr( C ), PosToScr( P3 ), 1 );
               end;
          end;
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

procedure TForm1.FormCreate(Sender: TObject);  //アプリを起動した場合
begin
     Image1.Bitmap.LoadFromFile( '..\..\_DATA\Texture.png' );  //テクスチャを読込み

     TextureMaterialSource1.Texture.Assign( Image1.Bitmap );  //テクスチャをシェーダへコピー

     _SwelModel := TSwelModel.Create;  //メッシュを生成

     with _SwelModel do
     begin
          Radius := 2;  //三角面の最小外接円半径
     end;

     _SwelShape := TSwelShape.Create( Self );  //ポリゴンを生成

     with _SwelShape do
     begin
          Parent   := Viewport3D1;             //ビューポートへ登録
          Model    := _SwelModel;              //メッシュモデルを登録
          Material := TextureMaterialSource1;  //シェーダを登録
     end;

     Viewport3D1Resize( Sender );
end;

procedure TForm1.FormDestroy(Sender: TObject);  //アプリを終了した場合
begin
     _SwelShape.Free;  //ポリゴンを廃棄
     _SwelModel.Free;  //メッシュを廃棄
end;

////////////////////////////////////////////////////////////////////////////////

procedure TForm1.Timer1Timer(Sender: TObject);
var
   I :Integer;
begin
     for I := 0 to _SwelModel.ChildsN-1 do  //すべての三角面を走査
     begin
          with _SwelModel.Childs[ I ] do  //三角面
          begin
               {なんらかの処理}
          end;
     end;

     for I := 0 to _SwelModel.PoinModel.ChildsN-1 do  //すべての格子点を走査
     begin
          with TSwelPoin( _SwelModel.PoinModel.Childs[ I ] ) do  //格子点
          begin
               {なんらかの処理}
          end;
     end;

     _SwelShape.UpdateGeometry;  //ポリゴンを更新

     Viewport3D1.Repaint;  //ピューを更新
end;

//------------------------------------------------------------------------------

procedure TForm1.Viewport3D1Paint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);  //ビューポートが描画される場合
begin
     DrawCurve( Canvas, 0.4, TAlphaCOlors.Red   );  //手描カーブを描画
   //DrawFaces( Canvas, 0.1, TAlphaCOlors.Black );  ////すべての三角面を描画
     DrawVolos( Canvas, 0.2, TAlphaCOlors.White );  //ボロノイ図を描画
     DrawPoins( Canvas, 0.2, TAlphaCOlors.Black );  //すべての格子点を描画
end;

procedure TForm1.Viewport3D1Resize(Sender: TObject);  //ビューポートがリサイズされる場合
begin
     _ViewS := 60 / Viewport3D1.Height;                   //画面座標と内部座標の比率

     _ViewC := TPointF.Create( Viewport3D1.Width  / 2,
                               Viewport3D1.Height / 2 );  //ビューポートの中心座標
end;

//------------------------------------------------------------------------------

procedure TForm1.Viewport3D1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);  //マウスを押した場合
begin
     if Button2.Enabled then  //最適化が実行されていない場合
     begin
          _MouseState := Shift;  //マウスボタンの状態を保存

          _SwelCurve := [ ScrToPos( TPointF.Create( X, Y ) ) ];  //描き始めの座標を追加

          _SwelModel.DeleteChilds;  //メッシュをクリア

          _SwelShape.MakeGeometry;  //ポリゴンを再構築
     end;
end;

procedure TForm1.Viewport3D1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);  //マウスを動かした場合
begin
     if ssLeft in _MouseState then  //左クリックの場合
     begin
          _SwelCurve := _SwelCurve + [ ScrToPos( TPointF.Create( X, Y ) ) ];  //移動した座標を追加

          Viewport3D1.Repaint;  //ビューを再描画
     end;
end;

procedure TForm1.Viewport3D1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);  //マウスを離した場合
begin
     if ssLeft in _MouseState then
     begin
          _SwelCurve := _SwelCurve + [ ScrToPos( TPointF.Create( X, Y ) ) ];  //描き終わりの座標を追加

          with _SwelModel do
          begin
               MakeMesh( _SwelCurve );  //メッシュを生成
             //PoissonSubDiv;           //一様細分割
               FairMesh;                //不要な格子点と三角面を削除
          end;

          _SwelShape.MakeGeometry;  //ポリゴンを再構築

          Viewport3D1.Repaint;  //ビューを再描画

          _SwelCurve := [];

          _MouseState := [];
     end;
end;

//------------------------------------------------------------------------------

procedure TForm1.Button1Click(Sender: TObject);  //"筋繊維生成"ボタンを押した場合
var
   I :Integer;
begin
     for I := 0 to _SwelModel.ChildsN-1 do  //すべての三角面を走査
     begin
          with _SwelModel.Childs[ I ] do  //三角面
          begin
               {なんらかの処理}
          end;
     end;

     for I := 0 to _SwelModel.ChildsN-1 do  //すべての三角点を走査
     begin
          with _SwelModel.Childs[ I ] do  //三角点
          begin
               {なんらかの処理}
          end;
     end;

     _SwelShape.UpdateGeometry;  //ポリゴンを更新

     Viewport3D1.Repaint;  //ビューを再描画
end;

procedure TForm1.Button2Click(Sender: TObject);  //実行ボタンを押した場合
begin
     Button2.Enabled := False;
     Button3.Enabled := True ;

     Timer1.Enabled := True ;  //シミュレーション開始
end;

procedure TForm1.Button3Click(Sender: TObject);  //停止ボタンを押した場合
begin
     Timer1.Enabled := False;  //シミュレーション停止

     Button2.Enabled := True ;
     Button3.Enabled := False;
end;

end. //######################################################################### ■
