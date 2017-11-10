unit LUX.D3;

interface //#################################################################### ■

uses System.Math, System.Math.Vectors,
     LUX, LUX.D1, LUX.D2;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% T1Bit3D

     T1Bit3D = record
     private
       ///// アクセス
       function Get_( const I_:Byte ) :Byte;
       procedure Set_( const I_:Byte; const o_:Byte );
       function GetX :Byte;
       procedure SetX( const X_:Byte );
       function GetY :Byte;
       procedure SetY( const Y_:Byte );
       function GetZ :Byte;
       procedure SetZ( const Z_:Byte );
     public
       o :Byte;
       constructor Create( const V_:Byte ); overload;
       constructor Create( const X_,Y_,Z_:Byte ); overload;
       ///// プロパティ
       property _[ const I_:Byte ] :Byte read Get_ write Set_;
       property  X                 :Byte read GetX write SetX;
       property  Y                 :Byte read GetY write SetY;
       property  Z                 :Byte read GetZ write SetZ;
       property _1                 :Byte read GetX write SetX;
       property _2                 :Byte read GetY write SetY;
       property _3                 :Byte read GetZ write SetZ;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TByte3D

     TByte3D = record
     private
     public
       constructor Create( const V_:Byte ); overload;
       constructor Create( const X_,Y_,Z_:Byte ); overload;
     case Byte of
      0:( _ :array [ 1..3 ] of Byte; );
      1:(  X :Byte;
           Y :Byte;
           Z :Byte;                  );
      2:( _1 :Byte;
          _2 :Byte;
          _3 :Byte;                  );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TShortint3D

     TShortint3D = record
     private
     public
       constructor Create( const V_:Shortint ); overload;
       constructor Create( const X_,Y_,Z_:Shortint ); overload;
     case Byte of
      0:( _ :array [ 1..3 ] of Shortint; );
      1:(  X :Shortint;
           Y :Shortint;
           Z :Shortint;                  );
      2:( _1 :Shortint;
          _2 :Shortint;
          _3 :Shortint;                  );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TWord3D

     TWord3D = record
     private
     public
       constructor Create( const V_:Word ); overload;
       constructor Create( const X_,Y_,Z_:Word ); overload;
     case Byte of
      0:( _ :array [ 1..3 ] of Word; );
      1:(  X :Word;
           Y :Word;
           Z :Word;                  );
      2:( _1 :Word;
          _2 :Word;
          _3 :Word;                  );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSmallint3D

     TSmallint3D = record
     private
     public
       constructor Create( const V_:Smallint ); overload;
       constructor Create( const X_,Y_,Z_:Smallint ); overload;
     case Byte of
      0:( _ :array [ 1..3 ] of Smallint; );
      1:(  X :Smallint;
           Y :Smallint;
           Z :Smallint;                  );
      2:( _1 :Smallint;
          _2 :Smallint;
          _3 :Smallint;                  );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TCardinal3D

     TCardinal3D = record
     private
       ///// アクセス
       function GetLSB :T1Bit3D;
       function GetMSB :T1Bit3D;
     public
       constructor Create( const V_:Cardinal ); overload;
       constructor Create( const X_,Y_,Z_:Cardinal ); overload;
       ///// プロパティ
       property LSB :T1Bit3D read GetLSB;
       property MSB :T1Bit3D read GetMSB;
       ///// 演算子
       class operator Negative( const V_:TCardinal3D ) :TCardinal3D; inline;
       class operator Positive( const V_:TCardinal3D ) :TCardinal3D; inline;
       class operator Add( const A_,B_:TCardinal3D ) :TCardinal3D; inline;
       class operator Subtract( const A_,B_:TCardinal3D ) :TCardinal3D; inline;
       class operator Multiply( const A_:TCardinal3D; const B_:Cardinal ) :TCardinal3D; inline;
       class operator Multiply( const A_:Cardinal; const B_:TCardinal3D ) :TCardinal3D; inline;
       class operator IntDivide( const A_:TCardinal3D; const B_:Cardinal ) :TCardinal3D; inline;
       class operator Modulus( const A_:TCardinal3D; const B_:Cardinal ) :TCardinal3D; inline;
       class operator LeftShift( const A_:TCardinal3D; const B_:Integer ) :TCardinal3D; inline;
       class operator RightShift( const A_:TCardinal3D; const B_:Integer ) :TCardinal3D; inline;
       class operator Equal( const A_,B_:TCardinal3D ) :Boolean; inline;
       class operator NotEqual( const A_,B_:TCardinal3D ) :Boolean; inline;
       class operator BitwiseAnd( const A_:TCardinal3D; const B_:Cardinal ) :TCardinal3D; inline;
       class operator BitwiseOr( const A_:TCardinal3D; const B_:Cardinal ) :TCardinal3D; inline;
       class operator BitwiseXor( const A_:TCardinal3D; const B_:Cardinal ) :TCardinal3D; inline;
       ///// 型変換
       class operator Explicit( const V_:TCardinal3D ) :TByte3D; inline;
       class operator Explicit( const V_:TByte3D ) :TCardinal3D; inline;
       class operator Explicit( const V_:TCardinal3D ) :TShortint3D; inline;
       class operator Explicit( const V_:TShortint3D ) :TCardinal3D; inline;
       class operator Explicit( const V_:TCardinal3D ) :TWord3D; inline;
       class operator Explicit( const V_:TWord3D ) :TCardinal3D; inline;
       class operator Explicit( const V_:TCardinal3D ) :TSmallint3D; inline;
       class operator Explicit( const V_:TSmallint3D ) :TCardinal3D; inline;
     case Byte of
      0:( _ :array [ 1..3 ] of Cardinal; );
      1:(  X :Cardinal;
           Y :Cardinal;
           Z :Cardinal;                  );
      2:( _1 :Cardinal;
          _2 :Cardinal;
          _3 :Cardinal;                  );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TInteger3D

     TInteger3D = record
     private
       ///// アクセス
       function GetLSB :T1Bit3D;
       function GetMSB :T1Bit3D;
     public
       constructor Create( const V_:Integer ); overload;
       constructor Create( const X_,Y_,Z_:Integer ); overload;
       ///// プロパティ
       property LSB :T1Bit3D read GetLSB;
       property MSB :T1Bit3D read GetMSB;
       ///// 演算子
       class operator Negative( const V_:TInteger3D ) :TInteger3D; inline;
       class operator Positive( const V_:TInteger3D ) :TInteger3D; inline;
       class operator Add( const A_,B_:TInteger3D ) :TInteger3D; inline;
       class operator Subtract( const A_,B_:TInteger3D ) :TInteger3D; inline;
       class operator Multiply( const A_:TInteger3D; const B_:Integer ) :TInteger3D; inline;
       class operator Multiply( const A_:Integer; const B_:TInteger3D ) :TInteger3D; inline;
       class operator IntDivide( const A_:TInteger3D; const B_:Integer ) :TInteger3D; inline;
       class operator Modulus( const A_:TInteger3D; const B_:Integer ) :TInteger3D; inline;
       class operator LeftShift( const A_:TInteger3D; const B_:Integer ) :TInteger3D; inline;
       class operator RightShift( const A_:TInteger3D; const B_:Integer ) :TInteger3D; inline;
       class operator Equal( const A_,B_:TInteger3D ) :Boolean; inline;
       class operator NotEqual( const A_,B_:TInteger3D ) :Boolean; inline;
       class operator BitwiseAnd( const A_:TInteger3D; const B_:Integer ) :TInteger3D; inline;
       class operator BitwiseOr( const A_:TInteger3D; const B_:Integer ) :TInteger3D; inline;
       class operator BitwiseXor( const A_:TInteger3D; const B_:Integer ) :TInteger3D; inline;
       ///// 型変換
       class operator Explicit( const V_:TInteger3D ) :TByte3D; inline;
       class operator Explicit( const V_:TByte3D ) :TInteger3D; inline;
       class operator Explicit( const V_:TInteger3D ) :TShortint3D; inline;
       class operator Explicit( const V_:TShortint3D ) :TInteger3D; inline;
       class operator Explicit( const V_:TInteger3D ) :TWord3D; inline;
       class operator Explicit( const V_:TWord3D ) :TInteger3D; inline;
       class operator Explicit( const V_:TInteger3D ) :TSmallint3D; inline;
       class operator Explicit( const V_:TSmallint3D ) :TInteger3D; inline;
     case Byte of
      0:( _ :array [ 1..3 ] of Integer; );
      1:(  X :Integer;
           Y :Integer;
           Z :Integer;                  );
      2:( _1 :Integer;
          _2 :Integer;
          _3 :Integer;                  );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingle3D

     TSingle3D = record
     private
       ///// アクセス
       function GetV( const I_:Integer ) :Single; inline;
       procedure SetV( const I_:Integer; const V_:Single ); inline;
       function GetSiz2 :Single; inline;
       procedure SetSiz2( const Siz2_:Single ); inline;
       function GetSize :Single; inline;
       procedure SetSize( const Size_:Single ); inline;
       function GetUnitor :TSingle3D; inline;
       procedure SetUnitor( const Unitor_:TSingle3D ); inline;
       function GetOrthant :Byte;
       function GetProjXY :TSingle2D; inline;
       procedure SetProjXY( const ProjXY_:TSingle2D ); inline;
       function GetProjYZ :TSingle2D; inline;
       procedure SetProjYZ( const ProjYZ_:TSingle2D ); inline;
       function GetProjZX :TSingle2D; inline;
       procedure SetProjZX( const ProjZX_:TSingle2D ); inline;
     public
       constructor Create( const V_:Single ); overload;
       constructor Create( const X_,Y_,Z_:Single ); overload;
       ///// プロパティ
       property _s[ const I_:Integer ] :Single    read GetV       write SetV     ; default;
       property Siz2                   :Single    read GetSiz2    write SetSiz2  ;
       property Size                   :Single    read GetSize    write SetSize  ;
       property Unitor                 :TSingle3D read GetUnitor  write SetUnitor;
       property Orthant                :Byte      read GetOrthant                ;
       property ProjXY                 :TSingle2D read GetProjXY  write SetProjXY;
       property ProjYZ                 :TSingle2D read GetProjYZ  write SetProjYZ;
       property ProjZX                 :TSingle2D read GetProjZX  write SetProjZX;
       ///// 演算子
       class operator Negative( const V_:TSingle3D ) :TSingle3D; inline;
       class operator Positive( const V_:TSingle3D ) :TSingle3D; inline;
       class operator Add( const A_,B_:TSingle3D ) :TSingle3D; inline;
       class operator Subtract( const A_,B_:TSingle3D ) :TSingle3D; inline;
       class operator Multiply( const A_:TSingle3D; const B_:Single ) :TSingle3D; inline;
       class operator Multiply( const A_:Single; const B_:TSingle3D ) :TSingle3D; inline;
       class operator Divide( const A_:TSingle3D; const B_:Single ) :TSingle3D; inline;
       ///// 型変換
       class operator Implicit( const V_:TSingle2D ) :TSingle3D; inline;
       class operator Explicit( const V_:TSingle3D ) :TSingle2D; inline;
       class operator Implicit( const V_:TPoint3D ) :TSingle3D; inline;
       class operator Implicit( const V_:TSingle3D ) :TPoint3D; inline;
       class operator Implicit( const V_:TVector3D ) :TSingle3D; inline;
       class operator Implicit( const V_:TSingle3D ) :TVector3D; inline;
       ///// 定数
       class function IdentityX :TSingle3D; inline; static;
       class function IdentityY :TSingle3D; inline; static;
       class function IdentityZ :TSingle3D; inline; static;
       ///// メソッド
       function VectorTo( const P_:TSingle3D ) :TSingle3D;
       function UnitorTo( const P_:TSingle3D ) :TSingle3D;
       function DistanTo( const P_:TSingle3D ) :Single;
       class function RandG :TSingle3D; static;
       class function RandBS1 :TSingle3D; static;
       class function RandBS2 :TSingle3D; static;
       class function RandBS4 :TSingle3D; static;
     case Byte of
      0:( _ :array [ 1..3 ] of Single; );
      1:(  X :Single;
           Y :Single;
           Z :Single;                  );
      2:( _1 :Single;
          _2 :Single;
          _3 :Single;                  );
     end;

     TSinglePos3D = TSingle3D;
     TSingleVec3D = TSingle3D;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDouble3D

     TDouble3D = record
     private
       ///// アクセス
       function GetV( const I_:Integer ) :Double; inline;
       procedure SetV( const I_:Integer; const V_:Double ); inline;
       function GetSiz2 :Double; inline;
       procedure SetSiz2( const Siz2_:Double ); inline;
       function GetSize :Double; inline;
       procedure SetSize( const Size_:Double ); inline;
       function GetUnitor :TDouble3D; inline;
       procedure SetUnitor( const Unitor_:TDouble3D ); inline;
       function GetOrthant :Byte;
       function GetProjXY :TDouble2D; inline;
       procedure SetProjXY( const ProjXY_:TDouble2D ); inline;
       function GetProjYZ :TDouble2D; inline;
       procedure SetProjYZ( const ProjYZ_:TDouble2D ); inline;
       function GetProjZX :TDouble2D; inline;
       procedure SetProjZX( const ProjZX_:TDouble2D ); inline;
     public
       constructor Create( const V_:Double ); overload;
       constructor Create( const X_,Y_,Z_:Double ); overload;
       ///// プロパティ
       property _s[ const I_:Integer ] :Double    read GetV       write SetV     ; default;
       property Siz2                   :Double    read GetSiz2    write SetSiz2  ;
       property Size                   :Double    read GetSize    write SetSize  ;
       property Unitor                 :TDouble3D read GetUnitor  write SetUnitor;
       property Orthant                :Byte      read GetOrthant                ;
       property ProjXY                 :TDouble2D read GetProjXY  write SetProjXY;
       property ProjYZ                 :TDouble2D read GetProjYZ  write SetProjYZ;
       property ProjZX                 :TDouble2D read GetProjZX  write SetProjZX;
       ///// 演算子
       class operator Negative( const V_:TDouble3D ) :TDouble3D; inline;
       class operator Positive( const V_:TDouble3D ) :TDouble3D; inline;
       class operator Add( const A_,B_:TDouble3D ) :TDouble3D; inline;
       class operator Subtract( const A_,B_:TDouble3D ) :TDouble3D; inline;
       class operator Multiply( const A_:TDouble3D; const B_:Double ) :TDouble3D; inline;
       class operator Multiply( const A_:Double; const B_:TDouble3D ) :TDouble3D; inline;
       class operator Divide( const A_:TDouble3D; const B_:Double ) :TDouble3D; inline;
       ///// 型変換
       class operator Implicit( const V_:TDouble2D ) :TDouble3D; inline;
       class operator Explicit( const V_:TDouble3D ) :TDouble2D; inline;
       class operator Implicit( const V_:TPoint3D ) :TDouble3D; inline;
       class operator Implicit( const V_:TDouble3D ) :TPoint3D; inline;
       class operator Implicit( const V_:TVector3D ) :TDouble3D; inline;
       class operator Implicit( const V_:TDouble3D ) :TVector3D; inline;
       ///// 定数
       class function IdentityX :TDouble3D; inline; static;
       class function IdentityY :TDouble3D; inline; static;
       class function IdentityZ :TDouble3D; inline; static;
       ///// メソッド
       function VectorTo( const P_:TDouble3D ) :TDouble3D;
       function UnitorTo( const P_:TDouble3D ) :TDouble3D;
       function DistanTo( const P_:TDouble3D ) :Double;
       class function RandG :TDouble3D; static;
       class function RandBS1 :TDouble3D; static;
       class function RandBS2 :TDouble3D; static;
       class function RandBS4 :TDouble3D; static;
     case Byte of
      0:( _ :array [ 1..3 ] of Double; );
      1:(  X :Double;
           Y :Double;
           Z :Double;                  );
      2:( _1 :Double;
          _2 :Double;
          _3 :Double;                  );
     end;

     TDoublePos3D = TDouble3D;
     TDoubleVec3D = TDouble3D;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdSingle3D

     TdSingle3D = record
     private
       ///// アクセス
       function GetV( const I_:Integer ) :TdSingle; inline;
       procedure SetV( const I_:Integer; const V_:TdSingle ); inline;
       function Geto :TSingle3D; inline;
       procedure Seto( const o_:TSingle3D ); inline;
       function Getd :TSingle3D; inline;
       procedure Setd( const d_:TSingle3D ); inline;
       function GetSiz2 :TdSingle; inline;
       procedure SetSiz2( const Siz2_:TdSingle ); inline;
       function GetSize :TdSingle; inline;
       procedure SetSize( const Size_:TdSingle ); inline;
       function GetUnitor :TdSingle3D; inline;
       procedure SetUnitor( const Unitor_:TdSingle3D ); inline;
     public
       constructor Create( const X_,Y_,Z_:TdSingle );
       ///// プロパティ
       property _s[ const I_:Integer ] :TdSingle   read GetV      write SetV     ; default;
       property o                      :TSingle3D  read Geto      write Seto     ;
       property d                      :TSingle3D  read Getd      write Setd     ;
       property Siz2                   :TdSingle   read GetSiz2   write SetSiz2  ;
       property Size                   :TdSingle   read GetSize   write SetSize  ;
       property Unitor                 :TdSingle3D read GetUnitor write SetUnitor;
       ///// 演算子
       class operator Negative( const V_:TdSingle3D ) :TdSingle3D; inline;
       class operator Positive( const V_:TdSingle3D ) :TdSingle3D; inline;
       class operator Add( const A_,B_:TdSingle3D ) :TdSingle3D; inline;
       class operator Subtract( const A_,B_:TdSingle3D ) :TdSingle3D; inline;
       class operator Multiply( const A_:TdSingle3D; const B_:TdSingle ) :TdSingle3D; inline;
       class operator Multiply( const A_:TdSingle; const B_:TdSingle3D ) :TdSingle3D; inline;
       class operator Divide( const A_:TdSingle3D; const B_:TdSingle ) :TdSingle3D; inline;
       ///// 型変換
       class operator Implicit( const V_:TSingle3D ) :TdSingle3D;
       class operator Implicit( const V_:TdSingle3D ) :TSingle3D; inline;
     case Byte of
      0:( _ :array [ 1..3 ] of TdSingle; );
      1:(  X :TdSingle;
           Y :TdSingle;
           Z :TdSingle;                  );
      2:( _1 :TdSingle;
          _2 :TdSingle;
          _3 :TdSingle;                  );
     end;

     TdSinglePos3D = TdSingle3D;
     TdSingleVec3D = TdSingle3D;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdDouble3D

     TdDouble3D = record
     private
       ///// アクセス
       function GetV( const I_:Integer ) :TdDouble; inline;
       procedure SetV( const I_:Integer; const V_:TdDouble ); inline;
       function Geto :TDouble3D; inline;
       procedure Seto( const o_:TDouble3D ); inline;
       function Getd :TDouble3D; inline;
       procedure Setd( const d_:TDouble3D ); inline;
       function GetSiz2 :TdDouble; inline;
       procedure SetSiz2( const Siz2_:TdDouble ); inline;
       function GetSize :TdDouble; inline;
       procedure SetSize( const Size_:TdDouble ); inline;
       function GetUnitor :TdDouble3D; inline;
       procedure SetUnitor( const Unitor_:TdDouble3D ); inline;
     public
       constructor Create( const X_,Y_,Z_:TdDouble );
       ///// プロパティ
       property _s[ const I_:Integer ] :TdDouble   read GetV      write SetV     ; default;
       property o                      :TDouble3D  read Geto      write Seto     ;
       property d                      :TDouble3D  read Getd      write Setd     ;
       property Siz2                   :TdDouble   read GetSiz2   write SetSiz2  ;
       property Size                   :TdDouble   read GetSize   write SetSize  ;
       property Unitor                 :TdDouble3D read GetUnitor write SetUnitor;
       ///// 演算子
       class operator Negative( const V_:TdDouble3D ) :TdDouble3D; inline;
       class operator Positive( const V_:TdDouble3D ) :TdDouble3D; inline;
       class operator Add( const A_,B_:TdDouble3D ) :TdDouble3D; inline;
       class operator Subtract( const A_,B_:TdDouble3D ) :TdDouble3D; inline;
       class operator Multiply( const A_:TdDouble3D; const B_:TdDouble ) :TdDouble3D; inline;
       class operator Multiply( const A_:TdDouble; const B_:TdDouble3D ) :TdDouble3D; inline;
       class operator Divide( const A_:TdDouble3D; const B_:TdDouble ) :TdDouble3D; inline;
       ///// 型変換
       class operator Implicit( const V_:TDouble3D ) :TdDouble3D;
       class operator Implicit( const V_:TdDouble3D ) :TDouble3D; inline;
     case Byte of
      0:( _ :array [ 1..3 ] of TdDouble; );
      1:(  X :TdDouble;
           Y :TdDouble;
           Z :TdDouble;                  );
      2:( _1 :TdDouble;
          _2 :TdDouble;
          _3 :TdDouble;                  );
     end;

     TdDoublePos3D = TdDouble3D;
     TdDoubleVec3D = TdDouble3D;

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
       class operator Negative( const V_:TSingleSiz3D ) :TSingleSiz3D; inline;
       class operator Positive( const V_:TSingleSiz3D ) :TSingleSiz3D; inline;
       class operator Add( const A_,B_:TSingleSiz3D ) :TSingleSiz3D; inline;
       class operator Subtract( const A_,B_:TSingleSiz3D ) :TSingleSiz3D; inline;
       class operator Multiply( const A_:TSingleSiz3D; const B_:Single ) :TSingleSiz3D; inline;
       class operator Multiply( const A_:Single; const B_:TSingleSiz3D ) :TSingleSiz3D; inline;
       class operator Divide( const A_:TSingleSiz3D; const B_:Single ) :TSingleSiz3D; inline;
       ///// 型変換
       class operator Implicit( const V_:TPoint3D ) :TSingleSiz3D; inline;
       class operator Implicit( const V_:TSingleSiz3D ) :TPoint3D; inline;
       class operator Implicit( const V_:TVector3D ) :TSingleSiz3D; inline;
       class operator Implicit( const V_:TSingleSiz3D ) :TVector3D; inline;
       class operator Implicit( const V_:TSingle3D ) :TSingleSiz3D; inline;
       class operator Implicit( const V_:TSingleSiz3D ) :TSingle3D; inline;
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
       class operator Negative( const V_:TDoubleSiz3D ) :TDoubleSiz3D; inline;
       class operator Positive( const V_:TDoubleSiz3D ) :TDoubleSiz3D; inline;
       class operator Add( const A_,B_:TDoubleSiz3D ) :TDoubleSiz3D; inline;
       class operator Subtract( const A_,B_:TDoubleSiz3D ) :TDoubleSiz3D; inline;
       class operator Multiply( const A_:TDoubleSiz3D; const B_:Double ) :TDoubleSiz3D; inline;
       class operator Multiply( const A_:Double; const B_:TDoubleSiz3D ) :TDoubleSiz3D; inline;
       class operator Divide( const A_:TDoubleSiz3D; const B_:Double ) :TDoubleSiz3D; inline;
       ///// 型変換
       class operator Implicit( const V_:TPoint3D ) :TDoubleSiz3D; inline;
       class operator Implicit( const V_:TDoubleSiz3D ) :TPoint3D; inline;
       class operator Implicit( const V_:TVector3D ) :TDoubleSiz3D; inline;
       class operator Implicit( const V_:TDoubleSiz3D ) :TVector3D; inline;
       class operator Implicit( const V_:TDouble3D ) :TDoubleSiz3D; inline;
       class operator Implicit( const V_:TDoubleSiz3D ) :TDouble3D; inline;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleArea3D

     TSingleArea3D = record
     private
       ///// アクセス
       function GetPoin( const I_:Integer ) :TSingle3D;
       function GetSign :ShortInt;
       function GetSizeX :Single;
       function GetSizeY :Single;
       function GetSizeZ :Single;
       function GetProjX :TSingleArea;
       procedure SetProjX( const ProjX_:TSingleArea );
       function GetProjY :TSingleArea;
       procedure SetProjY( const ProjY_:TSingleArea );
       function GetProjZ :TSingleArea;
       procedure SetProjZ( const ProjZ_:TSingleArea );
       function GetCenter :TSingle3D;
       function GetProjXY :TSingleArea2D;
       function GetProjYZ :TSingleArea2D;
       function GetProjZX :TSingleArea2D;
     public
       Min :TSingle3D;
       Max :TSingle3D;
       /////
       constructor Create( const Min_,Max_:Single ); overload;
       constructor Create( const MinX_,MinY_,MinZ_,
                                 MaxX_,MaxY_,MaxZ_:Single ); overload;
       constructor Create( const Min_,Max_:TSingle3D ); overload;
       ///// プロパティ
       property Poin[ const I_:Integer ] :TSingle3D     read GetPoin                ;
       property Sign                     :ShortInt      read GetSign                ;
       property SizeX                    :Single        read GetSizeX               ;
       property SizeY                    :Single        read GetSizeY               ;
       property SizeZ                    :Single        read GetSizeZ               ;
       property ProjX                    :TSingleArea   read GetProjX write SetProjX;
       property ProjY                    :TSingleArea   read GetProjY write SetProjY;
       property ProjZ                    :TSingleArea   read GetProjZ write SetProjZ;
       property Center                   :TSingle3D     read GetCenter              ;
       property ProjXY                   :TSingleArea2D read GetProjXY              ;
       property ProjYZ                   :TSingleArea2D read GetProjYZ              ;
       property ProjZX                   :TSingleArea2D read GetProjZX              ;
       ///// 定数
       class function NeInf :TSingleArea3D; static;
       class function NeMax :TSingleArea3D; static;
       class function Zero  :TSingleArea3D; static;
       class function PoMax :TSingleArea3D; static;
       class function PoInf :TSingleArea3D; static;
       ///// メソッド
       function ProjVec( const Vec_:TSingle3D ) :TSingleArea;
       function Collision( const Area_:TSingleArea3D ) :Boolean;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleArea3D

     TDoubleArea3D = record
     private
       ///// アクセス
       function GetPoin( const I_:Integer ) :TDouble3D;
       function GetSign :ShortInt;
       function GetSizeX :Double;
       function GetSizeY :Double;
       function GetSizeZ :Double;
       function GetProjX :TDoubleArea;
       procedure SetProjX( const ProjX_:TDoubleArea );
       function GetProjY :TDoubleArea;
       procedure SetProjY( const ProjY_:TDoubleArea );
       function GetProjZ :TDoubleArea;
       procedure SetProjZ( const ProjZ_:TDoubleArea );
       function GetCenter :TDouble3D;
       function GetProjXY :TDoubleArea2D;
       function GetProjYZ :TDoubleArea2D;
       function GetProjZX :TDoubleArea2D;
     public
       Min :TDouble3D;
       Max :TDouble3D;
       /////
       constructor Create( const Min_,Max_:Double ); overload;
       constructor Create( const MinX_,MinY_,MinZ_,
                                 MaxX_,MaxY_,MaxZ_:Double ); overload;
       constructor Create( const Min_,Max_:TDouble3D ); overload;
       ///// プロパティ
       property Poin[ const I_:Integer ] :TDouble3D     read GetPoin                ;
       property Sign                     :ShortInt      read GetSign                ;
       property SizeX                    :Double        read GetSizeX               ;
       property SizeY                    :Double        read GetSizeY               ;
       property SizeZ                    :Double        read GetSizeZ               ;
       property ProjX                    :TDoubleArea   read GetProjX write SetProjX;
       property ProjY                    :TDoubleArea   read GetProjY write SetProjY;
       property ProjZ                    :TDoubleArea   read GetProjZ write SetProjZ;
       property Center                   :TDouble3D     read GetCenter              ;
       property ProjXY                   :TDoubleArea2D read GetProjXY              ;
       property ProjYZ                   :TDoubleArea2D read GetProjYZ              ;
       property ProjZX                   :TDoubleArea2D read GetProjZX              ;
       ///// 定数
       class function NeInf :TDoubleArea3D; static;
       class function NeMax :TDoubleArea3D; static;
       class function Zero  :TDoubleArea3D; static;
       class function PoMax :TDoubleArea3D; static;
       class function PoInf :TDoubleArea3D; static;
       ///// メソッド
       function ProjVec( const Vec_:TDouble3D ) :TDoubleArea;
       function Collision( const Area_:TDoubleArea3D ) :Boolean;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleRay3D

     TSingleRay3D = record
     private
       ///// アクセス
       function GetUnitor :TSingleRay3D; inline;
       procedure SetUnitor( const Unitor_:TSingleRay3D ); inline;
     public
       Pos :TSinglePos3D;
       Vec :TSingleVec3D;
       ///// プロパティ
       property Unitor :TSingleRay3D read GetUnitor write SetUnitor;
       ///// メソッド
       function GoPos( const Len_:Single ) :TSingle3D;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleRay3D

     TDoubleRay3D = record
     private
       ///// アクセス
       function GetUnitor :TDoubleRay3D; inline;
       procedure SetUnitor( const Unitor_:TDoubleRay3D ); inline;
     public
       Pos :TDoublePos3D;
       Vec :TDoubleVec3D;
       ///// プロパティ
       property Unitor :TDoubleRay3D read GetUnitor write SetUnitor;
       ///// メソッド
       function GoPos( const Len_:Double ) :TDouble3D;
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

