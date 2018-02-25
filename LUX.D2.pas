unit LUX.D2;

interface //#################################################################### ■

uses System.Types,
     LUX, LUX.D1;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TByte2D

     TByte2D = record
     private
       ///// アクセス
       function GetV( const I_:Integer ) :Byte; inline;
       procedure SetV( const I_:Integer; const V_:Byte ); inline;
     public
       constructor Create( const V_:Byte ); overload;
       constructor Create( const X_,Y_:Byte ); overload;
       ///// プロパティ
       property _s[ const I_:Integer ] :Byte read GetV write SetV; default;
     case Byte of
      0:( _ :array [ 1..2 ] of Byte; );
      1:(  X :Byte;
           Y :Byte;                  );
      2:( _1 :Byte;
          _2 :Byte;                  );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TShortint2D

     TShortint2D = record
     private
     public
       constructor Create( const V_:Shortint ); overload;
       constructor Create( const X_,Y_:Shortint ); overload;
     case Byte of
      0:( _ :array [ 1..2 ] of Shortint; );
      1:(  X :Shortint;
           Y :Shortint;                  );
      2:( _1 :Shortint;
          _2 :Shortint;                  );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TWord2D

     TWord2D = record
     private
     public
       constructor Create( const V_:Word ); overload;
       constructor Create( const X_,Y_:Word ); overload;
     case Byte of
      0:( _ :array [ 1..2 ] of Word; );
      1:(  X :Word;
           Y :Word;                  );
      2:( _1 :Word;
          _2 :Word;                  );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSmallint2D

     TSmallint2D = record
     private
     public
       constructor Create( const V_:Smallint ); overload;
       constructor Create( const X_,Y_:Smallint ); overload;
     case Byte of
      0:( _ :array [ 1..2 ] of Smallint; );
      1:(  X :Smallint;
           Y :Smallint;                  );
      2:( _1 :Smallint;
          _2 :Smallint;                  );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TCardinal2D

     TCardinal2D = record
     private
     public
       constructor Create( const V_:Cardinal ); overload;
       constructor Create( const X_,Y_:Cardinal ); overload;
     case Byte of
      0:( _ :array [ 1..2 ] of Cardinal; );
      1:(  X :Cardinal;
           Y :Cardinal;                  );
      2:( _1 :Cardinal;
          _2 :Cardinal;                  );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TInteger2D

     TInteger2D = record
     private
       ///// アクセス
       function GetV( const I_:Integer ) :Integer; inline;
       procedure SetV( const I_:Integer; const V_:Integer ); inline;
     public
       ///// プロパティ
       property _s[ const I_:Integer ] :Integer read GetV write SetV; default;
     case Byte of
      0:( _  :array [ 1..2 ] of Integer; );
      1:(  X :Integer;
           Y :Integer;                   );
      2:( _1 :Integer;
          _2 :Integer;                   );
      3:(  U :Integer;
           V :Integer;                   );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingle2D

     TSingle2D = record
     private
       ///// アクセス
       function GetV( const I_:Integer ) :Single; inline;
       procedure SetV( const I_:Integer; const V_:Single ); inline;
       function GetSiz2 :Single; inline;
       procedure SetSiz2( const Siz2_:Single ); inline;
       function GetSize :Single; inline;
       procedure SetSize( const Size_:Single ); inline;
       function GetUnitor :TSingle2D; inline;
       procedure SetUnitor( const Unitor_:TSingle2D ); inline;
       function GetOrthant :Byte;
     public
       constructor Create( const X_,Y_:Single );
       ///// プロパティ
       property _s[ const I_:Integer ] :Single    read GetV       write SetV     ; default;
       property Siz2                   :Single    read GetSiz2    write SetSiz2  ;
       property Size                   :Single    read GetSize    write SetSize  ;
       property Unitor                 :TSingle2D read GetUnitor  write SetUnitor;
       property Orthant                :Byte      read GetOrthant                ;
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
       ///// メソッド
       function VectorTo( const P_:TSingle2D ) :TSingle2D;
       function UnitorTo( const P_:TSingle2D ) :TSingle2D;
       function DistanTo( const P_:TSingle2D ) :Single;
       function RotL90 :TSingle2D;
       function RotR90 :TSingle2D;
       function RotAngleTo( const V_:TSingle2D ) :Single;
       class function RandG :TSingle2D; static;
       class function RandBS1 :TSingle2D; static;
       class function RandBS2 :TSingle2D; static;
       class function RandBS4 :TSingle2D; static;
     case Byte of
      0:( _  :array [ 1..2 ] of Single; );
      1:(  X :Single;
           Y :Single;                   );
      2:( _1 :Single;
          _2 :Single;                   );
      3:(  U :Single;
           V :Single;                   );
     end;

     TSinglePos2D = TSingle2D;
     TSingleVec2D = TSingle2D;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDouble2D

     TDouble2D = record
     private
       ///// アクセス
       function GetV( const I_:Integer ) :Double; inline;
       procedure SetV( const I_:Integer; const V_:Double ); inline;
       function GetSiz2 :Double; inline;
       procedure SetSiz2( const Siz2_:Double ); inline;
       function GetSize :Double; inline;
       procedure SetSize( const Size_:Double ); inline;
       function GetUnitor :TDouble2D; inline;
       procedure SetUnitor( const Unitor_:TDouble2D ); inline;
       function GetOrthant :Byte;
     public
       constructor Create( const X_,Y_:Double );
       ///// プロパティ
       property _s[ const I_:Integer ] :Double    read GetV       write SetV     ; default;
       property Siz2                   :Double    read GetSiz2    write SetSiz2  ;
       property Size                   :Double    read GetSize    write SetSize  ;
       property Unitor                 :TDouble2D read GetUnitor  write SetUnitor;
       property Orthant                :Byte      read GetOrthant                ;
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
       class operator Explicit( const V_:TDouble2D ) :TPointF; inline;
       class operator Implicit( const V_:TSingle2D ) :TDouble2D; inline;
       class operator Explicit( const V_:TDouble2D ) :TSingle2D; inline;
       ///// 定数
       class function IdentityX :TDouble2D; inline; static;
       class function IdentityY :TDouble2D; inline; static;
       ///// メソッド
       function VectorTo( const P_:TDouble2D ) :TDouble2D;
       function UnitorTo( const P_:TDouble2D ) :TDouble2D;
       function DistanTo( const P_:TDouble2D ) :Double;
       function RotL90 :TDouble2D;
       function RotR90 :TDouble2D;
       function RotAngleTo( const V_:TDouble2D ) :Double;
       class function RandG :TDouble2D; static;
       class function RandBS1 :TDouble2D; static;
       class function RandBS2 :TDouble2D; static;
       class function RandBS4 :TDouble2D; static;
     case Byte of
      0:( _  :array [ 1..2 ] of Double; );
      1:(  X :Double;
           Y :Double;                   );
      2:( _1 :Double;
          _2 :Double;                   );
      3:(  U :Double;
           V :Double;                   );
     end;

     TDoublePos2D = TDouble2D;
     TDoubleVec2D = TDouble2D;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdSingle2D

     TdSingle2D = record
     private
       ///// アクセス
       function GetV( const I_:Integer ) :TdSingle; inline;
       procedure SetV( const I_:Integer; const V_:TdSingle ); inline;
       function Geto :TSingle2D; inline;
       procedure Seto( const o_:TSingle2D ); inline;
       function Getd :TSingle2D; inline;
       procedure Setd( const d_:TSingle2D ); inline;
       function GetSiz2 :TdSingle; inline;
       procedure SetSiz2( const Siz2_:TdSingle ); inline;
       function GetSize :TdSingle; inline;
       procedure SetSize( const Size_:TdSingle ); inline;
       function GetUnitor :TdSingle2D; inline;
       procedure SetUnitor( const Unitor_:TdSingle2D ); inline;
     public
       constructor Create( const X_,Y_:TdSingle );
       ///// プロパティ
       property _s[ const I_:Integer ] :TdSingle   read GetV      write SetV     ; default;
       property o                      :TSingle2D  read Geto      write Seto     ;
       property d                      :TSingle2D  read Getd      write Setd     ;
       property Siz2                   :TdSingle   read GetSiz2   write SetSiz2  ;
       property Size                   :TdSingle   read GetSize   write SetSize  ;
       property Unitor                 :TdSingle2D read GetUnitor write SetUnitor;
       ///// 演算子
       class operator Negative( const V_:TdSingle2D ) :TdSingle2D; inline;
       class operator Positive( const V_:TdSingle2D ) :TdSingle2D; inline;
       class operator Add( const A_,B_:TdSingle2D ) :TdSingle2D; inline;
       class operator Subtract( const A_,B_:TdSingle2D ) :TdSingle2D; inline;
       class operator Multiply( const A_:TdSingle2D; const B_:TdSingle ) :TdSingle2D; inline;
       class operator Multiply( const A_:TdSingle; const B_:TdSingle2D ) :TdSingle2D; inline;
       class operator Divide( const A_:TdSingle2D; const B_:TdSingle ) :TdSingle2D; inline;
       ///// 型変換
       class operator Implicit( const P_:TPointF ) :TdSingle2D; inline;
       class operator Explicit( const P_:TdSingle2D ) :TPointF; inline;
       class operator Implicit( const P_:TSingle2D ) :TdSingle2D; inline;
       class operator Explicit( const P_:TdSingle2D ) :TSingle2D; inline;
     case Byte of
      0:( _  :array [ 1..2 ] of TdSingle; );
      1:(  X :TdSingle;
           Y :TdSingle;                   );
      2:( _1 :TdSingle;
          _2 :TdSingle;                   );
      3:(  U :TdSingle;
           V :TdSingle;                   );
     end;

     TdSinglePos2D = TdSingle2D;
     TdSingleVec2D = TdSingle2D;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdDouble2D

     TdDouble2D = record
     private
       ///// アクセス
       function GetV( const I_:Integer ) :TdDouble; inline;
       procedure SetV( const I_:Integer; const V_:TdDouble ); inline;
       function Geto :TDouble2D; inline;
       procedure Seto( const o_:TDouble2D ); inline;
       function Getd :TDouble2D; inline;
       procedure Setd( const d_:TDouble2D ); inline;
       function GetSiz2 :TdDouble; inline;
       procedure SetSiz2( const Siz2_:TdDouble ); inline;
       function GetSize :TdDouble; inline;
       procedure SetSize( const Size_:TdDouble ); inline;
       function GetUnitor :TdDouble2D; inline;
       procedure SetUnitor( const Unitor_:TdDouble2D ); inline;
     public
       constructor Create( const X_,Y_:TdDouble );
       ///// プロパティ
       property _s[ const I_:Integer ] :TdDouble   read GetV      write SetV     ; default;
       property o                      :TDouble2D  read Geto      write Seto     ;
       property d                      :TDouble2D  read Getd      write Setd     ;
       property Siz2                   :TdDouble   read GetSiz2   write SetSiz2  ;
       property Size                   :TdDouble   read GetSize   write SetSize  ;
       property Unitor                 :TdDouble2D read GetUnitor write SetUnitor;
       ///// 演算子
       class operator Negative( const V_:TdDouble2D ) :TdDouble2D; inline;
       class operator Positive( const V_:TdDouble2D ) :TdDouble2D; inline;
       class operator Add( const A_,B_:TdDouble2D ) :TdDouble2D; inline;
       class operator Subtract( const A_,B_:TdDouble2D ) :TdDouble2D; inline;
       class operator Multiply( const A_:TdDouble2D; const B_:TdDouble ) :TdDouble2D; inline;
       class operator Multiply( const A_:TdDouble; const B_:TdDouble2D ) :TdDouble2D; inline;
       class operator Divide( const A_:TdDouble2D; const B_:TdDouble ) :TdDouble2D; inline;
       ///// 型変換
       class operator Implicit( const P_:TPointF ) :TdDouble2D; inline;
       class operator Explicit( const P_:TdDouble2D ) :TPointF; inline;
       class operator Implicit( const P_:TDouble2D ) :TdDouble2D; inline;
       class operator Explicit( const P_:TdDouble2D ) :TDouble2D; inline;
     case Byte of
      0:( _  :array [ 1..2 ] of TdDouble; );
      1:(  X :TdDouble;
           Y :TdDouble;                   );
      2:( _1 :TdDouble;
          _2 :TdDouble;                   );
      3:(  U :TdDouble;
           V :TdDouble;                   );
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

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleArea2D

     TSingleArea2D = record
     private
       ///// アクセス
       function GetPoin( const I_:Integer ) :TSingle2D;
       function GetSizeX :Single;
       procedure SetSizeX( const SizeX_:Single );
       function GetSizeY :Single;
       procedure SetSizeY( const SizeY_:Single );
       function GetProjX :TSingleArea;
       procedure SetProjX( const ProjX_:TSingleArea );
       function GetProjY :TSingleArea;
       procedure SetProjY( const ProjY_:TSingleArea );
     public
       Min :TSingle2D;
       Max :TSingle2D;
       /////
       constructor Create( const Min_,Max_:Single ); overload;
       constructor Create( const MinX_,MinY_,
                                 MaxX_,MaxY_:Single ); overload;
       constructor Create( const Min_,Max_:TSingle2D ); overload;
       ///// プロパティ
       property Poin[ const I_:Integer ] :TSingle2D   read GetPoin                ;
       property SizeX                    :Single      read GetSizeX write SetSizeX;
       property SizeY                    :Single      read GetSizeY write SetSizeY;
       property ProjX                    :TSingleArea read GetProjX write SetProjX;
       property ProjY                    :TSingleArea read GetProjY write SetProjY;
       ///// 定数
       class function NeInf :TSingleArea2D; inline; static;
       class function NeMax :TSingleArea2D; inline; static;
       class function Zero  :TSingleArea2D; inline; static;
       class function PoMax :TSingleArea2D; inline; static;
       class function PoInf :TSingleArea2D; inline; static;
       ///// メソッド
       function Collision( const Area_:TSingleArea2D ) :Boolean;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleArea2D

     TDoubleArea2D = record
     private
       ///// アクセス
       function GetPoin( const I_:Integer ) :TDouble2D;
       function GetSizeX :Double;
       procedure SetSizeX( const SizeX_:Double );
       function GetSizeY :Double;
       procedure SetSizeY( const SizeY_:Double );
       function GetProjX :TDoubleArea;
       procedure SetProjX( const ProjX_:TDoubleArea );
       function GetProjY :TDoubleArea;
       procedure SetProjY( const ProjY_:TDoubleArea );
     public
       Min :TDouble2D;
       Max :TDouble2D;
       /////
       constructor Create( const Min_,Max_:Double ); overload;
       constructor Create( const MinX_,MinY_,
                                 MaxX_,MaxY_:Double ); overload;
       constructor Create( const Min_,Max_:TDouble2D ); overload;
       ///// プロパティ
       property Poin[ const I_:Integer ] :TDouble2D   read GetPoin                ;
       property SizeX                    :Double      read GetSizeX write SetSizeX;
       property SizeY                    :Double      read GetSizeY write SetSizeY;
       property ProjX                    :TDoubleArea read GetProjX write SetProjX;
       property ProjY                    :TDoubleArea read GetProjY write SetProjY;
       ///// 定数
       class function NeInf :TDoubleArea2D; inline; static;
       class function NeMax :TDoubleArea2D; inline; static;
       class function Zero  :TDoubleArea2D; inline; static;
       class function PoMax :TDoubleArea2D; inline; static;
       class function PoInf :TDoubleArea2D; inline; static;
       ///// メソッド
       function Collision( const Area_:TDoubleArea2D ) :Boolean;
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function DotProduct( const A_,B_:TSingleVec2D ) :Single; inline; overload;
function DotProduct( const A_,B_:TDoubleVec2D ) :Double; inline; overload;

