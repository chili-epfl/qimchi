import QtQuick 2.2
import QtQuick.Window 2.1
import Chilitags 1.0
import QtMultimedia 5.0

Window {
    visible: true
    width: 360
    height: 360

    // Simple use the standard QML camera for video input
    Camera { id: camera }


    // Set up chilitag detection
    ChilitagsDetection {
        id: detection

        // Use the camera defined above
        source: camera

        // Define here tagCenter as the center of a 20x20 (mm) tag
        property vector3d tagCenter : Qt.vector3d(10,10,0)

        // Declare two 3D objects that are used in this demo
        ChilitagsObject {
            id: redTag
            name: "tag_4"
            // Add a property that is computed as a the 3D position of the
            // center of this tag
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: blueTag
            name: "tag_5"
            property vector3d center : transform.times(parent.tagCenter)
        }
    }

    // This Item is the main graphic container, where AR happens.
    // Inside this item, coordinates are in the input image referential,
    // i.e. in pixels, where 0,0 is the top left corner of the video
    Item {
        // Lower it by 20 pixels to leave some space for start/stop/quit buttons
        y:20
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

            // This item is a container for graphic elements attached to
            // one of the tags
            // Inside this item, coordinates are in the tag referential
            // i.e. in mm, where 0,0,0 is the top left corner of the tag
            Item {
                transform: Transform { matrix: redTag.transform }
                Rectangle {
                    color: "blue"
                    width: 20; height: 20
                    visible: redTag.visible
                }
                Image {
                    source: "qrc:/qt-logo.png"
                    width: 20; height: 20
                    visible: redTag.visible
                }
            }

            // Same for the other tag
            Item {
                transform: Transform { matrix: blueTag.transform }
                Rectangle {
                    id: redTagBackground
                    color: "red"
                    width: 20; height: 20
                    visible: blueTag.visible
                }
                Image {
                    source: "qrc:/qt-logo.png";
                    width: 20; height: 20
                    visible: blueTag.visible
                }
            }
        }

        // Back to input image referential, to show another way to deal with
        // different referential.
        // This rectangle is really a line (it has a height of 1px) between
        // the centers of the two tags.
        Rectangle {
            id: line
            height: 1
            color: "magenta"

            // Manually compute the position in pixels of the center of the tags
            property vector3d start :
                detection.projectionMatrix.times(redTag.center)
            property vector3d end :
                detection.projectionMatrix.times(blueTag.center)
            // Note : QML already manages a scenegraph, so something like
            // redTagBackground.mapToItem(parent, 10, 10)
            // would be equivalent to the above manual computation,
            // but it does not seem to be bound to the transform changes..
            // To be continued ;)

            // Mathematically translate the (start,end) description of the line
            // given by the tags to a (x,y,length,rotation) description
            x: start.x
            y: start.y
            width: Math.sqrt( (end.y-start.y)*(end.y-start.y)
                            + (end.x-start.x)*(end.x-start.x) )
            rotation: Math.atan2(end.y-start.y, end.x-start.x)*180.0/Math.PI;
            transformOrigin: Item.TopLeft
        }
    }

    // Three home made buttons to start the camera (and thus the detection),
    // stop it, and quit the demo application. The camera starts automatically.
    // There is most likely a better way to do that, e.g. a menubar item
    Rectangle {
        color: "#ffffff"
        id:startButton
        width: 50
        height: 20
        anchors.left: parent.left
        anchors.top: parent.top
        Text {
            text: "start"
            anchors.centerIn: parent
        }
        MouseArea {
            anchors.fill: parent
            onClicked: camera.start()
        }
    }

    Rectangle {
        color: "#ffffff"
        id:stopButton
        width: 50
        height: 20
        anchors.left: startButton.right
        anchors.top: startButton.top
        Text {
            text: "stop"
            anchors.centerIn: parent
        }
        MouseArea {
            anchors.fill: parent
            onClicked: camera.stop()
        }
    }

    Rectangle {
        color: "#ffffff"
        id:quitButton
        width: 50
        height: 20
        anchors.left: stopButton.right
        anchors.top: stopButton.top
        Text {
            text: "quit"
            anchors.centerIn: parent
        }
        MouseArea {
            anchors.fill: parent
            onClicked: Qt.quit()
        }
    }

}