function DotProduct( const A_,B_:TSingleVec3D ) :Single; inline; overload;
function DotProduct( const A_,B_:TDoubleVec3D ) :Double; inline; overload;

function DotProduct( const A_,B_:TdSingleVec3D ) :TdSingle; inline; overload;
function DotProduct( const A_,B_:TdDoubleVec3D ) :TdDouble; inline; overload;

function CrossProduct( const A_,B_:TSingleVec3D ) :TSingleVec3D; inline; overload;
function CrossProduct( const A_,B_:TDoubleVec3D ) :TDoubleVec3D; inline; overload;

function CrossProduct( const A_,B_:TdSingleVec3D ) :TdSingleVec3D; inline; overload;
function CrossProduct( const A_,B_:TdDoubleVec3D ) :TdDoubleVec3D; inline; overload;

function Distanc2( const A_,B_:TSinglePos3D ) :Single; inline; overload;
function Distanc2( const A_,B_:TDoublePos3D ) :Double; inline; overload;

function Distance( const A_,B_:TSinglePos3D ) :Single; inline; overload;
function Distance( const A_,B_:TDoublePos3D ) :Double; inline; overload;

function Distanc2( const A_,B_:TdSinglePos3D ) :TdSingle; inline; overload;
function Distanc2( const A_,B_:TdDoublePos3D ) :TdDouble; inline; overload;

