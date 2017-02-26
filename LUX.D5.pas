unit LUX.D5;

interface //#################################################################### ■

uses System.Math.Vectors,
     LUX, LUX.D1, LUX.D2, LUX.D3, LUX.D4;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingle5D

     TSingle5D = record
     private
       ///// アクセス
       function GetV( const I_:Integer ) :Single; inline;
       procedure SetV( const I_:Integer; const V_:Single ); inline;
       function GetSiz2 :Single; inline;
       procedure SetSiz2( const Siz2_:Single ); inline;
       function GetSize :Single; inline;
       procedure SetSize( const Size_:Single ); inline;
       function GetUnitor :TSingle5D; inline;
       procedure SetUnitor( const Unitor_:TSingle5D ); inline;
     public
       constructor Create( const V_:Single ); overload;
       constructor Create( const V1_,V2_,V3_,V4_,V5_:Single ); overload;
       ///// プロパティ
       property V[ const I_:Integer ] :Single    read GetV      write SetV     ; default;
       property Siz2                  :Single    read GetSiz2   write SetSiz2  ;
       property Size                  :Single    read GetSize   write SetSize  ;
       property Unitor                :TSingle5D read GetUnitor write SetUnitor;
       ///// 演算子
       class operator Negative( const V_:TSingle5D ) :TSingle5D;
       class operator Positive( const V_:TSingle5D ) :TSingle5D;
       class operator Add( const A_,B_:TSingle5D ) :TSingle5D;
       class operator Subtract( const A_,B_:TSingle5D ) :TSingle5D;
       class operator Multiply( const A_:TSingle5D; const B_:Single ) :TSingle5D;
       class operator Multiply( const A_:Single; const B_:TSingle5D ) :TSingle5D;
       class operator Divide( const A_:TSingle5D; const B_:Single ) :TSingle5D;
       ///// 型変換
       class operator Explicit( const V_:TSingle5D ) :TSingle2D; inline;
       class operator Explicit( const V_:TSingle5D ) :TSingle3D; inline;
       class operator Explicit( const V_:TSingle5D ) :TSingle4D; inline;
       ///// 定数
       class function Identity1 :TSingle5D; inline; static;
       class function Identity2 :TSingle5D; inline; static;
       class function Identity3 :TSingle5D; inline; static;
       class function Identity4 :TSingle5D; inline; static;
       class function Identity5 :TSingle5D; inline; static;
       ///// メソッド
       function VectorTo( const P_:TSingle5D ) :TSingle5D;
       function UnitorTo( const P_:TSingle5D ) :TSingle5D;
       function DistanTo( const P_:TSingle5D ) :Single;
       class function RandG :TSingle5D; static;
       class function RandBS1 :TSingle5D; static;
       class function RandBS2 :TSingle5D; static;
       class function RandBS4 :TSingle5D; static;
     case Integer of
      0:( _  :array [ 1..5 ] of Single );
      1:( _1 :Single;
          _2 :Single;
          _3 :Single;
          _4 :Single;
          _5 :Single;                  );
     end;

     TSinglePos5D = TSingle5D;
     TSingleVec5D = TSingle5D;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDouble5D

     TDouble5D = record
     private
       ///// アクセス
       function GetV( const I_:Integer ) :Double; inline;
       procedure SetV( const I_:Integer; const V_:Double ); inline;
       function GetSiz2 :Double; inline;
       procedure SetSiz2( const Siz2_:Double ); inline;
       function GetSize :Double; inline;
       procedure SetSize( const Size_:Double ); inline;
       function GetUnitor :TDouble5D; inline;
       procedure SetUnitor( const Unitor_:TDouble5D ); inline;
     public
       constructor Create( const V_:Double ); overload;
       constructor Create( const V1_,V2_,V3_,V4_,V5_:Double ); overload;
       ///// プロパティ
       property V[ const I_:Integer ] :Double    read GetV      write SetV     ; default;
       property Siz2                  :Double    read GetSiz2   write SetSiz2  ;
       property Size                  :Double    read GetSize   write SetSize  ;
       property Unitor                :TDouble5D read GetUnitor write SetUnitor;
       ///// 演算子
       class operator Negative( const V_:TDouble5D ) :TDouble5D;
       class operator Positive( const V_:TDouble5D ) :TDouble5D;
       class operator Add( const A_,B_:TDouble5D ) :TDouble5D;
       class operator Subtract( const A_,B_:TDouble5D ) :TDouble5D;
       class operator Multiply( const A_:TDouble5D; const B_:Double ) :TDouble5D;
       class operator Multiply( const A_:Double; const B_:TDouble5D ) :TDouble5D;
       class operator Divide( const A_:TDouble5D; const B_:Double ) :TDouble5D;
       ///// 型変換
       class operator Explicit( const V_:TDouble5D ) :TDouble2D; inline;
       class operator Explicit( const V_:TDouble5D ) :TDouble3D; inline;
       class operator Explicit( const V_:TDouble5D ) :TDouble4D; inline;
       ///// 定数
       class function Identity1 :TDouble5D; inline; static;
       class function Identity2 :TDouble5D; inline; static;
       class function Identity3 :TDouble5D; inline; static;
       class function Identity4 :TDouble5D; inline; static;
       class function Identity5 :TDouble5D; inline; static;
       ///// メソッド
       function VectorTo( const P_:TDouble5D ) :TDouble5D;
       function UnitorTo( const P_:TDouble5D ) :TDouble5D;
       function DistanTo( const P_:TDouble5D ) :Double;
       class function RandG :TDouble5D; static;
       class function RandBS1 :TDouble5D; static;
       class function RandBS2 :TDouble5D; static;
       class function RandBS4 :TDouble5D; static;
     case Integer of
      0:( _  :array [ 1..5 ] of Double );
      1:( _1 :Double;
          _2 :Double;
          _3 :Double;
          _4 :Double;
          _5 :Double;                  );
     end;

     TDoublePos5D = TDouble5D;
     TDoubleVec5D = TDouble5D;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdSingle5D

     TdSingle5D = record
     private
       ///// アクセス
       function GetV( const I_:Integer ) :TdSingle; inline;
       procedure SetV( const I_:Integer; const V_:TdSingle ); inline;
       function Geto :TSingle5D; inline;
       procedure Seto( const o_:TSingle5D ); inline;
       function Getd :TSingle5D; inline;
       procedure Setd( const d_:TSingle5D ); inline;
       function GetSiz2 :TdSingle; inline;
       procedure SetSiz2( const Siz2_:TdSingle ); inline;
       function GetSize :TdSingle; inline;
       procedure SetSize( const Size_:TdSingle ); inline;
       function GetUnitor :TdSingle5D; inline;
       procedure SetUnitor( const Unitor_:TdSingle5D ); inline;
     public
       constructor Create( const V1_,V2_,V3_,V4_,V5_:TdSingle );
       ///// プロパティ
       property V[ const I_:Integer ] :TdSingle   read GetV      write SetV     ; default;
       property o                     :TSingle5D  read Geto      write Seto     ;
       property d                     :TSingle5D  read Getd      write Setd     ;
       property Siz2                  :TdSingle   read GetSiz2   write SetSiz2  ;
       property Size                  :TdSingle   read GetSize   write SetSize  ;
       property Unitor                :TdSingle5D read GetUnitor write SetUnitor;
       ///// 演算子
       class operator Negative( const V_:TdSingle5D ) :TdSingle5D; inline;
       class operator Positive( const V_:TdSingle5D ) :TdSingle5D; inline;
       class operator Add( const A_,B_:TdSingle5D ) :TdSingle5D; inline;
       class operator Subtract( const A_,B_:TdSingle5D ) :TdSingle5D; inline;
       class operator Multiply( const A_:TdSingle5D; const B_:TdSingle ) :TdSingle5D; inline;
       class operator Multiply( const A_:TdSingle; const B_:TdSingle5D ) :TdSingle5D; inline;
       class operator Divide( const A_:TdSingle5D; const B_:TdSingle ) :TdSingle5D; inline;
       ///// 型変換
       class operator Implicit( const V_:TSingle5D ) :TdSingle5D;
       class operator Implicit( const V_:TdSingle5D ) :TSingle5D;
     case Integer of
      0:( _  :array [ 1..5 ] of TdSingle );
      1:( _1 :TdSingle;
          _2 :TdSingle;
          _3 :TdSingle;
          _4 :TdSingle;
          _5 :TdSingle;                  );
     end;

     TdSinglePos5D = TdSingle5D;
     TdSingleVec5D = TdSingle5D;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdDouble5D

     TdDouble5D = record
     private
       ///// アクセス
       function GetV( const I_:Integer ) :TdDouble; inline;
       procedure SetV( const I_:Integer; const V_:TdDouble ); inline;
       function Geto :TDouble5D; inline;
       procedure Seto( const o_:TDouble5D ); inline;
       function Getd :TDouble5D; inline;
       procedure Setd( const d_:TDouble5D ); inline;
       function GetSiz2 :TdDouble; inline;
       procedure SetSiz2( const Siz2_:TdDouble ); inline;
       function GetSize :TdDouble; inline;
       procedure SetSize( const Size_:TdDouble ); inline;
       function GetUnitor :TdDouble5D; inline;
       procedure SetUnitor( const Unitor_:TdDouble5D ); inline;
     public
       constructor Create( const V1_,V2_,V3_,V4_,V5_:TdDouble );
       ///// プロパティ
       property V[ const I_:Integer ] :TdDouble   read GetV      write SetV     ; default;
       property o                     :TDouble5D  read Geto      write Seto     ;
       property d                     :TDouble5D  read Getd      write Setd     ;
       property Siz2                  :TdDouble   read GetSiz2   write SetSiz2  ;
       property Size                  :TdDouble   read GetSize   write SetSize  ;
       property Unitor                :TdDouble5D read GetUnitor write SetUnitor;
       ///// 演算子
       class operator Negative( const V_:TdDouble5D ) :TdDouble5D; inline;
       class operator Positive( const V_:TdDouble5D ) :TdDouble5D; inline;
       class operator Add( const A_,B_:TdDouble5D ) :TdDouble5D; inline;
       class operator Subtract( const A_,B_:TdDouble5D ) :TdDouble5D; inline;
       class operator Multiply( const A_:TdDouble5D; const B_:TdDouble ) :TdDouble5D; inline;
       class operator Multiply( const A_:TdDouble; const B_:TdDouble5D ) :TdDouble5D; inline;
       class operator Divide( const A_:TdDouble5D; const B_:TdDouble ) :TdDouble5D; inline;
       ///// 型変換
       class operator Implicit( const V_:TDouble5D ) :TdDouble5D;
       class operator Implicit( const V_:TdDouble5D ) :TDouble5D;
     case Integer of
      0:( _  :array [ 1..5 ] of TdDouble );
      1:( _1 :TdDouble;
          _2 :TdDouble;
          _3 :TdDouble;
          _4 :TdDouble;
          _5 :TdDouble;                  );
     end;

     TdDoublePos5D = TdDouble5D;
     TdDoubleVec5D = TdDouble5D;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function DotProduct( const A_,B_:TSingleVec5D ) :Single; inline; overload;
