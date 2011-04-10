cmake_minimum_required (VERSION 2.8)

project (mastersrv)

include_directories( 
	${CMAKE_CURRENT_SOURCE_DIR}
	../
)

add_executable(mastersrv mastersrv.cpp)

target_link_libraries (mastersrv base engine)