function Distance( const A_,B_:TdSinglePos3D ) :TdSingle; inline; overload;
function Distance( const A_,B_:TdDoublePos3D ) :TdDouble; inline; overload;

function Ave( const P1_,P2_:TSingle3D ) :TSingle3D; inline; overload;
function Ave( const P1_,P2_:TDouble3D ) :TDouble3D; inline; overload;

function Ave( const P1_,P2_,P3_:TSingle3D ) :TSingle3D; inline; overload;
function Ave( const P1_,P2_,P3_:TDouble3D ) :TDouble3D; inline; overload;

function Ave( const P1_,P2_,P3_,P4_:TSingle3D ) :TSingle3D; inline; overload;
function Ave( const P1_,P2_,P3_,P4_:TDouble3D ) :TDouble3D; inline; overload;

function Ave( const P1_,P2_:TdSingle3D ) :TdSingle3D; inline; overload;
function Ave( const P1_,P2_:TdDouble3D ) :TdDouble3D; inline; overload;

function Ave( const P1_,P2_,P3_:TdSingle3D ) :TdSingle3D; inline; overload;
function Ave( const P1_,P2_,P3_:TdDouble3D ) :TdDouble3D; inline; overload;

function Ave( const P1_,P2_,P3_,P4_:TdSingle3D ) :TdSingle3D; inline; overload;
function Ave( const P1_,P2_,P3_,P4_:TdDouble3D ) :TdDouble3D; inline; overload;

