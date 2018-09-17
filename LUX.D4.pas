unit LUX.D4;

interface //#################################################################### ■

uses System.Math.Vectors,
     LUX, LUX.D1, LUX.D2, LUX.D3;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TByte4D

     TByte4D = record
     private
       ///// アクセス
       function GetV( const I_:Integer ) :Byte; inline;
       procedure SetV( const I_:Integer; const V_:Byte ); inline;
     public
       constructor Create( const V_:Byte ); overload;
       constructor Create( const X_,Y_,Z_,W_:Byte ); overload;
       ///// プロパティ
       property _s[ const I_:Integer ] :Byte read GetV write SetV; default;
     case Byte of
      0:( _ :array [ 1..4 ] of Byte; );
      1:(  X :Byte;
           Y :Byte;
           Z :Byte;
           W :Byte;                  );
      2:( _1 :Byte;
          _2 :Byte;
          _3 :Byte;
          _4 :Byte;                  );
     end;

     TInt08u4D = TByte4D;  TInt8u4D = TInt08u4D;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TWord4D

     TWord4D = record
     private
       ///// アクセス
       function GetV( const I_:Integer ) :Word; inline;
       procedure SetV( const I_:Integer; const V_:Word ); inline;
     public
       constructor Create( const V_:Word ); overload;
       constructor Create( const X_,Y_,Z_,W_:Word ); overload;
       ///// プロパティ
       property _s[ const I_:Integer ] :Word read GetV write SetV; default;
     case Word of
      0:( _ :array [ 1..4 ] of Word; );
      1:(  X :Word;
           Y :Word;
           Z :Word;
           W :Word;                  );
      2:( _1 :Word;
          _2 :Word;
          _3 :Word;
          _4 :Word;                  );
     end;

     TInt16u4D = TWord4D;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TInteger4D

     TInteger4D = record
     private
       ///// アクセス
       function GetV( const I_:Integer ) :Integer; inline;
       procedure SetV( const I_:Integer; const V_:Integer ); inline;
     public
       constructor Create( const V_:Integer ); overload;
       constructor Create( const X_,Y_,Z_,W_:Integer ); overload;
       ///// プロパティ
       property _s[ const I_:Integer ] :Integer read GetV write SetV; default;
     case Byte of
      0:( _ :array [ 1..4 ] of Integer; );
      1:(  X :Integer;
           Y :Integer;
           Z :Integer;
           W :Integer;                  );
      2:( _1 :Integer;
          _2 :Integer;
          _3 :Integer;
          _4 :Integer;                  );
     end;

     TInt32s4D = TInteger4D;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TCardinal4D

     TCardinal4D = record
     private
       ///// アクセス
       function GetV( const I_:Cardinal ) :Cardinal; inline;
       procedure SetV( const I_:Cardinal; const V_:Cardinal ); inline;
     public
       constructor Create( const V_:Cardinal ); overload;
       constructor Create( const X_,Y_,Z_,W_:Cardinal ); overload;
       ///// プロパティ
       property _s[ const I_:Cardinal ] :Cardinal read GetV write SetV; default;
     case Byte of
      0:( _ :array [ 1..4 ] of Cardinal; );
      1:(  X :Cardinal;
           Y :Cardinal;
           Z :Cardinal;
           W :Cardinal;                  );
      2:( _1 :Cardinal;
          _2 :Cardinal;
          _3 :Cardinal;
          _4 :Cardinal;                  );
     end;

     TInt32u4D = TCardinal4D;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TInt64u4D

     TInt64u4D = record
     private
       ///// アクセス
       function GetV( const I_:Byte ) :Int64u; inline;
       procedure SetV( const I_:Byte; const V_:Int64u ); inline;
     public
       constructor Create( const V_:Int64u ); overload;
       constructor Create( const X_,Y_,Z_,W_:Int64u ); overload;
       ///// プロパティ
       property _s[ const I_:Byte ] :Int64u read GetV write SetV; default;
     case Byte of
      0:( _  :array [ 1..4 ] of Int64u; );
      1:(  X :Int64u;
           Y :Int64u;
           Z :Int64u;
           W :Int64u;                   );
      2:( _1 :Int64u;
          _2 :Int64u;
          _3 :Int64u;
          _4 :Int64u;                   );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TInt64s4D

     TInt64s4D = record
     private
       ///// アクセス
       function GetV( const I_:Byte ) :Int64s; inline;
       procedure SetV( const I_:Byte; const V_:Int64s ); inline;
     public
       constructor Create( const V_:Int64s ); overload;
       constructor Create( const X_,Y_,Z_,W_:Int64s ); overload;
       ///// プロパティ
       property _s[ const I_:Byte ] :Int64s read GetV write SetV; default;
     case Byte of
      0:( _  :array [ 1..4 ] of Int64s; );
      1:(  X :Int64s;
           Y :Int64s;
           Z :Int64s;
           W :Int64s;                   );
      2:( _1 :Int64s;
          _2 :Int64s;
          _3 :Int64s;
          _4 :Int64s;                   );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingle4D

     TSingle4D = record
     private
       ///// アクセス
       function GetV( const I_:Integer ) :Single; inline;
       procedure SetV( const I_:Integer; const V_:Single ); inline;
       function GetSiz2 :Single; inline;
       procedure SetSiz2( const Siz2_:Single ); inline;
       function GetSize :Single; inline;
       procedure SetSize( const Size_:Single ); inline;
       function GetUnitor :TSingle4D; inline;
       procedure SetUnitor( const Unitor_:TSingle4D ); inline;
     public
       constructor Create( const V_:Single ); overload;
       constructor Create( const X_,Y_,Z_,W_:Single ); overload;
       constructor Create( const P_:TSingle3D; const W_:Single ); overload;
       ///// プロパティ
       property V[ const I_:Integer ] :Single    read GetV      write SetV     ; default;
       property Siz2                  :Single    read GetSiz2   write SetSiz2  ;
       property Size                  :Single    read GetSize   write SetSize  ;
       property Unitor                :TSingle4D read GetUnitor write SetUnitor;
       ///// 演算子
       class operator Negative( const V_:TSingle4D ) :TSingle4D;
       class operator Positive( const V_:TSingle4D ) :TSingle4D;
       class operator Add( const A_,B_:TSingle4D ) :TSingle4D;
       class operator Subtract( const A_,B_:TSingle4D ) :TSingle4D;
       class operator Multiply( const A_:TSingle4D; const B_:Single ) :TSingle4D;
       class operator Multiply( const A_:Single; const B_:TSingle4D ) :TSingle4D;
       class operator Divide( const A_:TSingle4D; const B_:Single ) :TSingle4D;
       ///// 型変換
       class operator Implicit( const V_:TSingle3D ) :TSingle4D;
       class operator Explicit( const V_:TSingle4D ) :TSingle3D;
       class operator Implicit( const V_:TPoint3D ) :TSingle4D;
       class operator Explicit( const V_:TSingle4D ) :TPoint3D;
       class operator Implicit( const V_:TVector3D ) :TSingle4D;
       class operator Explicit( const V_:TSingle4D ) :TVector3D;
       ///// 定数
       class function IdentityX :TSingle4D; inline; static;
       class function IdentityY :TSingle4D; inline; static;
       class function IdentityZ :TSingle4D; inline; static;
       class function IdentityW :TSingle4D; inline; static;
       ///// メソッド
       function VectorTo( const P_:TSingle4D ) :TSingle4D;
       function UnitorTo( const P_:TSingle4D ) :TSingle4D;
       function DistanTo( const P_:TSingle4D ) :Single;
       function ToCart :TSingle3D;
       class function RandG :TSingle4D; static;
       class function RandBS1 :TSingle4D; static;
       class function RandBS2 :TSingle4D; static;
       class function RandBS4 :TSingle4D; static;
     case Integer of
      0:( _  :array [ 1..4 ] of Single );
      1:(  X :Single;
           Y :Single;
           Z :Single;
           W :Single;                  );
      2:( _1 :Single;
          _2 :Single;
          _3 :Single;
          _4 :Single;                  );
     end;

     TFlo32s4D = TSingle4D;

     TSinglePos4D = TSingle4D;
     TSingleVec4D = TSingle4D;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDouble4D

     TDouble4D = record
     private
       ///// アクセス
       function GetV( const I_:Integer ) :Double; inline;
       procedure SetV( const I_:Integer; const V_:Double ); inline;
       function GetSiz2 :Double; inline;
       procedure SetSiz2( const Siz2_:Double ); inline;
       function GetSize :Double; inline;
       procedure SetSize( const Size_:Double ); inline;
       function GetUnitor :TDouble4D; inline;
       procedure SetUnitor( const Unitor_:TDouble4D ); inline;
     public
       constructor Create( const V_:Double ); overload;
       constructor Create( const X_,Y_,Z_,W_:Double ); overload;
       constructor Create( const P_:TDouble3D; const W_:Double ); overload;
       ///// プロパティ
       property V[ const I_:Integer ] :Double    read GetV      write SetV     ; default;
       property Siz2                  :Double    read GetSiz2   write SetSiz2  ;
       property Size                  :Double    read GetSize   write SetSize  ;
       property Unitor                :TDouble4D read GetUnitor write SetUnitor;
       ///// 演算子
       class operator Negative( const V_:TDouble4D ) :TDouble4D;
       class operator Positive( const V_:TDouble4D ) :TDouble4D;
       class operator Add( const A_,B_:TDouble4D ) :TDouble4D;
       class operator Subtract( const A_,B_:TDouble4D ) :TDouble4D;
       class operator Multiply( const A_:TDouble4D; const B_:Double ) :TDouble4D;
       class operator Multiply( const A_:Double; const B_:TDouble4D ) :TDouble4D;
       class operator Divide( const A_:TDouble4D; const B_:Double ) :TDouble4D;
       ///// 型変換
       class operator Implicit( const V_:TDouble3D ) :TDouble4D;
       class operator Explicit( const V_:TDouble4D ) :TDouble3D;
       class operator Implicit( const V_:TPoint3D ) :TDouble4D;
       class operator Explicit( const V_:TDouble4D ) :TPoint3D;
       class operator Implicit( const V_:TVector3D ) :TDouble4D;
       class operator Explicit( const V_:TDouble4D ) :TVector3D;
       ///// 定数
       class function IdentityX :TDouble4D; inline; static;
       class function IdentityY :TDouble4D; inline; static;
       class function IdentityZ :TDouble4D; inline; static;
       class function IdentityW :TDouble4D; inline; static;
       ///// メソッド
       function VectorTo( const P_:TDouble4D ) :TDouble4D;
       function UnitorTo( const P_:TDouble4D ) :TDouble4D;
       function DistanTo( const P_:TDouble4D ) :Double;
       function ToCart :TDouble3D;
       class function RandG :TDouble4D; static;
       class function RandBS1 :TDouble4D; static;
       class function RandBS2 :TDouble4D; static;
       class function RandBS4 :TDouble4D; static;
     case Integer of
      0:( _  :array [ 1..4 ] of Double );
      1:(  X :Double;
           Y :Double;
           Z :Double;
           W :Double;                  );
      2:( _1 :Double;
          _2 :Double;
          _3 :Double;
          _4 :Double;                  );
     end;

     TFlo64s4D = TDouble4D;

     TDoublePos4D = TDouble4D;
     TDoubleVec4D = TDouble4D;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdSingle4D

     TdSingle4D = record
     private
       ///// アクセス
       function GetV( const I_:Integer ) :TdSingle; inline;
       procedure SetV( const I_:Integer; const V_:TdSingle ); inline;
       function Geto :TSingle4D; inline;
       procedure Seto( const o_:TSingle4D ); inline;
       function Getd :TSingle4D; inline;
       procedure Setd( const d_:TSingle4D ); inline;
       function GetSiz2 :TdSingle; inline;
       procedure SetSiz2( const Siz2_:TdSingle ); inline;
       function GetSize :TdSingle; inline;
       procedure SetSize( const Size_:TdSingle ); inline;
       function GetUnitor :TdSingle4D; inline;
       procedure SetUnitor( const Unitor_:TdSingle4D ); inline;
     public
       constructor Create( const X_,Y_,Z_,W_:TdSingle );
       ///// プロパティ
       property V[ const I_:Integer ] :TdSingle   read GetV      write SetV     ; default;
       property o                     :TSingle4D  read Geto      write Seto     ;
       property d                     :TSingle4D  read Getd      write Setd     ;
       property Siz2                  :TdSingle   read GetSiz2   write SetSiz2  ;
       property Size                  :TdSingle   read GetSize   write SetSize  ;
       property Unitor                :TdSingle4D read GetUnitor write SetUnitor;
       ///// 演算子
       class operator Negative( const V_:TdSingle4D ) :TdSingle4D; inline;
       class operator Positive( const V_:TdSingle4D ) :TdSingle4D; inline;
       class operator Add( const A_,B_:TdSingle4D ) :TdSingle4D; inline;
       class operator Subtract( const A_,B_:TdSingle4D ) :TdSingle4D; inline;
       class operator Multiply( const A_:TdSingle4D; const B_:TdSingle ) :TdSingle4D; inline;
       class operator Multiply( const A_:TdSingle; const B_:TdSingle4D ) :TdSingle4D; inline;
       class operator Divide( const A_:TdSingle4D; const B_:TdSingle ) :TdSingle4D; inline;
       ///// 型変換
       class operator Implicit( const V_:TSingle4D ) :TdSingle4D;
       class operator Implicit( const V_:TdSingle4D ) :TSingle4D;
     case Integer of
      0:( _  :array [ 1..4 ] of TdSingle );
      1:(  X :TdSingle;
           Y :TdSingle;
           Z :TdSingle;
           W :TdSingle;                  );
      2:( _1 :TdSingle;
          _2 :TdSingle;
          _3 :TdSingle;
          _4 :TdSingle;                  );
     end;

     TdFlo32s4D = TdSingle4D;

     TdSinglePos4D = TdSingle4D;
     TdSingleVec4D = TdSingle4D;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdDouble4D

     TdDouble4D = record
     private
       ///// アクセス
       function GetV( const I_:Integer ) :TdDouble; inline;
       procedure SetV( const I_:Integer; const V_:TdDouble ); inline;
       function Geto :TDouble4D; inline;
       procedure Seto( const o_:TDouble4D ); inline;
       function Getd :TDouble4D; inline;
       procedure Setd( const d_:TDouble4D ); inline;
       function GetSiz2 :TdDouble; inline;
       procedure SetSiz2( const Siz2_:TdDouble ); inline;
       function GetSize :TdDouble; inline;
       procedure SetSize( const Size_:TdDouble ); inline;
       function GetUnitor :TdDouble4D; inline;
       procedure SetUnitor( const Unitor_:TdDouble4D ); inline;
     public
       constructor Create( const X_,Y_,Z_,W_:TdDouble );
       ///// プロパティ
       property V[ const I_:Integer ] :TdDouble   read GetV      write SetV     ; default;
       property o                     :TDouble4D  read Geto      write Seto     ;
       property d                     :TDouble4D  read Getd      write Setd     ;
       property Siz2                  :TdDouble   read GetSiz2   write SetSiz2  ;
       property Size                  :TdDouble   read GetSize   write SetSize  ;
       property Unitor                :TdDouble4D read GetUnitor write SetUnitor;
       ///// 演算子
       class operator Negative( const V_:TdDouble4D ) :TdDouble4D; inline;
       class operator Positive( const V_:TdDouble4D ) :TdDouble4D; inline;
       class operator Add( const A_,B_:TdDouble4D ) :TdDouble4D; inline;
       class operator Subtract( const A_,B_:TdDouble4D ) :TdDouble4D; inline;
       class operator Multiply( const A_:TdDouble4D; const B_:TdDouble ) :TdDouble4D; inline;
       class operator Multiply( const A_:TdDouble; const B_:TdDouble4D ) :TdDouble4D; inline;
       class operator Divide( const A_:TdDouble4D; const B_:TdDouble ) :TdDouble4D; inline;
       ///// 型変換
       class operator Implicit( const V_:TDouble4D ) :TdDouble4D;
       class operator Implicit( const V_:TdDouble4D ) :TDouble4D;
     case Integer of
      0:( _  :array [ 1..4 ] of TdDouble );
      1:(  X :TdDouble;
           Y :TdDouble;
           Z :TdDouble;
           W :TdDouble;                  );
      2:( _1 :TdDouble;
          _2 :TdDouble;
          _3 :TdDouble;
          _4 :TdDouble;                  );
     end;

     TdFlo64s4D = TdDouble4D;

     TdDoublePos4D = TdDouble4D;
     TdDoubleVec4D = TdDouble4D;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function DotProduct( const A_,B_:TSingleVec4D ) :Single; inline; overload;
