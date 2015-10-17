unit LUX.D3;

interface //#################################################################### ■

uses System.Math.Vectors,
     LUX;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingle3D

     TSingle3D = record
     private
       ///// アクセス
       function GetSiz2 :Single; inline;
       procedure SetSiz2( const Siz2_:Single ); inline;
       function GetSize :Single; inline;
       procedure SetSize( const Size_:Single ); inline;
       function GetUnitor :TSingle3D; inline;
       procedure SetUnitor( const Unitor_:TSingle3D ); inline;
     public
       X :Single;
       Y :Single;
       Z :Single;
       /////
       constructor Create( const X_,Y_,Z_:Single );
       ///// プロパティ
       property Siz2   :Single    read GetSiz2   write SetSiz2;
       property Size   :Single    read GetSize   write SetSize;
       property Unitor :TSingle3D read GetUnitor write SetUnitor;
       ///// 演算子
       class operator Negative( const V_:TSingle3D ) :TSingle3D;
       class operator Positive( const V_:TSingle3D ) :TSingle3D;
       class operator Add( const A_,B_:TSingle3D ) :TSingle3D;
       class operator Subtract( const A_,B_:TSingle3D ) :TSingle3D;
       class operator Multiply( const A_:TSingle3D; const B_:Single ) :TSingle3D;
       class operator Multiply( const A_:Single; const B_:TSingle3D ) :TSingle3D;
       class operator Divide( const A_:TSingle3D; const B_:Single ) :TSingle3D;
       ///// 型変換
       class operator Implicit( const V_:TPoint3D ) :TSingle3D;
       class operator Implicit( const V_:TSingle3D ) :TPoint3D;
       class operator Implicit( const V_:TVector3D ) :TSingle3D;
       class operator Implicit( const V_:TSingle3D ) :TVector3D;
       ///// 定数
       class function IdentityX :TSingle3D; inline; static;
       class function IdentityY :TSingle3D; inline; static;
       class function IdentityZ :TSingle3D; inline; static;
     end;

     TSinglePos3D = TSingle3D;
     TSingleVec3D = TSingle3D;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDouble3D

     TDouble3D = record
     private
       ///// アクセス
       function GetSiz2 :Double; inline;
       procedure SetSiz2( const Siz2_:Double ); inline;
       function GetSize :Double; inline;
       procedure SetSize( const Size_:Double ); inline;
       function GetUnitor :TDouble3D; inline;
       procedure SetUnitor( const Unitor_:TDouble3D ); inline;
     public
       X :Double;
       Y :Double;
       Z :Double;
       /////
       constructor Create( const X_,Y_,Z_:Double );
       ///// プロパティ
       property Siz2   :Double    read GetSiz2   write SetSiz2;
       property Size   :Double    read GetSize   write SetSize;
       property Unitor :TDouble3D read GetUnitor write SetUnitor;
       ///// 演算子
       class operator Negative( const V_:TDouble3D ) :TDouble3D;
       class operator Positive( const V_:TDouble3D ) :TDouble3D;
       class operator Add( const A_,B_:TDouble3D ) :TDouble3D;
       class operator Subtract( const A_,B_:TDouble3D ) :TDouble3D;
       class operator Multiply( const A_:TDouble3D; const B_:Double ) :TDouble3D;
       class operator Multiply( const A_:Double; const B_:TDouble3D ) :TDouble3D;
       class operator Divide( const A_:TDouble3D; const B_:Double ) :TDouble3D;
       ///// 型変換
       class operator Implicit( const V_:TPoint3D ) :TDouble3D;
       class operator Implicit( const V_:TDouble3D ) :TPoint3D;
       class operator Implicit( const V_:TVector3D ) :TDouble3D;
       class operator Implicit( const V_:TDouble3D ) :TVector3D;
       ///// 定数
       class function IdentityX :TDouble3D; inline; static;
       class function IdentityY :TDouble3D; inline; static;
       class function IdentityZ :TDouble3D; inline; static;
     end;

     TDoublePos3D = TDouble3D;
     TDoubleVec3D = TDouble3D;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleSiz3D

     TSingleSiz3D = record
     private
     public
       X :Single;
       Y :Single;
       Z :Single;
       /////
       constructor Create( const X_,Y_,Z_:Single );
       ///// 演算子
       class operator Negative( const V_:TSingleSiz3D ) :TSingleSiz3D;
       class operator Positive( const V_:TSingleSiz3D ) :TSingleSiz3D;
       class operator Add( const A_,B_:TSingleSiz3D ) :TSingleSiz3D;
       class operator Subtract( const A_,B_:TSingleSiz3D ) :TSingleSiz3D;
       class operator Multiply( const A_:TSingleSiz3D; const B_:Single ) :TSingleSiz3D;
       class operator Multiply( const A_:Single; const B_:TSingleSiz3D ) :TSingleSiz3D;
       class operator Divide( const A_:TSingleSiz3D; const B_:Single ) :TSingleSiz3D;
       ///// 型変換
       class operator Implicit( const V_:TPoint3D ) :TSingleSiz3D;
       class operator Implicit( const V_:TSingleSiz3D ) :TPoint3D;
       class operator Implicit( const V_:TVector3D ) :TSingleSiz3D;
       class operator Implicit( const V_:TSingleSiz3D ) :TVector3D;
       class operator Implicit( const V_:TSingle3D ) :TSingleSiz3D;
       class operator Implicit( const V_:TSingleSiz3D ) :TSingle3D;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleSiz3D

     TDoubleSiz3D = record
     private
     public
       X :Double;
       Y :Double;
       Z :Double;
       /////
       constructor Create( const X_,Y_,Z_:Double );
       ///// 演算子
       class operator Negative( const V_:TDoubleSiz3D ) :TDoubleSiz3D;
       class operator Positive( const V_:TDoubleSiz3D ) :TDoubleSiz3D;
       class operator Add( const A_,B_:TDoubleSiz3D ) :TDoubleSiz3D;
       class operator Subtract( const A_,B_:TDoubleSiz3D ) :TDoubleSiz3D;
       class operator Multiply( const A_:TDoubleSiz3D; const B_:Double ) :TDoubleSiz3D;
       class operator Multiply( const A_:Double; const B_:TDoubleSiz3D ) :TDoubleSiz3D;
       class operator Divide( const A_:TDoubleSiz3D; const B_:Double ) :TDoubleSiz3D;
       ///// 型変換
       class operator Implicit( const V_:TPoint3D ) :TDoubleSiz3D;
       class operator Implicit( const V_:TDoubleSiz3D ) :TPoint3D;
       class operator Implicit( const V_:TVector3D ) :TDoubleSiz3D;
       class operator Implicit( const V_:TDoubleSiz3D ) :TVector3D;
       class operator Implicit( const V_:TDouble3D ) :TDoubleSiz3D;
       class operator Implicit( const V_:TDoubleSiz3D ) :TDouble3D;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleRay3D

     TSingleRay3D = record
     private
     public
       Pos :TSinglePos3D;
       Vec :TSingleVec3D;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleRay3D

     TDoubleRay3D = record
     private
     public
       Pos :TDoublePos3D;
       Vec :TDoubleVec3D;
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function DotProduct( const A_,B_:TSingleVec3D ) :Single; inline; overload;
function DotProduct( const A_,B_:TDoubleVec3D ) :Double; inline; overload;

