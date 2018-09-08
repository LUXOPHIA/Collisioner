unit LUX.Data.Dictionary;

interface //#################################################################### ■

uses System.SysUtils, System.Generics.Collections,
     LUX;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     TDictItem<_TKey_,_TValue_>        = class;

     TIndexDictionary<_TKey_,_TValue_> = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDictItem<_TKey_,_TValue_>

     TDictItem<_TKey_,_TValue_> = class
     private
     protected
       _Paren :TIndexDictionary<_TKey_,_TValue_>;
       _Key   :_TKey_;
       _Order :Integer;
       _Value :_TValue_;
       ///// アクセス
       function GetParen :TIndexDictionary<_TKey_,_TValue_>;
       function GetKey :_TKey_;
       function GetOrder :Integer;
       function GetValue :_TValue_;
       procedure SetValue( const Value_:_TValue_ );
     public
       constructor Create( const Paren_:TIndexDictionary<_TKey_,_TValue_> );
       destructor Destroy; override;
       ///// プロパティ
       property Paren :TIndexDictionary<_TKey_,_TValue_> read GetParen;
       property Key   :_TKey_                            read GetKey  ;
       property Order :Integer                           read GetOrder;
       property Value :_TValue_                          read GetValue write SetValue;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TIndexDictionary<_TKey_,_TValue_>

     TIndexDictionary<_TKey_,_TValue_> = class( TObjectDictionary<_TKey_,TDictItem<_TKey_,_TValue_>> )
     private
     protected
       ///// イベント
       _OnChange :TConstProc<TDictItem<_TKey_,_TValue_>>;
     public
       constructor Create( Capacity_:Integer = 0 );
       destructor Destroy; override;
       ///// メソッド
       procedure Add( const Key_:_TKey_; const Value_:_TValue_ );
       procedure Del( const Key_:_TKey_ );
       ///// イベント
       property OnChange :TConstProc<TDictItem<_TKey_,_TValue_>> read _OnChange write _OnChange;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDictItem<_TKey_,_TValue_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

function TDictItem<_TKey_,_TValue_>.GetParen :TIndexDictionary<_TKey_,_TValue_>;
begin
     Result := Paren;
end;

function TDictItem<_TKey_,_TValue_>.GetKey :_TKey_;
begin
     Result := _Key;
end;

function TDictItem<_TKey_,_TValue_>.GetOrder :Integer;
begin
     Result := _Order;
end;

function TDictItem<_TKey_,_TValue_>.GetValue :_TValue_;
begin
     Result := _Value;
end;

procedure TDictItem<_TKey_,_TValue_>.SetValue( const Value_:_TValue_ );
begin
     _Value := Value_;

     with _Paren do
     begin
          if Assigned( _OnChange ) then _OnChange( Self );
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TDictItem<_TKey_,_TValue_>.Create( const Paren_:TIndexDictionary<_TKey_,_TValue_> );
begin
     inherited Create;

     _Paren := Paren_;

     with _Paren do
     begin
          if Assigned( _OnChange ) then _OnChange( Self );
     end;
end;

destructor TDictItem<_TKey_,_TValue_>.Destroy;
begin
     with _Paren do
     begin
          if Assigned( _OnChange ) then _OnChange( Self );
     end;

     inherited;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TIndexDictionary<_TKey_,_TValue_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

constructor TIndexDictionary<_TKey_,_TValue_>.Create( Capacity_:Integer = 0 );
begin
     inherited Create( [ doOwnsValues ], Capacity_ );

end;

destructor TIndexDictionary<_TKey_,_TValue_>.Destroy;
begin

     inherited;
end;

procedure TIndexDictionary<_TKey_,_TValue_>.Add( const Key_:_TKey_; const Value_:_TValue_ );
var
   V :TDictItem<_TKey_,_TValue_>;
begin
     if ContainsKey( Key_ ) then Items[ Key_ ].Value := Value_
     else
     begin
          V := TDictItem<_TKey_,_TValue_>.Create( Self );

          V._Order := Count;
          V._Value := Value_;

          inherited Add( Key_, V );
     end;
end;

procedure TIndexDictionary<_TKey_,_TValue_>.Del( const Key_:_TKey_ );
begin
     Remove( Key_ );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
