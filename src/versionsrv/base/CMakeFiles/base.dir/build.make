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
include src/versionsrv/base/CMakeFiles/base.dir/depend.make

# Include the progress variables for this target.
include src/versionsrv/base/CMakeFiles/base.dir/progress.make

# Include the compile flags for this target's objects.
include src/versionsrv/base/CMakeFiles/base.dir/flags.make

src/versionsrv/base/CMakeFiles/base.dir/system.c.o: src/versionsrv/base/CMakeFiles/base.dir/flags.make
src/versionsrv/base/CMakeFiles/base.dir/system.c.o: src/base/system.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/den/Desktop/teeworlds/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/versionsrv/base/CMakeFiles/base.dir/system.c.o"
	cd /home/den/Desktop/teeworlds/src/versionsrv/base && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/base.dir/system.c.o   -c /home/den/Desktop/teeworlds/src/base/system.c

src/versionsrv/base/CMakeFiles/base.dir/system.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/base.dir/system.c.i"
	cd /home/den/Desktop/teeworlds/src/versionsrv/base && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/den/Desktop/teeworlds/src/base/system.c > CMakeFiles/base.dir/system.c.i

src/versionsrv/base/CMakeFiles/base.dir/system.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/base.dir/system.c.s"
	cd /home/den/Desktop/teeworlds/src/versionsrv/base && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/den/Desktop/teeworlds/src/base/system.c -o CMakeFiles/base.dir/system.c.s

src/versionsrv/base/CMakeFiles/base.dir/system.c.o.requires:
.PHONY : src/versionsrv/base/CMakeFiles/base.dir/system.c.o.requires

src/versionsrv/base/CMakeFiles/base.dir/system.c.o.provides: src/versionsrv/base/CMakeFiles/base.dir/system.c.o.requires
	$(MAKE) -f src/versionsrv/base/CMakeFiles/base.dir/build.make src/versionsrv/base/CMakeFiles/base.dir/system.c.o.provides.build
.PHONY : src/versionsrv/base/CMakeFiles/base.dir/system.c.o.provides

src/versionsrv/base/CMakeFiles/base.dir/system.c.o.provides.build: src/versionsrv/base/CMakeFiles/base.dir/system.c.o
.PHONY : src/versionsrv/base/CMakeFiles/base.dir/system.c.o.provides.build

# Object files for target base
base_OBJECTS = \
"CMakeFiles/base.dir/system.c.o"

# External object files for target base
base_EXTERNAL_OBJECTS =

src/versionsrv/base/libbase.a: src/versionsrv/base/CMakeFiles/base.dir/system.c.o
src/versionsrv/base/libbase.a: src/versionsrv/base/CMakeFiles/base.dir/build.make
src/versionsrv/base/libbase.a: src/versionsrv/base/CMakeFiles/base.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C static library libbase.a"
	cd /home/den/Desktop/teeworlds/src/versionsrv/base && $(CMAKE_COMMAND) -P CMakeFiles/base.dir/cmake_clean_target.cmake
	cd /home/den/Desktop/teeworlds/src/versionsrv/base && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/base.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/versionsrv/base/CMakeFiles/base.dir/build: src/versionsrv/base/libbase.a
.PHONY : src/versionsrv/base/CMakeFiles/base.dir/build

src/versionsrv/base/CMakeFiles/base.dir/requires: src/versionsrv/base/CMakeFiles/base.dir/system.c.o.requires
.PHONY : src/versionsrv/base/CMakeFiles/base.dir/requires

src/versionsrv/base/CMakeFiles/base.dir/clean:
	cd /home/den/Desktop/teeworlds/src/versionsrv/base && $(CMAKE_COMMAND) -P CMakeFiles/base.dir/cmake_clean.cmake
.PHONY : src/versionsrv/base/CMakeFiles/base.dir/clean

src/versionsrv/base/CMakeFiles/base.dir/depend:
	cd /home/den/Desktop/teeworlds && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/den/Desktop/teeworlds /home/den/Desktop/teeworlds/src/base /home/den/Desktop/teeworlds /home/den/Desktop/teeworlds/src/versionsrv/base /home/den/Desktop/teeworlds/src/versionsrv/base/CMakeFiles/base.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/versionsrv/base/CMakeFiles/base.dir/depend