function DotProduct( const A_,B_:TDoubleVec5D ) :Double; inline; overload;
function DotProduct( const A_,B_:TdSingleVec5D ) :TdSingle; inline; overload;
function DotProduct( const A_,B_:TdDoubleVec5D ) :TdDouble; inline; overload;

function Dista2( const A_,B_:TSinglePos5D ) :Single; inline; overload;
function Dista2( const A_,B_:TDoublePos5D ) :Double; inline; overload;
function Dista2( const A_,B_:TdSinglePos5D ) :TdSingle; inline; overload;
function Dista2( const A_,B_:TdDoublePos5D ) :TdDouble; inline; overload;

function Distan( const A_,B_:TSinglePos5D ) :Single; inline; overload;
function Distan( const A_,B_:TDoublePos5D ) :Double; inline; overload;
function Distan( const A_,B_:TdSinglePos5D ) :TdSingle; inline; overload;
function Distan( const A_,B_:TdDoublePos5D ) :TdDouble; inline; overload;

function Ave( const P1_,P2_:TSingle5D ) :TSingle5D; inline; overload;
function Ave( const P1_,P2_:TDouble5D ) :TDouble5D; inline; overload;
function Ave( const P1_,P2_:TdSingle5D ) :TdSingle5D; inline; overload;
function Ave( const P1_,P2_:TdDouble5D ) :TdDouble5D; inline; overload;

