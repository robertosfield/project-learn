cmake_minimum_required(VERSION 3.7)

project(Myfirstexample
        VERSION 0.0.0
        DESCRIPTION "Template of how to create a program using VulkanSceneGraph and CMake"
        LANGUAGES CXX
)

# build all examples into the bin directory
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/bin)

# Change the default build type to Release
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release CACHE STRING "Choose the type of build, options are: None Debug Release RelWithDebInfo MinSizeRel." FORCE)
endif(NOT CMAKE_BUILD_TYPE)

find_package(vsg 1.0.0 REQUIRED)
find_package(vsgXchange 1.0.0 REQUIRED)

# set the use of C++17 globally as all examples require it
set(CMAKE_CXX_STANDARD 17)

# add clobber build target to clear all the non git registered files/directories
add_custom_target(clobber
    COMMAND git clean -d -f -x
)

set(SOURCES
    src/main.cpp
)

add_executable(myfirstexample ${SOURCES})

target_link_libraries(myfirstexample vsg::vsg vsgXchange::vsgXchange)

install(TARGETS myfirstexample
        RUNTIME DESTINATION bin
)

