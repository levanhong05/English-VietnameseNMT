@echo off

echo building boost for windows

echo setting environment variables;

.\b2 --build-dir=build --prefix=build toolset=msvc-12.0 --build-type=complete --abbreviate-paths architecture=x86 address-model=64 --with-serialization --with-program_options install -j4

