cmake_minimum_required (VERSION 2.8)

project (server)

set(SOURCES
	server.cpp
	register.cpp
)

include_directories( 
	${CMAKE_CURRENT_SOURCE_DIR}
	../../
	${CMAKE_CURRENT_BINARY_DIR}/game
)

add_subdirectory ( ../../game  ${CMAKE_CURRENT_BINARY_DIR}/game )

link_directories ( ${CMAKE_CURRENT_BINARY_DIR}/game )  

add_executable(server ${SOURCES} )

target_link_libraries (server base engine game)