cmake_minimum_required(VERSION 3)

project(B)

set(SOURCE_LIB lib.cpp)

add_library(lib SHARED ${SOURCE_LIB})
