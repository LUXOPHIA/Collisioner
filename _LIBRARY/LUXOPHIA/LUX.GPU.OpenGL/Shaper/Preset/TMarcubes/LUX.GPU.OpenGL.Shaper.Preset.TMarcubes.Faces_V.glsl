#version 430

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%【共通定数】

uniform sampler3D _Grids;

const ivec3 _ElemGridsN = textureSize( _Grids, 0 );
const ivec3 _ElemBricsN = _ElemGridsN - ivec3( 1 );
const ivec3 _BricsN     = _ElemBricsN - ivec3( 2 );

//############################################################################## ■

out TSenderVG
{
  ivec3 Pos;
}
_Result;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

void main()
{
  const int SZ = _BricsN.y * _BricsN.x;
  const int SY =             _BricsN.x;
  const int I  = gl_VertexID;

  ivec3 B;
  int   J;

  B.z = I / SZ;  J   = I - SZ * B.z;
  B.y = J / SY;  B.x = J - SY * B.y;

  _Result.Pos = B;
}

//############################################################################## ■
