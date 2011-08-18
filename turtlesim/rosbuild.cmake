if (WIN32)
  return()
endif()

include(${CMAKE_CURRENT_BINARY_DIR}/package.cmake)

# Set the build type.  Options are:
#  Coverage       : w/ debug symbols, w/o optimization, w/ code-coverage
#  Debug          : w/ debug symbols, w/o optimization
#  Release        : w/o debug symbols, w/ optimization
#  RelWithDebInfo : w/ debug symbols, w/ optimization
#  MinSizeRel     : w/o debug symbols, w/ optimization, stripped binaries
#set(ROS_BUILD_TYPE RelWithDebInfo)
#set the default path for built executables to the "bin" directory
#set the default path for built libraries to the "lib" directory
find_package(wxWidgets)
if (NOT wxWidgets_FOUND)
  return()
  message(STATUS "disabling build of turtlesim... wxwidgets not found")
endif()

include(${wxWidgets_USE_FILE})
include_directories(${wxWidgets_INCLUDE_DIRS})
rosbuild_add_boost_directories()
rosbuild_add_executable(turtlesim_node src/turtlesim.cpp src/turtle.cpp src/turtle_frame.cpp)
rosbuild_link_boost(turtlesim_node thread)
target_link_libraries(turtlesim_node ${wxWidgets_LIBRARIES})
rosbuild_add_executable(turtle_teleop_key tutorials/teleop_turtle_key.cpp)
rosbuild_add_executable(draw_square tutorials/draw_square.cpp)
rosbuild_add_executable(mimic tutorials/mimic.cpp)