function CrossProduct( const A_,B_:TSingleVec3D ) :TSingleVec3D; inline; overload;
function CrossProduct( const A_,B_:TDoubleVec3D ) :TDoubleVec3D; inline; overload;

function Distance( const A_,B_:TSinglePos3D ) :Single; inline; overload;
function Distance( const A_,B_:TDoublePos3D ) :Double; inline; overload;

function TriNormal( const P1_,P2_,P3_:TSinglePos3D ) :TSingleVec3D; inline; overload;
function TriNormal( const P1_,P2_,P3_:TDoublePos3D ) :TDoubleVec3D; inline; overload;

function Ave( const A_,B_:TSingle3D ) :TSingle3D; inline; overload;
function Ave( const A_,B_:TDouble3D ) :TDouble3D; inline; overload;

implementation //############################################################### ■

uses System.Math;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingle3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TSingle3D.GetSiz2 :Single;
begin
     Result := Pow2( X ) + Pow2( Y ) + Pow2( Z );
end;

procedure TSingle3D.SetSiz2( const Siz2_:Single );
begin
     Self := Roo2( Siz2_ / Siz2 ) * Self;
end;

function TSingle3D.GetSize :Single;
begin
     Result := Roo2( Siz2 );
end;

procedure TSingle3D.SetSize( const Size_:Single );
begin
     Self := Size_ * Unitor;
