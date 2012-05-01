Shader "Toon/Team Fortress 2" {
    Properties {
        _Color ("Main Color", Color) = (1,1,1,1)
        _RimColor ("Rim Color", Color) = (0.97,0.88,1,0.75)
        _RimPower ("Rim Power", Float) = 2.5
        _MainTex ("Diffuse (RGB) Alpha (A)", 2D) = "white" {}
        _BumpMap ("Normal (Normal)", 2D) = "bump" {}
        _SpecularTex ("Specular Level (R) Gloss (G) Rim Mask (B)", 2D) = "gray" {}
        _RampTex ("Toon Ramp (RGB)", 2D) = "white" {}
        _Cutoff ("Alphatest Cutoff", Range(0, 1)) = 0.5
    }

    SubShader{
        Tags { "RenderType" = "Opaque" }
        
        	
	Pass {
		Name "FORWARD"
		Tags { "LightMode" = "ForwardBase" }
		AlphaToMask True ColorMask RGB
Program "vp" {
// Vertex combos: 6
//   opengl - ALU: 22 to 91
//   d3d9 - ALU: 23 to 94
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Vector 13 [unity_Scale]
Vector 14 [_WorldSpaceCameraPos]
Vector 15 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 16 [unity_SHAr]
Vector 17 [unity_SHAg]
Vector 18 [unity_SHAb]
Vector 19 [unity_SHBr]
Vector 20 [unity_SHBg]
Vector 21 [unity_SHBb]
Vector 22 [unity_SHC]
Vector 23 [_MainTex_ST]
"3.0-!!ARBvp1.0
# 55 ALU
PARAM c[24] = { { 1 },
		state.matrix.mvp,
		program.local[5..23] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[13].w;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MOV R0.w, c[0].x;
MUL R1, R0.xyzz, R0.yzzx;
DP4 R2.z, R0, c[18];
DP4 R2.y, R0, c[17];
DP4 R2.x, R0, c[16];
MUL R0.w, R2, R2;
MAD R0.w, R0.x, R0.x, -R0;
DP4 R0.z, R1, c[21];
DP4 R0.y, R1, c[20];
DP4 R0.x, R1, c[19];
ADD R0.xyz, R2, R0;
MUL R1.xyz, R0.w, c[22];
ADD result.texcoord[5].xyz, R0, R1;
MOV R1.w, c[0].x;
MOV R1.xyz, c[14];
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
MAD R2.xyz, R2, c[13].w, -vertex.position;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R1, c[15];
MUL R0.xyz, R0, vertex.attrib[14].w;
DP4 R3.z, R1, c[11];
DP4 R3.x, R1, c[9];
DP4 R3.y, R1, c[10];
DP3 R1.y, R0, c[5];
DP3 result.texcoord[4].y, R0, R3;
DP3 result.texcoord[6].y, R0, R2;
DP3 R1.x, vertex.attrib[14], c[5];
DP3 R1.z, vertex.normal, c[5];
MUL result.texcoord[1].xyz, R1, c[13].w;
DP3 R1.y, R0, c[6];
DP3 R0.y, R0, c[7];
DP3 R1.x, vertex.attrib[14], c[6];
DP3 R1.z, vertex.normal, c[6];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2].xyz, R1, c[13].w;
MUL result.texcoord[3].xyz, R0, c[13].w;
DP3 result.texcoord[4].z, vertex.normal, R3;
DP3 result.texcoord[4].x, vertex.attrib[14], R3;
DP3 result.texcoord[6].z, vertex.normal, R2;
DP3 result.texcoord[6].x, vertex.attrib[14], R2;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[23], c[23].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 55 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 12 [unity_Scale]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 15 [unity_SHAr]
Vector 16 [unity_SHAg]
Vector 17 [unity_SHAb]
Vector 18 [unity_SHBr]
Vector 19 [unity_SHBg]
Vector 20 [unity_SHBb]
Vector 21 [unity_SHC]
Vector 22 [_MainTex_ST]
"vs_3_0
; 58 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
def c23, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mul r1.xyz, v2, c12.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mov r0.w, c23.x
mul r1, r0.xyzz, r0.yzzx
dp4 r2.z, r0, c17
dp4 r2.y, r0, c16
dp4 r2.x, r0, c15
mul r0.w, r2, r2
mad r0.w, r0.x, r0.x, -r0
dp4 r0.z, r1, c20
dp4 r0.y, r1, c19
dp4 r0.x, r1, c18
mul r1.xyz, r0.w, c21
add r0.xyz, r2, r0
add o6.xyz, r0, r1
mov r0.w, c23.x
mov r0.xyz, c13
dp4 r1.z, r0, c10
dp4 r1.y, r0, c9
dp4 r1.x, r0, c8
mad r3.xyz, r1, c12.w, -v0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r1, v1.w
mov r0, c10
dp4 r4.z, c14, r0
mov r0, c9
dp4 r4.y, c14, r0
mov r1, c8
dp4 r4.x, c14, r1
dp3 r0.y, r2, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul o2.xyz, r0, c12.w
dp3 r0.y, r2, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul o3.xyz, r0, c12.w
dp3 r0.y, r2, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
dp3 o5.y, r2, r4
dp3 o7.y, r2, r3
mul o4.xyz, r0, c12.w
dp3 o5.z, v2, r4
dp3 o5.x, v1, r4
dp3 o7.z, v2, r3
dp3 o7.x, v1, r3
mad o1.xy, v3, c22, c22.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_OFF" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec3 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_SHC;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec3 shlight;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = tmpvar_1.xyz;
  tmpvar_8[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_8[2] = tmpvar_2;
  mat3 tmpvar_9;
  tmpvar_9[0].x = tmpvar_8[0].x;
  tmpvar_9[0].y = tmpvar_8[1].x;
  tmpvar_9[0].z = tmpvar_8[2].x;
  tmpvar_9[1].x = tmpvar_8[0].y;
  tmpvar_9[1].y = tmpvar_8[1].y;
  tmpvar_9[1].z = tmpvar_8[2].y;
  tmpvar_9[2].x = tmpvar_8[0].z;
  tmpvar_9[2].y = tmpvar_8[1].z;
  tmpvar_9[2].z = tmpvar_8[2].z;
  mat3 tmpvar_10;
  tmpvar_10[0] = _Object2World[0].xyz;
  tmpvar_10[1] = _Object2World[1].xyz;
  tmpvar_10[2] = _Object2World[2].xyz;
  vec3 v_i0;
  v_i0.x = tmpvar_10[0].x;
  v_i0.y = tmpvar_10[1].x;
  v_i0.z = tmpvar_10[2].x;
  highp vec3 tmpvar_11;
  tmpvar_11 = ((tmpvar_9 * v_i0) * unity_Scale.w);
  tmpvar_3 = tmpvar_11;
  mat3 tmpvar_12;
  tmpvar_12[0] = _Object2World[0].xyz;
  tmpvar_12[1] = _Object2World[1].xyz;
  tmpvar_12[2] = _Object2World[2].xyz;
  vec3 v_i0_i1;
  v_i0_i1.x = tmpvar_12[0].y;
  v_i0_i1.y = tmpvar_12[1].y;
  v_i0_i1.z = tmpvar_12[2].y;
  highp vec3 tmpvar_13;
  tmpvar_13 = ((tmpvar_9 * v_i0_i1) * unity_Scale.w);
  tmpvar_4 = tmpvar_13;
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec3 v_i0_i1_i2;
  v_i0_i1_i2.x = tmpvar_14[0].z;
  v_i0_i1_i2.y = tmpvar_14[1].z;
  v_i0_i1_i2.z = tmpvar_14[2].z;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((tmpvar_9 * v_i0_i1_i2) * unity_Scale.w);
  tmpvar_5 = tmpvar_15;
  mat3 tmpvar_16;
  tmpvar_16[0] = _Object2World[0].xyz;
  tmpvar_16[1] = _Object2World[1].xyz;
  tmpvar_16[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_9 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_6 = tmpvar_17;
  highp vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = _WorldSpaceCameraPos;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = (tmpvar_16 * (tmpvar_2 * unity_Scale.w));
  mediump vec3 tmpvar_20;
  mediump vec4 normal;
  normal = tmpvar_19;
  mediump vec3 x3;
  highp float vC;
  mediump vec3 x2;
  mediump vec3 x1;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHAr, normal);
  x1.x = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHAg, normal);
  x1.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHAb, normal);
  x1.z = tmpvar_23;
  mediump vec4 tmpvar_24;
  tmpvar_24 = (normal.xyzz * normal.yzzx);
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHBr, tmpvar_24);
  x2.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHBg, tmpvar_24);
  x2.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHBb, tmpvar_24);
  x2.z = tmpvar_27;
  mediump float tmpvar_28;
  tmpvar_28 = ((normal.x * normal.x) - (normal.y * normal.y));
  vC = tmpvar_28;
  highp vec3 tmpvar_29;
  tmpvar_29 = (unity_SHC.xyz * vC);
  x3 = tmpvar_29;
  tmpvar_20 = ((x1 + x2) + x3);
  shlight = tmpvar_20;
  tmpvar_7 = shlight;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD6 = (tmpvar_9 * (((_World2Object * tmpvar_18).xyz * unity_Scale.w) - _glesVertex.xyz));
}



#endif
#ifdef FRAGMENT

varying highp vec3 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform sampler2D _SpecularTex;
uniform highp float _RimPower;
uniform highp vec4 _RimColor;
uniform sampler2D _RampTex;
uniform sampler2D _MainTex;
uniform lowp vec4 _LightColor0;
uniform lowp float _Cutoff;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  tmpvar_1 = xlv_TEXCOORD1;
  tmpvar_2 = xlv_TEXCOORD2;
  tmpvar_3 = xlv_TEXCOORD3;
  lowp vec3 tmpvar_4;
  mediump float tmpvar_5;
  lowp float tmpvar_6;
  mediump vec3 rim;
  highp vec3 specGloss;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture2D (_BumpMap, xlv_TEXCOORD0).xyz * 2.0) - 1.0);
  lowp vec3 tmpvar_10;
  tmpvar_10 = texture2D (_SpecularTex, xlv_TEXCOORD0).xyz;
  specGloss = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = specGloss.x;
  tmpvar_5 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = specGloss.y;
  tmpvar_6 = tmpvar_12;
  mediump vec3 tmpvar_13;
  tmpvar_13.x = dot (tmpvar_1, tmpvar_9);
  tmpvar_13.y = dot (tmpvar_2, tmpvar_9);
  tmpvar_13.z = dot (tmpvar_3, tmpvar_9);
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (vec3(0.0, 1.0, 0.0), tmpvar_13));
  highp vec3 tmpvar_15;
  tmpvar_15 = (((pow (tmpvar_14, _RimPower) * _RimColor.xyz) * _RimColor.w) * specGloss.z);
  rim = tmpvar_15;
  tmpvar_4 = rim;
  lowp float x;
  x = (tmpvar_8.w - _Cutoff);
  if ((x < 0.0)) {
    discard;
  };
  highp vec3 tmpvar_16;
  tmpvar_16 = normalize (xlv_TEXCOORD6);
  lowp vec3 viewDir;
  viewDir = tmpvar_16;
  lowp vec4 c_i0;
  highp float nh;
  lowp vec4 tmpvar_17;
  tmpvar_17 = texture2D (_RampTex, vec2(((dot (tmpvar_9, xlv_TEXCOORD4) * 0.5) + 0.5)));
  lowp float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_9, normalize ((xlv_TEXCOORD4 + viewDir))));
  nh = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = ((((tmpvar_7.xyz * tmpvar_17.xyz) * _LightColor0.xyz) + (_LightColor0.xyz * (pow (nh, (tmpvar_6 * 128.0)) * tmpvar_5))) * 2.0);
  c_i0.xyz = tmpvar_19;
  c_i0.w = tmpvar_8.w;
  c = c_i0;
  c.xyz = (c_i0.xyz + (tmpvar_7.xyz * xlv_TEXCOORD5));
  c.xyz = (c.xyz + tmpvar_4);
  c.w = tmpvar_8.w;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_OFF" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec3 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_SHC;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec3 shlight;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = tmpvar_1.xyz;
  tmpvar_8[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_8[2] = tmpvar_2;
  mat3 tmpvar_9;
  tmpvar_9[0].x = tmpvar_8[0].x;
  tmpvar_9[0].y = tmpvar_8[1].x;
  tmpvar_9[0].z = tmpvar_8[2].x;
  tmpvar_9[1].x = tmpvar_8[0].y;
  tmpvar_9[1].y = tmpvar_8[1].y;
  tmpvar_9[1].z = tmpvar_8[2].y;
  tmpvar_9[2].x = tmpvar_8[0].z;
  tmpvar_9[2].y = tmpvar_8[1].z;
  tmpvar_9[2].z = tmpvar_8[2].z;
  mat3 tmpvar_10;
  tmpvar_10[0] = _Object2World[0].xyz;
  tmpvar_10[1] = _Object2World[1].xyz;
  tmpvar_10[2] = _Object2World[2].xyz;
  vec3 v_i0;
  v_i0.x = tmpvar_10[0].x;
  v_i0.y = tmpvar_10[1].x;
  v_i0.z = tmpvar_10[2].x;
  highp vec3 tmpvar_11;
  tmpvar_11 = ((tmpvar_9 * v_i0) * unity_Scale.w);
  tmpvar_3 = tmpvar_11;
  mat3 tmpvar_12;
  tmpvar_12[0] = _Object2World[0].xyz;
  tmpvar_12[1] = _Object2World[1].xyz;
  tmpvar_12[2] = _Object2World[2].xyz;
  vec3 v_i0_i1;
  v_i0_i1.x = tmpvar_12[0].y;
  v_i0_i1.y = tmpvar_12[1].y;
  v_i0_i1.z = tmpvar_12[2].y;
  highp vec3 tmpvar_13;
  tmpvar_13 = ((tmpvar_9 * v_i0_i1) * unity_Scale.w);
  tmpvar_4 = tmpvar_13;
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec3 v_i0_i1_i2;
  v_i0_i1_i2.x = tmpvar_14[0].z;
  v_i0_i1_i2.y = tmpvar_14[1].z;
  v_i0_i1_i2.z = tmpvar_14[2].z;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((tmpvar_9 * v_i0_i1_i2) * unity_Scale.w);
  tmpvar_5 = tmpvar_15;
  mat3 tmpvar_16;
  tmpvar_16[0] = _Object2World[0].xyz;
  tmpvar_16[1] = _Object2World[1].xyz;
  tmpvar_16[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_9 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_6 = tmpvar_17;
  highp vec4 tmpvar_18;
  tmpvar_18.w = 1.0;
  tmpvar_18.xyz = _WorldSpaceCameraPos;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = (tmpvar_16 * (tmpvar_2 * unity_Scale.w));
  mediump vec3 tmpvar_20;
  mediump vec4 normal;
  normal = tmpvar_19;
  mediump vec3 x3;
  highp float vC;
  mediump vec3 x2;
  mediump vec3 x1;
  highp float tmpvar_21;
  tmpvar_21 = dot (unity_SHAr, normal);
  x1.x = tmpvar_21;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHAg, normal);
  x1.y = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHAb, normal);
  x1.z = tmpvar_23;
  mediump vec4 tmpvar_24;
  tmpvar_24 = (normal.xyzz * normal.yzzx);
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHBr, tmpvar_24);
  x2.x = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHBg, tmpvar_24);
  x2.y = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHBb, tmpvar_24);
  x2.z = tmpvar_27;
  mediump float tmpvar_28;
  tmpvar_28 = ((normal.x * normal.x) - (normal.y * normal.y));
  vC = tmpvar_28;
  highp vec3 tmpvar_29;
  tmpvar_29 = (unity_SHC.xyz * vC);
  x3 = tmpvar_29;
  tmpvar_20 = ((x1 + x2) + x3);
  shlight = tmpvar_20;
  tmpvar_7 = shlight;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD6 = (tmpvar_9 * (((_World2Object * tmpvar_18).xyz * unity_Scale.w) - _glesVertex.xyz));
}



#endif
#ifdef FRAGMENT

varying highp vec3 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform sampler2D _SpecularTex;
uniform highp float _RimPower;
uniform highp vec4 _RimColor;
uniform sampler2D _RampTex;
uniform sampler2D _MainTex;
uniform lowp vec4 _LightColor0;
uniform lowp float _Cutoff;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  tmpvar_1 = xlv_TEXCOORD1;
  tmpvar_2 = xlv_TEXCOORD2;
  tmpvar_3 = xlv_TEXCOORD3;
  lowp vec3 tmpvar_4;
  mediump float tmpvar_5;
  lowp float tmpvar_6;
  mediump vec3 rim;
  highp vec3 specGloss;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec3 normal;
  normal.xy = ((texture2D (_BumpMap, xlv_TEXCOORD0).wy * 2.0) - 1.0);
  normal.z = sqrt (((1.0 - (normal.x * normal.x)) - (normal.y * normal.y)));
  lowp vec3 tmpvar_9;
  tmpvar_9 = texture2D (_SpecularTex, xlv_TEXCOORD0).xyz;
  specGloss = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = specGloss.x;
  tmpvar_5 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = specGloss.y;
  tmpvar_6 = tmpvar_11;
  mediump vec3 tmpvar_12;
  tmpvar_12.x = dot (tmpvar_1, normal);
  tmpvar_12.y = dot (tmpvar_2, normal);
  tmpvar_12.z = dot (tmpvar_3, normal);
  mediump float tmpvar_13;
  tmpvar_13 = max (0.0, dot (vec3(0.0, 1.0, 0.0), tmpvar_12));
  highp vec3 tmpvar_14;
  tmpvar_14 = (((pow (tmpvar_13, _RimPower) * _RimColor.xyz) * _RimColor.w) * specGloss.z);
  rim = tmpvar_14;
  tmpvar_4 = rim;
  lowp float x;
  x = (tmpvar_8.w - _Cutoff);
  if ((x < 0.0)) {
    discard;
  };
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize (xlv_TEXCOORD6);
  lowp vec3 viewDir;
  viewDir = tmpvar_15;
  lowp vec4 c_i0;
  highp float nh;
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_RampTex, vec2(((dot (normal, xlv_TEXCOORD4) * 0.5) + 0.5)));
  lowp float tmpvar_17;
  tmpvar_17 = max (0.0, dot (normal, normalize ((xlv_TEXCOORD4 + viewDir))));
  nh = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = ((((tmpvar_7.xyz * tmpvar_16.xyz) * _LightColor0.xyz) + (_LightColor0.xyz * (pow (nh, (tmpvar_6 * 128.0)) * tmpvar_5))) * 2.0);
  c_i0.xyz = tmpvar_18;
  c_i0.w = tmpvar_8.w;
  c = c_i0;
  c.xyz = (c_i0.xyz + (tmpvar_7.xyz * xlv_TEXCOORD5));
  c.xyz = (c.xyz + tmpvar_4);
  c.w = tmpvar_8.w;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 13 [unity_Scale]
Matrix 5 [_Object2World]
Vector 15 [unity_LightmapST]
Vector 16 [_MainTex_ST]
"3.0-!!ARBvp1.0
# 22 ALU
PARAM c[17] = { program.local[0],
		state.matrix.mvp,
		program.local[5..16] };
TEMP R0;
TEMP R1;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R1.xyz, R0, vertex.attrib[14].w;
DP3 R0.y, R1, c[5];
DP3 R0.x, vertex.attrib[14], c[5];
DP3 R0.z, vertex.normal, c[5];
MUL result.texcoord[1].xyz, R0, c[13].w;
DP3 R0.y, R1, c[6];
DP3 R0.x, vertex.attrib[14], c[6];
DP3 R0.z, vertex.normal, c[6];
MUL result.texcoord[2].xyz, R0, c[13].w;
DP3 R0.y, R1, c[7];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[3].xyz, R0, c[13].w;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[16], c[16].zwzw;
MAD result.texcoord[4].xy, vertex.texcoord[1], c[15], c[15].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 22 instructions, 2 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "SHADOWS_OFF" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 12 [unity_Scale]
Matrix 4 [_Object2World]
Vector 13 [unity_LightmapST]
Vector 14 [_MainTex_ST]
"vs_3_0
; 23 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r1.xyz, r0, v1.w
dp3 r0.y, r1, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul o2.xyz, r0, c12.w
dp3 r0.y, r1, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul o3.xyz, r0, c12.w
dp3 r0.y, r1, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul o4.xyz, r0, c12.w
mad o1.xy, v3, c14, c14.zwzw
mad o5.xy, v4, c13, c13.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "SHADOWS_OFF" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec2 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;

uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = tmpvar_1.xyz;
  tmpvar_6[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_6[2] = tmpvar_2;
  mat3 tmpvar_7;
  tmpvar_7[0].x = tmpvar_6[0].x;
  tmpvar_7[0].y = tmpvar_6[1].x;
  tmpvar_7[0].z = tmpvar_6[2].x;
  tmpvar_7[1].x = tmpvar_6[0].y;
  tmpvar_7[1].y = tmpvar_6[1].y;
  tmpvar_7[1].z = tmpvar_6[2].y;
  tmpvar_7[2].x = tmpvar_6[0].z;
  tmpvar_7[2].y = tmpvar_6[1].z;
  tmpvar_7[2].z = tmpvar_6[2].z;
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  vec3 v_i0;
  v_i0.x = tmpvar_8[0].x;
  v_i0.y = tmpvar_8[1].x;
  v_i0.z = tmpvar_8[2].x;
  highp vec3 tmpvar_9;
  tmpvar_9 = ((tmpvar_7 * v_i0) * unity_Scale.w);
  tmpvar_3 = tmpvar_9;
  mat3 tmpvar_10;
  tmpvar_10[0] = _Object2World[0].xyz;
  tmpvar_10[1] = _Object2World[1].xyz;
  tmpvar_10[2] = _Object2World[2].xyz;
  vec3 v_i0_i1;
  v_i0_i1.x = tmpvar_10[0].y;
  v_i0_i1.y = tmpvar_10[1].y;
  v_i0_i1.z = tmpvar_10[2].y;
  highp vec3 tmpvar_11;
  tmpvar_11 = ((tmpvar_7 * v_i0_i1) * unity_Scale.w);
  tmpvar_4 = tmpvar_11;
  mat3 tmpvar_12;
  tmpvar_12[0] = _Object2World[0].xyz;
  tmpvar_12[1] = _Object2World[1].xyz;
  tmpvar_12[2] = _Object2World[2].xyz;
  vec3 v_i0_i1_i2;
  v_i0_i1_i2.x = tmpvar_12[0].z;
  v_i0_i1_i2.y = tmpvar_12[1].z;
  v_i0_i1_i2.z = tmpvar_12[2].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = ((tmpvar_7 * v_i0_i1_i2) * unity_Scale.w);
  tmpvar_5 = tmpvar_13;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

varying highp vec2 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform sampler2D unity_Lightmap;
uniform sampler2D _SpecularTex;
uniform highp float _RimPower;
uniform highp vec4 _RimColor;
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  tmpvar_1 = xlv_TEXCOORD1;
  tmpvar_2 = xlv_TEXCOORD2;
  tmpvar_3 = xlv_TEXCOORD3;
  lowp vec3 tmpvar_4;
  mediump vec3 rim;
  highp vec3 specGloss;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec3 tmpvar_7;
  tmpvar_7 = ((texture2D (_BumpMap, xlv_TEXCOORD0).xyz * 2.0) - 1.0);
  lowp vec3 tmpvar_8;
  tmpvar_8 = texture2D (_SpecularTex, xlv_TEXCOORD0).xyz;
  specGloss = tmpvar_8;
  mediump vec3 tmpvar_9;
  tmpvar_9.x = dot (tmpvar_1, tmpvar_7);
  tmpvar_9.y = dot (tmpvar_2, tmpvar_7);
  tmpvar_9.z = dot (tmpvar_3, tmpvar_7);
  mediump float tmpvar_10;
  tmpvar_10 = max (0.0, dot (vec3(0.0, 1.0, 0.0), tmpvar_9));
  highp vec3 tmpvar_11;
  tmpvar_11 = (((pow (tmpvar_10, _RimPower) * _RimColor.xyz) * _RimColor.w) * specGloss.z);
  rim = tmpvar_11;
  tmpvar_4 = rim;
  lowp float x;
  x = (tmpvar_6.w - _Cutoff);
  if ((x < 0.0)) {
    discard;
  };
  c = vec4(0.0, 0.0, 0.0, 0.0);
  c.xyz = (tmpvar_5.xyz * (2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD4).xyz));
  c.w = tmpvar_6.w;
  c.xyz = (c.xyz + tmpvar_4);
  c.w = tmpvar_6.w;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "SHADOWS_OFF" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec2 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;

uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  highp mat3 tmpvar_6;
  tmpvar_6[0] = tmpvar_1.xyz;
  tmpvar_6[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_6[2] = tmpvar_2;
  mat3 tmpvar_7;
  tmpvar_7[0].x = tmpvar_6[0].x;
  tmpvar_7[0].y = tmpvar_6[1].x;
  tmpvar_7[0].z = tmpvar_6[2].x;
  tmpvar_7[1].x = tmpvar_6[0].y;
  tmpvar_7[1].y = tmpvar_6[1].y;
  tmpvar_7[1].z = tmpvar_6[2].y;
  tmpvar_7[2].x = tmpvar_6[0].z;
  tmpvar_7[2].y = tmpvar_6[1].z;
  tmpvar_7[2].z = tmpvar_6[2].z;
  mat3 tmpvar_8;
  tmpvar_8[0] = _Object2World[0].xyz;
  tmpvar_8[1] = _Object2World[1].xyz;
  tmpvar_8[2] = _Object2World[2].xyz;
  vec3 v_i0;
  v_i0.x = tmpvar_8[0].x;
  v_i0.y = tmpvar_8[1].x;
  v_i0.z = tmpvar_8[2].x;
  highp vec3 tmpvar_9;
  tmpvar_9 = ((tmpvar_7 * v_i0) * unity_Scale.w);
  tmpvar_3 = tmpvar_9;
  mat3 tmpvar_10;
  tmpvar_10[0] = _Object2World[0].xyz;
  tmpvar_10[1] = _Object2World[1].xyz;
  tmpvar_10[2] = _Object2World[2].xyz;
  vec3 v_i0_i1;
  v_i0_i1.x = tmpvar_10[0].y;
  v_i0_i1.y = tmpvar_10[1].y;
  v_i0_i1.z = tmpvar_10[2].y;
  highp vec3 tmpvar_11;
  tmpvar_11 = ((tmpvar_7 * v_i0_i1) * unity_Scale.w);
  tmpvar_4 = tmpvar_11;
  mat3 tmpvar_12;
  tmpvar_12[0] = _Object2World[0].xyz;
  tmpvar_12[1] = _Object2World[1].xyz;
  tmpvar_12[2] = _Object2World[2].xyz;
  vec3 v_i0_i1_i2;
  v_i0_i1_i2.x = tmpvar_12[0].z;
  v_i0_i1_i2.y = tmpvar_12[1].z;
  v_i0_i1_i2.z = tmpvar_12[2].z;
  highp vec3 tmpvar_13;
  tmpvar_13 = ((tmpvar_7 * v_i0_i1_i2) * unity_Scale.w);
  tmpvar_5 = tmpvar_13;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
}



#endif
#ifdef FRAGMENT

varying highp vec2 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform sampler2D unity_Lightmap;
uniform sampler2D _SpecularTex;
uniform highp float _RimPower;
uniform highp vec4 _RimColor;
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  tmpvar_1 = xlv_TEXCOORD1;
  tmpvar_2 = xlv_TEXCOORD2;
  tmpvar_3 = xlv_TEXCOORD3;
  lowp vec3 tmpvar_4;
  mediump vec3 rim;
  highp vec3 specGloss;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec3 normal;
  normal.xy = ((texture2D (_BumpMap, xlv_TEXCOORD0).wy * 2.0) - 1.0);
  normal.z = sqrt (((1.0 - (normal.x * normal.x)) - (normal.y * normal.y)));
  lowp vec3 tmpvar_7;
  tmpvar_7 = texture2D (_SpecularTex, xlv_TEXCOORD0).xyz;
  specGloss = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8.x = dot (tmpvar_1, normal);
  tmpvar_8.y = dot (tmpvar_2, normal);
  tmpvar_8.z = dot (tmpvar_3, normal);
  mediump float tmpvar_9;
  tmpvar_9 = max (0.0, dot (vec3(0.0, 1.0, 0.0), tmpvar_8));
  highp vec3 tmpvar_10;
  tmpvar_10 = (((pow (tmpvar_9, _RimPower) * _RimColor.xyz) * _RimColor.w) * specGloss.z);
  rim = tmpvar_10;
  tmpvar_4 = rim;
  lowp float x;
  x = (tmpvar_6.w - _Cutoff);
  if ((x < 0.0)) {
    discard;
  };
  c = vec4(0.0, 0.0, 0.0, 0.0);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (unity_Lightmap, xlv_TEXCOORD4);
  c.xyz = (tmpvar_5.xyz * ((8.0 * tmpvar_11.w) * tmpvar_11.xyz));
  c.w = tmpvar_6.w;
  c.xyz = (c.xyz + tmpvar_4);
  c.w = tmpvar_6.w;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_SCREEN" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Vector 13 [_ProjectionParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Vector 16 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 17 [unity_SHAr]
Vector 18 [unity_SHAg]
Vector 19 [unity_SHAb]
Vector 20 [unity_SHBr]
Vector 21 [unity_SHBg]
Vector 22 [unity_SHBb]
Vector 23 [unity_SHC]
Vector 24 [_MainTex_ST]
"3.0-!!ARBvp1.0
# 60 ALU
PARAM c[25] = { { 1, 0.5 },
		state.matrix.mvp,
		program.local[5..24] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MUL R1.xyz, vertex.normal, c[14].w;
DP3 R2.w, R1, c[6];
DP3 R0.x, R1, c[5];
DP3 R0.z, R1, c[7];
MOV R0.y, R2.w;
MOV R0.w, c[0].x;
MUL R1, R0.xyzz, R0.yzzx;
DP4 R2.z, R0, c[19];
DP4 R2.y, R0, c[18];
DP4 R2.x, R0, c[17];
MUL R0.w, R2, R2;
MAD R0.w, R0.x, R0.x, -R0;
DP4 R0.z, R1, c[22];
DP4 R0.y, R1, c[21];
DP4 R0.x, R1, c[20];
MUL R1.xyz, R0.w, c[23];
ADD R0.xyz, R2, R0;
ADD result.texcoord[5].xyz, R0, R1;
MOV R1.w, c[0].x;
MOV R1.xyz, c[15];
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
MAD R2.xyz, R2, c[14].w, -vertex.position;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R1, c[16];
MUL R0.xyz, R0, vertex.attrib[14].w;
DP4 R3.z, R1, c[11];
DP4 R3.x, R1, c[9];
DP4 R3.y, R1, c[10];
DP3 R1.y, R0, c[5];
DP3 result.texcoord[4].y, R0, R3;
DP3 result.texcoord[6].y, R0, R2;
DP4 R0.w, vertex.position, c[4];
DP3 R1.x, vertex.attrib[14], c[5];
DP3 R1.z, vertex.normal, c[5];
MUL result.texcoord[1].xyz, R1, c[14].w;
DP3 R1.y, R0, c[6];
DP3 R0.y, R0, c[7];
DP3 R1.x, vertex.attrib[14], c[6];
DP3 R1.z, vertex.normal, c[6];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[3].xyz, R0, c[14].w;
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL result.texcoord[2].xyz, R1, c[14].w;
MUL R1.xyz, R0.xyww, c[0].y;
MUL R1.y, R1, c[13].x;
DP3 result.texcoord[4].z, vertex.normal, R3;
DP3 result.texcoord[4].x, vertex.attrib[14], R3;
DP3 result.texcoord[6].z, vertex.normal, R2;
DP3 result.texcoord[6].x, vertex.attrib[14], R2;
ADD result.texcoord[7].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[7].zw, R0;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[24], c[24].zwzw;
END
# 60 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_SCREEN" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Vector 16 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 17 [unity_SHAr]
Vector 18 [unity_SHAg]
Vector 19 [unity_SHAb]
Vector 20 [unity_SHBr]
Vector 21 [unity_SHBg]
Vector 22 [unity_SHBb]
Vector 23 [unity_SHC]
Vector 24 [_MainTex_ST]
"vs_3_0
; 63 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
dcl_texcoord7 o8
def c25, 1.00000000, 0.50000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mul r1.xyz, v2, c14.w
dp3 r2.w, r1, c5
dp3 r0.x, r1, c4
dp3 r0.z, r1, c6
mov r0.y, r2.w
mov r0.w, c25.x
mul r1, r0.xyzz, r0.yzzx
dp4 r2.z, r0, c19
dp4 r2.y, r0, c18
dp4 r2.x, r0, c17
mul r0.w, r2, r2
mad r0.w, r0.x, r0.x, -r0
dp4 r0.z, r1, c22
dp4 r0.y, r1, c21
dp4 r0.x, r1, c20
mul r1.xyz, r0.w, c23
add r0.xyz, r2, r0
add o6.xyz, r0, r1
mov r0.w, c25.x
mov r0.xyz, c15
dp4 r1.z, r0, c10
dp4 r1.y, r0, c9
dp4 r1.x, r0, c8
mad r3.xyz, r1, c14.w, -v0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r1, v1.w
mov r0, c10
dp4 r4.z, c16, r0
mov r0, c9
dp4 r4.y, c16, r0
mov r1, c8
dp4 r4.x, c16, r1
dp4 r0.w, v0, c3
dp3 r0.y, r2, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul o2.xyz, r0, c14.w
dp3 r0.y, r2, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul o3.xyz, r0, c14.w
dp3 r0.y, r2, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul o4.xyz, r0, c14.w
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c25.y
mul r1.y, r1, c12.x
dp3 o5.y, r2, r4
dp3 o7.y, r2, r3
dp3 o5.z, v2, r4
dp3 o5.x, v1, r4
dp3 o7.z, v2, r3
dp3 o7.x, v1, r3
mad o8.xy, r1.z, c13.zwzw, r1
mov o0, r0
mov o8.zw, r0
mad o1.xy, v3, c24, c24.zwzw
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_SCREEN" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec4 xlv_TEXCOORD7;
varying highp vec3 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_SHC;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec3 shlight;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (gl_ModelViewProjectionMatrix * _glesVertex);
  highp mat3 tmpvar_9;
  tmpvar_9[0] = tmpvar_1.xyz;
  tmpvar_9[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_9[2] = tmpvar_2;
  mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_9[0].x;
  tmpvar_10[0].y = tmpvar_9[1].x;
  tmpvar_10[0].z = tmpvar_9[2].x;
  tmpvar_10[1].x = tmpvar_9[0].y;
  tmpvar_10[1].y = tmpvar_9[1].y;
  tmpvar_10[1].z = tmpvar_9[2].y;
  tmpvar_10[2].x = tmpvar_9[0].z;
  tmpvar_10[2].y = tmpvar_9[1].z;
  tmpvar_10[2].z = tmpvar_9[2].z;
  mat3 tmpvar_11;
  tmpvar_11[0] = _Object2World[0].xyz;
  tmpvar_11[1] = _Object2World[1].xyz;
  tmpvar_11[2] = _Object2World[2].xyz;
  vec3 v_i0;
  v_i0.x = tmpvar_11[0].x;
  v_i0.y = tmpvar_11[1].x;
  v_i0.z = tmpvar_11[2].x;
  highp vec3 tmpvar_12;
  tmpvar_12 = ((tmpvar_10 * v_i0) * unity_Scale.w);
  tmpvar_3 = tmpvar_12;
  mat3 tmpvar_13;
  tmpvar_13[0] = _Object2World[0].xyz;
  tmpvar_13[1] = _Object2World[1].xyz;
  tmpvar_13[2] = _Object2World[2].xyz;
  vec3 v_i0_i1;
  v_i0_i1.x = tmpvar_13[0].y;
  v_i0_i1.y = tmpvar_13[1].y;
  v_i0_i1.z = tmpvar_13[2].y;
  highp vec3 tmpvar_14;
  tmpvar_14 = ((tmpvar_10 * v_i0_i1) * unity_Scale.w);
  tmpvar_4 = tmpvar_14;
  mat3 tmpvar_15;
  tmpvar_15[0] = _Object2World[0].xyz;
  tmpvar_15[1] = _Object2World[1].xyz;
  tmpvar_15[2] = _Object2World[2].xyz;
  vec3 v_i0_i1_i2;
  v_i0_i1_i2.x = tmpvar_15[0].z;
  v_i0_i1_i2.y = tmpvar_15[1].z;
  v_i0_i1_i2.z = tmpvar_15[2].z;
  highp vec3 tmpvar_16;
  tmpvar_16 = ((tmpvar_10 * v_i0_i1_i2) * unity_Scale.w);
  tmpvar_5 = tmpvar_16;
  mat3 tmpvar_17;
  tmpvar_17[0] = _Object2World[0].xyz;
  tmpvar_17[1] = _Object2World[1].xyz;
  tmpvar_17[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = (tmpvar_10 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_6 = tmpvar_18;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = _WorldSpaceCameraPos;
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = (tmpvar_17 * (tmpvar_2 * unity_Scale.w));
  mediump vec3 tmpvar_21;
  mediump vec4 normal;
  normal = tmpvar_20;
  mediump vec3 x3;
  highp float vC;
  mediump vec3 x2;
  mediump vec3 x1;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHAr, normal);
  x1.x = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHAg, normal);
  x1.y = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHAb, normal);
  x1.z = tmpvar_24;
  mediump vec4 tmpvar_25;
  tmpvar_25 = (normal.xyzz * normal.yzzx);
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHBr, tmpvar_25);
  x2.x = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHBg, tmpvar_25);
  x2.y = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = dot (unity_SHBb, tmpvar_25);
  x2.z = tmpvar_28;
  mediump float tmpvar_29;
  tmpvar_29 = ((normal.x * normal.x) - (normal.y * normal.y));
  vC = tmpvar_29;
  highp vec3 tmpvar_30;
  tmpvar_30 = (unity_SHC.xyz * vC);
  x3 = tmpvar_30;
  tmpvar_21 = ((x1 + x2) + x3);
  shlight = tmpvar_21;
  tmpvar_7 = shlight;
  highp vec4 o_i0;
  highp vec4 tmpvar_31;
  tmpvar_31 = (tmpvar_8 * 0.5);
  o_i0 = tmpvar_31;
  highp vec2 tmpvar_32;
  tmpvar_32.x = tmpvar_31.x;
  tmpvar_32.y = (tmpvar_31.y * _ProjectionParams.x);
  o_i0.xy = (tmpvar_32 + tmpvar_31.w);
  o_i0.zw = tmpvar_8.zw;
  gl_Position = tmpvar_8;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD6 = (tmpvar_10 * (((_World2Object * tmpvar_19).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD7 = o_i0;
}



#endif
#ifdef FRAGMENT

varying highp vec4 xlv_TEXCOORD7;
varying highp vec3 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform sampler2D _SpecularTex;
uniform sampler2D _ShadowMapTexture;
uniform highp float _RimPower;
uniform highp vec4 _RimColor;
uniform sampler2D _RampTex;
uniform sampler2D _MainTex;
uniform lowp vec4 _LightColor0;
uniform lowp float _Cutoff;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  tmpvar_1 = xlv_TEXCOORD1;
  tmpvar_2 = xlv_TEXCOORD2;
  tmpvar_3 = xlv_TEXCOORD3;
  lowp vec3 tmpvar_4;
  mediump float tmpvar_5;
  lowp float tmpvar_6;
  mediump vec3 rim;
  highp vec3 specGloss;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture2D (_BumpMap, xlv_TEXCOORD0).xyz * 2.0) - 1.0);
  lowp vec3 tmpvar_10;
  tmpvar_10 = texture2D (_SpecularTex, xlv_TEXCOORD0).xyz;
  specGloss = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = specGloss.x;
  tmpvar_5 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = specGloss.y;
  tmpvar_6 = tmpvar_12;
  mediump vec3 tmpvar_13;
  tmpvar_13.x = dot (tmpvar_1, tmpvar_9);
  tmpvar_13.y = dot (tmpvar_2, tmpvar_9);
  tmpvar_13.z = dot (tmpvar_3, tmpvar_9);
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (vec3(0.0, 1.0, 0.0), tmpvar_13));
  highp vec3 tmpvar_15;
  tmpvar_15 = (((pow (tmpvar_14, _RimPower) * _RimColor.xyz) * _RimColor.w) * specGloss.z);
  rim = tmpvar_15;
  tmpvar_4 = rim;
  lowp float x;
  x = (tmpvar_8.w - _Cutoff);
  if ((x < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD7);
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize (xlv_TEXCOORD6);
  lowp vec3 viewDir;
  viewDir = tmpvar_17;
  lowp vec4 c_i0;
  highp float nh;
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_RampTex, vec2((((dot (tmpvar_9, xlv_TEXCOORD4) * 0.5) + 0.5) * tmpvar_16.x)));
  lowp float tmpvar_19;
  tmpvar_19 = max (0.0, dot (tmpvar_9, normalize ((xlv_TEXCOORD4 + viewDir))));
  nh = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = ((((tmpvar_7.xyz * tmpvar_18.xyz) * _LightColor0.xyz) + (_LightColor0.xyz * (pow (nh, (tmpvar_6 * 128.0)) * tmpvar_5))) * (tmpvar_16.x * 2.0));
  c_i0.xyz = tmpvar_20;
  c_i0.w = tmpvar_8.w;
  c = c_i0;
  c.xyz = (c_i0.xyz + (tmpvar_7.xyz * xlv_TEXCOORD5));
  c.xyz = (c.xyz + tmpvar_4);
  c.w = tmpvar_8.w;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_SCREEN" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec4 xlv_TEXCOORD7;