function DotProduct( const A_,B_:TDoubleVec4D ) :Double; inline; overload;
function DotProduct( const A_,B_:TdSingleVec4D ) :TdSingle; inline; overload;
function DotProduct( const A_,B_:TdDoubleVec4D ) :TdDouble; inline; overload;

function CrossProduct( const A_,B_,C_:TSingleVec4D ) :TSingleVec4D; inline; overload;
function CrossProduct( const A_,B_,C_:TDoubleVec4D ) :TDoubleVec4D; inline; overload;
function CrossProduct( const A_,B_,C_:TdSingleVec4D ) :TdSingleVec4D; inline; overload;
function CrossProduct( const A_,B_,C_:TdDoubleVec4D ) :TdDoubleVec4D; inline; overload;

function Dista2( const A_,B_:TSinglePos4D ) :Single; inline; overload;
function Dista2( const A_,B_:TDoublePos4D ) :Double; inline; overload;
function Dista2( const A_,B_:TdSinglePos4D ) :TdSingle; inline; overload;
function Dista2( const A_,B_:TdDoublePos4D ) :TdDouble; inline; overload;

function Distan( const A_,B_:TSinglePos4D ) :Single; inline; overload;
function Distan( const A_,B_:TDoublePos4D ) :Double; inline; overload;
function Distan( const A_,B_:TdSinglePos4D ) :TdSingle; inline; overload;
function Distan( const A_,B_:TdDoublePos4D ) :TdDouble; inline; overload;