end;

function TSingle3D.GetUnitor :TSingle3D;
begin
     Result := Self / Size;
end;

procedure TSingle3D.SetUnitor( const Unitor_:TSingle3D );
begin
     Self := Size * Unitor_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TSingle3D.Create( const X_,Y_,Z_:Single );
begin
     X := X_;
     Y := Y_;
     Z := Z_;
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TSingle3D.Negative( const V_:TSingle3D ) :TSingle3D;
begin
     with Result do
     begin
          X := -V_.X;
          Y := -V_.Y;
          Z := -V_.Z;
     end;
end;

class operator TSingle3D.Positive( const V_:TSingle3D ) :TSingle3D;
begin
     with Result do
     begin
          X := +V_.X;
          Y := +V_.Y;
          Z := +V_.Z;
     end;
end;

class operator TSingle3D.Add( const A_,B_:TSingle3D ) :TSingle3D;
begin
     with Result do
     begin
          X := A_.X + B_.X;
          Y := A_.Y + B_.Y;
          Z := A_.Z + B_.Z;
     end;
end;

class operator TSingle3D.Subtract( const A_,B_:TSingle3D ) :TSingle3D;
begin
     with Result do
     begin
          X := A_.X - B_.X;
          Y := A_.Y - B_.Y;
          Z := A_.Z - B_.Z;
     end;
end;

class operator TSingle3D.Multiply( const A_:TSingle3D; const B_:Single ) :TSingle3D;
begin
     with Result do
     begin
          X := A_.X * B_;
          Y := A_.Y * B_;
          Z := A_.Z * B_;
     end;
end;

class operator TSingle3D.Multiply( const A_:Single; const B_:TSingle3D ) :TSingle3D;
begin
     with Result do
     begin
          X := A_ * B_.X;
          Y := A_ * B_.Y;
          Z := A_ * B_.Z;
     end;
end;

class operator TSingle3D.Divide( const A_:TSingle3D; const B_:Single ) :TSingle3D;
begin
     with Result do
     begin
          X := A_.X / B_;
          Y := A_.Y / B_;
          Z := A_.Z / B_;
     end;
end;

///////////////////////////////////////////////////////////////////////// 型変換

class operator TSingle3D.Implicit( const V_:TPoint3D ) :TSingle3D;
begin
     with Result do
     begin
          X := +V_.X;
          Y := -V_.Y;
          Z := -V_.Z;
     end;
end;

class operator TSingle3D.Implicit( const V_:TSingle3D ) :TPoint3D;
begin
     with Result do
     begin
          X := +V_.X;
          Y := -V_.Y;
          Z := -V_.Z;
     end;
end;

class operator TSingle3D.Implicit( const V_:TVector3D ) :TSingle3D;
begin
     Result := TPoint3D( V_ );
end;

class operator TSingle3D.Implicit( const V_:TSingle3D ) :TVector3D;
begin
     Result := TPoint3D( V_ );
end;

/////////////////////////////////////////////////////////////////////////// 定数

class function TSingle3D.IdentityX :TSingle3D;
begin
     with Result do
     begin
          X := 1;
          Y := 0;
          Z := 0;
     end;
end;

class function TSingle3D.IdentityY :TSingle3D;
begin
     with Result do
     begin
          X := 0;
          Y := 1;
          Z := 0;
     end;
end;

class function TSingle3D.IdentityZ :TSingle3D;
begin
     with Result do
     begin
          X := 0;
          Y := 0;
          Z := 1;
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDouble3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TDouble3D.GetSiz2 :Double;
begin
     Result := Pow2( X ) + Pow2( Y ) + Pow2( Z );