function Ave( const P1_,P2_,P3_:TSingle5D ) :TSingle5D; inline; overload;
function Ave( const P1_,P2_,P3_:TDouble5D ) :TDouble5D; inline; overload;
function Ave( const P1_,P2_,P3_:TdSingle5D ) :TdSingle5D; inline; overload;
function Ave( const P1_,P2_,P3_:TdDouble5D ) :TdDouble5D; inline; overload;

function Ave( const P1_,P2_,P3_,P4_:TSingle5D ) :TSingle5D; inline; overload;
function Ave( const P1_,P2_,P3_,P4_:TDouble5D ) :TDouble5D; inline; overload;
function Ave( const P1_,P2_,P3_,P4_:TdSingle5D ) :TdSingle5D; inline; overload;
function Ave( const P1_,P2_,P3_,P4_:TdDouble5D ) :TdDouble5D; inline; overload;

function PolySolveReal( const Ks_:TSingle5D; out Xs_:TSingle4D ) :Byte; overload;
function PolySolveReal( const Ks_:TDouble5D; out Xs_:TDouble4D ) :Byte; overload;

implementation //############################################################### ■

uses System.SysUtils, System.Math;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingle5D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TSingle5D.GetV( const I_:Integer ) :Single;
begin
     Result := _[ I_ ];
end;

procedure TSingle5D.SetV( const I_:Integer; const V_:Single );
begin
     _[ I_ ] := V_;
end;

//------------------------------------------------------------------------------

function TSingle5D.GetSiz2 :Single;
begin
     Result := Pow2( _1 ) + Pow2( _2 ) + Pow2( _3 ) + Pow2( _4 ) + Pow2( _5 );
end;

procedure TSingle5D.SetSiz2( const Siz2_:Single );
begin
     Self := Roo2( Siz2_ / Siz2 ) * Self;
end;

function TSingle5D.GetSize :Single;
begin
     Result := Roo2( GetSiz2 );
end;

procedure TSingle5D.SetSize( const Size_:Single );
begin
     Self := Size_ * Unitor;
end;

function TSingle5D.GetUnitor :TSingle5D;
begin
     Result := Self / Size;
end;

procedure TSingle5D.SetUnitor( const Unitor_:TSingle5D );
begin
     Self := Size * Unitor_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TSingle5D.Create( const V_:Single );
begin
     _1 := V_;
     _2 := V_;
     _3 := V_;
     _4 := V_;
     _5 := V_;
end;

constructor TSingle5D.Create( const V1_,V2_,V3_,V4_,V5_:Single );
begin
     _1 := V1_;
     _2 := V2_;
     _3 := V3_;
     _4 := V4_;
     _5 := V5_;
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TSingle5D.Negative( const V_:TSingle5D ) :TSingle5D;
begin
     with Result do
     begin
          _1 := -V_._1;
          _2 := -V_._2;
          _3 := -V_._3;
          _4 := -V_._4;
          _5 := -V_._5;
     end;
end;

class operator TSingle5D.Positive( const V_:TSingle5D ) :TSingle5D;
begin
     with Result do
     begin
          _1 := +V_._1;
          _2 := +V_._2;
          _3 := +V_._3;
          _4 := +V_._4;
          _5 := +V_._5;
     end;
end;

class operator TSingle5D.Add( const A_,B_:TSingle5D ) :TSingle5D;
begin
     with Result do
     begin
          _1 := A_._1 + B_._1;
          _2 := A_._2 + B_._2;
          _3 := A_._3 + B_._3;
          _4 := A_._4 + B_._4;
          _5 := A_._5 + B_._5;
     end;
end;

class operator TSingle5D.Subtract( const A_,B_:TSingle5D ) :TSingle5D;
begin
     with Result do
     begin
          _1 := A_._1 - B_._1;
          _2 := A_._2 - B_._2;
          _3 := A_._3 - B_._3;
          _4 := A_._4 - B_._4;
          _5 := A_._5 - B_._5;
     end;
end;

class operator TSingle5D.Multiply( const A_:TSingle5D; const B_:Single ) :TSingle5D;
begin
     with Result do
     begin
          _1 := A_._1 * B_;
          _2 := A_._2 * B_;
          _3 := A_._3 * B_;
          _4 := A_._4 * B_;
          _5 := A_._5 * B_;
     end;
end;

class operator TSingle5D.Multiply( const A_:Single; const B_:TSingle5D ) :TSingle5D;
begin
     with Result do
     begin
          _1 := A_ * B_._1;
          _2 := A_ * B_._2;
          _3 := A_ * B_._3;
          _4 := A_ * B_._4;
          _5 := A_ * B_._5;
     end;
end;

class operator TSingle5D.Divide( const A_:TSingle5D; const B_:Single ) :TSingle5D;
begin
     with Result do
     begin
          _1 := A_._1 / B_;
          _2 := A_._2 / B_;
          _3 := A_._3 / B_;
          _4 := A_._4 / B_;
          _5 := A_._5 / B_;
     end;
end;

///////////////////////////////////////////////////////////////////////// 型変換

class operator TSingle5D.Explicit( const V_:TSingle5D ) :TSingle2D;
begin
     with Result do
     begin
          _1 := V_._1;
          _2 := V_._2;
     end;
end;

class operator TSingle5D.Explicit( const V_:TSingle5D ) :TSingle3D;
begin
     with Result do
     begin
          _1 := V_._1;
          _2 := V_._2;
          _3 := V_._3;
     end;
end;

class operator TSingle5D.Explicit( const V_:TSingle5D ) :TSingle4D;
begin
     with Result do
     begin
          _1 := V_._1;
          _2 := V_._2;
          _3 := V_._3;
          _4 := V_._4;
     end;
end;

/////////////////////////////////////////////////////////////////////////// 定数

class function TSingle5D.Identity1 :TSingle5D;
begin
     with Result do
     begin
          _1 := 1;
          _2 := 0;
          _3 := 0;
          _4 := 0;
          _5 := 0;
     end;
end;

class function TSingle5D.Identity2 :TSingle5D;
begin
     with Result do
     begin
          _1 := 0;
          _2 := 1;
          _3 := 0;
          _4 := 0;
          _5 := 0;
     end;
end;

class function TSingle5D.Identity3 :TSingle5D;
begin
     with Result do
     begin
          _1 := 0;
          _2 := 0;
          _3 := 1;
          _4 := 0;
          _5 := 0;
     end;
