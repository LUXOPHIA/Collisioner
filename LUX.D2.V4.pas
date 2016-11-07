unit LUX.D2.V4;

interface //#################################################################### ■

uses LUX, LUX.D1, LUX.D2;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingle2DV4

     TSingle2DV4 = record
     private
       ///// アクセス
       function GetV( const I_:Integer ) :TSingle2D; inline;
       procedure SetV( const I_:Integer; const V_:TSingle2D ); inline;
     public
       ///// プロパティ
       property V[ const I_:Integer ] :TSingle2D read GetV write SetV; default;
     case Integer of
      0:( _ :array [ 1..4 ] of TSingle2D; );
      1:( _1, _2, _3, _4 :TSingle2D;      );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDouble2DV4

     TDouble2DV4 = record
     private
       ///// アクセス
       function GetV( const I_:Integer ) :TDouble2D; inline;
       procedure SetV( const I_:Integer; const V_:TDouble2D ); inline;
     public
       ///// プロパティ
       property V[ const I_:Integer ] :TDouble2D read GetV write SetV; default;
     case Integer of
      0:( _ :array [ 1..4 ] of TDouble2D; );
      1:( _1, _2, _3, _4 :TDouble2D;      );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdSingle2DV4

     TdSingle2DV4 = record
     private
       ///// アクセス
       function GetV( const I_:Integer ) :TdSingle2D; inline;
       procedure SetV( const I_:Integer; const V_:TdSingle2D ); inline;
     public
       ///// プロパティ
       property V[ const I_:Integer ] :TdSingle2D read GetV write SetV; default;
     case Integer of
      0:( _ :array [ 1..4 ] of TdSingle2D; );
      1:( _1, _2, _3, _4 :TdSingle2D;      );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdDouble2DV4

     TdDouble2DV4 = record
     private
       ///// アクセス
       function GetV( const I_:Integer ) :TdDouble2D; inline;
       procedure SetV( const I_:Integer; const V_:TdDouble2D ); inline;
     public
       ///// プロパティ
       property V[ const I_:Integer ] :TdDouble2D read GetV write SetV; default;
     case Integer of
      0:( _ :array [ 1..4 ] of TdDouble2D; );
      1:( _1, _2, _3, _4 :TdDouble2D;      );
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingle2DV4

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TSingle2DV4.GetV( const I_:Integer ) :TSingle2D;
begin
     Result := _[ I_ ];
end;

procedure TSingle2DV4.SetV( const I_:Integer; const V_:TSingle2D );
begin
     _[ I_ ] := V_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDouble2DV4

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TDouble2DV4.GetV( const I_:Integer ) :TDouble2D;
begin
     Result := _[ I_ ];
end;

procedure TDouble2DV4.SetV( const I_:Integer; const V_:TDouble2D );
begin
     _[ I_ ] := V_;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdSingle2DV4

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TdSingle2DV4.GetV( const I_:Integer ) :TdSingle2D;
begin
     Result := _[ I_ ];
end;

procedure TdSingle2DV4.SetV( const I_:Integer; const V_:TdSingle2D );
begin
     _[ I_ ] := V_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdDouble2DV4

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TdDouble2DV4.GetV( const I_:Integer ) :TdDouble2D;
begin
     Result := _[ I_ ];
end;

procedure TdDouble2DV4.SetV( const I_:Integer; const V_:TdDouble2D );
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