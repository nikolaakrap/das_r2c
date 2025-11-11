# generated from ament/cmake/core/templates/nameConfig.cmake.in

# prevent multiple inclusion
if(_das_r2c_CONFIG_INCLUDED)
  # ensure to keep the found flag the same
  if(NOT DEFINED das_r2c_FOUND)
    # explicitly set it to FALSE, otherwise CMake will set it to TRUE
    set(das_r2c_FOUND FALSE)
  elseif(NOT das_r2c_FOUND)
    # use separate condition to avoid uninitialized variable warning
    set(das_r2c_FOUND FALSE)
  endif()
  return()
endif()
set(_das_r2c_CONFIG_INCLUDED TRUE)

# output package information
if(NOT das_r2c_FIND_QUIETLY)
  message(STATUS "Found das_r2c: 0.0.0 (${das_r2c_DIR})")
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "Package 'das_r2c' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  # optionally quiet the deprecation message
  if(NOT ${das_r2c_DEPRECATED_QUIET})
    message(DEPRECATION "${_msg}")
  endif()
endif()

# flag package as ament-based to distinguish it after being find_package()-ed
set(das_r2c_FOUND_AMENT_PACKAGE TRUE)

# include all config extra files
set(_extras "")
foreach(_extra ${_extras})
  include("${das_r2c_DIR}/${_extra}")
endforeach()
