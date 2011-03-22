cmake_minimum_required (VERSION 2.8)

project (tools)

add_executable(tools crapnet.cpp)
add_executable(tools dilate.c)
add_executable(tools fake_server.cpp)
add_executable(tools map_resave.cpp)
add_executable(tools packetgen.c)
add_executable(tools tileset_borderfix.c)

target_link_libraries (tools base)
target_link_libraries (tools engine)