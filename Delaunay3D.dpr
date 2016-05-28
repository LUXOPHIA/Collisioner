program Delaunay3D;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main in 'Main.pas' {Form1},
  LUX.D3 in '_LIBRARY\LUXOPHIA\LUX\LUX.D3.pas',
  LUX in '_LIBRARY\LUXOPHIA\LUX\LUX.pas',
  LUX.Geometry in '_LIBRARY\LUXOPHIA\LUX.Geometry\LUX.Geometry.pas',
  LUX.Geometry.D3 in '_LIBRARY\LUXOPHIA\LUX.Geometry\LUX.Geometry.D3.pas',
  LUX.Graph in '_LIBRARY\LUXOPHIA\LUX.Graph\LUX.Graph.pas',
  LUX.Geometry.D2 in '_LIBRARY\LUXOPHIA\LUX.Geometry\LUX.Geometry.D2.pas',
  LUX.D2 in '_LIBRARY\LUXOPHIA\LUX\LUX.D2.pas',
  LUX.D1 in '_LIBRARY\LUXOPHIA\LUX\LUX.D1.pas',
  LUX.Graph.Tree in '_LIBRARY\LUXOPHIA\LUX.Graph\LUX.Graph.Tree.pas',
  LUX.Brep.Cell.TetraFlip.D3.Delaunay in '_LIBRARY\LUXOPHIA\LUX.Brep\LUX.Brep.Cell.TetraFlip.D3.Delaunay.pas',
  LUX.Brep.Cell.TetraFlip.D3.FMX in '_LIBRARY\LUXOPHIA\LUX.Brep\LUX.Brep.Cell.TetraFlip.D3.FMX.pas',
  LUX.Brep in '_LIBRARY\LUXOPHIA\LUX.Brep\LUX.Brep.pas',
  LUX.Brep.Cell.TetraFlip.D3 in '_LIBRARY\LUXOPHIA\LUX.Brep\LUX.Brep.Cell.TetraFlip.D3.pas',
  LUX.Brep.Cell.TetraFlip in '_LIBRARY\LUXOPHIA\LUX.Brep\LUX.Brep.Cell.TetraFlip.pas',
  LUX.Brep.Poin in '_LIBRARY\LUXOPHIA\LUX.Brep\LUX.Brep.Poin.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
