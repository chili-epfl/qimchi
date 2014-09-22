cmake_minimum_required(VERSION 2.8.11)

project(chilitagsplugin)

set(CMAKE_INCLUDE_CURRENT_DIR ON)			#So that we can find the moc generated sources
set(CMAKE_AUTOMOC ON)						#Runs moc automatically
set(CMAKE_INSTALL_RPATH_USE_LINK_PATH ON)	#Otherwise installed executables/libs can't find Qt libs that are not in system runtime paths

find_package(Qt5Quick REQUIRED)
find_package(Qt5Qml REQUIRED)
find_package(Qt5Multimedia REQUIRED)
find_package(OpenCV REQUIRED)
message(STATUS "OpenCV version: ${OpenCV_VERSION}")

if(${OpenCV_VERSION} VERSION_GREATER 2.9.0)
    add_definitions(-DOPENCV3)
endif()

include_directories(${Qt5Quick_INCLUDES})
include_directories(${Qt5Qml_INCLUDES})
include_directories(${Qt5Multimedia_INCLUDES})
include_directories(${OpenCV_INCLUDE_DIRS})

add_definitions(-std=c++11)
add_definitions(${Qt5Quick_DEFINITIONS})
add_definitions(${Qt5Qml_DEFINITIONS})
add_definitions(${Qt5Multimedia_DEFINITIONS})

set(CMAKE_CXX_FLAGS "${Qt5Quick_EXECUTABLE_COMPILE_FLAGS} ${Qt5Qml_EXECUTABLE_COMPILE_FLAGS} ${Qt5Multimedia_EXECUTABLE_COMPILE_FLAGS}")

add_library(chilitagsplugin SHARED chilitagsplugin.cpp chilitagsdetection.cpp chilitagssurface.cpp chilitagsobject.cpp transform.cpp)
target_link_libraries(chilitagsplugin Qt5::Quick Qt5::Qml Qt5::Multimedia opencv_core opencv_imgproc chilitags)

INSTALL(FILES qmldir DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/../imports/Chilitags/)
INSTALL(TARGETS chilitagsplugin LIBRARY DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/../imports/Chilitags/)

