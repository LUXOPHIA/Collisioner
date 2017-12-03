unit LUX.D1;

interface //#################################################################### ■

uses LUX;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingle

     TSingle = record
     private
     public
       ///// 型変換
       class function RandBS1 :Single; static;
       class function RandBS2 :Single; static;
       class function RandBS4 :Single; static;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDouble

     TDouble = record
     private
     public
       ///// 型変換
       class function RandBS1 :Double; static;
       class function RandBS2 :Double; static;
       class function RandBS4 :Double; static;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdSingle

     TdSingle = record
     private
     public
       o :Single;
       d :Single;
       /////
       constructor Create( const o_,d_:Single );
       ///// 演算子
       class operator Positive( const V_:TdSingle ) :TdSingle;
       class operator Negative( const V_:TdSingle ) :TdSingle;
       class operator Add( const A_,B_:TdSingle ) :TdSingle;
       class operator Subtract( const A_,B_:TdSingle ) :TdSingle;
       class operator Multiply( const A_:Single; const B_:TdSingle ) :TdSingle;
       class operator Multiply( const A_:TdSingle; const B_:Single ) :TdSingle;
       class operator Multiply( const A_,B_:TdSingle ) :TdSingle;
       class operator Divide( const A_:TdSingle; const B_:Single ) :TdSingle;
       class operator Divide( const A_,B_:TdSingle ) :TdSingle;
       class operator GreaterThan( const A_,B_:TdSingle ) :Boolean;
       class operator GreaterThanOrEqual( const A_,B_:TdSingle ) :Boolean;
       class operator LessThan( const A_,B_:TdSingle ) :Boolean;
       class operator LessThanOrEqual( const A_,B_:TdSingle ) :Boolean;
       ///// 型変換
       class operator Implicit( const V_:Integer ) :TdSingle;
       class operator Implicit( const V_:Int64 ) :TdSingle;
       class operator Implicit( const V_:Single ) :TdSingle;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdDouble

     TdDouble = record
     private
     public
       o :Double;
       d :Double;
       /////
       constructor Create( const o_,d_:Double );
       ///// 演算子
       class operator Positive( const V_:TdDouble ) :TdDouble;
       class operator Negative( const V_:TdDouble ) :TdDouble;
       class operator Add( const A_,B_:TdDouble ) :TdDouble;
       class operator Subtract( const A_,B_:TdDouble ) :TdDouble;
       class operator Multiply( const A_:Double; const B_:TdDouble ) :TdDouble;
       class operator Multiply( const A_:TdDouble; const B_:Double ) :TdDouble;
       class operator Multiply( const A_,B_:TdDouble ) :TdDouble;
       class operator Divide( const A_:TdDouble; const B_:Double ) :TdDouble;
       class operator Divide( const A_,B_:TdDouble ) :TdDouble;
       class operator GreaterThan( const A_,B_:TdDouble ) :Boolean;
       class operator GreaterThanOrEqual( const A_,B_:TdDouble ) :Boolean;
       class operator LessThan( const A_,B_:TdDouble ) :Boolean;
       class operator LessThanOrEqual( const A_,B_:TdDouble ) :Boolean;
       ///// 型変換
       class operator Implicit( const V_:Integer ) :TdDouble;
       class operator Implicit( const V_:Int64 ) :TdDouble;
       class operator Implicit( const V_:Double ) :TdDouble;
       class operator Implicit( const V_:TdSingle ) :TdDouble;
       class operator Implicit( const V_:TdDouble ) :TdSingle;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleArea

     TSingleArea = record
     private
     public
       Min :Single;
       Max :Single;
       /////
       constructor Create( const Min_,Max_:Single );  overload;
       constructor Create( const V1_,V2_,V3_:Single );  overload;
       ///// 定数
       class function NeInf :TSingleArea; inline; static;
       class function NeMax :TSingleArea; inline; static;
       class function Zero  :TSingleArea; inline; static;
       class function PoMax :TSingleArea; inline; static;
       class function PoInf :TSingleArea; inline; static;
       ///// メソッド
       function Collision( const Area_:TSingleArea ) :Boolean;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleArea

     TDoubleArea = record
     private
     public
       Min :Double;
       Max :Double;
       /////
       constructor Create( const Min_,Max_:Double );  overload;
       constructor Create( const V1_,V2_,V3_:Double );  overload;
       ///// 定数
       class function NeInf :TDoubleArea; inline; static;
       class function NeMax :TDoubleArea; inline; static;
       class function Zero  :TDoubleArea; inline; static;
       class function PoMax :TDoubleArea; inline; static;
       class function PoInf :TDoubleArea; inline; static;
       ///// メソッド
       function Collision( const Area_:TDoubleArea ) :Boolean;
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TIter1D< TValue_ >

     TIter1D< TValue_ > = class( TIter< TValue_ > )
     private
       procedure CalCount;
     protected
       _HeadI :Integer;
       _TailI :Integer;
       _StepX :Integer;
       _Count :Integer;
       ///// アクセス
       function GetHeadI :Integer; virtual;
       procedure SetHeadI( const HeadI_:Integer ); virtual;
       function GetTailI :Integer; virtual;
       procedure SetTailI( const TailI_:Integer ); virtual;
       function GetStepX :Integer; virtual;
       procedure SetStepX( const StepX_:Integer ); virtual;
       function GetCount :Integer; virtual;
       procedure SetCount( const Count_:Integer ); virtual;
     public
       constructor Create( const HeadI_:Integer = 0; const StepX_:Integer = 1 );
       procedure AfterConstruction; override;
       ///// プロパティ
       property HeadI :Integer read _HeadI write SetHeadI;
       property TailI :Integer read _TailI write SetTailI;
       property StepN :Integer read _StepX write SetStepX;
       property StepX :Integer read _StepX write SetStepX;
       property Count :Integer read _Count write SetCount;
       ///// メソッド
       procedure GoHead; virtual; abstract;
       procedure GoPrev; overload; virtual; abstract;
       procedure GoNext; overload; virtual; abstract;
       procedure GoPrev( const N_:Integer ); overload; virtual; abstract;
       procedure GoNext( const N_:Integer ); overload; virtual; abstract;
       procedure GoJump( const I_:Integer ); virtual; abstract;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTransIter1D< TValue_, TIter_ >

     TTransIter1D< TValue_, TIter_ > = class( TIter1D< TValue_ > )
     private
     protected
       _Iter :TIter1D< TIter_ >;
       ///// アクセス
       function GetHeadI :Integer; override;
       procedure SetHeadI( const HeadI_:Integer ); override;
       function GetTailI :Integer; override;
       procedure SetTailI( const TailI_:Integer ); override;
       function GetStepX :Integer; override;
       procedure SetStepX( const StepX_:Integer ); override;
       function GetCount :Integer; override;
       procedure SetCount( const Count_:Integer ); override;
     public
       constructor Create( const Iter_:TIter1D< TIter_ > );
       destructor Destroy; override;
       ///// プロパティ
       property Iter :TIter1D< TIter_ > read _Iter write _Iter;
       ///// メソッド
       procedure GoHead; override;
       procedure GoPrev; overload; override;
       procedure GoNext; overload; override;
       procedure GoPrev( const N_:Integer ); overload; override;
       procedure GoNext( const N_:Integer ); overload; override;
       procedure GoJump( const I_:Integer ); override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleIter1D

     TDoubleIter1D = class( TTransIter1D< Double, Single > )
     private
     protected
       ///// アクセス
       function GetValue :Double; override;
       procedure SetValue( const Value_:Double ); override;
     public
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TIter1D< TValue_, TParent_ >

     TIter1D< TValue_, TParent_ > = class( TIter1D< TValue_ > )
     private
     protected
       _Parent :TParent_;
       ///// アクセス
       procedure SetParent( const Parent_:TParent_ ); virtual;
     public
       constructor Create( const Parent_:TParent_; const HeadI_:Integer = 0; const StepX_:Integer = 1 );
       ///// プロパティ
       property Parent :TParent_ read _Parent write SetParent;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TArrayIter< TValue_, TElement_ >

     TArrayIter< TValue_, TElement_ > = class( TIter1D< TValue_, TArray<TElement_> > )
     //------------------------------
          type PElement_ = ^TElement_;
     //------------------------------
     private
     protected
       _CurrentP :PElement_;
     public
       constructor Create( const Parent_:TArray<TElement_>; const HeadI_:Integer = 0; const StepX_:Integer = 1 );
       ///// メソッド
       procedure GoHead; override;
       procedure GoPrev; overload; override;
       procedure GoNext; overload; override;
       procedure GoPrev( const N_:Integer ); overload; override;
       procedure GoNext( const N_:Integer ); overload; override;
       procedure GoJump( const I_:Integer ); override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TArrayIter< TValue_ >

     TArrayIter< TValue_ >  = class( TArrayIter< TValue_, TValue_ > )
     private
     protected
       ///// アクセス
       function GetValue :TValue_; override;
       procedure SetValue( const Value_:TValue_ ); override;
     public
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function Pow2( const X_:TdSingle ) :TdSingle; overload;
function Pow2( const X_:TdDouble ) :TdDouble; overload;
           
