unit LUX.DN;

interface //#################################################################### ■

uses System.Math.Vectors,
     LUX, LUX.D1, LUX.D2, LUX.D3, LUX.D4, LUX.D5;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleND

     TSingleND = record
     private
       ///// アクセス
       function Getos( const I_:Integer ) :Single; inline;
       procedure Setos( const I_:Integer; const o_:Single ); inline;
       function GetDimN :Integer; inline;
       procedure SetDimN( const DimN_:Integer ); inline;
       function GetSiz2 :Single; inline;
       procedure SetSiz2( const Siz2_:Single ); inline;
       function GetSize :Single; inline;
       procedure SetSize( const Size_:Single ); inline;
       function GetUnitor :TSingleND; inline;
       procedure SetUnitor( const Unitor_:TSingleND ); inline;
     public
       _s :TArray<Single>;
       /////
       constructor Create( const N_:Integer ); overload;
       constructor Create( const V_:Single; const N_:Integer ); overload;
       constructor Create( const Vs_:array of Single ); overload;
       constructor Create( const D_:TSingleND ); overload;
       ///// プロパティ
       property os[ const I_:Integer ] :Single    read Getos     write Setos    ; default;
       property DimN                   :Integer   read GetDimN   write SetDimN  ;
       property Siz2                   :Single    read GetSiz2   write SetSiz2  ;
       property Size                   :Single    read GetSize   write SetSize  ;
       property Unitor                 :TSingleND read GetUnitor write SetUnitor;
       ///// 演算子
       class operator Negative( const V_:TSingleND ) :TSingleND;
       class operator Positive( const V_:TSingleND ) :TSingleND;
       class operator Add( const A_,B_:TSingleND ) :TSingleND;
       class operator Subtract( const A_,B_:TSingleND ) :TSingleND;
       class operator Multiply( const A_:TSingleND; const B_:Single ) :TSingleND;
       class operator Multiply( const A_:Single; const B_:TSingleND ) :TSingleND;
       class operator Multiply( const A_,B_:TSingleND ) :TSingleND;
       class operator Divide( const A_:TSingleND; const B_:Single ) :TSingleND;
       class operator Divide( const A_,B_:TSingleND ) :TSingleND;
       ///// 型変換
       class operator Explicit( const V_:TSingleND ) :TSingle2D; inline;
       class operator Explicit( const V_:TSingleND ) :TSingle3D; inline;
       class operator Explicit( const V_:TSingleND ) :TSingle4D; inline;
       class operator Explicit( const V_:TSingleND ) :TSingle5D; inline;
       ///// メソッド
       function VectorTo( const P_:TSingleND ) :TSingleND;
       function UnitorTo( const P_:TSingleND ) :TSingleND;
       function DistanTo( const P_:TSingleND ) :Single;
       class function RandG( const N_:Integer ) :TSingleND; static;
       class function RandBS1( const N_:Integer ) :TSingleND; static;
       class function RandBS2( const N_:Integer ) :TSingleND; static;
       class function RandBS4( const N_:Integer ) :TSingleND; static;
     end;

     TSinglePosND = TSingleND;
     TSingleVecND = TSingleND;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleND

     TDoubleND = record
     private
       ///// アクセス
       function Getos( const I_:Integer ) :Double; inline;
       procedure Setos( const I_:Integer; const o_:Double ); inline;
       function GetDimN :Integer; inline;
       procedure SetDimN( const DimN_:Integer ); inline;
       function GetSiz2 :Double; inline;
       procedure SetSiz2( const Siz2_:Double ); inline;
       function GetSize :Double; inline;
       procedure SetSize( const Size_:Double ); inline;
       function GetUnitor :TDoubleND; inline;
       procedure SetUnitor( const Unitor_:TDoubleND ); inline;
     public
       _s :TArray<Double>;
       /////
       constructor Create( const N_:Integer ); overload;
       constructor Create( const V_:Double; const N_:Integer ); overload;
       constructor Create( const Vs_:array of Double ); overload;
       constructor Create( const D_:TDoubleND ); overload;
       ///// プロパティ
       property os[ const I_:Integer ] :Double    read Getos     write Setos    ; default;
       property DimN                   :Integer   read GetDimN   write SetDimN  ;
       property Siz2                   :Double    read GetSiz2   write SetSiz2  ;
       property Size                   :Double    read GetSize   write SetSize  ;
       property Unitor                 :TDoubleND read GetUnitor write SetUnitor;
       ///// 演算子
       class operator Negative( const V_:TDoubleND ) :TDoubleND;
       class operator Positive( const V_:TDoubleND ) :TDoubleND;
       class operator Add( const A_,B_:TDoubleND ) :TDoubleND;
       class operator Subtract( const A_,B_:TDoubleND ) :TDoubleND;
       class operator Multiply( const A_:TDoubleND; const B_:Double ) :TDoubleND;
       class operator Multiply( const A_:Double; const B_:TDoubleND ) :TDoubleND;
       class operator Multiply( const A_,B_:TDoubleND ) :TDoubleND;
       class operator Divide( const A_:TDoubleND; const B_:Double ) :TDoubleND;
       class operator Divide( const A_,B_:TDoubleND ) :TDoubleND;
       ///// 型変換
       class operator Explicit( const V_:TDoubleND ) :TDouble2D; inline;
       class operator Explicit( const V_:TDoubleND ) :TDouble3D; inline;
       class operator Explicit( const V_:TDoubleND ) :TDouble4D; inline;
       class operator Explicit( const V_:TDoubleND ) :TDouble5D; inline;
       ///// メソッド
       function VectorTo( const P_:TDoubleND ) :TDoubleND;
       function UnitorTo( const P_:TDoubleND ) :TDoubleND;
       function DistanTo( const P_:TDoubleND ) :Double;
       class function RandG( const N_:Integer ) :TDoubleND; static;
       class function RandBS1( const N_:Integer ) :TDoubleND; static;
       class function RandBS2( const N_:Integer ) :TDoubleND; static;
       class function RandBS4( const N_:Integer ) :TDoubleND; static;
     end;

     TDoublePosND = TDoubleND;
     TDoubleVecND = TDoubleND;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdSingleND

     TdSingleND = record
     private
       ///// アクセス
       function Getos( const I_:Integer ) :TdSingle; inline;
       procedure Setos( const I_:Integer; const o_:TdSingle ); inline;
       function GetDimN :Integer; inline;
       procedure SetDimN( const DimN_:Integer ); inline;
       function Geto :TSingleND; inline;
       procedure Seto( const o_:TSingleND ); inline;
       function Getd :TSingleND; inline;
       procedure Setd( const d_:TSingleND ); inline;
       function GetSiz2 :TdSingle; inline;
       procedure SetSiz2( const Siz2_:TdSingle ); inline;
       function GetSize :TdSingle; inline;
       procedure SetSize( const Size_:TdSingle ); inline;
       function GetUnitor :TdSingleND; inline;
       procedure SetUnitor( const Unitor_:TdSingleND ); inline;
     public
       _s :TArray<TdSingle>;
       /////
       constructor Create( const N_:Integer ); overload;
       constructor Create( const V_:TdSingle; const N_:Integer ); overload;
       constructor Create( const Vs_:array of TdSingle ); overload;
       constructor Create( const D_:TdSingleND ); overload;
       ///// プロパティ
       property os[ const I_:Integer ] :TdSingle   read Getos     write Setos    ; default;
       property DimN                   :Integer    read GetDimN   write SetDimN  ;
       property o                      :TSingleND  read Geto      write Seto     ;
       property d                      :TSingleND  read Getd      write Setd     ;
       property Siz2                   :TdSingle   read GetSiz2   write SetSiz2  ;
       property Size                   :TdSingle   read GetSize   write SetSize  ;
       property Unitor                 :TdSingleND read GetUnitor write SetUnitor;
       ///// 演算子
       class operator Negative( const V_:TdSingleND ) :TdSingleND; inline;
       class operator Positive( const V_:TdSingleND ) :TdSingleND; inline;
       class operator Add( const A_,B_:TdSingleND ) :TdSingleND; inline;
       class operator Subtract( const A_,B_:TdSingleND ) :TdSingleND; inline;
       class operator Multiply( const A_:TdSingleND; const B_:TdSingle ) :TdSingleND; inline;
       class operator Multiply( const A_:TdSingle; const B_:TdSingleND ) :TdSingleND; inline;
       class operator Multiply( const A_,B_:TdSingleND ) :TdSingleND;
       class operator Divide( const A_:TdSingleND; const B_:TdSingle ) :TdSingleND; inline;
       class operator Divide( const A_,B_:TdSingleND ) :TdSingleND;
       ///// 型変換
       class operator Implicit( const V_:TSingleND ) :TdSingleND;
       class operator Implicit( const V_:TdSingleND ) :TSingleND;
     end;

     TdSinglePosND = TdSingleND;
     TdSingleVecND = TdSingleND;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdDoubleND

     TdDoubleND = record
     private
       ///// アクセス
       function Getos( const I_:Integer ) :TdDouble; inline;
       procedure Setos( const I_:Integer; const o_:TdDouble ); inline;
       function GetDimN :Integer; inline;
       procedure SetDimN( const DimN_:Integer ); inline;
       function Geto :TDoubleND; inline;
       procedure Seto( const o_:TDoubleND ); inline;
       function Getd :TDoubleND; inline;
       procedure Setd( const d_:TDoubleND ); inline;
       function GetSiz2 :TdDouble; inline;
       procedure SetSiz2( const Siz2_:TdDouble ); inline;
       function GetSize :TdDouble; inline;
       procedure SetSize( const Size_:TdDouble ); inline;
       function GetUnitor :TdDoubleND; inline;
       procedure SetUnitor( const Unitor_:TdDoubleND ); inline;
     public
       _s :TArray<TdDouble>;
       /////
       constructor Create( const N_:Integer ); overload;
       constructor Create( const V_:TdDouble; const N_:Integer ); overload;
       constructor Create( const Vs_:array of TdDouble ); overload;
       constructor Create( const D_:TdDoubleND ); overload;
       ///// プロパティ
       property os[ const I_:Integer ] :TdDouble   read Getos     write Setos    ; default;
       property DimN                   :Integer    read GetDimN   write SetDimN  ;
       property o                      :TDoubleND  read Geto      write Seto     ;
       property d                      :TDoubleND  read Getd      write Setd     ;
       property Siz2                   :TdDouble   read GetSiz2   write SetSiz2  ;
       property Size                   :TdDouble   read GetSize   write SetSize  ;
       property Unitor                 :TdDoubleND read GetUnitor write SetUnitor;
       ///// 演算子
       class operator Negative( const V_:TdDoubleND ) :TdDoubleND; inline;
       class operator Positive( const V_:TdDoubleND ) :TdDoubleND; inline;
       class operator Add( const A_,B_:TdDoubleND ) :TdDoubleND; inline;
       class operator Subtract( const A_,B_:TdDoubleND ) :TdDoubleND; inline;
       class operator Multiply( const A_:TdDoubleND; const B_:TdDouble ) :TdDoubleND; inline;
       class operator Multiply( const A_:TdDouble; const B_:TdDoubleND ) :TdDoubleND; inline;
       class operator Multiply( const A_,B_:TdDoubleND ) :TdDoubleND;
       class operator Divide( const A_:TdDoubleND; const B_:TdDouble ) :TdDoubleND; inline;
       class operator Divide( const A_,B_:TdDoubleND ) :TdDoubleND;
       ///// 型変換
       class operator Implicit( const V_:TDoubleND ) :TdDoubleND;
       class operator Implicit( const V_:TdDoubleND ) :TDoubleND;
     end;

     TdDoublePosND = TdDoubleND;
     TdDoubleVecND = TdDoubleND;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function DotProduct( const A_,B_:TSingleVecND ) :Single; inline; overload;
