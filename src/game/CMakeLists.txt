cmake_minimum_required (VERSION 2.8)

project (game)

set(SOURCES
	collision.cpp
	gamecore.cpp
	layers.cpp
	localization.cpp
	server/entity.cpp
	server/eventhandler.cpp
	server/gamecontext.cpp
	server/gamecontroller.cpp
	server/gameworld.cpp
	server/player.cpp
	server/entities/character.cpp
	server/entities/flag.cpp
	server/entities/laser.cpp
	server/entities/pickup.cpp
	server/entities/projectile.cpp
	server/gamemodes/ctf.cpp
	server/gamemodes/dm.cpp
	server/gamemodes/mod.cpp
	server/gamemodes/tdm.cpp
)


include_directories( 
	${CMAKE_CURRENT_SOURCE_DIR}
	../
#	${CMAKE_CURRENT_BINARY_DIR}/base
)

#add_subdirectory ( ../base  ${CMAKE_CURRENT_BINARY_DIR}/base )

#link_directories ( ${CMAKE_CURRENT_BINARY_DIR}/base )  

add_library(game ${SOURCES})

target_link_libraries (game base engine)