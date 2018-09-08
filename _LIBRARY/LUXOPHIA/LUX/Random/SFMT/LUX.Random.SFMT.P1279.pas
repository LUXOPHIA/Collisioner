unit LUX.Random.SFMT.P1279;

interface //#################################################################### ■

uses LUX, LUX.D3, LUX.D4,
     LUX.Random,
     LUX.Random.SFMT;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32SMT1279

     TRandom32SMT1279 = class( TRandom32SMT )
     private
     protected
       ///// アクセス
       function GetSFMT_MEXP :Int32s; override;
       function GetSFMT_POS1 :Int32s; override;
       function GetSFMT_SL1 :Int32s; override;
       function GetSFMT_SL2 :Int32s; override;
       function GetSFMT_SR1 :Int32s; override;
       function GetSFMT_SR2 :Int32s; override;
       function GetSFMT_MSK1 :Int32u; override;
       function GetSFMT_MSK2 :Int32u; override;
       function GetSFMT_MSK3 :Int32u; override;
       function GetSFMT_MSK4 :Int32u; override;
       function GetSFMT_PARITY1 :Int32u; override;
       function GetSFMT_PARITY2 :Int32u; override;
       function GetSFMT_PARITY3 :Int32u; override;
       function GetSFMT_PARITY4 :Int32u; override;
       function GetSFMT_IDSTR :String; override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64SMT1279

     TRandom64SMT1279 = class( TRandom64SMT )
     private
     protected
       ///// アクセス
       function GetSFMT_MEXP :Int32s; override;
       function GetSFMT_POS1 :Int32s; override;
       function GetSFMT_SL1 :Int32s; override;
       function GetSFMT_SL2 :Int32s; override;
       function GetSFMT_SR1 :Int32s; override;
       function GetSFMT_SR2 :Int32s; override;
       function GetSFMT_MSK1 :Int32u; override;
       function GetSFMT_MSK2 :Int32u; override;
       function GetSFMT_MSK3 :Int32u; override;
       function GetSFMT_MSK4 :Int32u; override;
       function GetSFMT_PARITY1 :Int32u; override;
       function GetSFMT_PARITY2 :Int32u; override;
       function GetSFMT_PARITY3 :Int32u; override;
       function GetSFMT_PARITY4 :Int32u; override;
       function GetSFMT_IDSTR :String; override;
     public
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.SysUtils;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32SMT1279

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TRandom32SMT1279.GetSFMT_MEXP :Int32s;
begin
     Result := 1279;
end;

function TRandom32SMT1279.GetSFMT_POS1 :Int32s;
begin
     Result := 7;
end;

function TRandom32SMT1279.GetSFMT_SL1 :Int32s;
begin
     Result := 14;
end;

function TRandom32SMT1279.GetSFMT_SL2 :Int32s;
begin
     Result := 3;
end;

function TRandom32SMT1279.GetSFMT_SR1 :Int32s;
begin
     Result := 5;
end;

function TRandom32SMT1279.GetSFMT_SR2 :Int32s;
begin
     Result := 1;
end;

function TRandom32SMT1279.GetSFMT_MSK1 :Int32u;
begin
     Result := $f7fefffd;
end;

function TRandom32SMT1279.GetSFMT_MSK2 :Int32u;
begin
     Result := $7fefcfff;
end;

function TRandom32SMT1279.GetSFMT_MSK3 :Int32u;
begin
     Result := $aff3ef3f;
end;

function TRandom32SMT1279.GetSFMT_MSK4 :Int32u;
begin
     Result := $b5ffff7f;
end;

function TRandom32SMT1279.GetSFMT_PARITY1 :Int32u;
begin
     Result := $00000001;
end;

function TRandom32SMT1279.GetSFMT_PARITY2 :Int32u;
begin
     Result := $00000000;
end;

function TRandom32SMT1279.GetSFMT_PARITY3 :Int32u;
begin
     Result := $00000000;
end;

function TRandom32SMT1279.GetSFMT_PARITY4 :Int32u;
begin
     Result := $20000000;
end;

function TRandom32SMT1279.GetSFMT_IDSTR :String;
begin
     Result := 'SFMT-1279:7-14-3-5-1:f7fefffd-7fefcfff-aff3ef3f-b5ffff7f';
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64SMT1279

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TRandom64SMT1279.GetSFMT_MEXP :Int32s;
begin
     Result := 1279;
end;

function TRandom64SMT1279.GetSFMT_POS1 :Int32s;
begin
     Result := 7;
end;

function TRandom64SMT1279.GetSFMT_SL1 :Int32s;
begin
     Result := 14;
end;

function TRandom64SMT1279.GetSFMT_SL2 :Int32s;
begin
     Result := 3;
end;

function TRandom64SMT1279.GetSFMT_SR1 :Int32s;
begin
     Result := 5;
end;

function TRandom64SMT1279.GetSFMT_SR2 :Int32s;
begin
     Result := 1;
end;

function TRandom64SMT1279.GetSFMT_MSK1 :Int32u;
begin
     Result := $f7fefffd;
end;

function TRandom64SMT1279.GetSFMT_MSK2 :Int32u;
begin
     Result := $7fefcfff;
end;

function TRandom64SMT1279.GetSFMT_MSK3 :Int32u;
begin
     Result := $aff3ef3f;
end;

function TRandom64SMT1279.GetSFMT_MSK4 :Int32u;
begin
     Result := $b5ffff7f;
end;

function TRandom64SMT1279.GetSFMT_PARITY1 :Int32u;
begin
     Result := $00000001;
end;

function TRandom64SMT1279.GetSFMT_PARITY2 :Int32u;
begin
     Result := $00000000;
end;

function TRandom64SMT1279.GetSFMT_PARITY3 :Int32u;
begin
     Result := $00000000;
end;

function TRandom64SMT1279.GetSFMT_PARITY4 :Int32u;
begin
     Result := $20000000;
end;

function TRandom64SMT1279.GetSFMT_IDSTR :String;
begin
     Result := 'SFMT-1279:7-14-3-5-1:f7fefffd-7fefcfff-aff3ef3f-b5ffff7f';
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■