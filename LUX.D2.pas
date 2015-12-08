unit LUX.D2;

interface //#################################################################### ■

uses System.Types,
     LUX, LUX.D1;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingle2D

     TSingle2D = record
     private
       ///// アクセス
       function GetSiz2 :Single; inline;
       procedure SetSiz2( const Siz2_:Single ); inline;
       function GetSize :Single; inline;
       procedure SetSize( const Size_:Single ); inline;
       function GetUnitor :TSingle2D; inline;
       procedure SetUnitor( const Unitor_:TSingle2D ); inline;
     public
       X :Single;
       Y :Single;
       /////
       constructor Create( const X_,Y_:Single );
       ///// プロパティ
       property Siz2   :Single    read GetSiz2   write SetSiz2;
       property Size   :Single    read GetSize   write SetSize;
       property Unitor :TSingle2D read GetUnitor write SetUnitor;
       ///// 演算子
       class operator Negative( const V_:TSingle2D ) :TSingle2D; inline;
       class operator Positive( const V_:TSingle2D ) :TSingle2D; inline;
       class operator Add( const A_,B_:TSingle2D ) :TSingle2D; inline;
       class operator Subtract( const A_,B_:TSingle2D ) :TSingle2D; inline;
       class operator Multiply( const A_:TSingle2D; const B_:Single ) :TSingle2D; inline;
       class operator Multiply( const A_:Single; const B_:TSingle2D ) :TSingle2D; inline;
       class operator Divide( const A_:TSingle2D; const B_:Single ) :TSingle2D; inline;
       ///// 型変換
       class operator Implicit( const V_:TPointF ) :TSingle2D; inline;
       class operator Implicit( const V_:TSingle2D ) :TPointF; inline;
       ///// 定数
       class function IdentityX :TSingle2D; inline; static;
       class function IdentityY :TSingle2D; inline; static;
     end;

     TSinglePos2D = TSingle2D;
     TSingleVec2D = TSingle2D;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDouble2D

     TDouble2D = record
     private
       ///// アクセス
       function GetSiz2 :Double; inline;
       procedure SetSiz2( const Siz2_:Double ); inline;
       function GetSize :Double; inline;
       procedure SetSize( const Size_:Double ); inline;
       function GetUnitor :TDouble2D; inline;
       procedure SetUnitor( const Unitor_:TDouble2D ); inline;
     public
       X :Double;
       Y :Double;
       /////
       constructor Create( const X_,Y_:Double );
       ///// プロパティ
       property Siz2   :Double    read GetSiz2   write SetSiz2;
       property Size   :Double    read GetSize   write SetSize;
       property Unitor :TDouble2D read GetUnitor write SetUnitor;
       ///// 演算子
       class operator Negative( const V_:TDouble2D ) :TDouble2D; inline;
       class operator Positive( const V_:TDouble2D ) :TDouble2D; inline;
       class operator Add( const A_,B_:TDouble2D ) :TDouble2D; inline;
       class operator Subtract( const A_,B_:TDouble2D ) :TDouble2D; inline;
       class operator Multiply( const A_:TDouble2D; const B_:Double ) :TDouble2D; inline;
       class operator Multiply( const A_:Double; const B_:TDouble2D ) :TDouble2D; inline;
       class operator Divide( const A_:TDouble2D; const B_:Double ) :TDouble2D; inline;
       ///// 型変換
       class operator Implicit( const V_:TPointF ) :TDouble2D; inline;
       class operator Implicit( const V_:TDouble2D ) :TPointF; inline;
       ///// 定数
       class function IdentityX :TDouble2D; inline; static;
       class function IdentityY :TDouble2D; inline; static;
     end;

     TDoublePos2D = TDouble2D;
     TDoubleVec2D = TDouble2D;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdSingle2D

     TdSingle2D = record
     private
       ///// アクセス
       function Geto :TSingle2D; inline;
       procedure Seto( const o_:TSingle2D ); inline;
       function Getd :TSingle2D; inline;
       procedure Setd( const d_:TSingle2D ); inline;
     public
       X :TdSingle;
       Y :TdSingle;
       /////
       constructor Create( const X_,Y_:TdSingle );
       ///// プロパティ
       property o :TSingle2D read Geto write Seto;
       property d :TSingle2D read Getd write Setd;
     end;

     TdSinglePos2D = TdSingle2D;
     TdSingleVec2D = TdSingle2D;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdDouble2D

     TdDouble2D = record
     private
       ///// アクセス
       function Geto :TDouble2D; inline;
       procedure Seto( const o_:TDouble2D ); inline;
       function Getd :TDouble2D; inline;
       procedure Setd( const d_:TDouble2D ); inline;
     public
       X :TdDouble;
       Y :TdDouble;
       /////
       constructor Create( const X_,Y_:TdDouble );
       ///// プロパティ
       property o :TDouble2D read Geto write Seto;
       property d :TDouble2D read Getd write Setd;
     end;

     TdDoublePos2D = TdDouble2D;
     TdDoubleVec2D = TdDouble2D;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleSiz2D

     TSingleSiz2D = record
     private
     public
       X :Single;
       Y :Single;
       /////
       constructor Create( const X_,Y_:Single );
       ///// 演算子
       class operator Negative( const V_:TSingleSiz2D ) :TSingleSiz2D; inline;
       class operator Positive( const V_:TSingleSiz2D ) :TSingleSiz2D; inline;
       class operator Add( const A_,B_:TSingleSiz2D ) :TSingleSiz2D; inline;
       class operator Subtract( const A_,B_:TSingleSiz2D ) :TSingleSiz2D; inline;
       class operator Multiply( const A_:TSingleSiz2D; const B_:Single ) :TSingleSiz2D; inline;
       class operator Multiply( const A_:Single; const B_:TSingleSiz2D ) :TSingleSiz2D; inline;
       class operator Divide( const A_:TSingleSiz2D; const B_:Single ) :TSingleSiz2D; inline;
       ///// 型変換
       class operator Implicit( const V_:TPointF ) :TSingleSiz2D; inline;
       class operator Implicit( const V_:TSingleSiz2D ) :TPointF; inline;
       class operator Implicit( const V_:TSingle2D ) :TSingleSiz2D; inline;
       class operator Implicit( const V_:TSingleSiz2D ) :TSingle2D; inline;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleSiz2D

     TDoubleSiz2D = record
     private
     public
       X :Double;
       Y :Double;
       /////
       constructor Create( const X_,Y_:Double );
       ///// 演算子
       class operator Negative( const V_:TDoubleSiz2D ) :TDoubleSiz2D; inline;
       class operator Positive( const V_:TDoubleSiz2D ) :TDoubleSiz2D; inline;
       class operator Add( const A_,B_:TDoubleSiz2D ) :TDoubleSiz2D; inline;
       class operator Subtract( const A_,B_:TDoubleSiz2D ) :TDoubleSiz2D; inline;
       class operator Multiply( const A_:TDoubleSiz2D; const B_:Double ) :TDoubleSiz2D; inline;
       class operator Multiply( const A_:Double; const B_:TDoubleSiz2D ) :TDoubleSiz2D; inline;
       class operator Divide( const A_:TDoubleSiz2D; const B_:Double ) :TDoubleSiz2D; inline;
       ///// 型変換
       class operator Implicit( const V_:TPointF ) :TDoubleSiz2D; inline;
       class operator Implicit( const V_:TDoubleSiz2D ) :TPointF; inline;
       class operator Implicit( const V_:TDouble2D ) :TDoubleSiz2D; inline;
       class operator Implicit( const V_:TDoubleSiz2D ) :TDouble2D; inline;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdSingleSiz2D

     TdSingleSiz2D = record
     private
       ///// アクセス
       function Geto :TSingleSiz2D; inline;
       procedure Seto( const o_:TSingleSiz2D ); inline;
       function Getd :TSingleSiz2D; inline;
       procedure Setd( const d_:TSingleSiz2D ); inline;
     public
       X :TdSingle;
       Y :TdSingle;
       /////
       constructor Create( const X_,Y_:TdSingle );
       ///// プロパティ
       property o :TSingleSiz2D read Geto write Seto;
       property d :TSingleSiz2D read Getd write Setd;
       ///// 演算子
       class operator Negative( const V_:TdSingleSiz2D ) :TdSingleSiz2D; inline;
       class operator Positive( const V_:TdSingleSiz2D ) :TdSingleSiz2D; inline;
       class operator Add( const A_,B_:TdSingleSiz2D ) :TdSingleSiz2D; inline;
       class operator Subtract( const A_,B_:TdSingleSiz2D ) :TdSingleSiz2D; inline;
       class operator Multiply( const A_:TdSingleSiz2D; const B_:TdSingle ) :TdSingleSiz2D; inline;
       class operator Multiply( const A_:TdSingle; const B_:TdSingleSiz2D ) :TdSingleSiz2D; inline;
       class operator Divide( const A_:TdSingleSiz2D; const B_:TdSingle ) :TdSingleSiz2D; inline;
       ///// 型変換
       class operator Implicit( const V_:TdSingle2D ) :TdSingleSiz2D; inline;
       class operator Implicit( const V_:TdSingleSiz2D ) :TdSingle2D; inline;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdDoubleSiz2D

     TdDoubleSiz2D = record
     private
       ///// アクセス
       function Geto :TDoubleSiz2D; inline;
       procedure Seto( const o_:TDoubleSiz2D ); inline;
       function Getd :TDoubleSiz2D; inline;
       procedure Setd( const d_:TDoubleSiz2D ); inline;
     public
       X :TdDouble;
       Y :TdDouble;
       /////
       constructor Create( const X_,Y_:TdDouble );
       ///// プロパティ
       property o :TDoubleSiz2D read Geto write Seto;
       property d :TDoubleSiz2D read Getd write Setd;
       ///// 演算子
       class operator Negative( const V_:TdDoubleSiz2D ) :TdDoubleSiz2D; inline;
       class operator Positive( const V_:TdDoubleSiz2D ) :TdDoubleSiz2D; inline;
       class operator Add( const A_,B_:TdDoubleSiz2D ) :TdDoubleSiz2D; inline;
       class operator Subtract( const A_,B_:TdDoubleSiz2D ) :TdDoubleSiz2D; inline;
       class operator Multiply( const A_:TdDoubleSiz2D; const B_:TdDouble ) :TdDoubleSiz2D; inline;
       class operator Multiply( const A_:TdDouble; const B_:TdDoubleSiz2D ) :TdDoubleSiz2D; inline;
       class operator Divide( const A_:TdDoubleSiz2D; const B_:TdDouble ) :TdDoubleSiz2D; inline;
       ///// 型変換
       class operator Implicit( const V_:TdDouble2D ) :TdDoubleSiz2D; inline;
       class operator Implicit( const V_:TdDoubleSiz2D ) :TdDouble2D; inline;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleCircle2D

     TSingleCircle2D = record
     private
     public
       Center :TSinglePos2D;
       Radius :Single;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleCircle2D

     TDoubleCircle2D = record
     private
     public
       Center :TDoublePos2D;
       Radius :Double;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdSingleCircle2D

     TdSingleCircle2D = record
     private
       ///// アクセス
       function Geto :TSingleCircle2D; inline;
       procedure Seto( const o_:TSingleCircle2D ); inline;
       function Getd :TSingleCircle2D; inline;
       procedure Setd( const d_:TSingleCircle2D ); inline;
     public
       Center :TdSinglePos2D;
       Radius :TdSingle;
       ///// プロパティ
       property o :TSingleCircle2D read Geto write Seto;
       property d :TSingleCircle2D read Getd write Setd;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdDoubleCircle2D

     TdDoubleCircle2D = record
     private
       ///// アクセス
       function Geto :TDoubleCircle2D; inline;
       procedure Seto( const o_:TDoubleCircle2D ); inline;
       function Getd :TDoubleCircle2D; inline;
       procedure Setd( const d_:TDoubleCircle2D ); inline;
     public
       Center :TdDoublePos2D;
       Radius :TdDouble;
       ///// プロパティ
       property o :TDoubleCircle2D read Geto write Seto;
       property d :TDoubleCircle2D read Getd write Setd;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleEllipse2D

     TSingleEllipse2D = record
     private
     public
       Center :TSinglePos2D;
       Radius :TSingleSiz2D;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleEllipse2D

     TDoubleEllipse2D = record
     private
     public
       Center :TDoublePos2D;
       Radius :TDoubleSiz2D;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdSingleEllipse2D

     TdSingleEllipse2D = record
     private
       ///// アクセス
       function Geto :TSingleEllipse2D; inline;
       procedure Seto( const o_:TSingleEllipse2D ); inline;
       function Getd :TSingleEllipse2D; inline;
       procedure Setd( const d_:TSingleEllipse2D ); inline;
     public
       Center :TdSinglePos2D;
       Radius :TdSingleSiz2D;
       ///// プロパティ
       property o :TSingleEllipse2D read Geto write Seto;
       property d :TSingleEllipse2D read Getd write Setd;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdDoubleEllipse2D

     TdDoubleEllipse2D = record
     private
       ///// アクセス
       function Geto :TDoubleEllipse2D; inline;
       procedure Seto( const o_:TDoubleEllipse2D ); inline;
       function Getd :TDoubleEllipse2D; inline;
       procedure Setd( const d_:TDoubleEllipse2D ); inline;
     public
       Center :TdDoublePos2D;
       Radius :TdDoubleSiz2D;
       ///// プロパティ
       property o :TDoubleEllipse2D read Geto write Seto;
       property d :TDoubleEllipse2D read Getd write Setd;
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function DotProduct( const A_,B_:TSingleVec2D ) :Single; inline; overload;
function DotProduct( const A_,B_:TDoubleVec2D ) :Double; inline; overload;

