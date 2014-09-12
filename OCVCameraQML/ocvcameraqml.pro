TEMPLATE = lib
TARGET = OCVCamera
QT += qml quick multimedia
CONFIG += qt plugin console c++11
CONFIG -= android_install

TARGET = $$qtLibraryTarget($$TARGET)
uri = com.chili.ocvcameraqml

# Input
SOURCES += \
    ocvcameraqml_plugin.cpp \
    ocvcamera.cpp

HEADERS += \
    ocvcameraqml_plugin.h \
    ocvcamera.h

OTHER_FILES = qmldir

android {
    #This path contains opencv hpp
    INCLUDEPATH += /home/chili/android-toolchain/sysroot/usr/share/opencv/sdk/native/jni/include/
}
android {
    # opencv libs
    LIBS += -L/home/chili/android-toolchain/sysroot/usr/share/opencv/sdk/native/libs/armeabi-v7a/
}

    LIBS += -lopencv_core -lopencv_imgproc -lopencv_highgui



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