end;

class function TSingle5D.Identity4 :TSingle5D;
begin
     with Result do
     begin
          _1 := 0;
          _2 := 0;
          _3 := 0;
          _4 := 1;
          _5 := 0;
     end;
end;

class function TSingle5D.Identity5 :TSingle5D;
begin
     with Result do
     begin
          _1 := 0;
          _2 := 0;
          _3 := 0;
          _4 := 0;
          _5 := 1;
     end;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TSingle5D.VectorTo( const P_:TSingle5D ) :TSingle5D;
begin
     Result := P_ - Self;
end;

function TSingle5D.UnitorTo( const P_:TSingle5D ) :TSingle5D;
begin
     Result := VectorTo( P_ ).Unitor;
end;

function TSingle5D.DistanTo( const P_:TSingle5D ) :Single;
begin
     Result := VectorTo( P_ ).Size;
end;

//------------------------------------------------------------------------------

class function TSingle5D.RandG :TSingle5D;
begin
     with Result do
     begin
          _1 := System.Math.RandG( 0, 1 );
          _2 := System.Math.RandG( 0, 1 );
          _3 := System.Math.RandG( 0, 1 );
          _4 := System.Math.RandG( 0, 1 );
          _5 := System.Math.RandG( 0, 1 );
     end;
end;

//------------------------------------------------------------------------------

class function TSingle5D.RandBS1 :TSingle5D;
begin
     with Result do
     begin
          _1 := TSingle.RandBS1;
          _2 := TSingle.RandBS1;
          _3 := TSingle.RandBS1;
          _4 := TSingle.RandBS1;
          _5 := TSingle.RandBS1;
     end;
end;

class function TSingle5D.RandBS2 :TSingle5D;
begin
     with Result do
     begin
          _1 := TSingle.RandBS2;
          _2 := TSingle.RandBS2;
          _3 := TSingle.RandBS2;
          _4 := TSingle.RandBS2;
          _5 := TSingle.RandBS2;
     end;
end;

class function TSingle5D.RandBS4 :TSingle5D;
begin
     with Result do
     begin
          _1 := TSingle.RandBS4;
          _2 := TSingle.RandBS4;
          _3 := TSingle.RandBS4;
          _4 := TSingle.RandBS4;
          _5 := TSingle.RandBS4;
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDouble5D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TDouble5D.GetV( const I_:Integer ) :Double;
begin
     Result := _[ I_ ];
end;

procedure TDouble5D.SetV( const I_:Integer; const V_:Double );
begin
     _[ I_ ] := V_;
end;

//------------------------------------------------------------------------------

function TDouble5D.GetSiz2 :Double;
begin
     Result := Pow2( _1 ) + Pow2( _2 ) + Pow2( _3 ) + Pow2( _4 ) + Pow2( _5 );
end;

procedure TDouble5D.SetSiz2( const Siz2_:Double );
begin
     Self := Roo2( Siz2_ / Siz2 ) * Self;
end;

function TDouble5D.GetSize :Double;
begin
     Result := Roo2( GetSiz2 );
end;

procedure TDouble5D.SetSize( const Size_:Double );
begin
     Self := Size_ * Unitor;
end;

function TDouble5D.GetUnitor :TDouble5D;
begin
     Result := Self / Size;
end;

procedure TDouble5D.SetUnitor( const Unitor_:TDouble5D );
begin
     Self := Size * Unitor_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TDouble5D.Create( const V_:Double );
begin
     _1 := V_;
     _2 := V_;
     _3 := V_;
     _4 := V_;
     _5 := V_;
end;

constructor TDouble5D.Create( const V1_,V2_,V3_,V4_,V5_:Double );
begin
     _1 := V1_;
     _2 := V2_;
     _3 := V3_;
     _4 := V4_;
     _5 := V5_;
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TDouble5D.Negative( const V_:TDouble5D ) :TDouble5D;
begin
     with Result do
     begin
          _1 := -V_._1;
          _2 := -V_._2;
          _3 := -V_._3;
          _4 := -V_._4;
          _5 := -V_._5;
     end;
end;

class operator TDouble5D.Positive( const V_:TDouble5D ) :TDouble5D;
begin
     with Result do
     begin
          _1 := +V_._1;
          _2 := +V_._2;
          _3 := +V_._3;
          _4 := +V_._4;
          _5 := +V_._5;
     end;
end;

class operator TDouble5D.Add( const A_,B_:TDouble5D ) :TDouble5D;
begin
     with Result do
     begin
          _1 := A_._1 + B_._1;
          _2 := A_._2 + B_._2;
          _3 := A_._3 + B_._3;
          _4 := A_._4 + B_._4;
          _5 := A_._5 + B_._5;
     end;
end;

class operator TDouble5D.Subtract( const A_,B_:TDouble5D ) :TDouble5D;
begin
     with Result do
     begin
          _1 := A_._1 - B_._1;
          _2 := A_._2 - B_._2;
          _3 := A_._3 - B_._3;
          _4 := A_._4 - B_._4;
          _5 := A_._5 - B_._5;
     end;
end;

class operator TDouble5D.Multiply( const A_:TDouble5D; const B_:Double ) :TDouble5D;
begin
     with Result do
     begin
          _1 := A_._1 * B_;
          _2 := A_._2 * B_;
          _3 := A_._3 * B_;
          _4 := A_._4 * B_;
          _5 := A_._5 * B_;
     end;
end;

class operator TDouble5D.Multiply( const A_:Double; const B_:TDouble5D ) :TDouble5D;
begin
     with Result do
     begin
          _1 := A_ * B_._1;
          _2 := A_ * B_._2;
          _3 := A_ * B_._3;
          _4 := A_ * B_._4;
          _5 := A_ * B_._5;
     end;
end;

class operator TDouble5D.Divide( const A_:TDouble5D; const B_:Double ) :TDouble5D;
begin
     with Result do
     begin
          _1 := A_._1 / B_;
          _2 := A_._2 / B_;
          _3 := A_._3 / B_;
          _4 := A_._4 / B_;
          _5 := A_._5 / B_;
     end;
end;

///////////////////////////////////////////////////////////////////////// 型変換

