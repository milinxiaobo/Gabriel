cmake_minimum_required(VERSION 3.10)

project(nils VERSION 1.0 LANGUAGES CUDA CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

add_executable(nils main.cu)

target_include_directories(nils PUBLIC "${PROJECT_BINARY_DIR}")
message("${PROJECT_BINARY_DIR}")
message("${PROJECT_SOURCE_DIR}")
target_include_directories(nils PUBLIC "${PROJECT_SOURCE_DIR}/cutlass/include")
