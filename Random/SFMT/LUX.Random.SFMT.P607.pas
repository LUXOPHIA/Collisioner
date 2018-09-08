unit LUX.Random.SFMT.P607;

interface //#################################################################### ■

uses LUX, LUX.D3, LUX.D4,
     LUX.Random,
     LUX.Random.SFMT;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32SMT607

     TRandom32SMT607 = class( TRandom32SMT )
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

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64SMT607

     TRandom64SMT607 = class( TRandom64SMT )
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

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32SMT607

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TRandom32SMT607.GetSFMT_MEXP :Int32s;
begin
     Result := 607;
end;

function TRandom32SMT607.GetSFMT_POS1 :Int32s;
begin
     Result := 2;
end;

function TRandom32SMT607.GetSFMT_SL1 :Int32s;
begin
     Result := 15;
end;

function TRandom32SMT607.GetSFMT_SL2 :Int32s;
begin
     Result := 3;
end;

function TRandom32SMT607.GetSFMT_SR1 :Int32s;
begin
     Result := 13;
end;

function TRandom32SMT607.GetSFMT_SR2 :Int32s;
begin
     Result := 3;
end;

function TRandom32SMT607.GetSFMT_MSK1 :Int32u;
begin
     Result := $fdff37ff;
end;

function TRandom32SMT607.GetSFMT_MSK2 :Int32u;
begin
     Result := $ef7f3f7d;
end;

function TRandom32SMT607.GetSFMT_MSK3 :Int32u;
begin
     Result := $ff777b7d;
end;

function TRandom32SMT607.GetSFMT_MSK4 :Int32u;
begin
     Result := $7ff7fb2f;
end;

function TRandom32SMT607.GetSFMT_PARITY1 :Int32u;
begin
     Result := $00000001;
end;

function TRandom32SMT607.GetSFMT_PARITY2 :Int32u;
begin
     Result := $00000000;
end;

function TRandom32SMT607.GetSFMT_PARITY3 :Int32u;
begin
     Result := $00000000;
end;

function TRandom32SMT607.GetSFMT_PARITY4 :Int32u;
begin
     Result := $5986f054;
end;

function TRandom32SMT607.GetSFMT_IDSTR :String;
begin
     Result := 'SFMT-607:2-15-3-13-3:fdff37ff-ef7f3f7d-ff777b7d-7ff7fb2f';
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64SMT607

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TRandom64SMT607.GetSFMT_MEXP :Int32s;
begin
     Result := 607;
end;

function TRandom64SMT607.GetSFMT_POS1 :Int32s;
begin
     Result := 2;
end;

function TRandom64SMT607.GetSFMT_SL1 :Int32s;
begin
     Result := 15;
end;

function TRandom64SMT607.GetSFMT_SL2 :Int32s;
begin
     Result := 3;
end;

function TRandom64SMT607.GetSFMT_SR1 :Int32s;
begin
     Result := 13;
end;

function TRandom64SMT607.GetSFMT_SR2 :Int32s;
begin
     Result := 3;
end;

function TRandom64SMT607.GetSFMT_MSK1 :Int32u;
begin
     Result := $fdff37ff;
end;

function TRandom64SMT607.GetSFMT_MSK2 :Int32u;
begin
     Result := $ef7f3f7d;
end;

function TRandom64SMT607.GetSFMT_MSK3 :Int32u;
begin
     Result := $ff777b7d;
end;

function TRandom64SMT607.GetSFMT_MSK4 :Int32u;
begin
     Result := $7ff7fb2f;
end;

function TRandom64SMT607.GetSFMT_PARITY1 :Int32u;
begin
     Result := $00000001;
end;

function TRandom64SMT607.GetSFMT_PARITY2 :Int32u;
begin
     Result := $00000000;
end;

function TRandom64SMT607.GetSFMT_PARITY3 :Int32u;
begin
     Result := $00000000;
end;

function TRandom64SMT607.GetSFMT_PARITY4 :Int32u;
begin
     Result := $5986f054;
end;

function TRandom64SMT607.GetSFMT_IDSTR :String;
begin
     Result := 'SFMT-607:2-15-3-13-3:fdff37ff-ef7f3f7d-ff777b7d-7ff7fb2f';
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■