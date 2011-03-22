cmake_minimum_required (VERSION 2.8)

project (base)

set(SOURCES
	system.c
)

include_directories( 
	${CMAKE_CURRENT_SOURCE_DIR} 
	../ 
)
 
add_library(base ${SOURCES})

target_link_libraries ( base gdi32.lib  user32.lib  ws2_32.lib ole32.lib shell32.lib )