function Distance( const A_,B_:TSinglePos2D ) :Single; inline; overload;
function Distance( const A_,B_:TDoublePos2D ) :Double; inline; overload;

function Ave( const A_,B_:TSingle2D ) :TSingle2D; inline; overload;
function Ave( const A_,B_:TDouble2D ) :TDouble2D; inline; overload;

implementation //############################################################### ■

uses System.Math;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingle2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TSingle2D.GetSiz2 :Single;
begin
     Result := Pow2( X ) + Pow2( Y );
end;

procedure TSingle2D.SetSiz2( const Siz2_:Single );
begin
     Self := Roo2( Siz2_ / Siz2 ) * Self;
end;

function TSingle2D.GetSize :Single;
begin
     Result := Roo2( Siz2 );
end;

procedure TSingle2D.SetSize( const Size_:Single );
begin
     Self := Size_ * Unitor;
end;

function TSingle2D.GetUnitor :TSingle2D;
begin
     Result := Self / Size;
end;

procedure TSingle2D.SetUnitor( const Unitor_:TSingle2D );
begin
     Self := Size * Unitor_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TSingle2D.Create( const X_,Y_:Single );
begin
     X := X_;
     Y := Y_;
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TSingle2D.Negative( const V_:TSingle2D ) :TSingle2D;
begin
     with Result do
     begin
          X := -V_.X;
          Y := -V_.Y;
     end;
