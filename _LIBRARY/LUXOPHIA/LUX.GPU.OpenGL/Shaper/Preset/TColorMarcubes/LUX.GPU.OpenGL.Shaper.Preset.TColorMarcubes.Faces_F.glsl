#version 430

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%【定数】

const float Pi  = 3.141592653589793;
const float Pi2 = Pi * 2.0;
const float P2i = Pi / 2.0;

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%【ルーチン】

vec2 VecToSky( vec4 Vector_ )
{
    vec2 Result;

    Result.x = ( Pi - atan( -Vector_.x, -Vector_.z ) ) / Pi2;
    Result.y =        acos(  Vector_.y             )   / Pi ;

    return Result;
}

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%【共通定数】

layout( std140 ) uniform TViewerScal{ layout( row_major ) mat4 _ViewerScal; };
layout( std140 ) uniform TCameraProj{ layout( row_major ) mat4 _CameraProj; };
layout( std140 ) uniform TCameraPose{ layout( row_major ) mat4 _CameraPose; };
layout( std140 ) uniform TShaperPose{ layout( row_major ) mat4 _ShaperPose; };

//############################################################################## ■

in TSenderGF
{
  vec4 Pos;
  vec4 Col;
  vec4 Nor;
}
_Sender;

//------------------------------------------------------------------------------

out vec4 _ResultCol;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

void main()
{
  vec4 C = _CameraPose[ 3 ];
  vec4 V = normalize( _Sender.Pos - C );
  vec4 R = reflect( V, normalize( _Sender.Nor ) );

  _ResultCol.rgb = _Sender.Col.rgb * clamp( dot( normalize( inverse( _CameraPose ) * _Sender.Nor ).xyz, normalize( vec3( 0, 1, 1 ) ) ), 0, 1 );
  _ResultCol.a   = 1;
}

//############################################################################## ■
