# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canoncical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/den/Desktop/teeworlds

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/den/Desktop/teeworlds

# Include any dependencies generated for this target.
include src/engine/client/wavpack/CMakeFiles/wavpack.dir/depend.make

# Include the progress variables for this target.
include src/engine/client/wavpack/CMakeFiles/wavpack.dir/progress.make

# Include the compile flags for this target's objects.
include src/engine/client/wavpack/CMakeFiles/wavpack.dir/flags.make

src/engine/client/wavpack/CMakeFiles/wavpack.dir/bits.c.o: src/engine/client/wavpack/CMakeFiles/wavpack.dir/flags.make
src/engine/client/wavpack/CMakeFiles/wavpack.dir/bits.c.o: src/wavpack/bits.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/den/Desktop/teeworlds/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/engine/client/wavpack/CMakeFiles/wavpack.dir/bits.c.o"
	cd /home/den/Desktop/teeworlds/src/engine/client/wavpack && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/wavpack.dir/bits.c.o   -c /home/den/Desktop/teeworlds/src/wavpack/bits.c

src/engine/client/wavpack/CMakeFiles/wavpack.dir/bits.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/wavpack.dir/bits.c.i"
	cd /home/den/Desktop/teeworlds/src/engine/client/wavpack && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/den/Desktop/teeworlds/src/wavpack/bits.c > CMakeFiles/wavpack.dir/bits.c.i

src/engine/client/wavpack/CMakeFiles/wavpack.dir/bits.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/wavpack.dir/bits.c.s"
	cd /home/den/Desktop/teeworlds/src/engine/client/wavpack && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/den/Desktop/teeworlds/src/wavpack/bits.c -o CMakeFiles/wavpack.dir/bits.c.s

src/engine/client/wavpack/CMakeFiles/wavpack.dir/bits.c.o.requires:
.PHONY : src/engine/client/wavpack/CMakeFiles/wavpack.dir/bits.c.o.requires

src/engine/client/wavpack/CMakeFiles/wavpack.dir/bits.c.o.provides: src/engine/client/wavpack/CMakeFiles/wavpack.dir/bits.c.o.requires
	$(MAKE) -f src/engine/client/wavpack/CMakeFiles/wavpack.dir/build.make src/engine/client/wavpack/CMakeFiles/wavpack.dir/bits.c.o.provides.build
.PHONY : src/engine/client/wavpack/CMakeFiles/wavpack.dir/bits.c.o.provides

src/engine/client/wavpack/CMakeFiles/wavpack.dir/bits.c.o.provides.build: src/engine/client/wavpack/CMakeFiles/wavpack.dir/bits.c.o
.PHONY : src/engine/client/wavpack/CMakeFiles/wavpack.dir/bits.c.o.provides.build

src/engine/client/wavpack/CMakeFiles/wavpack.dir/float.c.o: src/engine/client/wavpack/CMakeFiles/wavpack.dir/flags.make
src/engine/client/wavpack/CMakeFiles/wavpack.dir/float.c.o: src/wavpack/float.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/den/Desktop/teeworlds/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/engine/client/wavpack/CMakeFiles/wavpack.dir/float.c.o"
	cd /home/den/Desktop/teeworlds/src/engine/client/wavpack && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/wavpack.dir/float.c.o   -c /home/den/Desktop/teeworlds/src/wavpack/float.c

src/engine/client/wavpack/CMakeFiles/wavpack.dir/float.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/wavpack.dir/float.c.i"
	cd /home/den/Desktop/teeworlds/src/engine/client/wavpack && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/den/Desktop/teeworlds/src/wavpack/float.c > CMakeFiles/wavpack.dir/float.c.i

src/engine/client/wavpack/CMakeFiles/wavpack.dir/float.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/wavpack.dir/float.c.s"
	cd /home/den/Desktop/teeworlds/src/engine/client/wavpack && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/den/Desktop/teeworlds/src/wavpack/float.c -o CMakeFiles/wavpack.dir/float.c.s

src/engine/client/wavpack/CMakeFiles/wavpack.dir/float.c.o.requires:
.PHONY : src/engine/client/wavpack/CMakeFiles/wavpack.dir/float.c.o.requires

src/engine/client/wavpack/CMakeFiles/wavpack.dir/float.c.o.provides: src/engine/client/wavpack/CMakeFiles/wavpack.dir/float.c.o.requires
	$(MAKE) -f src/engine/client/wavpack/CMakeFiles/wavpack.dir/build.make src/engine/client/wavpack/CMakeFiles/wavpack.dir/float.c.o.provides.build
