import QtQuick 2.2
import QtQuick.Controls 1.1
import QtMultimedia 5.0

import com.chili.ocvcameraqml 1.0
import com.chili.chilitags 1.0


ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

   OCVCamera{
        id:camera
        deviceID:0
        onFrameCaptured: detection.detect(frame)
   }

    Rectangle {
        color: "#ffffff"
        id:startButton
        width: 200
        height: 200
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
        width: 200
        height: 200
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
        width: 200
        height: 200
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

    VideoOutput {
        anchors.top: quitButton.top
        anchors.left: quitButton.right
        id:video
        source:camera
    }
    // Set up chilitag detection
    ChilitagsDetection {
        id: detection

        // Use the camera defined above
       //  source: camera

        // Define here tagCenter as the center of a 20x20 (mm) tag
        property vector3d tagCenter : Qt.vector3d(10,10,0)

        // Declare two 3D objects that are used in this demo
        ChilitagsObject {
            id: redTag
            name: "tag_1023"
            // Add a property that is computed as a the 3D position of the
            // center of this tag
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: blueTag
            name: "tag_972"
            property vector3d center : transform.times(parent.tagCenter)
        }
    }


    Item {
        // Lower it by 20 pixels to leave some space for start/stop/quit buttons
        y:20
        // Reduce everything inside to half size.
        //transform: Scale {xScale: .5; yScale:.5}


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
}
