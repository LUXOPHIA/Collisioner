unit LUX.D1.V4;

interface //#################################################################### ■

uses LUX, LUX.D1;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleV4

     TSingleV4 = record
     private
       ///// アクセス
       function GetV( const I_:Integer ) :Single;
       procedure SetV( const I_:Integer; const V_:Single );
     public
       ///// プロパティ
       property V[ const I_:Integer ] :Single read GetV write SetV; default;
     case Integer of
      0:( _ :array [ 1..4 ] of Single; );
      1:( _1, _2, _3, _4 :Single;      );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleV4

     TDoubleV4 = record
     private
       ///// アクセス
       function GetV( const I_:Integer ) :Double;
       procedure SetV( const I_:Integer; const V_:Double );
     public
       ///// プロパティ
       property V[ const I_:Integer ] :Double read GetV write SetV; default;
     case Integer of
      0:( _ :array [ 1..4 ] of Double; );
      1:( _1, _2, _3, _4 :Double;      );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdSingleV4

     TdSingleV4 = record
     private
       ///// アクセス
       function GetV( const I_:Integer ) :TdSingle;
       procedure SetV( const I_:Integer; const V_:TdSingle );
     public
       ///// プロパティ
       property V[ const I_:Integer ] :TdSingle read GetV write SetV; default;
     case Integer of
      0:( _ :array [ 1..4 ] of TdSingle; );
      1:( _1, _2, _3, _4 :TdSingle;      );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdDoubleV4

     TdDoubleV4 = record
     private
       ///// アクセス
       function GetV( const I_:Integer ) :TdDouble;
       procedure SetV( const I_:Integer; const V_:TdDouble );
     public
       ///// プロパティ
       property V[ const I_:Integer ] :TdDouble read GetV write SetV; default;
     case Integer of
      0:( _ :array [ 1..4 ] of TdDouble; );
      1:( _1, _2, _3, _4 :TdDouble;      );
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleV4

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TSingleV4.GetV( const I_:Integer ) :Single;
begin
     Result := _[ I_ ];
end;

procedure TSingleV4.SetV( const I_:Integer; const V_:Single );
begin
     _[ I_ ] := V_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleV4

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TDoubleV4.GetV( const I_:Integer ) :Double;
begin
     Result := _[ I_ ];
end;

procedure TDoubleV4.SetV( const I_:Integer; const V_:Double );
begin
     _[ I_ ] := V_;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdSingleV4

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TdSingleV4.GetV( const I_:Integer ) :TdSingle;
begin
     Result := _[ I_ ];
end;

procedure TdSingleV4.SetV( const I_:Integer; const V_:TdSingle );
begin
     _[ I_ ] := V_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdDoubleV4

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TdDoubleV4.GetV( const I_:Integer ) :TdDouble;
begin
     Result := _[ I_ ];
end;

procedure TdDoubleV4.SetV( const I_:Integer; const V_:TdDouble );
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