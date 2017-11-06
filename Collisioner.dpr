﻿program Collisioner;



uses
  System.StartUpCopy,
  FMX.Forms,
  Main in 'Main.pas' {Form1},
  LUX.DN in '_LIBRARY\LUXOPHIA\LUX\LUX.DN.pas',
  LUX.Lattice.T1 in '_LIBRARY\LUXOPHIA\LUX\LUX.Lattice.T1.pas',
  LUX.Lattice.T2 in '_LIBRARY\LUXOPHIA\LUX\LUX.Lattice.T2.pas',
  LUX.Lattice.T3 in '_LIBRARY\LUXOPHIA\LUX\LUX.Lattice.T3.pas',
  LUX.M2 in '_LIBRARY\LUXOPHIA\LUX\LUX.M2.pas',
  LUX.M3 in '_LIBRARY\LUXOPHIA\LUX\LUX.M3.pas',
  LUX.M4 in '_LIBRARY\LUXOPHIA\LUX\LUX.M4.pas',
  LUX in '_LIBRARY\LUXOPHIA\LUX\LUX.pas',
  LUX.Tree in '_LIBRARY\LUXOPHIA\LUX\LUX.Tree.pas',
  LUX.D1 in '_LIBRARY\LUXOPHIA\LUX\LUX.D1.pas',
  LUX.D2.M4 in '_LIBRARY\LUXOPHIA\LUX\LUX.D2.M4.pas',
  LUX.D2 in '_LIBRARY\LUXOPHIA\LUX\LUX.D2.pas',
  LUX.D2.V4 in '_LIBRARY\LUXOPHIA\LUX\LUX.D2.V4.pas',
  LUX.D3.M4 in '_LIBRARY\LUXOPHIA\LUX\LUX.D3.M4.pas',
  LUX.D3 in '_LIBRARY\LUXOPHIA\LUX\LUX.D3.pas',
  LUX.D3.V4 in '_LIBRARY\LUXOPHIA\LUX\LUX.D3.V4.pas',
  LUX.D4.M4 in '_LIBRARY\LUXOPHIA\LUX\LUX.D4.M4.pas',
  LUX.D4 in '_LIBRARY\LUXOPHIA\LUX\LUX.D4.pas',
  LUX.D4.V4 in '_LIBRARY\LUXOPHIA\LUX\LUX.D4.V4.pas',
  LUX.D5 in '_LIBRARY\LUXOPHIA\LUX\LUX.D5.pas',
  LUX.FMX.Forms in '_LIBRARY\LUXOPHIA\LUX\FMX\LUX.FMX.Forms.pas',
  LUX.GPU.OpenGL.Scener in '_LIBRARY\LUXOPHIA\LUX.GPU.OpenGL\LUX.GPU.OpenGL.Scener.pas',
  LUX.GPU.OpenGL.Shaper in '_LIBRARY\LUXOPHIA\LUX.GPU.OpenGL\LUX.GPU.OpenGL.Shaper.pas',
  LUX.GPU.OpenGL.Shaper.Preset in '_LIBRARY\LUXOPHIA\LUX.GPU.OpenGL\LUX.GPU.OpenGL.Shaper.Preset.pas',
  LUX.GPU.OpenGL.Camera in '_LIBRARY\LUXOPHIA\LUX.GPU.OpenGL\LUX.GPU.OpenGL.Camera.pas',
  LUX.GPU.OpenGL.Inform in '_LIBRARY\LUXOPHIA\LUX.GPU.OpenGL\LUX.GPU.OpenGL.Inform.pas',
  LUX.GPU.OpenGL.Matery in '_LIBRARY\LUXOPHIA\LUX.GPU.OpenGL\LUX.GPU.OpenGL.Matery.pas',
  LUX.GPU.OpenGL.Matery.Preset in '_LIBRARY\LUXOPHIA\LUX.GPU.OpenGL\LUX.GPU.OpenGL.Matery.Preset.pas',
  LUX.GPU.OpenGL in '_LIBRARY\LUXOPHIA\LUX.GPU.OpenGL\LUX.GPU.OpenGL.pas',
  LUX.GPU.OpenGL.Atom.Imager.Preset in '_LIBRARY\LUXOPHIA\LUX.GPU.OpenGL\FMX\LUX.GPU.OpenGL.Atom.Imager.Preset.pas',
  LUX.GPU.OpenGL.Matery.Imager.Preset in '_LIBRARY\LUXOPHIA\LUX.GPU.OpenGL\FMX\LUX.GPU.OpenGL.Matery.Imager.Preset.pas',
  LUX.GPU.OpenGL.Viewer in '_LIBRARY\LUXOPHIA\LUX.GPU.OpenGL\FMX\LUX.GPU.OpenGL.Viewer.pas' {GLViewer: TFrame},
  LUX.GPU.OpenGL.Window in '_LIBRARY\LUXOPHIA\LUX.GPU.OpenGL\FMX\LUX.GPU.OpenGL.Window.pas',
  LUX.GPU.OpenGL.Atom.Buffer.StoBuf in '_LIBRARY\LUXOPHIA\LUX.GPU.OpenGL\» ATOM\LUX.GPU.OpenGL.Atom.Buffer.StoBuf.pas',
  LUX.GPU.OpenGL.Atom.Buffer.Unifor in '_LIBRARY\LUXOPHIA\LUX.GPU.OpenGL\» ATOM\LUX.GPU.OpenGL.Atom.Buffer.Unifor.pas',
  LUX.GPU.OpenGL.Atom.Buffer.Verter in '_LIBRARY\LUXOPHIA\LUX.GPU.OpenGL\» ATOM\LUX.GPU.OpenGL.Atom.Buffer.Verter.pas',
  LUX.GPU.OpenGL.Atom.Engine in '_LIBRARY\LUXOPHIA\LUX.GPU.OpenGL\» ATOM\LUX.GPU.OpenGL.Atom.Engine.pas',
  LUX.GPU.OpenGL.Atom.Imager in '_LIBRARY\LUXOPHIA\LUX.GPU.OpenGL\» ATOM\LUX.GPU.OpenGL.Atom.Imager.pas',
  LUX.GPU.OpenGL.Atom in '_LIBRARY\LUXOPHIA\LUX.GPU.OpenGL\» ATOM\LUX.GPU.OpenGL.Atom.pas',
  LUX.GPU.OpenGL.Atom.Porter in '_LIBRARY\LUXOPHIA\LUX.GPU.OpenGL\» ATOM\LUX.GPU.OpenGL.Atom.Porter.pas',
  LUX.GPU.OpenGL.Atom.Progra in '_LIBRARY\LUXOPHIA\LUX.GPU.OpenGL\» ATOM\LUX.GPU.OpenGL.Atom.Progra.pas',
  LUX.GPU.OpenGL.Atom.Shader in '_LIBRARY\LUXOPHIA\LUX.GPU.OpenGL\» ATOM\LUX.GPU.OpenGL.Atom.Shader.pas',
  LUX.GPU.OpenGL.Atom.Buffer.Elemer in '_LIBRARY\LUXOPHIA\LUX.GPU.OpenGL\» ATOM\LUX.GPU.OpenGL.Atom.Buffer.Elemer.pas',
  LUX.GPU.OpenGL.Atom.Buffer in '_LIBRARY\LUXOPHIA\LUX.GPU.OpenGL\» ATOM\LUX.GPU.OpenGL.Atom.Buffer.pas',
  LUX.Collision in '_LIBRARY\LUX.Collision.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.