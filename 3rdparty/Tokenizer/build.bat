@echo off

echo building log4cpp for windows

echo setting environment variables;

set PATH=%PATH%;C:\Program Files (x86)\CMake\bin\

mkdir build

cd build

cmake -DCMAKE_BUILD_TYPE=Debug ..

make

copy log4cpp\x64\Debug\log4cpp.* ..\..\..\dist\bin\

exit 0
