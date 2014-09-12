TEMPLATE = lib
TARGET = pgrcameraqml
QT += qml quick
CONFIG += qt plugin

TARGET = $$qtLibraryTarget($$TARGET)
uri = com.chili.pgrcameraqml

# Input
SOURCES += \
    pgrcameraqml_plugin.cpp \
    pgrcamera.cpp \
    cameraloop.cpp

HEADERS += \
    pgrcameraqml_plugin.h \
    pgrcamera.h \
    cameraloop.h

OTHER_FILES = qmldir

INCLUDEPATH += /usr/include/flycapture
LIBS += -L/usr/lib/ -lflycapture

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

