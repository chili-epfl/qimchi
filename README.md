Qimchi
======

Qimchi is a QML based framework for CHILI lab's projects in augmented reality, robotics and tangible interfaces that works on desktop and Android.

Qimchi currently requires:

- Ubuntu 14.04 host
- Qt 5.3.2

Content
-------

Qimchi is composed of various modules that are actually QML plugins and a number of samples. These modules are contained under `modules/` as git submodules and can also function independently.

Current modules are:

- **CVCamera:** Fast OpenCV camera access

  Dependencies:

  - libv4l
  - OpenCV `3.0.0-alpha1`

- **Chilitags:** Fiducial marker tracker

  Dependencies:

  - CVCamera
  - OpenCV `3.0.0-alpha1`
  - Chilitags
  - Optionally Qt3D

- **Qt3D:** Qt's 3D engine

*Note*: In order to clone the repository with the submodules, you can use `git clone --recursive https://...` (You may have to configure your SSH keys in Github, as per [this tutorial](https://help.github.com/articles/generating-ssh-keys/)).


Desktop Build
-------------



Build instructions coming soon...

For building individual modules, each module contains a specific README.

Android Build
-------------

Build instructions coming soon...

For building individual modules, each module contains a specific README.

Running Samples
---------------

Samples are located under [samples](samples). Once the modules are in place, building and running the samples should be as simple as opening them in Qt Creator and clicking the `Run` button. See [samples/README.md](samples/README.md) for more detailed information.

License
-------
Qimchi is licensed under the GPLv3 License.

