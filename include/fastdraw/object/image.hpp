///////////////////////////////////////////////////////////////////////////////
//
// Copyright 2018 Felipe Magno de Almeida.
// Distributed under the Boost Software License, Version 1.0. (See
// accompanying file LICENSE_1_0.txt or copy at
// http://www.boost.org/LICENSE_1_0.txt)
// See http://www.boost.org/libs/foreach for documentation
//

#ifndef FASTDRAW_OBJECTS_IMAGE_HH
#define FASTDRAW_OBJECTS_IMAGE_HH

#include <fastdraw/point.hpp>

#include <cstdint>
#include <cstddef>

namespace fastdraw { namespace object {

template <typename Point>
struct image
{
  typedef Point point_type;
  point_type pos, size;
  void* buffer;
  std::size_t buffer_size;
  std::size_t width, height;
  std::size_t stride;
};
    
} }

#endif