end;

procedure TDouble3D.SetSiz2( const Siz2_:Double );
begin
     Self := Roo2( Siz2_ / Siz2 ) * Self;
end;

function TDouble3D.GetSize :Double;
begin
     Result := Roo2( Siz2 );
end;

procedure TDouble3D.SetSize( const Size_:Double );
begin
     Self := Size_ * Unitor;
end;

function TDouble3D.GetUnitor :TDouble3D;
begin
     Result := Self / Size;
end;

procedure TDouble3D.SetUnitor( const Unitor_:TDouble3D );
begin
     Self := Size * Unitor_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TDouble3D.Create( const X_,Y_,Z_:Double );
begin
     X := X_;
     Y := Y_;
     Z := Z_;
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TDouble3D.Negative( const V_:TDouble3D ) :TDouble3D;
begin
     with Result do
     begin
          X := -V_.X;
          Y := -V_.Y;
          Z := -V_.Z;
     end;
end;

class operator TDouble3D.Positive( const V_:TDouble3D ) :TDouble3D;
begin
     with Result do
     begin
          X := +V_.X;
          Y := +V_.Y;
          Z := +V_.Z;
     end;
end;

class operator TDouble3D.Add( const A_,B_:TDouble3D ) :TDouble3D;
begin
     with Result do
     begin
          X := A_.X + B_.X;
          Y := A_.Y + B_.Y;
          Z := A_.Z + B_.Z;
     end;
end;

class operator TDouble3D.Subtract( const A_,B_:TDouble3D ) :TDouble3D;
begin
     with Result do
     begin
          X := A_.X - B_.X;
          Y := A_.Y - B_.Y;
          Z := A_.Z - B_.Z;
     end;
end;

class operator TDouble3D.Multiply( const A_:TDouble3D; const B_:Double ) :TDouble3D;
begin
     with Result do
     begin
          X := A_.X * B_;
          Y := A_.Y * B_;
          Z := A_.Z * B_;
     end;
end;

class operator TDouble3D.Multiply( const A_:Double; const B_:TDouble3D ) :TDouble3D;
begin
     with Result do
     begin
          X := A_ * B_.X;
          Y := A_ * B_.Y;
          Z := A_ * B_.Z;
     end;
end;

class operator TDouble3D.Divide( const A_:TDouble3D; const B_:Double ) :TDouble3D;
begin
     with Result do
     begin
          X := A_.X / B_;
          Y := A_.Y / B_;
          Z := A_.Z / B_;
     end;
end;

///////////////////////////////////////////////////////////////////////// 型変換

class operator TDouble3D.Implicit( const V_:TPoint3D ) :TDouble3D;
begin
     with Result do
     begin
          X := +V_.X;
          Y := -V_.Y;
          Z := -V_.Z;
     end;
end;

class operator TDouble3D.Implicit( const V_:TDouble3D ) :TPoint3D;
begin
     with Result do
     begin
          X := +V_.X;
          Y := -V_.Y;
          Z := -V_.Z;
     end;
end;

class operator TDouble3D.Implicit( const V_:TVector3D ) :TDouble3D;
begin
     Result := TPoint3D( V_ );
end;

class operator TDouble3D.Implicit( const V_:TDouble3D ) :TVector3D;
begin
     Result := TPoint3D( V_ );
end;

/////////////////////////////////////////////////////////////////////////// 定数

class function TDouble3D.IdentityX :TDouble3D;
begin
     with Result do
     begin
          X := 1;
          Y := 0;
          Z := 0;
     end;
end;

class function TDouble3D.IdentityY :TDouble3D;
begin
     with Result do
     begin
          X := 0;
          Y := 1;
          Z := 0;
     end;
end;

class function TDouble3D.IdentityZ :TDouble3D;
begin
     with Result do
     begin
          X := 0;
          Y := 0;
          Z := 1;
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleSiz3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TSingleSiz3D.Create( const X_,Y_,Z_:Single );
begin
     X := X_;
     Y := Y_;
     Z := Z_;
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TSingleSiz3D.Negative( const V_:TSingleSiz3D ) :TSingleSiz3D;
begin
     with Result do
     begin
          X := -V_.X;
          Y := -V_.Y;
          Z := -V_.Z;
     end;
