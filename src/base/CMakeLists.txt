cmake_minimum_required (VERSION 2.8)

project (base)

set(SOURCES
	system.c
)

include_directories( ${CMAKE_CURRENT_SOURCE_DIR} )
 
add_library(base ${SOURCES})
