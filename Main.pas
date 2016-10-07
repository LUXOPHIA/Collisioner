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
    function ScrToPos( const S_:TPointF ) :TSingle2D;
    function PosToScr( const P_:TSingle2D ) :TPointF;
  public
    { public 宣言 }
    _MouseState :TShiftState;
    _CurvPoins  :array of TSingle2D;
    _EdgePoins  :array of TSingle2D;
    _Delaunay   :TDelaunay2D<TMyDelaPoin2D,TMyDelaFace2D>;
    /////
    procedure DrawPoin( const Canvas_:TCanvas );
    procedure DrawCirc( const Canvas_:TCanvas );
    procedure DrawFace( const Canvas_:TCanvas );
    procedure DrawVolo( const Canvas_:TCanvas );
    function CurvPoinsLen :Single;
    procedure InitEdgePoins( const MinL_:Single );
    procedure DrawCurvPoins( const Canvas_:TCanvas; const Thickness_:Single );
    procedure DrawEdgePoins( const Canvas_:TCanvas; const Radius_:Single; const Thickness_:Single );
    procedure ClearModel;
    function InsideEdges( const P_:TSingle2D ) :Single;
    procedure MakeModel;
  end;

var
  Form1: TForm1;

implementation //############################################################### ■

uses System.Math;

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
               with TMyDelaFace2D( _Delaunay.Childs[ I ] ) do
               begin
                    if Inside then
                    begin
                         P := [ PosToScr( Poin[ 1 ].Pos ),
                                PosToScr( Poin[ 2 ].Pos ),
                                PosToScr( Poin[ 3 ].Pos ) ];

                         FillPolygon( P, 1 );
                         DrawPolygon( P, 1 );
                    end;
               end;
          end;
     end;
end;

procedure TForm1.DrawVolo( const Canvas_:TCanvas );
//････････････････････････････････････････････････
     function CenterPos( const Face_:TDelaFace2D ) :TSingle2D;
     //･･････････････････････････････････････････････････････
          function EdgeCenter( const P1_,P2_:TDelaPoin2D ) :TSingle2D;
          begin
               Result := ( P1_.Pos + P2_.Pos ) / 2 - 10000 * Face_.Circle.Center;
          end;
     //･･････････････････････････････････････････････････････
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
//････････････････････････････････････････････････
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
               Thickness := 1;
          end;

          for I := 0 to _Delaunay.ChildsN-1 do
          begin
               with TMyDelaFace2D( _Delaunay.Childs[ I ] ) do
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

//------------------------------------------------------------------------------

function TForm1.CurvPoinsLen :Single;
var
   I :Integer;
   P, P0, P1 :TSingle2D;
begin
     Result := 0;

     P := ScrToPos( _CurvPoins[ 0 ] );

     P0 := P;
     for I := 1 to High( _CurvPoins ) do
     begin
          P1 := ScrToPos( _CurvPoins[ I ] );

          Result := Result + Distance( P0, P1 );

          P0 := P1;
     end;

     Result := Result + Distance( P0, P );
end;

procedure TForm1.InitEdgePoins( const MinL_:Single );
var
   Ls :array of Single;
   IntL, L, T :Single;
   H, N, I, I0, I1 :Integer;
   P0, P1 :TSingle2D;
begin
     SetLength( Ls, Length( _CurvPoins ) );

     H := High( _CurvPoins );

     P0 := _CurvPoins[ 0 ];
     Ls[ 0 ] := 0;
     for I := 1 to H do
     begin
          P1 := _CurvPoins[ I ];

          Ls[ I ] := Ls[ I-1 ] + Distance( P0, P1 );

          P0 := P1;
     end;

     N := Ceil( Ls[ H ] / MinL_ );

     IntL := Ls[ H ] / N;

     SetLength( _EdgePoins, N );

     I0 := 0;  I1 := 1;
     for I := 0 to N-1 do
     begin
          L := IntL * I;

          while Ls[ I1 ] <= L do
          begin
               I0 := I1;  Inc( I1 );
          end;

          T := ( L        - Ls[ I0 ] )
             / ( Ls[ I1 ] - Ls[ I0 ] );

          P0 := _CurvPoins[ I0 ];
          P1 := _CurvPoins[ I1 ];

          _EdgePoins[ I ] := ( P1 - P0 ) * T + P0;
     end;
end;

procedure TForm1.DrawCurvPoins( const Canvas_:TCanvas; const Thickness_:Single );
var
   N, I :Integer;
   Vs :TPolygon;