function DotProduct( const A_,B_:TdSingleVec2D ) :TdSingle; inline; overload;
function DotProduct( const A_,B_:TdDoubleVec2D ) :TdDouble; inline; overload;

function CrossProduct( const A_,B_:TSingle2D ) :Single; overload;
function CrossProduct( const A_,B_:TDouble2D ) :Double; overload;

function CrossProduct( const A_,B_:TdSingle2D ) :TdSingle; overload;
function CrossProduct( const A_,B_:TdDouble2D ) :TdDouble; overload;

function Distanc2( const A_,B_:TSinglePos2D ) :Single; inline; overload;
function Distanc2( const A_,B_:TDoublePos2D ) :Double; inline; overload;

function Distance( const A_,B_:TSinglePos2D ) :Single; inline; overload;
function Distance( const A_,B_:TDoublePos2D ) :Double; inline; overload;

function Distanc2( const A_,B_:TdSinglePos2D ) :TdSingle; inline; overload;
function Distanc2( const A_,B_:TdDoublePos2D ) :TdDouble; inline; overload;

function Distance( const A_,B_:TdSinglePos2D ) :TdSingle; inline; overload;
function Distance( const A_,B_:TdDoublePos2D ) :TdDouble; inline; overload;

function Ave( const P1_,P2_:TSingle2D ) :TSingle2D; inline; overload;
function Ave( const P1_,P2_:TDouble2D ) :TDouble2D; inline; overload;

