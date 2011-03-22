cmake_minimum_required (VERSION 2.8)

project (pnglite)

set(SOURCES
	pnglite.c
)

include_directories( ${CMAKE_CURRENT_SOURCE_DIR} )

add_library(pnglite ${SOURCES})