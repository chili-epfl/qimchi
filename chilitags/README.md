QML plugin for Chilitags
========================

This plugin exposes Chilitags to QML applications.

For now, it exposes 3 QML objects:

* ChilitagsDetection: takes a video stream as `source` and can itself be used as
  a source to forward the video stream (e.g. to a VideoOutput). The videoframes
  are intercepted to detect Chilitags, which are stored in a `tags` property.
  It also exposes a projectionMatrix property computed from the camera matrix
  used to estimate the 3d position of the tags.

* ChilitagsObject: placed as a child of a ChilitagsDetection, it reads a `name` 
  property corresponding to the identifier of the 3D objects detected by
  Chilitags, i.e. tags or aggregates of tags. A ChilitagsObject takes care of
  updating its `transform` property with the 4x4 matrix estimated by the parent
  ChilitagsDetection, and a `visible` boolean property corresponding to whether
  the tag was detected in the last frame.

* Transform: a QuickTransform computed from a 4x4 matrix (Qt only seems to
  provide scales, rotations and translations). It serves as an adapter between
  the transformation matrices of Chilitags and the transform properties of QML
  items.

Prerequisite
------------

Chilitags and OpenCv need to be installed on the system (so that the
`-lchilitags`, `-lopencv_core`, etc. options of the linker finds them)

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
without the `export` step. The above will build the chilitags QML plugin
and put the necessary files under `import/Chilitags/`.