function Ave( const P1_,P2_:TSingle4D ) :TSingle4D; inline; overload;
function Ave( const P1_,P2_:TDouble4D ) :TDouble4D; inline; overload;
function Ave( const P1_,P2_:TdSingle4D ) :TdSingle4D; inline; overload;
function Ave( const P1_,P2_:TdDouble4D ) :TdDouble4D; inline; overload;

function Ave( const P1_,P2_,P3_:TSingle4D ) :TSingle4D; inline; overload;
function Ave( const P1_,P2_,P3_:TDouble4D ) :TDouble4D; inline; overload;
function Ave( const P1_,P2_,P3_:TdSingle4D ) :TdSingle4D; inline; overload;
function Ave( const P1_,P2_,P3_:TdDouble4D ) :TdDouble4D; inline; overload;

function Ave( const P1_,P2_,P3_,P4_:TSingle4D ) :TSingle4D; inline; overload;
function Ave( const P1_,P2_,P3_,P4_:TDouble4D ) :TDouble4D; inline; overload;
function Ave( const P1_,P2_,P3_,P4_:TdSingle4D ) :TdSingle4D; inline; overload;
function Ave( const P1_,P2_,P3_,P4_:TdDouble4D ) :TdDouble4D; inline; overload;

function PolySolveReal( const Ks_:TSingle4D; out Xs_:TSingle3D ) :Byte; overload;
function PolySolveReal( const Ks_:TDouble4D; out Xs_:TDouble3D ) :Byte; overload;

implementation //############################################################### ■

uses System.SysUtils, System.Math;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TByte4D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TByte4D.GetV( const I_:Integer ) :Byte;
begin
     Result := _[ I_ ];
end;

procedure TByte4D.SetV( const I_:Integer; const V_:Byte );
begin
     _[ I_ ] := V_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TByte4D.Create( const V_:Byte );
begin
     X := V_;
     Y := V_;
     Z := V_;
     W := V_;
end;

constructor TByte4D.Create( const X_,Y_,Z_,W_:Byte );
begin
     X := X_;
     Y := Y_;
     Z := Z_;
     W := W_;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TWord4D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TWord4D.GetV( const I_:Integer ) :Word;
begin
     Result := _[ I_ ];
end;

procedure TWord4D.SetV( const I_:Integer; const V_:Word );
begin
     _[ I_ ] := V_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TWord4D.Create( const V_:Word );
begin
     X := V_;
     Y := V_;
     Z := V_;
     W := V_;
end;

constructor TWord4D.Create( const X_,Y_,Z_,W_:Word );
begin
     X := X_;
     Y := Y_;
     Z := Z_;
     W := W_;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TInteger4D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TInteger4D.GetV( const I_:Integer ) :Integer;
begin
     Result := _[ I_ ];
end;

procedure TInteger4D.SetV( const I_:Integer; const V_:Integer );
begin
     _[ I_ ] := V_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TInteger4D.Create( const V_:Integer );
begin
     X := V_;
     Y := V_;
     Z := V_;
     W := V_;
end;

constructor TInteger4D.Create( const X_,Y_,Z_,W_:Integer );
begin
     X := X_;
     Y := Y_;
     Z := Z_;
     W := W_;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TCardinal4D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TCardinal4D.GetV( const I_:Cardinal ) :Cardinal;
begin
     Result := _[ I_ ];
end;

procedure TCardinal4D.SetV( const I_:Cardinal; const V_:Cardinal );
begin
     _[ I_ ] := V_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TCardinal4D.Create( const V_:Cardinal );
begin
     X := V_;
     Y := V_;
     Z := V_;
     W := V_;
end;

constructor TCardinal4D.Create( const X_,Y_,Z_,W_:Cardinal );
begin
     X := X_;
     Y := Y_;
     Z := Z_;
     W := W_;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TInt64u4D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TInt64u4D.GetV( const I_:Byte ) :Int64u;
begin
     Result := _[ I_ ];
end;

procedure TInt64u4D.SetV( const I_:Byte; const V_:Int64u );
begin
     _[ I_ ] := V_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TInt64u4D.Create( const V_:Int64u );
begin
     X := V_;
     Y := V_;
     Z := V_;
     W := V_;
end;

constructor TInt64u4D.Create( const X_,Y_,Z_,W_:Int64u );
begin
     X := X_;
     Y := Y_;
     Z := Z_;
     W := W_;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TInt64s4D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TInt64s4D.GetV( const I_:Byte ) :Int64s;
begin
     Result := _[ I_ ];
end;

