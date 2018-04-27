unit LUX.Data.Lattice;

interface //#################################################################### ■

uses System.SysUtils,
     LUX;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TCoreArray<_TElem_>

     ICoreArray = interface
     ['{C9E5529F-E994-416A-935E-D2370D376792}']
       ///// アクセス
       function GetElemByte :Integer;
       function GetElemsN :Integer;
       procedure SetElemsN( const ElemsN_:Integer );
       function GetElemsByte :Integer;
       function GetElem0P :Pointer;
       ///// プロパティ
       property ElemByte  :Integer read GetElemByte                 ;
       property ElemsN    :Integer read GetElemsN    write SetElemsN;
       property ElemsByte :Integer read GetElemsByte                ;
       property Elem0P    :Pointer read GetElem0P                   ;
     end;

     //-------------------------------------------------------------------------

     TCoreArray<_TElem_> = class( TInterfacedBase, ICoreArray )
     public
       type _PElem_ = ^_TElem_;
     protected
       _Elems :TArray<_TElem_>;
       ///// アクセス
       function GetElemByte :Integer;
       function GetElemsN :Integer; virtual;
       procedure SetElemsN( const ElemsN_:Integer );
       function GetElemsByte :Integer;
       function GetElems( const I_:Integer ) :_TElem_;
       procedure SetElems( const I_:Integer; const Elem_:_TElem_ );
       function GetElemsP( const I_:Integer ) :_PElem_;
       function GetElem0P :Pointer;
       ///// メソッド
       procedure MakeArray; virtual;
     public
       ///// イベント
       _OnChange :TProc;
     public
       constructor Create; overload;
       constructor Create( const ElemsX_:Integer ); overload;
       procedure AfterConstruction; override;
       destructor Destroy; override;
       ///// プロパティ
       property ElemByte                   :Integer read GetElemByte                 ;
       property ElemsN                     :Integer read GetElemsN    write SetElemsN;
       property ElemsByte                  :Integer read GetElemsByte                ;
       property Elems[ const I_:Integer ]  :_TElem_ read GetElems     write SetElems ; default;
       property ElemsP[ const I_:Integer ] :_PElem_ read GetElemsP                   ;
       property Elem0P                     :Pointer read GetElem0P                   ;
       ///// メソッド
       class procedure Swap( var Array0_,Array1_:TCoreArray<_TElem_> ); static;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TCoreArray<_TElem_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// メソッド

procedure TCoreArray<_TElem_>.MakeArray;
begin
     ElemsN := ElemsN;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TCoreArray<_TElem_>.GetElemByte :Integer;
begin
     Result := SizeOf( _TElem_ );
end;

//------------------------------------------------------------------------------

function TCoreArray<_TElem_>.GetElemsN :Integer;
begin
     Result := Length( _Elems );
end;

procedure TCoreArray<_TElem_>.SetElemsN( const ElemsN_:Integer );
begin
     SetLength( _Elems, ElemsN_ );

     _OnChange;
end;

//------------------------------------------------------------------------------

function TCoreArray<_TElem_>.GetElemsByte :Integer;
begin
     Result := ElemByte * ElemsN;
end;

//------------------------------------------------------------------------------

function TCoreArray<_TElem_>.GetElems( const I_:Integer ) :_TElem_;
begin
     Result := _Elems[ I_ ];
end;

procedure TCoreArray<_TElem_>.SetElems( const I_:Integer; const Elem_:_TElem_ );
begin
     _Elems[ I_ ] := Elem_;
end;

function TCoreArray<_TElem_>.GetElemsP( const I_:Integer ) :_PElem_;
begin
     Result := @_Elems[ I_ ];
end;

function TCoreArray<_TElem_>.GetElem0P :Pointer;
begin
     Result := GetElemsP( 0 );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TCoreArray<_TElem_>.Create;
begin
     Create( 0 );
end;

constructor TCoreArray<_TElem_>.Create( const ElemsX_:Integer );
begin
     inherited Create;

     _OnChange := procedure begin end;
end;

procedure TCoreArray<_TElem_>.AfterConstruction;
begin
     MakeArray;
end;

destructor TCoreArray<_TElem_>.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

class procedure TCoreArray<_TElem_>.Swap( var Array0_,Array1_:TCoreArray<_TElem_> );
var
   A :TCoreArray<_TElem_>;
begin
     A := Array0_;  Array0_ := Array1_;  Array1_ := A;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
