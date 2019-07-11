cmake_minimum_required(VERSION 3.10)

# -- create my variables --
# --    myProjectName
# --    myProjDir
# --    myPWD

# the build dir is entered when running cmake,
# therefore, myPWD is /home/..../build
set(myPWD $ENV{PWD})
message("my build directory is -> ${myPWD}")

# strip /build
set(myProjDir ${myPWD})
string(REPLACE "/build" ""
  myProjDir
  ${myProjDir})
message("my sources and includes are in -> ${myProjDir}")

# strip preceeding /home/ME/
string(SUBSTRING "${myProjDir}" 10 -1 myProjectName)
# change all "/" to "_"
string(REPLACE "/" "_"
  myProjectName
  ${myProjectName})
message("this project is named -> ${myProjectName}")



set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_compile_options(-Wall -Wextra -Wpedantic -g)

project("${myProjectName}")

# cmake will parse these files as the build system
# set(PROJECT_SOURCE_DIR "/home/sov/CS/AlgoDS/skiplist")
set(PROJECT_SOURCE_DIR "${myProjDir}")

# cmake will output its build system here
# set(PROJECT_BINARY_DIR "/home/sov/CS/AlgoDS/skiplist/build")
set(PROJECT_BINARY_DIR "${myPWD}")

# my own structure variables
# set(Proj_Top_Dir "/home/sov/CS/AlgoDS/skiplist")
# set(Sources_Directory "${Proj_Top_Dir}")
# set(Include_Directory "${Proj_Top_Dir}")
set(Sources_Directory "${myProjDir}")
set(Include_Directory "${myProjDir}")

# I'm expecting these to be placed in ${PROJECT_BINARY_DIR}
add_executable(g++Exe "")
add_executable(clangExe "")

# TODO: actually get both g++ and clang compiled binaries
# clang
target_include_directories(clangExe PUBLIC
	PUBLIC ${Include_Directory}
)
target_sources(clangExe PRIVATE
	${Sources_Directory}/main.cpp
	${Sources_Directory}/queue.cpp
	${Sources_Directory}/skiplist.cpp
)

# g++
target_include_directories(g++Exe PUBLIC
	PUBLIC ${Include_Directory}
)
target_sources(g++Exe PRIVATE
	${Sources_Directory}/main.cpp
	${Sources_Directory}/queue.cpp
	${Sources_Directory}/skiplist.cpp
)

set_property(TARGET g++Exe PROPERTY CXX_STANDARD 11)
set_property(TARGET clangExe PROPERTY CXX_STANDARD 11)
