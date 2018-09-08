unit LUX.Random.SFMT.P132049;

interface //#################################################################### ■

uses LUX, LUX.D3, LUX.D4,
     LUX.Random,
     LUX.Random.SFMT;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32SMT132049

     TRandom32SMT132049 = class( TRandom32SMT )
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

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64SMT132049

     TRandom64SMT132049 = class( TRandom64SMT )
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

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom32SMT132049

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

function TRandom32SMT132049.GetSFMT_MEXP :Int32s;
begin
     Result := 132049;
end;

function TRandom32SMT132049.GetSFMT_POS1 :Int32s;
begin
     Result := 110;
end;

function TRandom32SMT132049.GetSFMT_SL1 :Int32s;
begin
     Result := 19;
end;

function TRandom32SMT132049.GetSFMT_SL2 :Int32s;
begin
     Result := 1;
end;

function TRandom32SMT132049.GetSFMT_SR1 :Int32s;
begin
     Result := 21;
end;

function TRandom32SMT132049.GetSFMT_SR2 :Int32s;
begin
     Result := 1;
end;

function TRandom32SMT132049.GetSFMT_MSK1 :Int32u;
begin
     Result := $ffffbb5f;
end;

function TRandom32SMT132049.GetSFMT_MSK2 :Int32u;
begin
     Result := $fb6ebf95;
end;

function TRandom32SMT132049.GetSFMT_MSK3 :Int32u;
begin
     Result := $fffefffa;
end;

function TRandom32SMT132049.GetSFMT_MSK4 :Int32u;
begin
     Result := $cff77fff;
end;

function TRandom32SMT132049.GetSFMT_PARITY1 :Int32u;
begin
     Result := $00000001;
end;

function TRandom32SMT132049.GetSFMT_PARITY2 :Int32u;
begin
     Result := $00000000;
end;

function TRandom32SMT132049.GetSFMT_PARITY3 :Int32u;
begin
     Result := $cb520000;
end;

function TRandom32SMT132049.GetSFMT_PARITY4 :Int32u;
begin
     Result := $c7e91c7d;
end;

function TRandom32SMT132049.GetSFMT_IDSTR :String;
begin
     Result := 'SFMT-132049:110-19-1-21-1:ffffbb5f-fb6ebf95-fffefffa-cff77fff';
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64SMT132049

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

function TRandom64SMT132049.GetSFMT_MEXP :Int32s;
begin
     Result := 132049;
end;

function TRandom64SMT132049.GetSFMT_POS1 :Int32s;
begin
     Result := 110;
end;

function TRandom64SMT132049.GetSFMT_SL1 :Int32s;
begin
     Result := 19;
end;

function TRandom64SMT132049.GetSFMT_SL2 :Int32s;
begin
     Result := 1;
end;

function TRandom64SMT132049.GetSFMT_SR1 :Int32s;
begin
     Result := 21;
end;

function TRandom64SMT132049.GetSFMT_SR2 :Int32s;
begin
     Result := 1;
end;

function TRandom64SMT132049.GetSFMT_MSK1 :Int32u;
begin
     Result := $ffffbb5f;
end;

function TRandom64SMT132049.GetSFMT_MSK2 :Int32u;
begin
     Result := $fb6ebf95;
end;

function TRandom64SMT132049.GetSFMT_MSK3 :Int32u;
begin
     Result := $fffefffa;
end;

function TRandom64SMT132049.GetSFMT_MSK4 :Int32u;
begin
     Result := $cff77fff;
end;

function TRandom64SMT132049.GetSFMT_PARITY1 :Int32u;
begin
     Result := $00000001;
end;

function TRandom64SMT132049.GetSFMT_PARITY2 :Int32u;
begin
     Result := $00000000;
end;

function TRandom64SMT132049.GetSFMT_PARITY3 :Int32u;
begin
     Result := $cb520000;
end;

function TRandom64SMT132049.GetSFMT_PARITY4 :Int32u;
begin
     Result := $c7e91c7d;
end;

function TRandom64SMT132049.GetSFMT_IDSTR :String;
begin
     Result := 'SFMT-132049:110-19-1-21-1:ffffbb5f-fb6ebf95-fffefffa-cff77fff';
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■