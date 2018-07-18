cmake_minimum_required(VERSION 2.8)

project(cassie_dynamics_library)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -ggdb -Wall -Wno-unused-variable -Wno-unused-value -O3 -pipe -Wparentheses -Wreturn-type -Wcast-qual -Wall -Wpointer-arith -Wwrite-strings -Wconversion -Wno-unknown-pragmas -Wno-long-long -fopenmp  -DIPOPT_BUILD -std=c++11 -lpthread")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -ggdb -Wall -Wno-unused-variable -Wno-unused-value -O3 -pipe -Wparentheses -Wreturn-type -Wcast-qual -Wall -Wpointer-arith -Wwrite-strings -Wconversion -Wno-unknown-pragmas -Wno-long-long -fopenmp  -DIPOPT_BUILD -std=c++11 -lpthread")
set(CMAKE_INSTALL_PREFIX "../")


include_directories(${CMAKE_SOURCE_DIR}/include)
file(GLOB_RECURSE SOURCES RELATIVE ${CMAKE_SOURCE_DIR}  "src/*.cc")

message("The source files included in the library are: " ${SOURCES} )

add_library(cassie_dynamics STATIC ${SOURCES})

install(TARGETS cassie_dynamics DESTINATION lib)
