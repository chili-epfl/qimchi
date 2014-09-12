TEMPLATE = lib
TARGET = qmlchilitags
QT += qml quick multimedia
CONFIG += qt plugin c++11 console
CONFIG -= android_install

TARGET = $$qtLibraryTarget($$TARGET)
uri = com.chili.chilitags

# Input
SOURCES += \
    chilitags_plugin.cpp \
    chilitagsdetection.cpp \
    transform.cpp \
    chilitagssurface.cpp \
    chilitagsobject.cpp

HEADERS += \
    chilitags_plugin.h \
    chilitagsdetection.h \
    transform.h \
    chilitagssurface.h \
    chilitagsobject.h

OTHER_FILES = qmldir

android {
    #chilitags hpp
    INCLUDEPATH += /home/chili/android-toolchain/sysroot/usr/include/
    #opencv hpp
    INCLUDEPATH += /home/chili/android-toolchain/sysroot/usr/share/opencv/sdk/native/jni/include/
}
android {
    #opencv and chilitags libs
    LIBS += -L/home/chili/android-toolchain/sysroot/usr/share/opencv/sdk/native/libs/armeabi-v7a/ -L/home/chili/android-toolchain/sysroot/usr/lib/
}
LIBS += -lopencv_core -lopencv_imgproc -lopencv_highgui
LIBS += -lchilitags

!equals(_PRO_FILE_PWD_, $$OUT_PWD) {
    copy_qmldir.target = $$OUT_PWD/qmldir
    copy_qmldir.depends = $$_PRO_FILE_PWD_/qmldir
    copy_qmldir.commands = $(COPY_FILE) \"$$replace(copy_qmldir.depends, /, $$QMAKE_DIR_SEP)\" \"$$replace(copy_qmldir.target, /, $$QMAKE_DIR_SEP)\"
    QMAKE_EXTRA_TARGETS += copy_qmldir
    PRE_TARGETDEPS += $$copy_qmldir.target
}

qmldir.files = qmldir
unix {
    installPath = $$[QT_INSTALL_QML]/$$replace(uri, \\., /)
    qmldir.path = $$installPath
    target.path = $$installPath
    INSTALLS += target qmldir
}