function Nabla( const Func_:TConstFunc<TdSingle3D,TdSingle>; const P_:TSingle3D ) :TSingle3D; inline; overload;
function Nabla( const Func_:TConstFunc<TdDouble3D,TdDouble>; const P_:TDouble3D ) :TDouble3D; inline; overload;

function PolySolveReal( const Ks_:TSingle3D; out Xs_:TSingle2D ) :Byte; overload;
function PolySolveReal( const Ks_:TDouble3D; out Xs_:TDouble2D ) :Byte; overload;

implementation //############################################################### ■

uses System.SysUtils;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% T1Bit3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function T1Bit3D.Get_( const I_:Byte ) :Byte;
begin
     Result := ( o shr I_ ) and $01;
end;

procedure T1Bit3D.Set_( const I_:Byte; const o_:Byte );
begin
     o := ( o and ( not ( $01 shl I_ ) ) ) or ( o_ shl I_ );
end;

function T1Bit3D.GetX :Byte;
begin
     Result := o and $01;
end;

procedure T1Bit3D.SetX( const X_:Byte );
begin
     o := ( o and $06 ) or X_;
end;

function T1Bit3D.GetY :Byte;
begin
     Result := ( o shr 1 ) and $01;
end;

procedure T1Bit3D.SetY( const Y_:Byte );
begin
     o := ( o and $05 ) or ( Y_ shl 1 );
end;

function T1Bit3D.GetZ :Byte;
begin
     Result := ( o shr 2 ) and $01;
end;

procedure T1Bit3D.SetZ( const Z_:Byte );
begin
     o := ( o and $03 ) or ( Z_ shl 2 );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor T1Bit3D.Create( const V_:Byte );
begin
     Create( V_, V_, V_ );
end;

constructor T1Bit3D.Create( const X_,Y_,Z_:Byte );
begin
     o := ( Z_ shl 2 ) or ( Y_ shl 1 ) or X_;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TByte3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TByte3D.Create( const V_:Byte );
begin
     X := V_;
     Y := V_;
     Z := V_;
end;

constructor TByte3D.Create( const X_,Y_,Z_:Byte );
begin
     X := X_;
     Y := Y_;
     Z := Z_;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TShortint3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TShortint3D.Create( const V_:Shortint );
begin
     X := V_;
     Y := V_;
     Z := V_;
end;

constructor TShortint3D.Create( const X_,Y_,Z_:Shortint );
begin
     X := X_;
     Y := Y_;
     Z := Z_;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TWord3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TWord3D.Create( const V_:Word );
begin
     X := V_;
     Y := V_;
     Z := V_;
end;

constructor TWord3D.Create( const X_,Y_,Z_:Word );
begin
     X := X_;
     Y := Y_;
     Z := Z_;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSmallint3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TSmallint3D.Create( const V_:Smallint );
begin
     X := V_;
     Y := V_;
     Z := V_;
end;

constructor TSmallint3D.Create( const X_,Y_,Z_:Smallint );
begin
     X := X_;
     Y := Y_;
     Z := Z_;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TCardinal3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TCardinal3D.GetLSB :T1Bit3D;
begin
     Result.X := X and $00000001;
     Result.Y := Y and $00000001;
     Result.Z := Z and $00000001;
end;

function TCardinal3D.GetMSB :T1Bit3D;
begin
     Result.X := X and $80000000;
     Result.Y := Y and $80000000;
     Result.Z := Z and $80000000;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TCardinal3D.Create( const V_:Cardinal );
begin
     X := V_;
     Y := V_;
     Z := V_;
end;

constructor TCardinal3D.Create( const X_,Y_,Z_:Cardinal );
begin
     X := X_;
     Y := Y_;
     Z := Z_;
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TCardinal3D.Negative( const V_:TCardinal3D ) :TCardinal3D;
begin
     with Result do
     begin
          X := -V_.X;
          Y := -V_.Y;
          Z := -V_.Z;
     end;
end;

class operator TCardinal3D.Positive( const V_:TCardinal3D ) :TCardinal3D;
begin
     with Result do
     begin
          X := +V_.X;
          Y := +V_.Y;
          Z := +V_.Z;
     end;
end;

class operator TCardinal3D.Add( const A_,B_:TCardinal3D ) :TCardinal3D;
begin
     with Result do
     begin
          X := A_.X + B_.X;
          Y := A_.Y + B_.Y;
          Z := A_.Z + B_.Z;
     end;
end;

class operator TCardinal3D.Subtract( const A_,B_:TCardinal3D ) :TCardinal3D;
begin
     with Result do
     begin
          X := A_.X - B_.X;
          Y := A_.Y - B_.Y;
          Z := A_.Z - B_.Z;
     end;
end;

class operator TCardinal3D.Multiply( const A_:TCardinal3D; const B_:Cardinal ) :TCardinal3D;
begin
     with Result do
     begin
          X := A_.X * B_;
          Y := A_.Y * B_;
          Z := A_.Z * B_;
     end;
end;

class operator TCardinal3D.Multiply( const A_:Cardinal; const B_:TCardinal3D ) :TCardinal3D;
begin
     with Result do
     begin
          X := A_ * B_.X;
          Y := A_ * B_.Y;
          Z := A_ * B_.Z;
     end;
end;

class operator TCardinal3D.IntDivide( const A_:TCardinal3D; const B_:Cardinal ) :TCardinal3D;
begin
     with Result do
     begin
          X := A_.X div B_;
          Y := A_.Y div B_;
          Z := A_.Z div B_;
     end;
end;

class operator TCardinal3D.Modulus( const A_:TCardinal3D; const B_:Cardinal ) :TCardinal3D;
begin
     with Result do
     begin
          X := A_.X mod B_;
          Y := A_.Y mod B_;
          Z := A_.Z mod B_;
     end;
end;

class operator TCardinal3D.LeftShift( const A_:TCardinal3D; const B_:Integer ) :TCardinal3D;
begin
     with Result do
     begin
          X := A_.X shl B_;
          Y := A_.Y shl B_;
          Z := A_.Z shl B_;
     end;
end;

class operator TCardinal3D.RightShift( const A_:TCardinal3D; const B_:Integer ) :TCardinal3D;
begin
     with Result do
     begin
          X := A_.X shr B_;
          Y := A_.Y shr B_;
          Z := A_.Z shr B_;
     end;
end;

class operator TCardinal3D.Equal( const A_,B_:TCardinal3D ) :Boolean;
begin
     Result := ( A_.X = B_.X ) and ( A_.Y = B_.Y ) and ( A_.Z = B_.Z );
end;

class operator TCardinal3D.NotEqual( const A_,B_:TCardinal3D ) :Boolean;
begin
     Result := not ( A_ = B_ );
end;

class operator TCardinal3D.BitwiseAnd( const A_:TCardinal3D; const B_:Cardinal ) :TCardinal3D;
begin
     with Result do
     begin
          X := A_.X and B_;
          Y := A_.Y and B_;
          Z := A_.Z and B_;
     end;
end;

class operator TCardinal3D.BitwiseOr( const A_:TCardinal3D; const B_:Cardinal ) :TCardinal3D;
begin
     with Result do
     begin
          X := A_.X or B_;
          Y := A_.Y or B_;
          Z := A_.Z or B_;
     end;
end;

class operator TCardinal3D.BitwiseXor( const A_:TCardinal3D; const B_:Cardinal ) :TCardinal3D;
begin
     with Result do
     begin
          X := A_.X or B_;
          Y := A_.Y or B_;
          Z := A_.Z or B_;
     end;
end;

///////////////////////////////////////////////////////////////////////// 型変換

class operator TCardinal3D.Explicit( const V_:TCardinal3D ) :TByte3D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
          Z := V_.Z;
     end;
end;

class operator TCardinal3D.Explicit( const V_:TByte3D ) :TCardinal3D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
          Z := V_.Z;
     end;
end;

class operator TCardinal3D.Explicit( const V_:TCardinal3D ) :TShortint3D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
          Z := V_.Z;
     end;
end;

class operator TCardinal3D.Explicit( const V_:TShortint3D ) :TCardinal3D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
          Z := V_.Z;
     end;
end;

class operator TCardinal3D.Explicit( const V_:TCardinal3D ) :TWord3D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
          Z := V_.Z;
     end;
end;

class operator TCardinal3D.Explicit( const V_:TWord3D ) :TCardinal3D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
          Z := V_.Z;
     end;
end;

class operator TCardinal3D.Explicit( const V_:TCardinal3D ) :TSmallint3D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
          Z := V_.Z;
     end;
end;

class operator TCardinal3D.Explicit( const V_:TSmallint3D ) :TCardinal3D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
          Z := V_.Z;
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TInteger3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TInteger3D.GetLSB :T1Bit3D;
begin
     Result.X := X and $00000001;
     Result.Y := Y and $00000001;
     Result.Z := Z and $00000001;