function DotProduct( const A_,B_:TDoubleVecND ) :Double; inline; overload;
function DotProduct( const A_,B_:TdSingleVecND ) :TdSingle; inline; overload;
function DotProduct( const A_,B_:TdDoubleVecND ) :TdDouble; inline; overload;

function Dista2( const A_,B_:TSinglePosND ) :Single; inline; overload;
function Dista2( const A_,B_:TDoublePosND ) :Double; inline; overload;
function Dista2( const A_,B_:TdSinglePosND ) :TdSingle; inline; overload;
function Dista2( const A_,B_:TdDoublePosND ) :TdDouble; inline; overload;

function Distan( const A_,B_:TSinglePosND ) :Single; inline; overload;
function Distan( const A_,B_:TDoublePosND ) :Double; inline; overload;
function Distan( const A_,B_:TdSinglePosND ) :TdSingle; inline; overload;
function Distan( const A_,B_:TdDoublePosND ) :TdDouble; inline; overload;

function Ave( const P1_,P2_:TSingleND ) :TSingleND; inline; overload;
function Ave( const P1_,P2_:TDoubleND ) :TDoubleND; inline; overload;
function Ave( const P1_,P2_:TdSingleND ) :TdSingleND; inline; overload;
function Ave( const P1_,P2_:TdDoubleND ) :TdDoubleND; inline; overload;