end;

class operator TSingleSiz3D.Positive( const V_:TSingleSiz3D ) :TSingleSiz3D;
begin
     with Result do
     begin
          X := +V_.X;
          Y := +V_.Y;
          Z := +V_.Z;
     end;
end;

class operator TSingleSiz3D.Add( const A_,B_:TSingleSiz3D ) :TSingleSiz3D;
begin
     with Result do
     begin
          X := A_.X + B_.X;
          Y := A_.Y + B_.Y;
          Z := A_.Z + B_.Z;
     end;
end;

class operator TSingleSiz3D.Subtract( const A_,B_:TSingleSiz3D ) :TSingleSiz3D;
begin
     with Result do
     begin
          X := A_.X - B_.X;
          Y := A_.Y - B_.Y;
          Z := A_.Z - B_.Z;
     end;
end;

class operator TSingleSiz3D.Multiply( const A_:TSingleSiz3D; const B_:Single ) :TSingleSiz3D;
begin
     with Result do
     begin
          X := A_.X * B_;
          Y := A_.Y * B_;
          Z := A_.Z * B_;
     end;
end;

class operator TSingleSiz3D.Multiply( const A_:Single; const B_:TSingleSiz3D ) :TSingleSiz3D;
begin
     with Result do
     begin
          X := A_ * B_.X;
          Y := A_ * B_.Y;
          Z := A_ * B_.Z;
     end;
end;

class operator TSingleSiz3D.Divide( const A_:TSingleSiz3D; const B_:Single ) :TSingleSiz3D;
begin
     with Result do
     begin
          X := A_.X / B_;
          Y := A_.Y / B_;
          Z := A_.Z / B_;
     end;
end;

///////////////////////////////////////////////////////////////////////// 型変換

class operator TSingleSiz3D.Implicit( const V_:TPoint3D ) :TSingleSiz3D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
          Z := V_.Z;
     end;
end;

class operator TSingleSiz3D.Implicit( const V_:TSingleSiz3D ) :TPoint3D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
          Z := V_.Z;
     end;
end;

class operator TSingleSiz3D.Implicit( const V_:TVector3D ) :TSingleSiz3D;
begin
     Result := TPoint3D( V_ );
end;

class operator TSingleSiz3D.Implicit( const V_:TSingleSiz3D ) :TVector3D;
begin
     Result := TPoint3D( V_ );
end;

class operator TSingleSiz3D.Implicit( const V_:TSingle3D ) :TSingleSiz3D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
          Z := V_.Z;
     end;
end;

class operator TSingleSiz3D.Implicit( const V_:TSingleSiz3D ) :TSingle3D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
          Z := V_.Z;
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleSiz3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TDoubleSiz3D.Create( const X_,Y_,Z_:Double );
begin
     X := X_;
     Y := Y_;
     Z := Z_;
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TDoubleSiz3D.Negative( const V_:TDoubleSiz3D ) :TDoubleSiz3D;
begin
     with Result do
     begin
          X := -V_.X;
          Y := -V_.Y;
          Z := -V_.Z;
     end;
end;

class operator TDoubleSiz3D.Positive( const V_:TDoubleSiz3D ) :TDoubleSiz3D;
begin
     with Result do
     begin
          X := +V_.X;
          Y := +V_.Y;
          Z := +V_.Z;
     end;
end;

class operator TDoubleSiz3D.Add( const A_,B_:TDoubleSiz3D ) :TDoubleSiz3D;
begin
     with Result do
     begin
          X := A_.X + B_.X;
          Y := A_.Y + B_.Y;
          Z := A_.Z + B_.Z;
     end;
end;

class operator TDoubleSiz3D.Subtract( const A_,B_:TDoubleSiz3D ) :TDoubleSiz3D;
begin
     with Result do
     begin
          X := A_.X - B_.X;
          Y := A_.Y - B_.Y;
          Z := A_.Z - B_.Z;
     end;
end;

