///////////////////////////////////////////////////////////////////////////////
//
// Copyright 2019 Felipe Magno de Almeida.
// Distributed under the Boost Software License, Version 1.0. (See
// accompanying file LICENSE_1_0.txt or copy at
// http://www.boost.org/LICENSE_1_0.txt)
// See http://www.boost.org/libs/foreach for documentation
//

#ifndef FASTDRAW_OUTPUT_VULKAN_OUTPUT_INFO_HPP
#define FASTDRAW_OUTPUT_VULKAN_OUTPUT_INFO_HPP

#include <vector>
#include <iostream>

#include <vulkan/vulkan_core.h>

#include <fastdraw/output/vulkan/shader_loader.hpp>

namespace fastdraw { namespace output { namespace vulkan {

template <typename WindowingBase>
struct vulkan_output_info : WindowingBase
{
  // VkQueue graphics_queue, present_queue;
  VkShaderModule vertShaderModule, fragShaderModule;
  VkFormat swapChainImageFormat;
  VkExtent2D swapChainExtent;
  VkDevice device;
  VkPhysicalDevice physical_device;
  VkRenderPass renderpass;
  VkCommandPool command_pool;
  vulkan::shader_loader* shader_loader;
  int dpi = 96;
};


} } }
 

#endif
