#version 450
#extension GL_ARB_separate_shader_objects : enable

const int tex_max_size = 4096;
const int screen_width = 1280;
const int screen_height = 1000;

layout(location = 0) out vec2 fragTexCoord;
layout(location = 2) out flat uint InstanceID;

vec2 texcoord[6]
=
  {
      {0.0f,  0.0f}
   ,  {1.0f,  0.0f}
   ,  {1.0f,  1.0f}
   ,  {1.0f,  1.0f}
   ,  {0.0f,  1.0f}
   ,  {0.0f,  0.0f}
  };

struct image_info
{
  uint ii_zindex;
  uint ii_x, ii_y, ii_w, ii_h;
  uint alpha_compositing;
  uint found_alpha;
  uint padding;
  //uint cover_bitset[tex_max_size/32];
};
layout  (std430, set = 2, binding = 0) readonly buffer image_infos
{
  image_info ii[];
};
layout  (std430, set = 2, binding = 1) readonly buffer image_zindex
{
  uint zindex_image[];
};
layout (std430, set = 2, binding = 2) readonly buffer indirect_draw
{
  uint vertex_count;
  uint instance_count;
  uint first_vertex;
  uint first_instance;

  uint image_length;
  uint fragment_data_length;
  uint buffers_to_draw [tex_max_size];
  uint fg_zindex[tex_max_size];
};

float scale (uint v, uint size)
{
  return float(v)/float(size-1)*2 - 1.0f;
}  

void main()
{
  uint zindex = fg_zindex[gl_InstanceIndex];

  uint x = ii[zindex].ii_x;
  uint y = ii[zindex].ii_y;
  uint w = ii[zindex].ii_w;
  uint h = ii[zindex].ii_h;
  uint x2 = x + w-1;
  uint y2 = x + h-1;
  float scaled_x1 = scale (x, screen_width);
  float scaled_y1 = scale (y, screen_height);
  float scaled_x2 = scale (x + w, screen_width);
  float scaled_y2 = scale (y + h, screen_height);
  
  vec4 positions[6] =
    {
       {scaled_x1, scaled_y1, 0.0f, 1.0f}
     , {scaled_x2, scaled_y1, 0.0f, 1.0f}
     , {scaled_x2, scaled_y2, 0.0f, 1.0f}
     , {scaled_x2, scaled_y2, 0.0f, 1.0f}
     , {scaled_x1, scaled_y2, 0.0f, 1.0f}
     , {scaled_x1, scaled_y1, 0.0f, 1.0f}
    };
  uint vid = gl_VertexIndex;
  gl_Position = positions[vid];
  fragTexCoord = texcoord[vid];
  if (gl_VertexIndex == 0)
    InstanceID = gl_InstanceIndex;
}