.PHONY : src/engine/client/wavpack/CMakeFiles/wavpack.dir/float.c.o.provides

src/engine/client/wavpack/CMakeFiles/wavpack.dir/float.c.o.provides.build: src/engine/client/wavpack/CMakeFiles/wavpack.dir/float.c.o
.PHONY : src/engine/client/wavpack/CMakeFiles/wavpack.dir/float.c.o.provides.build

src/engine/client/wavpack/CMakeFiles/wavpack.dir/metadata.c.o: src/engine/client/wavpack/CMakeFiles/wavpack.dir/flags.make
src/engine/client/wavpack/CMakeFiles/wavpack.dir/metadata.c.o: src/wavpack/metadata.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/den/Desktop/teeworlds/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/engine/client/wavpack/CMakeFiles/wavpack.dir/metadata.c.o"
	cd /home/den/Desktop/teeworlds/src/engine/client/wavpack && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/wavpack.dir/metadata.c.o   -c /home/den/Desktop/teeworlds/src/wavpack/metadata.c

src/engine/client/wavpack/CMakeFiles/wavpack.dir/metadata.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/wavpack.dir/metadata.c.i"
	cd /home/den/Desktop/teeworlds/src/engine/client/wavpack && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/den/Desktop/teeworlds/src/wavpack/metadata.c > CMakeFiles/wavpack.dir/metadata.c.i

src/engine/client/wavpack/CMakeFiles/wavpack.dir/metadata.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/wavpack.dir/metadata.c.s"
	cd /home/den/Desktop/teeworlds/src/engine/client/wavpack && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/den/Desktop/teeworlds/src/wavpack/metadata.c -o CMakeFiles/wavpack.dir/metadata.c.s

src/engine/client/wavpack/CMakeFiles/wavpack.dir/metadata.c.o.requires:
.PHONY : src/engine/client/wavpack/CMakeFiles/wavpack.dir/metadata.c.o.requires

src/engine/client/wavpack/CMakeFiles/wavpack.dir/metadata.c.o.provides: src/engine/client/wavpack/CMakeFiles/wavpack.dir/metadata.c.o.requires
	$(MAKE) -f src/engine/client/wavpack/CMakeFiles/wavpack.dir/build.make src/engine/client/wavpack/CMakeFiles/wavpack.dir/metadata.c.o.provides.build
.PHONY : src/engine/client/wavpack/CMakeFiles/wavpack.dir/metadata.c.o.provides

src/engine/client/wavpack/CMakeFiles/wavpack.dir/metadata.c.o.provides.build: src/engine/client/wavpack/CMakeFiles/wavpack.dir/metadata.c.o
.PHONY : src/engine/client/wavpack/CMakeFiles/wavpack.dir/metadata.c.o.provides.build

src/engine/client/wavpack/CMakeFiles/wavpack.dir/unpack.c.o: src/engine/client/wavpack/CMakeFiles/wavpack.dir/flags.make
src/engine/client/wavpack/CMakeFiles/wavpack.dir/unpack.c.o: src/wavpack/unpack.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/den/Desktop/teeworlds/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/engine/client/wavpack/CMakeFiles/wavpack.dir/unpack.c.o"
	cd /home/den/Desktop/teeworlds/src/engine/client/wavpack && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/wavpack.dir/unpack.c.o   -c /home/den/Desktop/teeworlds/src/wavpack/unpack.c

src/engine/client/wavpack/CMakeFiles/wavpack.dir/unpack.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/wavpack.dir/unpack.c.i"
	cd /home/den/Desktop/teeworlds/src/engine/client/wavpack && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/den/Desktop/teeworlds/src/wavpack/unpack.c > CMakeFiles/wavpack.dir/unpack.c.i

src/engine/client/wavpack/CMakeFiles/wavpack.dir/unpack.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/wavpack.dir/unpack.c.s"
	cd /home/den/Desktop/teeworlds/src/engine/client/wavpack && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/den/Desktop/teeworlds/src/wavpack/unpack.c -o CMakeFiles/wavpack.dir/unpack.c.s

src/engine/client/wavpack/CMakeFiles/wavpack.dir/unpack.c.o.requires:
.PHONY : src/engine/client/wavpack/CMakeFiles/wavpack.dir/unpack.c.o.requires

src/engine/client/wavpack/CMakeFiles/wavpack.dir/unpack.c.o.provides: src/engine/client/wavpack/CMakeFiles/wavpack.dir/unpack.c.o.requires
	$(MAKE) -f src/engine/client/wavpack/CMakeFiles/wavpack.dir/build.make src/engine/client/wavpack/CMakeFiles/wavpack.dir/unpack.c.o.provides.build
