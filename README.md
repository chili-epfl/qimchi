Qimchi
=======

Qimchi is a QML based framework for CHILI lab's projects in augmented reality
and robotics.

Content
--------

The global QtCreator project references the following modules:

* qmlchilitags: integration of [Chilitags](https://github.com/chili-epfl/chilitags)
  in QML
* qmlchilitags-demo: A tangible application for learning Chinese using qmlchilitags.
* qmlchilitags-projection: demonstration of how to use qmlchilitags in a
  camera+projector setting


Build
------

/!\ This qimchi-based application doesn't use the latest qimchi framework.

To build the project :

- Install Chilitags from https://github.com/chili-epfl/chilitags (including installation of opencv as it is explained there - some people have found problems if opencv was installed as explained in the latest qimchi version)

- Clone the repository and open qimchi.pro project in Qt Creator. In the project Run Settings add the path to the chillitags library to LD_LIBRARY_PATH (for us usr/local/lib)


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
