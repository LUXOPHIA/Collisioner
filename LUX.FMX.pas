unit LUX.FMX;

interface //#################################################################### ■

uses FMX.Types3D,
     LUX;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% {RECORD}

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% HMeshData

     HMeshData = class helper for TMeshData
     private
     protected
     public
       ///// メソッド
       procedure SaveToFileBinSTL( const FileName_:String; const Text_:AnsiString = '' );
     end;

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% {CLASS}

//const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.Classes, System.SysUtils, System.RTLConsts, System.Math.Vectors,
     LUX.D3;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% HMeshData

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

/////////////////////////////////////////////////////////////////////// メソッド

procedure HMeshData.SaveToFileBinSTL( const FileName_:String; const Text_:AnsiString = '' );
var
   Cs :array [ 0..80-1 ] of AnsiChar;
   PC :PAnsiChar;
   N, I :Cardinal;
   Face :packed record
           Nor  :TSingle3D;
           Pos1 :TSingle3D;
           Pos2 :TSingle3D;
           Pos3 :TSingle3D;
           temp :Word;
         end;
begin
     with TFileStream.Create( FileName_, fmCreate ) do
     begin
          try
             StrLCopy( Cs, PAnsiChar( Text_ ), Length( Cs )-1 );

             Write( Cs, 80 );

             N := IndexBuffer.Length div 3;

             Write( N, SizeOf( N ) );

             for I := 0 to N-1 do
             begin
                  with Face do
                  begin
                       Nor  := TSingle3D.Create( 0, 0, 0 );
                       Pos1 := VertexBuffer.Vertices[ IndexBuffer.Indices[ 3*I+0 ] ];
                       Pos2 := VertexBuffer.Vertices[ IndexBuffer.Indices[ 3*I+1 ] ];
                       Pos3 := VertexBuffer.Vertices[ IndexBuffer.Indices[ 3*I+2 ] ];
                       temp := 0;
                  end;

                  Write( Face, SizeOf( Face ) );
             end;

          finally
                 Free;
          end;
     end;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■