import QtQuick 2.2
import QtQuick.Window 2.1
import Chilitags 1.0
import QtMultimedia 5.0

Window {
    visible: true; visibility: "FullScreen"
    MouseArea { anchors.fill: parent;  onClicked: Qt.quit() }

    // Set up detection.
    ChilitagsDetection {
        source: Camera {}

        // Tag #1023 will be displayed, and used to continuously detect
        // the camera-display configuration.
        ChilitagsObject {id: screenTag; name: "tag_1023"}

        // The goal of this demo is to detect tag #4 and display something
        // around it
        ChilitagsObject {id: realTag;   name: "tag_4"}
    }

    // The general idea is to have a 3D object corresponding to the screen
    // A chilitag will locate the 3D object, but the origin of the tag will be
    // placed in the center of the screen. This is what the displayTransform
    // achieves, in a way that can be integrated in the computations of the
    // calibration transform.
    // Note: alternatively, instead of using raw tags as 3D object,
    // one could use a configured 3D object
    property matrix4x4 displayTransform : Qt.matrix4x4(
        pixelsPerMM, 0, 0, width/2,
        0, pixelsPerMM, 0, height/2,
        0, 0, pixelsPerMM, 0,
        0, 0, 0,           1
    )

    // We also need to provide the pixel density.
    // It could be measured by displaying a tag next to a real tag of known
    // size, but here we simply provide an arbitrary value.
    property real pixelsPerMM : 5

    // Display the screen where expected
    Item {
        transform: Transform { matrix: displayTransform }
        Image {
            source: "qrc:/1023.png"
            width: 20; height: 20 //mm
        }
    }

    // Compute the calibration transformation as the position of the screen,
    // i.e. the
    property matrix4x4 calibration :
        displayTransform.times(screenTag.transform.inverted())


    // This item is a container for items attached to tags on the plane of the
    // calibrated projection.
    Item {
        transform: Transform { matrix:  calibration}

        // This item is a container for graphic elements attached to tag #4
        // Inside this item, coordinates are in the tag referential
        // i.e. in mm, where 0,0,0 is the top left corner of the tag
        Item {
            transform: Transform { matrix: realTag.transform}
            visible: realTag.visible

            // Draw a 30mm wide, transparent circle centered on the tag
            // (yes, that's what QML rectangle are for, too)
            Rectangle {
                color: "yellow"; opacity: .25
                width: 30; height: width; radius: width/2
                x: -5; y:-5
            }
            // Print a text below the tag (following its orientation)
            Text {
                text: "Here is the tag"
                x: 10; y: 25
            }
        }
    }

    // A status check for debugging purposes
    Text {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        text:
            "Calibration tag: "
            + ((screenTag.visible)?"":"NOT ")
            + "detected;\t"
            + "Test tag: "
            + ((realTag.visible)?"":"NOT ")
            + "detected."
    }

    // Now, "Here is the tag" should appear when tag #4 is placed on the
    // display. The follwing allows to make a simulated tag #4 appear on the
    // projection.
    Text {
        anchors.top: parent.top
        anchors.left: parent.left
        text: "Toggle simulated tag"
        MouseArea {
            anchors.fill: parent
            onClicked: simulatedTag.visible = !simulatedTag.visible
        }
    }

    Image {
        id: simulatedTag
        source: "qrc:/4.png"
        scale: pixelsPerMM

        rotation: 45
        x: 3*parent.width/4; y: parent.width/4
        width: 20; height: 20
    }
}