class operator TDouble5D.Explicit( const V_:TDouble5D ) :TDouble2D;
begin
     with Result do
     begin
          _1 := V_._1;
          _2 := V_._2;
     end;
end;

class operator TDouble5D.Explicit( const V_:TDouble5D ) :TDouble3D;
begin
     with Result do
     begin
          _1 := V_._1;
          _2 := V_._2;
          _3 := V_._3;
     end;
end;

class operator TDouble5D.Explicit( const V_:TDouble5D ) :TDouble4D;
begin
     with Result do
     begin
          _1 := V_._1;
          _2 := V_._2;
          _3 := V_._3;
          _4 := V_._4;
     end;
end;

/////////////////////////////////////////////////////////////////////////// 定数

class function TDouble5D.Identity1 :TDouble5D;
begin
     with Result do
     begin
          _1 := 1;
          _2 := 0;
          _3 := 0;
          _4 := 0;
          _5 := 0;
     end;
end;

class function TDouble5D.Identity2 :TDouble5D;
begin
     with Result do
     begin
          _1 := 0;
          _2 := 1;
          _3 := 0;
          _4 := 0;
          _5 := 0;
     end;
end;

class function TDouble5D.Identity3 :TDouble5D;
begin
     with Result do
     begin
          _1 := 0;
          _2 := 0;
          _3 := 1;
          _4 := 0;
          _5 := 0;
     end;
end;

class function TDouble5D.Identity4 :TDouble5D;
begin
     with Result do
     begin
          _1 := 0;
          _2 := 0;
          _3 := 0;
          _4 := 1;
          _5 := 0;
     end;
end;

class function TDouble5D.Identity5 :TDouble5D;
begin
     with Result do
     begin
          _1 := 0;
          _2 := 0;
          _3 := 0;
          _4 := 0;
          _5 := 1;
     end;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TDouble5D.VectorTo( const P_:TDouble5D ) :TDouble5D;
begin
     Result := P_ - Self;
end;

function TDouble5D.UnitorTo( const P_:TDouble5D ) :TDouble5D;
begin
     Result := VectorTo( P_ ).Unitor;
end;

function TDouble5D.DistanTo( const P_:TDouble5D ) :Double;
begin
     Result := VectorTo( P_ ).Size;
end;

//------------------------------------------------------------------------------

class function TDouble5D.RandG :TDouble5D;
begin
     with Result do
     begin
          _1 := System.Math.RandG( 0, 1 );
          _2 := System.Math.RandG( 0, 1 );
          _3 := System.Math.RandG( 0, 1 );
          _4 := System.Math.RandG( 0, 1 );
          _5 := System.Math.RandG( 0, 1 );
     end;
end;

//------------------------------------------------------------------------------

class function TDouble5D.RandBS1 :TDouble5D;
begin
     with Result do
     begin
          _1 := TDouble.RandBS1;
          _2 := TDouble.RandBS1;
          _3 := TDouble.RandBS1;
          _4 := TDouble.RandBS1;
          _5 := TDouble.RandBS1;
     end;
end;

class function TDouble5D.RandBS2 :TDouble5D;
begin
     with Result do
     begin
          _1 := TDouble.RandBS2;
          _2 := TDouble.RandBS2;
          _3 := TDouble.RandBS2;
          _4 := TDouble.RandBS2;
          _5 := TDouble.RandBS2;
     end;
end;

class function TDouble5D.RandBS4 :TDouble5D;
begin
     with Result do
     begin
          _1 := TDouble.RandBS4;
          _2 := TDouble.RandBS4;
          _3 := TDouble.RandBS4;
          _4 := TDouble.RandBS4;
          _5 := TDouble.RandBS4;
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdSingle5D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TdSingle5D.GetV( const I_:Integer ) :TdSingle;
begin
     Result := _[ I_ ];
end;

procedure TdSingle5D.SetV( const I_:Integer; const V_:TdSingle );
begin
     _[ I_ ] := V_;
end;

//------------------------------------------------------------------------------

function TdSingle5D.Geto :TSingle5D;
begin
     Result._1 := _1.o;
     Result._2 := _2.o;
     Result._3 := _3.o;
     Result._4 := _4.o;
     Result._5 := _5.o;
end;

procedure TdSingle5D.Seto( const o_:TSingle5D );
begin
     _1.o := o_._1;
     _2.o := o_._2;
     _3.o := o_._3;
     _4.o := o_._4;
     _5.o := o_._5;
end;

function TdSingle5D.Getd :TSingle5D;
begin
     Result._1 := _1.d;
     Result._2 := _2.d;
     Result._3 := _3.d;
     Result._4 := _4.d;
     Result._5 := _5.d;
end;

procedure TdSingle5D.Setd( const d_:TSingle5D );
begin
     _1.d := d_._1;
     _2.d := d_._2;
     _3.d := d_._3;
     _4.d := d_._4;
     _5.d := d_._5;
end;

function TdSingle5D.GetSiz2 :TdSingle;
begin
     Result := Pow2( _1 ) + Pow2( _2 ) + Pow2( _3 ) + Pow2( _4 ) + Pow2( _5 );
end;

procedure TdSingle5D.SetSiz2( const Siz2_:TdSingle );
begin
     Self := Roo2( Siz2_ / Siz2 ) * Self;
end;

function TdSingle5D.GetSize :TdSingle;
begin
     Result := Roo2( Siz2 );
end;

procedure TdSingle5D.SetSize( const Size_:TdSingle );
begin
     Self := Size_ * Unitor;
end;

function TdSingle5D.GetUnitor :TdSingle5D;
begin
     Result := Self / Size;
end;

procedure TdSingle5D.SetUnitor( const Unitor_:TdSingle5D );
begin
     Self := Size * Unitor_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TdSingle5D.Create( const V1_,V2_,V3_,V4_,V5_:TdSingle );
begin
     _1 := V1_;
     _2 := V2_;
     _3 := V3_;
     _4 := V4_;
     _5 := V5_;
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TdSingle5D.Negative( const V_:TdSingle5D ) :TdSingle5D;
begin
     with Result do
     begin
          _1 := -V_._1;
          _2 := -V_._2;
          _3 := -V_._3;
          _4 := -V_._4;
          _5 := -V_._5;
     end;
end;

class operator TdSingle5D.Positive( const V_:TdSingle5D ) :TdSingle5D;
begin
     with Result do
     begin
          _1 := +V_._1;
          _2 := +V_._2;
          _3 := +V_._3;
          _4 := +V_._4;
          _5 := +V_._5;
     end;