varying highp vec3 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_SHC;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec3 shlight;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (gl_ModelViewProjectionMatrix * _glesVertex);
  highp mat3 tmpvar_9;
  tmpvar_9[0] = tmpvar_1.xyz;
  tmpvar_9[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_9[2] = tmpvar_2;
  mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_9[0].x;
  tmpvar_10[0].y = tmpvar_9[1].x;
  tmpvar_10[0].z = tmpvar_9[2].x;
  tmpvar_10[1].x = tmpvar_9[0].y;
  tmpvar_10[1].y = tmpvar_9[1].y;
  tmpvar_10[1].z = tmpvar_9[2].y;
  tmpvar_10[2].x = tmpvar_9[0].z;
  tmpvar_10[2].y = tmpvar_9[1].z;
  tmpvar_10[2].z = tmpvar_9[2].z;
  mat3 tmpvar_11;
  tmpvar_11[0] = _Object2World[0].xyz;
  tmpvar_11[1] = _Object2World[1].xyz;
  tmpvar_11[2] = _Object2World[2].xyz;
  vec3 v_i0;
  v_i0.x = tmpvar_11[0].x;
  v_i0.y = tmpvar_11[1].x;
  v_i0.z = tmpvar_11[2].x;
  highp vec3 tmpvar_12;
  tmpvar_12 = ((tmpvar_10 * v_i0) * unity_Scale.w);
  tmpvar_3 = tmpvar_12;
  mat3 tmpvar_13;
  tmpvar_13[0] = _Object2World[0].xyz;
  tmpvar_13[1] = _Object2World[1].xyz;
  tmpvar_13[2] = _Object2World[2].xyz;
  vec3 v_i0_i1;
  v_i0_i1.x = tmpvar_13[0].y;
  v_i0_i1.y = tmpvar_13[1].y;
  v_i0_i1.z = tmpvar_13[2].y;
  highp vec3 tmpvar_14;
  tmpvar_14 = ((tmpvar_10 * v_i0_i1) * unity_Scale.w);
  tmpvar_4 = tmpvar_14;
  mat3 tmpvar_15;
  tmpvar_15[0] = _Object2World[0].xyz;
  tmpvar_15[1] = _Object2World[1].xyz;
  tmpvar_15[2] = _Object2World[2].xyz;
  vec3 v_i0_i1_i2;
  v_i0_i1_i2.x = tmpvar_15[0].z;
  v_i0_i1_i2.y = tmpvar_15[1].z;
  v_i0_i1_i2.z = tmpvar_15[2].z;
  highp vec3 tmpvar_16;
  tmpvar_16 = ((tmpvar_10 * v_i0_i1_i2) * unity_Scale.w);
  tmpvar_5 = tmpvar_16;
  mat3 tmpvar_17;
  tmpvar_17[0] = _Object2World[0].xyz;
  tmpvar_17[1] = _Object2World[1].xyz;
  tmpvar_17[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = (tmpvar_10 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_6 = tmpvar_18;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = _WorldSpaceCameraPos;
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = (tmpvar_17 * (tmpvar_2 * unity_Scale.w));
  mediump vec3 tmpvar_21;
  mediump vec4 normal;
  normal = tmpvar_20;
  mediump vec3 x3;
  highp float vC;
  mediump vec3 x2;
  mediump vec3 x1;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHAr, normal);
  x1.x = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHAg, normal);
  x1.y = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHAb, normal);
  x1.z = tmpvar_24;
  mediump vec4 tmpvar_25;
  tmpvar_25 = (normal.xyzz * normal.yzzx);
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHBr, tmpvar_25);
  x2.x = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHBg, tmpvar_25);
  x2.y = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = dot (unity_SHBb, tmpvar_25);
  x2.z = tmpvar_28;
  mediump float tmpvar_29;
  tmpvar_29 = ((normal.x * normal.x) - (normal.y * normal.y));
  vC = tmpvar_29;
  highp vec3 tmpvar_30;
  tmpvar_30 = (unity_SHC.xyz * vC);
  x3 = tmpvar_30;
  tmpvar_21 = ((x1 + x2) + x3);
  shlight = tmpvar_21;
  tmpvar_7 = shlight;
  highp vec4 o_i0;
  highp vec4 tmpvar_31;
  tmpvar_31 = (tmpvar_8 * 0.5);
  o_i0 = tmpvar_31;
  highp vec2 tmpvar_32;
  tmpvar_32.x = tmpvar_31.x;
  tmpvar_32.y = (tmpvar_31.y * _ProjectionParams.x);
  o_i0.xy = (tmpvar_32 + tmpvar_31.w);
  o_i0.zw = tmpvar_8.zw;
  gl_Position = tmpvar_8;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD6 = (tmpvar_10 * (((_World2Object * tmpvar_19).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD7 = o_i0;
}



#endif
#ifdef FRAGMENT

varying highp vec4 xlv_TEXCOORD7;
varying highp vec3 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform sampler2D _SpecularTex;
uniform sampler2D _ShadowMapTexture;
uniform highp float _RimPower;
uniform highp vec4 _RimColor;
uniform sampler2D _RampTex;
uniform sampler2D _MainTex;
uniform lowp vec4 _LightColor0;
uniform lowp float _Cutoff;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  tmpvar_1 = xlv_TEXCOORD1;
  tmpvar_2 = xlv_TEXCOORD2;
  tmpvar_3 = xlv_TEXCOORD3;
  lowp vec3 tmpvar_4;
  mediump float tmpvar_5;
  lowp float tmpvar_6;
  mediump vec3 rim;
  highp vec3 specGloss;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec3 normal;
  normal.xy = ((texture2D (_BumpMap, xlv_TEXCOORD0).wy * 2.0) - 1.0);
  normal.z = sqrt (((1.0 - (normal.x * normal.x)) - (normal.y * normal.y)));
  lowp vec3 tmpvar_9;
  tmpvar_9 = texture2D (_SpecularTex, xlv_TEXCOORD0).xyz;
  specGloss = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = specGloss.x;
  tmpvar_5 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = specGloss.y;
  tmpvar_6 = tmpvar_11;
  mediump vec3 tmpvar_12;
  tmpvar_12.x = dot (tmpvar_1, normal);
  tmpvar_12.y = dot (tmpvar_2, normal);
  tmpvar_12.z = dot (tmpvar_3, normal);
  mediump float tmpvar_13;
  tmpvar_13 = max (0.0, dot (vec3(0.0, 1.0, 0.0), tmpvar_12));
  highp vec3 tmpvar_14;
  tmpvar_14 = (((pow (tmpvar_13, _RimPower) * _RimColor.xyz) * _RimColor.w) * specGloss.z);
  rim = tmpvar_14;
  tmpvar_4 = rim;
  lowp float x;
  x = (tmpvar_8.w - _Cutoff);
  if ((x < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD7);
  highp vec3 tmpvar_16;
  tmpvar_16 = normalize (xlv_TEXCOORD6);
  lowp vec3 viewDir;
  viewDir = tmpvar_16;
  lowp vec4 c_i0;
  highp float nh;
  lowp vec4 tmpvar_17;
  tmpvar_17 = texture2D (_RampTex, vec2((((dot (normal, xlv_TEXCOORD4) * 0.5) + 0.5) * tmpvar_15.x)));
  lowp float tmpvar_18;
  tmpvar_18 = max (0.0, dot (normal, normalize ((xlv_TEXCOORD4 + viewDir))));
  nh = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = ((((tmpvar_7.xyz * tmpvar_17.xyz) * _LightColor0.xyz) + (_LightColor0.xyz * (pow (nh, (tmpvar_6 * 128.0)) * tmpvar_5))) * (tmpvar_15.x * 2.0));
  c_i0.xyz = tmpvar_19;
  c_i0.w = tmpvar_8.w;
  c = c_i0;
  c.xyz = (c_i0.xyz + (tmpvar_7.xyz * xlv_TEXCOORD5));
  c.xyz = (c.xyz + tmpvar_4);
  c.w = tmpvar_8.w;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "SHADOWS_SCREEN" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Vector 13 [_ProjectionParams]
Vector 14 [unity_Scale]
Matrix 5 [_Object2World]
Vector 16 [unity_LightmapST]
Vector 17 [_MainTex_ST]
"3.0-!!ARBvp1.0
# 27 ALU
PARAM c[18] = { { 0.5 },
		state.matrix.mvp,
		program.local[5..17] };
TEMP R0;
TEMP R1;
TEMP R2;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MUL R0.xyz, R0, vertex.attrib[14].w;
DP3 R1.y, R0, c[5];
DP3 R2.y, R0, c[7];
DP4 R0.w, vertex.position, c[4];
DP3 R1.x, vertex.attrib[14], c[5];
DP3 R1.z, vertex.normal, c[5];
MUL result.texcoord[1].xyz, R1, c[14].w;
DP3 R1.y, R0, c[6];
DP4 R0.z, vertex.position, c[3];
DP3 R1.x, vertex.attrib[14], c[6];
DP3 R1.z, vertex.normal, c[6];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL result.texcoord[2].xyz, R1, c[14].w;
MUL R1.xyz, R0.xyww, c[0].x;
MUL R1.y, R1, c[13].x;
DP3 R2.x, vertex.attrib[14], c[7];
DP3 R2.z, vertex.normal, c[7];
MUL result.texcoord[3].xyz, R2, c[14].w;
ADD result.texcoord[5].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[5].zw, R0;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[17], c[17].zwzw;
MAD result.texcoord[4].xy, vertex.texcoord[1], c[16], c[16].zwzw;
END
# 27 instructions, 3 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "SHADOWS_SCREEN" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Bind "texcoord1" TexCoord1
Matrix 0 [glstate_matrix_mvp]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_Scale]
Matrix 4 [_Object2World]
Vector 15 [unity_LightmapST]
Vector 16 [_MainTex_ST]
"vs_3_0
; 28 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
def c17, 0.50000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
dcl_texcoord1 v4
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r0.xyz, v2.yzxw, r0.zxyw, -r1
mul r0.xyz, r0, v1.w
dp3 r1.y, r0, c4
dp3 r2.y, r0, c6
dp4 r0.w, v0, c3
dp3 r1.x, v1, c4
dp3 r1.z, v2, c4
mul o2.xyz, r1, c14.w
dp3 r1.y, r0, c5
dp4 r0.z, v0, c2
dp3 r1.x, v1, c5
dp3 r1.z, v2, c5
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul o3.xyz, r1, c14.w
mul r1.xyz, r0.xyww, c17.x
mul r1.y, r1, c12.x
dp3 r2.x, v1, c6
dp3 r2.z, v2, c6
mul o4.xyz, r2, c14.w
mad o6.xy, r1.z, c13.zwzw, r1
mov o0, r0
mov o6.zw, r0
mad o1.xy, v3, c16, c16.zwzw
mad o5.xy, v4, c15, c15.zwzw
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "SHADOWS_SCREEN" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;

uniform highp vec4 _ProjectionParams;
uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (gl_ModelViewProjectionMatrix * _glesVertex);
  highp mat3 tmpvar_7;
  tmpvar_7[0] = tmpvar_1.xyz;
  tmpvar_7[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_7[2] = tmpvar_2;
  mat3 tmpvar_8;
  tmpvar_8[0].x = tmpvar_7[0].x;
  tmpvar_8[0].y = tmpvar_7[1].x;
  tmpvar_8[0].z = tmpvar_7[2].x;
  tmpvar_8[1].x = tmpvar_7[0].y;
  tmpvar_8[1].y = tmpvar_7[1].y;
  tmpvar_8[1].z = tmpvar_7[2].y;
  tmpvar_8[2].x = tmpvar_7[0].z;
  tmpvar_8[2].y = tmpvar_7[1].z;
  tmpvar_8[2].z = tmpvar_7[2].z;
  mat3 tmpvar_9;
  tmpvar_9[0] = _Object2World[0].xyz;
  tmpvar_9[1] = _Object2World[1].xyz;
  tmpvar_9[2] = _Object2World[2].xyz;
  vec3 v_i0;
  v_i0.x = tmpvar_9[0].x;
  v_i0.y = tmpvar_9[1].x;
  v_i0.z = tmpvar_9[2].x;
  highp vec3 tmpvar_10;
  tmpvar_10 = ((tmpvar_8 * v_i0) * unity_Scale.w);
  tmpvar_3 = tmpvar_10;
  mat3 tmpvar_11;
  tmpvar_11[0] = _Object2World[0].xyz;
  tmpvar_11[1] = _Object2World[1].xyz;
  tmpvar_11[2] = _Object2World[2].xyz;
  vec3 v_i0_i1;
  v_i0_i1.x = tmpvar_11[0].y;
  v_i0_i1.y = tmpvar_11[1].y;
  v_i0_i1.z = tmpvar_11[2].y;
  highp vec3 tmpvar_12;
  tmpvar_12 = ((tmpvar_8 * v_i0_i1) * unity_Scale.w);
  tmpvar_4 = tmpvar_12;
  mat3 tmpvar_13;
  tmpvar_13[0] = _Object2World[0].xyz;
  tmpvar_13[1] = _Object2World[1].xyz;
  tmpvar_13[2] = _Object2World[2].xyz;
  vec3 v_i0_i1_i2;
  v_i0_i1_i2.x = tmpvar_13[0].z;
  v_i0_i1_i2.y = tmpvar_13[1].z;
  v_i0_i1_i2.z = tmpvar_13[2].z;
  highp vec3 tmpvar_14;
  tmpvar_14 = ((tmpvar_8 * v_i0_i1_i2) * unity_Scale.w);
  tmpvar_5 = tmpvar_14;
  highp vec4 o_i0;
  highp vec4 tmpvar_15;
  tmpvar_15 = (tmpvar_6 * 0.5);
  o_i0 = tmpvar_15;
  highp vec2 tmpvar_16;
  tmpvar_16.x = tmpvar_15.x;
  tmpvar_16.y = (tmpvar_15.y * _ProjectionParams.x);
  o_i0.xy = (tmpvar_16 + tmpvar_15.w);
  o_i0.zw = tmpvar_6.zw;
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD5 = o_i0;
}



#endif
#ifdef FRAGMENT

varying highp vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform sampler2D unity_Lightmap;
uniform sampler2D _SpecularTex;
uniform sampler2D _ShadowMapTexture;
uniform highp float _RimPower;
uniform highp vec4 _RimColor;
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  tmpvar_1 = xlv_TEXCOORD1;
  tmpvar_2 = xlv_TEXCOORD2;
  tmpvar_3 = xlv_TEXCOORD3;
  lowp vec3 tmpvar_4;
  mediump vec3 rim;
  highp vec3 specGloss;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec3 tmpvar_7;
  tmpvar_7 = ((texture2D (_BumpMap, xlv_TEXCOORD0).xyz * 2.0) - 1.0);
  lowp vec3 tmpvar_8;
  tmpvar_8 = texture2D (_SpecularTex, xlv_TEXCOORD0).xyz;
  specGloss = tmpvar_8;
  mediump vec3 tmpvar_9;
  tmpvar_9.x = dot (tmpvar_1, tmpvar_7);
  tmpvar_9.y = dot (tmpvar_2, tmpvar_7);
  tmpvar_9.z = dot (tmpvar_3, tmpvar_7);
  mediump float tmpvar_10;
  tmpvar_10 = max (0.0, dot (vec3(0.0, 1.0, 0.0), tmpvar_9));
  highp vec3 tmpvar_11;
  tmpvar_11 = (((pow (tmpvar_10, _RimPower) * _RimColor.xyz) * _RimColor.w) * specGloss.z);
  rim = tmpvar_11;
  tmpvar_4 = rim;
  lowp float x;
  x = (tmpvar_6.w - _Cutoff);
  if ((x < 0.0)) {
    discard;
  };
  c = vec4(0.0, 0.0, 0.0, 0.0);
  c.xyz = (tmpvar_5.xyz * min ((2.0 * texture2D (unity_Lightmap, xlv_TEXCOORD4).xyz), vec3((texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5).x * 2.0))));
  c.w = tmpvar_6.w;
  c.xyz = (c.xyz + tmpvar_4);
  c.w = tmpvar_6.w;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "SHADOWS_SCREEN" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_LightmapST;

uniform highp vec4 _ProjectionParams;
uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord1;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  highp vec4 tmpvar_6;
  tmpvar_6 = (gl_ModelViewProjectionMatrix * _glesVertex);
  highp mat3 tmpvar_7;
  tmpvar_7[0] = tmpvar_1.xyz;
  tmpvar_7[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_7[2] = tmpvar_2;
  mat3 tmpvar_8;
  tmpvar_8[0].x = tmpvar_7[0].x;
  tmpvar_8[0].y = tmpvar_7[1].x;
  tmpvar_8[0].z = tmpvar_7[2].x;
  tmpvar_8[1].x = tmpvar_7[0].y;
  tmpvar_8[1].y = tmpvar_7[1].y;
  tmpvar_8[1].z = tmpvar_7[2].y;
  tmpvar_8[2].x = tmpvar_7[0].z;
  tmpvar_8[2].y = tmpvar_7[1].z;
  tmpvar_8[2].z = tmpvar_7[2].z;
  mat3 tmpvar_9;
  tmpvar_9[0] = _Object2World[0].xyz;
  tmpvar_9[1] = _Object2World[1].xyz;
  tmpvar_9[2] = _Object2World[2].xyz;
  vec3 v_i0;
  v_i0.x = tmpvar_9[0].x;
  v_i0.y = tmpvar_9[1].x;
  v_i0.z = tmpvar_9[2].x;
  highp vec3 tmpvar_10;
  tmpvar_10 = ((tmpvar_8 * v_i0) * unity_Scale.w);
  tmpvar_3 = tmpvar_10;
  mat3 tmpvar_11;
  tmpvar_11[0] = _Object2World[0].xyz;
  tmpvar_11[1] = _Object2World[1].xyz;
  tmpvar_11[2] = _Object2World[2].xyz;
  vec3 v_i0_i1;
  v_i0_i1.x = tmpvar_11[0].y;
  v_i0_i1.y = tmpvar_11[1].y;
  v_i0_i1.z = tmpvar_11[2].y;
  highp vec3 tmpvar_12;
  tmpvar_12 = ((tmpvar_8 * v_i0_i1) * unity_Scale.w);
  tmpvar_4 = tmpvar_12;
  mat3 tmpvar_13;
  tmpvar_13[0] = _Object2World[0].xyz;
  tmpvar_13[1] = _Object2World[1].xyz;
  tmpvar_13[2] = _Object2World[2].xyz;
  vec3 v_i0_i1_i2;
  v_i0_i1_i2.x = tmpvar_13[0].z;
  v_i0_i1_i2.y = tmpvar_13[1].z;
  v_i0_i1_i2.z = tmpvar_13[2].z;
  highp vec3 tmpvar_14;
  tmpvar_14 = ((tmpvar_8 * v_i0_i1_i2) * unity_Scale.w);
  tmpvar_5 = tmpvar_14;
  highp vec4 o_i0;
  highp vec4 tmpvar_15;
  tmpvar_15 = (tmpvar_6 * 0.5);
  o_i0 = tmpvar_15;
  highp vec2 tmpvar_16;
  tmpvar_16.x = tmpvar_15.x;
  tmpvar_16.y = (tmpvar_15.y * _ProjectionParams.x);
  o_i0.xy = (tmpvar_16 + tmpvar_15.w);
  o_i0.zw = tmpvar_6.zw;
  gl_Position = tmpvar_6;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = ((_glesMultiTexCoord1.xy * unity_LightmapST.xy) + unity_LightmapST.zw);
  xlv_TEXCOORD5 = o_i0;
}



#endif
#ifdef FRAGMENT

varying highp vec4 xlv_TEXCOORD5;
varying highp vec2 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform sampler2D unity_Lightmap;
uniform sampler2D _SpecularTex;
uniform sampler2D _ShadowMapTexture;
uniform highp float _RimPower;
uniform highp vec4 _RimColor;
uniform sampler2D _MainTex;
uniform lowp float _Cutoff;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  tmpvar_1 = xlv_TEXCOORD1;
  tmpvar_2 = xlv_TEXCOORD2;
  tmpvar_3 = xlv_TEXCOORD3;
  lowp vec3 tmpvar_4;
  mediump vec3 rim;
  highp vec3 specGloss;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec3 normal;
  normal.xy = ((texture2D (_BumpMap, xlv_TEXCOORD0).wy * 2.0) - 1.0);
  normal.z = sqrt (((1.0 - (normal.x * normal.x)) - (normal.y * normal.y)));
  lowp vec3 tmpvar_7;
  tmpvar_7 = texture2D (_SpecularTex, xlv_TEXCOORD0).xyz;
  specGloss = tmpvar_7;
  mediump vec3 tmpvar_8;
  tmpvar_8.x = dot (tmpvar_1, normal);
  tmpvar_8.y = dot (tmpvar_2, normal);
  tmpvar_8.z = dot (tmpvar_3, normal);
  mediump float tmpvar_9;
  tmpvar_9 = max (0.0, dot (vec3(0.0, 1.0, 0.0), tmpvar_8));
  highp vec3 tmpvar_10;
  tmpvar_10 = (((pow (tmpvar_9, _RimPower) * _RimColor.xyz) * _RimColor.w) * specGloss.z);
  rim = tmpvar_10;
  tmpvar_4 = rim;
  lowp float x;
  x = (tmpvar_6.w - _Cutoff);
  if ((x < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD5);
  c = vec4(0.0, 0.0, 0.0, 0.0);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (unity_Lightmap, xlv_TEXCOORD4);
  lowp vec3 tmpvar_13;
  tmpvar_13 = ((8.0 * tmpvar_12.w) * tmpvar_12.xyz);
  c.xyz = (tmpvar_5.xyz * max (min (tmpvar_13, ((tmpvar_11.x * 2.0) * tmpvar_12.xyz)), (tmpvar_13 * tmpvar_11.x)));
  c.w = tmpvar_6.w;
  c.xyz = (c.xyz + tmpvar_4);
  c.w = tmpvar_6.w;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Vector 13 [unity_Scale]
Vector 14 [_WorldSpaceCameraPos]
Vector 15 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 16 [unity_4LightPosX0]
Vector 17 [unity_4LightPosY0]
Vector 18 [unity_4LightPosZ0]
Vector 19 [unity_4LightAtten0]
Vector 20 [unity_LightColor0]
Vector 21 [unity_LightColor1]
Vector 22 [unity_LightColor2]
Vector 23 [unity_LightColor3]
Vector 24 [unity_SHAr]
Vector 25 [unity_SHAg]
Vector 26 [unity_SHAb]
Vector 27 [unity_SHBr]
Vector 28 [unity_SHBg]
Vector 29 [unity_SHBb]
Vector 30 [unity_SHC]
Vector 31 [_MainTex_ST]
"3.0-!!ARBvp1.0
# 86 ALU
PARAM c[32] = { { 1, 0 },
		state.matrix.mvp,
		program.local[5..31] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[13].w;
DP4 R0.x, vertex.position, c[6];
ADD R1, -R0.x, c[17];
DP3 R3.w, R3, c[6];
DP3 R4.x, R3, c[5];
DP3 R3.x, R3, c[7];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[5];
ADD R0, -R0.x, c[16];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MAD R2, R4.x, R0, R2;
MOV R4.w, c[0].x;
DP4 R4.y, vertex.position, c[7];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[18];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[19];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].x;
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].y;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[21];
MAD R1.xyz, R0.x, c[20], R1;
MAD R0.xyz, R0.z, c[22], R1;
MAD R1.xyz, R0.w, c[23], R0;
MUL R0, R4.xyzz, R4.yzzx;
MUL R1.w, R3, R3;
DP4 R3.z, R0, c[29];
DP4 R3.y, R0, c[28];
DP4 R3.x, R0, c[27];
MAD R1.w, R4.x, R4.x, -R1;
MUL R0.xyz, R1.w, c[30];
MOV R1.w, c[0].x;
DP4 R2.z, R4, c[26];
DP4 R2.y, R4, c[25];
DP4 R2.x, R4, c[24];
ADD R2.xyz, R2, R3;
ADD R0.xyz, R2, R0;
ADD result.texcoord[5].xyz, R0, R1;
MOV R1.xyz, c[14];
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
MAD R2.xyz, R2, c[13].w, -vertex.position;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R1, c[15];
MUL R0.xyz, R0, vertex.attrib[14].w;
DP4 R3.z, R1, c[11];
DP4 R3.x, R1, c[9];
DP4 R3.y, R1, c[10];
DP3 R1.y, R0, c[5];
DP3 result.texcoord[4].y, R0, R3;
DP3 result.texcoord[6].y, R0, R2;
DP3 R1.x, vertex.attrib[14], c[5];
DP3 R1.z, vertex.normal, c[5];
MUL result.texcoord[1].xyz, R1, c[13].w;
DP3 R1.y, R0, c[6];
DP3 R0.y, R0, c[7];
DP3 R1.x, vertex.attrib[14], c[6];
DP3 R1.z, vertex.normal, c[6];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[2].xyz, R1, c[13].w;
MUL result.texcoord[3].xyz, R0, c[13].w;
DP3 result.texcoord[4].z, vertex.normal, R3;
DP3 result.texcoord[4].x, vertex.attrib[14], R3;
DP3 result.texcoord[6].z, vertex.normal, R2;
DP3 result.texcoord[6].x, vertex.attrib[14], R2;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[31], c[31].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 86 instructions, 5 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_OFF" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 12 [unity_Scale]
Vector 13 [_WorldSpaceCameraPos]
Vector 14 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 15 [unity_4LightPosX0]
Vector 16 [unity_4LightPosY0]
Vector 17 [unity_4LightPosZ0]
Vector 18 [unity_4LightAtten0]
Vector 19 [unity_LightColor0]
Vector 20 [unity_LightColor1]
Vector 21 [unity_LightColor2]
Vector 22 [unity_LightColor3]
Vector 23 [unity_SHAr]
Vector 24 [unity_SHAg]
Vector 25 [unity_SHAb]
Vector 26 [unity_SHBr]
Vector 27 [unity_SHBg]
Vector 28 [unity_SHBb]
Vector 29 [unity_SHC]
Vector 30 [_MainTex_ST]
"vs_3_0
; 89 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
def c31, 1.00000000, 0.00000000, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mul r3.xyz, v2, c12.w
dp4 r0.x, v0, c5
add r1, -r0.x, c16
dp3 r3.w, r3, c5
dp3 r4.x, r3, c4
dp3 r3.x, r3, c6
mul r2, r3.w, r1
dp4 r0.x, v0, c4
add r0, -r0.x, c15
mul r1, r1, r1
mov r4.z, r3.x
mad r2, r4.x, r0, r2
mov r4.w, c31.x
dp4 r4.y, v0, c6
mad r1, r0, r0, r1
add r0, -r4.y, c17
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c18
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c31.x
dp4 r2.z, r4, c25
dp4 r2.y, r4, c24
dp4 r2.x, r4, c23
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c31.y
mul r0, r0, r1
mul r1.xyz, r0.y, c20
mad r1.xyz, r0.x, c19, r1
mad r0.xyz, r0.z, c21, r1
mad r1.xyz, r0.w, c22, r0
mul r0, r4.xyzz, r4.yzzx
mul r1.w, r3, r3
dp4 r3.z, r0, c28
dp4 r3.y, r0, c27
dp4 r3.x, r0, c26
mad r1.w, r4.x, r4.x, -r1
mul r0.xyz, r1.w, c29
add r2.xyz, r2, r3
add r0.xyz, r2, r0
add o6.xyz, r0, r1
mov r1.w, c31.x
mov r1.xyz, c13
dp4 r0.z, r1, c10
dp4 r0.y, r1, c9
dp4 r0.x, r1, c8
mad r3.xyz, r0, c12.w, -v0
mov r1.xyz, v1
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r1.yzxw
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r1, v1.w
mov r0, c10
dp4 r4.z, c14, r0
mov r0, c9
dp4 r4.y, c14, r0
mov r1, c8
dp4 r4.x, c14, r1
dp3 r0.y, r2, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul o2.xyz, r0, c12.w
dp3 r0.y, r2, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul o3.xyz, r0, c12.w
dp3 r0.y, r2, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
dp3 o5.y, r2, r4
dp3 o7.y, r2, r3
mul o4.xyz, r0, c12.w
dp3 o5.z, v2, r4
dp3 o5.x, v1, r4
dp3 o7.z, v2, r3
dp3 o7.x, v1, r3
mad o1.xy, v3, c30, c30.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_OFF" "VERTEXLIGHT_ON" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec3 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_SHC;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_LightColor[4];
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightAtten0;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec3 shlight;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = tmpvar_1.xyz;
  tmpvar_8[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_8[2] = tmpvar_2;
  mat3 tmpvar_9;
  tmpvar_9[0].x = tmpvar_8[0].x;
  tmpvar_9[0].y = tmpvar_8[1].x;
  tmpvar_9[0].z = tmpvar_8[2].x;
  tmpvar_9[1].x = tmpvar_8[0].y;
  tmpvar_9[1].y = tmpvar_8[1].y;
  tmpvar_9[1].z = tmpvar_8[2].y;
  tmpvar_9[2].x = tmpvar_8[0].z;
  tmpvar_9[2].y = tmpvar_8[1].z;
  tmpvar_9[2].z = tmpvar_8[2].z;
  mat3 tmpvar_10;
  tmpvar_10[0] = _Object2World[0].xyz;
  tmpvar_10[1] = _Object2World[1].xyz;
  tmpvar_10[2] = _Object2World[2].xyz;
  vec3 v_i0;
  v_i0.x = tmpvar_10[0].x;
  v_i0.y = tmpvar_10[1].x;
  v_i0.z = tmpvar_10[2].x;
  highp vec3 tmpvar_11;
  tmpvar_11 = ((tmpvar_9 * v_i0) * unity_Scale.w);
  tmpvar_3 = tmpvar_11;
  mat3 tmpvar_12;
  tmpvar_12[0] = _Object2World[0].xyz;
  tmpvar_12[1] = _Object2World[1].xyz;
  tmpvar_12[2] = _Object2World[2].xyz;
  vec3 v_i0_i1;
  v_i0_i1.x = tmpvar_12[0].y;
  v_i0_i1.y = tmpvar_12[1].y;
  v_i0_i1.z = tmpvar_12[2].y;
  highp vec3 tmpvar_13;
  tmpvar_13 = ((tmpvar_9 * v_i0_i1) * unity_Scale.w);
  tmpvar_4 = tmpvar_13;
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec3 v_i0_i1_i2;
  v_i0_i1_i2.x = tmpvar_14[0].z;
  v_i0_i1_i2.y = tmpvar_14[1].z;
  v_i0_i1_i2.z = tmpvar_14[2].z;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((tmpvar_9 * v_i0_i1_i2) * unity_Scale.w);
  tmpvar_5 = tmpvar_15;
  mat3 tmpvar_16;
  tmpvar_16[0] = _Object2World[0].xyz;
  tmpvar_16[1] = _Object2World[1].xyz;
  tmpvar_16[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16 * (tmpvar_2 * unity_Scale.w));
  highp vec3 tmpvar_18;
  tmpvar_18 = (tmpvar_9 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_6 = tmpvar_18;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = _WorldSpaceCameraPos;
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = tmpvar_17;
  mediump vec3 tmpvar_21;
  mediump vec4 normal;
  normal = tmpvar_20;
  mediump vec3 x3;
  highp float vC;
  mediump vec3 x2;
  mediump vec3 x1;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHAr, normal);
  x1.x = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHAg, normal);
  x1.y = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHAb, normal);
  x1.z = tmpvar_24;
  mediump vec4 tmpvar_25;
  tmpvar_25 = (normal.xyzz * normal.yzzx);
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHBr, tmpvar_25);
  x2.x = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHBg, tmpvar_25);
  x2.y = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = dot (unity_SHBb, tmpvar_25);
  x2.z = tmpvar_28;
  mediump float tmpvar_29;
  tmpvar_29 = ((normal.x * normal.x) - (normal.y * normal.y));
  vC = tmpvar_29;
  highp vec3 tmpvar_30;
  tmpvar_30 = (unity_SHC.xyz * vC);
  x3 = tmpvar_30;
  tmpvar_21 = ((x1 + x2) + x3);
  shlight = tmpvar_21;
  tmpvar_7 = shlight;
  highp vec3 tmpvar_31;
  tmpvar_31 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_32;
  tmpvar_32 = (unity_4LightPosX0 - tmpvar_31.x);
  highp vec4 tmpvar_33;
  tmpvar_33 = (unity_4LightPosY0 - tmpvar_31.y);
  highp vec4 tmpvar_34;
  tmpvar_34 = (unity_4LightPosZ0 - tmpvar_31.z);
  highp vec4 tmpvar_35;
  tmpvar_35 = (((tmpvar_32 * tmpvar_32) + (tmpvar_33 * tmpvar_33)) + (tmpvar_34 * tmpvar_34));
  highp vec4 tmpvar_36;
  tmpvar_36 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_32 * tmpvar_17.x) + (tmpvar_33 * tmpvar_17.y)) + (tmpvar_34 * tmpvar_17.z)) * inversesqrt (tmpvar_35))) * (1.0/((1.0 + (tmpvar_35 * unity_4LightAtten0)))));
  highp vec3 tmpvar_37;
  tmpvar_37 = (tmpvar_7 + ((((unity_LightColor[0].xyz * tmpvar_36.x) + (unity_LightColor[1].xyz * tmpvar_36.y)) + (unity_LightColor[2].xyz * tmpvar_36.z)) + (unity_LightColor[3].xyz * tmpvar_36.w)));
  tmpvar_7 = tmpvar_37;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD6 = (tmpvar_9 * (((_World2Object * tmpvar_19).xyz * unity_Scale.w) - _glesVertex.xyz));
}



#endif
#ifdef FRAGMENT

