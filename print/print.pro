TEMPLATE = lib
CONFIG += plugin
QT += qml quick printsupport

DESTDIR = ../imports/Print
TARGET = $$qtLibraryTarget(printplugin)

HEADERS += \
    printplugin.h \
    imageprinter.h

SOURCES += \
    printplugin.cpp \
    imageprinter.cpp

target.path=$$DESTPATH
qmldir.files=$$PWD/qmldir
qmldir.path=$$DESTPATH
INSTALLS += target qmldir

OTHER_FILES += \
    qmldir

# Copy the qmldir file to the same folder as the plugin binary
QMAKE_POST_LINK += $$QMAKE_COPY $$replace($$list($$quote($$PWD/qmldir) $$DESTDIR), /, $$QMAKE_DIR_SEP)