function Pow3( const X_:TdSingle ) :TdSingle; overload;
function Pow3( const X_:TdDouble ) :TdDouble; overload;

function Roo2( const X_:TdSingle ) :TdSingle; overload;
function Roo2( const X_:TdDouble ) :TdDouble; overload;

function ArcCos( const C_:TdSingle ) :TdSingle; overload;
function ArcCos( const C_:TdDouble ) :TdDouble; overload;

function Abso( const V_:TdSingle ) :TdSingle; overload;
function Abso( const V_:TdDouble ) :TdDouble; overload;

function Sin( const X_:TdSingle ) :TdSingle; overload;
function Sin( const X_:TdDouble ) :TdDouble; overload;

function Cos( const X_:TdSingle ) :TdSingle; overload;
function Cos( const X_:TdDouble ) :TdDouble; overload;

procedure CosSin( const X_:TdSingle; out C_,S_:TdSingle ); overload;
procedure CosSin( const X_:TdDouble; out C_,S_:TdDouble ); overload;

procedure SinCos( const X_:TdSingle; out S_,C_:TdSingle ); overload;
procedure SinCos( const X_:TdDouble; out S_,C_:TdDouble ); overload;

function Tan( const X_:TdSingle ) :TdSingle; overload;
function Tan( const X_:TdDouble ) :TdDouble; overload;

