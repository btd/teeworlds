cmake_minimum_required (VERSION 2.8)

project (pnglite)

set(SOURCES
	pnglite.c
)

include_directories( 
	${CMAKE_CURRENT_SOURCE_DIR}
	${zlib_SOURCE_DIR}
	${zlib_BINARY_DIR}
)

add_library(pnglite ${SOURCES})

target_link_libraries(pnglite zlib)