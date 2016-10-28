unit LUX.Brep.Wire;

interface //#################################################################### ■

uses LUX, LUX.Graph.Tree, LUX.Brep.Poin;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TWire<_TPos_>

     TWire<_TPos_ :record;
           _TPoin_:TPoin<_TPos_>> = class( TTreeLeaf<TTreeNode> )
     private
     protected
       _Poin0 :_TPoin_;
       _Poin1 :_TPoin_;
       ///// アクセス
       function GetPoin0 :_TPoin_; virtual;
       procedure SetPoin0( const Poin0_:_TPoin_ ); virtual;
       function GetPoin1 :_TPoin_; virtual;
       procedure SetPoin1( const Poin1_:_TPoin_ ); virtual;
     public
       ///// プロパティ
       property Poin0 :_TPoin_ read GetPoin0 write SetPoin0;
       property Poin1 :_TPoin_ read GetPoin1 write SetPoin1;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TWireModel<_TPos_,_TPoin_,_TWire_>

     TWireModel<_TPos_ :record;
                _TPoin_:TPoin<_TPos_>;
                _TWire_:TWire<_TPos_,_TPoin_>> = class( TTreeRoot<_TWire_> )
     private
     protected
       _PoinModel :TPoinModel<_TPos_,_TPoin_>;
     public
       constructor Create; override;
       destructor Destroy; override;
       ///// プロパティ
       property PoinModel :TPoinModel<_TPos_,_TPoin_> read _PoinModel;
       ///// メソッド
       procedure DeleteChilds; override;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TWire<_TPos_,_TPoin_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TWire<_TPos_,_TPoin_>.GetPoin0 :_TPoin_;
begin
     Result := _Poin0;
end;

procedure TWire<_TPos_,_TPoin_>.SetPoin0( const Poin0_:_TPoin_ );
begin
     _Poin0 := Poin0_;
end;

function TWire<_TPos_,_TPoin_>.GetPoin1 :_TPoin_;
begin
     Result := _Poin1;
end;

procedure TWire<_TPos_,_TPoin_>.SetPoin1( const Poin1_:_TPoin_ );
begin
     _Poin1 := Poin1_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TWireModel<_TPos_,_TPoin_,_TWire_>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TWireModel<_TPos_,_TPoin_,_TWire_>.Create;
begin
     inherited;

     _PoinModel := TPoinModel<_TPos_,_TPoin_>.Create;
end;

destructor TWireModel<_TPos_,_TPoin_,_TWire_>.Destroy;
begin
     _PoinModel.Free;

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TWireModel<_TPos_,_TPoin_,_TWire_>.DeleteChilds;
begin
     inherited DeleteChilds;

     PoinModel.DeleteChilds;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
