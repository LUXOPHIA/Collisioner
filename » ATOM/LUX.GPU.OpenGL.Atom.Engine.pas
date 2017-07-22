unit LUX.GPU.OpenGL.Atom.Engine;

interface //#################################################################### ■

uses Winapi.OpenGL, Winapi.OpenGLext,
     LUX,
     LUX.GPU.OpenGL.Atom.Porter,
     LUX.GPU.OpenGL.Atom.Progra;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLEngine

     IGLEngine = interface( IGLProgra )
     ['{0B2FDEDE-30D3-439B-AC76-E61F9E028CD0}']
     {protected}
       ///// アクセス
       function GetVerters :TGLPortsV;
       function GetUnifors :TGLPortsU;
       function GetImagers :TGLPortsI;
     {public}
       ///// プロパティ
       property Verters :TGLPortsV read GetVerters;
       property Unifors :TGLPortsU read GetUnifors;
       property Imagers :TGLPortsI read GetImagers;
       ///// メソッド
       procedure Use;
       procedure Unuse;
     end;

     TGLEngine = class( TGLProgra, IGLEngine )
     private
     protected
       _Verters :TGLPortsV;
       _Unifors :TGLPortsU;
       _Imagers :TGLPortsI;
       ///// アクセス
       function GetVerters :TGLPortsV;
       function GetUnifors :TGLPortsU;
       function GetImagers :TGLPortsI;
       ///// イベント
       procedure DoOnLinked; override;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property Verters :TGLPortsV read GetVerters;
       property Unifors :TGLPortsU read GetUnifors;
       property Imagers :TGLPortsI read GetImagers;
       ///// メソッド
       procedure Use; override;
       procedure Unuse; override;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGLEngine

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGLEngine.GetVerters :TGLPortsV;
begin
     Result := _Verters;
end;

function TGLEngine.GetUnifors :TGLPortsU;
begin
     Result := _Unifors;
end;

function TGLEngine.GetImagers :TGLPortsI;
begin
     Result := _Imagers;
end;

/////////////////////////////////////////////////////////////////////// イベント

procedure TGLEngine.DoOnLinked;
begin
     _Verters.AddPorts;
     _Unifors.AddPorts;
     _Imagers.AddPorts;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGLEngine.Create;
begin
     inherited Create;

     _Verters := TGLPortsV.Create( Self as IGLProgra );
     _Unifors := TGLPortsU.Create( Self as IGLProgra );
     _Imagers := TGLPortsI.Create( Self as IGLProgra );
end;

destructor TGLEngine.Destroy;
begin
     _Verters.DisposeOf;
     _Unifors.DisposeOf;
     _Imagers.DisposeOf;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TGLEngine.Use;
begin
     inherited;

     _Verters.Use;
     _Unifors.Use;
     _Imagers.Use;
end;

procedure TGLEngine.Unuse;
begin
     _Verters.Unuse;
     _Unifors.Unuse;
     _Imagers.Unuse;

     inherited;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■