function Ave( const P1_,P2_,P3_:TSingleND ) :TSingleND; inline; overload;
function Ave( const P1_,P2_,P3_:TDoubleND ) :TDoubleND; inline; overload;
function Ave( const P1_,P2_,P3_:TdSingleND ) :TdSingleND; inline; overload;
function Ave( const P1_,P2_,P3_:TdDoubleND ) :TdDoubleND; inline; overload;

function Ave( const P1_,P2_,P3_,P4_:TSingleND ) :TSingleND; inline; overload;
function Ave( const P1_,P2_,P3_,P4_:TDoubleND ) :TDoubleND; inline; overload;
function Ave( const P1_,P2_,P3_,P4_:TdSingleND ) :TdSingleND; inline; overload;
function Ave( const P1_,P2_,P3_,P4_:TdDoubleND ) :TdDoubleND; inline; overload;

implementation //############################################################### ■

uses System.SysUtils, System.Math;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleND

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TSingleND.Getos( const I_:Integer ) :Single;
begin
     Result := _s[ I_ ];
end;

procedure TSingleND.Setos( const I_:Integer; const o_:Single );
begin
     _s[ I_ ] := o_;
end;

//------------------------------------------------------------------------------

function TSingleND.GetDimN :Integer;
begin
     Result := Length( _s );
end;

procedure TSingleND.SetDimN( const DimN_:Integer );
begin
     SetLength( _s, DimN_ );
end;

//------------------------------------------------------------------------------

function TSingleND.GetSiz2 :Single;
var
   I :Integer;
begin
     Result := 0;

     for I := 0 to DimN-1 do Result := Result + Pow2( _s[ I ] );
end;

procedure TSingleND.SetSiz2( const Siz2_:Single );
begin
     Self := Roo2( Siz2_ / Siz2 ) * Self;
end;

function TSingleND.GetSize :Single;
begin
     Result := Roo2( GetSiz2 );
end;

procedure TSingleND.SetSize( const Size_:Single );
begin
     Self := Size_ * Unitor;
end;

function TSingleND.GetUnitor :TSingleND;
begin
     Result := Self / Size;
end;

procedure TSingleND.SetUnitor( const Unitor_:TSingleND );
begin
     Self := Size * Unitor_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TSingleND.Create( const N_:Integer );
begin
     DimN := N_;
end;

constructor TSingleND.Create( const V_:Single; const N_:Integer );
var
   I :Integer;
begin
     DimN := N_;

     for I := 0 to DimN-1 do _s[ I ] := V_;
end;

constructor TSingleND.Create( const Vs_:array of Single );
var
   I :Integer;
begin
     DimN := Length( Vs_ );

     for I := 0 to DimN-1 do _s[ I ] := Vs_[ I ];
end;

constructor TSingleND.Create( const D_:TSingleND );
begin
     _s := Copy( D_._s );
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TSingleND.Negative( const V_:TSingleND ) :TSingleND;
var
   I :Integer;
begin
     Result.DimN := V_.DimN;

     for I := 0 to Result.DimN-1 do Result[ I ] := -V_[ I ];
end;

class operator TSingleND.Positive( const V_:TSingleND ) :TSingleND;
var
   I :Integer;
begin
     Result.DimN := V_.DimN;

     for I := 0 to Result.DimN-1 do Result[ I ] := +V_[ I ];
end;

class operator TSingleND.Add( const A_,B_:TSingleND ) :TSingleND;
var
   L, H, I :Integer;
begin
     if A_.DimN <= B_.DimN then
     begin
          L := A_.DimN;
          H := B_.DimN;

          Result.DimN := H;
          for I := 0 to L-1 do Result[ I ] := A_[ I ] + B_[ I ];
          for I := L to H-1 do Result[ I ] :=     0   + B_[ I ];
     end
     else
     begin
          L := B_.DimN;
          H := A_.DimN;

          Result.DimN := H;
          for I := 0 to L-1 do Result[ I ] := A_[ I ] + B_[ I ];
          for I := L to H-1 do Result[ I ] := A_[ I ] +     0  ;
     end;
end;

class operator TSingleND.Subtract( const A_,B_:TSingleND ) :TSingleND;
var
   L, H, I :Integer;
begin
     if A_.DimN <= B_.DimN then
     begin
          L := A_.DimN;
          H := B_.DimN;

          Result.DimN := H;
          for I := 0 to L-1 do Result[ I ] := A_[ I ] - B_[ I ];
          for I := L to H-1 do Result[ I ] :=     0   - B_[ I ];
     end
     else
     begin
          L := B_.DimN;
          H := A_.DimN;

          Result.DimN := H;
          for I := 0 to L-1 do Result[ I ] := A_[ I ] - B_[ I ];
          for I := L to H-1 do Result[ I ] := A_[ I ] -     0  ;
     end;
end;

class operator TSingleND.Multiply( const A_:TSingleND; const B_:Single ) :TSingleND;
var
   I :Integer;
begin
     Result.DimN := A_.DimN;

     for I := 0 to Result.DimN-1 do Result[ I ] := A_[ I ] * B_;
end;


class operator TSingleND.Multiply( const A_:Single; const B_:TSingleND ) :TSingleND;
var
   I :Integer;
begin
     Result.DimN := B_.DimN;

     for I := 0 to Result.DimN-1 do Result[ I ] := A_ * B_[ I ];
end;

class operator TSingleND.Multiply( const A_,B_:TSingleND ) :TSingleND;
var
   L, H, I :Integer;
begin
     if A_.DimN <= B_.DimN then
     begin
          L := A_.DimN;
          H := B_.DimN;

          Result.DimN := H;
          for I := 0 to L-1 do Result[ I ] := A_[ I ] * B_[ I ];
          for I := L to H-1 do Result[ I ] :=     0   * B_[ I ];
     end
     else
     begin
          L := B_.DimN;
          H := A_.DimN;

          Result.DimN := H;
          for I := 0 to L-1 do Result[ I ] := A_[ I ] * B_[ I ];
          for I := L to H-1 do Result[ I ] := A_[ I ] *     0  ;
     end;
end;

class operator TSingleND.Divide( const A_:TSingleND; const B_:Single ) :TSingleND;
var
   I :Integer;
begin
     Result.DimN := A_.DimN;

     for I := 0 to Result.DimN-1 do Result[ I ] := A_[ I ] / B_;
end;