function ArcTan( const X_:TdSingle ) :TdSingle; overload;
function ArcTan( const X_:TdDouble ) :TdDouble; overload;

function ArcSin( const X_:TdSingle ) :TdSingle; overload;
function ArcSin( const X_:TdDouble ) :TdDouble; overload;

function Min( const A_,B_:TdDouble ) :TdDouble; overload;
function Min( const A_,B_:TdSingle ) :TdSingle; overload;

function Max( const A_,B_:TdSingle ) :TdSingle; overload;
function Max( const A_,B_:TdDouble ) :TdDouble; overload;

function Min( const A_,B_,C_:TdDouble ) :TdDouble; overload;
function Min( const A_,B_,C_:TdSingle ) :TdSingle; overload;

function Max( const A_,B_,C_:TdSingle ) :TdSingle; overload;
function Max( const A_,B_,C_:TdDouble ) :TdDouble; overload;

function Gauss( const X_,SD_:Single ) :Single; overload;
function Gauss( const X_,SD_:Double ) :Double; overload;

function Exp( const X_:TdSingle ) :TdSingle; overload;
function Exp( const X_:TdDouble ) :TdDouble; overload;

function Ln( const X_:TdSingle ) :TdSingle; overload;
function Ln( const X_:TdDouble ) :TdDouble; overload;

function Power( const X_,N_:TdSingle ) :TdSingle; overload;
function Power( const X_,N_:TdDouble ) :TdDouble; overload;

implementation //############################################################### ■

uses System.SysUtils, System.Math;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingle

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

class function TSingle.RandBS1 :Single;
begin
     Result := Random - 0.5;
end;

class function TSingle.RandBS2 :Single;
begin
     Result := RandBS1 + RandBS1;
end;

class function TSingle.RandBS4 :Single;
begin
     Result := RandBS2 + RandBS2;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDouble

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

class function TDouble.RandBS1 :Double;
begin
     Result := Random - 0.5;
end;

class function TDouble.RandBS2 :Double;
begin
     Result := RandBS1 + RandBS1;
end;

class function TDouble.RandBS4 :Double;
begin
     Result := RandBS2 + RandBS2;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdSingle

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TdSingle.Create( const o_,d_:Single );
begin
     o := o_;
     d := d_;
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TdSingle.Positive( const V_:TdSingle ) :TdSingle;
begin
     with Result do
     begin
          o := +V_.o;
          d := +V_.d;
     end;
end;

class operator TdSingle.Negative( const V_:TdSingle ) :TdSingle;
begin
     with Result do
     begin
          o := -V_.o;
          d := -V_.d;
     end;
end;

class operator TdSingle.Add( const A_,B_:TdSingle ) :TdSingle;
begin
     with Result do
     begin
          o := A_.o + B_.o;
          d := A_.d + B_.d;
     end;
end;

class operator TdSingle.Subtract( const A_,B_:TdSingle ) :TdSingle;
begin
     with Result do
     begin
          o := A_.o - B_.o;
          d := A_.d - B_.d;
     end;
end;

class operator TdSingle.Multiply( const A_:Single; const B_:TdSingle ) :TdSingle;
begin
     with Result do
     begin
          o := A_ * B_.o;
          d := A_ * B_.d;
     end;
end;

class operator TdSingle.Multiply( const A_:TdSingle; const B_:Single ) :TdSingle;
begin
     with Result do
     begin
          o := A_.o * B_;
          d := A_.d * B_;
     end;
end;

class operator TdSingle.Multiply( const A_,B_:TdSingle ) :TdSingle;
begin
     with Result do
     begin
          o := A_.o * B_.o;
          d := A_.d * B_.o + A_.o * B_.d;
     end;
end;

class operator TdSingle.Divide( const A_:TdSingle; const B_:Single ) :TdSingle;    
begin
     with Result do
     begin
          o := A_.o / B_;
          d := A_.d / B_;
     end;
end;

class operator TdSingle.Divide( const A_,B_:TdSingle ) :TdSingle;
begin
     with Result do
     begin
          o := A_.o / B_.o;
          d := ( A_.d * B_.o - A_.o * B_.d ) / Pow2( B_.o );
     end;
