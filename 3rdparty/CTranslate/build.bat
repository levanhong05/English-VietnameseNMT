@echo off

echo building ctranslate for windows

echo setting environment variables;

set PATH=%PATH%;C:\Program Files (x86)\CMake\bin\

mkdir build

cd build

cmake cmake .. -G "Visual Studio 14 2015"

make

//copy log4cpp\x64\Debug\log4cpp.* ..\..\..\dist\bin\

exit 0
