program Raytracer;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main in 'Main.pas' {Form1},
  LUX.D3 in '_LIBRARY\LUXOPHIA\LUX\LUX.D3.pas',
  LUX in '_LIBRARY\LUXOPHIA\LUX\LUX.pas',
  LUX.D1 in '_LIBRARY\LUXOPHIA\LUX\LUX.D1.pas',
  LUX.D2 in '_LIBRARY\LUXOPHIA\LUX\LUX.D2.pas',
  LUX.Geometry.D3 in '_LIBRARY\LUXOPHIA\LUX.Geometry\LUX.Geometry.D3.pas',
  LUX.Geometry in '_LIBRARY\LUXOPHIA\LUX.Geometry\LUX.Geometry.pas',
  LUX.Geometry.D2 in '_LIBRARY\LUXOPHIA\LUX.Geometry\LUX.Geometry.D2.pas',
  LUX.Graph.Tree in '_LIBRARY\LUXOPHIA\LUX.Graph\LUX.Graph.Tree.pas',
  LUX.Graph in '_LIBRARY\LUXOPHIA\LUX.Graph\LUX.Graph.pas',
  LUX.Map.D2 in '_LIBRARY\LUXOPHIA\LUX.Map\LUX.Map.D2.pas',
  LUX.Map.D3 in '_LIBRARY\LUXOPHIA\LUX.Map\LUX.Map.D3.pas',
  LUX.Map.D1 in '_LIBRARY\LUXOPHIA\LUX.Map\LUX.Map.D1.pas',
  LUX.Matrix.L3 in '_LIBRARY\LUXOPHIA\LUX.Matrix\LUX.Matrix.L3.pas',
  LUX.Matrix.L4 in '_LIBRARY\LUXOPHIA\LUX.Matrix\LUX.Matrix.L4.pas',
  LUX.Matrix.L2 in '_LIBRARY\LUXOPHIA\LUX.Matrix\LUX.Matrix.L2.pas',
  LUX.Color in '_LIBRARY\LUXOPHIA\LUX.Color\LUX.Color.pas',
  LUX.Raytrace.Material in '_LIBRARY\LUXOPHIA\LUX.Raytrace\LUX.Raytrace.Material.pas',
  LUX.Raytrace in '_LIBRARY\LUXOPHIA\LUX.Raytrace\LUX.Raytrace.pas',
  LUX.Raytrace.Render in '_LIBRARY\LUXOPHIA\LUX.Raytrace\LUX.Raytrace.Render.pas',
  LUX.Raytrace.Geometry in '_LIBRARY\LUXOPHIA\LUX.Raytrace\LUX.Raytrace.Geometry.pas',
  LIB.Raytrace.Geometry in '_LIBRARY\LIB.Raytrace.Geometry.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
