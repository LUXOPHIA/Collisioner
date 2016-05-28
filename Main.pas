unit Main;

interface  //################################################################### Å°

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  System.Math.Vectors,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Viewport3D, FMX.Types3D,
  FMX.MaterialSources, FMX.Objects3D, FMX.Controls3D,
  LUX.D3, LUX.Brep.Cell.TetraFlip.D3, LUX.Brep.Cell.TetraFlip.D3.Delaunay, LUX.Brep.Cell.TetraFlip.D3.FMX;

type
  TForm1 = class(TForm)
    Viewport3D1: TViewport3D;
    Button1: TButton;
    Light1: TLight;
    Dummy1: TDummy;
    Dummy2: TDummy;
    Camera1: TCamera;
    Grid3D1: TGrid3D;
    Panel1: TPanel;
    LightMaterialSourceD: TLightMaterialSource;
    LightMaterialSourceV: TLightMaterialSource;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Viewport3D1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure Viewport3D1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
    procedure Viewport3D1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
  private
    { private êÈåæ }
    _MouseP :TPointF;
    _MouseS :TShiftState;
  public
    { public êÈåæ }
    _Delaunay3D :TDelaunay3D;
    _DelaEdges  :TDelaEdges;
    _VoroEdges  :TVoroEdges;
  end;

var
  Form1: TForm1;

implementation //############################################################### Å°

{$R *.fmx}

uses System.Math;

procedure TForm1.FormCreate(Sender: TObject);
begin
     _MouseS := [];

     _Delaunay3D := TDelaunay3D.Create;

     with _Delaunay3D do
     begin
          AddPoin( TSingle3D.Create( +1, -1, +1 ) );
          AddPoin( TSingle3D.Create( -1, +1, +1 ) );
          AddPoin( TSingle3D.Create( +1, +1, -1 ) );
          AddPoin( TSingle3D.Create( -1, -1, -1 ) );

          AddPoin( TSingle3D.Create( -2, +2, -2 ) );
          AddPoin( TSingle3D.Create( +2, -2, -2 ) );
          AddPoin( TSingle3D.Create( +2, +2, +2 ) );
          AddPoin( TSingle3D.Create( -2, -2, +2 ) );
     end;

     _DelaEdges := TDelaEdges.Create( Self );
     _VoroEdges := TVoroEdges.Create( Self );

     with _DelaEdges do
     begin
          Parent     := Viewport3D1;
          Material   := LightMaterialSourceD;
          TetraModel := TTetraModel3D( _Delaunay3D );
          EdgeRadius := 0.05;
     end;

     with _VoroEdges do
     begin
          Parent     := Viewport3D1;
          Material   := LightMaterialSourceV;
          TetraModel := TTetraModel3D( _Delaunay3D );
          EdgeRadius := 0.05;
          EdgeLength := 10;
     end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
     _Delaunay3D.Free;
end;

////////////////////////////////////////////////////////////////////////////////

procedure TForm1.Viewport3D1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     _MouseS := Shift;
     _MouseP := TPointF.Create( X, Y );
end;

procedure TForm1.Viewport3D1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
var
   P :TPointF;
begin
     if ssLeft in _MouseS then
     begin
          P := TPointF.Create( X, Y );

          with Dummy1.RotationAngle do Y := Y + ( P.X - _MouseP.X );
          with Dummy2.RotationAngle do X := X - ( P.Y - _MouseP.Y );

          _MouseP := P;
     end;
end;

procedure TForm1.Viewport3D1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     Viewport3D1MouseMove( Sender, Shift, X, Y );

     _MouseS := [];
end;

////////////////////////////////////////////////////////////////////////////////

procedure TForm1.Button1Click(Sender: TObject);
var
   N :Integer;
begin
     for N := 1 to 10 do _Delaunay3D.AddPoin( 2 * TSingle3D.RandG );

     _DelaEdges.MakeModel;
     _VoroEdges.MakeModel;

     Viewport3D1.Repaint;
end;

end. //######################################################################### Å°
