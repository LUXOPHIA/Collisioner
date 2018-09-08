unit LUX.Random.SFMT.P2281;

interface //#################################################################### ■

uses LUX, LUX.D3, LUX.D4,
     LUX.Random,
     LUX.Random.SFMT;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32SMT2281

     TRandom32SMT2281 = class( TRandom32SMT )
     private const
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

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64SMT2281

     TRandom64SMT2281 = class( TRandom64SMT )
     private const
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

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32SMT2281

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

function TRandom32SMT2281.GetSFMT_MEXP :Int32s;
begin
     Result := 2281;
end;

function TRandom32SMT2281.GetSFMT_POS1 :Int32s;
begin
     Result := 12;
end;

function TRandom32SMT2281.GetSFMT_SL1 :Int32s;
begin
     Result := 19;
end;

function TRandom32SMT2281.GetSFMT_SL2 :Int32s;
begin
     Result := 1;
end;

function TRandom32SMT2281.GetSFMT_SR1 :Int32s;
begin
     Result := 5;
end;

function TRandom32SMT2281.GetSFMT_SR2 :Int32s;
begin
     Result := 1;
end;

function TRandom32SMT2281.GetSFMT_MSK1 :Int32u;
begin
     Result := $bff7ffbf;
end;

function TRandom32SMT2281.GetSFMT_MSK2 :Int32u;
begin
     Result := $fdfffffe;
end;

function TRandom32SMT2281.GetSFMT_MSK3 :Int32u;
begin
     Result := $f7ffef7f;
end;

function TRandom32SMT2281.GetSFMT_MSK4 :Int32u;
begin
     Result := $f2f7cbbf;
end;

function TRandom32SMT2281.GetSFMT_PARITY1 :Int32u;
begin
     Result := $00000001;
end;

function TRandom32SMT2281.GetSFMT_PARITY2 :Int32u;
begin
     Result := $00000000;
end;

function TRandom32SMT2281.GetSFMT_PARITY3 :Int32u;
begin
     Result := $00000000;
end;

function TRandom32SMT2281.GetSFMT_PARITY4 :Int32u;
begin
     Result := $41dfa600;
end;

function TRandom32SMT2281.GetSFMT_IDSTR :String;
begin
     Result := 'SFMT-2281:12-19-1-5-1:bff7ffbf-fdfffffe-f7ffef7f-f2f7cbbf';
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64SMT2281

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

function TRandom64SMT2281.GetSFMT_MEXP :Int32s;
begin
     Result := 2281;
end;

function TRandom64SMT2281.GetSFMT_POS1 :Int32s;
begin
     Result := 12;
end;

function TRandom64SMT2281.GetSFMT_SL1 :Int32s;
begin
     Result := 19;
end;

function TRandom64SMT2281.GetSFMT_SL2 :Int32s;
begin
     Result := 1;
end;

function TRandom64SMT2281.GetSFMT_SR1 :Int32s;
begin
     Result := 5;
end;

function TRandom64SMT2281.GetSFMT_SR2 :Int32s;
begin
     Result := 1;
end;

function TRandom64SMT2281.GetSFMT_MSK1 :Int32u;
begin
     Result := $bff7ffbf;
end;

function TRandom64SMT2281.GetSFMT_MSK2 :Int32u;
begin
     Result := $fdfffffe;
end;

function TRandom64SMT2281.GetSFMT_MSK3 :Int32u;
begin
     Result := $f7ffef7f;
end;

function TRandom64SMT2281.GetSFMT_MSK4 :Int32u;
begin
     Result := $f2f7cbbf;
end;

function TRandom64SMT2281.GetSFMT_PARITY1 :Int32u;
begin
     Result := $00000001;
end;

function TRandom64SMT2281.GetSFMT_PARITY2 :Int32u;
begin
     Result := $00000000;
end;

function TRandom64SMT2281.GetSFMT_PARITY3 :Int32u;
begin
     Result := $00000000;
end;

function TRandom64SMT2281.GetSFMT_PARITY4 :Int32u;
begin
     Result := $41dfa600;
end;

function TRandom64SMT2281.GetSFMT_IDSTR :String;
begin
     Result := 'SFMT-2281:12-19-1-5-1:bff7ffbf-fdfffffe-f7ffef7f-f2f7cbbf';
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■