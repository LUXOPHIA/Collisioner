unit LUX.Data.Octree.D3;

interface //#################################################################### ■

uses LUX, LUX.D3, LUX.M4,
     LUX.Data.Octree,
     LUX.Geometry.D3;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     IOcNode3D   = interface;
       IOcLeaf3D = interface;
       IOcKnot3D = interface;
       IOctree3D = interface;

     TOcLeaf3D = class;
     TOcKnot3D = class;
     TOctree3D = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOcNode3D

     IOcNode3D = interface( IOcNode )
     ['{828065B3-3378-4052-8ECA-FF2BD612970F}']
     {protected}
       ///// アクセス
       function GetRoot :IOctree3D;
       function GetParen :IOcNode3D;
       procedure SetParen( const Paren_:IOcNode3D );
       function GetChilds( const I_:Byte ) :IOcNode3D;
       procedure SetChilds( const I_:Byte; const Child_:IOcNode3D );
       function GetCubo :TSingleCubo3D;
     {public}
       ///// プロパティ
       property Root                    :IOctree3D     read GetRoot                  ;
       property Paren                   :IOcNode3D     read GetParen  write SetParen ;
       property Childs[ const I_:Byte ] :IOcNode3D     read GetChilds write SetChilds;
       property Cubo                    :TSingleCubo3D read GetCubo                  ;
       ///// メソッド
       function ForChilds( const Func_:TConstFunc<IOcNode3D,Boolean> ) :Boolean;
       procedure ForFamily( const Proc_:TConstProc<IOcNode3D> );
       function Collision( const Node_:IOcNode3D ) :Boolean;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOcLeaf3D

     IOcLeaf3D = interface( IOcNode3D )
     ['{A362526F-11E9-4521-B64B-F565A261DD50}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TOcLeaf3D = class( TOcLeaf, IOcLeaf3D, IOcNode3D )
     private
     protected
       ///// アクセス
       function GetRoot :IOctree3D; reintroduce;
       function GetParen :IOcNode3D; reintroduce;
       procedure SetParen( const Paren_:IOcNode3D ); reintroduce;
       function GetChilds( const I_:Byte ) :IOcNode3D; reintroduce;
       procedure SetChilds( const I_:Byte; const Child_:IOcNode3D ); reintroduce;
       function GetCubo :TSingleCubo3D;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property Root                    :IOctree3D     read GetRoot                  ;
       property Paren                   :IOcNode3D     read GetParen  write SetParen ;
       property Childs[ const I_:Byte ] :IOcNode3D     read GetChilds write SetChilds;
       property Cubo                    :TSingleCubo3D read GetCubo                  ;
       ///// メソッド
       function ForChilds( const Func_:TConstFunc<IOcNode3D,Boolean> ) :Boolean; reintroduce;
       procedure ForFamily( const Proc_:TConstProc<IOcNode3D> ); reintroduce;
       function Collision( const Node_:IOcNode3D ) :Boolean;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOcKnot3D

     IOcKnot3D = interface( IOcNode3D )
     ['{824043A9-14C2-4FD2-8C8E-06C2E0EA0E6C}']
     {protected}
     {public}
     end;

     //-------------------------------------------------------------------------

     TOcKnot3D = class( TOcKnot, IOcKnot3D, IOcNode3D )
     private
     protected
       ///// アクセス
       function GetRoot :IOctree3D; reintroduce;
       function GetParen :IOcNode3D; reintroduce;
       procedure SetParen( const Paren_:IOcNode3D ); reintroduce;
       function GetChilds( const I_:Byte ) :IOcNode3D; reintroduce;
       procedure SetChilds( const I_:Byte; const Child_:IOcNode3D ); reintroduce;
       function GetCubo :TSingleCubo3D;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property Root                    :IOctree3D     read GetRoot                  ;
       property Paren                   :IOcNode3D     read GetParen  write SetParen ;
       property Childs[ const I_:Byte ] :IOcNode3D     read GetChilds write SetChilds;
       property Cubo                    :TSingleCubo3D read GetCubo                  ;
       ///// メソッド
       function ForChilds( const Func_:TConstFunc<IOcNode3D,Boolean> ) :Boolean; reintroduce;
       procedure ForFamily( const Proc_:TConstProc<IOcNode3D> ); reintroduce;
       function Collision( const Node_:IOcNode3D ) :Boolean;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOctree3D

     IOctree3D = interface( IOcNode3D )
     ['{E8A174D1-4F6F-4F03-9182-D8BE1A631541}']
     {protected}
     {public}
       ///// メソッド
       function GetCubo( const Lev_:Cardinal; const Ind_:TCardinal3D ) :TSingleCubo3D; overload;
     end;

     //-------------------------------------------------------------------------

     TOctree3D = class( TOctree<IOcNode3D,TOcKnot3D,TOcLeaf3D>, IOctree3D, IOcNode3D )
     private
     protected
       _Area :TSingleArea3D;
       _Pose :TSingleM4;
       ///// アクセス
       function GetRoot :IOctree3D; reintroduce;
       function GetParen :IOcNode3D; reintroduce;
       procedure SetParen( const Paren_:IOcNode3D ); reintroduce;
       function GetChilds( const I_:Byte ) :IOcNode3D; reintroduce;
       procedure SetChilds( const I_:Byte; const Child_:IOcNode3D ); reintroduce;
       function GetCubo :TSingleCubo3D; overload;
     public
       constructor Create;
       destructor Destroy; override;
       ///// プロパティ
       property Root                    :IOctree3D     read GetRoot                  ;
       property Paren                   :IOcNode3D     read GetParen  write SetParen ;
       property Childs[ const I_:Byte ] :IOcNode3D     read GetChilds write SetChilds;
       property Cubo                    :TSingleCubo3D read GetCubo                  ;
       property Area                    :TSingleArea3D read   _Area   write   _Area  ;
       property Pose                    :TSingleM4     read   _Pose   write   _Pose  ;
       ///// メソッド
       function ForChilds( const Func_:TConstFunc<IOcNode3D,Boolean> ) :Boolean; reintroduce;
       procedure ForFamily( const Proc_:TConstProc<IOcNode3D> ); reintroduce;
       function GetCubo( const Lev_:Cardinal; const Ind_:TCardinal3D ) :TSingleCubo3D; overload;
       function Collision( const Node_:IOcNode3D ) :Boolean;
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

function TOcLeaf3D.GetRoot :IOctree3D;
begin
     Result := inherited GetRoot as IOctree3D;
end;

//------------------------------------------------------------------------------

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
     Result := Root.GetCubo( Lev, Ind );
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

procedure TOcLeaf3D.ForFamily( const Proc_:TConstProc<IOcNode3D> );
begin
     inherited ForFamily( procedure( const Node_:TOcNode )
     begin
          Proc_( Node_ as IOcNode3D );
     end );
end;

//------------------------------------------------------------------------------

function TOcLeaf3D.Collision( const Node_:IOcNode3D ) :Boolean;
begin
     Result := Cubo.Collision( Node_.Cubo );

     if Result and not( Node_ is TOcLeaf ) then
     begin
          Result := ForChilds( function( const N0:IOcNode3D ) :Boolean
          begin
               Result := Node_.ForChilds( function( const N1:IOcNode3D ) :Boolean
               begin
                    Result := N0.Collision( N1 );
               end );
          end );
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOcKnot3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TOcKnot3D.GetRoot :IOctree3D;
begin
     Result := inherited GetRoot as IOctree3D;
end;

//------------------------------------------------------------------------------

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
     Result := Root.GetCubo( Lev, Ind );
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

procedure TOcKnot3D.ForFamily( const Proc_:TConstProc<IOcNode3D> );
begin
     inherited ForFamily( procedure( const Node_:TOcNode )
     begin
          Proc_( Node_ as IOcNode3D );
     end );
end;

//------------------------------------------------------------------------------

function TOcKnot3D.Collision( const Node_:IOcNode3D ) :Boolean;
begin
     Result := Cubo.Collision( Node_.Cubo );

     if Result then
     begin
          Result := ForChilds( function( const N0:IOcNode3D ) :Boolean
          begin
               Result := Node_.ForChilds( function( const N1:IOcNode3D ) :Boolean
               begin
                    Result := N0.Collision( N1 );
               end );
          end );
     end;
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOctree3D

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

function TOctree3D.GetRoot :IOctree3D;
begin
     Result := inherited GetRoot as IOctree3D;
end;

//------------------------------------------------------------------------------

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
     Result := Root.GetCubo( Lev, Ind );
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

procedure TOctree3D.ForFamily( const Proc_:TConstProc<IOcNode3D> );
begin
     inherited ForFamily( procedure( const Node_:TOcNode )
     begin
          Proc_( Node_ as IOcNode3D );
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

function TOctree3D.Collision( const Node_:IOcNode3D ) :Boolean;
begin
     Result := Cubo.Collision( Node_.Cubo );

     if Result then
     begin
          Result := ForChilds( function( const N0:IOcNode3D ) :Boolean
          begin
               Result := Node_.ForChilds( function( const N1:IOcNode3D ) :Boolean
               begin
                    Result := N0.Collision( N1 );
               end );
          end );
     end;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■