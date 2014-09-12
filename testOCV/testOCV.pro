TEMPLATE = app

QT += qml quick widgets multimedia

SOURCES += main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

android {
    INCLUDEPATH += /home/chili/android-toolchain/sysroot/usr/share/opencv/sdk/native/jni/include/
}
android {
    LIBS += -L/home/chili/android-toolchain/sysroot/usr/share/opencv/sdk/native/libs/armeabi-v7a/
}
LIBS += -lopencv_core

contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    ANDROID_EXTRA_LIBS = \
        /home/chili/testOCV/../android-toolchain/sysroot/usr/share/opencv/sdk/native/libs/armeabi-v7a/libopencv_core.so \
        /home/chili/testOCV/../android-toolchain/sysroot/usr/share/opencv/sdk/native/libs/armeabi-v7a/libopencv_imgproc.so \
        /home/chili/testOCV/../android-toolchain/sysroot/usr/share/opencv/sdk/native/libs/armeabi-v7a/libopencv_video.so \
        /home/chili/testOCV/../android-toolchain/sysroot/usr/share/opencv/sdk/native/libs/armeabi-v7a/libopencv_flann.so \
        /home/chili/testOCV/../android-toolchain/sysroot/usr/share/opencv/sdk/native/libs/armeabi-v7a/libopencv_highgui.so \
        /home/chili/testOCV/../android-toolchain/sysroot/usr/share/opencv/sdk/native/libs/armeabi-v7a/libopencv_features2d.so \
        /home/chili/testOCV/../android-toolchain/sysroot/usr/share/opencv/sdk/native/libs/armeabi-v7a/libopencv_info.so \
        /home/chili/testOCV/../android-toolchain/sysroot/usr/share/opencv/sdk/native/libs/armeabi-v7a/libopencv_calib3d.so \
        /home/chili/testOCV/../android-toolchain/sysroot/usr/share/opencv/sdk/native/libs/armeabi-v7a/libopencv_java.so \
        /home/chili/testOCV/../Qt5/5.3/android_armv7/qml/com/chili/ocvcameraqml/libOCVCamera.so \
        /home/chili/testOCV/../android-toolchain/sysroot/usr/share/opencv/sdk/native/libs/armeabi-v7a/libnative_camera_r4.3.0.so \
        /home/chili/testOCV/../Qt5/5.3/android_armv7/lib/libQt5Multimedia.so \
        /home/chili/testOCV/../android-toolchain/sysroot/usr/lib/libchilitags_jni_bindings.so \
        /home/chili/testOCV/../android-toolchain/sysroot/usr/lib/libchilitags.so \
        $$PWD/../Qt5/5.3/android_armv7/qml/com/chili/chilitags/libqmlchilitags.so
}