end;

class operator TdSingle.GreaterThan( const A_,B_:TdSingle ) :Boolean;
begin
     Result := ( A_.o >  B_.o );
end;

class operator TdSingle.GreaterThanOrEqual( const A_,B_:TdSingle ) :Boolean;
begin
     Result := ( A_.o >= B_.o );
end;

class operator TdSingle.LessThan( const A_,B_:TdSingle ) :Boolean;
begin
     Result := ( A_.o <  B_.o );
end;

class operator TdSingle.LessThanOrEqual( const A_,B_:TdSingle ) :Boolean;
begin
     Result := ( A_.o <= B_.o );
end;

///////////////////////////////////////////////////////////////////////// 型変換

class operator TdSingle.Implicit( const V_:Integer ) :TdSingle;
begin
     with Result do
     begin
          o := V_;
          d := 0;
     end;
end;

class operator TdSingle.Implicit( const V_:Int64 ) :TdSingle;
begin
     with Result do
     begin
          o := V_;
          d := 0;
     end;
end;

class operator TdSingle.Implicit( const V_:Single ) :TdSingle;
begin
     with Result do
     begin
          o := V_;
          d := 0;
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdDouble

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TdDouble.Create( const o_,d_:Double );
begin
     o := o_;
     d := d_;
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TdDouble.Positive( const V_:TdDouble ) :TdDouble;
begin
     with Result do
     begin
          o := +V_.o;
          d := +V_.d;
     end;
end;

class operator TdDouble.Negative( const V_:TdDouble ) :TdDouble;
begin
     with Result do
     begin
          o := -V_.o;
          d := -V_.d;
     end;
end;

class operator TdDouble.Add( const A_,B_:TdDouble ) :TdDouble;
begin
     with Result do
     begin
          o := A_.o + B_.o;
          d := A_.d + B_.d;
     end;
end;

class operator TdDouble.Subtract( const A_,B_:TdDouble ) :TdDouble;
begin
     with Result do
     begin
          o := A_.o - B_.o;
          d := A_.d - B_.d;
     end;
end;

class operator TdDouble.Multiply( const A_:Double; const B_:TdDouble ) :TdDouble;
begin
     with Result do
     begin
          o := A_ * B_.o;
          d := A_ * B_.d;
     end;
end;

class operator TdDouble.Multiply( const A_:TdDouble; const B_:Double ) :TdDouble;
begin
     with Result do
     begin
          o := A_.o * B_;
          d := A_.d * B_;
     end;
end;

class operator TdDouble.Multiply( const A_,B_:TdDouble ) :TdDouble;
begin
     with Result do
     begin
          o := A_.o * B_.o;
          d := A_.d * B_.o + A_.o * B_.d;
     end;
end;

class operator TdDouble.Divide( const A_:TdDouble; const B_:Double ) :TdDouble;    
begin
     with Result do
     begin
          o := A_.o / B_;
          d := A_.d / B_;
     end;
end;

class operator TdDouble.Divide( const A_,B_:TdDouble ) :TdDouble;
begin
     with Result do
     begin
          o := A_.o / B_.o;
          d := ( A_.d * B_.o - A_.o * B_.d ) / Pow2( B_.o );
     end;
end;

class operator TdDouble.GreaterThan( const A_,B_:TdDouble ) :Boolean;
begin
     Result := ( A_.o >  B_.o );
end;

class operator TdDouble.GreaterThanOrEqual( const A_,B_:TdDouble ) :Boolean;
begin
     Result := ( A_.o >= B_.o );
end;

class operator TdDouble.LessThan( const A_,B_:TdDouble ) :Boolean;
begin
     Result := ( A_.o <  B_.o );
end;

class operator TdDouble.LessThanOrEqual( const A_,B_:TdDouble ) :Boolean;
begin
     Result := ( A_.o <= B_.o );
end;

///////////////////////////////////////////////////////////////////////// 型変換

class operator TdDouble.Implicit( const V_:Integer ) :TdDouble;
begin
     with Result do
     begin
          o := V_;
          d := 0;
     end;
end;

class operator TdDouble.Implicit( const V_:Int64 ) :TdDouble;
begin
     with Result do
     begin
          o := V_;
          d := 0;
     end;
end;

class operator TdDouble.Implicit( const V_:Double ) :TdDouble;
begin
     with Result do
     begin
          o := V_;
          d := 0;
     end;
end;

class operator TdDouble.Implicit( const V_:TdSingle ) :TdDouble;
begin
     with Result do
     begin
          o := V_.o;
          d := V_.d;
     end;
end;

class operator TdDouble.Implicit( const V_:TdDouble ) :TdSingle;
begin
     with Result do
     begin
          o := V_.o;
          d := V_.d;
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleArea

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TSingleArea.Create( const Min_,Max_:Single );
begin
     Min := Min_;
     Max := Max_;
