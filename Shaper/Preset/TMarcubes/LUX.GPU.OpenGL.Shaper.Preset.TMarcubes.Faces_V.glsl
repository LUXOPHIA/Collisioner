#version 430

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%【共通定数】

uniform sampler3D _Grid;

const ivec3 _ElemPoinsN = textureSize( _Grid, 0 );
const ivec3 _ElemCellsN = _ElemPoinsN - ivec3( 1 );
const ivec3 _CellsN     = _ElemCellsN - ivec3( 2 );

//############################################################################## ■

out TSenderVG
{
  ivec3 Pos;
}
_Result;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

void main()
{
  const int SZ = _CellsN.y * _CellsN.x;
  const int SY =             _CellsN.x;
  const int I  = gl_VertexID;

  ivec3 B;
  int   J;

  B.z = I / SZ;  J   = I - SZ * B.z;
  B.y = J / SY;  B.x = J - SY * B.y;

  _Result.Pos = B;
}

//############################################################################## ■
