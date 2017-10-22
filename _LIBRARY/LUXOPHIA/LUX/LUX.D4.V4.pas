unit LUX.D4.V4;

interface //#################################################################### ■

uses LUX, LUX.D1, LUX.D2, LUX.D3, LUX.D4;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingle4DV4

     TSingle4DV4 = record
     private
       ///// アクセス
       function GetV( const I_:Integer ) :TSingle4D; inline;
       procedure SetV( const I_:Integer; const V_:TSingle4D ); inline;
     public
       ///// プロパティ
       property V[ const I_:Integer ] :TSingle4D read GetV write SetV; default;
     case Integer of
      0:( _ :array [ 1..4 ] of TSingle4D; );
      1:( _1, _2, _3, _4 :TSingle4D;      );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDouble4DV4

     TDouble4DV4 = record
     private
       ///// アクセス
       function GetV( const I_:Integer ) :TDouble4D; inline;
       procedure SetV( const I_:Integer; const V_:TDouble4D ); inline;
     public
       ///// プロパティ
       property V[ const I_:Integer ] :TDouble4D read GetV write SetV; default;
     case Integer of
      0:( _ :array [ 1..4 ] of TDouble4D; );
      1:( _1, _2, _3, _4 :TDouble4D;      );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdSingle4DV4

     TdSingle4DV4 = record
     private
       ///// アクセス
       function GetV( const I_:Integer ) :TdSingle4D; inline;
       procedure SetV( const I_:Integer; const V_:TdSingle4D ); inline;
     public
       ///// プロパティ
       property V[ const I_:Integer ] :TdSingle4D read GetV write SetV; default;
     case Integer of
      0:( _ :array [ 1..4 ] of TdSingle4D; );
      1:( _1, _2, _3, _4 :TdSingle4D;      );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdDouble4DV4

     TdDouble4DV4 = record
     private
       ///// アクセス
       function GetV( const I_:Integer ) :TdDouble4D; inline;
       procedure SetV( const I_:Integer; const V_:TdDouble4D ); inline;
     public
       ///// プロパティ
       property V[ const I_:Integer ] :TdDouble4D read GetV write SetV; default;
     case Integer of
      0:( _ :array [ 1..4 ] of TdDouble4D; );
      1:( _1, _2, _3, _4 :TdDouble4D;      );
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingle4DV4

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TSingle4DV4.GetV( const I_:Integer ) :TSingle4D;
begin
     Result := _[ I_ ];
end;

procedure TSingle4DV4.SetV( const I_:Integer; const V_:TSingle4D );
begin
     _[ I_ ] := V_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDouble4DV4

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TDouble4DV4.GetV( const I_:Integer ) :TDouble4D;
begin
     Result := _[ I_ ];
end;

procedure TDouble4DV4.SetV( const I_:Integer; const V_:TDouble4D );
begin
     _[ I_ ] := V_;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdSingle4DV4

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TdSingle4DV4.GetV( const I_:Integer ) :TdSingle4D;
begin
     Result := _[ I_ ];
end;

procedure TdSingle4DV4.SetV( const I_:Integer; const V_:TdSingle4D );
begin
     _[ I_ ] := V_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdDouble4DV4

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TdDouble4DV4.GetV( const I_:Integer ) :TdDouble4D;
begin
     Result := _[ I_ ];
end;

procedure TdDouble4DV4.SetV( const I_:Integer; const V_:TdDouble4D );
begin
     _[ I_ ] := V_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■