procedure TInt64s4D.SetV( const I_:Byte; const V_:Int64s );
begin
     _[ I_ ] := V_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TInt64s4D.Create( const V_:Int64s );
begin
     X := V_;
     Y := V_;
     Z := V_;
     W := V_;
end;

constructor TInt64s4D.Create( const X_,Y_,Z_,W_:Int64s );
begin
     X := X_;
     Y := Y_;
     Z := Z_;
     W := W_;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingle4D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TSingle4D.GetV( const I_:Integer ) :Single;
begin
     Result := _[ I_ ];
end;

procedure TSingle4D.SetV( const I_:Integer; const V_:Single );
begin
     _[ I_ ] := V_;
end;

//------------------------------------------------------------------------------

function TSingle4D.GetSiz2 :Single;
begin
     Result := Pow2( X ) + Pow2( Y ) + Pow2( Z ) + Pow2( W );
end;

procedure TSingle4D.SetSiz2( const Siz2_:Single );
begin
     Self := Roo2( Siz2_ / Siz2 ) * Self;
end;

function TSingle4D.GetSize :Single;
begin
     Result := Roo2( GetSiz2 );
end;

procedure TSingle4D.SetSize( const Size_:Single );
begin
     Self := Size_ * Unitor;
end;

function TSingle4D.GetUnitor :TSingle4D;
begin
     Result := Self / Size;
end;

procedure TSingle4D.SetUnitor( const Unitor_:TSingle4D );
begin
     Self := Size * Unitor_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TSingle4D.Create( const V_:Single );
begin
     X := V_;
     Y := V_;
     Z := V_;
     W := V_;
end;

constructor TSingle4D.Create( const X_,Y_,Z_,W_:Single );
begin
     X := X_;
     Y := Y_;
     Z := Z_;
     W := W_;
end;

constructor TSingle4D.Create( const P_:TSingle3D; const W_:Single );
begin
     X := P_.X ;
     Y := P_.Y ;
     Z := P_.Z ;
     W :=    W_;
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TSingle4D.Negative( const V_:TSingle4D ) :TSingle4D;
begin
     with Result do
     begin
          X := -V_.X;
          Y := -V_.Y;
          Z := -V_.Z;
          W := -V_.W;
     end;
end;

class operator TSingle4D.Positive( const V_:TSingle4D ) :TSingle4D;
begin
     with Result do
     begin
          X := +V_.X;
          Y := +V_.Y;
          Z := +V_.Z;
          W := +V_.W;
     end;
end;

class operator TSingle4D.Add( const A_,B_:TSingle4D ) :TSingle4D;
begin
     with Result do
     begin
          X := A_.X + B_.X;
          Y := A_.Y + B_.Y;
          Z := A_.Z + B_.Z;
          W := A_.W + B_.W;
     end;
end;

class operator TSingle4D.Subtract( const A_,B_:TSingle4D ) :TSingle4D;
begin
     with Result do
     begin
          X := A_.X - B_.X;
          Y := A_.Y - B_.Y;
          Z := A_.Z - B_.Z;
          W := A_.W - B_.W;
     end;
end;

class operator TSingle4D.Multiply( const A_:TSingle4D; const B_:Single ) :TSingle4D;
begin
     with Result do
     begin
          X := A_.X * B_;
          Y := A_.Y * B_;
          Z := A_.Z * B_;
          W := A_.W * B_;
     end;
end;

class operator TSingle4D.Multiply( const A_:Single; const B_:TSingle4D ) :TSingle4D;
begin
     with Result do
     begin
          X := A_ * B_.X;
          Y := A_ * B_.Y;
          Z := A_ * B_.Z;
          W := A_ * B_.W;
     end;
end;

class operator TSingle4D.Divide( const A_:TSingle4D; const B_:Single ) :TSingle4D;
begin
     with Result do
     begin
          X := A_.X / B_;
          Y := A_.Y / B_;
          Z := A_.Z / B_;
          W := A_.W / B_;
     end;
end;

///////////////////////////////////////////////////////////////////////// 型変換

class operator TSingle4D.Implicit( const V_:TSingle3D ) :TSingle4D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
          Z := V_.Z;
          W :=    0;
     end;
end;

class operator TSingle4D.Explicit( const V_:TSingle4D ) :TSingle3D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
          Z := V_.Z;
     end;
end;

class operator TSingle4D.Implicit( const V_:TPoint3D ) :TSingle4D;
begin
     with Result do
     begin
          X := +V_.X;
          Y := -V_.Y;
          Z := -V_.Z;
          W :=     0;
     end;
end;

class operator TSingle4D.Explicit( const V_:TSingle4D ) :TPoint3D;
begin
     with Result do
     begin
          X := +V_.X;
          Y := -V_.Y;
          Z := -V_.Z;
     end;
end;

class operator TSingle4D.Implicit( const V_:TVector3D ) :TSingle4D;
begin
     with Result do
     begin
          X := +V_.X;
          Y := -V_.Y;
          Z := -V_.Z;
          W :=  V_.W;
     end;
end;

class operator TSingle4D.Explicit( const V_:TSingle4D ) :TVector3D;
begin
     with Result do
     begin
          X := +V_.X;
          Y := -V_.Y;
          Z := -V_.Z;
          W :=  V_.W;
     end;
end;

/////////////////////////////////////////////////////////////////////////// 定数

class function TSingle4D.IdentityX :TSingle4D;
begin
     with Result do
     begin
          X := 1;
          Y := 0;
          Z := 0;
          W := 0;
     end;
end;

class function TSingle4D.IdentityY :TSingle4D;
begin
     with Result do
     begin
          X := 0;
          Y := 1;
          Z := 0;
          W := 0;
     end;
end;

class function TSingle4D.IdentityZ :TSingle4D;
begin
     with Result do
     begin
          X := 0;
          Y := 0;
          Z := 1;
          W := 0;
     end;
end;

class function TSingle4D.IdentityW :TSingle4D;
begin
     with Result do
     begin
          X := 0;
          Y := 0;
          Z := 0;
          W := 1;
     end;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TSingle4D.VectorTo( const P_:TSingle4D ) :TSingle4D;
begin
     Result := P_ - Self;
end;

function TSingle4D.UnitorTo( const P_:TSingle4D ) :TSingle4D;
begin
     Result := VectorTo( P_ ).Unitor;
end;

function TSingle4D.DistanTo( const P_:TSingle4D ) :Single;
begin
     Result := VectorTo( P_ ).Size;
end;

//------------------------------------------------------------------------------

function TSingle4D.ToCart :TSingle3D;
begin
     Result.X := X / W;
     Result.Y := Y / W;
     Result.Z := Z / W;
end;

//------------------------------------------------------------------------------

class function TSingle4D.RandG :TSingle4D;
begin
     with Result do
     begin
          X := System.Math.RandG( 0, 1 );
          Y := System.Math.RandG( 0, 1 );
          Z := System.Math.RandG( 0, 1 );
          W := System.Math.RandG( 0, 1 );
     end;
end;

//------------------------------------------------------------------------------

class function TSingle4D.RandBS1 :TSingle4D;
begin
     with Result do
     begin
          X := TSingle.RandBS1;
          Y := TSingle.RandBS1;
          Z := TSingle.RandBS1;
          W := TSingle.RandBS1;
     end;
end;

class function TSingle4D.RandBS2 :TSingle4D;
begin
     with Result do
     begin
          X := TSingle.RandBS2;
          Y := TSingle.RandBS2;
          Z := TSingle.RandBS2;
          W := TSingle.RandBS2;
     end;
end;

