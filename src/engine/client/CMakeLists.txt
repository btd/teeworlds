cmake_minimum_required (VERSION 2.8)

project (client)

set(SOURCES
	client.cpp
	graphics.cpp
	friends.cpp
	input.cpp
	sound.cpp
	serverbrowser.cpp
	text.cpp
)

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
	${SDL_LIB} 
	${FREETYPE_LIB}
	${WIN_GL_LIBS}
)