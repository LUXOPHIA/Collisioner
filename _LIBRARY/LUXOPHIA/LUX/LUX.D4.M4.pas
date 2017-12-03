unit LUX.D4.M4;

interface //#################################################################### ■

uses LUX, LUX.D1, LUX.D2, LUX.D3, LUX.D4;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingle4DM4

     TSingle4DM4 = record
     private
       ///// アクセス
       function GetM( const Y_,X_:Integer ) :TSingle4D; inline;
       procedure SetM( const Y_,X_:Integer; const M_:TSingle4D ); inline;
     public
       ///// プロパティ
       property M[ const Y_,X_:Integer ] :TSingle4D read GetM write SetM; default;
     case Integer of
      0:( _ :array [ 1..4, 1..4 ] of TSingle4D; );
      1:( _11, _12, _13, _14,
          _21, _22, _23, _24,
          _31, _32, _33, _34,
          _41, _42, _43, _44 :TSingle4D;        );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDouble4DM4

     TDouble4DM4 = record
     private
       ///// アクセス
       function GetM( const Y_,X_:Integer ) :TDouble4D; inline;
       procedure SetM( const Y_,X_:Integer; const M_:TDouble4D ); inline;
     public
       ///// プロパティ
       property M[ const Y_,X_:Integer ] :TDouble4D read GetM write SetM; default;
     case Integer of
      0:( _ :array [ 1..4, 1..4 ] of TDouble4D; );
      1:( _11, _12, _13, _14,
          _21, _22, _23, _24,
          _31, _32, _33, _34,
          _41, _42, _43, _44 :TDouble4D;        );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdSingle4DM4

     TdSingle4DM4 = record
     private
       ///// アクセス
       function GetM( const Y_,X_:Integer ) :TdSingle4D; inline;
       procedure SetM( const Y_,X_:Integer; const M_:TdSingle4D ); inline;
     public
       ///// プロパティ
       property M[ const Y_,X_:Integer ] :TdSingle4D read GetM write SetM; default;
       ///// 型変換
       class operator Implicit( const M_:TSingle4DM4 ) :TdSingle4DM4; inline;
       class operator Explicit( const M_:TdSingle4DM4 ) :TSingle4DM4; inline;
     case Integer of
      0:( _ :array [ 1..4, 1..4 ] of TdSingle4D; );
      1:( _11, _12, _13, _14,
          _21, _22, _23, _24,
          _31, _32, _33, _34,
          _41, _42, _43, _44 :TdSingle4D;        );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdDouble4DM4

     TdDouble4DM4 = record
     private
       ///// アクセス
       function GetM( const Y_,X_:Integer ) :TdDouble4D; inline;
       procedure SetM( const Y_,X_:Integer; const M_:TdDouble4D ); inline;
     public
       ///// プロパティ
       property M[ const Y_,X_:Integer ] :TdDouble4D read GetM write SetM; default;
       ///// 型変換
       class operator Implicit( const M_:TDouble4DM4 ) :TdDouble4DM4; inline;
       class operator Explicit( const M_:TdDouble4DM4 ) :TDouble4DM4; inline;
     case Integer of
      0:( _ :array [ 1..4, 1..4 ] of TdDouble4D; );
      1:( _11, _12, _13, _14,
          _21, _22, _23, _24,
          _31, _32, _33, _34,
          _41, _42, _43, _44 :TdDouble4D;        );
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingle4DM4

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TSingle4DM4.GetM( const Y_,X_:Integer ) :TSingle4D;
begin
     Result := _[ Y_, X_ ];
end;

procedure TSingle4DM4.SetM( const Y_,X_:Integer; const M_:TSingle4D );
begin
     _[ Y_, X_ ] := M_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDouble4DM4

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TDouble4DM4.GetM( const Y_,X_:Integer ) :TDouble4D;
begin
     Result := _[ Y_, X_ ];
end;

procedure TDouble4DM4.SetM( const Y_,X_:Integer; const M_:TDouble4D );
begin
     _[ Y_, X_ ] := M_;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdSingle4DM4

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TdSingle4DM4.GetM( const Y_,X_:Integer ) :TdSingle4D;
begin
     Result := _[ Y_, X_ ];
end;

procedure TdSingle4DM4.SetM( const Y_,X_:Integer; const M_:TdSingle4D );
begin
     _[ Y_, X_ ] := M_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

///////////////////////////////////////////////////////////////////////// 型変換

class operator TdSingle4DM4.Implicit( const M_:TSingle4DM4 ) :TdSingle4DM4;
begin
     with Result  do
     begin
          _11 := M_._11;  _12 := M_._12;  _13 := M_._13;  _14 := M_._14;
          _21 := M_._21;  _22 := M_._22;  _23 := M_._23;  _24 := M_._24;
          _31 := M_._31;  _32 := M_._32;  _33 := M_._33;  _34 := M_._34;
          _41 := M_._41;  _42 := M_._42;  _43 := M_._43;  _44 := M_._44;
     end;
end;

class operator TdSingle4DM4.Explicit( const M_:TdSingle4DM4 ) :TSingle4DM4;
begin
     with Result  do
     begin
          _11 := M_._11;  _12 := M_._12;  _13 := M_._13;  _14 := M_._14;
          _21 := M_._21;  _22 := M_._22;  _23 := M_._23;  _24 := M_._24;
          _31 := M_._31;  _32 := M_._32;  _33 := M_._33;  _34 := M_._34;
          _41 := M_._41;  _42 := M_._42;  _43 := M_._43;  _44 := M_._44;
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdDouble4DM4

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TdDouble4DM4.GetM( const Y_,X_:Integer ) :TdDouble4D;
begin
     Result := _[ Y_, X_ ];
end;

procedure TdDouble4DM4.SetM( const Y_,X_:Integer; const M_:TdDouble4D );
begin
     _[ Y_, X_ ] := M_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

///////////////////////////////////////////////////////////////////////// 型変換

class operator TdDouble4DM4.Implicit( const M_:TDouble4DM4 ) :TdDouble4DM4;
begin
     with Result  do
     begin
          _11 := M_._11;  _12 := M_._12;  _13 := M_._13;  _14 := M_._14;
          _21 := M_._21;  _22 := M_._22;  _23 := M_._23;  _24 := M_._24;
          _31 := M_._31;  _32 := M_._32;  _33 := M_._33;  _34 := M_._34;
          _41 := M_._41;  _42 := M_._42;  _43 := M_._43;  _44 := M_._44;
     end;
end;

class operator TdDouble4DM4.Explicit( const M_:TdDouble4DM4 ) :TDouble4DM4;
begin
     with Result  do
     begin
          _11 := M_._11;  _12 := M_._12;  _13 := M_._13;  _14 := M_._14;
          _21 := M_._21;  _22 := M_._22;  _23 := M_._23;  _24 := M_._24;
          _31 := M_._31;  _32 := M_._32;  _33 := M_._33;  _34 := M_._34;
          _41 := M_._41;  _42 := M_._42;  _43 := M_._43;  _44 := M_._44;
     end;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■