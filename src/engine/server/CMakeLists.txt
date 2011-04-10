cmake_minimum_required (VERSION 2.8)

project (server)

file( GLOB SOURCES *.h *.cpp )

include_directories( 
	${CMAKE_CURRENT_SOURCE_DIR}
	../../
)

if(MSVC)
list(APPEND SOURCES ${CMAKE_SOURCE_DIR}/other/icons/teeworlds_srv_cl.rc)
endif()


add_executable(server ${SOURCES})

target_link_libraries (server base engine game)