end;

class operator TdSingle5D.Add( const A_,B_:TdSingle5D ) :TdSingle5D;
begin
     with Result do
     begin
          _1 := A_._1 + B_._1;
          _2 := A_._2 + B_._2;
          _3 := A_._3 + B_._3;
          _4 := A_._4 + B_._4;
          _5 := A_._5 + B_._5;
     end;
end;

class operator TdSingle5D.Subtract( const A_,B_:TdSingle5D ) :TdSingle5D;
begin
     with Result do
     begin
          _1 := A_._1 - B_._1;
          _2 := A_._2 - B_._2;
          _3 := A_._3 - B_._3;
          _4 := A_._4 - B_._4;
          _5 := A_._5 - B_._5;
     end;
end;

class operator TdSingle5D.Multiply( const A_:TdSingle5D; const B_:TdSingle ) :TdSingle5D;
begin
     with Result do
     begin
          _1 := A_._1 * B_;
          _2 := A_._2 * B_;
          _3 := A_._3 * B_;
          _4 := A_._4 * B_;
          _5 := A_._5 * B_;
     end;
end;

class operator TdSingle5D.Multiply( const A_:TdSingle; const B_:TdSingle5D ) :TdSingle5D;
begin
     with Result do
     begin
          _1 := A_ * B_._1;
          _2 := A_ * B_._2;
          _3 := A_ * B_._3;
          _4 := A_ * B_._4;
          _5 := A_ * B_._5;
     end;
end;

class operator TdSingle5D.Divide( const A_:TdSingle5D; const B_:TdSingle ) :TdSingle5D;
begin
     with Result do
     begin
          _1 := A_._1 / B_;
          _2 := A_._2 / B_;
          _3 := A_._3 / B_;
          _4 := A_._4 / B_;
          _5 := A_._5 / B_;
     end;
end;

///////////////////////////////////////////////////////////////////////// 型変換

class operator TdSingle5D.Implicit( const V_:TSingle5D ) :TdSingle5D;
const
     _d :TSingle5D = ( _1:0; _2:0; _3:0; _4:0; _5:0 );
begin
     with Result do
     begin
          o := V_;
          d := _d;
     end;
end;

class operator TdSingle5D.Implicit( const V_:TdSingle5D ) :TSingle5D;
begin
     Result := V_.o;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdDouble5D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TdDouble5D.GetV( const I_:Integer ) :TdDouble;
begin
     Result := _[ I_ ];
end;

procedure TdDouble5D.SetV( const I_:Integer; const V_:TdDouble );
begin
     _[ I_ ] := V_;
end;

//------------------------------------------------------------------------------

function TdDouble5D.Geto :TDouble5D;
begin
     Result._1 := _1.o;
     Result._2 := _2.o;
     Result._3 := _3.o;
     Result._4 := _4.o;
     Result._5 := _5.o;
end;

procedure TdDouble5D.Seto( const o_:TDouble5D );
begin
     _1.o := o_._1;
     _2.o := o_._2;
     _3.o := o_._3;
     _4.o := o_._4;
     _5.o := o_._5;
end;

function TdDouble5D.Getd :TDouble5D;
begin
     Result._1 := _1.d;
     Result._2 := _2.d;
     Result._3 := _3.d;
     Result._4 := _4.d;
     Result._5 := _5.d;
end;

procedure TdDouble5D.Setd( const d_:TDouble5D );
begin
     _1.d := d_._1;
     _2.d := d_._2;
     _3.d := d_._3;
     _4.d := d_._4;
     _5.d := d_._5;
end;

function TdDouble5D.GetSiz2 :TdDouble;
begin
     Result := Pow2( _1 ) + Pow2( _2 ) + Pow2( _3 ) + Pow2( _4 ) + Pow2( _5 );
end;

procedure TdDouble5D.SetSiz2( const Siz2_:TdDouble );
begin
     Self := Roo2( Siz2_ / Siz2 ) * Self;
end;

function TdDouble5D.GetSize :TdDouble;
begin
     Result := Roo2( Siz2 );
end;

procedure TdDouble5D.SetSize( const Size_:TdDouble );
begin
     Self := Size_ * Unitor;
end;

function TdDouble5D.GetUnitor :TdDouble5D;
begin
     Result := Self / Size;
end;

procedure TdDouble5D.SetUnitor( const Unitor_:TdDouble5D );
begin
     Self := Size * Unitor_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TdDouble5D.Create( const V1_,V2_,V3_,V4_,V5_:TdDouble );
begin
     _1 := V1_;
     _2 := V2_;
     _3 := V3_;
     _4 := V4_;
     _5 := V5_;
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TdDouble5D.Negative( const V_:TdDouble5D ) :TdDouble5D;
begin
     with Result do
     begin
          _1 := -V_._1;
          _2 := -V_._2;
          _3 := -V_._3;
          _4 := -V_._4;
          _5 := -V_._5;
     end;
end;

class operator TdDouble5D.Positive( const V_:TdDouble5D ) :TdDouble5D;
begin
     with Result do
     begin
          _1 := +V_._1;
          _2 := +V_._2;
          _3 := +V_._3;
          _4 := +V_._4;
          _5 := +V_._5;
     end;
end;

class operator TdDouble5D.Add( const A_,B_:TdDouble5D ) :TdDouble5D;
begin
     with Result do
     begin
          _1 := A_._1 + B_._1;
          _2 := A_._2 + B_._2;
          _3 := A_._3 + B_._3;
          _4 := A_._4 + B_._4;
          _5 := A_._5 + B_._5;
     end;
end;

class operator TdDouble5D.Subtract( const A_,B_:TdDouble5D ) :TdDouble5D;
begin
     with Result do
     begin
          _1 := A_._1 - B_._1;
          _2 := A_._2 - B_._2;
          _3 := A_._3 - B_._3;
          _4 := A_._4 - B_._4;
          _5 := A_._5 - B_._5;
     end;
end;

class operator TdDouble5D.Multiply( const A_:TdDouble5D; const B_:TdDouble ) :TdDouble5D;
begin
     with Result do
     begin
          _1 := A_._1 * B_;
          _2 := A_._2 * B_;
          _3 := A_._3 * B_;
          _4 := A_._4 * B_;
          _5 := A_._5 * B_;
     end;
