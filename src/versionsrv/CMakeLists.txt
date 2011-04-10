cmake_minimum_required (VERSION 2.8)

project (versionsrv)

include_directories( 
	${CMAKE_CURRENT_SOURCE_DIR}
	../
) 

add_executable(versionsrv versionsrv.cpp)

target_link_libraries (versionsrv base engine)