function Ave( const P1_,P2_:TdSingle2D ) :TdSingle2D; inline; overload;
function Ave( const P1_,P2_:TdDouble2D ) :TdDouble2D; inline; overload;

function Ave( const P1_,P2_,P3_:TSingle2D ) :TSingle2D; inline; overload;
function Ave( const P1_,P2_,P3_:TDouble2D ) :TDouble2D; inline; overload;

function Ave( const P1_,P2_,P3_:TdSingle2D ) :TdSingle2D; inline; overload;
function Ave( const P1_,P2_,P3_:TdDouble2D ) :TdDouble2D; inline; overload;

function DotAngle( const V0_,V1_:TSingle2D ) :Single; overload;
function DotAngle( const V0_,V1_:TDouble2D ) :Double; overload;

function RotAngle( const V0_,V1_:TSingle2D ) :Single; overload;
function RotAngle( const V0_,V1_:TDouble2D ) :Double; overload;

function PolySolveReal( const Ks_:TSingle2D; out X1_:Single ) :Byte; overload;
function PolySolveReal( const Ks_:TDouble2D; out X1_:Double ) :Byte; overload;

implementation //############################################################### ■

uses System.SysUtils, System.Math;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TByte2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TByte2D.GetV( const I_:Integer ) :Byte;
begin
     Result := _[ I_ ];