end;

class operator TdDouble5D.Multiply( const A_:TdDouble; const B_:TdDouble5D ) :TdDouble5D;
begin
     with Result do
     begin
          _1 := A_ * B_._1;
          _2 := A_ * B_._2;
          _3 := A_ * B_._3;
          _4 := A_ * B_._4;
          _5 := A_ * B_._5;
     end;
end;

class operator TdDouble5D.Divide( const A_:TdDouble5D; const B_:TdDouble ) :TdDouble5D;
begin
     with Result do
     begin
          _1 := A_._1 / B_;
          _2 := A_._2 / B_;
          _3 := A_._3 / B_;
          _4 := A_._4 / B_;
          _5 := A_._5 / B_;
     end;
end;

///////////////////////////////////////////////////////////////////////// 型変換

class operator TdDouble5D.Implicit( const V_:TDouble5D ) :TdDouble5D;
const
     _d :TDouble5D = ( _1:0; _2:0; _3:0; _4:0; _5:0 );
begin
     with Result do
     begin
          o := V_;
          d := _d;
     end;
end;

class operator TdDouble5D.Implicit( const V_:TdDouble5D ) :TDouble5D;
begin
     Result := V_.o;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function DotProduct( const A_,B_:TSingleVec5D ) :Single;
begin
     Result := A_._1 * B_._1
             + A_._2 * B_._2
             + A_._3 * B_._3
             + A_._4 * B_._4
             + A_._5 * B_._5;
end;

function DotProduct( const A_,B_:TDoubleVec5D ) :Double;
begin
     Result := A_._1 * B_._1
             + A_._2 * B_._2
             + A_._3 * B_._3
             + A_._4 * B_._4
             + A_._5 * B_._5;
end;

function DotProduct( const A_,B_:TdSingleVec5D ) :TdSingle;
begin
     Result := A_._1 * B_._1
             + A_._2 * B_._2
             + A_._3 * B_._3
             + A_._4 * B_._4
             + A_._5 * B_._5;
end;

function DotProduct( const A_,B_:TdDoubleVec5D ) :TdDouble;
begin
     Result := A_._1 * B_._1
             + A_._2 * B_._2
             + A_._3 * B_._3
             + A_._4 * B_._4
             + A_._5 * B_._5;
end;

//------------------------------------------------------------------------------

function Dista2( const A_,B_:TSinglePos5D ) :Single;
begin
     Result := Pow2( B_._1 - A_._1 )
             + Pow2( B_._2 - A_._2 )
             + Pow2( B_._3 - A_._3 )
             + Pow2( B_._4 - A_._4 )
             + Pow2( B_._5 - A_._5 );
end;

function Dista2( const A_,B_:TDoublePos5D ) :Double;
begin
     Result := Pow2( B_._1 - A_._1 )
             + Pow2( B_._2 - A_._2 )
             + Pow2( B_._3 - A_._3 )
             + Pow2( B_._4 - A_._4 )
             + Pow2( B_._5 - A_._5 );
end;

function Dista2( const A_,B_:TdSinglePos5D ) :TdSingle;
begin
     Result := Pow2( B_._1 - A_._1 )
             + Pow2( B_._2 - A_._2 )
             + Pow2( B_._3 - A_._3 )
             + Pow2( B_._4 - A_._4 )
             + Pow2( B_._5 - A_._5 );
end;

function Dista2( const A_,B_:TdDoublePos5D ) :TdDouble;
begin
     Result := Pow2( B_._1 - A_._1 )
             + Pow2( B_._2 - A_._2 )
             + Pow2( B_._3 - A_._3 )
             + Pow2( B_._4 - A_._4 )
             + Pow2( B_._5 - A_._5 );
end;

//------------------------------------------------------------------------------

function Distan( const A_,B_:TSinglePos5D ) :Single;
begin
     Result := Roo2( Dista2( A_, B_ ) );
end;

function Distan( const A_,B_:TDoublePos5D ) :Double;
begin
     Result := Roo2( Dista2( A_, B_ ) );
end;

function Distan( const A_,B_:TdSinglePos5D ) :TdSingle;
begin
     Result := Roo2( Dista2( A_, B_ ) );
end;

function Distan( const A_,B_:TdDoublePos5D ) :TdDouble;
begin
     Result := Roo2( Dista2( A_, B_ ) );
end;

//------------------------------------------------------------------------------

function Ave( const P1_,P2_:TSingle5D ) :TSingle5D;
begin
     Result := ( P1_ + P2_ ) / 2;
end;

function Ave( const P1_,P2_:TDouble5D ) :TDouble5D;
begin
     Result := ( P1_ + P2_ ) / 2;
end;

function Ave( const P1_,P2_:TdSingle5D ) :TdSingle5D;
begin
     Result := ( P1_ + P2_ ) / 2;
end;

function Ave( const P1_,P2_:TdDouble5D ) :TdDouble5D;
begin
     Result := ( P1_ + P2_ ) / 2;
end;

//------------------------------------------------------------------------------

function Ave( const P1_,P2_,P3_:TSingle5D ) :TSingle5D;
begin
     Result := ( P1_ + P2_ + P3_ ) / 3;
end;

function Ave( const P1_,P2_,P3_:TDouble5D ) :TDouble5D;
begin
     Result := ( P1_ + P2_ + P3_ ) / 3;
end;

function Ave( const P1_,P2_,P3_:TdSingle5D ) :TdSingle5D;
begin
     Result := ( P1_ + P2_ + P3_ ) / 3;
end;

function Ave( const P1_,P2_,P3_:TdDouble5D ) :TdDouble5D;
begin
     Result := ( P1_ + P2_ + P3_ ) / 3;
end;

//------------------------------------------------------------------------------

function Ave( const P1_,P2_,P3_,P4_:TSingle5D ) :TSingle5D;
begin
     Result := ( P1_ + P2_ + P3_ + P4_ ) / 4;
end;

function Ave( const P1_,P2_,P3_,P4_:TDouble5D ) :TDouble5D;
begin
     Result := ( P1_ + P2_ + P3_ + P4_ ) / 4;
end;

function Ave( const P1_,P2_,P3_,P4_:TdSingle5D ) :TdSingle5D;
begin
     Result := ( P1_ + P2_ + P3_ + P4_ ) / 4;
