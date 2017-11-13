unit LUX.Data.Octree.D3;

interface //#################################################################### ■

uses LUX, LUX.D3, LUX.M4,
     LUX.Data.Octree,
     LUX.Geometry.D3;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     TOcKnot3D = class;
     TOcLeaf3D = class;
     TOctree3D = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOcNode3D

     IOcNode3D = interface( IOcNode )
     ['{828065B3-3378-4052-8ECA-FF2BD612970F}']
     {protected}
       ///// アクセス
       function GetParen :IOcNode3D;
       procedure SetParen( const Paren_:IOcNode3D );
       function GetChilds( const I_:Byte ) :IOcNode3D;
       procedure SetChilds( const I_:Byte; const Child_:IOcNode3D );
       function GetCubo :TSingleCubo3D;
     {public}
       ///// プロパティ
       property Paren                   :IOcNode3D     read GetParen  write SetParen ;
       property Childs[ const I_:Byte ] :IOcNode3D     read GetChilds write SetChilds;
       property Cubo                    :TSingleCubo3D read GetCubo                  ;
       ///// メソッド
       function ForChilds( const Func_:TConstFunc<IOcNode3D,Boolean> ) :Boolean;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOcLeaf3D

     IOcLeaf3D = interface( IOcNode3D )
     ['{A362526F-11E9-4521-B64B-F565A261DD50}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TOcLeaf3D = class( TOcLeaf, IOcLeaf3D )
     private
     protected
       ///// アクセス
       function GetParen :IOcNode3D; reintroduce;
       procedure SetParen( const Paren_:IOcNode3D ); reintroduce;
       function GetChilds( const I_:Byte ) :IOcNode3D; reintroduce;
       procedure SetChilds( const I_:Byte; const Child_:IOcNode3D ); reintroduce;
       function GetCubo :TSingleCubo3D;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       ///// メソッド
       function ForChilds( const Func_:TConstFunc<IOcNode3D,Boolean> ) :Boolean; reintroduce;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOcKnot3D

     IOcKnot3D = interface( IOcNode3D )
     ['{824043A9-14C2-4FD2-8C8E-06C2E0EA0E6C}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TOcKnot3D = class( TOcKnot, IOcKnot3D )
     private
     protected
       ///// アクセス
       function GetParen :IOcNode3D; reintroduce;
       procedure SetParen( const Paren_:IOcNode3D ); reintroduce;
       function GetChilds( const I_:Byte ) :IOcNode3D; reintroduce;
       procedure SetChilds( const I_:Byte; const Child_:IOcNode3D ); reintroduce;
       function GetCubo :TSingleCubo3D;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       ///// メソッド
       function ForChilds( const Func_:TConstFunc<IOcNode3D,Boolean> ) :Boolean; reintroduce;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOctree3D

     IOctree3D = interface( IOcNode3D )
     ['{E8A174D1-4F6F-4F03-9182-D8BE1A631541}']
     {protected}
     {public}
       ///// メソッド
       function GetCubo( const Lev_:Cardinal; const Ind_:TCardinal3D ) :TSingleCubo3D; overload;
       function Collision( const Octree_:TOctree3D ) :Boolean;
     end;

     //-------------------------------------------------------------------------

     TOctree3D = class( TOctree<IOcNode3D,TOcKnot3D,TOcLeaf3D>, IOctree3D )
     private
     protected
       _Area :TSingleArea3D;
       _Pose :TSingleM4;
       ///// アクセス
       function GetParen :IOcNode3D; reintroduce;
       procedure SetParen( const Paren_:IOcNode3D ); reintroduce;
       function GetChilds( const I_:Byte ) :IOcNode3D; reintroduce;
       procedure SetChilds( const I_:Byte; const Child_:IOcNode3D ); reintroduce;
       function GetCubo :TSingleCubo3D; overload;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property Area :TSingleArea3D read _Area write _Area;
       property Pose :TSingleM4     read _Pose write _Pose;
       ///// メソッド
       function ForChilds( const Func_:TConstFunc<IOcNode3D,Boolean> ) :Boolean; reintroduce;
       function GetCubo( const Lev_:Cardinal; const Ind_:TCardinal3D ) :TSingleCubo3D; overload;
       function Collision( const Octree_:TOctree3D ) :Boolean;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.SysUtils, System.Math;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOcNode3D

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOcLeaf3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TOcLeaf3D.GetParen :IOcNode3D;
begin
     Result := inherited GetParen as IOcNode3D;
end;

procedure TOcLeaf3D.SetParen( const Paren_:IOcNode3D );
begin
     inherited SetParen( Paren_ as TOcNode );
end;

function TOcLeaf3D.GetChilds( const I_:Byte ) :IOcNode3D;
begin
     Result := inherited GetChilds( I_ ) as IOcNode3D;
end;

procedure TOcLeaf3D.SetChilds( const I_:Byte; const Child_:IOcNode3D );
begin
     inherited SetChilds( I_, Child_ as TOcNode );
end;

//------------------------------------------------------------------------------

function TOcLeaf3D.GetCubo :TSingleCubo3D;
begin
     Result := ( Root as IOctree3D ).GetCubo( Lev, Ind );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TOcLeaf3D.Create;
begin
     inherited;

end;

destructor TOcLeaf3D.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TOcLeaf3D.ForChilds( const Func_:TConstFunc<IOcNode3D,Boolean> ) :Boolean;
begin
     Result := inherited ForChilds( function( const Child_:TOcNode ) :Boolean
     begin
          Result := Func_( Child_ as IOcNode3D );
     end );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOcKnot3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TOcKnot3D.GetParen :IOcNode3D;
begin
     Result := inherited GetParen as IOcNode3D;
end;

procedure TOcKnot3D.SetParen( const Paren_:IOcNode3D );
begin
     inherited SetParen( Paren_ as TOcNode );
end;

function TOcKnot3D.GetChilds( const I_:Byte ) :IOcNode3D;
begin
     Result := inherited GetChilds( I_ ) as IOcNode3D;
end;

procedure TOcKnot3D.SetChilds( const I_:Byte; const Child_:IOcNode3D );
begin
     inherited SetChilds( I_, Child_ as TOcNode );
end;

//------------------------------------------------------------------------------

function TOcKnot3D.GetCubo :TSingleCubo3D;
begin
     Result := ( Root as IOctree3D ).GetCubo( Lev, Ind );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TOcKnot3D.Create;
begin
     inherited;

end;

destructor TOcKnot3D.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TOcKnot3D.ForChilds( const Func_:TConstFunc<IOcNode3D,Boolean> ) :Boolean;
begin
     Result := inherited ForChilds( function( const Child_:TOcNode ) :Boolean
     begin
          Result := Func_( Child_ as IOcNode3D );
     end );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOctree3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TOctree3D.GetParen :IOcNode3D;
begin
     Result := inherited GetParen as IOcNode3D;
end;

procedure TOctree3D.SetParen( const Paren_:IOcNode3D );
begin
     inherited SetParen( Paren_ as TOcNode );
end;

function TOctree3D.GetChilds( const I_:Byte ) :IOcNode3D;
begin
     Result := inherited GetChilds( I_ ) as IOcNode3D;
end;

procedure TOctree3D.SetChilds( const I_:Byte; const Child_:IOcNode3D );
begin
     inherited SetChilds( I_, Child_ as TOcNode );
end;

//------------------------------------------------------------------------------

function TOctree3D.GetCubo :TSingleCubo3D;
begin
     Result := ( Root as IOctree3D ).GetCubo( Lev, Ind );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TOctree3D.Create;
begin
     inherited;

end;

destructor TOctree3D.Destroy;
begin

     inherited;
end;

/////////////////////////////////////////////////////////////////////// メソッド

function TOctree3D.ForChilds( const Func_:TConstFunc<IOcNode3D,Boolean> ) :Boolean;
begin
     Result := inherited ForChilds( function( const Child_:TOcNode ) :Boolean
     begin
          Result := Func_( Child_ as IOcNode3D );
     end );
end;

//------------------------------------------------------------------------------

function TOctree3D.GetCubo( const Lev_:Cardinal; const Ind_:TCardinal3D ) :TSingleCubo3D;
var
   N :Cardinal;
   S :TSingleSiz3D;
begin
     N := TOctree3D.DivLtoN( Lev_ );

     S.X := _Area.SizeX / N;
     S.Y := _Area.SizeY / N;
     S.Z := _Area.SizeZ / N;

     with Result do
     begin
          with Area do
          begin
               with Min do
               begin
                    X := _Area.Min.X + S.X * Ind_.X;
                    Y := _Area.Min.Y + S.Y * Ind_.Y;
                    Z := _Area.Min.Z + S.Z * Ind_.Z;
               end;

               with Max do
               begin
                    X := Min.X + S.X;
                    Y := Min.Y + S.Y;
                    Z := Min.Z + S.Z;
               end;
          end;

          Pose := _Pose;
     end;
end;

//------------------------------------------------------------------------------

function TOctree3D.Collision( const Octree_:TOctree3D ) :Boolean;
begin

end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■