.PHONY : src/engine/client/wavpack/CMakeFiles/wavpack.dir/unpack.c.o.provides

src/engine/client/wavpack/CMakeFiles/wavpack.dir/unpack.c.o.provides.build: src/engine/client/wavpack/CMakeFiles/wavpack.dir/unpack.c.o
.PHONY : src/engine/client/wavpack/CMakeFiles/wavpack.dir/unpack.c.o.provides.build

src/engine/client/wavpack/CMakeFiles/wavpack.dir/words.c.o: src/engine/client/wavpack/CMakeFiles/wavpack.dir/flags.make
src/engine/client/wavpack/CMakeFiles/wavpack.dir/words.c.o: src/wavpack/words.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/den/Desktop/teeworlds/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/engine/client/wavpack/CMakeFiles/wavpack.dir/words.c.o"
	cd /home/den/Desktop/teeworlds/src/engine/client/wavpack && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/wavpack.dir/words.c.o   -c /home/den/Desktop/teeworlds/src/wavpack/words.c

src/engine/client/wavpack/CMakeFiles/wavpack.dir/words.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/wavpack.dir/words.c.i"
	cd /home/den/Desktop/teeworlds/src/engine/client/wavpack && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/den/Desktop/teeworlds/src/wavpack/words.c > CMakeFiles/wavpack.dir/words.c.i

src/engine/client/wavpack/CMakeFiles/wavpack.dir/words.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/wavpack.dir/words.c.s"
	cd /home/den/Desktop/teeworlds/src/engine/client/wavpack && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/den/Desktop/teeworlds/src/wavpack/words.c -o CMakeFiles/wavpack.dir/words.c.s

src/engine/client/wavpack/CMakeFiles/wavpack.dir/words.c.o.requires:
.PHONY : src/engine/client/wavpack/CMakeFiles/wavpack.dir/words.c.o.requires

src/engine/client/wavpack/CMakeFiles/wavpack.dir/words.c.o.provides: src/engine/client/wavpack/CMakeFiles/wavpack.dir/words.c.o.requires
	$(MAKE) -f src/engine/client/wavpack/CMakeFiles/wavpack.dir/build.make src/engine/client/wavpack/CMakeFiles/wavpack.dir/words.c.o.provides.build
.PHONY : src/engine/client/wavpack/CMakeFiles/wavpack.dir/words.c.o.provides

src/engine/client/wavpack/CMakeFiles/wavpack.dir/words.c.o.provides.build: src/engine/client/wavpack/CMakeFiles/wavpack.dir/words.c.o
.PHONY : src/engine/client/wavpack/CMakeFiles/wavpack.dir/words.c.o.provides.build

src/engine/client/wavpack/CMakeFiles/wavpack.dir/wputils.c.o: src/engine/client/wavpack/CMakeFiles/wavpack.dir/flags.make
src/engine/client/wavpack/CMakeFiles/wavpack.dir/wputils.c.o: src/wavpack/wputils.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/den/Desktop/teeworlds/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/engine/client/wavpack/CMakeFiles/wavpack.dir/wputils.c.o"
	cd /home/den/Desktop/teeworlds/src/engine/client/wavpack && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/wavpack.dir/wputils.c.o   -c /home/den/Desktop/teeworlds/src/wavpack/wputils.c

src/engine/client/wavpack/CMakeFiles/wavpack.dir/wputils.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/wavpack.dir/wputils.c.i"
	cd /home/den/Desktop/teeworlds/src/engine/client/wavpack && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/den/Desktop/teeworlds/src/wavpack/wputils.c > CMakeFiles/wavpack.dir/wputils.c.i

src/engine/client/wavpack/CMakeFiles/wavpack.dir/wputils.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/wavpack.dir/wputils.c.s"
	cd /home/den/Desktop/teeworlds/src/engine/client/wavpack && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/den/Desktop/teeworlds/src/wavpack/wputils.c -o CMakeFiles/wavpack.dir/wputils.c.s

src/engine/client/wavpack/CMakeFiles/wavpack.dir/wputils.c.o.requires:
.PHONY : src/engine/client/wavpack/CMakeFiles/wavpack.dir/wputils.c.o.requires

src/engine/client/wavpack/CMakeFiles/wavpack.dir/wputils.c.o.provides: src/engine/client/wavpack/CMakeFiles/wavpack.dir/wputils.c.o.requires
	$(MAKE) -f src/engine/client/wavpack/CMakeFiles/wavpack.dir/build.make src/engine/client/wavpack/CMakeFiles/wavpack.dir/wputils.c.o.provides.build
