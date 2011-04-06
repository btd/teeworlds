cmake_minimum_required (VERSION 2.8)

project (engine)

set(SOURCES
	shared/compression.cpp
	shared/config.cpp
	shared/console.cpp
	shared/datafile.cpp
	shared/demo.cpp
	shared/engine.cpp
	shared/huffman.cpp
	shared/jobs.cpp
	shared/kernel.cpp
	shared/linereader.cpp
	shared/map.cpp
	shared/masterserver.cpp
	shared/mapchecker.cpp
	shared/memheap.cpp
	shared/network.cpp
	shared/network_client.cpp
	shared/network_conn.cpp
	shared/network_server.cpp
	shared/packer.cpp
	shared/ringbuffer.cpp
	shared/snapshot.cpp
	shared/storage.cpp
)

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

add_library(engine ${SOURCES})

target_link_libraries (engine base game zlib pnglite)