end;

constructor TSingleArea.Create( const V1_,V2_,V3_:Single );
begin
     if V1_ <= V2_ then
     begin
          // V1_ <= V2_
          if V1_ <= V3_ then
          begin
               // V1_ <= V2_, V3_
               Min := V1_;

               if V2_ <= V3_ then Max := V3_   // V1_ <= V2_ <= V3_
                             else Max := V2_;  // V1_ <= V3_ <  V2_
          end
          else
          begin
               // V3_ < V1_ <= V2_
               Min := V3_;
               Max := V2_;
          end;
     end
     else
     begin
          // V2_ < V1_
          if V1_ <= V3_ then
          begin
               // V2_ < V1_ <= V3_
               Min := V2_;
               Max := V3_;
          end
          else
          begin
               // V2_, V3_ < V1_
               Max := V1_;

               if V2_ <= V3_ then Min := V2_   // V2_ <= V3_ < V1_
                             else Min := V3_;  // V3_ <  V2_ < V1_
          end;
     end;
end;

/////////////////////////////////////////////////////////////////////////// 定数

class function TSingleArea.NeInf :TSingleArea;
begin
     Result := TSingleArea.Create( Single.PositiveInfinity,
                                   Single.NegativeInfinity );
end;

class function TSingleArea.NeMax :TSingleArea;
begin
     Result := TSingleArea.Create( +Single.MaxValue,
                                   -Single.MaxValue );
end;

class function TSingleArea.Zero :TSingleArea;
begin
     Result := TSingleArea.Create( 0, 0 );
end;

class function TSingleArea.PoMax :TSingleArea;
begin
     Result := TSingleArea.Create( -Single.MaxValue,
                                   +Single.MaxValue );
end;

class function TSingleArea.PoInf :TSingleArea;
begin
     Result := TSingleArea.Create( Single.NegativeInfinity,
                                   Single.PositiveInfinity );
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TSingleArea.Collision( const Area_:TSingleArea ) :Boolean;
begin
     Result := ( Area_.Min <= Max ) and ( Min <= Area_.Max );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleArea

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TDoubleArea.Create( const Min_,Max_:Double );
begin
     Min := Min_;
     Max := Max_;
end;

constructor TDoubleArea.Create( const V1_,V2_,V3_:Double );
begin
     if V1_ <= V2_ then
     begin
          // V1_ <= V2_
          if V1_ <= V3_ then
          begin
               // V1_ <= V2_, V3_
               Min := V1_;

               if V2_ <= V3_ then Max := V3_   // V1_ <= V2_ <= V3_
                             else Max := V2_;  // V1_ <= V3_ <  V2_
          end
          else
          begin
               // V3_ < V1_ <= V2_
               Min := V3_;
               Max := V2_;
          end;
     end
     else
     begin
          // V2_ < V1_
          if V1_ <= V3_ then
          begin
               // V2_ < V1_ <= V3_
               Min := V2_;
               Max := V3_;
          end
          else
          begin
               // V2_, V3_ < V1_
               Max := V1_;

               if V2_ <= V3_ then Min := V2_   // V2_ <= V3_ < V1_
                             else Min := V3_;  // V3_ <  V2_ < V1_
          end;
     end;
end;

/////////////////////////////////////////////////////////////////////////// 定数

class function TDoubleArea.NeInf :TDoubleArea;
begin
     Result := TDoubleArea.Create( Double.PositiveInfinity,
                                   Double.NegativeInfinity );
end;

class function TDoubleArea.NeMax :TDoubleArea;
begin
     Result := TDoubleArea.Create( +Double.MaxValue,
                                   -Double.MaxValue );
end;

class function TDoubleArea.Zero :TDoubleArea;
begin
     Result := TDoubleArea.Create( 0, 0 );
end;

class function TDoubleArea.PoMax :TDoubleArea;
begin
     Result := TDoubleArea.Create( -Double.MaxValue,
                                   +Double.MaxValue );
end;

class function TDoubleArea.PoInf :TDoubleArea;
begin
     Result := TDoubleArea.Create( Double.NegativeInfinity,
                                   Double.PositiveInfinity );
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TDoubleArea.Collision( const Area_:TDoubleArea ) :Boolean;
begin
     Result := ( Area_.Min <= Max ) and ( Min <= Area_.Max );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TIter1D< TValue_ >

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

procedure TIter1D< TValue_ >.CalCount;
begin
     _Count := ( _TailI - _HeadI ) div _StepX + 1;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TIter1D< TValue_ >.GetHeadI :Integer;
begin
     Result := _HeadI;
end;

procedure TIter1D< TValue_ >.SetHeadI( const HeadI_:Integer );
begin
     _HeadI := HeadI_;  CalCount;
end;

function TIter1D< TValue_ >.GetTailI :Integer;
begin
     Result := _TailI;
end;

