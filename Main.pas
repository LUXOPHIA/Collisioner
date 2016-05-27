unit Main;

interface //#################################################################### ■

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Objects, FMX.Edit,
  LUX.Matrix.L4, LUX.Raytrace, LUX.Raytrace.Geometry, LUX.Raytrace.Material, LUX.Raytrace.Render,
  LIB.Raytrace.Geometry;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    GroupBoxI: TGroupBox;
    LabelIW: TLabel;
    EditIW: TEdit;
    LabelIH: TLabel;
    EditIH: TEdit;
    GroupBoxR: TGroupBox;
    ButtonP: TButton;
    ButtonS: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ButtonPClick(Sender: TObject);
    procedure ButtonSClick(Sender: TObject);
  private
    { private 宣言 }
  public
    { public 宣言 }
    _Render :TRayRender;
    _World  :TRayWorld;
    ///// メソッド
    procedure MakeScene;
  end;

var
  Form1: TForm1;

implementation //############################################################### ■

{$R *.fmx}

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure TForm1.MakeScene;
var
   N :Integer;
begin
     for N := 1 to 10 do
     begin
          with TMyGeometry.Create( _World ) do
          begin
               Radius := Random;

               LocalMatrix := LocalMatrix * TSingleM4.Translate( 8 * Random - 4, 6 * Random - 3, 6 * Random - 3 );
          end;
     end;

end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

procedure TForm1.FormCreate(Sender: TObject);
begin
     _World  := TRayWorld.Create;

     _Render := TRayRender.Create;
     _Render.Scene := _World;

     MakeScene;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
     _World.Free;

     _Render.Free;
end;

//------------------------------------------------------------------------------

procedure TForm1.ButtonPClick(Sender: TObject);
begin
     ButtonP.Enabled := False;
     ButtonS.Enabled := True ;

     Image1.Bitmap.SetSize( 640, 480 );

     with _Render do
     begin
          Pixels.BricX := 640;
          Pixels.BricY := 480;

          Run;

          CopyToBitmap( Image1.Bitmap );
     end;

     ButtonP.Enabled := True ;
     ButtonS.Enabled := False;
end;

procedure TForm1.ButtonSClick(Sender: TObject);
begin
     ButtonS.Enabled := False;

     _Render.Stop;
end;

end. //######################################################################### ■
