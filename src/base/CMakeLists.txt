cmake_minimum_required (VERSION 2.8)

project (base)

file( GLOB_RECURSE SOURCES *.c *.h )

include_directories( 
	${CMAKE_CURRENT_SOURCE_DIR} 
	../ 
)
 
add_library(base ${SOURCES})

IF(MSVC)
set(WIN_LIBS
	gdi32.lib  
	user32.lib  
	ws2_32.lib 
	ole32.lib 
	shell32.lib
)
target_link_libraries ( base ${WIN_LIBS})
ENDIF(MSVC)

find_package(Threads)
target_link_libraries(base
	${CMAKE_THREAD_LIBS_INIT}
)