class function TSingle4D.RandBS4 :TSingle4D;
begin
     with Result do
     begin
          X := TSingle.RandBS4;
          Y := TSingle.RandBS4;
          Z := TSingle.RandBS4;
          W := TSingle.RandBS4;
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDouble4D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TDouble4D.GetV( const I_:Integer ) :Double;
begin
     Result := _[ I_ ];
end;

procedure TDouble4D.SetV( const I_:Integer; const V_:Double );
begin
     _[ I_ ] := V_;
end;

//------------------------------------------------------------------------------

function TDouble4D.GetSiz2 :Double;
begin
     Result := Pow2( X ) + Pow2( Y ) + Pow2( Z ) + Pow2( W );
end;

procedure TDouble4D.SetSiz2( const Siz2_:Double );
begin
     Self := Roo2( Siz2_ / Siz2 ) * Self;
end;

function TDouble4D.GetSize :Double;
begin
     Result := Roo2( GetSiz2 );
end;

procedure TDouble4D.SetSize( const Size_:Double );
begin
     Self := Size_ * Unitor;
end;

function TDouble4D.GetUnitor :TDouble4D;
begin
     Result := Self / Size;
end;

procedure TDouble4D.SetUnitor( const Unitor_:TDouble4D );
begin
     Self := Size * Unitor_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TDouble4D.Create( const V_:Double );
begin
     X := V_;
     Y := V_;
     Z := V_;
     W := V_;
end;

constructor TDouble4D.Create( const X_,Y_,Z_,W_:Double );
begin
     X := X_;
     Y := Y_;
     Z := Z_;
     W := W_;
end;

constructor TDouble4D.Create( const P_:TDouble3D; const W_:Double );
begin
     X := P_.X ;
     Y := P_.Y ;
     Z := P_.Z ;
     W :=    W_;
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TDouble4D.Negative( const V_:TDouble4D ) :TDouble4D;
begin
     with Result do
     begin
          X := -V_.X;
          Y := -V_.Y;
          Z := -V_.Z;
          W := -V_.W;
     end;
end;

class operator TDouble4D.Positive( const V_:TDouble4D ) :TDouble4D;
begin
     with Result do
     begin
          X := +V_.X;
          Y := +V_.Y;
          Z := +V_.Z;
          W := +V_.W;
     end;
end;

class operator TDouble4D.Add( const A_,B_:TDouble4D ) :TDouble4D;
begin
     with Result do
     begin
          X := A_.X + B_.X;
          Y := A_.Y + B_.Y;
          Z := A_.Z + B_.Z;
          W := A_.W + B_.W;
     end;
end;

class operator TDouble4D.Subtract( const A_,B_:TDouble4D ) :TDouble4D;
begin
     with Result do
     begin
          X := A_.X - B_.X;
          Y := A_.Y - B_.Y;
          Z := A_.Z - B_.Z;
          W := A_.W - B_.W;
     end;
end;

class operator TDouble4D.Multiply( const A_:TDouble4D; const B_:Double ) :TDouble4D;
begin
     with Result do
     begin
          X := A_.X * B_;
          Y := A_.Y * B_;
          Z := A_.Z * B_;
          W := A_.W * B_;
     end;
end;

class operator TDouble4D.Multiply( const A_:Double; const B_:TDouble4D ) :TDouble4D;
begin
     with Result do
     begin
          X := A_ * B_.X;
          Y := A_ * B_.Y;
          Z := A_ * B_.Z;
          W := A_ * B_.W;
     end;
end;

class operator TDouble4D.Divide( const A_:TDouble4D; const B_:Double ) :TDouble4D;
begin
     with Result do
     begin
          X := A_.X / B_;
          Y := A_.Y / B_;
          Z := A_.Z / B_;
          W := A_.W / B_;
     end;
end;

///////////////////////////////////////////////////////////////////////// 型変換

class operator TDouble4D.Implicit( const V_:TDouble3D ) :TDouble4D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
          Z := V_.Z;
          W :=    0;
     end;
end;

class operator TDouble4D.Explicit( const V_:TDouble4D ) :TDouble3D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
          Z := V_.Z;
     end;
end;

class operator TDouble4D.Implicit( const V_:TPoint3D ) :TDouble4D;
begin
     with Result do
     begin
          X := +V_.X;
          Y := -V_.Y;
          Z := -V_.Z;
          W :=     0;
     end;
end;

class operator TDouble4D.Explicit( const V_:TDouble4D ) :TPoint3D;
begin
     with Result do
     begin
          X := +V_.X;
          Y := -V_.Y;
          Z := -V_.Z;
     end;
end;

class operator TDouble4D.Implicit( const V_:TVector3D ) :TDouble4D;
begin
     with Result do
     begin
          X := +V_.X;
          Y := -V_.Y;
          Z := -V_.Z;
          W :=  V_.W;
     end;
end;

class operator TDouble4D.Explicit( const V_:TDouble4D ) :TVector3D;
begin
     with Result do
     begin
          X := +V_.X;
          Y := -V_.Y;
          Z := -V_.Z;
          W :=  V_.W;
     end;
end;

/////////////////////////////////////////////////////////////////////////// 定数

class function TDouble4D.IdentityX :TDouble4D;
begin
     with Result do
     begin
          X := 1;
          Y := 0;
          Z := 0;
          W := 0;
     end;
end;

class function TDouble4D.IdentityY :TDouble4D;
begin
     with Result do
     begin
          X := 0;
          Y := 1;
          Z := 0;
          W := 0;
     end;
end;

class function TDouble4D.IdentityZ :TDouble4D;
begin
     with Result do
     begin
          X := 0;
          Y := 0;
          Z := 1;
          W := 0;
     end;
end;

class function TDouble4D.IdentityW :TDouble4D;
begin
     with Result do
     begin
          X := 0;
          Y := 0;
          Z := 0;
          W := 1;
     end;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TDouble4D.VectorTo( const P_:TDouble4D ) :TDouble4D;
begin
     Result := P_ - Self;
end;

function TDouble4D.UnitorTo( const P_:TDouble4D ) :TDouble4D;
begin
     Result := VectorTo( P_ ).Unitor;
end;

function TDouble4D.DistanTo( const P_:TDouble4D ) :Double;
begin
     Result := VectorTo( P_ ).Size;
end;

//------------------------------------------------------------------------------

function TDouble4D.ToCart :TDouble3D;
begin
     Result.X := X / W;
     Result.Y := Y / W;
     Result.Z := Z / W;
end;

//------------------------------------------------------------------------------

class function TDouble4D.RandG :TDouble4D;
begin
     with Result do
     begin
          X := System.Math.RandG( 0, 1 );
          Y := System.Math.RandG( 0, 1 );
          Z := System.Math.RandG( 0, 1 );
          W := System.Math.RandG( 0, 1 );
     end;
end;

//------------------------------------------------------------------------------

class function TDouble4D.RandBS1 :TDouble4D;
begin
     with Result do
     begin
          X := TDouble.RandBS1;
          Y := TDouble.RandBS1;
          Z := TDouble.RandBS1;
          W := TDouble.RandBS1;
     end;
end;

class function TDouble4D.RandBS2 :TDouble4D;
begin
     with Result do
     begin
          X := TDouble.RandBS2;
          Y := TDouble.RandBS2;
          Z := TDouble.RandBS2;
          W := TDouble.RandBS2;
     end;
end;

class function TDouble4D.RandBS4 :TDouble4D;
begin
     with Result do
     begin
          X := TDouble.RandBS4;
          Y := TDouble.RandBS4;
          Z := TDouble.RandBS4;
          W := TDouble.RandBS4;
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdSingle4D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TdSingle4D.GetV( const I_:Integer ) :TdSingle;
begin
     Result := _[ I_ ];
