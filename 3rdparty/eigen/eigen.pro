CONFIG += c++11

TEMPLATE = aux

CONFIG -= debug_and_release

unix {
    eigen.targets = src/.libs/eigen.a
    eigen.commands = echo Compiling eigen 3rdparty library && cp -rn $$PWD/* . && cd $$OUT_PWD && ./autogen.sh && ./configure --with-pic --with-gnu-ld && make
    eigen.depends = Makefile

    QMAKE_CLEAN += src/.libs/eigen.a
    QMAKE_EXTRA_TARGETS += eigen
    TARGET = eigen
}

win32 {
    SOURCEPATH=$$PWD

CONFIG(release, debug|release){
    eigen.commands = "$(COPY_DIR) $$replace(SOURCEPATH,/,\\) && call build_release.bat"
    eigen.depends = Makefile

    first.targets = build/eigen.dll
    first.depends = eigen

    QMAKE_CLEAN += build/eigen.dll
} else {
    eigen.commands = "$(COPY_DIR) $$replace(SOURCEPATH,/,\\) && call build.bat"
    eigen.depends = Makefile

    first.targets = build/eigen.dll
    first.depends = eigen

    QMAKE_CLEAN += build/eigen.dll
}
    QMAKE_EXTRA_TARGETS += first eigen
    TARGET = eigen
}

OTHER_FILES += \
    build.bat \
    build_release.bat