class operator TSingleND.Divide( const A_,B_:TSingleND ) :TSingleND;
var
   L, H, I :Integer;
begin
     if A_.DimN <= B_.DimN then
     begin
          L := A_.DimN;
          H := B_.DimN;

          Result.DimN := H;
          for I := 0 to L-1 do Result[ I ] := A_[ I ] / B_[ I ];
          for I := L to H-1 do Result[ I ] :=     0   / B_[ I ];
     end
     else
     begin
          L := B_.DimN;
          H := A_.DimN;

          Result.DimN := H;
          for I := 0 to L-1 do Result[ I ] := A_[ I ] / B_[ I ];
          for I := L to H-1 do Result[ I ] := A_[ I ] /     0  ;
     end;
end;

///////////////////////////////////////////////////////////////////////// 型変換

class operator TSingleND.Explicit( const V_:TSingleND ) :TSingle2D;
begin
     with Result do
     begin
          _1 := V_[ 0 ];
          _2 := V_[ 1 ];
     end;
end;

class operator TSingleND.Explicit( const V_:TSingleND ) :TSingle3D;
begin
     with Result do
     begin
          _1 := V_[ 0 ];
          _2 := V_[ 1 ];
          _3 := V_[ 2 ];
     end;
end;

class operator TSingleND.Explicit( const V_:TSingleND ) :TSingle4D;
begin
     with Result do
     begin
          _1 := V_[ 0 ];
          _2 := V_[ 1 ];
          _3 := V_[ 2 ];
          _4 := V_[ 3 ];
     end;
end;

class operator TSingleND.Explicit( const V_:TSingleND ) :TSingle5D;
begin
     with Result do
     begin
          _1 := V_[ 0 ];
          _2 := V_[ 1 ];
          _3 := V_[ 2 ];
          _4 := V_[ 3 ];
          _5 := V_[ 4 ];
     end;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TSingleND.VectorTo( const P_:TSingleND ) :TSingleND;
begin
     Result := P_ - Self;
end;

function TSingleND.UnitorTo( const P_:TSingleND ) :TSingleND;
begin
     Result := VectorTo( P_ ).Unitor;
end;

function TSingleND.DistanTo( const P_:TSingleND ) :Single;
begin
     Result := VectorTo( P_ ).Size;
end;

//------------------------------------------------------------------------------

class function TSingleND.RandG( const N_:Integer ) :TSingleND;
var
   I :Integer;
begin
     Result.DimN := N_;

     for I := 0 to Result.DimN-1 do Result[ I ] := System.Math.RandG( 0, 1 );
end;

//------------------------------------------------------------------------------

class function TSingleND.RandBS1( const N_:Integer ) :TSingleND;
var
   I :Integer;
begin
     Result.DimN := N_;

     for I := 0 to Result.DimN-1 do Result[ I ] := TSingle.RandBS1;
end;

class function TSingleND.RandBS2( const N_:Integer ) :TSingleND;
var
   I :Integer;
begin
     Result.DimN := N_;

     for I := 0 to Result.DimN-1 do Result[ I ] := TSingle.RandBS2;
end;

class function TSingleND.RandBS4( const N_:Integer ) :TSingleND;
var
   I :Integer;
begin
     Result.DimN := N_;

     for I := 0 to Result.DimN-1 do Result[ I ] := TSingle.RandBS4;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleND

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TDoubleND.Getos( const I_:Integer ) :Double;
begin
     Result := _s[ I_ ];
end;

procedure TDoubleND.Setos( const I_:Integer; const o_:Double );
begin
     _s[ I_ ] := o_;
end;

//------------------------------------------------------------------------------

function TDoubleND.GetDimN :Integer;
begin
     Result := Length( _s );
end;

procedure TDoubleND.SetDimN( const DimN_:Integer );
begin
     SetLength( _s, DimN_ );
end;

//------------------------------------------------------------------------------

function TDoubleND.GetSiz2 :Double;
var
   I :Integer;
begin
     Result := 0;

     for I := 0 to DimN-1 do Result := Result + Pow2( _s[ I ] );
end;

procedure TDoubleND.SetSiz2( const Siz2_:Double );
begin
     Self := Roo2( Siz2_ / Siz2 ) * Self;
end;

function TDoubleND.GetSize :Double;
begin
     Result := Roo2( GetSiz2 );
end;

procedure TDoubleND.SetSize( const Size_:Double );
begin
     Self := Size_ * Unitor;
end;

function TDoubleND.GetUnitor :TDoubleND;
begin
     Result := Self / Size;
end;

procedure TDoubleND.SetUnitor( const Unitor_:TDoubleND );
begin
     Self := Size * Unitor_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TDoubleND.Create( const N_:Integer );
begin
     DimN := N_;
end;

constructor TDoubleND.Create( const V_:Double; const N_:Integer );
var
   I :Integer;
begin
     DimN := N_;

     for I := 0 to DimN-1 do _s[ I ] := V_;
end;

constructor TDoubleND.Create( const Vs_:array of Double );
var
   I :Integer;
begin
     DimN := Length( Vs_ );

     for I := 0 to DimN-1 do _s[ I ] := Vs_[ I ];
end;

constructor TDoubleND.Create( const D_:TDoubleND );
begin
     _s := Copy( D_._s );
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TDoubleND.Negative( const V_:TDoubleND ) :TDoubleND;
var
   I :Integer;
begin
     Result.DimN := V_.DimN;

     for I := 0 to Result.DimN-1 do Result[ I ] := -V_[ I ];
end;

class operator TDoubleND.Positive( const V_:TDoubleND ) :TDoubleND;
var
   I :Integer;
begin
     Result.DimN := V_.DimN;

     for I := 0 to Result.DimN-1 do Result[ I ] := +V_[ I ];
end;

class operator TDoubleND.Add( const A_,B_:TDoubleND ) :TDoubleND;
var
   L, H, I :Integer;
begin
     if A_.DimN <= B_.DimN then
     begin
          L := A_.DimN;
          H := B_.DimN;

          Result.DimN := H;
          for I := 0 to L-1 do Result[ I ] := A_[ I ] + B_[ I ];
          for I := L to H-1 do Result[ I ] :=     0   + B_[ I ];
     end
     else
     begin
          L := B_.DimN;
          H := A_.DimN;

          Result.DimN := H;
          for I := 0 to L-1 do Result[ I ] := A_[ I ] + B_[ I ];
          for I := L to H-1 do Result[ I ] := A_[ I ] +     0  ;
     end;
end;

class operator TDoubleND.Subtract( const A_,B_:TDoubleND ) :TDoubleND;
var
   L, H, I :Integer;