end;

procedure TByte2D.SetV( const I_:Integer; const V_:Byte );
begin
     _[ I_ ] := V_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TByte2D.Create( const V_:Byte );
begin
     X := V_;
     Y := V_;
end;

constructor TByte2D.Create( const X_,Y_:Byte );
begin
     X := X_;
     Y := Y_;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TShortint2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TShortint2D.Create( const V_:Shortint );
begin
     X := V_;
     Y := V_;
end;

constructor TShortint2D.Create( const X_,Y_:Shortint );
begin
     X := X_;
     Y := Y_;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TWord2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TWord2D.Create( const V_:Word );
begin
     X := V_;
     Y := V_;
end;

constructor TWord2D.Create( const X_,Y_:Word );
begin
     X := X_;
     Y := Y_;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSmallint2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TSmallint2D.Create( const V_:Smallint );
begin
     X := V_;
     Y := V_;
end;

constructor TSmallint2D.Create( const X_,Y_:Smallint );
begin
     X := X_;
     Y := Y_;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TCardinal2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TCardinal2D.Create( const V_:Cardinal );
begin
     X := V_;
     Y := V_;
end;

constructor TCardinal2D.Create( const X_,Y_:Cardinal );
begin
     X := X_;
     Y := Y_;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TInteger2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TInteger2D.GetV( const I_:Integer ) :Integer;
begin
     Result := _[ I_ ];
end;

procedure TInteger2D.SetV( const I_:Integer; const V_:Integer );
begin
     _[ I_ ] := V_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingle2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TSingle2D.GetV( const I_:Integer ) :Single;
begin
     Result := _[ I_ ];
end;

procedure TSingle2D.SetV( const I_:Integer; const V_:Single );
begin
     _[ I_ ] := V_;
end;

//------------------------------------------------------------------------------

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

//------------------------------------------------------------------------------

function TSingle2D.GetOrthant :Byte;
begin
     Result := 0;
     if X >= 0 then Result := Result or 1;
     if Y >= 0 then Result := Result or 2;
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
          X := V_.X;
          Y := V_.Y;
     end;
end;

class operator TSingle2D.Implicit( const V_:TSingle2D ) :TPointF;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
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

/////////////////////////////////////////////////////////////////////// メソッド

function TSingle2D.VectorTo( const P_:TSingle2D ) :TSingle2D;
begin
     Result := P_ - Self;
end;

function TSingle2D.UnitorTo( const P_:TSingle2D ) :TSingle2D;
begin
     Result := VectorTo( P_ ).Unitor;
end;

function TSingle2D.DistanTo( const P_:TSingle2D ) :Single;
begin
     Result := VectorTo( P_ ).Size;
end;

//------------------------------------------------------------------------------

function TSingle2D.RotL90 :TSingle2D;
begin
     Result.X := -Y;
     Result.Y := +X;
end;

function TSingle2D.RotR90 :TSingle2D;
begin
     Result.X := +Y;
     Result.Y := -X;
end;

//------------------------------------------------------------------------------

function TSingle2D.RotAngleTo( const V_:TSingle2D ) :Single;
begin
     Result := ArcTan2( X * V_.Y - Y * V_.X,
                        X * V_.X + Y * V_.Y );
end;

//------------------------------------------------------------------------------

class function TSingle2D.RandG :TSingle2D;
begin
     with Result do
     begin
          X := System.Math.RandG( 0, 1 );
          Y := System.Math.RandG( 0, 1 );
     end;
end;

//------------------------------------------------------------------------------

class function TSingle2D.RandBS1 :TSingle2D;
begin
     with Result do
     begin
          X := TSingle.RandBS1;
          Y := TSingle.RandBS1;
     end;
end;

class function TSingle2D.RandBS2 :TSingle2D;
begin
     with Result do
     begin
          X := TSingle.RandBS2;
          Y := TSingle.RandBS2;
     end;
end;

class function TSingle2D.RandBS4 :TSingle2D;
begin
     with Result do
     begin
          X := TSingle.RandBS4;
          Y := TSingle.RandBS4;
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDouble2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TDouble2D.GetV( const I_:Integer ) :Double;
begin
     Result := _[ I_ ];