procedure TIter1D< TValue_ >.SetTailI( const TailI_:Integer );
begin
     _TailI := TailI_;  CalCount;
end;

function TIter1D< TValue_ >.GetStepX :Integer;
begin
     Result := _StepX;
end;

procedure TIter1D< TValue_ >.SetStepX( const StepX_:Integer );
begin
     _StepX := StepX_;  CalCount;
end;

function TIter1D< TValue_ >.GetCount :Integer;
begin
     Result := _Count;
end;

procedure TIter1D< TValue_ >.SetCount( const Count_:Integer );
begin
     _Count := Count_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TIter1D< TValue_ >.Create( const HeadI_:Integer = 0; const StepX_:Integer = 1 );
begin
     inherited Create;

     _HeadI := HeadI_;
     _StepX := StepX_;
end;

procedure TIter1D< TValue_ >.AfterConstruction;
begin
     inherited;

     GoHead;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTransIter1D< TValue_, TIter_ >

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TTransIter1D< TValue_, TIter_ >.GetHeadI :Integer;
begin
     Result := _Iter.GetHeadI;
end;

procedure TTransIter1D< TValue_, TIter_ >.SetHeadI( const HeadI_:Integer );
begin
     _Iter.SetHeadI( HeadI_ );
end;

function TTransIter1D< TValue_, TIter_ >.GetTailI :Integer;
begin
     Result := _Iter.GetTailI;
end;

procedure TTransIter1D< TValue_, TIter_ >.SetTailI( const TailI_:Integer );
begin
     _Iter.SetTailI( TailI_ );
end;

function TTransIter1D< TValue_, TIter_ >.GetStepX :Integer;
begin
     Result := _Iter.GetStepX;
end;

procedure TTransIter1D< TValue_, TIter_ >.SetStepX( const StepX_:Integer );
begin
     _Iter.SetStepX( StepX_ );
end;

function TTransIter1D< TValue_, TIter_ >.GetCount :Integer;
begin
     Result := _Iter.GetCount;
end;

procedure TTransIter1D< TValue_, TIter_ >.SetCount( const Count_:Integer );
begin
     _Iter.SetCount( Count_ );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TTransIter1D< TValue_, TIter_ >.Create( const Iter_:TIter1D< TIter_ > );
begin
     inherited Create;

     _Iter := Iter_;
end;

destructor TTransIter1D< TValue_, TIter_ >.Destroy;
begin
     _Iter.Free;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TTransIter1D< TValue_, TIter_ >.GoHead;
begin
     _Iter.GoHead;
end;

procedure TTransIter1D< TValue_, TIter_ >.GoPrev;
begin
     _Iter.GoPrev;
end;

procedure TTransIter1D< TValue_, TIter_ >.GoNext;
begin
     _Iter.GoNext;
end;

procedure TTransIter1D< TValue_, TIter_ >.GoPrev( const N_:Integer );
begin
     _Iter.GoPrev( N_ );
end;

procedure TTransIter1D< TValue_, TIter_ >.GoNext( const N_:Integer );
begin
     _Iter.GoNext( N_ );
end;

procedure TTransIter1D< TValue_, TIter_ >.GoJump( const I_:Integer );
begin
     _Iter.GoJump( I_ );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleIter1D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TDoubleIter1D.GetValue :Double;
begin
     Result := _Iter.GetValue;
end;

procedure TDoubleIter1D.SetValue( const Value_:Double );
begin
     _Iter.SetValue( Value_ );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TIter1D< TValue_, TParent_ >

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

procedure TIter1D< TValue_, TParent_ >.SetParent( const Parent_:TParent_ );
begin
     _Parent := Parent_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TIter1D< TValue_, TParent_ >.Create( const Parent_:TParent_; const HeadI_:Integer = 0; const StepX_:Integer = 1 );
begin
     inherited Create( HeadI_, StepX_ );

     _Parent := Parent_;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TArrayIter< TValue_, TElement_ >

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TArrayIter< TValue_, TElement_ >.Create( const Parent_:TArray<TElement_>; const HeadI_:Integer = 0; const StepX_:Integer = 1 );
begin
     inherited;

     TailI := High( _Parent );
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TArrayIter< TValue_, TElement_ >.GoHead;
begin
     _CurrentP := @_Parent[ _HeadI ];
end;

procedure TArrayIter< TValue_, TElement_ >.GoPrev;
begin
     Dec( _CurrentP, _StepX );
end;

procedure TArrayIter< TValue_, TElement_ >.GoNext;
begin
     Inc( _CurrentP, _StepX );
end;

procedure TArrayIter< TValue_, TElement_ >.GoPrev( const N_:Integer );
begin
     Dec( _CurrentP, _StepX * N_ );
end;

procedure TArrayIter< TValue_, TElement_ >.GoNext( const N_:Integer );
begin
     Inc( _CurrentP, _StepX * N_ );
end;

