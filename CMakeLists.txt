cmake_minimum_required (VERSION 2.6)
project (Game)

#Set bin directory
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

set (VERSION_MAJOR 0)
set (VERSION_MINOR 1)

add_executable(Game src/app.cpp)

execute_process ( COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/download_libs.sh
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/ )

find_package(OpenGL REQUIRED)
message(STATUS "Found OpenGL in ${OPENGL_INCLUDE_DIR}")
include_directories( ${OPENGL_INCLUDE_DIRS} )
target_link_libraries(Game ${OPENGL_LIBRARIES} )


#glfw stuffs
set(GLFW_BUILD_DOCS OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_TESTS OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
add_subdirectory(lib/glfw-3.3)
message(STATUS "Using glfw in lib/glfw-3.3")
target_link_libraries(Game glfw)


add_subdirectory(lib/glew-2.1.0/build/cmake)
message(STATUS "Using glew in lib/glew-2.1.0/build")
target_link_libraries(Game glew)
