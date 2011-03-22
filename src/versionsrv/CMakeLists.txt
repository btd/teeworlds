cmake_minimum_required (VERSION 2.8)

project (versionsrv)

include_directories( 
	${CMAKE_CURRENT_SOURCE_DIR}
	../
	${CMAKE_CURRENT_BINARY_DIR}/base
)

add_subdirectory ( ../base  ${CMAKE_CURRENT_BINARY_DIR}/base )

link_directories ( ${CMAKE_CURRENT_BINARY_DIR}/base )  

add_executable(versionsrv versionsrv.cpp)

target_link_libraries (versionsrv base engine)