end;

class operator TSingle2D.Positive( const V_:TSingle2D ) :TSingle2D;
begin
     with Result do
     begin
          X := +V_.X;
          Y := +V_.Y;
     end;
end;

class operator TSingle2D.Add( const A_,B_:TSingle2D ) :TSingle2D;
begin
     with Result do
     begin
          X := A_.X + B_.X;
          Y := A_.Y + B_.Y;
     end;
end;

class operator TSingle2D.Subtract( const A_,B_:TSingle2D ) :TSingle2D;
begin
     with Result do
     begin
          X := A_.X - B_.X;
          Y := A_.Y - B_.Y;
     end;
end;

class operator TSingle2D.Multiply( const A_:TSingle2D; const B_:Single ) :TSingle2D;
begin
     with Result do
     begin
          X := A_.X * B_;
          Y := A_.Y * B_;
     end;
end;

class operator TSingle2D.Multiply( const A_:Single; const B_:TSingle2D ) :TSingle2D;
begin
     with Result do
     begin
          X := A_ * B_.X;
          Y := A_ * B_.Y;
     end;
end;

class operator TSingle2D.Divide( const A_:TSingle2D; const B_:Single ) :TSingle2D;
begin
     with Result do
     begin
          X := A_.X / B_;
          Y := A_.Y / B_;
     end;
