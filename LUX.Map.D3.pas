unit LUX.Map.D3;

interface //#################################################################### ■

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TArray3D<T_Item>

     TArray3D<T_Item> = class
     private
       _AllX :Integer;
       _AllY :Integer;
       _AllZ :Integer;
       ///// メソッド
       procedure MakeArray;
       function XYZtoI( const X_,Y_,Z_:Integer ) :Integer; inline;
     protected
       _CountX  :Integer;
       _CountY  :Integer;
       _CountZ  :Integer;
       _MarginX :Integer;
       _MarginY :Integer;
       _MarginZ :Integer;
       _Item    :array of T_Item;
       ///// アクセス
       procedure SetCountX( const CountX_:Integer );
       procedure SetCountY( const CountY_:Integer );
       procedure SetCountZ( const CountZ_:Integer );
       procedure SetMarginX( const MarginX_:Integer );
       procedure SetMarginY( const MarginY_:Integer );
       procedure SetMarginZ( const MarginZ_:Integer );
       function GetItem( const X_,Y_,Z_:Integer ) :T_Item;
       procedure SetItem( const X_,Y_,Z_:Integer; const Item_:T_Item );
     public
       constructor Create; overload;
       constructor Create( const CountX_,CountY_,CountZ_:Integer ); overload;
       constructor Create( const CountX_,CountY_,CountZ_,Margin_:Integer ); overload;
       constructor Create( const CountX_,CountY_,CountZ_,MarginX_,MarginY_,MarginZ_:Integer ); overload;
       procedure AfterConstruction; override;
       destructor Destroy; override;
       ///// プロパティ
       property CountX                         :Integer read _CountX  write SetCountX;
       property CountY                         :Integer read _CountY  write SetCountY;
       property CountZ                         :Integer read _CountZ  write SetCountZ;
       property MarginX                        :Integer read _MarginX write SetMarginX;
       property MarginY                        :Integer read _MarginY write SetMarginY;
       property MarginZ                        :Integer read _MarginZ write SetMarginZ;
       property Item[ const X_,Y_,Z_:Integer ] :T_Item  read GetItem  write SetItem;    default;
       ///// メソッド
       class procedure Swap( var Array0_,Array1_:TArray3D<T_Item> ); static;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGridMap3D<T_Item>

     TGridMap3D<T_Item> = class( TArray3D<T_Item> )
     private
     protected
       ///// アクセス
       function GetDivX :Integer;
       procedure SetDivX( const DivX_:Integer );
       function GetDivY :Integer;
       procedure SetDivY( const DivY_:Integer );
       function GetDivZ :Integer;
       procedure SetDivZ( const DivZ_:Integer );
     public
       constructor Create; overload;
       constructor Create( const DivX_,DivY_,DivZ_:Integer ); overload;
       constructor Create( const DivX_,DivY_,DivZ_,Margin_:Integer ); overload;
       constructor Create( const DivX_,DivY_,DivZ_,MarginX_,MarginY_,MarginZ_:Integer ); overload;
       destructor Destroy; override;
       ///// プロパティ
       property DivX :Integer read GetDivX write SetDivX;
       property DivY :Integer read GetDivY write SetDivY;
       property DivZ :Integer read GetDivZ write SetDivZ;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TArray3D<T_Item>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

/////////////////////////////////////////////////////////////////////// メソッド

procedure TArray3D<T_Item>.MakeArray;
begin
     _AllX := _MarginX + _CountX + _MarginX;
     _AllY := _MarginY + _CountY + _MarginY;
     _AllZ := _MarginZ + _CountZ + _MarginZ;

     SetLength( _Item, _AllX * _AllY * _AllZ );
end;

function TArray3D<T_Item>.XYZtoI( const X_,Y_,Z_:Integer ) :Integer;
begin
     Result := ( _MarginX + X_ ) + _AllX * ( ( _MarginY + Y_ ) + _AllY * ( _MarginZ + Z_ ) );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

procedure TArray3D<T_Item>.SetCountX( const CountX_:Integer );
begin
     _CountX := CountX_;  MakeArray;
end;

procedure TArray3D<T_Item>.SetCountY( const CountY_:Integer );
begin
     _CountY := CountY_;  MakeArray;
