cmake_minimum_required (VERSION 3.5)
if (POLICY CMP0025)
  # compiler on Mac OS X is now AppleClang
  cmake_policy(SET CMP0025 NEW)
endif ()
if (POLICY CMP0054)
  # if variable behavior
  cmake_policy(SET CMP0054 NEW)
endif()
if (POLICY CMP0068)
  #mac os x rpath effect
  cmake_policy(SET CMP0068 NEW)
endif()

project(cmakeosx  LANGUAGES C CXX)

set(CMAKE_MODULE_PATH
    ${CMAKE_CURRENT_SOURCE_DIR}/cmake
    ${CMAKE_MODULE_PATH})

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

if(CMAKE_CXX_COMPILER_ID STREQUAL "AppleClang")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
endif()

if(UNIX)
    set(CMAKE_POSITION_INDEPENDENT_CODE ON)
endif()

add_library(z SHARED zlib/zlib.h)
add_subdirectory(zlib)

# Set project and C++ Standard properties
set_target_properties(z PROPERTIES
                      PROJECT_LABEL example
                      VERSION 1.0
                      SOVERSION 10
                      ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
                      LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
                      RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
                      CXX_STANDARD 11
                      CXX_STANDARD_REQUIRED YES
)

# OSX Framework specific properties
set_target_properties(z PROPERTIES
      FRAMEWORK TRUE
      FRAMEWORK_VERSION A
      MACOSX_FRAMEWORK_SHORT_VERSION_STRING 1.0
      MACOSX_FRAMEWORK_BUNDLE_VERSION 1.0
      MACOSX_FRAMEWORK_IDENTIFIER org.osgeo.libgdal
      XCODE_ATTRIBUTE_INSTALL_PATH "@rpath"
)
set(CMAKE_MACOSX_RPATH ON)
include(GNUInstallDirs)
install(TARGETS z
        EXPORT zlib-export
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        FRAMEWORK DESTINATION ${CMAKE_INSTALL_LIBDIR}
)

message(STATUS "CMAKE_SYSTEM_NAME: ${CMAKE_SYSTEM_NAME}")
message(STATUS "CMAKE_INSTALL_PREFIX: ${CMAKE_INSTALL_PREFIX}")
message(STATUS "CMAKE_CXX_COMPILER_ID: ${CMAKE_CXX_COMPILER_ID}")

if(NOT CMAKE_CXX_COMPILER_ID STREQUAL "AppleClang")
  message(FATAL_ERROR "Cannot determine compiler!!")
endif()

# vim: ts=4 sw=4 sts=4 et
