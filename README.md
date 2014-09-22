Qimchi
=======

Qimchi is a QML based framework for CHILI lab's projects in augmented reality
and robotics.

Content
--------

The global QtCreator project references the following modules:

* qmlchilitags: integration of [Chilitags](https://github.com/chili-epfl/chilitags)
  in QML
* qmlchilitags-demo: demonstration of how to use qmlchilitags for "regular" AR,
  i.e. displaying virtual element on a camera feed
* qmlchilitags-projection: demonstration of how to use qmlchilitags in a
  camera+projector setting

How to build with CMake
-----------------------

You need at least CMake 2.8.11 in addition to `chilitags`, `opencv_core` and
`opencv_imgproc` installed on your system. This build was tested on Ubuntu
14.04 with CMake 2.8.12.2 and Qt 5.3.1. Run:

```
export CMAKE_PREFIX_PATH=/path/to/qt5/installation
mkdir build
cd build
cmake ..
make -j 5
make install
```

If you have Qt installed in your usual system paths, the build might work
without the `export` step. The above will:

  - Build the chilitags QML plugin and put the necessary files under
`import/Chilitags/`

  - Build `chilitags-demo` and put it under `chilitags-demo/`

Instead of this, `chilitags` and `chilitags-demo` can be built and installed
individually by going inside their respective directories and repeating the
above commands.

Documentation
-------------

Qimchi requires Qt 5, and is developped using Qt Creator.
It has been tested with Qt 5.3 on Ubuntu 14.04, and would probably not work
with lower than 5.3 due to
https://bugreports.qt-project.org/browse/QTBUG-34736?page=com.atlassian.jira.plugin.system.issuetabpanels:all-tabpanel.
For more details, each module contains a specific README.

License
-------
Qimchi is licensed under the GPLv3 License