end;

procedure TDouble2D.SetV( const I_:Integer; const V_:Double );
begin
     _[ I_ ] := V_;
end;

//------------------------------------------------------------------------------

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

//------------------------------------------------------------------------------

function TDouble2D.GetOrthant :Byte;
begin
     Result := 0;
     if X >= 0 then Result := Result or 1;
     if Y >= 0 then Result := Result or 2;
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
          X := V_.X;
          Y := V_.Y;
     end;
end;

class operator TDouble2D.Explicit( const V_:TDouble2D ) :TPointF;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
     end;
end;

//------------------------------------------------------------------------------

class operator TDouble2D.Implicit( const V_:TSingle2D ) :TDouble2D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
     end;
end;

class operator TDouble2D.Explicit( const V_:TDouble2D ) :TSingle2D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
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

/////////////////////////////////////////////////////////////////////// メソッド

function TDouble2D.VectorTo( const P_:TDouble2D ) :TDouble2D;
begin
     Result := P_ - Self;
end;

function TDouble2D.UnitorTo( const P_:TDouble2D ) :TDouble2D;
begin
     Result := VectorTo( P_ ).Unitor;
end;

function TDouble2D.DistanTo( const P_:TDouble2D ) :Double;
begin
     Result := VectorTo( P_ ).Size;
end;

//------------------------------------------------------------------------------

function TDouble2D.RotL90 :TDouble2D;
begin
     Result.X := -Y;
     Result.Y := +X;
end;

function TDouble2D.RotR90 :TDouble2D;
begin
     Result.X := +Y;
     Result.Y := -X;
end;

//------------------------------------------------------------------------------

function TDouble2D.RotAngleTo( const V_:TDouble2D ) :Double;
begin
     Result := ArcTan2( X * V_.Y - Y * V_.X,
                        X * V_.X + Y * V_.Y );
end;

//------------------------------------------------------------------------------

class function TDouble2D.RandG :TDouble2D;
begin
     with Result do
     begin
          X := System.Math.RandG( 0, 1 );
          Y := System.Math.RandG( 0, 1 );
     end;
end;

//------------------------------------------------------------------------------

class function TDouble2D.RandBS1 :TDouble2D;
begin
     with Result do
     begin
          X := TSingle.RandBS1;
          Y := TSingle.RandBS1;
     end;
end;

class function TDouble2D.RandBS2 :TDouble2D;
begin
     with Result do
     begin
          X := TSingle.RandBS2;
          Y := TSingle.RandBS2;
     end;
end;

class function TDouble2D.RandBS4 :TDouble2D;
begin
     with Result do
     begin
          X := TSingle.RandBS4;
          Y := TSingle.RandBS4;
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdSingle2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TdSingle2D.GetV( const I_:Integer ) :TdSingle;
begin
     Result := _[ I_ ];
end;

procedure TdSingle2D.SetV( const I_:Integer; const V_:TdSingle );
begin
     _[ I_ ] := V_;
end;

//------------------------------------------------------------------------------

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

function TdSingle2D.GetSiz2 :TdSingle;
begin
     Result := Pow2( X ) + Pow2( Y );
end;

procedure TdSingle2D.SetSiz2( const Siz2_:TdSingle );
begin
     Self := Roo2( Siz2_ / Siz2 ) * Self;
end;

function TdSingle2D.GetSize :TdSingle;
begin
     Result := Roo2( Siz2 );
end;

procedure TdSingle2D.SetSize( const Size_:TdSingle );
begin
     Self := Size_ * Unitor;
end;

function TdSingle2D.GetUnitor :TdSingle2D;
begin
     Result := Self / Size;
end;

procedure TdSingle2D.SetUnitor( const Unitor_:TdSingle2D );
begin
     Self := Size * Unitor_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TdSingle2D.Create( const X_,Y_:TdSingle );
begin
     X := X_;
     Y := Y_;
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TdSingle2D.Negative( const V_:TdSingle2D ) :TdSingle2D;
begin
     with Result do
     begin
          X := -V_.X;
          Y := -V_.Y;
     end;
end;

class operator TdSingle2D.Positive( const V_:TdSingle2D ) :TdSingle2D;
begin
     with Result do
     begin
          X := +V_.X;
          Y := +V_.Y;
     end;
end;

class operator TdSingle2D.Add( const A_,B_:TdSingle2D ) :TdSingle2D;
begin
     with Result do
     begin
          X := A_.X + B_.X;
          Y := A_.Y + B_.Y;
     end;
end;

class operator TdSingle2D.Subtract( const A_,B_:TdSingle2D ) :TdSingle2D;
begin
     with Result do
     begin
          X := A_.X - B_.X;
          Y := A_.Y - B_.Y;
     end;
end;

class operator TdSingle2D.Multiply( const A_:TdSingle2D; const B_:TdSingle ) :TdSingle2D;
begin
     with Result do
     begin
          X := A_.X * B_;
          Y := A_.Y * B_;
     end;
end;

class operator TdSingle2D.Multiply( const A_:TdSingle; const B_:TdSingle2D ) :TdSingle2D;
begin
     with Result do
     begin
          X := A_ * B_.X;
          Y := A_ * B_.Y;
     end;
end;

class operator TdSingle2D.Divide( const A_:TdSingle2D; const B_:TdSingle ) :TdSingle2D;
begin
     with Result do
     begin
          X := A_.X / B_;
          Y := A_.Y / B_;
     end;
end;

///////////////////////////////////////////////////////////////////////// 型変換

class operator TdSingle2D.Implicit( const P_:TPointF ) :TdSingle2D;
begin
     with Result do
     begin
          X := +P_.X;
          Y := -P_.Y;
     end;
