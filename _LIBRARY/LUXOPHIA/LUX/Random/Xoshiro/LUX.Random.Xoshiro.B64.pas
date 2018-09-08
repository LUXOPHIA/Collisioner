unit LUX.Random.Xoshiro.B64;

interface //#################################################################### ■

uses LUX, LUX.D2, LUX.D4,
     LUX.Random,
     LUX.Random.Xoshiro;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     TRandom64ROS128 = class;
     TRandom64XOS256 = class;
     TRandom64XOS512 = class;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSeedXOS512

     TSeedXOS512 = record
     private
     public
       s :array [ 0..8-1 ] of Int64u;
       /////
       constructor Create( const s0_,s1_,s2_,s3_,s4_,s5_,s6_,s7_:Int64u );
     end;

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64ROS128

     TRandom64ROS128 = class( TRandom64SHI<TInt64u2D> )
     private
     protected
       ///// メソッド
       procedure CalcNextSeed; override;
     public
       constructor CreateFromRand( const Random_:IRandom ); overload; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS256

     TRandom64XOS256 = class( TRandom64SHI<TInt64u4D> )
     private
     protected
       ///// メソッド
       procedure CalcNextSeed; override;
     public
       constructor CreateFromRand( const Random_:IRandom ); overload; override;
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS512

     TRandom64XOS512 = class( TRandom64SHI<TSeedXOS512> )
     private
     protected
       ///// メソッド
       procedure CalcNextSeed; override;
     public
       constructor CreateFromRand( const Random_:IRandom ); overload; override;
     end;

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.SysUtils;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TSeedXOS512

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TSeedXOS512.Create( const s0_,s1_,s2_,s3_,s4_,s5_,s6_,s7_:Int64u );
begin
     s[ 0 ] := s0_;
     s[ 1 ] := s1_;
     s[ 2 ] := s2_;
     s[ 3 ] := s3_;
     s[ 4 ] := s4_;
     s[ 5 ] := s5_;
     s[ 6 ] := s6_;
     s[ 7 ] := s7_;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64ROS128

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandom64ROS128.CalcNextSeed;
var
   S :TInt64u2D;
begin
     S := _Seed;

     with S do
     begin
          Y := Y xor X;

          _Seed.X := rotl( X, 24 ) xor Y xor ( Y shl 16 );  // a, b
          _Seed.Y := rotl( Y, 37 );                         // c
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandom64ROS128.CreateFromRand( const Random_:IRandom );
begin
     Create( TInt64u2D.Create( Random_.DrawRandInt64u,
                               Random_.DrawRandInt64u ) );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS256

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandom64XOS256.CalcNextSeed;
var
   T :Int64u;
begin
     with _Seed do
     begin
          T := Y shl 17;

          Z := Z xor X;
          W := W xor Y;
          Y := Y xor Z;
          X := X xor W;

          Z := Z xor T;

          W := rotl( W, 45 );
     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandom64XOS256.CreateFromRand( const Random_:IRandom );
begin
     Create( TInt64u4D.Create( Random_.DrawRandInt64u,
                               Random_.DrawRandInt64u,
                               Random_.DrawRandInt64u,
                               Random_.DrawRandInt64u ) );
end;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TRandom64XOS512

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// メソッド

procedure TRandom64XOS512.CalcNextSeed;
var
   T :Int64u;
begin
     with _Seed do
     begin
          T := s[ 1 ] shl 11;

          s[ 2 ] := s[ 2 ] xor s[ 0 ];
          s[ 5 ] := s[ 5 ] xor s[ 1 ];
          s[ 1 ] := s[ 1 ] xor s[ 2 ];
          s[ 7 ] := s[ 7 ] xor s[ 3 ];
          s[ 3 ] := s[ 3 ] xor s[ 4 ];
          s[ 4 ] := s[ 4 ] xor s[ 5 ];
          s[ 0 ] := s[ 0 ] xor s[ 6 ];
          s[ 6 ] := s[ 6 ] xor s[ 7 ];
          s[ 6 ] := s[ 6 ] xor T;

          s[ 7 ] := rotl( s[ 7 ], 21 );     end;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TRandom64XOS512.CreateFromRand( const Random_:IRandom );
begin
     Create( TSeedXOS512.Create( Random_.DrawRandInt64u,
                                 Random_.DrawRandInt64u,
                                 Random_.DrawRandInt64u,
                                 Random_.DrawRandInt64u,
                                 Random_.DrawRandInt64u,
                                 Random_.DrawRandInt64u,
                                 Random_.DrawRandInt64u,
                                 Random_.DrawRandInt64u ) );
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