varying highp vec3 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform sampler2D _SpecularTex;
uniform highp float _RimPower;
uniform highp vec4 _RimColor;
uniform sampler2D _RampTex;
uniform sampler2D _MainTex;
uniform lowp vec4 _LightColor0;
uniform lowp float _Cutoff;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  tmpvar_1 = xlv_TEXCOORD1;
  tmpvar_2 = xlv_TEXCOORD2;
  tmpvar_3 = xlv_TEXCOORD3;
  lowp vec3 tmpvar_4;
  mediump float tmpvar_5;
  lowp float tmpvar_6;
  mediump vec3 rim;
  highp vec3 specGloss;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture2D (_BumpMap, xlv_TEXCOORD0).xyz * 2.0) - 1.0);
  lowp vec3 tmpvar_10;
  tmpvar_10 = texture2D (_SpecularTex, xlv_TEXCOORD0).xyz;
  specGloss = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = specGloss.x;
  tmpvar_5 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = specGloss.y;
  tmpvar_6 = tmpvar_12;
  mediump vec3 tmpvar_13;
  tmpvar_13.x = dot (tmpvar_1, tmpvar_9);
  tmpvar_13.y = dot (tmpvar_2, tmpvar_9);
  tmpvar_13.z = dot (tmpvar_3, tmpvar_9);
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (vec3(0.0, 1.0, 0.0), tmpvar_13));
  highp vec3 tmpvar_15;
  tmpvar_15 = (((pow (tmpvar_14, _RimPower) * _RimColor.xyz) * _RimColor.w) * specGloss.z);
  rim = tmpvar_15;
  tmpvar_4 = rim;
  lowp float x;
  x = (tmpvar_8.w - _Cutoff);
  if ((x < 0.0)) {
    discard;
  };
  highp vec3 tmpvar_16;
  tmpvar_16 = normalize (xlv_TEXCOORD6);
  lowp vec3 viewDir;
  viewDir = tmpvar_16;
  lowp vec4 c_i0;
  highp float nh;
  lowp vec4 tmpvar_17;
  tmpvar_17 = texture2D (_RampTex, vec2(((dot (tmpvar_9, xlv_TEXCOORD4) * 0.5) + 0.5)));
  lowp float tmpvar_18;
  tmpvar_18 = max (0.0, dot (tmpvar_9, normalize ((xlv_TEXCOORD4 + viewDir))));
  nh = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = ((((tmpvar_7.xyz * tmpvar_17.xyz) * _LightColor0.xyz) + (_LightColor0.xyz * (pow (nh, (tmpvar_6 * 128.0)) * tmpvar_5))) * 2.0);
  c_i0.xyz = tmpvar_19;
  c_i0.w = tmpvar_8.w;
  c = c_i0;
  c.xyz = (c_i0.xyz + (tmpvar_7.xyz * xlv_TEXCOORD5));
  c.xyz = (c.xyz + tmpvar_4);
  c.w = tmpvar_8.w;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_OFF" "VERTEXLIGHT_ON" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec3 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_SHC;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_LightColor[4];
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightAtten0;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec3 shlight;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  highp mat3 tmpvar_8;
  tmpvar_8[0] = tmpvar_1.xyz;
  tmpvar_8[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_8[2] = tmpvar_2;
  mat3 tmpvar_9;
  tmpvar_9[0].x = tmpvar_8[0].x;
  tmpvar_9[0].y = tmpvar_8[1].x;
  tmpvar_9[0].z = tmpvar_8[2].x;
  tmpvar_9[1].x = tmpvar_8[0].y;
  tmpvar_9[1].y = tmpvar_8[1].y;
  tmpvar_9[1].z = tmpvar_8[2].y;
  tmpvar_9[2].x = tmpvar_8[0].z;
  tmpvar_9[2].y = tmpvar_8[1].z;
  tmpvar_9[2].z = tmpvar_8[2].z;
  mat3 tmpvar_10;
  tmpvar_10[0] = _Object2World[0].xyz;
  tmpvar_10[1] = _Object2World[1].xyz;
  tmpvar_10[2] = _Object2World[2].xyz;
  vec3 v_i0;
  v_i0.x = tmpvar_10[0].x;
  v_i0.y = tmpvar_10[1].x;
  v_i0.z = tmpvar_10[2].x;
  highp vec3 tmpvar_11;
  tmpvar_11 = ((tmpvar_9 * v_i0) * unity_Scale.w);
  tmpvar_3 = tmpvar_11;
  mat3 tmpvar_12;
  tmpvar_12[0] = _Object2World[0].xyz;
  tmpvar_12[1] = _Object2World[1].xyz;
  tmpvar_12[2] = _Object2World[2].xyz;
  vec3 v_i0_i1;
  v_i0_i1.x = tmpvar_12[0].y;
  v_i0_i1.y = tmpvar_12[1].y;
  v_i0_i1.z = tmpvar_12[2].y;
  highp vec3 tmpvar_13;
  tmpvar_13 = ((tmpvar_9 * v_i0_i1) * unity_Scale.w);
  tmpvar_4 = tmpvar_13;
  mat3 tmpvar_14;
  tmpvar_14[0] = _Object2World[0].xyz;
  tmpvar_14[1] = _Object2World[1].xyz;
  tmpvar_14[2] = _Object2World[2].xyz;
  vec3 v_i0_i1_i2;
  v_i0_i1_i2.x = tmpvar_14[0].z;
  v_i0_i1_i2.y = tmpvar_14[1].z;
  v_i0_i1_i2.z = tmpvar_14[2].z;
  highp vec3 tmpvar_15;
  tmpvar_15 = ((tmpvar_9 * v_i0_i1_i2) * unity_Scale.w);
  tmpvar_5 = tmpvar_15;
  mat3 tmpvar_16;
  tmpvar_16[0] = _Object2World[0].xyz;
  tmpvar_16[1] = _Object2World[1].xyz;
  tmpvar_16[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_17;
  tmpvar_17 = (tmpvar_16 * (tmpvar_2 * unity_Scale.w));
  highp vec3 tmpvar_18;
  tmpvar_18 = (tmpvar_9 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_6 = tmpvar_18;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = _WorldSpaceCameraPos;
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = tmpvar_17;
  mediump vec3 tmpvar_21;
  mediump vec4 normal;
  normal = tmpvar_20;
  mediump vec3 x3;
  highp float vC;
  mediump vec3 x2;
  mediump vec3 x1;
  highp float tmpvar_22;
  tmpvar_22 = dot (unity_SHAr, normal);
  x1.x = tmpvar_22;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHAg, normal);
  x1.y = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHAb, normal);
  x1.z = tmpvar_24;
  mediump vec4 tmpvar_25;
  tmpvar_25 = (normal.xyzz * normal.yzzx);
  highp float tmpvar_26;
  tmpvar_26 = dot (unity_SHBr, tmpvar_25);
  x2.x = tmpvar_26;
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHBg, tmpvar_25);
  x2.y = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = dot (unity_SHBb, tmpvar_25);
  x2.z = tmpvar_28;
  mediump float tmpvar_29;
  tmpvar_29 = ((normal.x * normal.x) - (normal.y * normal.y));
  vC = tmpvar_29;
  highp vec3 tmpvar_30;
  tmpvar_30 = (unity_SHC.xyz * vC);
  x3 = tmpvar_30;
  tmpvar_21 = ((x1 + x2) + x3);
  shlight = tmpvar_21;
  tmpvar_7 = shlight;
  highp vec3 tmpvar_31;
  tmpvar_31 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_32;
  tmpvar_32 = (unity_4LightPosX0 - tmpvar_31.x);
  highp vec4 tmpvar_33;
  tmpvar_33 = (unity_4LightPosY0 - tmpvar_31.y);
  highp vec4 tmpvar_34;
  tmpvar_34 = (unity_4LightPosZ0 - tmpvar_31.z);
  highp vec4 tmpvar_35;
  tmpvar_35 = (((tmpvar_32 * tmpvar_32) + (tmpvar_33 * tmpvar_33)) + (tmpvar_34 * tmpvar_34));
  highp vec4 tmpvar_36;
  tmpvar_36 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_32 * tmpvar_17.x) + (tmpvar_33 * tmpvar_17.y)) + (tmpvar_34 * tmpvar_17.z)) * inversesqrt (tmpvar_35))) * (1.0/((1.0 + (tmpvar_35 * unity_4LightAtten0)))));
  highp vec3 tmpvar_37;
  tmpvar_37 = (tmpvar_7 + ((((unity_LightColor[0].xyz * tmpvar_36.x) + (unity_LightColor[1].xyz * tmpvar_36.y)) + (unity_LightColor[2].xyz * tmpvar_36.z)) + (unity_LightColor[3].xyz * tmpvar_36.w)));
  tmpvar_7 = tmpvar_37;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD6 = (tmpvar_9 * (((_World2Object * tmpvar_19).xyz * unity_Scale.w) - _glesVertex.xyz));
}



#endif
#ifdef FRAGMENT