end;

function TInteger3D.GetMSB :T1Bit3D;
begin
     Result.X := X and $80000000;
     Result.Y := Y and $80000000;
     Result.Z := Z and $80000000;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TInteger3D.Create( const V_:Integer );
begin
     X := V_;
     Y := V_;
     Z := V_;
end;

constructor TInteger3D.Create( const X_,Y_,Z_:Integer );
begin
     X := X_;
     Y := Y_;
     Z := Z_;
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TInteger3D.Negative( const V_:TInteger3D ) :TInteger3D;
begin
     with Result do
     begin
          X := -V_.X;
          Y := -V_.Y;
          Z := -V_.Z;
     end;
end;

class operator TInteger3D.Positive( const V_:TInteger3D ) :TInteger3D;
begin
     with Result do
     begin
          X := +V_.X;
          Y := +V_.Y;
          Z := +V_.Z;
     end;
end;

class operator TInteger3D.Add( const A_,B_:TInteger3D ) :TInteger3D;
begin
     with Result do
     begin
          X := A_.X + B_.X;
          Y := A_.Y + B_.Y;
          Z := A_.Z + B_.Z;
     end;
end;

class operator TInteger3D.Subtract( const A_,B_:TInteger3D ) :TInteger3D;
begin
     with Result do
     begin
          X := A_.X - B_.X;
          Y := A_.Y - B_.Y;
          Z := A_.Z - B_.Z;
     end;
end;

class operator TInteger3D.Multiply( const A_:TInteger3D; const B_:Integer ) :TInteger3D;
begin
     with Result do
     begin
          X := A_.X * B_;
          Y := A_.Y * B_;
          Z := A_.Z * B_;
     end;
end;

class operator TInteger3D.Multiply( const A_:Integer; const B_:TInteger3D ) :TInteger3D;
begin
     with Result do
     begin
          X := A_ * B_.X;
          Y := A_ * B_.Y;
          Z := A_ * B_.Z;
     end;
end;

class operator TInteger3D.IntDivide( const A_:TInteger3D; const B_:Integer ) :TInteger3D;
begin
     with Result do
     begin
          X := A_.X div B_;
          Y := A_.Y div B_;
          Z := A_.Z div B_;
     end;
end;

class operator TInteger3D.Modulus( const A_:TInteger3D; const B_:Integer ) :TInteger3D;
begin
     with Result do
     begin
          X := A_.X mod B_;
          Y := A_.Y mod B_;
          Z := A_.Z mod B_;
     end;
end;

class operator TInteger3D.LeftShift( const A_:TInteger3D; const B_:Integer ) :TInteger3D;
begin
     with Result do
     begin
          X := A_.X shl B_;
          Y := A_.Y shl B_;
          Z := A_.Z shl B_;
     end;
end;

class operator TInteger3D.RightShift( const A_:TInteger3D; const B_:Integer ) :TInteger3D;
begin
     with Result do
     begin
          X := A_.X shr B_;
          Y := A_.Y shr B_;
          Z := A_.Z shr B_;
     end;
end;

class operator TInteger3D.Equal( const A_,B_:TInteger3D ) :Boolean;
begin
     Result := ( A_.X = B_.X ) and ( A_.Y = B_.Y ) and ( A_.Z = B_.Z );
end;

class operator TInteger3D.NotEqual( const A_,B_:TInteger3D ) :Boolean;
begin
     Result := not ( A_ = B_ );
end;

class operator TInteger3D.BitwiseAnd( const A_:TInteger3D; const B_:Integer ) :TInteger3D;
begin
     with Result do
     begin
          X := A_.X and B_;
          Y := A_.Y and B_;
          Z := A_.Z and B_;
     end;
end;

class operator TInteger3D.BitwiseOr( const A_:TInteger3D; const B_:Integer ) :TInteger3D;
begin
     with Result do
     begin
          X := A_.X or B_;
          Y := A_.Y or B_;
          Z := A_.Z or B_;
     end;
end;

class operator TInteger3D.BitwiseXor( const A_:TInteger3D; const B_:Integer ) :TInteger3D;
begin
     with Result do
     begin
          X := A_.X or B_;
          Y := A_.Y or B_;
          Z := A_.Z or B_;
     end;
end;

///////////////////////////////////////////////////////////////////////// 型変換

class operator TInteger3D.Explicit( const V_:TInteger3D ) :TByte3D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
          Z := V_.Z;
     end;
end;

class operator TInteger3D.Explicit( const V_:TByte3D ) :TInteger3D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
          Z := V_.Z;
     end;
end;

class operator TInteger3D.Explicit( const V_:TInteger3D ) :TShortint3D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
          Z := V_.Z;
     end;
end;

class operator TInteger3D.Explicit( const V_:TShortint3D ) :TInteger3D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
          Z := V_.Z;
     end;
end;

class operator TInteger3D.Explicit( const V_:TInteger3D ) :TWord3D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
          Z := V_.Z;
     end;
end;

class operator TInteger3D.Explicit( const V_:TWord3D ) :TInteger3D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
          Z := V_.Z;
     end;
end;

class operator TInteger3D.Explicit( const V_:TInteger3D ) :TSmallint3D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
          Z := V_.Z;
     end;
end;

class operator TInteger3D.Explicit( const V_:TSmallint3D ) :TInteger3D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
          Z := V_.Z;
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingle3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TSingle3D.GetV( const I_:Integer ) :Single;
begin
     Result := _[ I_ ];
end;

procedure TSingle3D.SetV( const I_:Integer; const V_:Single );
begin
     _[ I_ ] := V_;
end;

//------------------------------------------------------------------------------

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
     Result := Roo2( GetSiz2 );
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

//------------------------------------------------------------------------------

function TSingle3D.GetOrthant :Byte;
begin
     Result := 0;
     if X >= 0 then Result := Result or 1;
     if Y >= 0 then Result := Result or 2;
     if Z >= 0 then Result := Result or 4;
end;

//------------------------------------------------------------------------------

function TSingle3D.GetProjXY :TSingle2D;
begin
     Result.X := X;
     Result.Y := Y;
end;

procedure TSingle3D.SetProjXY( const ProjXY_:TSingle2D );
begin
     X := ProjXY_.X;
     Y := ProjXY_.Y;
end;

function TSingle3D.GetProjYZ :TSingle2D;
begin
     Result.X := Y;
     Result.Y := Z;
end;

procedure TSingle3D.SetProjYZ( const ProjYZ_:TSingle2D );
begin
     Y := ProjYZ_.X;
     Z := ProjYZ_.Y;
end;

function TSingle3D.GetProjZX :TSingle2D;
begin
     Result.X := Z;
     Result.Y := X;
end;

procedure TSingle3D.SetProjZX( const ProjZX_:TSingle2D );
begin
     Z := ProjZX_.X;
     X := ProjZX_.Y;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TSingle3D.Create( const V_:Single );
begin
     X := V_;
     Y := V_;
     Z := V_;
end;

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

class operator TSingle3D.Implicit( const V_:TSingle2D ) :TSingle3D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
          Z := 0;
     end;
end;

class operator TSingle3D.Explicit( const V_:TSingle3D ) :TSingle2D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
     end;
end;

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

/////////////////////////////////////////////////////////////////////// メソッド

function TSingle3D.VectorTo( const P_:TSingle3D ) :TSingle3D;
begin
     Result := P_ - Self;
end;

function TSingle3D.UnitorTo( const P_:TSingle3D ) :TSingle3D;
begin
     Result := VectorTo( P_ ).Unitor;
end;

function TSingle3D.DistanTo( const P_:TSingle3D ) :Single;
begin
     Result := VectorTo( P_ ).Size;
end;

//------------------------------------------------------------------------------

class function TSingle3D.RandG :TSingle3D;
begin
     with Result do
     begin
          X := System.Math.RandG( 0, 1 );
          Y := System.Math.RandG( 0, 1 );
          Z := System.Math.RandG( 0, 1 );
     end;
end;

//------------------------------------------------------------------------------

class function TSingle3D.RandBS1 :TSingle3D;
begin
     with Result do
     begin
          X := TSingle.RandBS1;
          Y := TSingle.RandBS1;
          Z := TSingle.RandBS1;
     end;
end;

class function TSingle3D.RandBS2 :TSingle3D;
begin
     with Result do
     begin
          X := TSingle.RandBS2;
          Y := TSingle.RandBS2;
          Z := TSingle.RandBS2;
     end;
end;

class function TSingle3D.RandBS4 :TSingle3D;
begin
     with Result do
     begin
          X := TSingle.RandBS4;
          Y := TSingle.RandBS4;
          Z := TSingle.RandBS4;
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDouble3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TDouble3D.GetV( const I_:Integer ) :Double;
begin
     Result := _[ I_ ];
end;

procedure TDouble3D.SetV( const I_:Integer; const V_:Double );
begin
     _[ I_ ] := V_;
end;

//------------------------------------------------------------------------------

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
     Result := Roo2( GetSiz2 );
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

//------------------------------------------------------------------------------

function TDouble3D.GetOrthant :Byte;
begin
     Result := 0;
     if X >= 0 then Result := Result or 1;
     if Y >= 0 then Result := Result or 2;
     if Z >= 0 then Result := Result or 4;
end;

//------------------------------------------------------------------------------

function TDouble3D.GetProjXY :TDouble2D;
begin
     Result.X := X;
     Result.Y := Y;
end;

procedure TDouble3D.SetProjXY( const ProjXY_:TDouble2D );
begin
     X := ProjXY_.X;
     Y := ProjXY_.Y;
end;

function TDouble3D.GetProjYZ :TDouble2D;
begin
     Result.X := Y;
     Result.Y := Z;
end;

procedure TDouble3D.SetProjYZ( const ProjYZ_:TDouble2D );
begin
     Y := ProjYZ_.X;
     Z := ProjYZ_.Y;
end;

function TDouble3D.GetProjZX :TDouble2D;
begin
     Result.X := Z;
     Result.Y := X;
end;

procedure TDouble3D.SetProjZX( const ProjZX_:TDouble2D );
begin
     Z := ProjZX_.X;
     X := ProjZX_.Y;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TDouble3D.Create( const V_:Double );
begin
     X := V_;
     Y := V_;
     Z := V_;
end;

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

class operator TDouble3D.Implicit( const V_:TDouble2D ) :TDouble3D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
          Z := 0;
     end;