end;

function Ave( const P1_,P2_,P3_,P4_:TdDouble5D ) :TdDouble5D;
begin
     Result := ( P1_ + P2_ + P3_ + P4_ ) / 4;
end;

//------------------------------------------------------------------------------

function PolySolveReal( const Ks_:TSingle5D; out Xs_:TSingle4D ) :Byte;
var
   B :Single;
//････････････････････････････････････････････････････････････････････
     procedure AddX( const Y_:Single );
     begin
          Inc( Result );

          Xs_[ Result ] := Y_ - B;
     end;
//････････････････････････････････････････････････････････････････････
var
   A0, A1, A2, A3, B2, P, Q, R, D, D2, Y0, Y1, Z, Z2, U, U2, QU :Single;
   Ks3 :TSingle4D;
   Us3, Ks2 :TSingle3D;
   Ys2 :TSingle2D;
   I :Integer;
begin
     if Ks_._5 = 0 then
     begin
          Result := PolySolveReal( TSingle4D( Ks_ ), Us3 );

          Xs_ := Us3;
     end
     else
     begin
          Result := 0;

          with Ks_ do
          begin
               A0 := _1 / _5;
               A1 := _2 / _5;
               A2 := _3 / _5;
               A3 := _4 / _5;
          end;

          B := A3 / 4;  B2 := Pow2( B );

          P := A2 - 6 * B2;
          Q := A1 + ( 8 * B2 - 2 * A2 ) * B;
          R := A0 + ( ( A2 - 3 * B2 ) * B - A1 ) * B;

          if Q = 0 then
          begin
               D := Pow2( P ) - 4 * R;

               case Sign( D ) of
                 0: begin
                         Y0 := Roo2( -P / 2 );

                         AddX( -Y0 );
                         AddX( +Y0 );
                    end;
                +1: begin
                         D2 := Roo2( D );

                         Y0 := Roo2( ( -P - D2 ) / 2 );
                         Y1 := Roo2( ( -P + D2 ) / 2 );

                         AddX( -Y0 );
                         AddX( +Y0 );
                         AddX( -Y1 );
                         AddX( +Y1 );
                    end;
               end;
          end
          else
          begin
               Ks3[ 1 ] := -Pow2( Q );
               Ks3[ 2 ] := +Pow2( P ) - 4 * R;
               Ks3[ 3 ] := +2 * P;
               Ks3[ 4 ] := +1;

               if PolySolveReal( Ks3, Us3 ) = 1 then U := Us3[ 1 ]
                                                else U := Us3[ 3 ];

               if U >= 0 then
               begin
                    Z  := U + P;
                    Z2 := Z / 2;
                    U2 := Roo2( U );
                    QU := Q / ( 2 * U2 );

                    Ks2[ 1 ] := +Z2 + QU;
                    Ks2[ 2 ] := -U2;
                    Ks2[ 3 ] := +1;

                    for I := 1 to PolySolveReal( Ks2, Ys2 ) do AddX( Ys2[ I ] );

                    Ks2[ 1 ] := +Z2 - QU;
                    Ks2[ 2 ] := +U2;
                    Ks2[ 3 ] := +1;

                    for I := 1 to PolySolveReal( Ks2, Ys2 ) do AddX( Ys2[ I ] );
               end;
          end;
     end;
end;

function PolySolveReal( const Ks_:TDouble5D; out Xs_:TDouble4D ) :Byte;
var
   B :Double;
//････････････････････････････････････････････････････････････････････
     procedure AddX( const Y_:Double );
     begin
          Inc( Result );

          Xs_[ Result ] := Y_ - B;
     end;
//････････････････････････････････････････････････････････････････････
var
   A0, A1, A2, A3, B2, P, Q, R, D, D2, Y0, Y1, Z, Z2, U, U2, QU :Double;
   Ks3 :TDouble4D;
   Us3, Ks2 :TDouble3D;
   Ys2 :TDouble2D;
   I :Integer;
begin
     if Ks_._5 = 0 then
     begin
          Result := PolySolveReal( TDouble4D( Ks_ ), Us3 );

          Xs_ := Us3;
     end
     else
     begin
          Result := 0;

          with Ks_ do
          begin
               A0 := _1 / _5;
               A1 := _2 / _5;
               A2 := _3 / _5;
               A3 := _4 / _5;
          end;

          B := A3 / 4;  B2 := Pow2( B );

          P := A2 - 6 * B2;
          Q := A1 + ( 8 * B2 - 2 * A2 ) * B;
          R := A0 + ( ( A2 - 3 * B2 ) * B - A1 ) * B;

          if Q = 0 then
          begin
               D := Pow2( P ) - 4 * R;

               case Sign( D ) of
                 0: begin
                         Y0 := Roo2( -P / 2 );

                         AddX( -Y0 );
                         AddX( +Y0 );
                    end;
                +1: begin
                         D2 := Roo2( D );

                         Y0 := Roo2( ( -P - D2 ) / 2 );
                         Y1 := Roo2( ( -P + D2 ) / 2 );

                         AddX( -Y0 );
                         AddX( +Y0 );
                         AddX( -Y1 );
                         AddX( +Y1 );
                    end;
               end;
          end
          else
          begin
               Ks3[ 1 ] := -Pow2( Q );
               Ks3[ 2 ] := +Pow2( P ) - 4 * R;
               Ks3[ 3 ] := +2 * P;
               Ks3[ 4 ] := +1;

               if PolySolveReal( Ks3, Us3 ) = 1 then U := Us3[ 1 ]
                                                else U := Us3[ 3 ];

               if U >= 0 then
               begin
                    Z  := U + P;
                    Z2 := Z / 2;
                    U2 := Roo2( U );
                    QU := Q / ( 2 * U2 );

                    Ks2[ 1 ] := +Z2 + QU;
                    Ks2[ 2 ] := -U2;
                    Ks2[ 3 ] := +1;

                    for I := 1 to PolySolveReal( Ks2, Ys2 ) do AddX( Ys2[ I ] );

                    Ks2[ 1 ] := +Z2 - QU;
                    Ks2[ 2 ] := +U2;
                    Ks2[ 3 ] := +1;

                    for I := 1 to PolySolveReal( Ks2, Ys2 ) do AddX( Ys2[ I ] );
               end;
          end;
     end;
end;

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