procedure TArrayIter< TValue_, TElement_ >.GoJump( const I_:Integer );
begin
     _CurrentP := @_Parent[ _HeadI + _StepX * I_ ];
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TArrayIter< TValue_ >

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TArrayIter< TValue_ >.GetValue :TValue_;
begin
     Result := _CurrentP^;
end;

procedure TArrayIter< TValue_ >.SetValue( const Value_:TValue_ );
begin
     _CurrentP^ := Value_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function Pow2( const X_:TdSingle ) :TdSingle;
begin
     with X_ do
     begin
          Result.o := Pow2( o );
          Result.d := 2 * o * d;
     end;
end;

function Pow2( const X_:TdDouble ) :TdDouble;
begin
     with X_ do
     begin
          Result.o := Pow2( o );
          Result.d := 2 * o * d;
     end;
end;

//------------------------------------------------------------------------------

function Pow3( const X_:TdSingle ) :TdSingle;
begin
     with X_ do
     begin
          Result.o := Pow3( o );
          Result.d := 3 * Pow2( o ) * d;
     end;
end;

function Pow3( const X_:TdDouble ) :TdDouble;
begin
     with X_ do
     begin
          Result.o := Pow3( o );
          Result.d := 3 * Pow2( o ) * d;
     end;
end;

//------------------------------------------------------------------------------

function Roo2( const X_:TdSingle ) :TdSingle;
begin
     with X_ do
     begin
          Result.o := Roo2( o );
          Result.d := d / ( 2 * Roo2( o ) );
     end;
end;

function Roo2( const X_:TdDouble ) :TdDouble;
begin
     with X_ do
     begin
          Result.o := Roo2( o );
          Result.d := d / ( 2 * Roo2( o ) );
     end;
end;

//------------------------------------------------------------------------------

function ArcCos( const C_:TdSingle ) :TdSingle;
begin
     with C_ do
     begin
          Result.o := ArcCos( o );
          Result.d := -d / Roo2( 1 - Pow2( o ) );
     end;
end;

function ArcCos( const C_:TdDouble ) :TdDouble;
begin
     with C_ do
     begin
          Result.o := ArcCos( o );
          Result.d := -d / Roo2( 1 - Pow2( o ) );
     end;
end;

//------------------------------------------------------------------------------

function Abso( const V_:TdSingle ) :TdSingle;
begin
     Result := Sign( V_.o ) * V_;
end;

function Abso( const V_:TdDouble ) :TdDouble;
begin
     Result := Sign( V_.o ) * V_;
end;

//------------------------------------------------------------------------------

function Sin( const X_:TdSingle ) :TdSingle;
begin
     with X_ do
     begin
          Result.o :=      Sin( o );
          Result.d := d * +Cos( o );
     end;
end;

function Sin( const X_:TdDouble ) :TdDouble;
begin
     with X_ do
     begin
          Result.o :=      Sin( o );
          Result.d := d * +Cos( o );
     end;
end;

//------------------------------------------------------------------------------

function Cos( const X_:TdSingle ) :TdSingle;
begin
     with X_ do
     begin
          Result.o :=      Cos( o );
          Result.d := d * -Sin( o );
     end;
end;

function Cos( const X_:TdDouble ) :TdDouble;
begin
     with X_ do
     begin
          Result.o :=      Cos( o );
          Result.d := d * -Sin( o );
     end;
end;

//------------------------------------------------------------------------------

procedure CosSin( const X_:TdSingle; out C_,S_:TdSingle );
var
   S, C :Single;
begin
     with X_ do
     begin
          SinCos( o, S, C );

          S_.o :=      S;
          S_.d := d * +C;

          C_.o :=      C;
          C_.d := d * -S;
     end;
end;

procedure CosSin( const X_:TdDouble; out C_,S_:TdDouble );
var
   S, C :Double;
begin
     with X_ do
     begin
          SinCos( o, S, C );

          S_.o :=      S;
          S_.d := d * +C;

          C_.o :=      C;
          C_.d := d * -S;
     end;
end;

//------------------------------------------------------------------------------

procedure SinCos( const X_:TdSingle; out S_,C_:TdSingle );
var
   S, C :Single;
begin
     with X_ do
     begin
          SinCos( o, S, C );

          S_.o :=      S;
          S_.d := d * +C;

          C_.o :=      C;
          C_.d := d * -S;
     end;
end;

procedure SinCos( const X_:TdDouble; out S_,C_:TdDouble );
var
   S, C :Double;
begin
     with X_ do
     begin
          SinCos( o, S, C );

          S_.o :=      S;
          S_.d := d * +C;

          C_.o :=      C;
          C_.d := d * -S;
     end;
end;

//------------------------------------------------------------------------------

function Tan( const X_:TdSingle ) :TdSingle;
begin
     with X_ do
     begin
          Result.o := Tan( o );
          Result.d := d / Pow2( Cos( o ) );
     end;
end;