end;

class operator TDouble3D.Explicit( const V_:TDouble3D ) :TDouble2D;
begin
     with Result do
     begin
          X := V_.X;
          Y := V_.Y;
     end;
end;

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

/////////////////////////////////////////////////////////////////////// メソッド

function TDouble3D.VectorTo( const P_:TDouble3D ) :TDouble3D;
begin
     Result := P_ - Self;
end;

function TDouble3D.UnitorTo( const P_:TDouble3D ) :TDouble3D;
begin
     Result := VectorTo( P_ ).Unitor;
end;

function TDouble3D.DistanTo( const P_:TDouble3D ) :Double;
begin
     Result := VectorTo( P_ ).Size;
end;

//------------------------------------------------------------------------------

class function TDouble3D.RandG :TDouble3D;
begin
     with Result do
     begin
          X := System.Math.RandG( 0, 1 );
          Y := System.Math.RandG( 0, 1 );
          Z := System.Math.RandG( 0, 1 );
     end;
end;

//------------------------------------------------------------------------------

class function TDouble3D.RandBS1 :TDouble3D;
begin
     with Result do
     begin
          X := TDouble.RandBS1;
          Y := TDouble.RandBS1;
          Z := TDouble.RandBS1;
     end;
end;

class function TDouble3D.RandBS2 :TDouble3D;
begin
     with Result do
     begin
          X := TDouble.RandBS2;
          Y := TDouble.RandBS2;
          Z := TDouble.RandBS2;
     end;
end;

class function TDouble3D.RandBS4 :TDouble3D;
begin
     with Result do
     begin
          X := TDouble.RandBS4;
          Y := TDouble.RandBS4;
          Z := TDouble.RandBS4;
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdSingle3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TdSingle3D.GetV( const I_:Integer ) :TdSingle;
begin
     Result := _[ I_ ];
end;

procedure TdSingle3D.SetV( const I_:Integer; const V_:TdSingle );
begin
     _[ I_ ] := V_;
end;

//------------------------------------------------------------------------------

function TdSingle3D.Geto :TSingle3D;
begin
     Result.X := X.o;
     Result.Y := Y.o;
     Result.Z := Z.o;
end;

procedure TdSingle3D.Seto( const o_:TSingle3D );
begin
     X.o := o_.X;
     Y.o := o_.Y;
     Z.o := o_.Z;
end;

function TdSingle3D.Getd :TSingle3D;
begin
     Result.X := X.d;
     Result.Y := Y.d;
     Result.Z := Z.d;
end;

procedure TdSingle3D.Setd( const d_:TSingle3D );
begin
     X.d := d_.X;
     Y.d := d_.Y;
     Z.d := d_.Z;
end;

function TdSingle3D.GetSiz2 :TdSingle;
begin
     Result := Pow2( X ) + Pow2( Y ) + Pow2( Z );
end;

procedure TdSingle3D.SetSiz2( const Siz2_:TdSingle );
begin
     Self := Roo2( Siz2_ / Siz2 ) * Self;
end;

function TdSingle3D.GetSize :TdSingle;
begin
     Result := Roo2( Siz2 );
end;

procedure TdSingle3D.SetSize( const Size_:TdSingle );
begin
     Self := Size_ * Unitor;
end;

function TdSingle3D.GetUnitor :TdSingle3D;
begin
     Result := Self / Size;
end;

procedure TdSingle3D.SetUnitor( const Unitor_:TdSingle3D );
begin
     Self := Size * Unitor_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TdSingle3D.Create( const X_,Y_,Z_:TdSingle );
begin
     X := X_;
     Y := Y_;
     Z := Z_;
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TdSingle3D.Negative( const V_:TdSingle3D ) :TdSingle3D;
begin
     with Result do
     begin
          X := -V_.X;
          Y := -V_.Y;
          Z := -V_.Z;
     end;
end;

class operator TdSingle3D.Positive( const V_:TdSingle3D ) :TdSingle3D;
begin
     with Result do
     begin
          X := +V_.X;
          Y := +V_.Y;
          Z := +V_.Z;
     end;
end;

class operator TdSingle3D.Add( const A_,B_:TdSingle3D ) :TdSingle3D;
begin
     with Result do
     begin
          X := A_.X + B_.X;
          Y := A_.Y + B_.Y;
          Z := A_.Z + B_.Z;
     end;
end;

class operator TdSingle3D.Subtract( const A_,B_:TdSingle3D ) :TdSingle3D;
begin
     with Result do
     begin
          X := A_.X - B_.X;
          Y := A_.Y - B_.Y;
          Z := A_.Z - B_.Z;
     end;
end;

class operator TdSingle3D.Multiply( const A_:TdSingle3D; const B_:TdSingle ) :TdSingle3D;
begin
     with Result do
     begin
          X := A_.X * B_;
          Y := A_.Y * B_;
          Z := A_.Z * B_;
     end;
end;

class operator TdSingle3D.Multiply( const A_:TdSingle; const B_:TdSingle3D ) :TdSingle3D;
begin
     with Result do
     begin
          X := A_ * B_.X;
          Y := A_ * B_.Y;
          Z := A_ * B_.Z;
     end;
end;

class operator TdSingle3D.Divide( const A_:TdSingle3D; const B_:TdSingle ) :TdSingle3D;
begin
     with Result do
     begin
          X := A_.X / B_;
          Y := A_.Y / B_;
          Z := A_.Z / B_;
     end;
end;

///////////////////////////////////////////////////////////////////////// 型変換

class operator TdSingle3D.Implicit( const V_:TSingle3D ) :TdSingle3D;
const
     _d :TSingle3D = ( X:0; Y:0; Z:0 );
begin
     with Result do
     begin
          o := V_;
          d := _d;
     end;
end;

class operator TdSingle3D.Implicit( const V_:TdSingle3D ) :TSingle3D;
begin
     Result := V_.o;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TdDouble3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TdDouble3D.GetV( const I_:Integer ) :TdDouble;
begin
     Result := _[ I_ ];
end;

procedure TdDouble3D.SetV( const I_:Integer; const V_:TdDouble );
begin
     _[ I_ ] := V_;
end;

//------------------------------------------------------------------------------

function TdDouble3D.Geto :TDouble3D;
begin
     Result.X := X.o;
     Result.Y := Y.o;
     Result.Z := Z.o;
end;

procedure TdDouble3D.Seto( const o_:TDouble3D );
begin
     X.o := o_.X;
     Y.o := o_.Y;
     Z.o := o_.Z;
end;

function TdDouble3D.Getd :TDouble3D;
begin
     Result.X := X.d;
     Result.Y := Y.d;
     Result.Z := Z.d;
end;

procedure TdDouble3D.Setd( const d_:TDouble3D );
begin
     X.d := d_.X;
     Y.d := d_.Y;
     Z.d := d_.Z;
end;

function TdDouble3D.GetSiz2 :TdDouble;
begin
     Result := Pow2( X ) + Pow2( Y ) + Pow2( Z );
end;

procedure TdDouble3D.SetSiz2( const Siz2_:TdDouble );
begin
     Self := Roo2( Siz2_ / Siz2 ) * Self;
end;

function TdDouble3D.GetSize :TdDouble;
begin
     Result := Roo2( Siz2 );
end;

procedure TdDouble3D.SetSize( const Size_:TdDouble );
begin
     Self := Size_ * Unitor;
end;

function TdDouble3D.GetUnitor :TdDouble3D;
begin
     Result := Self / Size;
end;

procedure TdDouble3D.SetUnitor( const Unitor_:TdDouble3D );
begin
     Self := Size * Unitor_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TdDouble3D.Create( const X_,Y_,Z_:TdDouble );
begin
     X := X_;
     Y := Y_;
     Z := Z_;
end;

///////////////////////////////////////////////////////////////////////// 演算子

class operator TdDouble3D.Negative( const V_:TdDouble3D ) :TdDouble3D;
begin
     with Result do
     begin
          X := -V_.X;
          Y := -V_.Y;
          Z := -V_.Z;
     end;
end;

class operator TdDouble3D.Positive( const V_:TdDouble3D ) :TdDouble3D;
begin
     with Result do
     begin
          X := +V_.X;
          Y := +V_.Y;
          Z := +V_.Z;
     end;
end;

class operator TdDouble3D.Add( const A_,B_:TdDouble3D ) :TdDouble3D;
begin
     with Result do
     begin
          X := A_.X + B_.X;
          Y := A_.Y + B_.Y;
          Z := A_.Z + B_.Z;
     end;
end;

class operator TdDouble3D.Subtract( const A_,B_:TdDouble3D ) :TdDouble3D;
begin
     with Result do
     begin
          X := A_.X - B_.X;
          Y := A_.Y - B_.Y;
          Z := A_.Z - B_.Z;
     end;
end;

class operator TdDouble3D.Multiply( const A_:TdDouble3D; const B_:TdDouble ) :TdDouble3D;
begin
     with Result do
     begin
          X := A_.X * B_;
          Y := A_.Y * B_;
          Z := A_.Z * B_;
     end;
end;

class operator TdDouble3D.Multiply( const A_:TdDouble; const B_:TdDouble3D ) :TdDouble3D;
begin
     with Result do
     begin
          X := A_ * B_.X;
          Y := A_ * B_.Y;
          Z := A_ * B_.Z;
     end;
end;

class operator TdDouble3D.Divide( const A_:TdDouble3D; const B_:TdDouble ) :TdDouble3D;
begin
     with Result do
     begin
          X := A_.X / B_;
          Y := A_.Y / B_;
          Z := A_.Z / B_;
     end;
end;

///////////////////////////////////////////////////////////////////////// 型変換

class operator TdDouble3D.Implicit( const V_:TDouble3D ) :TdDouble3D;
const
     _d :TDouble3D = ( X:0; Y:0; Z:0 );
begin
     with Result do
     begin
          o := V_;
          d := _d;
     end;
end;