end;

class operator TdSingle2D.Explicit( const P_:TdSingle2D ) :TPointF;
begin
     with Result do
     begin
          X := +P_.X.o;
          Y := -P_.Y.o;
     end;
end;

class operator TdSingle2D.Implicit( const P_:TSingle2D ) :TdSingle2D;
begin
     with Result do
     begin
          X := P_.X;
          Y := P_.Y;
     end;
end;

class operator TdSingle2D.Explicit( const P_:TdSingle2D ) :TSingle2D;
begin
     with Result do
     begin
          X := P_.X.o;
          Y := P_.Y.o;
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdDouble2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TdDouble2D.GetV( const I_:Integer ) :TdDouble;
begin
     Result := _[ I_ ];
end;

procedure TdDouble2D.SetV( const I_:Integer; const V_:TdDouble );
begin
     _[ I_ ] := V_;
end;

//------------------------------------------------------------------------------

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

function TdDouble2D.GetSiz2 :TdDouble;
begin
     Result := Pow2( X ) + Pow2( Y );
end;

procedure TdDouble2D.SetSiz2( const Siz2_:TdDouble );
begin
     Self := Roo2( Siz2_ / Siz2 ) * Self;
end;

function TdDouble2D.GetSize :TdDouble;
begin
     Result := Roo2( Siz2 );
end;

procedure TdDouble2D.SetSize( const Size_:TdDouble );
begin
     Self := Size_ * Unitor;
end;

function TdDouble2D.GetUnitor :TdDouble2D;
begin
     Result := Self / Size;
end;

procedure TdDouble2D.SetUnitor( const Unitor_:TdDouble2D );
begin
     Self := Size * Unitor_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TdDouble2D.Create( const X_,Y_:TdDouble );
begin
     X := X_;
     Y := Y_;
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TdDouble2D.Negative( const V_:TdDouble2D ) :TdDouble2D;
begin
     with Result do
     begin
          X := -V_.X;
          Y := -V_.Y;
     end;
end;

class operator TdDouble2D.Positive( const V_:TdDouble2D ) :TdDouble2D;
begin
     with Result do
     begin
          X := +V_.X;
          Y := +V_.Y;
     end;
end;

class operator TdDouble2D.Add( const A_,B_:TdDouble2D ) :TdDouble2D;
begin
     with Result do
     begin
          X := A_.X + B_.X;
          Y := A_.Y + B_.Y;
     end;
end;

class operator TdDouble2D.Subtract( const A_,B_:TdDouble2D ) :TdDouble2D;
begin
     with Result do
     begin
          X := A_.X - B_.X;
          Y := A_.Y - B_.Y;
     end;
end;

class operator TdDouble2D.Multiply( const A_:TdDouble2D; const B_:TdDouble ) :TdDouble2D;
begin
     with Result do
     begin
          X := A_.X * B_;
          Y := A_.Y * B_;
     end;
end;

class operator TdDouble2D.Multiply( const A_:TdDouble; const B_:TdDouble2D ) :TdDouble2D;
begin
     with Result do
     begin
          X := A_ * B_.X;
          Y := A_ * B_.Y;
     end;
end;

class operator TdDouble2D.Divide( const A_:TdDouble2D; const B_:TdDouble ) :TdDouble2D;
begin
     with Result do
     begin
          X := A_.X / B_;
          Y := A_.Y / B_;
     end;
end;

///////////////////////////////////////////////////////////////////////// 型変換

class operator TdDouble2D.Implicit( const P_:TPointF ) :TdDouble2D;
begin
     with Result do
     begin
          X := +P_.X;
          Y := -P_.Y;
     end;
end;

class operator TdDouble2D.Explicit( const P_:TdDouble2D ) :TPointF;
begin
     with Result do
     begin
          X := +P_.X.o;
          Y := -P_.Y.o;
     end;
end;

class operator TdDouble2D.Implicit( const P_:TDouble2D ) :TdDouble2D;
begin
     with Result do
     begin
          X := P_.X;
          Y := P_.Y;
     end;
end;

class operator TdDouble2D.Explicit( const P_:TdDouble2D ) :TDouble2D;
begin
     with Result do
     begin
          X := P_.X.o;
          Y := P_.Y.o;
     end;
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

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleArea2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TSingleArea2D.GetPoin( const I_:Integer ) :TSingle2D;
begin
     case I_ of
       0: Result := TSingle2D.Create( Min.X, Min.Y );
       1: Result := TSingle2D.Create( Max.X, Min.Y );
       2: Result := TSingle2D.Create( Min.X, Max.Y );
       3: Result := TSingle2D.Create( Max.X, Max.Y );
     end;
end;

//------------------------------------------------------------------------------

function TSingleArea2D.GetSizeX :Single;
begin
     Result := Max.X - Min.X;
end;

procedure TSingleArea2D.SetSizeX( const SizeX_:Single );
var
   C, S :Single;
begin
     C := ( Min.X + Max.X ) / 2;

     S := SizeX_ / 2;

     Min.X := C - S;
     Max.X := C + S;
end;

function TSingleArea2D.GetSizeY :Single;
begin
     Result := Max.Y - Min.Y;
end;

procedure TSingleArea2D.SetSizeY( const SizeY_:Single );
var
   C, S :Single;
begin
     C := ( Min.Y + Max.Y ) / 2;

     S := SizeY_ / 2;

     Min.Y := C - S;
     Max.Y := C + S;
end;

//------------------------------------------------------------------------------

function TSingleArea2D.GetProjX :TSingleArea;
begin
     Result := TSingleArea.Create( Min.X, Max.X );
end;

