﻿unit Main;

interface //#################################################################### ■

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  LUX, LUX.D2, LUX.D3, LUX.M4,
  LUX.GPU.OpenGL,
  LUX.GPU.OpenGL.Viewer,
  LUX.GPU.OpenGL.Scener,
  LUX.GPU.OpenGL.Camera,
  LUX.GPU.OpenGL.Matery.Preset,
  LUX.GPU.OpenGL.Shaper,
  LUX.GPU.OpenGL.Shaper.Octree;

type
  TForm1 = class(TForm)
    GLViewer1: TGLViewer;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure GLViewer1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure GLViewer1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
    procedure GLViewer1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
  private
    { private 宣言 }
    _MouseS :TShiftState;
    _MouseP :TSingle2D;
    _MouseA :TSingle2D;
    _FrameI :Integer;
    ///// メソッド
    procedure InitCamera;
  public
    { public 宣言 }
    _Scener  :TGLScener;
    _Camera  :TGLCameraPers;
    _Matery0 :IGLMateryRGB;
    _Matery1 :IGLMateryColor;
    _ShaperA :TGLShaperOctree;
    _ShaperB :TGLShaperOctree;
  end;

var
  Form1: TForm1;

implementation //############################################################### ■

{$R *.fmx}

uses System.Math,
     Winapi.Windows;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

procedure TForm1.InitCamera;
begin
     with _Camera do
     begin
          Pose := TSingleM4.RotateY( DegToRad( -_MouseA.X ) )
                * TSingleM4.RotateX( DegToRad( -_MouseA.Y ) )
                * TSingleM4.Translate( 0, 0, +10 );
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

procedure TForm1.FormCreate(Sender: TObject);
begin
     _Scener  := TGLScener      .Create           ;
     _Camera  := TGLCameraPers  .Create( _Scener );
     _Matery0 := TGLMateryRGB   .Create           ;
     _Matery1 := TGLMateryColor .Create           ;
     _ShaperA := TGLShaperOctree.Create( _Scener );
     _ShaperB := TGLShaperOctree.Create( _Scener );

     GLViewer1.Camera := _Camera;

     with _ShaperA do
     begin
          Matery := _Matery0;

          Inform.Visible := False;

          LoadFromFileSTL( '..\..\_DATA\ShaperA.stl' );

          Pose := TSingleM4.Translate( -1, 0, 0 );

          Reso := 0.05;

          Generate;
          MakeGrid;
     end;

     with _ShaperB do
     begin
          Matery := _Matery0;

          Inform.Visible := False;

          LoadFromFileSTL( '..\..\_DATA\ShaperB.stl' );

          Pose := TSingleM4.Translate( +1, 0, 0 );

          Reso := 0.05;

          Generate;
          MakeGrid;
     end;

     _MouseA := TSingle2D.Create( 0, +30 );

     InitCamera;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
     _Scener.DisposeOf;
end;

////////////////////////////////////////////////////////////////////////////////

procedure TForm1.Timer1Timer(Sender: TObject);
begin
     with _ShaperA do Pose := TSingleM4.Translate( -1, 0, 0 )
                            * TSingleM4.RotateY( DegToRad( _FrameI ) );
     with _ShaperB do Pose := TSingleM4.Translate( +1, 0, 0 )
                            * TSingleM4.RotateZ( DegToRad( _FrameI ) );

     if _ShaperA.Collision( _ShaperB ) then
     begin
          _ShaperA.Matery := _Matery1;
          _ShaperB.Matery := _Matery1;
     end
     else
     begin
          _ShaperA.Matery := _Matery0;
          _ShaperB.Matery := _Matery0;
     end;

     GLViewer1.Repaint;

     Inc( _FrameI );
end;

//------------------------------------------------------------------------------

procedure TForm1.GLViewer1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     _MouseS := Shift;
     _MouseP := TSingle2D.Create( X, Y );
end;

procedure TForm1.GLViewer1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
var
   P :TSingle2D;
begin
     if ssLeft in _MouseS then
     begin
          P := TSingle2D.Create( X, Y );

          _MouseA := _MouseA + ( P - _MouseP );

          InitCamera;

          _MouseP := P;
     end;
end;

procedure TForm1.GLViewer1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     _MouseS := [];
end;

end. //######################################################################### ■
