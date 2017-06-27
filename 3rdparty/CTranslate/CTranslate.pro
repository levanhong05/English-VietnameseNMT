TEMPLATE = aux

CONFIG -= debug_and_release

unix {
    ctranslate.targets = src/.libs/ctranslate.a
    #ctranslate.commands = echo Compiling ctranslate 3rdparty library && cp -rn $$PWD/* . && cd $$OUT_PWD && ./autogen.sh && ./configure --with-pic --with-gnu-ld && make
    ctranslate.depends = Makefile

    QMAKE_CLEAN += src/.libs/ctranslate.a
    QMAKE_EXTRA_TARGETS += ctranslate
    TARGET = ctranslate
}

win32 {
    SOURCEPATH=$$PWD

    ctranslate.commands = "$(COPY_DIR) $$replace(SOURCEPATH,/,\\) && call build.bat"
    ctranslate.depends = Makefile

    first.targets = build/ctranslate.dll
    first.depends = ctranslate

    QMAKE_CLEAN += build/ctranslate.dll
    QMAKE_EXTRA_TARGETS += first ctranslate
    TARGET = ctranslate
}

OTHER_FILES += \
    build.bat