begin
     if A_.DimN <= B_.DimN then
     begin
          L := A_.DimN;
          H := B_.DimN;

          Result.DimN := H;
          for I := 0 to L-1 do Result[ I ] := A_[ I ] - B_[ I ];
          for I := L to H-1 do Result[ I ] :=     0   - B_[ I ];
     end
     else
     begin
          L := B_.DimN;
          H := A_.DimN;

          Result.DimN := H;
          for I := 0 to L-1 do Result[ I ] := A_[ I ] - B_[ I ];
          for I := L to H-1 do Result[ I ] := A_[ I ] -     0  ;
     end;
end;

class operator TDoubleND.Multiply( const A_:TDoubleND; const B_:Double ) :TDoubleND;
var
   I :Integer;
begin
     Result.DimN := A_.DimN;

     for I := 0 to Result.DimN-1 do Result[ I ] := A_[ I ] * B_;
end;

class operator TDoubleND.Multiply( const A_:Double; const B_:TDoubleND ) :TDoubleND;
var
   I :Integer;
begin
     Result.DimN := B_.DimN;

     for I := 0 to Result.DimN-1 do Result[ I ] := A_ * B_[ I ];
end;

class operator TDoubleND.Multiply( const A_,B_:TDoubleND ) :TDoubleND;
var
   L, H, I :Integer;
begin
     if A_.DimN <= B_.DimN then
     begin
          L := A_.DimN;
          H := B_.DimN;

          Result.DimN := H;
          for I := 0 to L-1 do Result[ I ] := A_[ I ] * B_[ I ];
          for I := L to H-1 do Result[ I ] :=     0   * B_[ I ];
     end
     else
     begin
          L := B_.DimN;
          H := A_.DimN;

          Result.DimN := H;
          for I := 0 to L-1 do Result[ I ] := A_[ I ] * B_[ I ];
          for I := L to H-1 do Result[ I ] := A_[ I ] *     0  ;
     end;
end;

class operator TDoubleND.Divide( const A_:TDoubleND; const B_:Double ) :TDoubleND;
var
   I :Integer;
begin
     Result.DimN := A_.DimN;

     for I := 0 to Result.DimN-1 do Result[ I ] := A_[ I ] / B_;
end;

class operator TDoubleND.Divide( const A_,B_:TDoubleND ) :TDoubleND;
var
   L, H, I :Integer;
begin
     if A_.DimN <= B_.DimN then
     begin
          L := A_.DimN;
          H := B_.DimN;

          Result.DimN := H;
          for I := 0 to L-1 do Result[ I ] := A_[ I ] / B_[ I ];
          for I := L to H-1 do Result[ I ] :=     0   / B_[ I ];
     end
     else
     begin
          L := B_.DimN;
          H := A_.DimN;

          Result.DimN := H;
          for I := 0 to L-1 do Result[ I ] := A_[ I ] / B_[ I ];
          for I := L to H-1 do Result[ I ] := A_[ I ] /     0  ;
     end;
end;

///////////////////////////////////////////////////////////////////////// 型変換

class operator TDoubleND.Explicit( const V_:TDoubleND ) :TDouble2D;
begin
     with Result do
     begin
          _1 := V_[ 0 ];
          _2 := V_[ 1 ];
     end;
end;

class operator TDoubleND.Explicit( const V_:TDoubleND ) :TDouble3D;
begin
     with Result do
     begin
          _1 := V_[ 0 ];
          _2 := V_[ 1 ];
          _3 := V_[ 2 ];
     end;
end;

class operator TDoubleND.Explicit( const V_:TDoubleND ) :TDouble4D;
begin
     with Result do
     begin
          _1 := V_[ 0 ];
          _2 := V_[ 1 ];
          _3 := V_[ 2 ];
          _4 := V_[ 3 ];
     end;
end;

class operator TDoubleND.Explicit( const V_:TDoubleND ) :TDouble5D;
begin
     with Result do
     begin
          _1 := V_[ 0 ];
          _2 := V_[ 1 ];
          _3 := V_[ 2 ];
          _4 := V_[ 3 ];
          _5 := V_[ 4 ];
     end;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TDoubleND.VectorTo( const P_:TDoubleND ) :TDoubleND;
begin
     Result := P_ - Self;
end;

function TDoubleND.UnitorTo( const P_:TDoubleND ) :TDoubleND;
begin
     Result := VectorTo( P_ ).Unitor;
end;

function TDoubleND.DistanTo( const P_:TDoubleND ) :Double;
begin
     Result := VectorTo( P_ ).Size;
end;

//------------------------------------------------------------------------------

class function TDoubleND.RandG( const N_:Integer ) :TDoubleND;
var
   I :Integer;
begin
     Result.DimN := N_;

     for I := 0 to Result.DimN-1 do Result[ I ] := System.Math.RandG( 0, 1 );
end;

//------------------------------------------------------------------------------

class function TDoubleND.RandBS1( const N_:Integer ) :TDoubleND;
var
   I :Integer;
begin
     Result.DimN := N_;

     for I := 0 to Result.DimN-1 do Result[ I ] := TSingle.RandBS1;
end;

class function TDoubleND.RandBS2( const N_:Integer ) :TDoubleND;
var
   I :Integer;
begin
     Result.DimN := N_;

     for I := 0 to Result.DimN-1 do Result[ I ] := TSingle.RandBS2;
end;

class function TDoubleND.RandBS4( const N_:Integer ) :TDoubleND;
var
   I :Integer;
begin
     Result.DimN := N_;

     for I := 0 to Result.DimN-1 do Result[ I ] := TSingle.RandBS4;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdSingleND

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TdSingleND.Getos( const I_:Integer ) :TdSingle;
begin
     Result := _s[ I_ ];
end;

procedure TdSingleND.Setos( const I_:Integer; const o_:TdSingle );
begin
     _s[ I_ ] := o_;
end;

//------------------------------------------------------------------------------

function TdSingleND.GetDimN :Integer;
begin
     Result := Length( _s );
end;

procedure TdSingleND.SetDimN( const DimN_:Integer );
begin
     SetLength( _s, DimN_ );
end;

//------------------------------------------------------------------------------

function TdSingleND.Geto :TSingleND;
var
   I :Integer;
begin
     Result.DimN := DimN;

     for I := 0 to Result.DimN-1 do Result[ I ] := _s[ I ].o;
end;

procedure TdSingleND.Seto( const o_:TSingleND );
var
   I :Integer;
begin
     DimN := o_.DimN;

     for I := 0 to DimN-1 do _s[ I ].o := o_[ I ];
