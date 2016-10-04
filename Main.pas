unit Main;

interface //#################################################################### ■

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
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
    procedure Button2Click(Sender: TObject);
  private
    { private 宣言 }
    function ScrToPos( const S_:TPointF ) :TSingle2D;
    function PosToScr( const P_:TSingle2D ) :TPointF;
  public
    { public 宣言 }
    _Delaunay :TDelaunay2D<TMyDelaPoin2D,TMyDelaFace2D>;
    /////
    procedure DrawPoin( const Canvas_:TCanvas );
    procedure DrawCirc( const Canvas_:TCanvas );
    procedure DrawFace( const Canvas_:TCanvas );
    procedure DrawVolo( const Canvas_:TCanvas );
  end;

var
  Form1: TForm1;

implementation //############################################################### ■

uses System.Math, System.Math.Vectors;

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

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

procedure TForm1.DrawPoin( const Canvas_:TCanvas );
var
   I :Integer;
begin
     with Canvas_ do
     begin
          with Stroke do
          begin
               Kind  := TBrushKind.Solid;
               Color := TAlphaColorRec.White;
          end;
          with Fill do
          begin
               Kind  := TBrushKind.Solid;
               Color := TAlphaColorRec.Red;
          end;

          for I := 0 to _Delaunay.PoinModel.ChildsN-1 do
          begin
               with PosToScr( _Delaunay.PoinModel.Childs[ I ].Pos ) do
               begin
                    FillEllipse( TRectF.Create( X - 5, Y - 5, X + 5, Y + 5 ), 1 );
                    DrawEllipse( TRectF.Create( X - 5, Y - 5, X + 5, Y + 5 ), 1 );
               end;
          end;
     end;
end;

procedure TForm1.DrawCirc( const Canvas_:TCanvas );
var
   I :Integer;
begin
     with Canvas_ do
     begin
          with Stroke do
          begin
               Kind  := TBrushKind.Solid;
               Color := TAlphaColorRec.Lime;
          end;

          for I := 0 to _Delaunay.ChildsN-1 do
          begin
               with TDelaFace2D( _Delaunay.Childs[ I ] ) do
               begin
                    if Open = 0 then
                    begin
                         with Circle, PosToScr( Center ) do DrawEllipse( TRectF.Create( X - Radius, Y - Radius,
                                                                                        X + Radius, Y + Radius ), 0.5 );
                    end;
               end;
          end;
     end;
end;

procedure TForm1.DrawFace( const Canvas_:TCanvas );
var
   I :Integer;
   P :TPolygon;
begin
     with Canvas_ do
     begin
          with Fill do
          begin
               Kind  := TBrushKind.Solid;
               Color := TAlphaColorRec.Cornflowerblue;
          end;
          with Stroke do
          begin
               Kind  := TBrushKind.Solid;
               Color := TAlphaColorRec.White;
          end;

          for I := 0 to _Delaunay.ChildsN-1 do
          begin
               with TDelaFace2D( _Delaunay.Childs[ I ] ) do
               begin
                    if Open = 0 then
                    begin
                         P := [ PosToScr( Poin[ 1 ].Pos ),
                                PosToScr( Poin[ 2 ].Pos ),
                                PosToScr( Poin[ 3 ].Pos ),
                                PosToScr( Poin[ 1 ].Pos ) ];

                         FillPolygon( P, 1 );
                         DrawPolygon( P, 1 );
                    end;
               end;
          end;
     end;
end;

procedure TForm1.DrawVolo( const Canvas_:TCanvas );
//------------------------------------------------
     function CenterPos( const Face_:TDelaFace2D ) :TSingle2D;
     //------------------------------------------------
          function EdgeCenter( const P1_,P2_:TDelaPoin2D ) :TSingle2D;
          begin
               Result := ( P1_.Pos + P2_.Pos ) / 2 - 10000 * Face_.Circle.Center;
          end;
     //------------------------------------------------
     begin
          with Face_ do
          begin
               case Open of
                 0: Result := Circle.Center;
                 1: Result := EdgeCenter( Poin[ 2 ], Poin[ 3 ] );
                 2: Result := EdgeCenter( Poin[ 3 ], Poin[ 1 ] );
                 3: Result := EdgeCenter( Poin[ 1 ], Poin[ 2 ] );
               end;
          end;
     end;
//------------------------------------------------
var
   I :Integer;
   C, P1, P2, P3 :TPointF;
begin
     with Canvas_ do
     begin
          with Stroke do
          begin
               Kind  := TBrushKind.Solid;
               Color := TAlphaColorRec.Black;
          end;

          for I := 0 to _Delaunay.ChildsN-1 do
          begin
               with TDelaFace2D( _Delaunay.Childs[ I ] ) do
               begin
                    if Open = 0 then
                    begin
                         C := PosToScr( Circle.Center );

                         P1 := PosToScr( CenterPos( Face[ 1 ] ) );
                         P2 := PosToScr( CenterPos( Face[ 2 ] ) );
                         P3 := PosToScr( CenterPos( Face[ 3 ] ) );

                         DrawLine( C, ( C + P1 ) / 2, 0.5 );
                         DrawLine( C, ( C + P2 ) / 2, 0.5 );
                         DrawLine( C, ( C + P3 ) / 2, 0.5 );
                    end;
               end;
          end;
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

procedure TForm1.FormCreate(Sender: TObject);
begin
     _Delaunay := TDelaunay2D<TMyDelaPoin2D,TMyDelaFace2D>.Create;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
     _Delaunay.Free;
end;

////////////////////////////////////////////////////////////////////////////////

procedure TForm1.PaintBox1Paint(Sender: TObject; Canvas: TCanvas);
begin
     Canvas.Clear( TAlphaColorRec.White );

     DrawFace( Canvas );
     DrawCirc( Canvas );
     DrawVolo( Canvas );
     DrawPoin( Canvas );
end;

procedure TForm1.PaintBox1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     _Delaunay.AddPoin( ScrToPos( TPointF.Create( X, Y ) ) );

     PaintBox1.Repaint;
end;

//------------------------------------------------------------------------------

procedure TForm1.Button1Click(Sender: TObject);
var
   N :Integer;
begin
     for N := 1 to 100 do _Delaunay.AddPoin( TSingle2D.RandG * Min( PaintBox1.Width, PaintBox1.Height ) / 4 );

     PaintBox1.Repaint;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
     _Delaunay.DeleteChilds;

     PaintBox1.Repaint;
end;

end. //######################################################################### ■
