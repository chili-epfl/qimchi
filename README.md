qimchi
======

*OCVCamera is a wrapper around opencv highgui. In Android, it uses the native libs (libnative_camera_r*.so).
  Currently, a timer triggers the image acquisition, which is notified through the signal frameCaptured.
  The plugin contains a QAbstractVideoSurface to be compatible with the QML Video Output object.

*chilitags is basically the old qimchi. The only difference is the slot 
      Q_INVOKABLE void detect(cv::Mat frame);
  in chilidetection class. The idea is to use the signal-slot mechanism frameCaptured(frame)->detect(frame).

*pgrcameraqml is a QML object for the point grey cameras. TODO

*testOCV is the qimchi demo using OCVCamera and chilitags.

Build the plugins should be easy (just set the correct paths for the include and libs in .pro). Currently, 
I add "make install" as last build command in order to have the libs in the QT folder. 

For the applications you need to bundle all the libs in the apk(ANDROID_EXTRA_LIBS in .pro)!
Remember that the order is importantant.
