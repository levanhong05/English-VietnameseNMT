@echo off

echo building eigen for windows

echo setting environment variables;

set PATH=%PATH%;C:\Program Files (x86)\CMake\bin\

mkdir build

cd build

cmake .. -G "Visual Studio 14 2015"

msbuild /P:Configuration=Debug ALL_BUILD.vcxproj

//copy Debug\OpenNMTTokenizer.* ..\..\..\dist\bin\

exit 0
