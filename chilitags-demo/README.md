Demonstration of Augmented Reality with QMLChilitags
====================================================

This demo shows how to add graphical elements linked to tags appearing on a
camera image.

The demo is contained in the main.qml file, which serves as documentation with
its comments.

The other files simply come from the "New sub-project/Qt Quick application"
wizard from Qt Creator, except for this line add into main.cpp:
```
    engine.addImportPath("../imports");
```

How to build with CMake
-----------------------

You need at least CMake 2.8.11 and `chilitagsplugin` (in the `../chilitags/`
directory) installed into `../import/`. This build was tested on Ubuntu 14.04
with CMake 2.8.12.2 and Qt 5.3.1. Run:

```
export CMAKE_PREFIX_PATH=/path/to/qt5/installation
mkdir build
cd build
cmake ..
make -j 5
make install
```

If you have Qt installed in your usual system paths, the build might work
without the `export` step. The above will build the demo and place it in the
original directory, i.e `chilitags-demo/`.