class operator TdDouble3D.Implicit( const V_:TdDouble3D ) :TDouble3D;
begin
     Result := V_.o;
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

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleArea3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TSingleArea3D.GetPoin( const I_:Integer ) :TSingle3D;
begin
     case I_ of
       0: Result := TSingle3D.Create( Min.X, Min.Y, Min.Z );
       1: Result := TSingle3D.Create( Max.X, Min.Y, Min.Z );
       2: Result := TSingle3D.Create( Min.X, Max.Y, Min.Z );
       3: Result := TSingle3D.Create( Max.X, Max.Y, Min.Z );
       4: Result := TSingle3D.Create( Min.X, Min.Y, Max.Z );
       5: Result := TSingle3D.Create( Max.X, Min.Y, Max.Z );
       6: Result := TSingle3D.Create( Min.X, Max.Y, Max.Z );
       7: Result := TSingle3D.Create( Max.X, Max.Y, Max.Z );
     end;
end;

//------------------------------------------------------------------------------

function TSingleArea3D.GetSign :ShortInt;
var
   SX, SY, SZ :Byte;
begin
     SX := 1 + System.Math.Sign( Max.X - Min.X );
     SY := 1 + System.Math.Sign( Max.Y - Min.Y );
     SZ := 1 + System.Math.Sign( Max.Z - Min.Z );

     case SZ * SY * SX of
       0: Result := -1;
       1: Result :=  0;
       8: Result := +2;
     else Result := +1;
     end;
end;

//------------------------------------------------------------------------------

function TSingleArea3D.GetSizeX :Single;
begin
     Result := Max.X - Min.X;
end;

function TSingleArea3D.GetSizeY :Single;
begin
     Result := Max.Y - Min.Y;
end;

function TSingleArea3D.GetSizeZ :Single;
begin
     Result := Max.Z - Min.Z;
end;

//------------------------------------------------------------------------------

function TSingleArea3D.GetProjX :TSingleArea;
begin
     Result := TSingleArea.Create( Min.X, Max.X );
end;

procedure TSingleArea3D.SetProjX( const ProjX_:TSingleArea );
begin
     Min.X := ProjX_.Min;
     Max.X := ProjX_.Max;
end;

function TSingleArea3D.GetProjY :TSingleArea;
begin
     Result := TSingleArea.Create( Min.Y, Max.Y );
end;

procedure TSingleArea3D.SetProjY( const ProjY_:TSingleArea );
begin
     Min.Y := ProjY_.Min;
     Max.Y := ProjY_.Max;
end;

function TSingleArea3D.GetProjZ :TSingleArea;
begin
     Result := TSingleArea.Create( Min.Z, Max.Z );
end;

procedure TSingleArea3D.SetProjZ( const ProjZ_:TSingleArea );
begin
     Min.Z := ProjZ_.Min;
     Max.Z := ProjZ_.Max;
end;

//------------------------------------------------------------------------------

function TSingleArea3D.GetCenter :TSingle3D;
begin
     with Result do
     begin
          X := ( Min.X + Max.X ) / 2;
          Y := ( Min.Y + Max.Y ) / 2;
          Z := ( Min.Z + Max.Z ) / 2;
     end;
end;

//------------------------------------------------------------------------------

function TSingleArea3D.GetProjXY :TSingleArea2D;
begin
     Result := TSingleArea2D.Create( Min.X, Min.Y,
                                     Max.X, Max.Y );
end;

function TSingleArea3D.GetProjYZ :TSingleArea2D;
begin
     Result := TSingleArea2D.Create( Min.Y, Min.Z,
                                     Max.Y, Max.Z );
end;

function TSingleArea3D.GetProjZX :TSingleArea2D;
begin
     Result := TSingleArea2D.Create( Min.Z, Min.X,
                                     Max.Z, Max.X );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TSingleArea3D.Create( const Min_,Max_:Single );
begin
     Create( Min_, Min_, Min_,
             Max_, Max_, Max_ );
end;

constructor TSingleArea3D.Create( const MinX_,MinY_,MinZ_,
                                        MaxX_,MaxY_,MaxZ_:Single );
begin
     with Min do
     begin
          X := MinX_;
          Y := MinY_;
          Z := MinZ_;
     end;

     with Max do
     begin
          X := MaxX_;
          Y := MaxY_;
          Z := MaxZ_;
     end;
end;

constructor TSingleArea3D.Create( const Min_,Max_:TSingle3D );
begin
     Min := Min_;
     Max := Max_;
end;

/////////////////////////////////////////////////////////////////////////// 定数

class function TSingleArea3D.NeInf :TSingleArea3D;
begin
     Result := TSingleArea3D.Create( Single.PositiveInfinity,
                                     Single.NegativeInfinity );
end;

class function TSingleArea3D.NeMax :TSingleArea3D;
begin
     Result := TSingleArea3D.Create( +Single.MaxValue,
                                     -Single.MaxValue );
end;

class function TSingleArea3D.Zero :TSingleArea3D;
begin
     Result := TSingleArea3D.Create( 0, 0 );
end;

class function TSingleArea3D.PoMax :TSingleArea3D;
begin
     Result := TSingleArea3D.Create( -Single.MaxValue,
                                     +Single.MaxValue );
end;

class function TSingleArea3D.PoInf :TSingleArea3D;
begin
     Result := TSingleArea3D.Create( Single.NegativeInfinity,
                                     Single.PositiveInfinity );
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TSingleArea3D.ProjVec( const Vec_:TSingle3D ) :TSingleArea;
var
   I0, I1 :Byte;
begin
     I1 := Vec_.Orthant;
     I0 := I1 xor 7;

     with Result do
     begin
          Min := DotProduct( Vec_, Poin[ I0 ] );
          Max := DotProduct( Vec_, Poin[ I1 ] );
     end;
end;

//------------------------------------------------------------------------------

function TSingleArea3D.Collision( const Area_:TSingleArea3D ) :Boolean;
begin
     Result := ProjX.Collision( Area_.ProjX )
           and ProjY.Collision( Area_.ProjY )
           and ProjZ.Collision( Area_.ProjZ );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleArea3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TDoubleArea3D.GetPoin( const I_:Integer ) :TDouble3D;
begin
     case I_ of
       0: Result := TDouble3D.Create( Min.X, Min.Y, Min.Z );
       1: Result := TDouble3D.Create( Max.X, Min.Y, Min.Z );
       2: Result := TDouble3D.Create( Min.X, Max.Y, Min.Z );
       3: Result := TDouble3D.Create( Max.X, Max.Y, Min.Z );
       4: Result := TDouble3D.Create( Min.X, Min.Y, Max.Z );
       5: Result := TDouble3D.Create( Max.X, Min.Y, Max.Z );
       6: Result := TDouble3D.Create( Min.X, Max.Y, Max.Z );
       7: Result := TDouble3D.Create( Max.X, Max.Y, Max.Z );
     end;
end;

//------------------------------------------------------------------------------

function TDoubleArea3D.GetSign :ShortInt;
var
   SX, SY, SZ :Byte;
begin
     SX := 1 + System.Math.Sign( Max.X - Min.X );
     SY := 1 + System.Math.Sign( Max.Y - Min.Y );
     SZ := 1 + System.Math.Sign( Max.Z - Min.Z );

     case SZ * SY * SX of
       0: Result := -1;
       1: Result :=  0;
       8: Result := +2;
     else Result := +1;
     end;
end;

//------------------------------------------------------------------------------

function TDoubleArea3D.GetSizeX :Double;
begin
     Result := Max.X - Min.X;
end;

function TDoubleArea3D.GetSizeY :Double;
begin
     Result := Max.Y - Min.Y;
end;

function TDoubleArea3D.GetSizeZ :Double;
begin
     Result := Max.Z - Min.Z;
end;

//------------------------------------------------------------------------------

function TDoubleArea3D.GetProjX :TDoubleArea;
begin
     Result := TDoubleArea.Create( Min.X, Max.X );
end;

procedure TDoubleArea3D.SetProjX( const ProjX_:TDoubleArea );
begin
     Min.X := ProjX_.Min;
     Max.X := ProjX_.Max;
end;

function TDoubleArea3D.GetProjY :TDoubleArea;
begin
     Result := TDoubleArea.Create( Min.Y, Max.Y );
end;

procedure TDoubleArea3D.SetProjY( const ProjY_:TDoubleArea );
begin
     Min.Y := ProjY_.Min;
     Max.Y := ProjY_.Max;
end;

function TDoubleArea3D.GetProjZ :TDoubleArea;
begin
     Result := TDoubleArea.Create( Min.Z, Max.Z );
end;

procedure TDoubleArea3D.SetProjZ( const ProjZ_:TDoubleArea );
begin
     Min.Z := ProjZ_.Min;
     Max.Z := ProjZ_.Max;
end;

//------------------------------------------------------------------------------

function TDoubleArea3D.GetCenter :TDouble3D;
begin
     with Result do
     begin
          X := ( Min.X + Max.X ) / 2;
          Y := ( Min.Y + Max.Y ) / 2;
          Z := ( Min.Z + Max.Z ) / 2;
     end;
end;

//------------------------------------------------------------------------------

function TDoubleArea3D.GetProjXY :TDoubleArea2D;
begin
     Result := TDoubleArea2D.Create( Min.X, Min.Y,
                                     Max.X, Max.Y );
end;

function TDoubleArea3D.GetProjYZ :TDoubleArea2D;
begin
     Result := TDoubleArea2D.Create( Min.Y, Min.Z,
                                     Max.Y, Max.Z );
end;

function TDoubleArea3D.GetProjZX :TDoubleArea2D;
begin
     Result := TDoubleArea2D.Create( Min.Z, Min.X,
                                     Max.Z, Max.X );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TDoubleArea3D.Create( const Min_,Max_:Double );
begin
     Create( Min_, Min_, Min_,
             Max_, Max_, Max_ );
end;

constructor TDoubleArea3D.Create( const MinX_,MinY_,MinZ_,
                                        MaxX_,MaxY_,MaxZ_:Double );
begin
     with Min do
     begin
          X := MinX_;
          Y := MinY_;
          Z := MinZ_;
     end;

     with Max do
     begin
          X := MaxX_;
          Y := MaxY_;
          Z := MaxZ_;
     end;
end;

constructor TDoubleArea3D.Create( const Min_,Max_:TDouble3D );
begin
     Min := Min_;
     Max := Max_;
end;

/////////////////////////////////////////////////////////////////////////// 定数

class function TDoubleArea3D.NeInf :TDoubleArea3D;
begin
     Result := TDoubleArea3D.Create( Double.PositiveInfinity,
                                     Double.NegativeInfinity );
end;

class function TDoubleArea3D.NeMax :TDoubleArea3D;
begin
     Result := TDoubleArea3D.Create( +Double.MaxValue,
                                     -Double.MaxValue );