procedure TSingleArea2D.SetProjX( const ProjX_:TSingleArea );
begin
     Min.X := ProjX_.Min;
     Max.X := ProjX_.Max;
end;

function TSingleArea2D.GetProjY :TSingleArea;
begin
     Result := TSingleArea.Create( Min.Y, Max.Y );
end;

procedure TSingleArea2D.SetProjY( const ProjY_:TSingleArea );
begin
     Min.Y := ProjY_.Min;
     Max.Y := ProjY_.Max;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TSingleArea2D.Create( const Min_,Max_:Single );
begin
     Create( Min_, Min_,
             Max_, Max_ );
end;

constructor TSingleArea2D.Create( const MinX_,MinY_,
                                        MaxX_,MaxY_:Single );
begin
     with Min do
     begin
          X := MinX_;
          Y := MinY_;
     end;

     with Max do
     begin
          X := MaxX_;
          Y := MaxY_;
     end;
end;

constructor TSingleArea2D.Create( const Min_,Max_:TSingle2D );
begin
     Min := Min_;
     Max := Max_;
end;

/////////////////////////////////////////////////////////////////////////// 定数

class function TSingleArea2D.NeInf :TSingleArea2D;
begin
     Result := TSingleArea2D.Create( Single.PositiveInfinity,
                                     Single.NegativeInfinity );
end;

class function TSingleArea2D.NeMax :TSingleArea2D;
begin
     Result := TSingleArea2D.Create( +Single.MaxValue,
                                     -Single.MaxValue );
end;

class function TSingleArea2D.Zero :TSingleArea2D;
begin
     Result := TSingleArea2D.Create( 0, 0 );
end;

class function TSingleArea2D.PoMax :TSingleArea2D;
begin
     Result := TSingleArea2D.Create( -Single.MaxValue,
                                     +Single.MaxValue );
end;

class function TSingleArea2D.PoInf :TSingleArea2D;
begin
     Result := TSingleArea2D.Create( Single.NegativeInfinity,
                                     Single.PositiveInfinity );
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TSingleArea2D.Collision( const Area_:TSingleArea2D ) :Boolean;
begin
     Result := ProjX.Collision( Area_.ProjX )
           and ProjY.Collision( Area_.ProjY );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleArea2D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TDoubleArea2D.GetPoin( const I_:Integer ) :TDouble2D;
begin
     case I_ of
       0: Result := TDouble2D.Create( Min.X, Min.Y );
       1: Result := TDouble2D.Create( Max.X, Min.Y );
       2: Result := TDouble2D.Create( Min.X, Max.Y );
       3: Result := TDouble2D.Create( Max.X, Max.Y );
     end;
end;

//------------------------------------------------------------------------------

function TDoubleArea2D.GetSizeX :Double;
begin
     Result := Max.X - Min.X;
end;

procedure TDoubleArea2D.SetSizeX( const SizeX_:Double );
var
   C, S :Double;
begin
     C := ( Min.X + Max.X ) / 2;

     S := SizeX_ / 2;

     Min.X := C - S;
     Max.X := C + S;
end;

function TDoubleArea2D.GetSizeY :Double;
begin
     Result := Max.Y - Min.Y;
end;

procedure TDoubleArea2D.SetSizeY( const SizeY_:Double );
var
   C, S :Double;
begin
     C := ( Min.Y + Max.Y ) / 2;

     S := SizeY_ / 2;

     Min.Y := C - S;
     Max.Y := C + S;
end;

//------------------------------------------------------------------------------

function TDoubleArea2D.GetProjX :TDoubleArea;
begin
     Result := TDoubleArea.Create( Min.X, Max.X );
end;

procedure TDoubleArea2D.SetProjX( const ProjX_:TDoubleArea );
begin
     Min.X := ProjX_.Min;
     Max.X := ProjX_.Max;
end;

function TDoubleArea2D.GetProjY :TDoubleArea;
begin
     Result := TDoubleArea.Create( Min.Y, Max.Y );
end;

procedure TDoubleArea2D.SetProjY( const ProjY_:TDoubleArea );
begin
     Min.Y := ProjY_.Min;
     Max.Y := ProjY_.Max;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TDoubleArea2D.Create( const Min_,Max_:Double );
begin
     Create( Min_, Min_,
             Max_, Max_ );
end;

constructor TDoubleArea2D.Create( const MinX_,MinY_,
                                        MaxX_,MaxY_:Double );
begin
     with Min do
     begin
          X := MinX_;
          Y := MinY_;
     end;

     with Max do
     begin
          X := MaxX_;
          Y := MaxY_;
     end;
end;

constructor TDoubleArea2D.Create( const Min_,Max_:TDouble2D );
begin
     Min := Min_;
     Max := Max_;
end;

/////////////////////////////////////////////////////////////////////////// 定数

class function TDoubleArea2D.NeInf :TDoubleArea2D;
begin
     Result := TDoubleArea2D.Create( Double.PositiveInfinity,
                                     Double.NegativeInfinity );
end;

class function TDoubleArea2D.NeMax :TDoubleArea2D;
begin
     Result := TDoubleArea2D.Create( +Double.MaxValue,
                                     -Double.MaxValue );
end;

class function TDoubleArea2D.Zero :TDoubleArea2D;
begin
     Result := TDoubleArea2D.Create( 0, 0 );
end;

class function TDoubleArea2D.PoMax :TDoubleArea2D;
begin
     Result := TDoubleArea2D.Create( -Double.MaxValue,
                                     +Double.MaxValue );
end;

class function TDoubleArea2D.PoInf :TDoubleArea2D;
begin
     Result := TDoubleArea2D.Create( Double.NegativeInfinity,
                                     Double.PositiveInfinity );
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TDoubleArea2D.Collision( const Area_:TDoubleArea2D ) :Boolean;
begin
     Result := ProjX.Collision( Area_.ProjX )
           and ProjY.Collision( Area_.ProjY );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function DotProduct( const A_,B_:TSingleVec2D ) :Single;
