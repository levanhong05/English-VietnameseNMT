@echo off

echo building tokenizer for windows

echo setting environment variables;

set PATH=%PATH%;C:\Program Files (x86)\CMake\bin\

mkdir build

cd build

cmake .. -G "Visual Studio 14 2015" -DBUILD_SHARED_LIBS=OFF -DBoost_INCLUDE_DIR=../../boost/build/include/boost-1_64

msbuild /P:Configuration=Debug ALL_BUILD.vcxproj

copy Debug\OpenNMTTokenizer.* ..\..\..\dist\bin\

exit 0