end;

class function TDoubleArea3D.Zero :TDoubleArea3D;
begin
     Result := TDoubleArea3D.Create( 0, 0 );
end;

class function TDoubleArea3D.PoMax :TDoubleArea3D;
begin
     Result := TDoubleArea3D.Create( -Double.MaxValue,
                                     +Double.MaxValue );
end;

class function TDoubleArea3D.PoInf :TDoubleArea3D;
begin
     Result := TDoubleArea3D.Create( Double.NegativeInfinity,
                                     Double.PositiveInfinity );
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TDoubleArea3D.ProjVec( const Vec_:TDouble3D ) :TDoubleArea;
var
   I0, I1 :Byte;
begin
     I1 := Vec_.Orthant;
     I0 := I1 xor 7;

     with Result do
     begin
          Min := DotProduct( Vec_, Poin[ I0 ] );
          Max := DotProduct( Vec_, Poin[ I1 ] );
     end;
end;

//------------------------------------------------------------------------------

function TDoubleArea3D.Collision( const Area_:TDoubleArea3D ) :Boolean;
begin
     Result := ProjX.Collision( Area_.ProjX )
           and ProjY.Collision( Area_.ProjY )
           and ProjZ.Collision( Area_.ProjZ );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSingleRay3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TSingleRay3D.GetUnitor :TSingleRay3D;
begin
     Result.Pos := Pos       ;
     Result.Vec := Vec.Unitor;
end;

procedure TSingleRay3D.SetUnitor( const Unitor_:TSingleRay3D );
begin
     Pos :=            Unitor_.Pos;
     Vec := Vec.Size * Unitor_.Vec;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

function TSingleRay3D.GoPos( const Len_:Single ) :TSingle3D;
begin
     Result := Len_ * Vec + Pos;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDoubleRay3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// アクセス

function TDoubleRay3D.GetUnitor :TDoubleRay3D;
begin
     Result.Pos := Pos       ;
     Result.Vec := Vec.Unitor;
end;

procedure TDoubleRay3D.SetUnitor( const Unitor_:TDoubleRay3D );
begin
     Pos :=            Unitor_.Pos;
     Vec := Vec.Size * Unitor_.Vec;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

function TDoubleRay3D.GoPos( const Len_:Double ) :TDouble3D;
begin
     Result := Len_ * Vec + Pos;
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

function DotProduct( const A_,B_:TdSingleVec3D ) :TdSingle;
begin
     Result := A_.X * B_.X
             + A_.Y * B_.Y
             + A_.Z * B_.Z;
end;

function DotProduct( const A_,B_:TdDoubleVec3D ) :TdDouble;
begin
     Result := A_.X * B_.X
             + A_.Y * B_.Y
             + A_.Z * B_.Z;
end;

//------------------------------------------------------------------------------

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

function CrossProduct( const A_,B_:TdSingleVec3D ) :TdSingleVec3D;
begin
     with Result do
     begin
          X := A_.Y * B_.Z - A_.Z * B_.Y;
          Y := A_.Z * B_.X - A_.X * B_.Z;
          Z := A_.X * B_.Y - A_.Y * B_.X;
     end;
end;

function CrossProduct( const A_,B_:TdDoubleVec3D ) :TdDoubleVec3D;
begin
     with Result do
     begin
          X := A_.Y * B_.Z - A_.Z * B_.Y;
          Y := A_.Z * B_.X - A_.X * B_.Z;
          Z := A_.X * B_.Y - A_.Y * B_.X;
     end;
end;

//------------------------------------------------------------------------------

function Distanc2( const A_,B_:TSinglePos3D ) :Single;
begin
     Result := Pow2( B_.X - A_.X )
             + Pow2( B_.Y - A_.Y )
             + Pow2( B_.Z - A_.Z );
end;

function Distanc2( const A_,B_:TDoublePos3D ) :Double;
begin
     Result := Pow2( B_.X - A_.X )
             + Pow2( B_.Y - A_.Y )
             + Pow2( B_.Z - A_.Z );
end;

function Distance( const A_,B_:TSinglePos3D ) :Single;
begin
     Result := Roo2( Distanc2( A_, B_ ) );
end;

function Distance( const A_,B_:TDoublePos3D ) :Double;
begin
     Result := Roo2( Distanc2( A_, B_ ) );
end;

function Distanc2( const A_,B_:TdSinglePos3D ) :TdSingle;
begin
     Result := Pow2( B_.X - A_.X )
             + Pow2( B_.Y - A_.Y )
             + Pow2( B_.Z - A_.Z );
end;

function Distanc2( const A_,B_:TdDoublePos3D ) :TdDouble;
begin
     Result := Pow2( B_.X - A_.X )
             + Pow2( B_.Y - A_.Y )
             + Pow2( B_.Z - A_.Z );
end;

function Distance( const A_,B_:TdSinglePos3D ) :TdSingle;
begin
     Result := Roo2( Distanc2( A_, B_ ) );
end;

function Distance( const A_,B_:TdDoublePos3D ) :TdDouble;
begin
     Result := Roo2( Distanc2( A_, B_ ) );
end;

//------------------------------------------------------------------------------

function Ave( const P1_,P2_:TSingle3D ) :TSingle3D;
begin
     Result := ( P1_ + P2_ ) / 2;
end;

function Ave( const P1_,P2_:TDouble3D ) :TDouble3D;
begin
     Result := ( P1_ + P2_ ) / 2;
end;

function Ave( const P1_,P2_,P3_:TSingle3D ) :TSingle3D;
begin
     Result := ( P1_ + P2_ + P3_ ) / 3;
end;

function Ave( const P1_,P2_,P3_:TDouble3D ) :TDouble3D;
begin
     Result := ( P1_ + P2_ + P3_ ) / 3;
end;

function Ave( const P1_,P2_,P3_,P4_:TSingle3D ) :TSingle3D;
begin
     Result := ( P1_ + P2_ + P3_ + P4_ ) / 4;
end;

function Ave( const P1_,P2_,P3_,P4_:TDouble3D ) :TDouble3D;
begin
     Result := ( P1_ + P2_ + P3_ + P4_ ) / 4;
end;

function Ave( const P1_,P2_:TdSingle3D ) :TdSingle3D;
begin
     Result := ( P1_ + P2_ ) / 2;
end;

function Ave( const P1_,P2_:TdDouble3D ) :TdDouble3D;
begin
     Result := ( P1_ + P2_ ) / 2;
end;

function Ave( const P1_,P2_,P3_:TdSingle3D ) :TdSingle3D;
begin
     Result := ( P1_ + P2_ + P3_ ) / 3;
end;

function Ave( const P1_,P2_,P3_:TdDouble3D ) :TdDouble3D;
begin
     Result := ( P1_ + P2_ + P3_ ) / 3;
end;

function Ave( const P1_,P2_,P3_,P4_:TdSingle3D ) :TdSingle3D;
begin
     Result := ( P1_ + P2_ + P3_ + P4_ ) / 4;
end;

function Ave( const P1_,P2_,P3_,P4_:TdDouble3D ) :TdDouble3D;
begin
     Result := ( P1_ + P2_ + P3_ + P4_ ) / 4;
end;

//------------------------------------------------------------------------------

function Nabla( const Func_:TConstFunc<TdSingle3D,TdSingle>; const P_:TSingle3D ) :TSingle3D;
var
   P, F :TdSingle3D;
begin
     P.o := P_;

     P.d := TSingle3D.Create( 1, 0, 0 );  F.X := Func_( P );
     P.d := TSingle3D.Create( 0, 1, 0 );  F.Y := Func_( P );
     P.d := TSingle3D.Create( 0, 0, 1 );  F.Z := Func_( P );

     Result.X := F.X.d;
     Result.Y := F.Y.d;
     Result.Z := F.Z.d;
end;

function Nabla( const Func_:TConstFunc<TdDouble3D,TdDouble>; const P_:TDouble3D ) :TDouble3D;
var
   P, F :TdDouble3D;
begin
     P.o := P_;

     P.d := TDouble3D.Create( 1, 0, 0 );  F.X := Func_( P );
     P.d := TDouble3D.Create( 0, 1, 0 );  F.Y := Func_( P );
     P.d := TDouble3D.Create( 0, 0, 1 );  F.Z := Func_( P );

     Result.X := F.X.d;
     Result.Y := F.Y.d;
     Result.Z := F.Z.d;
end;

//------------------------------------------------------------------------------

function PolySolveReal( const Ks_:TSingle3D; out Xs_:TSingle2D ) :Byte;
var
   X1, D, A2, D2 :Single;
begin
     if Ks_[ 3 ] = 0 then
     begin
          Result := PolySolveReal( TSingle2D( Ks_ ), X1 );

          Xs_[ 1 ] := X1;
     end
     else
     begin
          D := Pow2( Ks_[ 2 ] ) - 4 * Ks_[ 3 ] * Ks_[ 1 ];

          Result := 1 + Sign( D );

          A2 := 2 * Ks_[ 3 ];

          case Result of
            1: Xs_[ 1 ] := -Ks_[ 2 ] / A2;
            2: begin
                    D2 := Roo2( D );

                    Xs_[ 1 ] := ( -Ks_[ 2 ] - D2 ) / A2;
                    Xs_[ 2 ] := ( -Ks_[ 2 ] + D2 ) / A2;
               end;
          end;
     end;
end;

function PolySolveReal( const Ks_:TDouble3D; out Xs_:TDouble2D ) :Byte;
var
   X1, D, A2, D2 :Double;
begin
     if Ks_[ 3 ] = 0 then
     begin
          Result := PolySolveReal( TDouble2D( Ks_ ), X1 );

          Xs_[ 1 ] := X1;
     end
     else
     begin
          D := Pow2( Ks_[ 2 ] ) - 4 * Ks_[ 3 ] * Ks_[ 1 ];

          Result := 1 + Sign( D );

          A2 := 2 * Ks_[ 3 ];

          case Result of
            1: Xs_[ 1 ] := -Ks_[ 2 ] / A2;
            2: begin
                    D2 := Roo2( D );

                    Xs_[ 1 ] := ( -Ks_[ 2 ] - D2 ) / A2;
                    Xs_[ 2 ] := ( -Ks_[ 2 ] + D2 ) / A2;
               end;
          end;
     end;
end;

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