end;

procedure TdSingle4D.SetV( const I_:Integer; const V_:TdSingle );
begin
     _[ I_ ] := V_;
end;

//------------------------------------------------------------------------------

function TdSingle4D.Geto :TSingle4D;
begin
     Result.X := X.o;
     Result.Y := Y.o;
     Result.Z := Z.o;
     Result.W := W.o;
end;

procedure TdSingle4D.Seto( const o_:TSingle4D );
begin
     X.o := o_.X;
     Y.o := o_.Y;
     Z.o := o_.Z;
     W.o := o_.W;
end;

function TdSingle4D.Getd :TSingle4D;
begin
     Result.X := X.d;
     Result.Y := Y.d;
     Result.Z := Z.d;
     Result.W := W.d;
end;

procedure TdSingle4D.Setd( const d_:TSingle4D );
begin
     X.d := d_.X;
     Y.d := d_.Y;
     Z.d := d_.Z;
     W.d := d_.W;
end;

function TdSingle4D.GetSiz2 :TdSingle;
begin
     Result := Pow2( X ) + Pow2( Y ) + Pow2( Z ) + Pow2( W );
end;

procedure TdSingle4D.SetSiz2( const Siz2_:TdSingle );
begin
     Self := Roo2( Siz2_ / Siz2 ) * Self;
end;

function TdSingle4D.GetSize :TdSingle;
begin
     Result := Roo2( Siz2 );
end;

procedure TdSingle4D.SetSize( const Size_:TdSingle );
begin
     Self := Size_ * Unitor;
end;

function TdSingle4D.GetUnitor :TdSingle4D;
begin
     Result := Self / Size;
end;

procedure TdSingle4D.SetUnitor( const Unitor_:TdSingle4D );
begin
     Self := Size * Unitor_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TdSingle4D.Create( const X_,Y_,Z_,W_:TdSingle );
begin
     X := X_;
     Y := Y_;
     Z := Z_;
     W := W_;
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TdSingle4D.Negative( const V_:TdSingle4D ) :TdSingle4D;
begin
     with Result do
     begin
          X := -V_.X;
          Y := -V_.Y;
          Z := -V_.Z;
          W := -V_.W;
     end;
end;

class operator TdSingle4D.Positive( const V_:TdSingle4D ) :TdSingle4D;
begin
     with Result do
     begin
          X := +V_.X;
          Y := +V_.Y;
          Z := +V_.Z;
          W := +V_.W;
     end;
end;

class operator TdSingle4D.Add( const A_,B_:TdSingle4D ) :TdSingle4D;
begin
     with Result do
     begin
          X := A_.X + B_.X;
          Y := A_.Y + B_.Y;
          Z := A_.Z + B_.Z;
          W := A_.W + B_.W;
     end;
end;

class operator TdSingle4D.Subtract( const A_,B_:TdSingle4D ) :TdSingle4D;
begin
     with Result do
     begin
          X := A_.X - B_.X;
          Y := A_.Y - B_.Y;
          Z := A_.Z - B_.Z;
          W := A_.W - B_.W;
     end;
end;

class operator TdSingle4D.Multiply( const A_:TdSingle4D; const B_:TdSingle ) :TdSingle4D;
begin
     with Result do
     begin
          X := A_.X * B_;
          Y := A_.Y * B_;
          Z := A_.Z * B_;
          W := A_.W * B_;
     end;
end;

class operator TdSingle4D.Multiply( const A_:TdSingle; const B_:TdSingle4D ) :TdSingle4D;
begin
     with Result do
     begin
          X := A_ * B_.X;
          Y := A_ * B_.Y;
          Z := A_ * B_.Z;
          W := A_ * B_.W;
     end;
end;

class operator TdSingle4D.Divide( const A_:TdSingle4D; const B_:TdSingle ) :TdSingle4D;
begin
     with Result do
     begin
          X := A_.X / B_;
          Y := A_.Y / B_;
          Z := A_.Z / B_;
          W := A_.W / B_;
     end;
end;

///////////////////////////////////////////////////////////////////////// 型変換

class operator TdSingle4D.Implicit( const V_:TSingle4D ) :TdSingle4D;
const
     _d :TSingle4D = ( X:0; Y:0; Z:0; W:0 );
begin
     with Result do
     begin
          o := V_;
          d := _d;
     end;
end;

class operator TdSingle4D.Implicit( const V_:TdSingle4D ) :TSingle4D;
begin
     Result := V_.o;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdDouble4D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TdDouble4D.GetV( const I_:Integer ) :TdDouble;
begin
     Result := _[ I_ ];
end;

procedure TdDouble4D.SetV( const I_:Integer; const V_:TdDouble );
begin
     _[ I_ ] := V_;
end;

//------------------------------------------------------------------------------

function TdDouble4D.Geto :TDouble4D;
begin
     Result.X := X.o;
     Result.Y := Y.o;
     Result.Z := Z.o;
     Result.W := W.o;
end;

procedure TdDouble4D.Seto( const o_:TDouble4D );
begin
     X.o := o_.X;
     Y.o := o_.Y;
     Z.o := o_.Z;
     W.o := o_.W;
end;

function TdDouble4D.Getd :TDouble4D;
begin
     Result.X := X.d;
     Result.Y := Y.d;
     Result.Z := Z.d;
     Result.W := W.d;
end;

procedure TdDouble4D.Setd( const d_:TDouble4D );
begin
     X.d := d_.X;
     Y.d := d_.Y;
     Z.d := d_.Z;
     W.d := d_.W;
end;

function TdDouble4D.GetSiz2 :TdDouble;
begin
     Result := Pow2( X ) + Pow2( Y ) + Pow2( Z ) + Pow2( W );
end;

procedure TdDouble4D.SetSiz2( const Siz2_:TdDouble );
begin
     Self := Roo2( Siz2_ / Siz2 ) * Self;
end;

function TdDouble4D.GetSize :TdDouble;
begin
     Result := Roo2( Siz2 );
end;

procedure TdDouble4D.SetSize( const Size_:TdDouble );
begin
     Self := Size_ * Unitor;
end;

function TdDouble4D.GetUnitor :TdDouble4D;
begin
     Result := Self / Size;
end;

procedure TdDouble4D.SetUnitor( const Unitor_:TdDouble4D );
begin
     Self := Size * Unitor_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TdDouble4D.Create( const X_,Y_,Z_,W_:TdDouble );
begin
     X := X_;
     Y := Y_;
     Z := Z_;
     W := W_;
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TdDouble4D.Negative( const V_:TdDouble4D ) :TdDouble4D;
begin
     with Result do
     begin
          X := -V_.X;
          Y := -V_.Y;
          Z := -V_.Z;
          W := -V_.W;
     end;
end;

class operator TdDouble4D.Positive( const V_:TdDouble4D ) :TdDouble4D;
begin
     with Result do
     begin
          X := +V_.X;
          Y := +V_.Y;
          Z := +V_.Z;
          W := +V_.W;
     end;
end;

class operator TdDouble4D.Add( const A_,B_:TdDouble4D ) :TdDouble4D;
begin
     with Result do
     begin
          X := A_.X + B_.X;
          Y := A_.Y + B_.Y;
          Z := A_.Z + B_.Z;
          W := A_.W + B_.W;
     end;
end;

class operator TdDouble4D.Subtract( const A_,B_:TdDouble4D ) :TdDouble4D;
begin
     with Result do
     begin
          X := A_.X - B_.X;
          Y := A_.Y - B_.Y;
          Z := A_.Z - B_.Z;
          W := A_.W - B_.W;
     end;
end;

