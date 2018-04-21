unit LUX.Data.Dictionary;

interface //#################################################################### ■

uses System.Generics.Collections,
     LUX;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TIndexPort<_TValue_>

     TIndexPort<_TValue_> = record
     private
     public
       Index :Integer;
       Value :_TValue_;
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TIndexDictionary<_TKey_,_TVal_>

     TIndexDictionary<_TKey_,_TVal_> = class( TDictionary<_TKey_,TIndexPort<_TVal_>> )
     private
     protected
     public
       constructor Create( Capacity_:Integer = 0 );
       destructor Destroy; override;
       ///// プロパティ
       ///// メソッド
       procedure Add( const Key_:_TKey_; const Val_:_TVal_ );
       procedure Del( const Key_:_TKey_ );
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TIndexDictionary<_TKey_,_TVal_>

constructor TIndexDictionary<_TKey_,_TVal_>.Create( Capacity_:Integer = 0 );
begin
     inherited;

end;

destructor TIndexDictionary<_TKey_,_TVal_>.Destroy;
begin

     inherited;
end;

procedure TIndexDictionary<_TKey_,_TVal_>.Add( const Key_:_TKey_; const Val_:_TVal_ );
var
   V :TIndexPort<_TVal_>;
begin
     if ContainsKey( Key_ ) then
     begin
          V := Self[ Key_ ];

          V.Value := Val_;

          inherited AddOrSetValue( Key_, V );
     end
     else
     begin
          V.Index := Count;
          V.Value := Val_;

          inherited Add( Key_, V );
     end;
end;

procedure TIndexDictionary<_TKey_,_TVal_>.Del( const Key_:_TKey_ );
begin

end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
