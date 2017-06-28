CONFIG += c++11

TEMPLATE = aux

CONFIG -= debug_and_release

unix {
    tokenizer.targets = src/.libs/tokenizer.a
    tokenizer.commands = echo Compiling tokenizer 3rdparty library && cp -rn $$PWD/* . && cd $$OUT_PWD && ./autogen.sh && ./configure --with-pic --with-gnu-ld && make
    tokenizer.depends = Makefile

    QMAKE_CLEAN += src/.libs/tokenizer.a
    QMAKE_EXTRA_TARGETS += tokenizer
    TARGET = tokenizer
}

win32 {
    SOURCEPATH=$$PWD

CONFIG(release, debug|release){
    tokenizer.commands = "$(COPY_DIR) $$replace(SOURCEPATH,/,\\) && call build_release.bat"
    tokenizer.depends = Makefile

    first.targets = build/tokenizer.dll
    first.depends = tokenizer

    QMAKE_CLEAN += build/tokenizer.dll
} else {
    tokenizer.commands = "$(COPY_DIR) $$replace(SOURCEPATH,/,\\) && call build.bat"
    tokenizer.depends = Makefile

    first.targets = build/tokenizer.dll
    first.depends = tokenizer

    QMAKE_CLEAN += build/tokenizer.dll
}
    QMAKE_EXTRA_TARGETS += first tokenizer
    TARGET = tokenizer
}

OTHER_FILES += \
    build.bat \
    build_release.bat
