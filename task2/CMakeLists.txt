cmake_minimum_required(VERSION 3)

project(task2)

set(CMAKE_CXX_STANDARD 11)
add_custom_command(OUTPUT ${PROJECT_SOURCE_DIR}/A/index.h 
                  COMMAND python3 ${PROJECT_SOURCE_DIR}/A/preparing.py 
                  WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/A
)

add_custom_target(exec ALL
                DEPENDS ${PROJECT_SOURCE_DIR}/A/index.h
)

include_directories(${PROJECT_SOURCE_DIR})

file(MAKE_DIRECTORY ${PROJECT_SOURCE_DIR}/bin)
file(MAKE_DIRECTORY ${PROJECT_SOURCE_DIR}/lib)

set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)

add_library(libs
            A/index.h
            B/lib.cpp
            B/lib.h
)
        

add_executable(main C/main.cpp)
target_link_libraries(main libs)

enable_testing()

find_package(GTest REQUIRED)
set(GGTEST ${googletest_SOURCE_DIR})
include_directories(${GGTEST}/include ${GGTEST})

add_executable(CTest C/main_test.cpp)

target_link_libraries(CTest gtest gtest_main -pthread)
gtest_discover_tests(CTest)