function Tan( const X_:TdDouble ) :TdDouble;
begin
     with X_ do
     begin
          Result.o := Tan( o );
          Result.d := d / Pow2( Cos( o ) );
     end;
end;

//------------------------------------------------------------------------------

function ArcTan( const X_:TdSingle ) :TdSingle;
begin
     with X_ do
     begin
          Result.o := ArcTan( o );
          Result.d := d / ( 1 + Pow2( o ) );
     end;
end;

function ArcTan( const X_:TdDouble ) :TdDouble;
begin
     with X_ do
     begin
          Result.o := ArcTan( o );
          Result.d := d / ( 1 + Pow2( o ) );
     end;
end;

//------------------------------------------------------------------------------

function ArcSin( const X_:TdSingle ) :TdSingle;
begin
     with X_ do
     begin
          Result.o := ArcSin( o );
          Result.d := d / Roo2( 1 - Pow2( o ) );
     end;
end;

function ArcSin( const X_:TdDouble ) :TdDouble;
begin
     with X_ do
     begin
          Result.o := ArcSin( o );
          Result.d := d / Roo2( 1 - Pow2( o ) );
     end;
end;

//------------------------------------------------------------------------------

function Min( const A_,B_:TdDouble ) :TdDouble;
begin
     if A_ <= B_ then Result := A_
                 else Result := B_;
end;

function Min( const A_,B_:TdSingle ) :TdSingle;
begin
     if A_ <= B_ then Result := A_
                 else Result := B_;
end;

//------------------------------------------------------------------------------

function Max( const A_,B_:TdSingle ) :TdSingle;
begin
     if A_ <= B_ then Result := B_
                 else Result := A_;
end;

function Max( const A_,B_:TdDouble ) :TdDouble;
begin
     if A_ <= B_ then Result := B_
                 else Result := A_;
end;

//------------------------------------------------------------------------------

function Min( const A_,B_,C_:TdSingle ) :TdSingle;
begin
     if A_ <= B_ then
     begin
          if A_ <= C_ then Result := A_
                      else Result := C_;
     end
     else
     begin
          if B_ <= C_ then Result := B_
                      else Result := C_;
     end;
end;

function Min( const A_,B_,C_:TdDouble ) :TdDouble;
begin
     if A_ <= B_ then
     begin
          if A_ <= C_ then Result := A_
                      else Result := C_;
     end
     else
     begin
          if B_ <= C_ then Result := B_
                      else Result := C_;
     end;
end;

//------------------------------------------------------------------------------

function Max( const A_,B_,C_:TdSingle ) :TdSingle;
begin
     if A_ >= B_ then
     begin
          if A_ >= C_ then Result := A_
                      else Result := C_;
     end
     else
     begin

          if B_ >= C_ then Result := B_
                      else Result := C_;
     end;
end;

function Max( const A_,B_,C_:TdDouble ) :TdDouble;
begin
     if A_ >= B_ then
     begin
          if A_ >= C_ then Result := A_
                      else Result := C_;
     end
     else
     begin

          if B_ >= C_ then Result := B_
                      else Result := C_;
     end;
end;

//------------------------------------------------------------------------------

function Gauss( const X_,SD_:Single ) :Single;
var
   V :Single;
begin
     V := Pow2( SD_ );

     Result := Exp( -Pow2( X_ ) / ( 2 * V ) ) / Roo2( Pi2 * V );
end;

function Gauss( const X_,SD_:Double ) :Double;
var
   V :Double;
begin
     V := Pow2( SD_ );

     Result := Exp( -Pow2( X_ ) / ( 2 * V ) ) / Roo2( Pi2 * V );
end;

//------------------------------------------------------------------------------

function Exp( const X_:TdSingle ) :TdSingle;
begin
     with X_ do
     begin
          Result.o :=     Exp( o );
          Result.d := d * Exp( o );
     end;
end;

function Exp( const X_:TdDouble ) :TdDouble;
begin
     with X_ do
     begin
          Result.o :=     Exp( o );
          Result.d := d * Exp( o );
     end;
end;

//------------------------------------------------------------------------------

function Ln( const X_:TdSingle ) :TdSingle;
begin
     with X_ do
     begin
          Result.o := Ln( o );
          Result.d := d / o  ;
     end;
end;

function Ln( const X_:TdDouble ) :TdDouble;
begin
     with X_ do
     begin
          Result.o := Ln( o );
          Result.d := d / o  ;
     end;
end;

//------------------------------------------------------------------------------

function Power( const X_,N_:TdSingle ) :TdSingle;
begin
     with Result do
     begin
          o :=               Power( X_.o, N_.o     );
          d := X_.d * N_.o * Power( X_.o, N_.o - 1 );
     end;
end;

function Power( const X_,N_:TdDouble ) :TdDouble;
begin
     with Result do
     begin
          o :=               Power( X_.o, N_.o     );
          d := X_.d * N_.o * Power( X_.o, N_.o - 1 );
     end;
end;

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
