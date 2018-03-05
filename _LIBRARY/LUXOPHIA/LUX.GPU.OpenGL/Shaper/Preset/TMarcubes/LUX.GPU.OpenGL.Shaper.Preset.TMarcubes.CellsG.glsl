#version 430

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%【共通定数】

layout( std140 ) uniform TViewerScal
{
  layout( row_major ) mat4 _ViewerScal;
};

layout( std140 ) uniform TCameraProj
{
  layout( row_major ) mat4 _CameraProj;
};

layout( std140 ) uniform TCameraPose
{
  layout( row_major ) mat4 _CameraPose;
};

layout( std140 ) uniform TShaperPose
{
  layout( row_major ) mat4 _ShaperPose;
};

layout( std140 ) uniform TBricS
{
  vec3 _BricS;
};

//------------------------------------------------------------------------------

uniform sampler3D _Grids;

const ivec3 _ElemGridsN = textureSize( _Grids, 0 );
const ivec3 _ElemBricsN = _ElemGridsN - ivec3( 1 );
const ivec3 _BricsN     = _ElemBricsN - ivec3( 2 );

//############################################################################## ■

layout( points ) in;

in TSenderVG
{
  ivec3 Pos;
}
_Sender[ 1 ];

const int X0 = _Sender[ 0 ].Pos.x;  const int X1 = X0 + 1;
const int Y0 = _Sender[ 0 ].Pos.y;  const int Y1 = Y0 + 1;
const int Z0 = _Sender[ 0 ].Pos.z;  const int Z1 = Z0 + 1;

//------------------------------------------------------------------------------

layout( line_strip, max_vertices = 24 ) out;

out TSenderGF
{
  vec4 Pos;
}
_Result;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%【ルーチン】

float GetGrids( int X, int Y, int Z )
{
  return texelFetch( _Grids, ivec3( 1 ) + ivec3( X, Y, Z ), 0 ).x;
}

//------------------------------------------------------------------------------

void AddPoin( vec3 Pos_ )
{
  vec3 Sd = _BricS / _BricsN;

  _Result.Pos = _ShaperPose * vec4( Pos_ * Sd - _BricS / 2, 1 );

  gl_Position = _ViewerScal * _CameraProj * inverse( _CameraPose ) * _Result.Pos;

  EmitVertex();
}

//------------------------------------------------------------------------------

void AddEdge( vec3 Pos1_, vec3 Pos2_ )
{
  AddPoin( Pos1_ );
  AddPoin( Pos2_ );

  EndPrimitive();
}

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

const float G000 = GetGrids( X0, Y0, Z0 );
const float G001 = GetGrids( X1, Y0, Z0 );
const float G010 = GetGrids( X0, Y1, Z0 );
const float G011 = GetGrids( X1, Y1, Z0 );
const float G100 = GetGrids( X0, Y0, Z1 );
const float G101 = GetGrids( X1, Y0, Z1 );
const float G110 = GetGrids( X0, Y1, Z1 );
const float G111 = GetGrids( X1, Y1, Z1 );

//------------------------------------------------------------------------------

int CubeKind()
{
  int Result = 0;
  if ( G000 < 0 ) Result += 0x01;  // 00000001
  if ( G001 < 0 ) Result += 0x02;  // 00000010
  if ( G010 < 0 ) Result += 0x04;  // 00000100
  if ( G011 < 0 ) Result += 0x08;  // 00001000
  if ( G100 < 0 ) Result += 0x10;  // 00010000
  if ( G101 < 0 ) Result += 0x20;  // 00100000
  if ( G110 < 0 ) Result += 0x40;  // 01000000
  if ( G111 < 0 ) Result += 0x80;  // 10000000
  return Result;
}

////////////////////////////////////////////////////////////////////////////////

void main()
{
  const int K = CubeKind();

  if ( ( 0 < K ) && ( K < 255 ) )
  {
    AddEdge( vec3( X0, Y0, Z0 ), vec3( X1, Y0, Z0 ) );
    AddEdge( vec3( X0, Y1, Z0 ), vec3( X1, Y1, Z0 ) );
    AddEdge( vec3( X0, Y0, Z1 ), vec3( X1, Y0, Z1 ) );
    AddEdge( vec3( X0, Y1, Z1 ), vec3( X1, Y1, Z1 ) );

    AddEdge( vec3( X0, Y0, Z0 ), vec3( X0, Y1, Z0 ) );
    AddEdge( vec3( X0, Y0, Z1 ), vec3( X0, Y1, Z1 ) );
    AddEdge( vec3( X1, Y0, Z0 ), vec3( X1, Y1, Z0 ) );
    AddEdge( vec3( X1, Y0, Z1 ), vec3( X1, Y1, Z1 ) );

    AddEdge( vec3( X0, Y0, Z0 ), vec3( X0, Y0, Z1 ) );
    AddEdge( vec3( X1, Y0, Z0 ), vec3( X1, Y0, Z1 ) );
    AddEdge( vec3( X0, Y1, Z0 ), vec3( X0, Y1, Z1 ) );
    AddEdge( vec3( X1, Y1, Z0 ), vec3( X1, Y1, Z1 ) );
  }
}

//############################################################################## ■