begin
     Result := A_.X * B_.X
             + A_.Y * B_.Y;
end;

function DotProduct( const A_,B_:TDoubleVec2D ) :Double;
begin
     Result := A_.X * B_.X
             + A_.Y * B_.Y;
end;

function DotProduct( const A_,B_:TdSingleVec2D ) :TdSingle;
begin
     Result := A_.X * B_.X
             + A_.Y * B_.Y;
end;

function DotProduct( const A_,B_:TdDoubleVec2D ) :TdDouble;
begin
     Result := A_.X * B_.X
             + A_.Y * B_.Y;
end;

//------------------------------------------------------------------------------

function CrossProduct( const A_,B_:TSingle2D ) :Single;
begin
     Result := A_.X * B_.Y - A_.Y * B_.X;
end;

function CrossProduct( const A_,B_:TDouble2D ) :Double;
begin
     Result := A_.X * B_.Y - A_.Y * B_.X;
end;

function CrossProduct( const A_,B_:TdSingle2D ) :TdSingle;
begin
     Result := A_.X * B_.Y - A_.Y * B_.X;
end;

function CrossProduct( const A_,B_:TdDouble2D ) :TdDouble;
begin
     Result := A_.X * B_.Y - A_.Y * B_.X;
end;

//------------------------------------------------------------------------------

function Distanc2( const A_,B_:TSinglePos2D ) :Single;
begin
     Result := Pow2( B_.X - A_.X ) + Pow2( B_.Y - A_.Y );
end;

function Distanc2( const A_,B_:TDoublePos2D ) :Double;
begin
     Result := Pow2( B_.X - A_.X ) + Pow2( B_.Y - A_.Y );
end;

function Distance( const A_,B_:TSinglePos2D ) :Single;
begin
     Result := Roo2( Distanc2( A_, B_ ) );
end;

function Distance( const A_,B_:TDoublePos2D ) :Double;
begin
     Result := Roo2( Distanc2( A_, B_ ) );
end;

function Distanc2( const A_,B_:TdSinglePos2D ) :TdSingle;
begin
     Result := Pow2( B_.X - A_.X ) + Pow2( B_.Y - A_.Y );
end;

function Distanc2( const A_,B_:TdDoublePos2D ) :TdDouble;
begin
     Result := Pow2( B_.X - A_.X ) + Pow2( B_.Y - A_.Y );
end;

function Distance( const A_,B_:TdSinglePos2D ) :TdSingle;
begin
     Result := Roo2( Distanc2( A_, B_ ) );
end;

function Distance( const A_,B_:TdDoublePos2D ) :TdDouble;
begin
     Result := Roo2( Distanc2( A_, B_ ) );
end;

//------------------------------------------------------------------------------

function Ave( const P1_,P2_:TSingle2D ) :TSingle2D;
begin
     Result := ( P1_ + P2_ ) / 2;
end;

function Ave( const P1_,P2_:TDouble2D ) :TDouble2D;
begin
     Result := ( P1_ + P2_ ) / 2;
end;

function Ave( const P1_,P2_:TdSingle2D ) :TdSingle2D;
begin
     Result := ( P1_ + P2_ ) / 2;
end;

function Ave( const P1_,P2_:TdDouble2D ) :TdDouble2D;
begin
     Result := ( P1_ + P2_ ) / 2;
end;

//------------------------------------------------------------------------------

function Ave( const P1_,P2_,P3_:TSingle2D ) :TSingle2D;
begin
     Result := ( P1_ + P2_ + P3_ ) / 3;
end;

function Ave( const P1_,P2_,P3_:TDouble2D ) :TDouble2D;
begin
     Result := ( P1_ + P2_ + P3_ ) / 3;
end;

function Ave( const P1_,P2_,P3_:TdSingle2D ) :TdSingle2D;
begin
     Result := ( P1_ + P2_ + P3_ ) / 3;
end;

function Ave( const P1_,P2_,P3_:TdDouble2D ) :TdDouble2D;
begin
     Result := ( P1_ + P2_ + P3_ ) / 3;
end;

//------------------------------------------------------------------------------

function DotAngle( const V0_,V1_:TSingle2D ) :Single;
begin
     Result := ArcCos( DotProduct( V0_, V1_ ) );
end;

function DotAngle( const V0_,V1_:TDouble2D ) :Double;
begin
     Result := ArcCos( DotProduct( V0_, V1_ ) );
end;

//------------------------------------------------------------------------------

function RotAngle( const V0_,V1_:TSingle2D ) :Single;
begin
     Result := ArcTan2( V0_.X * V1_.Y - V0_.Y * V1_.X,
                        V0_.X * V1_.X + V0_.Y * V1_.Y );
end;

function RotAngle( const V0_,V1_:TDouble2D ) :Double;
begin
     Result := ArcTan2( V0_.X * V1_.Y - V0_.Y * V1_.X,
                        V0_.X * V1_.X + V0_.Y * V1_.Y );
end;

//------------------------------------------------------------------------------

function PolySolveReal( const Ks_:TSingle2D; out X1_:Single ) :Byte;
begin
     with Ks_ do
     begin
          if _2 = 0 then Result := 0
          else
          begin
               X1_ := -_1 / _2;

               Result := 1;
          end;
     end;
end;

function PolySolveReal( const Ks_:TDouble2D; out X1_:Double ) :Byte;
begin
     with Ks_ do
     begin
          if _2 = 0 then Result := 0
          else
          begin
               X1_ := -_1 / _2;

               Result := 1;
          end;
     end;
end;

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
