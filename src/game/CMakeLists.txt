cmake_minimum_required (VERSION 2.8)

project (game)

set(SOURCES
	collision.cpp
	gamecore.cpp
	layers.cpp
	localization.cpp
	client/animstate.cpp
	client/gameclient.cpp
	client/lineinput.cpp
	client/render.cpp
	client/render_map.cpp
	client/ui.cpp
	client/components/binds.cpp
	client/components/broadcast.cpp
	client/components/camera.cpp
	client/components/chat.cpp
	client/components/console.cpp
	client/components/controls.cpp
	client/components/damageind.cpp
	client/components/debughud.cpp
	client/components/effects.cpp
	client/components/emoticon.cpp
	client/components/flow.cpp
	client/components/hud.cpp
	client/components/items.cpp
	client/components/killmessages.cpp
	client/components/mapimages.cpp
	client/components/maplayers.cpp
	client/components/menus.cpp
	client/components/menus_browser.cpp
	client/components/menus_demo.cpp
	client/components/menus_ingame.cpp
	client/components/menus_settings.cpp
	client/components/motd.cpp
	client/components/nameplates.cpp
	client/components/particles.cpp
	client/components/players.cpp
	client/components/scoreboard.cpp
	client/components/skins.cpp
	client/components/sounds.cpp
	client/components/voting.cpp
	editor/ed_editor.cpp
	editor/ed_io.cpp
	editor/ed_layer_game.cpp
	editor/ed_layer_quads.cpp
	editor/ed_layer_tiles.cpp
	editor/ed_popups.cpp
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
  COMMAND ${PYTHON} ${game_SOURCE_DIR}/generated/compile.py network_header > ${NETWORK_HEADER}
)

add_custom_command (
  OUTPUT  ${NETWORK_SOURCE}
  COMMAND ${PYTHON} ${game_SOURCE_DIR}/generated/compile.py network_source > ${NETWORK_SOURCE}
)

add_custom_command (
  OUTPUT  ${CLIENT_CONTENT_SOURCE}
  COMMAND ${PYTHON} ${game_SOURCE_DIR}/generated/compile.py client_content_source > ${CLIENT_CONTENT_SOURCE}
)

add_custom_command (
  OUTPUT  ${CLIENT_CONTENT_HEADER}
  COMMAND ${PYTHON} ${game_SOURCE_DIR}/generated/compile.py client_content_header > ${CLIENT_CONTENT_HEADER}
)

add_custom_command (
  OUTPUT  ${SERVER_CONTENT_SOURCE}
  COMMAND ${PYTHON} ${game_SOURCE_DIR}/generated/compile.py server_content_source > ${SERVER_CONTENT_SOURCE}
)

add_custom_command (
  OUTPUT  ${SERVER_CONTENT_HEADER}
  COMMAND ${PYTHON} ${game_SOURCE_DIR}/generated/compile.py server_content_header > ${SERVER_CONTENT_HEADER}
)


add_library(game ${SOURCES} ${GENERATED_CONTENT} )

target_link_libraries (game base engine)