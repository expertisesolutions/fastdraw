#version 450
#extension GL_ARB_separate_shader_objects : enable

//layout(location = 0) in vec3 fragColor;
layout(location = 0) in vec2 fragTexCoord;
layout(binding = 1) uniform sampler2D texSampler;

layout(location = 0) out vec4 outColor;

layout(location = 3) in flat vec2 borderxy;

void main() {
  float border_width = 0.001;

  if (fragTexCoord.x == borderxy.r// + border_width
      || fragTexCoord.y == borderxy.g// + border_width
      )
    outColor = vec4(1.0f, 0.0f, 0.0f, 1.0f);
  else
    outColor = texture(texSampler, fragTexCoord);
  //outColor = vec4(1.0f, 0.0f, 0.0f, 1.0f);
  //outColor = vec4(fragTexCoord, 0.0, 1.0);
  //outColor = vec4(1.0f, 0.0f, 0.0f, 1.0f);
}