end;

function TdSingleND.Getd :TSingleND;
var
   I :Integer;
begin
     Result.DimN := DimN;

     for I := 0 to Result.DimN-1 do Result[ I ] := _s[ I ].d;
end;

procedure TdSingleND.Setd( const d_:TSingleND );
var
   I :Integer;
begin
     DimN := d_.DimN;

     for I := 0 to DimN-1 do _s[ I ].d := d_[ I ];
end;

function TdSingleND.GetSiz2 :TdSingle;
var
   I :Integer;
begin
     Result := 0;

     for I := 0 to DimN-1 do Result := Result + Pow2( _s[ I ] );
end;

procedure TdSingleND.SetSiz2( const Siz2_:TdSingle );
begin
     Self := Roo2( Siz2_ / Siz2 ) * Self;
end;

function TdSingleND.GetSize :TdSingle;
begin
     Result := Roo2( Siz2 );
end;

procedure TdSingleND.SetSize( const Size_:TdSingle );
begin
     Self := Size_ * Unitor;
end;

function TdSingleND.GetUnitor :TdSingleND;
begin
     Result := Self / Size;
end;

procedure TdSingleND.SetUnitor( const Unitor_:TdSingleND );
begin
     Self := Size * Unitor_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TdSingleND.Create( const N_:Integer );
begin
     DimN := N_;
end;

constructor TdSingleND.Create( const V_:TdSingle; const N_:Integer );
var
   I :Integer;
begin
     DimN := N_;

     for I := 0 to DimN-1 do _s[ I ] := V_;
end;

constructor TdSingleND.Create( const Vs_:array of TdSingle );
var
   I :Integer;
begin
     DimN := Length( Vs_ );

     for I := 0 to DimN-1 do _s[ I ] := Vs_[ I ];
end;

constructor TdSingleND.Create( const D_:TdSingleND );
begin
     _s := Copy( D_._s );
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TdSingleND.Negative( const V_:TdSingleND ) :TdSingleND;
var
   I :Integer;
begin
     Result.DimN := V_.DimN;

     for I := 0 to Result.DimN-1 do Result[ I ] := -V_[ I ];
end;

class operator TdSingleND.Positive( const V_:TdSingleND ) :TdSingleND;
var
   I :Integer;
begin
     Result.DimN := V_.DimN;

     for I := 0 to Result.DimN-1 do Result[ I ] := +V_[ I ];
end;

class operator TdSingleND.Add( const A_,B_:TdSingleND ) :TdSingleND;
var
   L, H, I :Integer;
begin
     if A_.DimN <= B_.DimN then
     begin
          L := A_.DimN;
          H := B_.DimN;

          Result.DimN := H;
          for I := 0 to L-1 do Result[ I ] := A_[ I ] + B_[ I ];
          for I := L to H-1 do Result[ I ] :=     0   + B_[ I ];
     end
     else
     begin
          L := B_.DimN;
          H := A_.DimN;

          Result.DimN := H;
          for I := 0 to L-1 do Result[ I ] := A_[ I ] + B_[ I ];
          for I := L to H-1 do Result[ I ] := A_[ I ] +     0  ;
     end;
end;

class operator TdSingleND.Subtract( const A_,B_:TdSingleND ) :TdSingleND;
var
   L, H, I :Integer;
begin
     if A_.DimN <= B_.DimN then
     begin
          L := A_.DimN;
          H := B_.DimN;

          Result.DimN := H;
          for I := 0 to L-1 do Result[ I ] := A_[ I ] - B_[ I ];
          for I := L to H-1 do Result[ I ] :=     0   - B_[ I ];
     end
     else
     begin
          L := B_.DimN;
          H := A_.DimN;

          Result.DimN := H;
          for I := 0 to L-1 do Result[ I ] := A_[ I ] - B_[ I ];
          for I := L to H-1 do Result[ I ] := A_[ I ] -     0  ;
     end;
end;

class operator TdSingleND.Multiply( const A_:TdSingleND; const B_:TdSingle ) :TdSingleND;
var
   I :Integer;
begin
     Result.DimN := A_.DimN;

     for I := 0 to Result.DimN-1 do Result[ I ] := A_[ I ] * B_;
end;

class operator TdSingleND.Multiply( const A_:TdSingle; const B_:TdSingleND ) :TdSingleND;
var
   I :Integer;
begin
     Result.DimN := B_.DimN;

     for I := 0 to Result.DimN-1 do Result[ I ] := A_ * B_[ I ];
end;

class operator TdSingleND.Multiply( const A_,B_:TdSingleND ) :TdSingleND;
var
   L, H, I :Integer;
begin
     if A_.DimN <= B_.DimN then
     begin
          L := A_.DimN;
          H := B_.DimN;

          Result.DimN := H;
          for I := 0 to L-1 do Result[ I ] := A_[ I ] * B_[ I ];
          for I := L to H-1 do Result[ I ] :=     0   * B_[ I ];
     end
     else
     begin
          L := B_.DimN;
          H := A_.DimN;

          Result.DimN := H;
          for I := 0 to L-1 do Result[ I ] := A_[ I ] * B_[ I ];
          for I := L to H-1 do Result[ I ] := A_[ I ] *     0  ;
     end;
end;

class operator TdSingleND.Divide( const A_:TdSingleND; const B_:TdSingle ) :TdSingleND;
var
   I :Integer;
begin
     Result.DimN := A_.DimN;

     for I := 0 to Result.DimN-1 do Result[ I ] := A_[ I ] / B_;
end;

class operator TdSingleND.Divide( const A_,B_:TdSingleND ) :TdSingleND;
var
   L, H, I :Integer;
begin
     if A_.DimN <= B_.DimN then
     begin
          L := A_.DimN;
          H := B_.DimN;

          Result.DimN := H;
          for I := 0 to L-1 do Result[ I ] := A_[ I ] / B_[ I ];
          for I := L to H-1 do Result[ I ] :=     0   / B_[ I ];
     end
     else
     begin
          L := B_.DimN;
          H := A_.DimN;

          Result.DimN := H;
          for I := 0 to L-1 do Result[ I ] := A_[ I ] / B_[ I ];
          for I := L to H-1 do Result[ I ] := A_[ I ] /     0  ;
     end;
end;

///////////////////////////////////////////////////////////////////////// 型変換

class operator TdSingleND.Implicit( const V_:TSingleND ) :TdSingleND;
var
   I :Integer;
