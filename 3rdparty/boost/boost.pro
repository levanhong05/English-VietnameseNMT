TEMPLATE = aux

CONFIG -= debug_and_release

unix {
    boost.targets = lib/.libs/boost.a
    boost.commands = "echo Compiling boost 3rdparty library && rm Makefile && cp -rn $$PWD/* $$OUT_PWD && chmod -R 777 $$OUT_PWD && ./bootstrap.sh --prefix=build && ./b2 --with-serialization --with-program_options install"
    boost.depends = Makefile
#./b2 --with-serialization link=static install

    QMAKE_CLEAN += lib/.libs/boost.a
    QMAKE_EXTRA_TARGETS += boost

    TARGET = boost
}

win32 {
    SOURCEPATH=$$PWD
    DESTPATH=$$OUT_PWD
    boost.targets = build/lib/boost.dll
    boost.commands = (robocopy /e /xn "$$replace(SOURCEPATH,/,\\)" "$$replace(DESTPATH,/,\\)") ^& IF %ERRORLEVEL% LEQ 4 cd $$replace(DESTPATH,/,\\) && call bootstrap.bat && call build.bat
    boost.depends = Makefile

    SOURCEPATH1=$$OUT_PWD/build/lib/*.dll
    DESTPATH1=$$OUT_PWD/../../dist/bin
    builds.commands = $(COPY) $$replace(SOURCEPATH1,/,\\) $$replace(DESTPATH1,/,\\)

    first.depends = boost builds

    export(first.depends)
    export(builds.commands)

    QMAKE_EXTRA_TARGETS += first boost builds
}

OTHER_FILES += \
            bootstrap.bat \
            build.bat