end;

///////////////////////////////////////////////////////////////////////// 型変換

class operator TSingle2D.Implicit( const V_:TPointF ) :TSingle2D;
begin
     with Result do
     begin
          X := +V_.X;
          Y := -V_.Y;
     end;
end;

class operator TSingle2D.Implicit( const V_:TSingle2D ) :TPointF;
begin
     with Result do
     begin
          X := +V_.X;
          Y := -V_.Y;
     end;
end;

/////////////////////////////////////////////////////////////////////////// 定数

class function TSingle2D.IdentityX :TSingle2D;
begin
     with Result do
     begin
          X := 1;
          Y := 0;
     end;
end;

class function TSingle2D.IdentityY :TSingle2D;
begin
     with Result do
     begin
          X := 0;
          Y := 1;
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDouble2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TDouble2D.GetSiz2 :Double;
begin
     Result := Pow2( X ) + Pow2( Y );
end;

procedure TDouble2D.SetSiz2( const Siz2_:Double );
begin
     Self := Roo2( Siz2_ / Siz2 ) * Self;
end;

function TDouble2D.GetSize :Double;
begin
     Result := Roo2( Siz2 );
end;

procedure TDouble2D.SetSize( const Size_:Double );
begin
     Self := Size_ * Unitor;
end;

function TDouble2D.GetUnitor :TDouble2D;
begin
     Result := Self / Size;
