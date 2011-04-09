cmake_minimum_required (VERSION 2.8)

project (game)

file( GLOB SHARED_GAME_SOURCES *.h *.cpp )
file( GLOB_RECURSE CLIENT_GAME_SOURCES client/*.h client/*.cpp )
file( GLOB_RECURSE SERVER_GAME_SOURCES server/*.h server/*.cpp )
file( GLOB_RECURSE EDITOR_GAME_SOURCES editor/*.h editor/*.cpp )

set( PYTHON C:/Python27/pythonw.exe )
set( NETWORK_SOURCE ${game_SOURCE_DIR}/generated/protocol.cpp )
set( NETWORK_HEADER ${game_SOURCE_DIR}/generated/protocol.h )
set( CLIENT_CONTENT_SOURCE ${game_SOURCE_DIR}/generated/client_data.cpp )
set( CLIENT_CONTENT_HEADER ${game_SOURCE_DIR}/generated/client_data.h )
set( SERVER_CONTENT_SOURCE ${game_SOURCE_DIR}/generated/server_data.cpp)
set( SERVER_CONTENT_HEADER ${game_SOURCE_DIR}/generated/server_data.h )

set (GENERATED_CONTENT
	${NETWORK_HEADER}
	${NETWORK_SOURCE}
	${CLIENT_CONTENT_SOURCE}
	${CLIENT_CONTENT_HEADER}
	${SERVER_CONTENT_SOURCE}
	${SERVER_CONTENT_HEADER}
)

include_directories( 
	${CMAKE_CURRENT_SOURCE_DIR}
	../
)

add_custom_command (
  OUTPUT  ${NETWORK_HEADER}
  COMMAND ${PYTHON} ${CMAKE_SOURCE_DIR}/datasrc/compile.py network_header > ${NETWORK_HEADER}
)

add_custom_command (
  OUTPUT  ${NETWORK_SOURCE}
  COMMAND ${PYTHON} ${CMAKE_SOURCE_DIR}/datasrc/compile.py network_source > ${NETWORK_SOURCE}
)

add_custom_command (
  OUTPUT  ${CLIENT_CONTENT_SOURCE}
  COMMAND ${PYTHON} ${CMAKE_SOURCE_DIR}/datasrc/compile.py client_content_source > ${CLIENT_CONTENT_SOURCE}
)

add_custom_command (
  OUTPUT  ${CLIENT_CONTENT_HEADER}
  COMMAND ${PYTHON} ${CMAKE_SOURCE_DIR}/datasrc/compile.py client_content_header > ${CLIENT_CONTENT_HEADER}
)

add_custom_command (
  OUTPUT  ${SERVER_CONTENT_SOURCE}
  COMMAND ${PYTHON} ${CMAKE_SOURCE_DIR}/datasrc/compile.py server_content_source > ${SERVER_CONTENT_SOURCE}
)

add_custom_command (
  OUTPUT  ${SERVER_CONTENT_HEADER}
  COMMAND ${PYTHON} ${CMAKE_SOURCE_DIR}/datasrc/compile.py server_content_header > ${SERVER_CONTENT_HEADER}
)


add_library(game 
	${SHARED_GAME_SOURCES} 
	${CLIENT_GAME_SOURCES} 
	${SERVER_GAME_SOURCES} 
	${EDITOR_GAME_SOURCES}
	${GENERATED_CONTENT} 
)

target_link_libraries (game base engine)