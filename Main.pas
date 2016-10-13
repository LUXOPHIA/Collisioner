unit Main;

interface //#################################################################### ■

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  System.Math.Vectors,
  FMX.Objects, FMX.StdCtrls, FMX.Controls.Presentation,
  LUX, LUX.D2, LUX.Brep.Face.TriFlip.D2.Delaunay,
  Core;

type
  TForm1 = class(TForm)
    PaintBox1: TPaintBox;
    Panel1: TPanel;
      Button1: TButton;
      Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject; Canvas: TCanvas);
    procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure Button1Click(Sender: TObject);
    procedure PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
    procedure PaintBox1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure Button2Click(Sender: TObject);
  private
    { private 宣言 }
    _MouseState :TShiftState;
    ///// メソッド
    function ScrToPos( const S_:TPointF ) :TSingle2D;
    function PosToScr( const P_:TSingle2D ) :TPointF;
    procedure DrawPoin( const Canvas_:TCanvas; const Radius_:Single );
    procedure DrawFace( const Canvas_:TCanvas; const Thickness_:Single );
    procedure DrawCurv( const Canvas_:TCanvas; const Thickness_:Single );
  public
    { public 宣言 }
    _TriMesh   :TMyModel;
    _CurvPoins :array of TSingle2D;
  end;

var
  Form1: TForm1;

implementation //############################################################### ■

{$R *.fmx}

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

function TForm1.ScrToPos( const S_:TPointF ) :TSingle2D;
begin
     Result := S_ - TPointF.Create( PaintBox1.Width  / 2,
                                    PaintBox1.Height / 2 );
end;

function TForm1.PosToScr( const P_:TSingle2D ) :TPointF;
begin
     Result := TPointF( P_ ) + TPointF.Create( PaintBox1.Width  / 2,
                                               PaintBox1.Height / 2 );
end;

//------------------------------------------------------------------------------

procedure TForm1.DrawPoin( const Canvas_:TCanvas; const Radius_:Single );
var
   I :Integer;
begin
     with Canvas_ do
     begin
          with Fill do
          begin
               Kind      := TBrushKind.Solid;
               Color     := TAlphaColorRec.Blue;
          end;

          for I := 0 to _TriMesh.PoinModel.ChildsN-1 do
          begin
               with PosToScr( _TriMesh.PoinModel.Childs[ I ].Pos ) do
               begin
                    FillEllipse( TRectF.Create( X-Radius_, Y-Radius_,
                                                X+Radius_, Y+Radius_ ), 1 );
               end;
          end;
     end;
end;

procedure TForm1.DrawFace( const Canvas_:TCanvas; const Thickness_:Single );
var
   I :Integer;
   Ps :TPolygon;
begin
     SetLength( Ps, 3 );

     with Canvas_ do
     begin
          with Stroke do
          begin
               Kind      := TBrushKind.Solid;
               Color     := TAlphaColorRec.Black;
               Thickness := Thickness_;
               Join      := TStrokeJoin.Round;
          end;
          with Fill do
          begin
               Kind      := TBrushKind.Solid;
               Color     := TAlphaColorRec.Lime;
          end;

          for I := 0 to _TriMesh.ChildsN-1 do
          begin
               with _TriMesh.Childs[ I ] do
               begin
                    if Inside then
                    begin
                         Ps[ 0 ] := PosToScr( Poin[ 1 ].Pos );
                         Ps[ 1 ] := PosToScr( Poin[ 2 ].Pos );
                         Ps[ 2 ] := PosToScr( Poin[ 3 ].Pos );

                         FillPolygon( Ps, 1 );
                         DrawPolygon( Ps, 1 );
                    end;
               end;
          end;
     end;
end;

//------------------------------------------------------------------------------

procedure TForm1.DrawCurv( const Canvas_:TCanvas; const Thickness_:Single );
var
   N, I :Integer;
   Vs :TPolygon;
begin
     N := Length( _CurvPoins );

     SetLength( Vs, N );

     for I := 0 to N-1 do Vs[ I ] := PosToScr( _CurvPoins[ I ] );

     with Canvas_ do
     begin
          with Stroke do
          begin
               Kind      := TBrushKind.Solid;
               Color     := TAlphaColorRec.Red;
               Thickness := Thickness_;
               Join      := TStrokeJoin.Round;
          end;

          DrawPolygon( Vs, 1 );
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

procedure TForm1.FormCreate(Sender: TObject);
begin
     _MouseState := [];

     _TriMesh := TMyModel.Create;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
     _TriMesh.Free;
end;

////////////////////////////////////////////////////////////////////////////////

procedure TForm1.PaintBox1Paint(Sender: TObject; Canvas: TCanvas);
begin
     Canvas.Clear( TAlphaColorRec.White );

     DrawFace( Canvas, 1 );

     DrawPoin( Canvas, 3 );

     DrawCurv( Canvas, 4 );
end;

//------------------------------------------------------------------------------

procedure TForm1.PaintBox1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     _TriMesh.DeleteChilds;

     _MouseState := Shift;

     _CurvPoins := [ ScrToPos( TPointF.Create( X, Y ) ) ];
end;

procedure TForm1.PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
begin
     if ssLeft in _MouseState then
     begin
          _CurvPoins := _CurvPoins + [ ScrToPos( TPointF.Create( X, Y ) ) ];

          PaintBox1.Repaint;
     end;
end;

procedure TForm1.PaintBox1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     PaintBox1MouseMove( Sender, Shift, X, Y );

     _MouseState := [];

     _CurvPoins := _CurvPoins + [ _CurvPoins[ 0 ] ];

     _TriMesh.MakeMesh( _CurvPoins, 20 );

     _CurvPoins := [];
end;

//------------------------------------------------------------------------------

procedure TForm1.Button1Click(Sender: TObject);
begin
     _TriMesh.DeleteChilds;

     PaintBox1.Repaint;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
     _TriMesh.PoissonSubDiv( 15 );

     PaintBox1.Repaint;
end;

end. //######################################################################### ■