end;

procedure TDouble2D.SetUnitor( const Unitor_:TDouble2D );
begin
     Self := Size * Unitor_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TDouble2D.Create( const X_,Y_:Double );
begin
     X := X_;
     Y := Y_;
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TDouble2D.Negative( const V_:TDouble2D ) :TDouble2D;
begin
     with Result do
     begin
          X := -V_.X;
          Y := -V_.Y;
     end;
end;

class operator TDouble2D.Positive( const V_:TDouble2D ) :TDouble2D;
begin
     with Result do
     begin
          X := +V_.X;
          Y := +V_.Y;
     end;
end;

class operator TDouble2D.Add( const A_,B_:TDouble2D ) :TDouble2D;
begin
     with Result do
     begin
          X := A_.X + B_.X;
          Y := A_.Y + B_.Y;
     end;
end;

class operator TDouble2D.Subtract( const A_,B_:TDouble2D ) :TDouble2D;
begin
     with Result do
     begin
          X := A_.X - B_.X;
          Y := A_.Y - B_.Y;
     end;
end;

class operator TDouble2D.Multiply( const A_:TDouble2D; const B_:Double ) :TDouble2D;
begin
     with Result do
     begin
          X := A_.X * B_;
          Y := A_.Y * B_;
     end;
end;

class operator TDouble2D.Multiply( const A_:Double; const B_:TDouble2D ) :TDouble2D;
begin
     with Result do
     begin
          X := A_ * B_.X;
          Y := A_ * B_.Y;
     end;
end;

class operator TDouble2D.Divide( const A_:TDouble2D; const B_:Double ) :TDouble2D;
begin
     with Result do
     begin
          X := A_.X / B_;
          Y := A_.Y / B_;
     end;
end;

///////////////////////////////////////////////////////////////////////// 型変換

class operator TDouble2D.Implicit( const V_:TPointF ) :TDouble2D;
begin
     with Result do
     begin
          X := +V_.X;
          Y := -V_.Y;
     end;
end;

class operator TDouble2D.Implicit( const V_:TDouble2D ) :TPointF;
begin
     with Result do
     begin
          X := +V_.X;
          Y := -V_.Y;
     end;
end;

/////////////////////////////////////////////////////////////////////////// 定数

class function TDouble2D.IdentityX :TDouble2D;
begin
     with Result do
     begin
          X := 1;
          Y := 0;
     end;
end;

class function TDouble2D.IdentityY :TDouble2D;
begin
     with Result do
     begin
          X := 0;
          Y := 1;
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdSingle2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TdSingle2D.Geto :TSingle2D;
begin
     Result.X := X.o;
     Result.Y := Y.o;
end;

procedure TdSingle2D.Seto( const o_:TSingle2D );
begin
     X.o := o_.X;
     Y.o := o_.Y;
end;

function TdSingle2D.Getd :TSingle2D;
begin
     Result.X := X.d;
     Result.Y := Y.d;
end;

procedure TdSingle2D.Setd( const d_:TSingle2D );
begin
     X.d := d_.X;
     Y.d := d_.Y;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TdSingle2D.Create( const X_,Y_:TdSingle );
begin
     X := X_;
     Y := Y_;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdDouble2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TdDouble2D.Geto :TDouble2D;
begin
     Result.X := X.o;
     Result.Y := Y.o;
end;

procedure TdDouble2D.Seto( const o_:TDouble2D );
begin
     X.o := o_.X;
     Y.o := o_.Y;
end;

function TdDouble2D.Getd :TDouble2D;
begin
     Result.X := X.d;
     Result.Y := Y.d;
end;

procedure TdDouble2D.Setd( const d_:TDouble2D );
begin
     X.d := d_.X;
     Y.d := d_.Y;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TdDouble2D.Create( const X_,Y_:TdDouble );
begin
     X := X_;
     Y := Y_;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleSiz2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TSingleSiz2D.Create( const X_,Y_:Single );
begin
     X := X_;
     Y := Y_;
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TSingleSiz2D.Negative( const V_:TSingleSiz2D ) :TSingleSiz2D;
begin
     with Result do
     begin
          X := -V_.X;
          Y := -V_.Y;
     end;
end;

class operator TSingleSiz2D.Positive( const V_:TSingleSiz2D ) :TSingleSiz2D;
begin
     with Result do
     begin
          X := +V_.X;
          Y := +V_.Y;
     end;
end;

