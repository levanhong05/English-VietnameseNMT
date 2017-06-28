@echo off

echo building log4cpp for windows

echo setting environment variables;

set PATH=%PATH%;C:\Program Files (x86)\CMake\bin\

mkdir build

cd build

cmake .. -G "Visual Studio 14 2015" -DLIB_ONLY=ON -DBoost_INCLUDE_DIR=../../boost/build/include/boost-1_64

msbuild /P:Configuration=Release ALL_BUILD.vcxproj

//copy Release\OpenNMTTokenizer.* ..\..\..\dist\bin\

exit 0
