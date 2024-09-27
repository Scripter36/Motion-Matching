cmake_minimum_required(VERSION 3.10)

project(controller CXX)

set(BUILD_EXAMPLES OFF)
add_subdirectory(vendors/raylib)

file(GLOB_RECURSE SOURCE_FILES src/*.cpp)
file(GLOB_RECURSE HEADER_FILES src/*.h)
file(COPY resources DESTINATION ${CMAKE_CURRENT_BINARY_DIR})

set(CMAKE_CXX_COMPILER g++)
set(EXT ".exe")

if(${CMAKE_BUILD_TYPE} STREQUAL "RELEASE")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -ffast-math -march=native -D NDEBUG -O3 -D _DEFAULT_SOURCE")
else()
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -D _DEFAULT_SOURCE")
endif()

add_executable(controller ${SOURCE_FILES})
link_directories(vendors/raylib/src)

target_link_libraries(controller raylib)
target_include_directories(controller PRIVATE vendors/raylib/src)
target_include_directories(controller PRIVATE vendors/raygui/src)