class operator TSingleSiz2D.Add( const A_,B_:TSingleSiz2D ) :TSingleSiz2D;
begin
     with Result do
     begin
          X := A_.X + B_.X;
          Y := A_.Y + B_.Y;
     end;
end;

class operator TSingleSiz2D.Subtract( const A_,B_:TSingleSiz2D ) :TSingleSiz2D;
begin
     with Result do
     begin
          X := A_.X - B_.X;
          Y := A_.Y - B_.Y;
     end;
end;

class operator TSingleSiz2D.Multiply( const A_:TSingleSiz2D; const B_:Single ) :TSingleSiz2D;
begin
     with Result do
     begin
          X := A_.X * B_;
          Y := A_.Y * B_;
     end;
end;

class operator TSingleSiz2D.Multiply( const A_:Single; const B_:TSingleSiz2D ) :TSingleSiz2D;
begin
     with Result do
     begin
          X := A_ * B_.X;
          Y := A_ * B_.Y;
     end;
end;

class operator TSingleSiz2D.Divide( const A_:TSingleSiz2D; const B_:Single ) :TSingleSiz2D;
begin
     with Result do
     begin
          X := A_.X / B_;
          Y := A_.Y / B_;
     end;
end;

///////////////////////////////////////////////////////////////////////// 型変換

class operator TSingleSiz2D.Implicit( const V_:TPointF ) :TSingleSiz2D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
     end;
end;

class operator TSingleSiz2D.Implicit( const V_:TSingleSiz2D ) :TPointF;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
     end;
end;

class operator TSingleSiz2D.Implicit( const V_:TSingle2D ) :TSingleSiz2D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
     end;
end;

class operator TSingleSiz2D.Implicit( const V_:TSingleSiz2D ) :TSingle2D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleSiz2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TDoubleSiz2D.Create( const X_,Y_:Double );
begin
     X := X_;
     Y := Y_;
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TDoubleSiz2D.Negative( const V_:TDoubleSiz2D ) :TDoubleSiz2D;
begin
     with Result do
     begin
          X := -V_.X;
          Y := -V_.Y;
     end;
end;

class operator TDoubleSiz2D.Positive( const V_:TDoubleSiz2D ) :TDoubleSiz2D;
begin
     with Result do
     begin
          X := +V_.X;
          Y := +V_.Y;
     end;
end;

class operator TDoubleSiz2D.Add( const A_,B_:TDoubleSiz2D ) :TDoubleSiz2D;
begin
     with Result do
     begin
          X := A_.X + B_.X;
          Y := A_.Y + B_.Y;
     end;
end;

class operator TDoubleSiz2D.Subtract( const A_,B_:TDoubleSiz2D ) :TDoubleSiz2D;
begin
     with Result do
     begin
          X := A_.X - B_.X;
          Y := A_.Y - B_.Y;
     end;
end;

class operator TDoubleSiz2D.Multiply( const A_:TDoubleSiz2D; const B_:Double ) :TDoubleSiz2D;
begin
     with Result do
     begin
          X := A_.X * B_;
          Y := A_.Y * B_;
     end;
end;

class operator TDoubleSiz2D.Multiply( const A_:Double; const B_:TDoubleSiz2D ) :TDoubleSiz2D;
begin
     with Result do
     begin
          X := A_ * B_.X;
          Y := A_ * B_.Y;
     end;
end;

class operator TDoubleSiz2D.Divide( const A_:TDoubleSiz2D; const B_:Double ) :TDoubleSiz2D;
begin
     with Result do
     begin
          X := A_.X / B_;
          Y := A_.Y / B_;
     end;
end;

///////////////////////////////////////////////////////////////////////// 型変換

class operator TDoubleSiz2D.Implicit( const V_:TPointF ) :TDoubleSiz2D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
     end;
end;

class operator TDoubleSiz2D.Implicit( const V_:TDoubleSiz2D ) :TPointF;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
     end;
end;

class operator TDoubleSiz2D.Implicit( const V_:TDouble2D ) :TDoubleSiz2D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
     end;
end;

class operator TDoubleSiz2D.Implicit( const V_:TDoubleSiz2D ) :TDouble2D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdSingleSiz2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TdSingleSiz2D.Geto :TSingleSiz2D;
begin
     Result.X := X.o;
     Result.Y := Y.o;
end;

procedure TdSingleSiz2D.Seto( const o_:TSingleSiz2D );
begin
     X.o := o_.X;
     Y.o := o_.Y;
end;

function TdSingleSiz2D.Getd :TSingleSiz2D;
begin
     Result.X := X.d;
     Result.Y := Y.d;
