cmake_minimum_required (VERSION 2.8)

project (server)

file( GLOB SOURCES *.h *.cpp )

include_directories( 
	${CMAKE_CURRENT_SOURCE_DIR}
	../../
)

add_executable(server ${SOURCES} ${CMAKE_SOURCE_DIR}/other/icons/teeworlds_srv_cl.rc)

target_link_libraries (server base engine game)