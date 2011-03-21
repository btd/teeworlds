cmake_minimum_required (VERSION 2.8)

project (wavpack C)

set(SOURCES
	bits.c
	float.c
	metadata.c
	unpack.c
	words.c
	wputils.c
)

include_directories( ${CMAKE_CURRENT_SOURCE_DIR} )

add_library(wavpack ${SOURCES})