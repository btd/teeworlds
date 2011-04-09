cmake_minimum_required (VERSION 2.8)

project (client)

file( GLOB SOURCES *.h *.cpp )

find_package(Freetype QUIET)

if( (NOT ${FREETYPE_FOUND}) AND MSVC )
set( FREETYPE_DIR ${client_SOURCE_DIR}/../../freetype )
set( FREETYPE_LIBRARIES ${FREETYPE_DIR}/lib/freetype.lib )
set( FREETYPE_INCLUDE_DIRS ${FREETYPE_DIR}/include/ )
set( FREETYPE_LINK_DIRECTORIES ${FREETYPE_DIR}/lib )
endif( (NOT ${FREETYPE_FOUND}) AND MSVC )

find_package(SDL QUIET)

if( (NOT ${SDL_FOUND}) AND MSVC )
set( SDL_DIR ${client_SOURCE_DIR}/../../sdl )
set( SDL_LIBRARY ${SDL_DIR}/vc2005libs/SDLmain.lib ${SDL_DIR}/vc2005libs/SDL.lib )
set( SDL_INCLUDE_DIR ${SDL_DIR}/include/ )
set( SDL_LINK_DIRECTORIES ${SDL_DIR}/lib )
endif( (NOT ${SDL_FOUND}) AND MSVC )

find_package(OpenGL REQUIRED)

link_directories ( 
	${FREETYPE_LINK_DIRECTORIES} 
	${SDL_LINK_DIRECTORIES} 
)

add_subdirectory ( ../../wavpack ${CMAKE_CURRENT_BINARY_DIR}/wavpack )

include_directories( 
	${CMAKE_CURRENT_SOURCE_DIR}
	../../
	../../pnglite/
	../../wavpack/
	${FREETYPE_INCLUDE_DIRS} 
	${SDL_INCLUDE_DIR}
	${OPENGL_INCLUDE_DIR}
)

add_executable(client ${SOURCES} ${CMAKE_SOURCE_DIR}/other/icons/teeworlds_cl.rc )

target_link_libraries (client 
	base 
	engine 
	game 
	pnglite 
	wavpack 
	${FREETYPE_LIBRARIES}
	${SDL_LIBRARY}
	${OPENGL_LIBRARIES}
)