end;

procedure TdSingleSiz2D.Setd( const d_:TSingleSiz2D );
begin
     X.d := d_.X;
     Y.d := d_.Y;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TdSingleSiz2D.Create( const X_,Y_:TdSingle );
begin
     X := X_;
     Y := Y_;
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TdSingleSiz2D.Negative( const V_:TdSingleSiz2D ) :TdSingleSiz2D;
begin
     with Result do
     begin
          X := -V_.X;
          Y := -V_.Y;
     end;
end;

class operator TdSingleSiz2D.Positive( const V_:TdSingleSiz2D ) :TdSingleSiz2D;
begin
     with Result do
     begin
          X := +V_.X;
          Y := +V_.Y;
     end;
end;

class operator TdSingleSiz2D.Add( const A_,B_:TdSingleSiz2D ) :TdSingleSiz2D;
begin
     with Result do
     begin
          X := A_.X + B_.X;
          Y := A_.Y + B_.Y;
     end;
end;

class operator TdSingleSiz2D.Subtract( const A_,B_:TdSingleSiz2D ) :TdSingleSiz2D;
begin
     with Result do
     begin
          X := A_.X - B_.X;
          Y := A_.Y - B_.Y;
     end;
end;

class operator TdSingleSiz2D.Multiply( const A_:TdSingleSiz2D; const B_:TdSingle ) :TdSingleSiz2D;
begin
     with Result do
     begin
          X := A_.X * B_;
          Y := A_.Y * B_;
     end;
end;

class operator TdSingleSiz2D.Multiply( const A_:TdSingle; const B_:TdSingleSiz2D ) :TdSingleSiz2D;
begin
     with Result do
     begin
          X := A_ * B_.X;
          Y := A_ * B_.Y;
     end;
end;

class operator TdSingleSiz2D.Divide( const A_:TdSingleSiz2D; const B_:TdSingle ) :TdSingleSiz2D;
begin
     with Result do
     begin
          X := A_.X / B_;
          Y := A_.Y / B_;
     end;
end;

///////////////////////////////////////////////////////////////////////// 型変換

class operator TdSingleSiz2D.Implicit( const V_:TdSingle2D ) :TdSingleSiz2D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
     end;
end;

class operator TdSingleSiz2D.Implicit( const V_:TdSingleSiz2D ) :TdSingle2D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdDoubleSiz2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TdDoubleSiz2D.Geto :TDoubleSiz2D;
begin
     Result.X := X.o;
     Result.Y := Y.o;
end;

procedure TdDoubleSiz2D.Seto( const o_:TDoubleSiz2D );
begin
     X.o := o_.X;
     Y.o := o_.Y;
end;

function TdDoubleSiz2D.Getd :TDoubleSiz2D;
begin
     Result.X := X.d;
     Result.Y := Y.d;
end;

procedure TdDoubleSiz2D.Setd( const d_:TDoubleSiz2D );
begin
     X.d := d_.X;
     Y.d := d_.Y;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TdDoubleSiz2D.Create( const X_,Y_:TdDouble );
begin
     X := X_;
     Y := Y_;
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TdDoubleSiz2D.Negative( const V_:TdDoubleSiz2D ) :TdDoubleSiz2D;
begin
     with Result do
     begin
          X := -V_.X;
          Y := -V_.Y;
     end;
end;

class operator TdDoubleSiz2D.Positive( const V_:TdDoubleSiz2D ) :TdDoubleSiz2D;
begin
     with Result do
     begin
          X := +V_.X;
          Y := +V_.Y;
     end;
end;

class operator TdDoubleSiz2D.Add( const A_,B_:TdDoubleSiz2D ) :TdDoubleSiz2D;
begin
     with Result do
     begin
          X := A_.X + B_.X;
          Y := A_.Y + B_.Y;
     end;
end;

class operator TdDoubleSiz2D.Subtract( const A_,B_:TdDoubleSiz2D ) :TdDoubleSiz2D;
begin
     with Result do
     begin
          X := A_.X - B_.X;
          Y := A_.Y - B_.Y;
     end;
end;

class operator TdDoubleSiz2D.Multiply( const A_:TdDoubleSiz2D; const B_:TdDouble ) :TdDoubleSiz2D;
begin
     with Result do
     begin
          X := A_.X * B_;
          Y := A_.Y * B_;
     end;
end;

class operator TdDoubleSiz2D.Multiply( const A_:TdDouble; const B_:TdDoubleSiz2D ) :TdDoubleSiz2D;
begin
     with Result do
     begin
          X := A_ * B_.X;
          Y := A_ * B_.Y;
     end;
