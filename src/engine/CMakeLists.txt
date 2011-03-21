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

add_subdirectory ( external/zlib )
add_subdirectory ( external/pnglite )
add_subdirectory ( external/wavpack )

# add_subdirectory ( client )
# add_subdirectory ( server )

include_directories( ${CMAKE_CURRENT_SOURCE_DIR} )

add_library(engine ${SOURCES})