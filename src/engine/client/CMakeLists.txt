cmake_minimum_required (VERSION 2.8)

project (client)

file( GLOB SOURCES *.h *.cpp )

IF(MSVC)
set(SDL_DIR 
	${client_SOURCE_DIR}/../../sdl 
)

set(FREETYPE_DIR 
	${client_SOURCE_DIR}/../../freetype
)

set(FREETYPE_LIB
	${FREETYPE_DIR}/lib/freetype.lib
)

set(SDL_LIB 
	${SDL_DIR}/vc2005libs/SDLmain.lib
	${SDL_DIR}/vc2005libs/SDL.lib
)


set(WIN_GL_LIBS
		opengl32.lib
		glu32.lib
		winmm.lib
)
link_directories ( ${SDL_DIR}/vc2005libs ${FREETYPE_DIR}/lib )
ENDIF(MSVC)

add_subdirectory ( ../../wavpack ${CMAKE_CURRENT_BINARY_DIR}/wavpack )



include_directories( 
	${CMAKE_CURRENT_SOURCE_DIR}
	../../
	../../pnglite/
	../../wavpack/
	${SDL_DIR}/include/
	${FREETYPE_DIR}/include/
)

add_executable(client ${SOURCES} )

target_link_libraries (client 
	base 
	engine 
	game 
	pnglite 
	wavpack 
)

IF(MSVC)
target_link_libraries (client 
	${WIN_GL_LIBS} 	
	${SDL_LIB} 
	${FREETYPE_LIB}
)
ENDIF(MSVC)