import QtQuick 2.3
import QtQuick.Window 2.1
import Chilitags 1.0
import QtMultimedia 5.0
import QtQuick.Controls 1.2


ApplicationWindow {
    visible: true
    //visibility: "FullScreen"
    color: "black"
    //Settings for a "normal" window
    width: 1280
    height: 960
    title: qsTr("Hello World")

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("Start")
                onTriggered: camera.start()
            }
            MenuItem {
                text: qsTr("Stop")
                onTriggered: camera.stop()
            }
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
    }





    // Simple use the standard QML camera for video input
    Camera { id: camera }

    // Set up chilitag detection
    ChilitagsDetection {
        id: detection

        // Use the camera defined above
        source: camera

        // Define here tagCenter as the center of a 20x20 (mm) tag
        property vector3d tagCenter : Qt.vector3d(10,10,0)

        // We declare tags for the basic sheet
        ChilitagsObject {
            id: sheetTopLeft
            name: "tag_100"
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: sheetTopRight
            name: "tag_101"
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: sheetDownRight
            name: "tag_102"
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: sheetDownLeft
            name: "tag_103"
            property vector3d center : transform.times(parent.tagCenter)
        }


    }

    // This Item is the main graphic container, where AR happens.
    // Inside this item, coordinates are in the input image referential,
    // i.e. in pixels, where 0,0 is the top left corner of the video
    Item {
        // Reduce everything inside to half size.
        transform: Scale {xScale: .5; yScale:.5}

        // A video feedback of the camera
        VideoOutput {
            anchors.top: parent.top
            anchors.left: parent.left
            // The feedback has to be forwarded by the detection, because
            // cameras expect to have only one output surface
            source: detection
        }

        // This item is a container for the 3D objects to be projected on
        // the video input image.
        // Inside this item, coodinates are in the world referential,
        // i.e. in mm, where 0,0,0 is the position of the camera in the real world
        Item {
            // It uses the projection matrix from Chilitags
            transform: Transform { matrix: detection.projectionMatrix }

            Item {
                transform: Transform { matrix: sheetDownLeft.transform }
                Rectangle {
                    color: "yellow"
                    width: 20; height: 20
                    visible: sheetDownLeft.visible
                }
            }

            Item {
                transform: Transform { matrix: sheetDownRight.transform }
                Rectangle {
                    color: "yellow"
                    width: 20; height: 20
                    visible: sheetDownRight.visible
                }
            }

            Item {
                transform: Transform { matrix: sheetTopLeft.transform }
                Rectangle {
                    color: "yellow"
                    width: 20; height: 20
                    visible: sheetTopLeft.visible
                }
            }

            Item {
                transform: Transform { matrix: sheetTopRight.transform }
                Rectangle {
                    color: "yellow"
                    width: 20; height: 20
                    visible: sheetTopRight.visible
                }
            }

        }

        // Back to input image referential, to show another way to deal with
        // different referential.
        // This rectangle is really a line (it has a height of 1px) between
        // the centers of the two tags.
        Rectangle {
            color: "blue"
            height: 3

            // Manually compute the position in pixels of the center of the tags
            property vector3d tl :
                detection.projectionMatrix.times(sheetTopLeft.center)
            property vector3d tr :
                detection.projectionMatrix.times(sheetTopRight.center)
            // Note : QML already manages a scenegraph, so something like
            // redTagBackground.mapToItem(parent, 10, 10)
            // would be equivalent to the above manual computation,
            // but it does not seem to be bound to the transform changes..
            // To be continued ;)

            // Mathematically translate the (start,end) description of the line
            // given by the tags to a (x,y,length,rotation) description
            x: tl.x
            y: tl.y
            z: tl.z
            width: Math.sqrt( (tr.y-tl.y)*(tr.y-tl.y)
                            + (tr.x-tl.x)*(tr.x-tl.x) )
            rotation: Math.atan2(tr.y-tl.y, tr.x-tl.x)*180.0/Math.PI;
            transformOrigin: Item.TopLeft
        }

        Rectangle {
            color: "blue"
            height: 3

            // Manually compute the position in pixels of the center of the tags
            property vector3d tl :
                detection.projectionMatrix.times(sheetTopLeft.center)
            property vector3d dl :
                detection.projectionMatrix.times(sheetDownLeft.center)
            // Note : QML already manages a scenegraph, so something like
            // redTagBackground.mapToItem(parent, 10, 10)
            // would be equivalent to the above manual computation,
            // but it does not seem to be bound to the transform changes..
            // To be continued ;)

            // Mathematically translate the (start,end) description of the line
            // given by the tags to a (x,y,length,rotation) description
            x: tl.x
            y: tl.y
            z: tl.z
            width: Math.sqrt( (dl.y-tl.y)*(dl.y-tl.y)
                            + (dl.x-tl.x)*(dl.x-tl.x) )
            rotation: Math.atan2(dl.y-tl.y, dl.x-tl.x)*180.0/Math.PI;
            transformOrigin: Item.TopLeft
        }

        Text {
            color: "red"
            font.pointSize: 24

            property vector3d tl :
                detection.projectionMatrix.times(sheetTopLeft.center)
            property vector3d tr :
                detection.projectionMatrix.times(sheetTopRight.center)
            property vector3d dl :
                detection.projectionMatrix.times(sheetDownLeft.center)
            property vector3d dr :
                detection.projectionMatrix.times(sheetDownRight.center)

            property double h: 1.
            property double v: 1.

            text: "("+h+","+v+")"

            x: h*(v*(dr.x-dl.x)+(1-v)*(tr.x-tl.x))+v*(dl.x-tl.x)+tl.x
            y: h*(v*(dr.y-dl.y)+(1-v)*(tr.y-tl.y))+v*(dl.y-tl.y)+tl.y
            rotation: Math.atan2(tr.y-tl.y, tr.x-tl.x)*180.0/Math.PI;
            transformOrigin: Item.TopLeft
        }

        Text {
            color: "red"
            font.pointSize: 24

            property vector3d tl :
                detection.projectionMatrix.times(sheetTopLeft.center)
            property vector3d tr :
                detection.projectionMatrix.times(sheetTopRight.center)
            property vector3d dl :
                detection.projectionMatrix.times(sheetDownLeft.center)
            property vector3d dr :
                detection.projectionMatrix.times(sheetDownRight.center)

            property double h: 0.
            property double v: 1.

            text: "("+h+","+v+")"

            x: h*(v*(dr.x-dl.x)+(1-v)*(tr.x-tl.x))+v*(dl.x-tl.x)+tl.x
            y: h*(v*(dr.y-dl.y)+(1-v)*(tr.y-tl.y))+v*(dl.y-tl.y)+tl.y
            rotation: Math.atan2(tr.y-tl.y, tr.x-tl.x)*180.0/Math.PI;
            transformOrigin: Item.TopLeft
        }


        Text {
            color: "red"
            font.pointSize: 24

            property vector3d tl :
                detection.projectionMatrix.times(sheetTopLeft.center)
            property vector3d tr :
                detection.projectionMatrix.times(sheetTopRight.center)
            property vector3d dl :
                detection.projectionMatrix.times(sheetDownLeft.center)
            property vector3d dr :
                detection.projectionMatrix.times(sheetDownRight.center)

            property double h: 1.
            property double v: 0.

            text: "("+h+","+v+")"

            x: h*(v*(dr.x-dl.x)+(1-v)*(tr.x-tl.x))+v*(dl.x-tl.x)+tl.x
            y: h*(v*(dr.y-dl.y)+(1-v)*(tr.y-tl.y))+v*(dl.y-tl.y)+tl.y
            rotation: Math.atan2(tr.y-tl.y, tr.x-tl.x)*180.0/Math.PI;
            transformOrigin: Item.TopLeft
        }


        Text {
            color: "red"
            font.pointSize: 24

            property vector3d tl :
                detection.projectionMatrix.times(sheetTopLeft.center)
            property vector3d tr :
                detection.projectionMatrix.times(sheetTopRight.center)
            property vector3d dl :
                detection.projectionMatrix.times(sheetDownLeft.center)
            property vector3d dr :
                detection.projectionMatrix.times(sheetDownRight.center)

            property double h: 0.
            property double v: 0.

            text: "("+h+","+v+")"

            x: h*(v*(dr.x-dl.x)+(1-v)*(tr.x-tl.x))+v*(dl.x-tl.x)+tl.x
            y: h*(v*(dr.y-dl.y)+(1-v)*(tr.y-tl.y))+v*(dl.y-tl.y)+tl.y
            rotation: Math.atan2(tr.y-tl.y, tr.x-tl.x)*180.0/Math.PI;
            transformOrigin: Item.TopLeft
        }


        Text {
            color: "red"
            font.pointSize: 24

            property vector3d tl :
                detection.projectionMatrix.times(sheetTopLeft.center)
            property vector3d tr :
                detection.projectionMatrix.times(sheetTopRight.center)
            property vector3d dl :
                detection.projectionMatrix.times(sheetDownLeft.center)
            property vector3d dr :
                detection.projectionMatrix.times(sheetDownRight.center)

            property double h: .5
            property double v: .5

            text: "("+h+","+v+")"


            x: h*(v*(dr.x-dl.x)+(1-v)*(tr.x-tl.x))+v*(dl.x-tl.x)+tl.x
            y: h*(v*(dr.y-dl.y)+(1-v)*(tr.y-tl.y))+v*(dl.y-tl.y)+tl.y
            rotation: Math.atan2(tr.y-tl.y, tr.x-tl.x)*180.0/Math.PI;
            transformOrigin: Item.TopLeft
        }


    }

}