begin
     N := Length( _CurvPoins );

     SetLength( Vs, N );

     for I := 0 to N-1 do Vs[ I ] := PosToScr( _CurvPoins[ I ] );

     with Canvas do
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

procedure TForm1.DrawEdgePoins( const Canvas_:TCanvas; const Radius_:Single; const Thickness_:Single );
var
   P :TSingle2D;
begin
     with Canvas_ do
     begin
          with Stroke do
          begin
               Kind  := TBrushKind.Solid;
               Color := TAlphaColorRec.Red;
               Thickness := Thickness_;
          end;
          with Fill do
          begin
               Kind  := TBrushKind.Solid;
               Color := TAlphaColorRec.White;
          end;

          for P in _EdgePoins do
          begin
               with PosToScr( P ) do
               begin
                    FillEllipse( TRectF.Create( X - Radius_, Y - Radius_, X + Radius_, Y + Radius_ ), 1 );
                    DrawEllipse( TRectF.Create( X - Radius_, Y - Radius_, X + Radius_, Y + Radius_ ), 1 );
               end;
          end;
     end;
end;

procedure TForm1.ClearModel;
begin
     _CurvPoins := [];
     _EdgePoins := [];

     _Delaunay.DeleteChilds;

     _Delaunay.AddPoin( TSingle2D.Create( -10000, -10000 ) ).Inside := +1;
     _Delaunay.AddPoin( TSingle2D.Create( +10000, -10000 ) ).Inside := +1;
     _Delaunay.AddPoin( TSingle2D.Create( -10000, +10000 ) ).Inside := +1;
     _Delaunay.AddPoin( TSingle2D.Create( +10000, +10000 ) ).Inside := +1;

     PaintBox1.Repaint;
end;

function TForm1.InsideEdges( const P_:TSingle2D ) :Single;
var
   I :Integer;
   P0, P1, V0, V1 :TSingle2D;
   A :Single;
begin
     if not Assigned( _EdgePoins ) then
     begin
          Result := 0;  Exit;
     end;

     Result := 0;

     P0 := _EdgePoins[ 0 ];
     for I := 1 to High( _EdgePoins )-1 do
     begin
          P1 := _EdgePoins[ I ];

          V0 := P0 - P_;
          V1 := P1 - P_;

          A := ArcTan2( V0.X * V1.Y - V0.Y * V1.X,
                        V0.X * V1.X + V0.Y * V1.Y );

          Result := Result + A;

          P0 := P1;
     end;

     P1 := _EdgePoins[ I ];

     V0 := P0 - P_;
     V1 := P1 - P_;

     A := ArcTan2( V0.X * V1.Y - V0.Y * V1.X,
                   V0.X * V1.X + V0.Y * V1.Y );

     Result := Result + A;

     Result := Result / Pi2;
end;

procedure TForm1.MakeModel;
var
   P :TSingle2D;
begin
     InitEdgePoins( 20 );

     for P in _EdgePoins do _Delaunay.AddPoin( P ).Inside := 0;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

procedure TForm1.FormCreate(Sender: TObject);
begin
     _MouseState := [];

     _Delaunay := TDelaunay2D<TMyDelaPoin2D,TMyDelaFace2D>.Create;

     ClearModel;
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

     DrawCurvPoins( Canvas, 4 );

     DrawVolo( Canvas );

     DrawEdgePoins( Canvas, 4, 2 );
end;

//------------------------------------------------------------------------------

procedure TForm1.PaintBox1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     _MouseState := Shift;

     ClearModel;

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

     MakeModel;
end;

//------------------------------------------------------------------------------

procedure TForm1.Button1Click(Sender: TObject);
begin
     ClearModel;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
   P :TSingle2D;
   N, I :Integer;
   F :TMyDelaFace2D;
label
     FIND;
begin
     FIND:
     for I := 0 to _Delaunay.ChildsN-1 do
     begin
          F := TMyDelaFace2D( _Delaunay.Childs[ I ] );

          if ( F.Open = 0 ) and
             ( TMyDelaPoin2D( F.Poin[1] ).Inside <= 0 ) and
             ( TMyDelaPoin2D( F.Poin[2] ).Inside <= 0 ) and
             ( TMyDelaPoin2D( F.Poin[3] ).Inside <= 0 ) and
               F.Inside and
             ( F.Circle.Radius > 15 ) then
          begin
               _Delaunay.AddPoin3( F.Circle.Center, F ).Inside := -1;

               goto FIND;
          end;
     end;

     PaintBox1.Repaint;
end;

end. //######################################################################### ■