end;

procedure TArray3D<T_Item>.SetCountZ( const CountZ_:Integer );
begin
     _CountZ := CountZ_;  MakeArray;
end;

procedure TArray3D<T_Item>.SetMarginX( const MarginX_:Integer );
begin
     _MarginX := MarginX_;  MakeArray;
end;

procedure TArray3D<T_Item>.SetMarginY( const MarginY_:Integer );
begin
     _MarginY := MarginY_;  MakeArray;
end;

procedure TArray3D<T_Item>.SetMarginZ( const MarginZ_:Integer );
begin
     _MarginZ := MarginZ_;  MakeArray;
end;

function TArray3D<T_Item>.GetItem( const X_,Y_,Z_:Integer ) :T_Item;
begin
     Result := _Item[ XYZtoI( X_, Y_, Z_ ) ];
end;

procedure TArray3D<T_Item>.SetItem( const X_,Y_,Z_:Integer; const Item_:T_Item );
begin
     _Item[ XYZtoI( X_, Y_, Z_ ) ] := Item_;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TArray3D<T_Item>.Create;
begin
     Create( 0, 0, 0 );
end;

constructor TArray3D<T_Item>.Create( const CountX_,CountY_,CountZ_:Integer );
begin
     Create( CountX_, CountY_, CountZ_, 0 );
end;

constructor TArray3D<T_Item>.Create( const CountX_,CountY_,CountZ_,Margin_:Integer );
begin
     Create( CountX_, CountY_, CountZ_, Margin_, Margin_, Margin_ );
end;

constructor TArray3D<T_Item>.Create( const CountX_,CountY_,CountZ_,MarginX_,MarginY_,MarginZ_:Integer );
begin
     inherited Create;

     _CountX  := CountX_;
     _CountY  := CountY_;
     _CountZ  := CountZ_;
     _MarginX := MarginX_;
     _MarginY := MarginY_;
     _MarginZ := MarginZ_;
end;

procedure TArray3D<T_Item>.AfterConstruction;
begin
     MakeArray;
end;

destructor TArray3D<T_Item>.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

class procedure TArray3D<T_Item>.Swap( var Array0_,Array1_:TArray3D<T_Item> );
var
   A :TArray3D<T_Item>;
begin
     A := Array0_;  Array0_ := Array1_;  Array1_ := A;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TGridMap3D<T_Item>

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TGridMap3D<T_Item>.GetDivX :Integer;
begin
     Result := _CountX - 1;
end;

procedure TGridMap3D<T_Item>.SetDivX( const DivX_:Integer );
begin
     _CountX  := DivX_ + 1;  MakeArray;
end;

function TGridMap3D<T_Item>.GetDivY :Integer;
begin
     Result := _CountY - 1;
end;

procedure TGridMap3D<T_Item>.SetDivY( const DivY_:Integer );
begin
     _CountY  := DivY_ + 1;  MakeArray;
end;

function TGridMap3D<T_Item>.GetDivZ :Integer;
begin
     Result := _CountZ - 1;
end;

procedure TGridMap3D<T_Item>.SetDivZ( const DivZ_:Integer );
begin
     _CountZ  := DivZ_ + 1;  MakeArray;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TGridMap3D<T_Item>.Create;
begin
     Create( 0, 0, 0 );
end;

constructor TGridMap3D<T_Item>.Create( const DivX_,DivY_,DivZ_:Integer );
begin
     Create( DivX_, DivY_, DivZ_, 0 );
end;

constructor TGridMap3D<T_Item>.Create( const DivX_,DivY_,DivZ_,Margin_:Integer );
begin
     Create( DivX_, DivY_, DivZ_, Margin_, Margin_, Margin_ );
end;

constructor TGridMap3D<T_Item>.Create( const DivX_,DivY_,DivZ_,MarginX_,MarginY_,MarginZ_:Integer );
begin
     inherited;

     _CountX  := DivX_ + 1;
     _CountY  := DivY_ + 1;
     _CountZ  := DivZ_ + 1;
end;

destructor TGridMap3D<T_Item>.Destroy;
begin

     inherited;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