.PHONY : src/engine/client/wavpack/CMakeFiles/wavpack.dir/wputils.c.o.provides

src/engine/client/wavpack/CMakeFiles/wavpack.dir/wputils.c.o.provides.build: src/engine/client/wavpack/CMakeFiles/wavpack.dir/wputils.c.o
.PHONY : src/engine/client/wavpack/CMakeFiles/wavpack.dir/wputils.c.o.provides.build

# Object files for target wavpack
wavpack_OBJECTS = \
"CMakeFiles/wavpack.dir/bits.c.o" \
"CMakeFiles/wavpack.dir/float.c.o" \
"CMakeFiles/wavpack.dir/metadata.c.o" \
"CMakeFiles/wavpack.dir/unpack.c.o" \
"CMakeFiles/wavpack.dir/words.c.o" \
"CMakeFiles/wavpack.dir/wputils.c.o"

# External object files for target wavpack
wavpack_EXTERNAL_OBJECTS =

src/engine/client/wavpack/libwavpack.a: src/engine/client/wavpack/CMakeFiles/wavpack.dir/bits.c.o
src/engine/client/wavpack/libwavpack.a: src/engine/client/wavpack/CMakeFiles/wavpack.dir/float.c.o
src/engine/client/wavpack/libwavpack.a: src/engine/client/wavpack/CMakeFiles/wavpack.dir/metadata.c.o
src/engine/client/wavpack/libwavpack.a: src/engine/client/wavpack/CMakeFiles/wavpack.dir/unpack.c.o
src/engine/client/wavpack/libwavpack.a: src/engine/client/wavpack/CMakeFiles/wavpack.dir/words.c.o
src/engine/client/wavpack/libwavpack.a: src/engine/client/wavpack/CMakeFiles/wavpack.dir/wputils.c.o
src/engine/client/wavpack/libwavpack.a: src/engine/client/wavpack/CMakeFiles/wavpack.dir/build.make
src/engine/client/wavpack/libwavpack.a: src/engine/client/wavpack/CMakeFiles/wavpack.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C static library libwavpack.a"
	cd /home/den/Desktop/teeworlds/src/engine/client/wavpack && $(CMAKE_COMMAND) -P CMakeFiles/wavpack.dir/cmake_clean_target.cmake
	cd /home/den/Desktop/teeworlds/src/engine/client/wavpack && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/wavpack.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/engine/client/wavpack/CMakeFiles/wavpack.dir/build: src/engine/client/wavpack/libwavpack.a
.PHONY : src/engine/client/wavpack/CMakeFiles/wavpack.dir/build

src/engine/client/wavpack/CMakeFiles/wavpack.dir/requires: src/engine/client/wavpack/CMakeFiles/wavpack.dir/bits.c.o.requires
src/engine/client/wavpack/CMakeFiles/wavpack.dir/requires: src/engine/client/wavpack/CMakeFiles/wavpack.dir/float.c.o.requires
src/engine/client/wavpack/CMakeFiles/wavpack.dir/requires: src/engine/client/wavpack/CMakeFiles/wavpack.dir/metadata.c.o.requires
src/engine/client/wavpack/CMakeFiles/wavpack.dir/requires: src/engine/client/wavpack/CMakeFiles/wavpack.dir/unpack.c.o.requires
src/engine/client/wavpack/CMakeFiles/wavpack.dir/requires: src/engine/client/wavpack/CMakeFiles/wavpack.dir/words.c.o.requires
src/engine/client/wavpack/CMakeFiles/wavpack.dir/requires: src/engine/client/wavpack/CMakeFiles/wavpack.dir/wputils.c.o.requires
.PHONY : src/engine/client/wavpack/CMakeFiles/wavpack.dir/requires

src/engine/client/wavpack/CMakeFiles/wavpack.dir/clean:
	cd /home/den/Desktop/teeworlds/src/engine/client/wavpack && $(CMAKE_COMMAND) -P CMakeFiles/wavpack.dir/cmake_clean.cmake
.PHONY : src/engine/client/wavpack/CMakeFiles/wavpack.dir/clean

src/engine/client/wavpack/CMakeFiles/wavpack.dir/depend:
	cd /home/den/Desktop/teeworlds && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/den/Desktop/teeworlds /home/den/Desktop/teeworlds/src/wavpack /home/den/Desktop/teeworlds /home/den/Desktop/teeworlds/src/engine/client/wavpack /home/den/Desktop/teeworlds/src/engine/client/wavpack/CMakeFiles/wavpack.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/engine/client/wavpack/CMakeFiles/wavpack.dir/depend

