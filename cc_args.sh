#!sh
cd build;
CXX='cc_args.py g++' cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=Yes -DCMAKE_BUILD_TYPE=DEBUG ..;
make
