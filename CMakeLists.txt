cmake_minimum_required(VERSION 2.8)
set (CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR})

# infer path for Torch7
string (REGEX REPLACE "(.*)lib/luarocks/rocks.*" "\\1" TORCH_PREFIX "${CMAKE_INSTALL_PREFIX}" )
message (STATUS "Found Torch7, installed in: " ${TORCH_PREFIX})

find_package (Torch REQUIRED)
find_package (Matlab REQUIRED)

SET(CMAKE_CXX_FLAGS "-DMATLAB_FOUND")
MESSAGE(STATUS "Using Matlab datastructs")

SET(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)

INCLUDE_DIRECTORIES (${MATLAB_INCLUDE_DIR} ${TORCH_INCLUDE_DIR} ${PROJECT_SOURCE_DIR} ${PROJECT_SOURCE_DIR}/generic)
MESSAGE(STATUS "matlab include: " ${MATLAB_INCLUDE_DIR})
MESSAGE(STATUS "project include: " ${PROJECT_SOURCE_DIR})
MESSAGE(STATUS "cmake module: " ${CMAKE_MODULE_PATH})
add_library(celiu SHARED celiu.cpp)

link_directories (${TORCH_LIBRARY_DIR})
target_link_libraries(celiu ${TORCH_LIBRARIES} ${MATLAB_LIBRARIES})
install_files(/lua/opticalflow init.lua)
install_files(/lua/opticalflow img1.jpg)
install_files(/lua/opticalflow img2.jpg)

install_targets(/lib celiu)