end;

class operator TdDoubleSiz2D.Divide( const A_:TdDoubleSiz2D; const B_:TdDouble ) :TdDoubleSiz2D;
begin
     with Result do
     begin
          X := A_.X / B_;
          Y := A_.Y / B_;
     end;
end;

///////////////////////////////////////////////////////////////////////// 型変換

class operator TdDoubleSiz2D.Implicit( const V_:TdDouble2D ) :TdDoubleSiz2D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
     end;
end;

class operator TdDoubleSiz2D.Implicit( const V_:TdDoubleSiz2D ) :TdDouble2D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleCircle2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleCircle2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdSingleCircle2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TdSingleCircle2D.Geto :TSingleCircle2D;
begin
     Result.Center := Center.o;
     Result.Radius := Radius.o;
end;

procedure TdSingleCircle2D.Seto( const o_:TSingleCircle2D );
begin
     Center.o := o_.Center;
     Radius.o := o_.Radius;
end;

function TdSingleCircle2D.Getd :TSingleCircle2D;
begin
     Result.Center := Center.d;
     Result.Radius := Radius.d;
end;

procedure TdSingleCircle2D.Setd( const d_:TSingleCircle2D );
begin
     Center.d := d_.Center;
     Radius.d := d_.Radius;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdDoubleCircle2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TdDoubleCircle2D.Geto :TDoubleCircle2D;
begin
     Result.Center := Center.o;
     Result.Radius := Radius.o;
end;

procedure TdDoubleCircle2D.Seto( const o_:TDoubleCircle2D );
begin
     Center.o := o_.Center;
     Radius.o := o_.Radius;
end;

function TdDoubleCircle2D.Getd :TDoubleCircle2D;
begin
     Result.Center := Center.d;
     Result.Radius := Radius.d;
end;

procedure TdDoubleCircle2D.Setd( const d_:TDoubleCircle2D );
begin
     Center.d := d_.Center;
     Radius.d := d_.Radius;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleEllipse2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleEllipse2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdSingleEllipse2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TdSingleEllipse2D.Geto :TSingleEllipse2D;
begin
     Result.Center := Center.o;
     Result.Radius := Radius.o;
end;

procedure TdSingleEllipse2D.Seto( const o_:TSingleEllipse2D );
begin
     Center.o := o_.Center;
     Radius.o := o_.Radius;
end;

function TdSingleEllipse2D.Getd :TSingleEllipse2D;
begin
     Result.Center := Center.d;
     Result.Radius := Radius.d;
end;

procedure TdSingleEllipse2D.Setd( const d_:TSingleEllipse2D );
begin
     Center.d := d_.Center;
     Radius.d := d_.Radius;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdDoubleEllipse2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TdDoubleEllipse2D.Geto :TDoubleEllipse2D;
begin
     Result.Center := Center.o;
     Result.Radius := Radius.o;
end;

procedure TdDoubleEllipse2D.Seto( const o_:TDoubleEllipse2D );
begin
     Center.o := o_.Center;
     Radius.o := o_.Radius;
end;

function TdDoubleEllipse2D.Getd :TDoubleEllipse2D;
begin
     Result.Center := Center.d;
     Result.Radius := Radius.d;
end;

procedure TdDoubleEllipse2D.Setd( const d_:TDoubleEllipse2D );
begin
     Center.d := d_.Center;
     Radius.d := d_.Radius;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function DotProduct( const A_,B_:TSingleVec2D ) :Single; overload;
begin
     Result := A_.X * B_.X
             + A_.Y * B_.Y;
end;

function DotProduct( const A_,B_:TDoubleVec2D ) :Double; overload;
begin
     Result := A_.X * B_.X
             + A_.Y * B_.Y;
end;

////////////////////////////////////////////////////////////////////////////////

function Distance( const A_,B_:TSinglePos2D ) :Single; overload;
begin
     Result := ( B_ - A_ ).Size;
end;

function Distance( const A_,B_:TDoublePos2D ) :Double; overload;
begin
     Result := ( B_ - A_ ).Size;
end;

////////////////////////////////////////////////////////////////////////////////

function Ave( const A_,B_:TSingle2D ) :TSingle2D; overload;
begin
     Result := ( A_ + B_ ) / 2;
end;

function Ave( const A_,B_:TDouble2D ) :TDouble2D; overload;
begin
     Result := ( A_ + B_ ) / 2;
end;

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