begin
     Result.DimN := V_.DimN;

     for I := 0 to Result.DimN-1 do
     begin
          with Result._s[ I ] do
          begin
               o := V_[ I ];
               d := 0;
          end;
     end;
end;

class operator TdSingleND.Implicit( const V_:TdSingleND ) :TSingleND;
var
   I :Integer;
begin
     Result.DimN := V_.DimN;

     for I := 0 to Result.DimN-1 do Result[ I ] := V_[ I ].o;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdDoubleND

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TdDoubleND.Getos( const I_:Integer ) :TdDouble;
begin
     Result := _s[ I_ ];
end;

procedure TdDoubleND.Setos( const I_:Integer; const o_:TdDouble );
begin
     _s[ I_ ] := o_;
end;

//------------------------------------------------------------------------------

function TdDoubleND.GetDimN :Integer;
begin
     Result := Length( _s );
end;

procedure TdDoubleND.SetDimN( const DimN_:Integer );
begin
     SetLength( _s, DimN_ );
end;

//------------------------------------------------------------------------------

function TdDoubleND.Geto :TDoubleND;
var
   I :Integer;
begin
     Result.DimN := DimN;

     for I := 0 to Result.DimN-1 do Result[ I ] := _s[ I ].o;
end;

procedure TdDoubleND.Seto( const o_:TDoubleND );
var
   I :Integer;
begin
     DimN := o_.DimN;

     for I := 0 to DimN-1 do _s[ I ].o := o_[ I ];
end;

function TdDoubleND.Getd :TDoubleND;
var
   I :Integer;
begin
     Result.DimN := DimN;

     for I := 0 to Result.DimN-1 do Result[ I ] := _s[ I ].d;
end;

procedure TdDoubleND.Setd( const d_:TDoubleND );
var
   I :Integer;
begin
     DimN := d_.DimN;

     for I := 0 to DimN-1 do _s[ I ].d := d_[ I ];
end;

function TdDoubleND.GetSiz2 :TdDouble;
var
   I :Integer;
begin
     Result := 0;

     for I := 0 to DimN-1 do Result := Result + Pow2( _s[ I ] );
end;

procedure TdDoubleND.SetSiz2( const Siz2_:TdDouble );
begin
     Self := Roo2( Siz2_ / Siz2 ) * Self;
end;

function TdDoubleND.GetSize :TdDouble;
begin
     Result := Roo2( Siz2 );
end;

procedure TdDoubleND.SetSize( const Size_:TdDouble );
begin
     Self := Size_ * Unitor;
end;

function TdDoubleND.GetUnitor :TdDoubleND;
begin
     Result := Self / Size;
end;

procedure TdDoubleND.SetUnitor( const Unitor_:TdDoubleND );
begin
     Self := Size * Unitor_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TdDoubleND.Create( const N_:Integer );
begin
     DimN := N_;
end;

constructor TdDoubleND.Create( const V_:TdDouble; const N_:Integer );
var
   I :Integer;
begin
     DimN := N_;

     for I := 0 to DimN-1 do _s[ I ] := V_;
end;

constructor TdDoubleND.Create( const Vs_:array of TdDouble );
var
   I :Integer;
begin
     DimN := Length( Vs_ );

     for I := 0 to DimN-1 do _s[ I ] := Vs_[ I ];
end;

constructor TdDoubleND.Create( const D_:TdDoubleND );
begin
     _s := Copy( D_._s );
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TdDoubleND.Negative( const V_:TdDoubleND ) :TdDoubleND;
var
   I :Integer;
begin
     Result.DimN := V_.DimN;

     for I := 0 to Result.DimN-1 do Result[ I ] := -V_[ I ];
end;

class operator TdDoubleND.Positive( const V_:TdDoubleND ) :TdDoubleND;
var
   I :Integer;
begin
     Result.DimN := V_.DimN;

     for I := 0 to Result.DimN-1 do Result[ I ] := +V_[ I ];
end;

class operator TdDoubleND.Add( const A_,B_:TdDoubleND ) :TdDoubleND;
var
   L, H, I :Integer;
begin
     if A_.DimN <= B_.DimN then
     begin
          L := A_.DimN;
          H := B_.DimN;

          Result.DimN := H;
          for I := 0 to L-1 do Result[ I ] := A_[ I ] + B_[ I ];
          for I := L to H-1 do Result[ I ] :=     0   + B_[ I ];
     end
     else
     begin
          L := B_.DimN;
          H := A_.DimN;

          Result.DimN := H;
          for I := 0 to L-1 do Result[ I ] := A_[ I ] + B_[ I ];
          for I := L to H-1 do Result[ I ] := A_[ I ] +     0  ;
     end;
end;

class operator TdDoubleND.Subtract( const A_,B_:TdDoubleND ) :TdDoubleND;
var
   L, H, I :Integer;
begin
     if A_.DimN <= B_.DimN then
     begin
          L := A_.DimN;
          H := B_.DimN;

          Result.DimN := H;
          for I := 0 to L-1 do Result[ I ] := A_[ I ] - B_[ I ];
          for I := L to H-1 do Result[ I ] :=     0   - B_[ I ];
     end
     else
     begin
          L := B_.DimN;
          H := A_.DimN;

          Result.DimN := H;
          for I := 0 to L-1 do Result[ I ] := A_[ I ] - B_[ I ];
          for I := L to H-1 do Result[ I ] := A_[ I ] -     0  ;
     end;
end;

class operator TdDoubleND.Multiply( const A_:TdDoubleND; const B_:TdDouble ) :TdDoubleND;
var
   I :Integer;
begin
     Result.DimN := A_.DimN;

     for I := 0 to Result.DimN-1 do Result[ I ] := A_[ I ] * B_;
end;

class operator TdDoubleND.Multiply( const A_:TdDouble; const B_:TdDoubleND ) :TdDoubleND;
var
   I :Integer;
begin
     Result.DimN := B_.DimN;

     for I := 0 to Result.DimN-1 do Result[ I ] := A_ * B_[ I ];
end;

class operator TdDoubleND.Multiply( const A_,B_:TdDoubleND ) :TdDoubleND;
var
   L, H, I :Integer;
begin
     if A_.DimN <= B_.DimN then
     begin
          L := A_.DimN;
          H := B_.DimN;

          Result.DimN := H;
          for I := 0 to L-1 do Result[ I ] := A_[ I ] * B_[ I ];
          for I := L to H-1 do Result[ I ] :=     0   * B_[ I ];
     end
     else
     begin
          L := B_.DimN;
          H := A_.DimN;

          Result.DimN := H;
          for I := 0 to L-1 do Result[ I ] := A_[ I ] * B_[ I ];
          for I := L to H-1 do Result[ I ] := A_[ I ] *     0  ;
     end;