varying highp vec3 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform sampler2D _SpecularTex;
uniform highp float _RimPower;
uniform highp vec4 _RimColor;
uniform sampler2D _RampTex;
uniform sampler2D _MainTex;
uniform lowp vec4 _LightColor0;
uniform lowp float _Cutoff;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  tmpvar_1 = xlv_TEXCOORD1;
  tmpvar_2 = xlv_TEXCOORD2;
  tmpvar_3 = xlv_TEXCOORD3;
  lowp vec3 tmpvar_4;
  mediump float tmpvar_5;
  lowp float tmpvar_6;
  mediump vec3 rim;
  highp vec3 specGloss;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec3 normal;
  normal.xy = ((texture2D (_BumpMap, xlv_TEXCOORD0).wy * 2.0) - 1.0);
  normal.z = sqrt (((1.0 - (normal.x * normal.x)) - (normal.y * normal.y)));
  lowp vec3 tmpvar_9;
  tmpvar_9 = texture2D (_SpecularTex, xlv_TEXCOORD0).xyz;
  specGloss = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = specGloss.x;
  tmpvar_5 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = specGloss.y;
  tmpvar_6 = tmpvar_11;
  mediump vec3 tmpvar_12;
  tmpvar_12.x = dot (tmpvar_1, normal);
  tmpvar_12.y = dot (tmpvar_2, normal);
  tmpvar_12.z = dot (tmpvar_3, normal);
  mediump float tmpvar_13;
  tmpvar_13 = max (0.0, dot (vec3(0.0, 1.0, 0.0), tmpvar_12));
  highp vec3 tmpvar_14;
  tmpvar_14 = (((pow (tmpvar_13, _RimPower) * _RimColor.xyz) * _RimColor.w) * specGloss.z);
  rim = tmpvar_14;
  tmpvar_4 = rim;
  lowp float x;
  x = (tmpvar_8.w - _Cutoff);
  if ((x < 0.0)) {
    discard;
  };
  highp vec3 tmpvar_15;
  tmpvar_15 = normalize (xlv_TEXCOORD6);
  lowp vec3 viewDir;
  viewDir = tmpvar_15;
  lowp vec4 c_i0;
  highp float nh;
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture2D (_RampTex, vec2(((dot (normal, xlv_TEXCOORD4) * 0.5) + 0.5)));
  lowp float tmpvar_17;
  tmpvar_17 = max (0.0, dot (normal, normalize ((xlv_TEXCOORD4 + viewDir))));
  nh = tmpvar_17;
  highp vec3 tmpvar_18;
  tmpvar_18 = ((((tmpvar_7.xyz * tmpvar_16.xyz) * _LightColor0.xyz) + (_LightColor0.xyz * (pow (nh, (tmpvar_6 * 128.0)) * tmpvar_5))) * 2.0);
  c_i0.xyz = tmpvar_18;
  c_i0.w = tmpvar_8.w;
  c = c_i0;
  c.xyz = (c_i0.xyz + (tmpvar_7.xyz * xlv_TEXCOORD5));
  c.xyz = (c.xyz + tmpvar_4);
  c.w = tmpvar_8.w;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Vector 13 [_ProjectionParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Vector 16 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Vector 17 [unity_4LightPosX0]
Vector 18 [unity_4LightPosY0]
Vector 19 [unity_4LightPosZ0]
Vector 20 [unity_4LightAtten0]
Vector 21 [unity_LightColor0]
Vector 22 [unity_LightColor1]
Vector 23 [unity_LightColor2]
Vector 24 [unity_LightColor3]
Vector 25 [unity_SHAr]
Vector 26 [unity_SHAg]
Vector 27 [unity_SHAb]
Vector 28 [unity_SHBr]
Vector 29 [unity_SHBg]
Vector 30 [unity_SHBb]
Vector 31 [unity_SHC]
Vector 32 [_MainTex_ST]
"3.0-!!ARBvp1.0
# 91 ALU
PARAM c[33] = { { 1, 0, 0.5 },
		state.matrix.mvp,
		program.local[5..32] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEMP R4;
MUL R3.xyz, vertex.normal, c[14].w;
DP4 R0.x, vertex.position, c[6];
ADD R1, -R0.x, c[18];
DP3 R3.w, R3, c[6];
DP3 R4.x, R3, c[5];
DP3 R3.x, R3, c[7];
MUL R2, R3.w, R1;
DP4 R0.x, vertex.position, c[5];
ADD R0, -R0.x, c[17];
MUL R1, R1, R1;
MOV R4.z, R3.x;
MAD R2, R4.x, R0, R2;
MOV R4.w, c[0].x;
DP4 R4.y, vertex.position, c[7];
MAD R1, R0, R0, R1;
ADD R0, -R4.y, c[19];
MAD R1, R0, R0, R1;
MAD R0, R3.x, R0, R2;
MUL R2, R1, c[20];
MOV R4.y, R3.w;
RSQ R1.x, R1.x;
RSQ R1.y, R1.y;
RSQ R1.w, R1.w;
RSQ R1.z, R1.z;
MUL R0, R0, R1;
ADD R1, R2, c[0].x;
RCP R1.x, R1.x;
RCP R1.y, R1.y;
RCP R1.w, R1.w;
RCP R1.z, R1.z;
MAX R0, R0, c[0].y;
MUL R0, R0, R1;
MUL R1.xyz, R0.y, c[22];
MAD R1.xyz, R0.x, c[21], R1;
MAD R0.xyz, R0.z, c[23], R1;
MAD R1.xyz, R0.w, c[24], R0;
MUL R0, R4.xyzz, R4.yzzx;
MUL R1.w, R3, R3;
DP4 R3.z, R0, c[30];
DP4 R3.y, R0, c[29];
DP4 R3.x, R0, c[28];
MAD R1.w, R4.x, R4.x, -R1;
MUL R0.xyz, R1.w, c[31];
MOV R1.w, c[0].x;
DP4 R0.w, vertex.position, c[4];
DP4 R2.z, R4, c[27];
DP4 R2.y, R4, c[26];
DP4 R2.x, R4, c[25];
ADD R2.xyz, R2, R3;
ADD R0.xyz, R2, R0;
ADD result.texcoord[5].xyz, R0, R1;
MOV R1.xyz, c[15];
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
MAD R2.xyz, R2, c[14].w, -vertex.position;
MOV R0.xyz, vertex.attrib[14];
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R0.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R1, c[16];
MUL R0.xyz, R0, vertex.attrib[14].w;
DP4 R3.z, R1, c[11];
DP4 R3.x, R1, c[9];
DP4 R3.y, R1, c[10];
DP3 R1.y, R0, c[5];
DP3 result.texcoord[4].y, R0, R3;
DP3 result.texcoord[6].y, R0, R2;
DP3 R1.x, vertex.attrib[14], c[5];
DP3 R1.z, vertex.normal, c[5];
MUL result.texcoord[1].xyz, R1, c[14].w;
DP3 R1.y, R0, c[6];
DP3 R0.y, R0, c[7];
DP3 R1.x, vertex.attrib[14], c[6];
DP3 R1.z, vertex.normal, c[6];
DP3 R0.x, vertex.attrib[14], c[7];
DP3 R0.z, vertex.normal, c[7];
MUL result.texcoord[3].xyz, R0, c[14].w;
DP4 R0.z, vertex.position, c[3];
DP4 R0.x, vertex.position, c[1];
DP4 R0.y, vertex.position, c[2];
MUL result.texcoord[2].xyz, R1, c[14].w;
MUL R1.xyz, R0.xyww, c[0].z;
MUL R1.y, R1, c[13].x;
DP3 result.texcoord[4].z, vertex.normal, R3;
DP3 result.texcoord[4].x, vertex.attrib[14], R3;
DP3 result.texcoord[6].z, vertex.normal, R2;
DP3 result.texcoord[6].x, vertex.attrib[14], R2;
ADD result.texcoord[7].xy, R1, R1.z;
MOV result.position, R0;
MOV result.texcoord[7].zw, R0;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[32], c[32].zwzw;
END
# 91 instructions, 5 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 12 [_ProjectionParams]
Vector 13 [_ScreenParams]
Vector 14 [unity_Scale]
Vector 15 [_WorldSpaceCameraPos]
Vector 16 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Vector 17 [unity_4LightPosX0]
Vector 18 [unity_4LightPosY0]
Vector 19 [unity_4LightPosZ0]
Vector 20 [unity_4LightAtten0]
Vector 21 [unity_LightColor0]
Vector 22 [unity_LightColor1]
Vector 23 [unity_LightColor2]
Vector 24 [unity_LightColor3]
Vector 25 [unity_SHAr]
Vector 26 [unity_SHAg]
Vector 27 [unity_SHAb]
Vector 28 [unity_SHBr]
Vector 29 [unity_SHBg]
Vector 30 [unity_SHBb]
Vector 31 [unity_SHC]
Vector 32 [_MainTex_ST]
"vs_3_0
; 94 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
dcl_texcoord4 o5
dcl_texcoord5 o6
dcl_texcoord6 o7
dcl_texcoord7 o8
def c33, 1.00000000, 0.00000000, 0.50000000, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mul r3.xyz, v2, c14.w
dp4 r0.x, v0, c5
add r1, -r0.x, c18
dp3 r3.w, r3, c5
dp3 r4.x, r3, c4
dp3 r3.x, r3, c6
mul r2, r3.w, r1
dp4 r0.x, v0, c4
add r0, -r0.x, c17
mul r1, r1, r1
mov r4.z, r3.x
mad r2, r4.x, r0, r2
mov r4.w, c33.x
dp4 r4.y, v0, c6
mad r1, r0, r0, r1
add r0, -r4.y, c19
mad r1, r0, r0, r1
mad r0, r3.x, r0, r2
mul r2, r1, c20
mov r4.y, r3.w
rsq r1.x, r1.x
rsq r1.y, r1.y
rsq r1.w, r1.w
rsq r1.z, r1.z
mul r0, r0, r1
add r1, r2, c33.x
dp4 r2.z, r4, c27
dp4 r2.y, r4, c26
dp4 r2.x, r4, c25
rcp r1.x, r1.x
rcp r1.y, r1.y
rcp r1.w, r1.w
rcp r1.z, r1.z
max r0, r0, c33.y
mul r0, r0, r1
mul r1.xyz, r0.y, c22
mad r1.xyz, r0.x, c21, r1
mad r0.xyz, r0.z, c23, r1
mad r1.xyz, r0.w, c24, r0
mul r0, r4.xyzz, r4.yzzx
mul r1.w, r3, r3
dp4 r3.z, r0, c30
dp4 r3.y, r0, c29
dp4 r3.x, r0, c28
mad r1.w, r4.x, r4.x, -r1
mul r0.xyz, r1.w, c31
add r2.xyz, r2, r3
add r0.xyz, r2, r0
add o6.xyz, r0, r1
mov r1.w, c33.x
mov r1.xyz, c15
dp4 r0.z, r1, c10
dp4 r0.y, r1, c9
dp4 r0.x, r1, c8
mad r3.xyz, r0, c14.w, -v0
mov r1.xyz, v1
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r1.yzxw
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r1, v1.w
mov r0, c10
dp4 r4.z, c16, r0
mov r0, c9
dp4 r4.y, c16, r0
mov r1, c8
dp4 r4.x, c16, r1
dp4 r0.w, v0, c3
dp3 r0.y, r2, c4
dp3 r0.x, v1, c4
dp3 r0.z, v2, c4
mul o2.xyz, r0, c14.w
dp3 r0.y, r2, c5
dp3 r0.x, v1, c5
dp3 r0.z, v2, c5
mul o3.xyz, r0, c14.w
dp3 r0.y, r2, c6
dp3 r0.x, v1, c6
dp3 r0.z, v2, c6
mul o4.xyz, r0, c14.w
dp4 r0.z, v0, c2
dp4 r0.x, v0, c0
dp4 r0.y, v0, c1
mul r1.xyz, r0.xyww, c33.z
mul r1.y, r1, c12.x
dp3 o5.y, r2, r4
dp3 o7.y, r2, r3
dp3 o5.z, v2, r4
dp3 o5.x, v1, r4
dp3 o7.z, v2, r3
dp3 o7.x, v1, r3
mad o8.xy, r1.z, c13.zwzw, r1
mov o0, r0
mov o8.zw, r0
mad o1.xy, v3, c32, c32.zwzw
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec4 xlv_TEXCOORD7;
varying highp vec3 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_SHC;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_LightColor[4];
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightAtten0;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec3 shlight;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (gl_ModelViewProjectionMatrix * _glesVertex);
  highp mat3 tmpvar_9;
  tmpvar_9[0] = tmpvar_1.xyz;
  tmpvar_9[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_9[2] = tmpvar_2;
  mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_9[0].x;
  tmpvar_10[0].y = tmpvar_9[1].x;
  tmpvar_10[0].z = tmpvar_9[2].x;
  tmpvar_10[1].x = tmpvar_9[0].y;
  tmpvar_10[1].y = tmpvar_9[1].y;
  tmpvar_10[1].z = tmpvar_9[2].y;
  tmpvar_10[2].x = tmpvar_9[0].z;
  tmpvar_10[2].y = tmpvar_9[1].z;
  tmpvar_10[2].z = tmpvar_9[2].z;
  mat3 tmpvar_11;
  tmpvar_11[0] = _Object2World[0].xyz;
  tmpvar_11[1] = _Object2World[1].xyz;
  tmpvar_11[2] = _Object2World[2].xyz;
  vec3 v_i0;
  v_i0.x = tmpvar_11[0].x;
  v_i0.y = tmpvar_11[1].x;
  v_i0.z = tmpvar_11[2].x;
  highp vec3 tmpvar_12;
  tmpvar_12 = ((tmpvar_10 * v_i0) * unity_Scale.w);
  tmpvar_3 = tmpvar_12;
  mat3 tmpvar_13;
  tmpvar_13[0] = _Object2World[0].xyz;
  tmpvar_13[1] = _Object2World[1].xyz;
  tmpvar_13[2] = _Object2World[2].xyz;
  vec3 v_i0_i1;
  v_i0_i1.x = tmpvar_13[0].y;
  v_i0_i1.y = tmpvar_13[1].y;
  v_i0_i1.z = tmpvar_13[2].y;
  highp vec3 tmpvar_14;
  tmpvar_14 = ((tmpvar_10 * v_i0_i1) * unity_Scale.w);
  tmpvar_4 = tmpvar_14;
  mat3 tmpvar_15;
  tmpvar_15[0] = _Object2World[0].xyz;
  tmpvar_15[1] = _Object2World[1].xyz;
  tmpvar_15[2] = _Object2World[2].xyz;
  vec3 v_i0_i1_i2;
  v_i0_i1_i2.x = tmpvar_15[0].z;
  v_i0_i1_i2.y = tmpvar_15[1].z;
  v_i0_i1_i2.z = tmpvar_15[2].z;
  highp vec3 tmpvar_16;
  tmpvar_16 = ((tmpvar_10 * v_i0_i1_i2) * unity_Scale.w);
  tmpvar_5 = tmpvar_16;
  mat3 tmpvar_17;
  tmpvar_17[0] = _Object2World[0].xyz;
  tmpvar_17[1] = _Object2World[1].xyz;
  tmpvar_17[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = (tmpvar_17 * (tmpvar_2 * unity_Scale.w));
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_10 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_6 = tmpvar_19;
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = _WorldSpaceCameraPos;
  highp vec4 tmpvar_21;
  tmpvar_21.w = 1.0;
  tmpvar_21.xyz = tmpvar_18;
  mediump vec3 tmpvar_22;
  mediump vec4 normal;
  normal = tmpvar_21;
  mediump vec3 x3;
  highp float vC;
  mediump vec3 x2;
  mediump vec3 x1;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHAr, normal);
  x1.x = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHAg, normal);
  x1.y = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHAb, normal);
  x1.z = tmpvar_25;
  mediump vec4 tmpvar_26;
  tmpvar_26 = (normal.xyzz * normal.yzzx);
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHBr, tmpvar_26);
  x2.x = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = dot (unity_SHBg, tmpvar_26);
  x2.y = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = dot (unity_SHBb, tmpvar_26);
  x2.z = tmpvar_29;
  mediump float tmpvar_30;
  tmpvar_30 = ((normal.x * normal.x) - (normal.y * normal.y));
  vC = tmpvar_30;
  highp vec3 tmpvar_31;
  tmpvar_31 = (unity_SHC.xyz * vC);
  x3 = tmpvar_31;
  tmpvar_22 = ((x1 + x2) + x3);
  shlight = tmpvar_22;
  tmpvar_7 = shlight;
  highp vec3 tmpvar_32;
  tmpvar_32 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_33;
  tmpvar_33 = (unity_4LightPosX0 - tmpvar_32.x);
  highp vec4 tmpvar_34;
  tmpvar_34 = (unity_4LightPosY0 - tmpvar_32.y);
  highp vec4 tmpvar_35;
  tmpvar_35 = (unity_4LightPosZ0 - tmpvar_32.z);
  highp vec4 tmpvar_36;
  tmpvar_36 = (((tmpvar_33 * tmpvar_33) + (tmpvar_34 * tmpvar_34)) + (tmpvar_35 * tmpvar_35));
  highp vec4 tmpvar_37;
  tmpvar_37 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_33 * tmpvar_18.x) + (tmpvar_34 * tmpvar_18.y)) + (tmpvar_35 * tmpvar_18.z)) * inversesqrt (tmpvar_36))) * (1.0/((1.0 + (tmpvar_36 * unity_4LightAtten0)))));
  highp vec3 tmpvar_38;
  tmpvar_38 = (tmpvar_7 + ((((unity_LightColor[0].xyz * tmpvar_37.x) + (unity_LightColor[1].xyz * tmpvar_37.y)) + (unity_LightColor[2].xyz * tmpvar_37.z)) + (unity_LightColor[3].xyz * tmpvar_37.w)));
  tmpvar_7 = tmpvar_38;
  highp vec4 o_i0;
  highp vec4 tmpvar_39;
  tmpvar_39 = (tmpvar_8 * 0.5);
  o_i0 = tmpvar_39;
  highp vec2 tmpvar_40;
  tmpvar_40.x = tmpvar_39.x;
  tmpvar_40.y = (tmpvar_39.y * _ProjectionParams.x);
  o_i0.xy = (tmpvar_40 + tmpvar_39.w);
  o_i0.zw = tmpvar_8.zw;
  gl_Position = tmpvar_8;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD6 = (tmpvar_10 * (((_World2Object * tmpvar_20).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD7 = o_i0;
}



#endif
#ifdef FRAGMENT

varying highp vec4 xlv_TEXCOORD7;
varying highp vec3 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform sampler2D _SpecularTex;
uniform sampler2D _ShadowMapTexture;
uniform highp float _RimPower;
uniform highp vec4 _RimColor;
uniform sampler2D _RampTex;
uniform sampler2D _MainTex;
uniform lowp vec4 _LightColor0;
uniform lowp float _Cutoff;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  tmpvar_1 = xlv_TEXCOORD1;
  tmpvar_2 = xlv_TEXCOORD2;
  tmpvar_3 = xlv_TEXCOORD3;
  lowp vec3 tmpvar_4;
  mediump float tmpvar_5;
  lowp float tmpvar_6;
  mediump vec3 rim;
  highp vec3 specGloss;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec3 tmpvar_9;
  tmpvar_9 = ((texture2D (_BumpMap, xlv_TEXCOORD0).xyz * 2.0) - 1.0);
  lowp vec3 tmpvar_10;
  tmpvar_10 = texture2D (_SpecularTex, xlv_TEXCOORD0).xyz;
  specGloss = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = specGloss.x;
  tmpvar_5 = tmpvar_11;
  highp float tmpvar_12;
  tmpvar_12 = specGloss.y;
  tmpvar_6 = tmpvar_12;
  mediump vec3 tmpvar_13;
  tmpvar_13.x = dot (tmpvar_1, tmpvar_9);
  tmpvar_13.y = dot (tmpvar_2, tmpvar_9);
  tmpvar_13.z = dot (tmpvar_3, tmpvar_9);
  mediump float tmpvar_14;
  tmpvar_14 = max (0.0, dot (vec3(0.0, 1.0, 0.0), tmpvar_13));
  highp vec3 tmpvar_15;
  tmpvar_15 = (((pow (tmpvar_14, _RimPower) * _RimColor.xyz) * _RimColor.w) * specGloss.z);
  rim = tmpvar_15;
  tmpvar_4 = rim;
  lowp float x;
  x = (tmpvar_8.w - _Cutoff);
  if ((x < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_16;
  tmpvar_16 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD7);
  highp vec3 tmpvar_17;
  tmpvar_17 = normalize (xlv_TEXCOORD6);
  lowp vec3 viewDir;
  viewDir = tmpvar_17;
  lowp vec4 c_i0;
  highp float nh;
  lowp vec4 tmpvar_18;
  tmpvar_18 = texture2D (_RampTex, vec2((((dot (tmpvar_9, xlv_TEXCOORD4) * 0.5) + 0.5) * tmpvar_16.x)));
  lowp float tmpvar_19;
  tmpvar_19 = max (0.0, dot (tmpvar_9, normalize ((xlv_TEXCOORD4 + viewDir))));
  nh = tmpvar_19;
  highp vec3 tmpvar_20;
  tmpvar_20 = ((((tmpvar_7.xyz * tmpvar_18.xyz) * _LightColor0.xyz) + (_LightColor0.xyz * (pow (nh, (tmpvar_6 * 128.0)) * tmpvar_5))) * (tmpvar_16.x * 2.0));
  c_i0.xyz = tmpvar_20;
  c_i0.w = tmpvar_8.w;
  c = c_i0;
  c.xyz = (c_i0.xyz + (tmpvar_7.xyz * xlv_TEXCOORD5));
  c.xyz = (c.xyz + tmpvar_4);
  c.w = tmpvar_8.w;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec4 xlv_TEXCOORD7;
varying highp vec3 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;
uniform highp vec4 unity_SHC;
uniform highp vec4 unity_SHBr;
uniform highp vec4 unity_SHBg;
uniform highp vec4 unity_SHBb;
uniform highp vec4 unity_SHAr;
uniform highp vec4 unity_SHAg;
uniform highp vec4 unity_SHAb;
uniform highp vec4 unity_LightColor[4];
uniform highp vec4 unity_4LightPosZ0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightAtten0;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  highp vec3 shlight;
  lowp vec3 tmpvar_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8 = (gl_ModelViewProjectionMatrix * _glesVertex);
  highp mat3 tmpvar_9;
  tmpvar_9[0] = tmpvar_1.xyz;
  tmpvar_9[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_9[2] = tmpvar_2;
  mat3 tmpvar_10;
  tmpvar_10[0].x = tmpvar_9[0].x;
  tmpvar_10[0].y = tmpvar_9[1].x;
  tmpvar_10[0].z = tmpvar_9[2].x;
  tmpvar_10[1].x = tmpvar_9[0].y;
  tmpvar_10[1].y = tmpvar_9[1].y;
  tmpvar_10[1].z = tmpvar_9[2].y;
  tmpvar_10[2].x = tmpvar_9[0].z;
  tmpvar_10[2].y = tmpvar_9[1].z;
  tmpvar_10[2].z = tmpvar_9[2].z;
  mat3 tmpvar_11;
  tmpvar_11[0] = _Object2World[0].xyz;
  tmpvar_11[1] = _Object2World[1].xyz;
  tmpvar_11[2] = _Object2World[2].xyz;
  vec3 v_i0;
  v_i0.x = tmpvar_11[0].x;
  v_i0.y = tmpvar_11[1].x;
  v_i0.z = tmpvar_11[2].x;
  highp vec3 tmpvar_12;
  tmpvar_12 = ((tmpvar_10 * v_i0) * unity_Scale.w);
  tmpvar_3 = tmpvar_12;
  mat3 tmpvar_13;
  tmpvar_13[0] = _Object2World[0].xyz;
  tmpvar_13[1] = _Object2World[1].xyz;
  tmpvar_13[2] = _Object2World[2].xyz;
  vec3 v_i0_i1;
  v_i0_i1.x = tmpvar_13[0].y;
  v_i0_i1.y = tmpvar_13[1].y;
  v_i0_i1.z = tmpvar_13[2].y;
  highp vec3 tmpvar_14;
  tmpvar_14 = ((tmpvar_10 * v_i0_i1) * unity_Scale.w);
  tmpvar_4 = tmpvar_14;
  mat3 tmpvar_15;
  tmpvar_15[0] = _Object2World[0].xyz;
  tmpvar_15[1] = _Object2World[1].xyz;
  tmpvar_15[2] = _Object2World[2].xyz;
  vec3 v_i0_i1_i2;
  v_i0_i1_i2.x = tmpvar_15[0].z;
  v_i0_i1_i2.y = tmpvar_15[1].z;
  v_i0_i1_i2.z = tmpvar_15[2].z;
  highp vec3 tmpvar_16;
  tmpvar_16 = ((tmpvar_10 * v_i0_i1_i2) * unity_Scale.w);
  tmpvar_5 = tmpvar_16;
  mat3 tmpvar_17;
  tmpvar_17[0] = _Object2World[0].xyz;
  tmpvar_17[1] = _Object2World[1].xyz;
  tmpvar_17[2] = _Object2World[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = (tmpvar_17 * (tmpvar_2 * unity_Scale.w));
  highp vec3 tmpvar_19;
  tmpvar_19 = (tmpvar_10 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_6 = tmpvar_19;
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = _WorldSpaceCameraPos;
  highp vec4 tmpvar_21;
  tmpvar_21.w = 1.0;
  tmpvar_21.xyz = tmpvar_18;
  mediump vec3 tmpvar_22;
  mediump vec4 normal;
  normal = tmpvar_21;
  mediump vec3 x3;
  highp float vC;
  mediump vec3 x2;
  mediump vec3 x1;
  highp float tmpvar_23;
  tmpvar_23 = dot (unity_SHAr, normal);
  x1.x = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = dot (unity_SHAg, normal);
  x1.y = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = dot (unity_SHAb, normal);
  x1.z = tmpvar_25;
  mediump vec4 tmpvar_26;
  tmpvar_26 = (normal.xyzz * normal.yzzx);
  highp float tmpvar_27;
  tmpvar_27 = dot (unity_SHBr, tmpvar_26);
  x2.x = tmpvar_27;
  highp float tmpvar_28;
  tmpvar_28 = dot (unity_SHBg, tmpvar_26);
  x2.y = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = dot (unity_SHBb, tmpvar_26);
  x2.z = tmpvar_29;
  mediump float tmpvar_30;
  tmpvar_30 = ((normal.x * normal.x) - (normal.y * normal.y));
  vC = tmpvar_30;
  highp vec3 tmpvar_31;
  tmpvar_31 = (unity_SHC.xyz * vC);
  x3 = tmpvar_31;
  tmpvar_22 = ((x1 + x2) + x3);
  shlight = tmpvar_22;
  tmpvar_7 = shlight;
  highp vec3 tmpvar_32;
  tmpvar_32 = (_Object2World * _glesVertex).xyz;
  highp vec4 tmpvar_33;
  tmpvar_33 = (unity_4LightPosX0 - tmpvar_32.x);
  highp vec4 tmpvar_34;
  tmpvar_34 = (unity_4LightPosY0 - tmpvar_32.y);
  highp vec4 tmpvar_35;
  tmpvar_35 = (unity_4LightPosZ0 - tmpvar_32.z);
  highp vec4 tmpvar_36;
  tmpvar_36 = (((tmpvar_33 * tmpvar_33) + (tmpvar_34 * tmpvar_34)) + (tmpvar_35 * tmpvar_35));
  highp vec4 tmpvar_37;
  tmpvar_37 = (max (vec4(0.0, 0.0, 0.0, 0.0), ((((tmpvar_33 * tmpvar_18.x) + (tmpvar_34 * tmpvar_18.y)) + (tmpvar_35 * tmpvar_18.z)) * inversesqrt (tmpvar_36))) * (1.0/((1.0 + (tmpvar_36 * unity_4LightAtten0)))));
  highp vec3 tmpvar_38;
  tmpvar_38 = (tmpvar_7 + ((((unity_LightColor[0].xyz * tmpvar_37.x) + (unity_LightColor[1].xyz * tmpvar_37.y)) + (unity_LightColor[2].xyz * tmpvar_37.z)) + (unity_LightColor[3].xyz * tmpvar_37.w)));
  tmpvar_7 = tmpvar_38;
  highp vec4 o_i0;
  highp vec4 tmpvar_39;
  tmpvar_39 = (tmpvar_8 * 0.5);
  o_i0 = tmpvar_39;
  highp vec2 tmpvar_40;
  tmpvar_40.x = tmpvar_39.x;
  tmpvar_40.y = (tmpvar_39.y * _ProjectionParams.x);
  o_i0.xy = (tmpvar_40 + tmpvar_39.w);
  o_i0.zw = tmpvar_8.zw;
  gl_Position = tmpvar_8;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD3 = tmpvar_5;
  xlv_TEXCOORD4 = tmpvar_6;
  xlv_TEXCOORD5 = tmpvar_7;
  xlv_TEXCOORD6 = (tmpvar_10 * (((_World2Object * tmpvar_20).xyz * unity_Scale.w) - _glesVertex.xyz));
  xlv_TEXCOORD7 = o_i0;
}



#endif
#ifdef FRAGMENT

varying highp vec4 xlv_TEXCOORD7;
varying highp vec3 xlv_TEXCOORD6;
varying lowp vec3 xlv_TEXCOORD5;
varying lowp vec3 xlv_TEXCOORD4;
varying lowp vec3 xlv_TEXCOORD3;
varying lowp vec3 xlv_TEXCOORD2;
varying lowp vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform sampler2D _SpecularTex;
uniform sampler2D _ShadowMapTexture;
uniform highp float _RimPower;
uniform highp vec4 _RimColor;
uniform sampler2D _RampTex;
uniform sampler2D _MainTex;
uniform lowp vec4 _LightColor0;
uniform lowp float _Cutoff;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  mediump vec3 tmpvar_3;
  tmpvar_1 = xlv_TEXCOORD1;
  tmpvar_2 = xlv_TEXCOORD2;
  tmpvar_3 = xlv_TEXCOORD3;
  lowp vec3 tmpvar_4;
  mediump float tmpvar_5;
  lowp float tmpvar_6;
  mediump vec3 rim;
  highp vec3 specGloss;
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec3 normal;
  normal.xy = ((texture2D (_BumpMap, xlv_TEXCOORD0).wy * 2.0) - 1.0);
  normal.z = sqrt (((1.0 - (normal.x * normal.x)) - (normal.y * normal.y)));
  lowp vec3 tmpvar_9;
  tmpvar_9 = texture2D (_SpecularTex, xlv_TEXCOORD0).xyz;
  specGloss = tmpvar_9;
  highp float tmpvar_10;
  tmpvar_10 = specGloss.x;
  tmpvar_5 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = specGloss.y;
  tmpvar_6 = tmpvar_11;
  mediump vec3 tmpvar_12;
  tmpvar_12.x = dot (tmpvar_1, normal);
  tmpvar_12.y = dot (tmpvar_2, normal);
  tmpvar_12.z = dot (tmpvar_3, normal);
  mediump float tmpvar_13;
  tmpvar_13 = max (0.0, dot (vec3(0.0, 1.0, 0.0), tmpvar_12));
  highp vec3 tmpvar_14;
  tmpvar_14 = (((pow (tmpvar_13, _RimPower) * _RimColor.xyz) * _RimColor.w) * specGloss.z);
  rim = tmpvar_14;
  tmpvar_4 = rim;
  lowp float x;
  x = (tmpvar_8.w - _Cutoff);
  if ((x < 0.0)) {
    discard;
  };
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2DProj (_ShadowMapTexture, xlv_TEXCOORD7);
  highp vec3 tmpvar_16;
  tmpvar_16 = normalize (xlv_TEXCOORD6);
  lowp vec3 viewDir;
  viewDir = tmpvar_16;
  lowp vec4 c_i0;
  highp float nh;
  lowp vec4 tmpvar_17;
  tmpvar_17 = texture2D (_RampTex, vec2((((dot (normal, xlv_TEXCOORD4) * 0.5) + 0.5) * tmpvar_15.x)));
  lowp float tmpvar_18;
  tmpvar_18 = max (0.0, dot (normal, normalize ((xlv_TEXCOORD4 + viewDir))));
  nh = tmpvar_18;
  highp vec3 tmpvar_19;
  tmpvar_19 = ((((tmpvar_7.xyz * tmpvar_17.xyz) * _LightColor0.xyz) + (_LightColor0.xyz * (pow (nh, (tmpvar_6 * 128.0)) * tmpvar_5))) * (tmpvar_15.x * 2.0));
  c_i0.xyz = tmpvar_19;
  c_i0.w = tmpvar_8.w;
  c = c_i0;
  c.xyz = (c_i0.xyz + (tmpvar_7.xyz * xlv_TEXCOORD5));
  c.xyz = (c.xyz + tmpvar_4);
  c.w = tmpvar_8.w;
  gl_FragData[0] = c;
}



#endif"
}

}
Program "fp" {
// Fragment combos: 4
//   opengl - ALU: 22 to 42, TEX: 4 to 5
//   d3d9 - ALU: 21 to 44, TEX: 5 to 6
SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_RimColor]
Float 2 [_RimPower]
Float 3 [_Cutoff]
SetTexture 0 [_MainTex] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_SpecularTex] 2D
SetTexture 3 [_RampTex] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 39 ALU, 4 TEX
PARAM c[6] = { program.local[0..3],
		{ 2, 1, 0, 128 },
		{ 0.5 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0.yw, fragment.texcoord[0], texture[1], 2D;
MAD R1.xy, R0.wyzw, c[4].x, -c[4].y;
MUL R0.w, R1.y, R1.y;
MAD R0.w, -R1.x, R1.x, -R0;
DP3 R0.x, fragment.texcoord[6], fragment.texcoord[6];
ADD R0.w, R0, c[4].y;
MOV R2.xyz, fragment.texcoord[4];
RSQ R0.x, R0.x;
MAD R0.xyz, R0.x, fragment.texcoord[6], R2;
DP3 R1.z, R0, R0;
RSQ R1.z, R1.z;
MUL R0.xyz, R1.z, R0;
RSQ R0.w, R0.w;
RCP R1.z, R0.w;
DP3 R0.x, R1, R0;
TEX R2.xyz, fragment.texcoord[0], texture[2], 2D;
MUL R0.y, R2, c[4].w;
MAX R0.x, R0, c[4].z;
POW R0.x, R0.x, R0.y;
MUL R1.w, R0.x, R2.x;
TEX R0, fragment.texcoord[0], texture[0], 2D;
DP3 R2.x, R1, fragment.texcoord[4];
DP3 R2.y, R1, fragment.texcoord[2];
MAD R2.x, R2, c[5], c[5];
TEX R1.xyz, R2.x, texture[3], 2D;
MAX R2.x, R2.y, c[4].z;
MUL R1.xyz, R0, R1;
POW R2.x, R2.x, c[2].x;
MUL R1.xyz, R1, c[0];
MUL R2.xyw, R2.x, c[1].xyzz;
MAD R1.xyz, R1.w, c[0], R1;
MUL R2.xyw, R2, c[1].w;
MUL R1.xyz, R1, c[4].x;
MAD R0.xyz, R0, fragment.texcoord[5], R1;
MUL R2.xyz, R2.z, R2.xyww;
ADD result.color.xyz, R0, R2;
SLT R0.x, R0.w, c[3];
MOV result.color.w, R0;
KIL -R0.x;
END
# 39 instructions, 3 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_OFF" }
Vector 0 [_LightColor0]
Vector 1 [_RimColor]
Float 2 [_RimPower]
Float 3 [_Cutoff]
SetTexture 0 [_MainTex] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_SpecularTex] 2D
SetTexture 3 [_RampTex] 2D
"ps_3_0
; 41 ALU, 5 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c4, 0.00000000, 1.00000000, 2.00000000, -1.00000000
def c5, 128.00000000, 0.50000000, 0, 0
dcl_texcoord0 v0.xy
dcl_texcoord2 v2.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
dcl_texcoord6 v6.xyz
texld r0.yw, v0, s1
mad_pp r2.xy, r0.wyzw, c4.z, c4.w
mul_pp r0.w, r2.y, r2.y
mad_pp r0.w, -r2.x, r2.x, -r0
dp3_pp r0.x, v6, v6
add_pp r0.w, r0, c4.y
rsq_pp r0.w, r0.w
rcp_pp r2.z, r0.w
mov_pp r1.xyz, v4
rsq_pp r0.x, r0.x
mad_pp r0.xyz, r0.x, v6, r1
texld r3.xyz, v0, s2
dp3_pp r1.x, r0, r0
rsq_pp r1.x, r1.x
mul_pp r0.xyz, r1.x, r0
dp3_pp r0.x, r2, r0
max_pp r1.x, r0, c4
mul_pp r1.y, r3, c5.x
pow r0, r1.x, r1.y
texld r1, v0, s0
mul r2.w, r0.x, r3.x
dp3_pp r0.y, r2, v4
dp3_pp r0.w, r2, v2
mad_pp r0.x, r0.y, c5.y, c5.y
texld r0.xyz, r0.x, s3
mul_pp r0.xyz, r1, r0
mul_pp r2.xyz, r0, c0
mad r2.xyz, r2.w, c0, r2
max r3.x, r0.w, c4
pow r0, r3.x, c2.x
mov r0.w, r0.x
mul r2.xyz, r2, c4.z
mad_pp r0.xyz, r1, v5, r2
mul r1.xyz, r0.w, c1
add_pp r0.w, r1, -c3.x
mul r1.xyz, r1, c1.w
cmp r0.w, r0, c4.x, c4.y
mul r1.xyz, r3.z, r1
mov_pp r2, -r0.w
add_pp oC0.xyz, r0, r1
texkill r2.xyzw
mov_pp oC0.w, r1
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_OFF" }
"!!GLES"
}

SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_OFF" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "SHADOWS_OFF" }
Vector 0 [_RimColor]
Float 1 [_RimPower]
Float 2 [_Cutoff]
SetTexture 0 [_MainTex] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_SpecularTex] 2D
SetTexture 3 [unity_Lightmap] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 22 ALU, 4 TEX
PARAM c[4] = { program.local[0..2],
		{ 8, 2, 1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0.yw, fragment.texcoord[0], texture[1], 2D;
MAD R0.xy, R0.wyzw, c[3].y, -c[3].z;
MUL R0.z, R0.y, R0.y;
MAD R0.z, -R0.x, R0.x, -R0;
ADD R0.z, R0, c[3];
RSQ R0.z, R0.z;
RCP R0.z, R0.z;
DP3 R0.x, fragment.texcoord[2], R0;
MAX R0.x, R0, c[3].w;
POW R0.x, R0.x, c[1].x;
MUL R1.xyz, R0.x, c[0];
TEX R0.z, fragment.texcoord[0], texture[2], 2D;
MUL R1.xyz, R1, c[0].w;
MUL R2.xyz, R1, R0.z;
TEX R1, fragment.texcoord[0], texture[0], 2D;
TEX R0, fragment.texcoord[4], texture[3], 2D;
MUL R0.xyz, R0.w, R0;
MUL R0.xyz, R0, R1;
MAD result.color.xyz, R0, c[3].x, R2;
SLT R0.x, R1.w, c[2];
MOV result.color.w, R1;
KIL -R0.x;
END
# 22 instructions, 3 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "SHADOWS_OFF" }
Vector 0 [_RimColor]
Float 1 [_RimPower]
Float 2 [_Cutoff]
SetTexture 0 [_MainTex] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_SpecularTex] 2D
SetTexture 3 [unity_Lightmap] 2D
"ps_3_0
; 21 ALU, 5 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c3, 0.00000000, 1.00000000, 2.00000000, -1.00000000
def c4, 8.00000000, 0, 0, 0
dcl_texcoord0 v0.xy
dcl_texcoord2 v2.xyz
dcl_texcoord4 v4.xy
texld r0.yw, v0, s1
mad_pp r0.xy, r0.wyzw, c3.z, c3.w
mul_pp r0.z, r0.y, r0.y
mad_pp r0.z, -r0.x, r0.x, -r0
add_pp r0.z, r0, c3.y
rsq_pp r0.z, r0.z
rcp_pp r0.z, r0.z
dp3_pp r0.x, v2, r0
max r2.x, r0, c3
pow r0, r2.x, c1.x
texld r1, v4, s3
mul_pp r2.xyz, r1.w, r1
texld r1, v0, s0
mul_pp r1.xyz, r1, r2
add_pp r0.y, r1.w, -c2.x
cmp r0.w, r0.y, c3.x, c3.y
mul r0.xyz, r0.x, c0
mul r0.xyz, r0, c0.w
texld r2.z, v0, s2
mul r2.xyz, r0, r2.z
mov_pp r0, -r0.w
mad_pp oC0.xyz, r1, c4.x, r2
texkill r0.xyzw
mov_pp oC0.w, r1
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "SHADOWS_OFF" }
"!!GLES"
}

SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "SHADOWS_OFF" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_SCREEN" }
Vector 0 [_LightColor0]
Vector 1 [_RimColor]
Float 2 [_RimPower]
Float 3 [_Cutoff]
SetTexture 0 [_MainTex] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_SpecularTex] 2D
SetTexture 3 [_ShadowMapTexture] 2D
SetTexture 4 [_RampTex] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 42 ALU, 5 TEX
PARAM c[6] = { program.local[0..3],
		{ 2, 1, 0, 128 },
		{ 0.5 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0.yw, fragment.texcoord[0], texture[1], 2D;
MAD R2.xy, R0.wyzw, c[4].x, -c[4].y;
MUL R0.w, R2.y, R2.y;
MAD R0.w, -R2.x, R2.x, -R0;
DP3 R0.x, fragment.texcoord[6], fragment.texcoord[6];
ADD R0.w, R0, c[4].y;
RSQ R0.w, R0.w;
RCP R2.z, R0.w;
TEX R3.xyz, fragment.texcoord[0], texture[2], 2D;
MOV R1.xyz, fragment.texcoord[4];
RSQ R0.x, R0.x;
MAD R0.xyz, R0.x, fragment.texcoord[6], R1;
DP3 R1.x, R0, R0;
RSQ R1.x, R1.x;
MUL R0.xyz, R1.x, R0;
DP3 R0.x, R2, R0;
MUL R0.y, R3, c[4].w;
MAX R0.x, R0, c[4].z;
POW R0.x, R0.x, R0.y;
MUL R1.w, R0.x, R3.x;
DP3 R0.x, R2, fragment.texcoord[4];
DP3 R2.x, R2, fragment.texcoord[2];
MAX R2.x, R2, c[4].z;
POW R2.x, R2.x, c[2].x;
MUL R2.xyz, R2.x, c[1];
MUL R2.xyz, R2, c[1].w;
TXP R3.x, fragment.texcoord[7], texture[3], 2D;
MAD R0.x, R0, c[5], c[5];
MUL R1.x, R0, R3;
TEX R0, fragment.texcoord[0], texture[0], 2D;
TEX R1.xyz, R1.x, texture[4], 2D;
MUL R1.xyz, R0, R1;
MUL R1.xyz, R1, c[0];
MAD R1.xyz, R1.w, c[0], R1;
MUL R1.w, R3.x, c[4].x;
MUL R1.xyz, R1, R1.w;
MAD R0.xyz, R0, fragment.texcoord[5], R1;
MUL R2.xyz, R3.z, R2;
ADD result.color.xyz, R0, R2;
SLT R0.x, R0.w, c[3];
MOV result.color.w, R0;
KIL -R0.x;
END
# 42 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_SCREEN" }
Vector 0 [_LightColor0]
Vector 1 [_RimColor]
Float 2 [_RimPower]
Float 3 [_Cutoff]
SetTexture 0 [_MainTex] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_SpecularTex] 2D
SetTexture 3 [_ShadowMapTexture] 2D
SetTexture 4 [_RampTex] 2D
"ps_3_0
; 44 ALU, 6 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
def c4, 0.00000000, 1.00000000, 2.00000000, -1.00000000
def c5, 128.00000000, 0.50000000, 0, 0
dcl_texcoord0 v0.xy
dcl_texcoord2 v2.xyz
dcl_texcoord4 v4.xyz
dcl_texcoord5 v5.xyz
dcl_texcoord6 v6.xyz
dcl_texcoord7 v7
texld r0.yw, v0, s1
mad_pp r2.xy, r0.wyzw, c4.z, c4.w
mul_pp r0.w, r2.y, r2.y
mad_pp r0.w, -r2.x, r2.x, -r0
dp3_pp r0.x, v6, v6
add_pp r0.w, r0, c4.y
rsq_pp r0.w, r0.w
rcp_pp r2.z, r0.w
mov_pp r1.xyz, v4
rsq_pp r0.x, r0.x
mad_pp r0.xyz, r0.x, v6, r1
texld r4.xyz, v0, s2
dp3_pp r1.x, r0, r0
rsq_pp r1.x, r1.x
mul_pp r0.xyz, r1.x, r0
dp3_pp r0.x, r2, r0
max_pp r1.x, r0, c4
mul_pp r1.y, r4, c5.x
pow r0, r1.x, r1.y
mov r0.y, r0.x
dp3_pp r0.z, r2, v4
texldp r0.x, v7, s3
mad_pp r0.z, r0, c5.y, c5.y
mul_pp r1.x, r0.z, r0
texld r3.xyz, r1.x, s4
texld r1, v0, s0
dp3_pp r0.z, r2, v2
mul_pp r3.xyz, r1, r3
mul_pp r2.xyz, r3, c0
mul r0.y, r0, r4.x
mad r3.xyz, r0.y, c0, r2
max r0.z, r0, c4.x
pow r2, r0.z, c2.x
mul_pp r0.x, r0, c4.z
mul r0.xyz, r3, r0.x
mov r0.w, r2.x
mad_pp r0.xyz, r1, v5, r0
mul r1.xyz, r0.w, c1
add_pp r0.w, r1, -c3.x
mul r1.xyz, r1, c1.w
cmp r0.w, r0, c4.x, c4.y
mul r1.xyz, r4.z, r1
mov_pp r2, -r0.w
add_pp oC0.xyz, r0, r1
texkill r2.xyzw
mov_pp oC0.w, r1
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_SCREEN" }
"!!GLES"
}

SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "LIGHTMAP_OFF" "DIRLIGHTMAP_OFF" "SHADOWS_SCREEN" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "SHADOWS_SCREEN" }
Vector 0 [_RimColor]
Float 1 [_RimPower]
Float 2 [_Cutoff]
SetTexture 0 [_MainTex] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_SpecularTex] 2D
SetTexture 3 [_ShadowMapTexture] 2D
SetTexture 4 [unity_Lightmap] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 28 ALU, 5 TEX
PARAM c[4] = { program.local[0..2],
		{ 8, 2, 1, 0 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0.yw, fragment.texcoord[0], texture[1], 2D;
MAD R0.yz, R0.xwyw, c[3].y, -c[3].z;
TEX R1, fragment.texcoord[4], texture[4], 2D;
MUL R0.x, R0.z, R0.z;
MAD R0.x, -R0.y, R0.y, -R0;
ADD R0.w, R0.x, c[3].z;
MUL R2.xyz, R1.w, R1;
TXP R0.x, fragment.texcoord[5], texture[3], 2D;
MUL R1.xyz, R1, R0.x;
RSQ R0.w, R0.w;
RCP R0.w, R0.w;
DP3 R0.y, fragment.texcoord[2], R0.yzww;
MAX R0.w, R0.y, c[3];
MUL R2.xyz, R2, c[3].x;
MUL R1.xyz, R1, c[3].y;
MUL R0.xyz, R2, R0.x;
MIN R1.xyz, R2, R1;
MAX R1.xyz, R1, R0;
POW R0.w, R0.w, c[1].x;
MUL R2.xyz, R0.w, c[0];
TEX R0.z, fragment.texcoord[0], texture[2], 2D;
MUL R2.xyz, R2, c[0].w;
MUL R2.xyz, R2, R0.z;
TEX R0, fragment.texcoord[0], texture[0], 2D;
MAD result.color.xyz, R0, R1, R2;
SLT R0.x, R0.w, c[2];
MOV result.color.w, R0;
KIL -R0.x;
END
# 28 instructions, 3 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "SHADOWS_SCREEN" }
Vector 0 [_RimColor]
Float 1 [_RimPower]
Float 2 [_Cutoff]
SetTexture 0 [_MainTex] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_SpecularTex] 2D
SetTexture 3 [_ShadowMapTexture] 2D
SetTexture 4 [unity_Lightmap] 2D
"ps_3_0
; 27 ALU, 6 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
def c3, 0.00000000, 1.00000000, 8.00000000, 2.00000000
def c4, 2.00000000, -1.00000000, 0, 0
dcl_texcoord0 v0.xy
dcl_texcoord2 v2.xyz
dcl_texcoord4 v4.xy
dcl_texcoord5 v5
texld r0.yw, v0, s1
mad_pp r3.xy, r0.wyzw, c4.x, c4.y
texld r1, v4, s4
mul_pp r0.xyz, r1.w, r1
mul_pp r2.xyz, r0, c3.z
mul_pp r0.w, r3.y, r3.y
mad_pp r0.y, -r3.x, r3.x, -r0.w
texldp r0.x, v5, s3
mul_pp r1.xyz, r1, r0.x
add_pp r0.y, r0, c3
rsq_pp r0.y, r0.y
rcp_pp r3.z, r0.y
dp3_pp r0.w, v2, r3
mul_pp r1.xyz, r1, c3.w
min_pp r1.xyz, r2, r1
mul_pp r0.xyz, r2, r0.x
max r1.w, r0, c3.x
max_pp r2.xyz, r1, r0
pow r0, r1.w, c1.x
texld r1, v0, s0
mov r0.z, r0.x
mul r3.xyz, r0.z, c0
add_pp r0.y, r1.w, -c2.x
texld r0.z, v0, s2
mul r3.xyz, r3, c0.w
mul r3.xyz, r3, r0.z
cmp r0.x, r0.y, c3, c3.y
mov_pp r0, -r0.x
mad_pp oC0.xyz, r1, r2, r3
texkill r0.xyzw
mov_pp oC0.w, r1
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "SHADOWS_SCREEN" }
"!!GLES"
}

SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "DIRLIGHTMAP_OFF" "SHADOWS_SCREEN" }
"!!GLES"
}

}
	}
	Pass {
		Name "FORWARD"
		Tags { "LightMode" = "ForwardAdd" }
		ZWrite Off Blend One One Fog { Color (0,0,0,0) }
		AlphaToMask True ColorMask RGB
Program "vp" {
// Vertex combos: 5
//   opengl - ALU: 25 to 34
//   d3d9 - ALU: 28 to 37
SubProgram "opengl " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Vector 17 [unity_Scale]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 20 [_MainTex_ST]
"3.0-!!ARBvp1.0
# 33 ALU
PARAM c[21] = { { 1 },
		state.matrix.mvp,
		program.local[5..20] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[18];
MOV R1.w, c[0].x;
MOV R0.xyz, vertex.attrib[14];
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
MAD R2.xyz, R2, c[17].w, -vertex.position;
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[19];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R0.xyz, R3, c[17].w, -vertex.position;
DP3 result.texcoord[1].y, R0, R1;
DP3 result.texcoord[1].z, vertex.normal, R0;
DP3 result.texcoord[1].x, R0, vertex.attrib[14];
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[2].y, R1, R2;
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, vertex.attrib[14], R2;
DP4 result.texcoord[3].z, R0, c[15];
DP4 result.texcoord[3].y, R0, c[14];
DP4 result.texcoord[3].x, R0, c[13];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 33 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "POINT" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 16 [unity_Scale]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 19 [_MainTex_ST]
"vs_3_0
; 36 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
def c20, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mov r0.w, c20.x
mov r0.xyz, c17
dp4 r1.z, r0, c10
dp4 r1.y, r0, c9
dp4 r1.x, r0, c8
mad r3.xyz, r1, c16.w, -v0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r1, v1.w
mov r0, c10
dp4 r4.z, c18, r0
mov r0, c9
dp4 r4.y, c18, r0
mov r1, c8
dp4 r4.x, c18, r1
mad r0.xyz, r4, c16.w, -v0
dp3 o2.y, r0, r2
dp3 o2.z, v2, r0
dp3 o2.x, r0, v1
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 o3.y, r2, r3
dp3 o3.z, v2, r3
dp3 o3.x, v1, r3
dp4 o4.z, r0, c14
dp4 o4.y, r0, c13
dp4 o4.x, r0, c12
mad o1.xy, v3, c19, c19.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "POINT" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec3 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
uniform highp mat4 _LightMatrix0;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = tmpvar_1.xyz;
  tmpvar_5[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_5[2] = tmpvar_2;
  mat3 tmpvar_6;
  tmpvar_6[0].x = tmpvar_5[0].x;
  tmpvar_6[0].y = tmpvar_5[1].x;
  tmpvar_6[0].z = tmpvar_5[2].x;
  tmpvar_6[1].x = tmpvar_5[0].y;
  tmpvar_6[1].y = tmpvar_5[1].y;
  tmpvar_6[1].z = tmpvar_5[2].y;
  tmpvar_6[2].x = tmpvar_5[0].z;
  tmpvar_6[2].y = tmpvar_5[1].z;
  tmpvar_6[2].z = tmpvar_5[2].z;
  highp vec3 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_3 = tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_6 * (((_World2Object * tmpvar_8).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_4 = tmpvar_9;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD3 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
}



#endif
#ifdef FRAGMENT

varying highp vec3 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform sampler2D _SpecularTex;
uniform sampler2D _RampTex;
uniform sampler2D _MainTex;
uniform sampler2D _LightTexture0;
uniform lowp vec4 _LightColor0;
uniform lowp float _Cutoff;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  lowp vec3 lightDir;
  mediump float tmpvar_1;
  lowp float tmpvar_2;
  highp vec3 specGloss;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec3 tmpvar_5;
  tmpvar_5 = ((texture2D (_BumpMap, xlv_TEXCOORD0).xyz * 2.0) - 1.0);
  lowp vec3 tmpvar_6;
  tmpvar_6 = texture2D (_SpecularTex, xlv_TEXCOORD0).xyz;
  specGloss = tmpvar_6;
  highp float tmpvar_7;
  tmpvar_7 = specGloss.x;
  tmpvar_1 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = specGloss.y;
  tmpvar_2 = tmpvar_8;
  lowp float x;
  x = (tmpvar_4.w - _Cutoff);
  if ((x < 0.0)) {
    discard;
  };
  mediump vec3 tmpvar_9;
  tmpvar_9 = normalize (xlv_TEXCOORD1);
  lightDir = tmpvar_9;
  mediump vec3 tmpvar_10;
  tmpvar_10 = normalize (xlv_TEXCOORD2);
  highp vec2 tmpvar_11;
  tmpvar_11 = vec2(dot (xlv_TEXCOORD3, xlv_TEXCOORD3));
  lowp vec3 viewDir;
  viewDir = tmpvar_10;
  lowp float atten;
  atten = texture2D (_LightTexture0, tmpvar_11).w;
  lowp vec4 c_i0;
  highp float nh;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_RampTex, vec2((((dot (tmpvar_5, lightDir) * 0.5) + 0.5) * atten)));
  lowp float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_5, normalize ((lightDir + viewDir))));
  nh = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = ((((tmpvar_3.xyz * tmpvar_12.xyz) * _LightColor0.xyz) + (_LightColor0.xyz * (pow (nh, (tmpvar_2 * 128.0)) * tmpvar_1))) * (atten * 2.0));
  c_i0.xyz = tmpvar_14;
  c_i0.w = tmpvar_4.w;
  c = c_i0;
  c.w = tmpvar_4.w;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "glesdesktop " {
Keywords { "POINT" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec3 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
uniform highp mat4 _LightMatrix0;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = tmpvar_1.xyz;
  tmpvar_5[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_5[2] = tmpvar_2;
  mat3 tmpvar_6;
  tmpvar_6[0].x = tmpvar_5[0].x;
  tmpvar_6[0].y = tmpvar_5[1].x;
  tmpvar_6[0].z = tmpvar_5[2].x;
  tmpvar_6[1].x = tmpvar_5[0].y;
  tmpvar_6[1].y = tmpvar_5[1].y;
  tmpvar_6[1].z = tmpvar_5[2].y;
  tmpvar_6[2].x = tmpvar_5[0].z;
  tmpvar_6[2].y = tmpvar_5[1].z;
  tmpvar_6[2].z = tmpvar_5[2].z;
  highp vec3 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_3 = tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_6 * (((_World2Object * tmpvar_8).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_4 = tmpvar_9;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD3 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
}



#endif
#ifdef FRAGMENT

varying highp vec3 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform sampler2D _SpecularTex;
uniform sampler2D _RampTex;
uniform sampler2D _MainTex;
uniform sampler2D _LightTexture0;
uniform lowp vec4 _LightColor0;
uniform lowp float _Cutoff;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  lowp vec3 lightDir;
  mediump float tmpvar_1;
  lowp float tmpvar_2;
  highp vec3 specGloss;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec3 normal;
  normal.xy = ((texture2D (_BumpMap, xlv_TEXCOORD0).wy * 2.0) - 1.0);
  normal.z = sqrt (((1.0 - (normal.x * normal.x)) - (normal.y * normal.y)));
  lowp vec3 tmpvar_5;
  tmpvar_5 = texture2D (_SpecularTex, xlv_TEXCOORD0).xyz;
  specGloss = tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = specGloss.x;
  tmpvar_1 = tmpvar_6;
  highp float tmpvar_7;
  tmpvar_7 = specGloss.y;
  tmpvar_2 = tmpvar_7;
  lowp float x;
  x = (tmpvar_4.w - _Cutoff);
  if ((x < 0.0)) {
    discard;
  };
  mediump vec3 tmpvar_8;
  tmpvar_8 = normalize (xlv_TEXCOORD1);
  lightDir = tmpvar_8;
  mediump vec3 tmpvar_9;
  tmpvar_9 = normalize (xlv_TEXCOORD2);
  highp vec2 tmpvar_10;
  tmpvar_10 = vec2(dot (xlv_TEXCOORD3, xlv_TEXCOORD3));
  lowp vec3 viewDir;
  viewDir = tmpvar_9;
  lowp float atten;
  atten = texture2D (_LightTexture0, tmpvar_10).w;
  lowp vec4 c_i0;
  highp float nh;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_RampTex, vec2((((dot (normal, lightDir) * 0.5) + 0.5) * atten)));
  lowp float tmpvar_12;
  tmpvar_12 = max (0.0, dot (normal, normalize ((lightDir + viewDir))));
  nh = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = ((((tmpvar_3.xyz * tmpvar_11.xyz) * _LightColor0.xyz) + (_LightColor0.xyz * (pow (nh, (tmpvar_2 * 128.0)) * tmpvar_1))) * (atten * 2.0));
  c_i0.xyz = tmpvar_13;
  c_i0.w = tmpvar_4.w;
  c = c_i0;
  c.w = tmpvar_4.w;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Vector 9 [unity_Scale]
Vector 10 [_WorldSpaceCameraPos]
Vector 11 [_WorldSpaceLightPos0]
Matrix 5 [_World2Object]
Vector 12 [_MainTex_ST]
"3.0-!!ARBvp1.0
# 25 ALU
PARAM c[13] = { { 1 },
		state.matrix.mvp,
		program.local[5..12] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[10];
MOV R1.w, c[0].x;
MOV R0.xyz, vertex.attrib[14];
DP4 R2.z, R1, c[7];
DP4 R2.y, R1, c[6];
DP4 R2.x, R1, c[5];
MAD R2.xyz, R2, c[9].w, -vertex.position;
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[11];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP4 R3.z, R0, c[7];
DP4 R3.y, R0, c[6];
DP4 R3.x, R0, c[5];
DP3 result.texcoord[1].y, R3, R1;
DP3 result.texcoord[2].y, R1, R2;
DP3 result.texcoord[1].z, vertex.normal, R3;
DP3 result.texcoord[1].x, R3, vertex.attrib[14];
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, vertex.attrib[14], R2;
MAD result.texcoord[0].xy, vertex.texcoord[0], c[12], c[12].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 25 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 8 [unity_Scale]
Vector 9 [_WorldSpaceCameraPos]
Vector 10 [_WorldSpaceLightPos0]
Matrix 4 [_World2Object]
Vector 11 [_MainTex_ST]
"vs_3_0
; 28 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
def c12, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mov r0.w, c12.x
mov r0.xyz, c9
dp4 r1.z, r0, c6
dp4 r1.y, r0, c5
dp4 r1.x, r0, c4
mad r3.xyz, r1, c8.w, -v0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r1, v1.w
mov r0, c6
dp4 r4.z, c10, r0
mov r0, c5
mov r1, c4
dp4 r4.y, c10, r0
dp4 r4.x, c10, r1
dp3 o2.y, r4, r2
dp3 o3.y, r2, r3
dp3 o2.z, v2, r4
dp3 o2.x, r4, v1
dp3 o3.z, v2, r3
dp3 o3.x, v1, r3
mad o1.xy, v3, c11, c11.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying mediump vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _MainTex_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = tmpvar_1.xyz;
  tmpvar_5[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_5[2] = tmpvar_2;
  mat3 tmpvar_6;
  tmpvar_6[0].x = tmpvar_5[0].x;
  tmpvar_6[0].y = tmpvar_5[1].x;
  tmpvar_6[0].z = tmpvar_5[2].x;
  tmpvar_6[1].x = tmpvar_5[0].y;
  tmpvar_6[1].y = tmpvar_5[1].y;
  tmpvar_6[1].z = tmpvar_5[2].y;
  tmpvar_6[2].x = tmpvar_5[0].z;
  tmpvar_6[2].y = tmpvar_5[1].z;
  tmpvar_6[2].z = tmpvar_5[2].z;
  highp vec3 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_3 = tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_6 * (((_World2Object * tmpvar_8).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_4 = tmpvar_9;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = tmpvar_4;
}



#endif
#ifdef FRAGMENT

varying mediump vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform sampler2D _SpecularTex;
uniform sampler2D _RampTex;
uniform sampler2D _MainTex;
uniform lowp vec4 _LightColor0;
uniform lowp float _Cutoff;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  lowp vec3 lightDir;
  mediump float tmpvar_1;
  lowp float tmpvar_2;
  highp vec3 specGloss;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec3 tmpvar_5;
  tmpvar_5 = ((texture2D (_BumpMap, xlv_TEXCOORD0).xyz * 2.0) - 1.0);
  lowp vec3 tmpvar_6;
  tmpvar_6 = texture2D (_SpecularTex, xlv_TEXCOORD0).xyz;
  specGloss = tmpvar_6;
  highp float tmpvar_7;
  tmpvar_7 = specGloss.x;
  tmpvar_1 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = specGloss.y;
  tmpvar_2 = tmpvar_8;
  lowp float x;
  x = (tmpvar_4.w - _Cutoff);
  if ((x < 0.0)) {
    discard;
  };
  lightDir = xlv_TEXCOORD1;
  mediump vec3 tmpvar_9;
  tmpvar_9 = normalize (xlv_TEXCOORD2);
  lowp vec3 viewDir;
  viewDir = tmpvar_9;
  lowp vec4 c_i0;
  highp float nh;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_RampTex, vec2(((dot (tmpvar_5, lightDir) * 0.5) + 0.5)));
  lowp float tmpvar_11;
  tmpvar_11 = max (0.0, dot (tmpvar_5, normalize ((lightDir + viewDir))));
  nh = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = ((((tmpvar_3.xyz * tmpvar_10.xyz) * _LightColor0.xyz) + (_LightColor0.xyz * (pow (nh, (tmpvar_2 * 128.0)) * tmpvar_1))) * 2.0);
  c_i0.xyz = tmpvar_12;
  c_i0.w = tmpvar_4.w;
  c = c_i0;
  c.w = tmpvar_4.w;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying mediump vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp vec4 _MainTex_ST;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = tmpvar_1.xyz;
  tmpvar_5[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_5[2] = tmpvar_2;
  mat3 tmpvar_6;
  tmpvar_6[0].x = tmpvar_5[0].x;
  tmpvar_6[0].y = tmpvar_5[1].x;
  tmpvar_6[0].z = tmpvar_5[2].x;
  tmpvar_6[1].x = tmpvar_5[0].y;
  tmpvar_6[1].y = tmpvar_5[1].y;
  tmpvar_6[1].z = tmpvar_5[2].y;
  tmpvar_6[2].x = tmpvar_5[0].z;
  tmpvar_6[2].y = tmpvar_5[1].z;
  tmpvar_6[2].z = tmpvar_5[2].z;
  highp vec3 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_3 = tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_6 * (((_World2Object * tmpvar_8).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_4 = tmpvar_9;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = tmpvar_4;
}



#endif
#ifdef FRAGMENT

varying mediump vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform sampler2D _SpecularTex;
uniform sampler2D _RampTex;
uniform sampler2D _MainTex;
uniform lowp vec4 _LightColor0;
uniform lowp float _Cutoff;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  lowp vec3 lightDir;
  mediump float tmpvar_1;
  lowp float tmpvar_2;
  highp vec3 specGloss;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec3 normal;
  normal.xy = ((texture2D (_BumpMap, xlv_TEXCOORD0).wy * 2.0) - 1.0);
  normal.z = sqrt (((1.0 - (normal.x * normal.x)) - (normal.y * normal.y)));
  lowp vec3 tmpvar_5;
  tmpvar_5 = texture2D (_SpecularTex, xlv_TEXCOORD0).xyz;
  specGloss = tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = specGloss.x;
  tmpvar_1 = tmpvar_6;
  highp float tmpvar_7;
  tmpvar_7 = specGloss.y;
  tmpvar_2 = tmpvar_7;
  lowp float x;
  x = (tmpvar_4.w - _Cutoff);
  if ((x < 0.0)) {
    discard;
  };
  lightDir = xlv_TEXCOORD1;
  mediump vec3 tmpvar_8;
  tmpvar_8 = normalize (xlv_TEXCOORD2);
  lowp vec3 viewDir;
  viewDir = tmpvar_8;
  lowp vec4 c_i0;
  highp float nh;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_RampTex, vec2(((dot (normal, lightDir) * 0.5) + 0.5)));
  lowp float tmpvar_10;
  tmpvar_10 = max (0.0, dot (normal, normalize ((lightDir + viewDir))));
  nh = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = ((((tmpvar_3.xyz * tmpvar_9.xyz) * _LightColor0.xyz) + (_LightColor0.xyz * (pow (nh, (tmpvar_2 * 128.0)) * tmpvar_1))) * 2.0);
  c_i0.xyz = tmpvar_11;
  c_i0.w = tmpvar_4.w;
  c = c_i0;
  c.w = tmpvar_4.w;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Vector 17 [unity_Scale]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 20 [_MainTex_ST]
"3.0-!!ARBvp1.0
# 34 ALU
PARAM c[21] = { { 1 },
		state.matrix.mvp,
		program.local[5..20] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[18];
MOV R1.w, c[0].x;
MOV R0.xyz, vertex.attrib[14];
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
MAD R2.xyz, R2, c[17].w, -vertex.position;
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[19];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R0.xyz, R3, c[17].w, -vertex.position;
DP4 R0.w, vertex.position, c[8];
DP3 result.texcoord[1].y, R0, R1;
DP3 result.texcoord[1].z, vertex.normal, R0;
DP3 result.texcoord[1].x, R0, vertex.attrib[14];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[2].y, R1, R2;
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, vertex.attrib[14], R2;
DP4 result.texcoord[3].w, R0, c[16];
DP4 result.texcoord[3].z, R0, c[15];
DP4 result.texcoord[3].y, R0, c[14];
DP4 result.texcoord[3].x, R0, c[13];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 34 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "SPOT" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 16 [unity_Scale]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 19 [_MainTex_ST]
"vs_3_0
; 37 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
def c20, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mov r0.w, c20.x
mov r0.xyz, c17
dp4 r1.z, r0, c10
dp4 r1.y, r0, c9
dp4 r1.x, r0, c8
mad r3.xyz, r1, c16.w, -v0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r1, v1.w
mov r0, c10
dp4 r4.z, c18, r0
mov r0, c9
dp4 r4.y, c18, r0
mov r1, c8
dp4 r4.x, c18, r1
mad r0.xyz, r4, c16.w, -v0
dp4 r0.w, v0, c7
dp3 o2.y, r0, r2
dp3 o2.z, v2, r0
dp3 o2.x, r0, v1
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 o3.y, r2, r3
dp3 o3.z, v2, r3
dp3 o3.x, v1, r3
dp4 o4.w, r0, c15
dp4 o4.z, r0, c14
dp4 o4.y, r0, c13
dp4 o4.x, r0, c12
mad o1.xy, v3, c19, c19.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "SPOT" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
uniform highp mat4 _LightMatrix0;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = tmpvar_1.xyz;
  tmpvar_5[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_5[2] = tmpvar_2;
  mat3 tmpvar_6;
  tmpvar_6[0].x = tmpvar_5[0].x;
  tmpvar_6[0].y = tmpvar_5[1].x;
  tmpvar_6[0].z = tmpvar_5[2].x;
  tmpvar_6[1].x = tmpvar_5[0].y;
  tmpvar_6[1].y = tmpvar_5[1].y;
  tmpvar_6[1].z = tmpvar_5[2].y;
  tmpvar_6[2].x = tmpvar_5[0].z;
  tmpvar_6[2].y = tmpvar_5[1].z;
  tmpvar_6[2].z = tmpvar_5[2].z;
  highp vec3 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_3 = tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_6 * (((_World2Object * tmpvar_8).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_4 = tmpvar_9;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD3 = (_LightMatrix0 * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform sampler2D _SpecularTex;
uniform sampler2D _RampTex;
uniform sampler2D _MainTex;
uniform sampler2D _LightTextureB0;
uniform sampler2D _LightTexture0;
uniform lowp vec4 _LightColor0;
uniform lowp float _Cutoff;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  lowp vec3 lightDir;
  mediump float tmpvar_1;
  lowp float tmpvar_2;
  highp vec3 specGloss;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec3 tmpvar_5;
  tmpvar_5 = ((texture2D (_BumpMap, xlv_TEXCOORD0).xyz * 2.0) - 1.0);
  lowp vec3 tmpvar_6;
  tmpvar_6 = texture2D (_SpecularTex, xlv_TEXCOORD0).xyz;
  specGloss = tmpvar_6;
  highp float tmpvar_7;
  tmpvar_7 = specGloss.x;
  tmpvar_1 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = specGloss.y;
  tmpvar_2 = tmpvar_8;
  lowp float x;
  x = (tmpvar_4.w - _Cutoff);
  if ((x < 0.0)) {
    discard;
  };
  mediump vec3 tmpvar_9;
  tmpvar_9 = normalize (xlv_TEXCOORD1);
  lightDir = tmpvar_9;
  mediump vec3 tmpvar_10;
  tmpvar_10 = normalize (xlv_TEXCOORD2);
  highp vec3 LightCoord_i0;
  LightCoord_i0 = xlv_TEXCOORD3.xyz;
  highp vec2 tmpvar_11;
  tmpvar_11 = vec2(dot (LightCoord_i0, LightCoord_i0));
  lowp vec3 viewDir;
  viewDir = tmpvar_10;
  lowp float atten;
  atten = ((float((xlv_TEXCOORD3.z > 0.0)) * texture2D (_LightTexture0, ((xlv_TEXCOORD3.xy / xlv_TEXCOORD3.w) + 0.5)).w) * texture2D (_LightTextureB0, tmpvar_11).w);
  lowp vec4 c_i0;
  highp float nh;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_RampTex, vec2((((dot (tmpvar_5, lightDir) * 0.5) + 0.5) * atten)));
  lowp float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_5, normalize ((lightDir + viewDir))));
  nh = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = ((((tmpvar_3.xyz * tmpvar_12.xyz) * _LightColor0.xyz) + (_LightColor0.xyz * (pow (nh, (tmpvar_2 * 128.0)) * tmpvar_1))) * (atten * 2.0));
  c_i0.xyz = tmpvar_14;
  c_i0.w = tmpvar_4.w;
  c = c_i0;
  c.w = tmpvar_4.w;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "glesdesktop " {
Keywords { "SPOT" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
uniform highp mat4 _LightMatrix0;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = tmpvar_1.xyz;
  tmpvar_5[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_5[2] = tmpvar_2;
  mat3 tmpvar_6;
  tmpvar_6[0].x = tmpvar_5[0].x;
  tmpvar_6[0].y = tmpvar_5[1].x;
  tmpvar_6[0].z = tmpvar_5[2].x;
  tmpvar_6[1].x = tmpvar_5[0].y;
  tmpvar_6[1].y = tmpvar_5[1].y;
  tmpvar_6[1].z = tmpvar_5[2].y;
  tmpvar_6[2].x = tmpvar_5[0].z;
  tmpvar_6[2].y = tmpvar_5[1].z;
  tmpvar_6[2].z = tmpvar_5[2].z;
  highp vec3 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_3 = tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_6 * (((_World2Object * tmpvar_8).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_4 = tmpvar_9;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD3 = (_LightMatrix0 * (_Object2World * _glesVertex));
}



#endif
#ifdef FRAGMENT

varying highp vec4 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform sampler2D _SpecularTex;
uniform sampler2D _RampTex;
uniform sampler2D _MainTex;
uniform sampler2D _LightTextureB0;
uniform sampler2D _LightTexture0;
uniform lowp vec4 _LightColor0;
uniform lowp float _Cutoff;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  lowp vec3 lightDir;
  mediump float tmpvar_1;
  lowp float tmpvar_2;
  highp vec3 specGloss;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec3 normal;
  normal.xy = ((texture2D (_BumpMap, xlv_TEXCOORD0).wy * 2.0) - 1.0);
  normal.z = sqrt (((1.0 - (normal.x * normal.x)) - (normal.y * normal.y)));
  lowp vec3 tmpvar_5;
  tmpvar_5 = texture2D (_SpecularTex, xlv_TEXCOORD0).xyz;
  specGloss = tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = specGloss.x;
  tmpvar_1 = tmpvar_6;
  highp float tmpvar_7;
  tmpvar_7 = specGloss.y;
  tmpvar_2 = tmpvar_7;
  lowp float x;
  x = (tmpvar_4.w - _Cutoff);
  if ((x < 0.0)) {
    discard;
  };
  mediump vec3 tmpvar_8;
  tmpvar_8 = normalize (xlv_TEXCOORD1);
  lightDir = tmpvar_8;
  mediump vec3 tmpvar_9;
  tmpvar_9 = normalize (xlv_TEXCOORD2);
  highp vec3 LightCoord_i0;
  LightCoord_i0 = xlv_TEXCOORD3.xyz;
  highp vec2 tmpvar_10;
  tmpvar_10 = vec2(dot (LightCoord_i0, LightCoord_i0));
  lowp vec3 viewDir;
  viewDir = tmpvar_9;
  lowp float atten;
  atten = ((float((xlv_TEXCOORD3.z > 0.0)) * texture2D (_LightTexture0, ((xlv_TEXCOORD3.xy / xlv_TEXCOORD3.w) + 0.5)).w) * texture2D (_LightTextureB0, tmpvar_10).w);
  lowp vec4 c_i0;
  highp float nh;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_RampTex, vec2((((dot (normal, lightDir) * 0.5) + 0.5) * atten)));
  lowp float tmpvar_12;
  tmpvar_12 = max (0.0, dot (normal, normalize ((lightDir + viewDir))));
  nh = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = ((((tmpvar_3.xyz * tmpvar_11.xyz) * _LightColor0.xyz) + (_LightColor0.xyz * (pow (nh, (tmpvar_2 * 128.0)) * tmpvar_1))) * (atten * 2.0));
  c_i0.xyz = tmpvar_13;
  c_i0.w = tmpvar_4.w;
  c = c_i0;
  c.w = tmpvar_4.w;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Vector 17 [unity_Scale]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 20 [_MainTex_ST]
"3.0-!!ARBvp1.0
# 33 ALU
PARAM c[21] = { { 1 },
		state.matrix.mvp,
		program.local[5..20] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[18];
MOV R1.w, c[0].x;
MOV R0.xyz, vertex.attrib[14];
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
MAD R2.xyz, R2, c[17].w, -vertex.position;
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[19];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP4 R3.z, R0, c[11];
DP4 R3.x, R0, c[9];
DP4 R3.y, R0, c[10];
MAD R0.xyz, R3, c[17].w, -vertex.position;
DP3 result.texcoord[1].y, R0, R1;
DP3 result.texcoord[1].z, vertex.normal, R0;
DP3 result.texcoord[1].x, R0, vertex.attrib[14];
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[2].y, R1, R2;
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, vertex.attrib[14], R2;
DP4 result.texcoord[3].z, R0, c[15];
DP4 result.texcoord[3].y, R0, c[14];
DP4 result.texcoord[3].x, R0, c[13];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 33 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 16 [unity_Scale]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 19 [_MainTex_ST]
"vs_3_0
; 36 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
def c20, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mov r0.w, c20.x
mov r0.xyz, c17
dp4 r1.z, r0, c10
dp4 r1.y, r0, c9
dp4 r1.x, r0, c8
mad r3.xyz, r1, c16.w, -v0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r1, v1.w
mov r0, c10
dp4 r4.z, c18, r0
mov r0, c9
dp4 r4.y, c18, r0
mov r1, c8
dp4 r4.x, c18, r1
mad r0.xyz, r4, c16.w, -v0
dp3 o2.y, r0, r2
dp3 o2.z, v2, r0
dp3 o2.x, r0, v1
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 o3.y, r2, r3
dp3 o3.z, v2, r3
dp3 o3.x, v1, r3
dp4 o4.z, r0, c14
dp4 o4.y, r0, c13
dp4 o4.x, r0, c12
mad o1.xy, v3, c19, c19.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "POINT_COOKIE" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec3 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
uniform highp mat4 _LightMatrix0;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = tmpvar_1.xyz;
  tmpvar_5[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_5[2] = tmpvar_2;
  mat3 tmpvar_6;
  tmpvar_6[0].x = tmpvar_5[0].x;
  tmpvar_6[0].y = tmpvar_5[1].x;
  tmpvar_6[0].z = tmpvar_5[2].x;
  tmpvar_6[1].x = tmpvar_5[0].y;
  tmpvar_6[1].y = tmpvar_5[1].y;
  tmpvar_6[1].z = tmpvar_5[2].y;
  tmpvar_6[2].x = tmpvar_5[0].z;
  tmpvar_6[2].y = tmpvar_5[1].z;
  tmpvar_6[2].z = tmpvar_5[2].z;
  highp vec3 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_3 = tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_6 * (((_World2Object * tmpvar_8).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_4 = tmpvar_9;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD3 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
}



#endif
#ifdef FRAGMENT

varying highp vec3 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform sampler2D _SpecularTex;
uniform sampler2D _RampTex;
uniform sampler2D _MainTex;
uniform sampler2D _LightTextureB0;
uniform samplerCube _LightTexture0;
uniform lowp vec4 _LightColor0;
uniform lowp float _Cutoff;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  lowp vec3 lightDir;
  mediump float tmpvar_1;
  lowp float tmpvar_2;
  highp vec3 specGloss;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec3 tmpvar_5;
  tmpvar_5 = ((texture2D (_BumpMap, xlv_TEXCOORD0).xyz * 2.0) - 1.0);
  lowp vec3 tmpvar_6;
  tmpvar_6 = texture2D (_SpecularTex, xlv_TEXCOORD0).xyz;
  specGloss = tmpvar_6;
  highp float tmpvar_7;
  tmpvar_7 = specGloss.x;
  tmpvar_1 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = specGloss.y;
  tmpvar_2 = tmpvar_8;
  lowp float x;
  x = (tmpvar_4.w - _Cutoff);
  if ((x < 0.0)) {
    discard;
  };
  mediump vec3 tmpvar_9;
  tmpvar_9 = normalize (xlv_TEXCOORD1);
  lightDir = tmpvar_9;
  mediump vec3 tmpvar_10;
  tmpvar_10 = normalize (xlv_TEXCOORD2);
  highp vec2 tmpvar_11;
  tmpvar_11 = vec2(dot (xlv_TEXCOORD3, xlv_TEXCOORD3));
  lowp vec3 viewDir;
  viewDir = tmpvar_10;
  lowp float atten;
  atten = (texture2D (_LightTextureB0, tmpvar_11).w * textureCube (_LightTexture0, xlv_TEXCOORD3).w);
  lowp vec4 c_i0;
  highp float nh;
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_RampTex, vec2((((dot (tmpvar_5, lightDir) * 0.5) + 0.5) * atten)));
  lowp float tmpvar_13;
  tmpvar_13 = max (0.0, dot (tmpvar_5, normalize ((lightDir + viewDir))));
  nh = tmpvar_13;
  highp vec3 tmpvar_14;
  tmpvar_14 = ((((tmpvar_3.xyz * tmpvar_12.xyz) * _LightColor0.xyz) + (_LightColor0.xyz * (pow (nh, (tmpvar_2 * 128.0)) * tmpvar_1))) * (atten * 2.0));
  c_i0.xyz = tmpvar_14;
  c_i0.w = tmpvar_4.w;
  c = c_i0;
  c.w = tmpvar_4.w;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "glesdesktop " {
Keywords { "POINT_COOKIE" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec3 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform highp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
uniform highp mat4 _LightMatrix0;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = tmpvar_1.xyz;
  tmpvar_5[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_5[2] = tmpvar_2;
  mat3 tmpvar_6;
  tmpvar_6[0].x = tmpvar_5[0].x;
  tmpvar_6[0].y = tmpvar_5[1].x;
  tmpvar_6[0].z = tmpvar_5[2].x;
  tmpvar_6[1].x = tmpvar_5[0].y;
  tmpvar_6[1].y = tmpvar_5[1].y;
  tmpvar_6[1].z = tmpvar_5[2].y;
  tmpvar_6[2].x = tmpvar_5[0].z;
  tmpvar_6[2].y = tmpvar_5[1].z;
  tmpvar_6[2].z = tmpvar_5[2].z;
  highp vec3 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * (((_World2Object * _WorldSpaceLightPos0).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_3 = tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_6 * (((_World2Object * tmpvar_8).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_4 = tmpvar_9;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD3 = (_LightMatrix0 * (_Object2World * _glesVertex)).xyz;
}



#endif
#ifdef FRAGMENT

varying highp vec3 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform sampler2D _SpecularTex;
uniform sampler2D _RampTex;
uniform sampler2D _MainTex;
uniform sampler2D _LightTextureB0;
uniform samplerCube _LightTexture0;
uniform lowp vec4 _LightColor0;
uniform lowp float _Cutoff;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  lowp vec3 lightDir;
  mediump float tmpvar_1;
  lowp float tmpvar_2;
  highp vec3 specGloss;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec3 normal;
  normal.xy = ((texture2D (_BumpMap, xlv_TEXCOORD0).wy * 2.0) - 1.0);
  normal.z = sqrt (((1.0 - (normal.x * normal.x)) - (normal.y * normal.y)));
  lowp vec3 tmpvar_5;
  tmpvar_5 = texture2D (_SpecularTex, xlv_TEXCOORD0).xyz;
  specGloss = tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = specGloss.x;
  tmpvar_1 = tmpvar_6;
  highp float tmpvar_7;
  tmpvar_7 = specGloss.y;
  tmpvar_2 = tmpvar_7;
  lowp float x;
  x = (tmpvar_4.w - _Cutoff);
  if ((x < 0.0)) {
    discard;
  };
  mediump vec3 tmpvar_8;
  tmpvar_8 = normalize (xlv_TEXCOORD1);
  lightDir = tmpvar_8;
  mediump vec3 tmpvar_9;
  tmpvar_9 = normalize (xlv_TEXCOORD2);
  highp vec2 tmpvar_10;
  tmpvar_10 = vec2(dot (xlv_TEXCOORD3, xlv_TEXCOORD3));
  lowp vec3 viewDir;
  viewDir = tmpvar_9;
  lowp float atten;
  atten = (texture2D (_LightTextureB0, tmpvar_10).w * textureCube (_LightTexture0, xlv_TEXCOORD3).w);
  lowp vec4 c_i0;
  highp float nh;
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_RampTex, vec2((((dot (normal, lightDir) * 0.5) + 0.5) * atten)));
  lowp float tmpvar_12;
  tmpvar_12 = max (0.0, dot (normal, normalize ((lightDir + viewDir))));
  nh = tmpvar_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = ((((tmpvar_3.xyz * tmpvar_11.xyz) * _LightColor0.xyz) + (_LightColor0.xyz * (pow (nh, (tmpvar_2 * 128.0)) * tmpvar_1))) * (atten * 2.0));
  c_i0.xyz = tmpvar_13;
  c_i0.w = tmpvar_4.w;
  c = c_i0;
  c.w = tmpvar_4.w;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "tangent" ATTR14
Bind "normal" Normal
Bind "texcoord" TexCoord0
Vector 17 [unity_Scale]
Vector 18 [_WorldSpaceCameraPos]
Vector 19 [_WorldSpaceLightPos0]
Matrix 5 [_Object2World]
Matrix 9 [_World2Object]
Matrix 13 [_LightMatrix0]
Vector 20 [_MainTex_ST]
"3.0-!!ARBvp1.0
# 31 ALU
PARAM c[21] = { { 1 },
		state.matrix.mvp,
		program.local[5..20] };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
MOV R1.xyz, c[18];
MOV R1.w, c[0].x;
MOV R0.xyz, vertex.attrib[14];
DP4 R2.z, R1, c[11];
DP4 R2.y, R1, c[10];
DP4 R2.x, R1, c[9];
MAD R2.xyz, R2, c[17].w, -vertex.position;
MUL R1.xyz, vertex.normal.zxyw, R0.yzxw;
MAD R1.xyz, vertex.normal.yzxw, R0.zxyw, -R1;
MOV R0, c[19];
MUL R1.xyz, R1, vertex.attrib[14].w;
DP4 R3.z, R0, c[11];
DP4 R3.y, R0, c[10];
DP4 R3.x, R0, c[9];
DP4 R0.w, vertex.position, c[8];
DP4 R0.z, vertex.position, c[7];
DP4 R0.x, vertex.position, c[5];
DP4 R0.y, vertex.position, c[6];
DP3 result.texcoord[1].y, R3, R1;
DP3 result.texcoord[2].y, R1, R2;
DP3 result.texcoord[1].z, vertex.normal, R3;
DP3 result.texcoord[1].x, R3, vertex.attrib[14];
DP3 result.texcoord[2].z, vertex.normal, R2;
DP3 result.texcoord[2].x, vertex.attrib[14], R2;
DP4 result.texcoord[3].y, R0, c[14];
DP4 result.texcoord[3].x, R0, c[13];
MAD result.texcoord[0].xy, vertex.texcoord[0], c[20], c[20].zwzw;
DP4 result.position.w, vertex.position, c[4];
DP4 result.position.z, vertex.position, c[3];
DP4 result.position.y, vertex.position, c[2];
DP4 result.position.x, vertex.position, c[1];
END
# 31 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Bind "vertex" Vertex
Bind "tangent" TexCoord2
Bind "normal" Normal
Bind "texcoord" TexCoord0
Matrix 0 [glstate_matrix_mvp]
Vector 16 [unity_Scale]
Vector 17 [_WorldSpaceCameraPos]
Vector 18 [_WorldSpaceLightPos0]
Matrix 4 [_Object2World]
Matrix 8 [_World2Object]
Matrix 12 [_LightMatrix0]
Vector 19 [_MainTex_ST]
"vs_3_0
; 34 ALU
dcl_position o0
dcl_texcoord0 o1
dcl_texcoord1 o2
dcl_texcoord2 o3
dcl_texcoord3 o4
def c20, 1.00000000, 0, 0, 0
dcl_position0 v0
dcl_tangent0 v1
dcl_normal0 v2
dcl_texcoord0 v3
mov r0.w, c20.x
mov r0.xyz, c17
dp4 r1.z, r0, c10
dp4 r1.y, r0, c9
dp4 r1.x, r0, c8
mad r3.xyz, r1, c16.w, -v0
mov r0.xyz, v1
mul r1.xyz, v2.zxyw, r0.yzxw
mov r0.xyz, v1
mad r1.xyz, v2.yzxw, r0.zxyw, -r1
mul r2.xyz, r1, v1.w
mov r0, c10
dp4 r4.z, c18, r0
mov r0, c9
dp4 r4.y, c18, r0
mov r1, c8
dp4 r4.x, c18, r1
dp4 r0.w, v0, c7
dp4 r0.z, v0, c6
dp4 r0.x, v0, c4
dp4 r0.y, v0, c5
dp3 o2.y, r4, r2
dp3 o3.y, r2, r3
dp3 o2.z, v2, r4
dp3 o2.x, r4, v1
dp3 o3.z, v2, r3
dp3 o3.x, v1, r3
dp4 o4.y, r0, c13
dp4 o4.x, r0, c12
mad o1.xy, v3, c19, c19.zwzw
dp4 o0.w, v0, c3
dp4 o0.z, v0, c2
dp4 o0.y, v0, c1
dp4 o0.x, v0, c0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL_COOKIE" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec2 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
uniform highp mat4 _LightMatrix0;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = tmpvar_1.xyz;
  tmpvar_5[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_5[2] = tmpvar_2;
  mat3 tmpvar_6;
  tmpvar_6[0].x = tmpvar_5[0].x;
  tmpvar_6[0].y = tmpvar_5[1].x;
  tmpvar_6[0].z = tmpvar_5[2].x;
  tmpvar_6[1].x = tmpvar_5[0].y;
  tmpvar_6[1].y = tmpvar_5[1].y;
  tmpvar_6[1].z = tmpvar_5[2].y;
  tmpvar_6[2].x = tmpvar_5[0].z;
  tmpvar_6[2].y = tmpvar_5[1].z;
  tmpvar_6[2].z = tmpvar_5[2].z;
  highp vec3 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_3 = tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_6 * (((_World2Object * tmpvar_8).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_4 = tmpvar_9;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD3 = (_LightMatrix0 * (_Object2World * _glesVertex)).xy;
}



#endif
#ifdef FRAGMENT

varying highp vec2 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform sampler2D _SpecularTex;
uniform sampler2D _RampTex;
uniform sampler2D _MainTex;
uniform sampler2D _LightTexture0;
uniform lowp vec4 _LightColor0;
uniform lowp float _Cutoff;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  lowp vec3 lightDir;
  mediump float tmpvar_1;
  lowp float tmpvar_2;
  highp vec3 specGloss;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec3 tmpvar_5;
  tmpvar_5 = ((texture2D (_BumpMap, xlv_TEXCOORD0).xyz * 2.0) - 1.0);
  lowp vec3 tmpvar_6;
  tmpvar_6 = texture2D (_SpecularTex, xlv_TEXCOORD0).xyz;
  specGloss = tmpvar_6;
  highp float tmpvar_7;
  tmpvar_7 = specGloss.x;
  tmpvar_1 = tmpvar_7;
  highp float tmpvar_8;
  tmpvar_8 = specGloss.y;
  tmpvar_2 = tmpvar_8;
  lowp float x;
  x = (tmpvar_4.w - _Cutoff);
  if ((x < 0.0)) {
    discard;
  };
  lightDir = xlv_TEXCOORD1;
  mediump vec3 tmpvar_9;
  tmpvar_9 = normalize (xlv_TEXCOORD2);
  lowp vec3 viewDir;
  viewDir = tmpvar_9;
  lowp float atten;
  atten = texture2D (_LightTexture0, xlv_TEXCOORD3).w;
  lowp vec4 c_i0;
  highp float nh;
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_RampTex, vec2((((dot (tmpvar_5, lightDir) * 0.5) + 0.5) * atten)));
  lowp float tmpvar_11;
  tmpvar_11 = max (0.0, dot (tmpvar_5, normalize ((lightDir + viewDir))));
  nh = tmpvar_11;
  highp vec3 tmpvar_12;
  tmpvar_12 = ((((tmpvar_3.xyz * tmpvar_10.xyz) * _LightColor0.xyz) + (_LightColor0.xyz * (pow (nh, (tmpvar_2 * 128.0)) * tmpvar_1))) * (atten * 2.0));
  c_i0.xyz = tmpvar_12;
  c_i0.w = tmpvar_4.w;
  c = c_i0;
  c.w = tmpvar_4.w;
  gl_FragData[0] = c;
}



#endif"
}

SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL_COOKIE" }
"!!GLES
#define SHADER_API_GLES 1
#define tex2D texture2D


#ifdef VERTEX
#define gl_ModelViewProjectionMatrix glstate_matrix_mvp
uniform mat4 glstate_matrix_mvp;

varying highp vec2 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform highp vec4 unity_Scale;

uniform lowp vec4 _WorldSpaceLightPos0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 _World2Object;
uniform highp mat4 _Object2World;
uniform highp vec4 _MainTex_ST;
uniform highp mat4 _LightMatrix0;
attribute vec4 _glesTANGENT;
attribute vec4 _glesMultiTexCoord0;
attribute vec3 _glesNormal;
attribute vec4 _glesVertex;
void main ()
{
  vec4 tmpvar_1;
  tmpvar_1.xyz = normalize (_glesTANGENT.xyz);
  tmpvar_1.w = _glesTANGENT.w;
  vec3 tmpvar_2;
  tmpvar_2 = normalize (_glesNormal);
  mediump vec3 tmpvar_3;
  mediump vec3 tmpvar_4;
  highp mat3 tmpvar_5;
  tmpvar_5[0] = tmpvar_1.xyz;
  tmpvar_5[1] = (cross (tmpvar_2, tmpvar_1.xyz) * _glesTANGENT.w);
  tmpvar_5[2] = tmpvar_2;
  mat3 tmpvar_6;
  tmpvar_6[0].x = tmpvar_5[0].x;
  tmpvar_6[0].y = tmpvar_5[1].x;
  tmpvar_6[0].z = tmpvar_5[2].x;
  tmpvar_6[1].x = tmpvar_5[0].y;
  tmpvar_6[1].y = tmpvar_5[1].y;
  tmpvar_6[1].z = tmpvar_5[2].y;
  tmpvar_6[2].x = tmpvar_5[0].z;
  tmpvar_6[2].y = tmpvar_5[1].z;
  tmpvar_6[2].z = tmpvar_5[2].z;
  highp vec3 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * (_World2Object * _WorldSpaceLightPos0).xyz);
  tmpvar_3 = tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_8.w = 1.0;
  tmpvar_8.xyz = _WorldSpaceCameraPos;
  highp vec3 tmpvar_9;
  tmpvar_9 = (tmpvar_6 * (((_World2Object * tmpvar_8).xyz * unity_Scale.w) - _glesVertex.xyz));
  tmpvar_4 = tmpvar_9;
  gl_Position = (gl_ModelViewProjectionMatrix * _glesVertex);
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = tmpvar_4;
  xlv_TEXCOORD3 = (_LightMatrix0 * (_Object2World * _glesVertex)).xy;
}



#endif
#ifdef FRAGMENT

varying highp vec2 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD0;
uniform sampler2D _SpecularTex;
uniform sampler2D _RampTex;
uniform sampler2D _MainTex;
uniform sampler2D _LightTexture0;
uniform lowp vec4 _LightColor0;
uniform lowp float _Cutoff;
uniform sampler2D _BumpMap;
void main ()
{
  lowp vec4 c;
  lowp vec3 lightDir;
  mediump float tmpvar_1;
  lowp float tmpvar_2;
  highp vec3 specGloss;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  lowp vec3 normal;
  normal.xy = ((texture2D (_BumpMap, xlv_TEXCOORD0).wy * 2.0) - 1.0);
  normal.z = sqrt (((1.0 - (normal.x * normal.x)) - (normal.y * normal.y)));
  lowp vec3 tmpvar_5;
  tmpvar_5 = texture2D (_SpecularTex, xlv_TEXCOORD0).xyz;
  specGloss = tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = specGloss.x;
  tmpvar_1 = tmpvar_6;
  highp float tmpvar_7;
  tmpvar_7 = specGloss.y;
  tmpvar_2 = tmpvar_7;
  lowp float x;
  x = (tmpvar_4.w - _Cutoff);
  if ((x < 0.0)) {
    discard;
  };
  lightDir = xlv_TEXCOORD1;
  mediump vec3 tmpvar_8;
  tmpvar_8 = normalize (xlv_TEXCOORD2);
  lowp vec3 viewDir;
  viewDir = tmpvar_8;
  lowp float atten;
  atten = texture2D (_LightTexture0, xlv_TEXCOORD3).w;
  lowp vec4 c_i0;
  highp float nh;
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_RampTex, vec2((((dot (normal, lightDir) * 0.5) + 0.5) * atten)));
  lowp float tmpvar_10;
  tmpvar_10 = max (0.0, dot (normal, normalize ((lightDir + viewDir))));
  nh = tmpvar_10;
  highp vec3 tmpvar_11;
  tmpvar_11 = ((((tmpvar_3.xyz * tmpvar_9.xyz) * _LightColor0.xyz) + (_LightColor0.xyz * (pow (nh, (tmpvar_2 * 128.0)) * tmpvar_1))) * (atten * 2.0));
  c_i0.xyz = tmpvar_11;
  c_i0.w = tmpvar_4.w;
  c = c_i0;
  c.w = tmpvar_4.w;
  gl_FragData[0] = c;
}



#endif"
}

}
Program "fp" {
// Fragment combos: 5
//   opengl - ALU: 31 to 43, TEX: 4 to 6
//   d3d9 - ALU: 31 to 40, TEX: 5 to 7
SubProgram "opengl " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
Float 1 [_Cutoff]
SetTexture 0 [_MainTex] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_SpecularTex] 2D
SetTexture 3 [_LightTexture0] 2D
SetTexture 4 [_RampTex] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 37 ALU, 5 TEX
PARAM c[4] = { program.local[0..1],
		{ 2, 1, 0, 128 },
		{ 0.5 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0.yw, fragment.texcoord[0], texture[1], 2D;
MAD R2.xy, R0.wyzw, c[2].x, -c[2].y;
DP3 R1.y, fragment.texcoord[3], fragment.texcoord[3];
MUL R0.x, R2.y, R2.y;
MAD R0.x, -R2, R2, -R0;
ADD R0.x, R0, c[2].y;
RSQ R0.w, R0.x;
DP3 R0.y, fragment.texcoord[1], fragment.texcoord[1];
RSQ R0.y, R0.y;
MUL R0.xyz, R0.y, fragment.texcoord[1];
RCP R2.z, R0.w;
DP3 R0.w, R2, R0;
MAD R1.x, R0.w, c[3], c[3];
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
RSQ R0.w, R0.w;
MAD R3.xyz, R0.w, fragment.texcoord[2], R0;
TEX R1.w, R1.y, texture[3], 2D;
MUL R0.y, R1.x, R1.w;
DP3 R0.x, R3, R3;
TEX R1.xyz, R0.y, texture[4], 2D;
RSQ R2.w, R0.x;
TEX R0, fragment.texcoord[0], texture[0], 2D;
MUL R0.xyz, R0, R1;
MUL R1.xyz, R2.w, R3;
DP3 R1.x, R2, R1;
TEX R3.xy, fragment.texcoord[0], texture[2], 2D;
MUL R1.y, R3, c[2].w;
MAX R1.x, R1, c[2].z;
POW R1.x, R1.x, R1.y;
MUL R0.xyz, R0, c[0];
MUL R1.x, R1, R3;
MAD R0.xyz, R1.x, c[0], R0;
MUL R1.y, R1.w, c[2].x;
MUL result.color.xyz, R0, R1.y;
SLT R0.x, R0.w, c[1];
MOV result.color.w, R0;
KIL -R0.x;
END
# 37 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "POINT" }
Vector 0 [_LightColor0]
Float 1 [_Cutoff]
SetTexture 0 [_MainTex] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_SpecularTex] 2D
SetTexture 3 [_LightTexture0] 2D
SetTexture 4 [_RampTex] 2D
"ps_3_0
; 36 ALU, 6 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
def c2, 0.00000000, 1.00000000, 2.00000000, -1.00000000
def c3, 128.00000000, 0.50000000, 0, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
texld r1.yw, v0, s1
texld r3.xy, v0, s2
dp3_pp r0.x, v1, v1
rsq_pp r0.x, r0.x
dp3_pp r1.x, v2, v2
mad_pp r2.xy, r1.wyzw, c2.z, c2.w
mul_pp r0.yzw, r0.x, v1.xxyz
mul_pp r0.x, r2.y, r2.y
mad_pp r0.x, -r2, r2, -r0
rsq_pp r1.x, r1.x
mad_pp r1.xyz, r1.x, v2, r0.yzww
dp3_pp r1.w, r1, r1
rsq_pp r1.w, r1.w
add_pp r0.x, r0, c2.y
rsq_pp r0.x, r0.x
rcp_pp r2.z, r0.x
dp3_pp r0.y, r2, r0.yzww
mul_pp r1.xyz, r1.w, r1
dp3_pp r0.x, r2, r1
mul_pp r2.w, r3.y, c3.x
max_pp r0.x, r0, c2
pow r1, r0.x, r2.w
dp3 r0.x, v3, v3
texld r0.x, r0.x, s3
mad_pp r0.y, r0, c3, c3
mul_pp r2.x, r0.y, r0
mov r0.y, r1.x
texld r4.xyz, r2.x, s4
texld r2, v0, s0
mul r0.z, r0.y, r3.x
mul_pp r2.xyz, r2, r4
mul_pp r1.xyz, r2, c0
add_pp r0.y, r2.w, -c1.x
mad r1.xyz, r0.z, c0, r1
mul_pp r1.w, r0.x, c2.z
cmp r0.y, r0, c2.x, c2
mov_pp r0, -r0.y
mul oC0.xyz, r1, r1.w
texkill r0.xyzw
mov_pp oC0.w, r2
"
}

SubProgram "gles " {
Keywords { "POINT" }
"!!GLES"
}

SubProgram "glesdesktop " {
Keywords { "POINT" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Float 1 [_Cutoff]
SetTexture 0 [_MainTex] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_SpecularTex] 2D
SetTexture 3 [_RampTex] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 31 ALU, 4 TEX
PARAM c[4] = { program.local[0..1],
		{ 2, 1, 0, 128 },
		{ 0.5 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0.yw, fragment.texcoord[0], texture[1], 2D;
MAD R2.xy, R0.wyzw, c[2].x, -c[2].y;
MUL R0.x, R2.y, R2.y;
MAD R0.x, -R2, R2, -R0;
ADD R0.x, R0, c[2].y;
RSQ R0.x, R0.x;
RCP R2.z, R0.x;
DP3 R0.y, R2, fragment.texcoord[1];
DP3 R0.x, fragment.texcoord[2], fragment.texcoord[2];
MOV R1.xyz, fragment.texcoord[1];
RSQ R0.x, R0.x;
MAD R3.xyz, R0.x, fragment.texcoord[2], R1;
DP3 R0.x, R3, R3;
MAD R0.y, R0, c[3].x, c[3].x;
TEX R1.xyz, R0.y, texture[3], 2D;
RSQ R1.w, R0.x;
TEX R0, fragment.texcoord[0], texture[0], 2D;
MUL R0.xyz, R0, R1;
MUL R1.xyz, R1.w, R3;
DP3 R1.x, R2, R1;
TEX R3.xy, fragment.texcoord[0], texture[2], 2D;
MUL R2.xyz, R0, c[0];
MUL R1.y, R3, c[2].w;
MAX R1.x, R1, c[2].z;
POW R1.x, R1.x, R1.y;
MUL R0.x, R1, R3;
MAD R0.xyz, R0.x, c[0], R2;
MUL result.color.xyz, R0, c[2].x;
SLT R0.x, R0.w, c[1];
MOV result.color.w, R0;
KIL -R0.x;
END
# 31 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL" }
Vector 0 [_LightColor0]
Float 1 [_Cutoff]
SetTexture 0 [_MainTex] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_SpecularTex] 2D
SetTexture 3 [_RampTex] 2D
"ps_3_0
; 31 ALU, 5 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
def c2, 0.00000000, 1.00000000, 2.00000000, -1.00000000
def c3, 128.00000000, 0.50000000, 0, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
texld r1.yw, v0, s1
mad_pp r1.xy, r1.wyzw, c2.z, c2.w
mul_pp r0.w, r1.y, r1.y
mad_pp r0.w, -r1.x, r1.x, -r0
texld r2.xy, v0, s2
dp3_pp r1.z, v2, v2
add_pp r0.w, r0, c2.y
rsq_pp r1.z, r1.z
mov_pp r0.xyz, v1
mad_pp r0.xyz, r1.z, v2, r0
dp3_pp r1.z, r0, r0
rsq_pp r1.z, r1.z
mul_pp r0.xyz, r1.z, r0
rsq_pp r0.w, r0.w
rcp_pp r1.z, r0.w
dp3_pp r0.x, r1, r0
max_pp r1.w, r0.x, c2.x
mul_pp r2.y, r2, c3.x
pow r0, r1.w, r2.y
mov r0.y, r0.x
dp3_pp r0.z, r1, v1
mad_pp r0.x, r0.z, c3.y, c3.y
texld r1.xyz, r0.x, s3
mul r1.w, r0.y, r2.x
texld r0, v0, s0
mul_pp r0.xyz, r0, r1
add_pp r1.x, r0.w, -c1
mul_pp r0.xyz, r0, c0
mad r0.xyz, r1.w, c0, r0
cmp r1.x, r1, c2, c2.y
mov_pp r1, -r1.x
mul oC0.xyz, r0, c2.z
texkill r1.xyzw
mov_pp oC0.w, r0
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL" }
"!!GLES"
}

SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
Float 1 [_Cutoff]
SetTexture 0 [_MainTex] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_SpecularTex] 2D
SetTexture 3 [_LightTexture0] 2D
SetTexture 4 [_LightTextureB0] 2D
SetTexture 5 [_RampTex] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 43 ALU, 6 TEX
PARAM c[4] = { program.local[0..1],
		{ 2, 1, 0, 128 },
		{ 0.5 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0.yw, fragment.texcoord[0], texture[1], 2D;
MAD R1.xy, R0.wyzw, c[2].x, -c[2].y;
MUL R0.x, R1.y, R1.y;
MAD R0.x, -R1, R1, -R0;
RCP R1.w, fragment.texcoord[3].w;
MAD R2.zw, fragment.texcoord[3].xyxy, R1.w, c[3].x;
ADD R0.x, R0, c[2].y;
RSQ R0.x, R0.x;
DP3 R0.y, fragment.texcoord[1], fragment.texcoord[1];
RCP R1.z, R0.x;
RSQ R0.y, R0.y;
MUL R0.xyz, R0.y, fragment.texcoord[1];
DP3 R0.w, R1, R0;
MAD R2.x, R0.w, c[3], c[3];
TEX R0.w, R2.zwzw, texture[3], 2D;
SLT R1.w, c[2].z, fragment.texcoord[3].z;
MUL R2.z, R1.w, R0.w;
DP3 R1.w, fragment.texcoord[2], fragment.texcoord[2];
RSQ R2.y, R1.w;
MAD R3.xyz, R2.y, fragment.texcoord[2], R0;
DP3 R0.x, R3, R3;
DP3 R0.w, fragment.texcoord[3], fragment.texcoord[3];
TEX R0.w, R0.w, texture[4], 2D;
MUL R1.w, R2.z, R0;
MUL R0.y, R2.x, R1.w;
TEX R2.xyz, R0.y, texture[5], 2D;
RSQ R2.w, R0.x;
TEX R0, fragment.texcoord[0], texture[0], 2D;
MUL R0.xyz, R0, R2;
MUL R2.xyz, R2.w, R3;
DP3 R1.x, R1, R2;
TEX R3.xy, fragment.texcoord[0], texture[2], 2D;
MUL R1.y, R3, c[2].w;
MAX R1.x, R1, c[2].z;
POW R1.x, R1.x, R1.y;
MUL R0.xyz, R0, c[0];
MUL R1.x, R1, R3;
MAD R0.xyz, R1.x, c[0], R0;
MUL R1.y, R1.w, c[2].x;
MUL result.color.xyz, R0, R1.y;
SLT R0.x, R0.w, c[1];
MOV result.color.w, R0;
KIL -R0.x;
END
# 43 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "SPOT" }
Vector 0 [_LightColor0]
Float 1 [_Cutoff]
SetTexture 0 [_MainTex] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_SpecularTex] 2D
SetTexture 3 [_LightTexture0] 2D
SetTexture 4 [_LightTextureB0] 2D
SetTexture 5 [_RampTex] 2D
"ps_3_0
; 40 ALU, 7 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
dcl_2d s5
def c2, 0.00000000, 1.00000000, 2.00000000, -1.00000000
def c3, 128.00000000, 0.50000000, 0, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3
texld r0.yw, v0, s1
mad_pp r1.xy, r0.wyzw, c2.z, c2.w
mul_pp r0.w, r1.y, r1.y
mad_pp r0.w, -r1.x, r1.x, -r0
texld r3.xy, v0, s2
dp3_pp r0.x, v1, v1
rsq_pp r0.x, r0.x
mul_pp r2.xyz, r0.x, v1
dp3_pp r0.x, v2, v2
rsq_pp r0.x, r0.x
mad_pp r0.xyz, r0.x, v2, r2
dp3_pp r1.z, r0, r0
rsq_pp r1.z, r1.z
add_pp r0.w, r0, c2.y
mul_pp r0.xyz, r1.z, r0
rsq_pp r0.w, r0.w
rcp_pp r1.z, r0.w
dp3_pp r0.x, r1, r0
max_pp r1.w, r0.x, c2.x
mul_pp r2.w, r3.y, c3.x
pow r0, r1.w, r2.w
dp3_pp r0.z, r1, r2
rcp r0.y, v3.w
mad r2.xy, v3, r0.y, c3.y
dp3 r1.x, v3, v3
texld r0.w, r2, s3
cmp r0.y, -v3.z, c2.x, c2
mul_pp r0.y, r0, r0.w
texld r1.x, r1.x, s4
mul_pp r0.y, r0, r1.x
mad_pp r0.z, r0, c3.y, c3.y
mul_pp r1.x, r0.z, r0.y
texld r2.xyz, r1.x, s5
texld r1, v0, s0
mul_pp r1.xyz, r1, r2
mul r0.z, r0.x, r3.x
mul_pp r1.xyz, r1, c0
add_pp r0.x, r1.w, -c1
mad r1.xyz, r0.z, c0, r1
mul_pp r2.x, r0.y, c2.z
cmp r0.x, r0, c2, c2.y
mov_pp r0, -r0.x
mul oC0.xyz, r1, r2.x
texkill r0.xyzw
mov_pp oC0.w, r1
"
}

SubProgram "gles " {
Keywords { "SPOT" }
"!!GLES"
}

SubProgram "glesdesktop " {
Keywords { "SPOT" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
Float 1 [_Cutoff]
SetTexture 0 [_MainTex] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_SpecularTex] 2D
SetTexture 3 [_LightTextureB0] 2D
SetTexture 4 [_LightTexture0] CUBE
SetTexture 5 [_RampTex] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 39 ALU, 6 TEX
PARAM c[4] = { program.local[0..1],
		{ 2, 1, 0, 128 },
		{ 0.5 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEMP R3;
TEX R0.yw, fragment.texcoord[0], texture[1], 2D;
MAD R0.xy, R0.wyzw, c[2].x, -c[2].y;
MUL R0.z, R0.y, R0.y;
MAD R0.z, -R0.x, R0.x, -R0;
DP3 R0.w, fragment.texcoord[1], fragment.texcoord[1];
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, fragment.texcoord[1];
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
RSQ R2.x, R0.w;
ADD R0.z, R0, c[2].y;
RSQ R0.z, R0.z;
RCP R0.z, R0.z;
DP3 R1.w, R0, R1;
MAD R3.xyz, R2.x, fragment.texcoord[2], R1;
MAD R2.y, R1.w, c[3].x, c[3].x;
DP3 R1.x, R3, R3;
DP3 R1.w, fragment.texcoord[3], fragment.texcoord[3];
TEX R1.w, R1.w, texture[3], 2D;
TEX R0.w, fragment.texcoord[3], texture[4], CUBE;
MUL R0.w, R1, R0;
MUL R1.y, R2, R0.w;
TEX R2.xyz, R1.y, texture[5], 2D;
RSQ R2.w, R1.x;
TEX R1, fragment.texcoord[0], texture[0], 2D;
MUL R1.xyz, R1, R2;
MUL R2.xyz, R2.w, R3;
DP3 R0.x, R0, R2;
TEX R3.xy, fragment.texcoord[0], texture[2], 2D;
MUL R0.y, R3, c[2].w;
MAX R0.x, R0, c[2].z;
POW R2.x, R0.x, R0.y;
MUL R0.xyz, R1, c[0];
MUL R1.x, R2, R3;
MAD R0.xyz, R1.x, c[0], R0;
MUL R0.w, R0, c[2].x;
MUL result.color.xyz, R0, R0.w;
SLT R0.x, R1.w, c[1];
MOV result.color.w, R1;
KIL -R0.x;
END
# 39 instructions, 4 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "POINT_COOKIE" }
Vector 0 [_LightColor0]
Float 1 [_Cutoff]
SetTexture 0 [_MainTex] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_SpecularTex] 2D
SetTexture 3 [_LightTextureB0] 2D
SetTexture 4 [_LightTexture0] CUBE
SetTexture 5 [_RampTex] 2D
"ps_3_0
; 36 ALU, 7 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_cube s4
dcl_2d s5
def c2, 0.00000000, 1.00000000, 2.00000000, -1.00000000
def c3, 128.00000000, 0.50000000, 0, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xyz
texld r0.yw, v0, s1
mad_pp r1.xy, r0.wyzw, c2.z, c2.w
mul_pp r0.w, r1.y, r1.y
mad_pp r0.w, -r1.x, r1.x, -r0
texld r3.xy, v0, s2
dp3_pp r0.x, v1, v1
rsq_pp r0.x, r0.x
mul_pp r2.xyz, r0.x, v1
dp3_pp r0.x, v2, v2
rsq_pp r0.x, r0.x
mad_pp r0.xyz, r0.x, v2, r2
dp3_pp r1.z, r0, r0
rsq_pp r1.z, r1.z
add_pp r0.w, r0, c2.y
mul_pp r0.xyz, r1.z, r0
rsq_pp r0.w, r0.w
rcp_pp r1.z, r0.w
dp3_pp r0.x, r1, r0
max_pp r1.w, r0.x, c2.x
mul_pp r2.w, r3.y, c3.x
pow r0, r1.w, r2.w
dp3_pp r0.z, r1, r2
dp3 r1.x, v3, v3
texld r0.w, v3, s4
texld r1.x, r1.x, s3
mul r0.y, r1.x, r0.w
mad_pp r0.z, r0, c3.y, c3.y
mul_pp r1.x, r0.z, r0.y
texld r2.xyz, r1.x, s5
texld r1, v0, s0
mul_pp r1.xyz, r1, r2
mul r0.z, r0.x, r3.x
mul_pp r1.xyz, r1, c0
add_pp r0.x, r1.w, -c1
mad r1.xyz, r0.z, c0, r1
mul_pp r2.x, r0.y, c2.z
cmp r0.x, r0, c2, c2.y
mov_pp r0, -r0.x
mul oC0.xyz, r1, r2.x
texkill r0.xyzw
mov_pp oC0.w, r1
"
}

SubProgram "gles " {
Keywords { "POINT_COOKIE" }
"!!GLES"
}

SubProgram "glesdesktop " {
Keywords { "POINT_COOKIE" }
"!!GLES"
}

SubProgram "opengl " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Float 1 [_Cutoff]
SetTexture 0 [_MainTex] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_SpecularTex] 2D
SetTexture 3 [_LightTexture0] 2D
SetTexture 4 [_RampTex] 2D
"3.0-!!ARBfp1.0
OPTION ARB_precision_hint_fastest;
# 34 ALU, 5 TEX
PARAM c[4] = { program.local[0..1],
		{ 2, 1, 0, 128 },
		{ 0.5 } };
TEMP R0;
TEMP R1;
TEMP R2;
TEX R0.yw, fragment.texcoord[0], texture[1], 2D;
MAD R0.xy, R0.wyzw, c[2].x, -c[2].y;
MUL R0.z, R0.y, R0.y;
MAD R0.z, -R0.x, R0.x, -R0;
DP3 R0.w, fragment.texcoord[2], fragment.texcoord[2];
ADD R0.z, R0, c[2].y;
RSQ R0.z, R0.z;
RCP R0.z, R0.z;
TEX R2.xy, fragment.texcoord[0], texture[2], 2D;
RSQ R0.w, R0.w;
MOV R1.xyz, fragment.texcoord[1];
MAD R1.xyz, R0.w, fragment.texcoord[2], R1;
DP3 R0.w, R1, R1;
RSQ R0.w, R0.w;
MUL R1.xyz, R0.w, R1;
DP3 R0.w, R0, R1;
DP3 R0.y, R0, fragment.texcoord[1];
MAD R0.z, R0.y, c[3].x, c[3].x;
TEX R1.w, fragment.texcoord[3], texture[3], 2D;
MUL R0.z, R0, R1.w;
TEX R1.xyz, R0.z, texture[4], 2D;
MUL R0.y, R2, c[2].w;
MAX R0.x, R0.w, c[2].z;
POW R2.y, R0.x, R0.y;
TEX R0, fragment.texcoord[0], texture[0], 2D;
MUL R0.xyz, R0, R1;
MUL R1.x, R2.y, R2;
MUL R0.xyz, R0, c[0];
MAD R0.xyz, R1.x, c[0], R0;
MUL R1.y, R1.w, c[2].x;
MUL result.color.xyz, R0, R1.y;
SLT R0.x, R0.w, c[1];
MOV result.color.w, R0;
KIL -R0.x;
END
# 34 instructions, 3 R-regs
"
}

SubProgram "d3d9 " {
Keywords { "DIRECTIONAL_COOKIE" }
Vector 0 [_LightColor0]
Float 1 [_Cutoff]
SetTexture 0 [_MainTex] 2D
SetTexture 1 [_BumpMap] 2D
SetTexture 2 [_SpecularTex] 2D
SetTexture 3 [_LightTexture0] 2D
SetTexture 4 [_RampTex] 2D
"ps_3_0
; 33 ALU, 6 TEX
dcl_2d s0
dcl_2d s1
dcl_2d s2
dcl_2d s3
dcl_2d s4
def c2, 0.00000000, 1.00000000, 2.00000000, -1.00000000
def c3, 128.00000000, 0.50000000, 0, 0
dcl_texcoord0 v0.xy
dcl_texcoord1 v1.xyz
dcl_texcoord2 v2.xyz
dcl_texcoord3 v3.xy
texld r2.xy, v0, s2
texld r1.yw, v0, s1
mad_pp r1.xy, r1.wyzw, c2.z, c2.w
mul_pp r0.w, r1.y, r1.y
mad_pp r0.w, -r1.x, r1.x, -r0
dp3_pp r1.z, v2, v2
add_pp r0.w, r0, c2.y
rsq_pp r1.z, r1.z
mov_pp r0.xyz, v1
mad_pp r0.xyz, r1.z, v2, r0
dp3_pp r1.z, r0, r0
rsq_pp r1.z, r1.z
mul_pp r0.xyz, r1.z, r0
rsq_pp r0.w, r0.w
rcp_pp r1.z, r0.w
dp3_pp r0.x, r1, r0
max_pp r1.w, r0.x, c2.x
mul_pp r2.y, r2, c3.x
pow r0, r1.w, r2.y
dp3_pp r0.y, r1, v1
mov r2.y, r0.x
texld r0.w, v3, s3
mad_pp r0.y, r0, c3, c3
mul_pp r1.x, r0.y, r0.w
texld r0.xyz, r1.x, s4
texld r1, v0, s0
mul_pp r0.xyz, r1, r0
add_pp r1.x, r1.w, -c1
mul r1.y, r2, r2.x
mul_pp r0.xyz, r0, c0
cmp r1.x, r1, c2, c2.y
mov_pp r2, -r1.x
mad r0.xyz, r1.y, c0, r0
mul_pp r0.w, r0, c2.z
mul oC0.xyz, r0, r0.w
texkill r2.xyzw
mov_pp oC0.w, r1
"
}

SubProgram "gles " {
Keywords { "DIRECTIONAL_COOKIE" }
"!!GLES"
}

SubProgram "glesdesktop " {
Keywords { "DIRECTIONAL_COOKIE" }
"!!GLES"
}

}
	}

#LINE 59

    }
    Fallback "Transparent/Cutout/Bumped Specular"
}