class operator TdDouble4D.Multiply( const A_:TdDouble4D; const B_:TdDouble ) :TdDouble4D;
begin
     with Result do
     begin
          X := A_.X * B_;
          Y := A_.Y * B_;
          Z := A_.Z * B_;
          W := A_.W * B_;
     end;
end;

class operator TdDouble4D.Multiply( const A_:TdDouble; const B_:TdDouble4D ) :TdDouble4D;
begin
     with Result do
     begin
          X := A_ * B_.X;
          Y := A_ * B_.Y;
          Z := A_ * B_.Z;
          W := A_ * B_.W;
     end;
end;

class operator TdDouble4D.Divide( const A_:TdDouble4D; const B_:TdDouble ) :TdDouble4D;
begin
     with Result do
     begin
          X := A_.X / B_;
          Y := A_.Y / B_;
          Z := A_.Z / B_;
          W := A_.W / B_;
     end;
end;

///////////////////////////////////////////////////////////////////////// 型変換

class operator TdDouble4D.Implicit( const V_:TDouble4D ) :TdDouble4D;
const
     _d :TDouble4D = ( X:0; Y:0; Z:0; W:0 );
begin
     with Result do
     begin
          o := V_;
          d := _d;
     end;
end;

class operator TdDouble4D.Implicit( const V_:TdDouble4D ) :TDouble4D;
begin
     Result := V_.o;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function DotProduct( const A_,B_:TSingleVec4D ) :Single;
begin
     Result := A_.X * B_.X
             + A_.Y * B_.Y
             + A_.Z * B_.Z
             + A_.W * B_.W;
end;

function DotProduct( const A_,B_:TDoubleVec4D ) :Double;
begin
     Result := A_.X * B_.X
             + A_.Y * B_.Y
             + A_.Z * B_.Z
             + A_.W * B_.W;
end;

function DotProduct( const A_,B_:TdSingleVec4D ) :TdSingle;
begin
     Result := A_.X * B_.X
             + A_.Y * B_.Y
             + A_.Z * B_.Z
             + A_.W * B_.W;
end;

function DotProduct( const A_,B_:TdDoubleVec4D ) :TdDouble;
begin
     Result := A_.X * B_.X
             + A_.Y * B_.Y
             + A_.Z * B_.Z
             + A_.W * B_.W;
end;

//------------------------------------------------------------------------------

function CrossProduct( const A_,B_,C_:TSingleVec4D ) :TSingleVec4D;
begin
     with Result do
     begin
          X := A_.Y * B_.Z * C_.W - A_.W * B_.Z * C_.Y
             + B_.Y * C_.Z * A_.W - B_.W * C_.Z * A_.Y
             + C_.Y * A_.Z * B_.W - C_.W * A_.Z * B_.Y;

          Y := A_.X * B_.W * C_.Z - A_.Z * B_.W * C_.X
             + B_.X * C_.W * A_.Z - B_.Z * C_.W * A_.X
             + C_.X * A_.W * B_.Z - C_.Z * A_.W * B_.X;

          Z := A_.W * B_.X * C_.Y - A_.Y * B_.X * C_.W
             + B_.W * C_.X * A_.Y - B_.Y * C_.X * A_.W
             + C_.W * A_.X * B_.Y - C_.Y * A_.X * B_.W;

          W := A_.Z * B_.Y * C_.X - A_.X * B_.Y * C_.Z
             + B_.Z * C_.Y * A_.X - B_.X * C_.Y * A_.Z
             + C_.Z * A_.Y * B_.X - C_.X * A_.Y * B_.Z;
     end;
end;

function CrossProduct( const A_,B_,C_:TDoubleVec4D ) :TDoubleVec4D;
begin
     with Result do
     begin
          X := A_.Y * B_.Z * C_.W - A_.W * B_.Z * C_.Y
             + B_.Y * C_.Z * A_.W - B_.W * C_.Z * A_.Y
             + C_.Y * A_.Z * B_.W - C_.W * A_.Z * B_.Y;

          Y := A_.X * B_.W * C_.Z - A_.Z * B_.W * C_.X
             + B_.X * C_.W * A_.Z - B_.Z * C_.W * A_.X
             + C_.X * A_.W * B_.Z - C_.Z * A_.W * B_.X;

          Z := A_.W * B_.X * C_.Y - A_.Y * B_.X * C_.W
             + B_.W * C_.X * A_.Y - B_.Y * C_.X * A_.W
             + C_.W * A_.X * B_.Y - C_.Y * A_.X * B_.W;

          W := A_.Z * B_.Y * C_.X - A_.X * B_.Y * C_.Z
             + B_.Z * C_.Y * A_.X - B_.X * C_.Y * A_.Z
             + C_.Z * A_.Y * B_.X - C_.X * A_.Y * B_.Z;
     end;
end;

function CrossProduct( const A_,B_,C_:TdSingleVec4D ) :TdSingleVec4D;
begin
     with Result do
     begin
          X := A_.Y * B_.Z * C_.W - A_.W * B_.Z * C_.Y
             + B_.Y * C_.Z * A_.W - B_.W * C_.Z * A_.Y
             + C_.Y * A_.Z * B_.W - C_.W * A_.Z * B_.Y;

          Y := A_.X * B_.W * C_.Z - A_.Z * B_.W * C_.X
             + B_.X * C_.W * A_.Z - B_.Z * C_.W * A_.X
             + C_.X * A_.W * B_.Z - C_.Z * A_.W * B_.X;

          Z := A_.W * B_.X * C_.Y - A_.Y * B_.X * C_.W
             + B_.W * C_.X * A_.Y - B_.Y * C_.X * A_.W
             + C_.W * A_.X * B_.Y - C_.Y * A_.X * B_.W;

          W := A_.Z * B_.Y * C_.X - A_.X * B_.Y * C_.Z
             + B_.Z * C_.Y * A_.X - B_.X * C_.Y * A_.Z
             + C_.Z * A_.Y * B_.X - C_.X * A_.Y * B_.Z;
     end;
end;

function CrossProduct( const A_,B_,C_:TdDoubleVec4D ) :TdDoubleVec4D;
begin
     with Result do
     begin
          X := A_.Y * B_.Z * C_.W - A_.W * B_.Z * C_.Y
             + B_.Y * C_.Z * A_.W - B_.W * C_.Z * A_.Y
             + C_.Y * A_.Z * B_.W - C_.W * A_.Z * B_.Y;

          Y := A_.X * B_.W * C_.Z - A_.Z * B_.W * C_.X
             + B_.X * C_.W * A_.Z - B_.Z * C_.W * A_.X
             + C_.X * A_.W * B_.Z - C_.Z * A_.W * B_.X;

          Z := A_.W * B_.X * C_.Y - A_.Y * B_.X * C_.W
             + B_.W * C_.X * A_.Y - B_.Y * C_.X * A_.W
             + C_.W * A_.X * B_.Y - C_.Y * A_.X * B_.W;

          W := A_.Z * B_.Y * C_.X - A_.X * B_.Y * C_.Z
             + B_.Z * C_.Y * A_.X - B_.X * C_.Y * A_.Z
             + C_.Z * A_.Y * B_.X - C_.X * A_.Y * B_.Z;
     end;
end;

//------------------------------------------------------------------------------

function Dista2( const A_,B_:TSinglePos4D ) :Single;
begin
     Result := Pow2( B_.X - A_.X )
             + Pow2( B_.Y - A_.Y )
             + Pow2( B_.Z - A_.Z )
             + Pow2( B_.W - A_.W );
end;