end;

class operator TdDoubleND.Divide( const A_:TdDoubleND; const B_:TdDouble ) :TdDoubleND;
var
   I :Integer;
begin
     Result.DimN := A_.DimN;

     for I := 0 to Result.DimN-1 do Result[ I ] := A_[ I ] / B_;
end;

class operator TdDoubleND.Divide( const A_,B_:TdDoubleND ) :TdDoubleND;
var
   L, H, I :Integer;
begin
     if A_.DimN <= B_.DimN then
     begin
          L := A_.DimN;
          H := B_.DimN;

          Result.DimN := H;
          for I := 0 to L-1 do Result[ I ] := A_[ I ] / B_[ I ];
          for I := L to H-1 do Result[ I ] :=     0   / B_[ I ];
     end
     else
     begin
          L := B_.DimN;
          H := A_.DimN;

          Result.DimN := H;
          for I := 0 to L-1 do Result[ I ] := A_[ I ] / B_[ I ];
          for I := L to H-1 do Result[ I ] := A_[ I ] /     0  ;
     end;
end;

///////////////////////////////////////////////////////////////////////// 型変換

class operator TdDoubleND.Implicit( const V_:TDoubleND ) :TdDoubleND;
var
   I :Integer;
begin
     Result.DimN := V_.DimN;

     for I := 0 to Result.DimN-1 do
     begin
          with Result._s[ I ] do
          begin
               o := V_[ I ];
               d := 0;
          end;
     end;
end;

class operator TdDoubleND.Implicit( const V_:TdDoubleND ) :TDoubleND;
var
   I :Integer;
begin
     Result.DimN := V_.DimN;

     for I := 0 to Result.DimN-1 do Result[ I ] := V_[ I ].o;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function DotProduct( const A_,B_:TSingleVecND ) :Single;
var
   I :Integer;
begin
     Result := 0;

     for I := 0 to A_.DimN-1 do Result := Result + A_[ I ] * B_[ I ];
end;

function DotProduct( const A_,B_:TDoubleVecND ) :Double;
var
   I :Integer;
begin
     Result := 0;

     for I := 0 to A_.DimN-1 do Result := Result + A_[ I ] * B_[ I ];
end;

function DotProduct( const A_,B_:TdSingleVecND ) :TdSingle;
var
   I :Integer;
begin
     Result := 0;

     for I := 0 to A_.DimN-1 do Result := Result + A_[ I ] * B_[ I ];
end;

function DotProduct( const A_,B_:TdDoubleVecND ) :TdDouble;
var
   I :Integer;
begin
     Result := 0;

     for I := 0 to A_.DimN-1 do Result := Result + A_[ I ] * B_[ I ];
end;

//------------------------------------------------------------------------------

function Dista2( const A_,B_:TSinglePosND ) :Single;
var
   I :Integer;
begin
     Result := 0;

     for I := 0 to A_.DimN-1 do Result := Result + Pow2( B_[ I ] * A_[ I ] );
end;

function Dista2( const A_,B_:TDoublePosND ) :Double;
var
   I :Integer;
begin
     Result := 0;

     for I := 0 to A_.DimN-1 do Result := Result + Pow2( B_[ I ] * A_[ I ] );
end;

function Dista2( const A_,B_:TdSinglePosND ) :TdSingle;
var
   I :Integer;
begin
     Result := 0;

     for I := 0 to A_.DimN-1 do Result := Result + Pow2( B_[ I ] * A_[ I ] );
end;

function Dista2( const A_,B_:TdDoublePosND ) :TdDouble;
var
   I :Integer;
begin
     Result := 0;

     for I := 0 to A_.DimN-1 do Result := Result + Pow2( B_[ I ] * A_[ I ] );
end;

//------------------------------------------------------------------------------

function Distan( const A_,B_:TSinglePosND ) :Single;
begin
     Result := Roo2( Dista2( A_, B_ ) );
end;

function Distan( const A_,B_:TDoublePosND ) :Double;
begin
     Result := Roo2( Dista2( A_, B_ ) );
end;

function Distan( const A_,B_:TdSinglePosND ) :TdSingle;
begin
     Result := Roo2( Dista2( A_, B_ ) );
end;

function Distan( const A_,B_:TdDoublePosND ) :TdDouble;
begin
     Result := Roo2( Dista2( A_, B_ ) );
end;

//------------------------------------------------------------------------------

function Ave( const P1_,P2_:TSingleND ) :TSingleND;
begin
     Result := ( P1_ + P2_ ) / 2;
end;

function Ave( const P1_,P2_:TDoubleND ) :TDoubleND;
begin
     Result := ( P1_ + P2_ ) / 2;
end;

function Ave( const P1_,P2_:TdSingleND ) :TdSingleND;
begin
     Result := ( P1_ + P2_ ) / 2;
end;

function Ave( const P1_,P2_:TdDoubleND ) :TdDoubleND;
begin
     Result := ( P1_ + P2_ ) / 2;
end;

//------------------------------------------------------------------------------

function Ave( const P1_,P2_,P3_:TSingleND ) :TSingleND;
begin
     Result := ( P1_ + P2_ + P3_ ) / 3;
end;

function Ave( const P1_,P2_,P3_:TDoubleND ) :TDoubleND;
begin
     Result := ( P1_ + P2_ + P3_ ) / 3;
end;

function Ave( const P1_,P2_,P3_:TdSingleND ) :TdSingleND;
begin
     Result := ( P1_ + P2_ + P3_ ) / 3;
end;

function Ave( const P1_,P2_,P3_:TdDoubleND ) :TdDoubleND;
begin
     Result := ( P1_ + P2_ + P3_ ) / 3;
end;

//------------------------------------------------------------------------------

function Ave( const P1_,P2_,P3_,P4_:TSingleND ) :TSingleND;
begin
     Result := ( P1_ + P2_ + P3_ + P4_ ) / 4;
end;

function Ave( const P1_,P2_,P3_,P4_:TDoubleND ) :TDoubleND;
begin
     Result := ( P1_ + P2_ + P3_ + P4_ ) / 4;
end;

function Ave( const P1_,P2_,P3_,P4_:TdSingleND ) :TdSingleND;
begin
     Result := ( P1_ + P2_ + P3_ + P4_ ) / 4;
end;

function Ave( const P1_,P2_,P3_,P4_:TdDoubleND ) :TdDoubleND;
begin
     Result := ( P1_ + P2_ + P3_ + P4_ ) / 4;
end;

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
