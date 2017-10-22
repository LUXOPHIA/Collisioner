unit LUX.D3.V4;

interface //#################################################################### ■

uses LUX, LUX.D1, LUX.D2, LUX.D3;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingle3DV4

     TSingle3DV4 = record
     private
       ///// アクセス
       function GetV( const I_:Integer ) :TSingle3D; inline;
       procedure SetV( const I_:Integer; const V_:TSingle3D ); inline;
     public
       ///// プロパティ
       property V[ const I_:Integer ] :TSingle3D read GetV write SetV; default;
     case Integer of
      0:( _ :array [ 1..4 ] of TSingle3D; );
      1:( _1, _2, _3, _4 :TSingle3D;      );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDouble3DV4

     TDouble3DV4 = record
     private
       ///// アクセス
       function GetV( const I_:Integer ) :TDouble3D; inline;
       procedure SetV( const I_:Integer; const V_:TDouble3D ); inline;
     public
       ///// プロパティ
       property V[ const I_:Integer ] :TDouble3D read GetV write SetV; default;
     case Integer of
      0:( _ :array [ 1..4 ] of TDouble3D; );
      1:( _1, _2, _3, _4 :TDouble3D;      );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdSingle3DV4

     TdSingle3DV4 = record
     private
       ///// アクセス
       function GetV( const I_:Integer ) :TdSingle3D; inline;
       procedure SetV( const I_:Integer; const V_:TdSingle3D ); inline;
     public
       ///// プロパティ
       property V[ const I_:Integer ] :TdSingle3D read GetV write SetV; default;
     case Integer of
      0:( _ :array [ 1..4 ] of TdSingle3D; );
      1:( _1, _2, _3, _4 :TdSingle3D;      );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdDouble3DV4

     TdDouble3DV4 = record
     private
       ///// アクセス
       function GetV( const I_:Integer ) :TdDouble3D; inline;
       procedure SetV( const I_:Integer; const V_:TdDouble3D ); inline;
     public
       ///// プロパティ
       property V[ const I_:Integer ] :TdDouble3D read GetV write SetV; default;
     case Integer of
      0:( _ :array [ 1..4 ] of TdDouble3D; );
      1:( _1, _2, _3, _4 :TdDouble3D;      );
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingle3DV4

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TSingle3DV4.GetV( const I_:Integer ) :TSingle3D;
begin
     Result := _[ I_ ];
end;

procedure TSingle3DV4.SetV( const I_:Integer; const V_:TSingle3D );
begin
     _[ I_ ] := V_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDouble3DV4

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TDouble3DV4.GetV( const I_:Integer ) :TDouble3D;
begin
     Result := _[ I_ ];
end;

procedure TDouble3DV4.SetV( const I_:Integer; const V_:TDouble3D );
begin
     _[ I_ ] := V_;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdSingle3DV4

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TdSingle3DV4.GetV( const I_:Integer ) :TdSingle3D;
begin
     Result := _[ I_ ];
end;

procedure TdSingle3DV4.SetV( const I_:Integer; const V_:TdSingle3D );
begin
     _[ I_ ] := V_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdDouble3DV4

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TdDouble3DV4.GetV( const I_:Integer ) :TdDouble3D;
begin
     Result := _[ I_ ];
end;

procedure TdDouble3DV4.SetV( const I_:Integer; const V_:TdDouble3D );
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