class operator TDoubleSiz3D.Multiply( const A_:TDoubleSiz3D; const B_:Double ) :TDoubleSiz3D;
begin
     with Result do
     begin
          X := A_.X * B_;
          Y := A_.Y * B_;
          Z := A_.Z * B_;
     end;
end;

class operator TDoubleSiz3D.Multiply( const A_:Double; const B_:TDoubleSiz3D ) :TDoubleSiz3D;
begin
     with Result do
     begin
          X := A_ * B_.X;
          Y := A_ * B_.Y;
          Z := A_ * B_.Z;
     end;
end;

class operator TDoubleSiz3D.Divide( const A_:TDoubleSiz3D; const B_:Double ) :TDoubleSiz3D;
begin
     with Result do
     begin
          X := A_.X / B_;
          Y := A_.Y / B_;
          Z := A_.Z / B_;
     end;
end;

///////////////////////////////////////////////////////////////////////// 型変換

class operator TDoubleSiz3D.Implicit( const V_:TPoint3D ) :TDoubleSiz3D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
          Z := V_.Z;
     end;
end;

class operator TDoubleSiz3D.Implicit( const V_:TDoubleSiz3D ) :TPoint3D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
          Z := V_.Z;
     end;
end;

class operator TDoubleSiz3D.Implicit( const V_:TVector3D ) :TDoubleSiz3D;
begin
     Result := TPoint3D( V_ );
end;

class operator TDoubleSiz3D.Implicit( const V_:TDoubleSiz3D ) :TVector3D;
begin
     Result := TPoint3D( V_ );
end;

class operator TDoubleSiz3D.Implicit( const V_:TDouble3D ) :TDoubleSiz3D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
          Z := V_.Z;
     end;
end;

class operator TDoubleSiz3D.Implicit( const V_:TDoubleSiz3D ) :TDouble3D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
          Z := V_.Z;
     end;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function DotProduct( const A_,B_:TSingleVec3D ) :Single;
begin
     Result := A_.X * B_.X
             + A_.Y * B_.Y
             + A_.Z * B_.Z;
end;

function DotProduct( const A_,B_:TDoubleVec3D ) :Double;
begin
     Result := A_.X * B_.X
             + A_.Y * B_.Y
             + A_.Z * B_.Z;
end;

////////////////////////////////////////////////////////////////////////////////

function CrossProduct( const A_,B_:TSingleVec3D ) :TSingleVec3D;
begin
     with Result do
     begin
          X := A_.Y * B_.Z - A_.Z * B_.Y;
          Y := A_.Z * B_.X - A_.X * B_.Z;
          Z := A_.X * B_.Y - A_.Y * B_.X;
     end;
end;

function CrossProduct( const A_,B_:TDoubleVec3D ) :TDoubleVec3D;
begin
     with Result do
     begin
          X := A_.Y * B_.Z - A_.Z * B_.Y;
          Y := A_.Z * B_.X - A_.X * B_.Z;
          Z := A_.X * B_.Y - A_.Y * B_.X;
     end;
end;

////////////////////////////////////////////////////////////////////////////////

function Distance( const A_,B_:TSinglePos3D ) :Single;
begin
     Result := ( B_ - A_ ).Size;
end;

function Distance( const A_,B_:TDoublePos3D ) :Double;
begin
     Result := ( B_ - A_ ).Size;
end;

////////////////////////////////////////////////////////////////////////////////

function TriNormal( const P1_,P2_,P3_:TSinglePos3D ) :TSingleVec3D;
begin
     Result := CrossProduct( P3_ - P2_, P1_ - P2_ );
end;

function TriNormal( const P1_,P2_,P3_:TDoublePos3D ) :TDoubleVec3D;
begin
     Result := CrossProduct( P3_ - P2_, P1_ - P2_ );
end;

////////////////////////////////////////////////////////////////////////////////

function Ave( const A_,B_:TSingle3D ) :TSingle3D;
begin
     Result := ( A_ + B_ ) / 2;
end;

function Ave( const A_,B_:TDouble3D ) :TDouble3D;
begin
     Result := ( A_ + B_ ) / 2;
end;

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