function Dista2( const A_,B_:TDoublePos4D ) :Double;
begin
     Result := Pow2( B_.X - A_.X )
             + Pow2( B_.Y - A_.Y )
             + Pow2( B_.Z - A_.Z )
             + Pow2( B_.W - A_.W );
end;

function Dista2( const A_,B_:TdSinglePos4D ) :TdSingle;
begin
     Result := Pow2( B_.X - A_.X )
             + Pow2( B_.Y - A_.Y )
             + Pow2( B_.Z - A_.Z )
             + Pow2( B_.W - A_.W );
end;

function Dista2( const A_,B_:TdDoublePos4D ) :TdDouble;
begin
     Result := Pow2( B_.X - A_.X )
             + Pow2( B_.Y - A_.Y )
             + Pow2( B_.Z - A_.Z )
             + Pow2( B_.W - A_.W );
end;

//------------------------------------------------------------------------------

function Distan( const A_,B_:TSinglePos4D ) :Single;
begin
     Result := Roo2( Dista2( A_, B_ ) );
end;

function Distan( const A_,B_:TDoublePos4D ) :Double;
begin
     Result := Roo2( Dista2( A_, B_ ) );
end;

function Distan( const A_,B_:TdSinglePos4D ) :TdSingle;
begin
     Result := Roo2( Dista2( A_, B_ ) );
end;

function Distan( const A_,B_:TdDoublePos4D ) :TdDouble;
begin
     Result := Roo2( Dista2( A_, B_ ) );
end;

//------------------------------------------------------------------------------

function Ave( const P1_,P2_:TSingle4D ) :TSingle4D;
begin
     Result := ( P1_ + P2_ ) / 2;
end;

function Ave( const P1_,P2_:TDouble4D ) :TDouble4D;
begin
     Result := ( P1_ + P2_ ) / 2;
end;

function Ave( const P1_,P2_:TdSingle4D ) :TdSingle4D;
begin
     Result := ( P1_ + P2_ ) / 2;
end;

function Ave( const P1_,P2_:TdDouble4D ) :TdDouble4D;
begin
     Result := ( P1_ + P2_ ) / 2;
end;

//------------------------------------------------------------------------------

function Ave( const P1_,P2_,P3_:TSingle4D ) :TSingle4D;
begin
     Result := ( P1_ + P2_ + P3_ ) / 3;
end;

function Ave( const P1_,P2_,P3_:TDouble4D ) :TDouble4D;
begin
     Result := ( P1_ + P2_ + P3_ ) / 3;
end;

function Ave( const P1_,P2_,P3_:TdSingle4D ) :TdSingle4D;
begin
     Result := ( P1_ + P2_ + P3_ ) / 3;
end;

function Ave( const P1_,P2_,P3_:TdDouble4D ) :TdDouble4D;
begin
     Result := ( P1_ + P2_ + P3_ ) / 3;
end;

//------------------------------------------------------------------------------

function Ave( const P1_,P2_,P3_,P4_:TSingle4D ) :TSingle4D;
begin
     Result := ( P1_ + P2_ + P3_ + P4_ ) / 4;
end;

function Ave( const P1_,P2_,P3_,P4_:TDouble4D ) :TDouble4D;
begin
     Result := ( P1_ + P2_ + P3_ + P4_ ) / 4;
end;

function Ave( const P1_,P2_,P3_,P4_:TdSingle4D ) :TdSingle4D;
begin
     Result := ( P1_ + P2_ + P3_ + P4_ ) / 4;
end;

function Ave( const P1_,P2_,P3_,P4_:TdDouble4D ) :TdDouble4D;
begin
     Result := ( P1_ + P2_ + P3_ + P4_ ) / 4;
end;

//------------------------------------------------------------------------------

function PolySolveReal( const Ks_:TSingle4D; out Xs_:TSingle3D ) :Byte;
var
   Xs :TSingle2D;
   A0, A1, A2, B2, P, Q, P3, Q2, D, D2, R, T, R3, T3, U, V, Y0, Y1, Y2 :Single;
begin
     if Ks_._4 = 0 then
     begin
          Result := PolySolveReal( TSingle3D( Ks_ ), Xs );

          Xs_ := Xs;
     end
     else
     begin
          with Ks_ do
          begin
               A0 := _1 / _4;
               A1 := _2 / _4;
               A2 := _3 / _4;
          end;

          B2 := A2 / 3;

          P := A1 - Pow2( A2 ) / 3;
          Q := A0 + ( 2 * Pow2( B2 ) - A1 ) * B2;

          P3 := P / 3;
          Q2 := Q / 2;

          D := Pow2( Q2 ) + Pow3( P3 );

          case Sign( D ) of
           -1: begin
                    R := Roo2( Pow2( -Q2 ) - D );
                    T := ArcTan2( Roo2( -D ), -Q2 );

                    R3 := 2 * Roo3( R );
                    T3 := T / 3;

                    Y0 := R3 * Cos( T3 + P3i2 );
                    Y1 := R3 * Cos( T3 - P3i2 );
                    Y2 := R3 * Cos( T3        );

                    Xs_[ 1 ] := Y0 - B2;
                    Xs_[ 2 ] := Y1 - B2;
                    Xs_[ 3 ] := Y2 - B2;

                    Result := 3;
               end;
            0: begin
                    Y0 := 2 * Roo3( -Q2 );

                    Xs_[ 1 ] := Y0 - B2;

                    Result := 1;
               end;
           +1: begin
                    D2 := Roo2( D );

                    U := Roo3( -Q2 + D2 );
                    V := Roo3( -Q2 - D2 );

                    Y0 := U + V;

                    Xs_[ 1 ] := Y0 - B2;

                    Result := 1;
               end;
          else Result := 0;
          end;
     end;
end;

function PolySolveReal( const Ks_:TDouble4D; out Xs_:TDouble3D ) :Byte;
var
   Xs :TDouble2D;
   A0, A1, A2, B2, P, Q, P3, Q2, D, D2, R, T, R3, T3, U, V, Y0, Y1, Y2 :Double;
begin
     if Ks_._4 = 0 then
     begin
          Result := PolySolveReal( TDouble3D( Ks_ ), Xs );

          Xs_ := Xs;
     end
     else
     begin
          with Ks_ do
          begin
               A0 := _1 / _4;
               A1 := _2 / _4;
               A2 := _3 / _4;
          end;

          B2 := A2 / 3;

          P := A1 - Pow2( A2 ) / 3;
          Q := A0 + ( 2 * Pow2( B2 ) - A1 ) * B2;

          P3 := P / 3;
          Q2 := Q / 2;

          D := Pow2( Q2 ) + Pow3( P3 );

          case Sign( D ) of
           -1: begin
                    R := Roo2( Pow2( -Q2 ) - D );
                    T := ArcTan2( Roo2( -D ), -Q2 );

                    R3 := 2 * Roo3( R );
                    T3 := T / 3;

                    Y0 := R3 * Cos( T3 + P3i2 );
                    Y1 := R3 * Cos( T3 - P3i2 );
                    Y2 := R3 * Cos( T3        );

                    Xs_[ 1 ] := Y0 - B2;
                    Xs_[ 2 ] := Y1 - B2;
                    Xs_[ 3 ] := Y2 - B2;

                    Result := 3;
               end;
            0: begin
                    Y0 := 2 * Roo3( -Q2 );

                    Xs_[ 1 ] := Y0 - B2;

                    Result := 1;
               end;
           +1: begin
                    D2 := Roo2( D );

                    U := Roo3( -Q2 + D2 );
                    V := Roo3( -Q2 - D2 );

                    Y0 := U + V;

                    Xs_[ 1 ] := Y0 - B2;

                    Result := 1;
               end;
          else Result := 0;
          end;
     end;
end;

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
