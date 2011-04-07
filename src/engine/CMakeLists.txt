cmake_minimum_required (VERSION 2.8)

project (engine)

file( GLOB SHARED_ENGINE_SOURCES *.h *.cpp shared/*.h shared/*.cpp )


add_subdirectory ( client )
add_subdirectory ( server )

include_directories( 
	${CMAKE_CURRENT_SOURCE_DIR}
	../
	../zlib
	../pnglite
	${CMAKE_CURRENT_BINARY_DIR}/zlib
	${CMAKE_CURRENT_BINARY_DIR}/game

)

add_subdirectory ( ../zlib ${CMAKE_CURRENT_BINARY_DIR}/zlib )
add_subdirectory ( ../game ${CMAKE_CURRENT_BINARY_DIR}/game )
add_subdirectory ( ../pnglite ${CMAKE_CURRENT_BINARY_DIR}/pnglite )

add_library(engine 
	${SHARED_ENGINE_SOURCES}
)

target_link_libraries (engine base game zlib pnglite)