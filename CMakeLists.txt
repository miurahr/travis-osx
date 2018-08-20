cmake_minimum_required (VERSION 3.5)
if (POLICY CMP0025)
    cmake_policy(SET CMP0025 NEW)
endif ()
if (POLICY CMP0054)
    cmake_policy(SET CMP0054 NEW)
endif()
if (POLICY CMP0058)
	# Ninja requires custom command byproducts to be explicit
	cmake_policy(SET CMP0058 NEW)
endif()
if (POLICY CMP0068)
    #mac os x rpath effect
    cmake_policy(SET CMP0068 NEW)
endif()
if (POLICY CMP0069)
    # INTERPROCEDURAL_OPTIMIZATION
    cmake_policy(SET CMP0069 NEW)
endif()
if (POLICY CMP0070)
    # file(GENERATE)
    cmake_policy(SET CMP0070 NEW)
endif()
if (POLICY CMP0073)
    # _LIB_DEPENDS
    cmake_policy(SET CMP0073 NEW)
endif()
if (POLICY CMP0074)
    # Packagename_ROOT
    cmake_policy(SET CMP0074 NEW)
endif()
if (POLICY CMP0075)
    cmake_policy(SET CMP0075 NEW)
endif()

project(travis-osx C CXX)

set(CMAKE_MODULE_PATH
    ${CMAKE_CURRENT_SOURCE_DIR}/cmake
    ${CMAKE_MODULE_PATH})
include(cotire)

set(CMAKE_CONFIGURATION_TYPES "Debug;Release" CACHE STRING "Configs" FORCE)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

if(CMAKE_COMPILER_IS_GNUCXX)
    execute_process(COMMAND ${CMAKE_C_COMPILER} -dumpversion OUTPUT_VARIABLE GCC_VERSION)
    if (GCC_VERSION VERSION_GREATER 5.1 OR GCC_VERSION VERSION_EQUAL 5.1)
        message(STATUS "GNU C++ 5.1 or later detected. It uses C++11 New ABI.")
        set(GNUCXX_NEW_ABI true)
    endif()
endif()
if(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    add_compile_options(-Wno-unused-command-line-argument)
endif()
if(CMAKE_CXX_COMPILER_ID STREQUAL "AppleClang")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
endif()

if(UNIX)
    add_definitions(-D_FORTIFY_SOURCE)
    set(CMAKE_POSITION_INDEPENDENT_CODE ON)
endif()

add_executable(example example.c)

# vim: ts=4 sw=4 sts=4 et
