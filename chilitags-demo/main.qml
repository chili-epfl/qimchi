import QtQuick 2.2
import QtQuick.Window 2.1
import Chilitags 1.0
import QtMultimedia 5.0

Window {
    property matrix4x4 displayTransform : Qt.matrix4x4(
        1, 0, 0, 0,
        0, 1, 0, 0,
        0, 0, 0, 0,
        0, 0, 0, 1
    )
    visible: true
    visibility: "FullScreen"
    color: "black"
    //Settings for a "normal" window
    //width: 1024
    //height: 768
    //title: qsTr("Hello World")

    // Simple use the standard QML camera for video input
    Camera { id: camera }

    // Set up chilitag detection
    ChilitagsDetection {
        id: detection

        // Use the camera defined above
        source: camera

        // Define here tagCenter as the center of a 20x20 (mm) tag
        property vector3d tagCenter : Qt.vector3d(10,10,0)

        //A tag to test the animated gifs
          ChilitagsObject {
              id: animatedTag
              name: "tag_1023"
              // Add a property that is computed as a the 3D position of the
              // center of this tag
              property vector3d center : transform.times(parent.tagCenter)
          }

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

        // We declare tags for the action cards
        ChilitagsObject {
            id: deconstructCard
            name: "tag_1"
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: constructCard
            name: "tag_0"
            property vector3d center : transform.times(parent.tagCenter)
        }
        // We declare tags for the action cards
        ChilitagsObject {
            id: pinyinCard
            name: "tag_3"
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: wordCombinationCard
            name: "tag_2"
            property vector3d center : transform.times(parent.tagCenter)
        }

        // We declare tags for the components
        ChilitagsObject {
            id: correctSymbol
            name: "tag_106"
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: wrongSymbol
            name: "tag_109"
            property vector3d center : transform.times(parent.tagCenter)
        }


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


            Item {
                transform: Transform { matrix: animatedTag.transform }
                Rectangle {
                    color: "white"
                    width: 20; height: 20
                    visible: animatedTag.visible
                    AnimatedImage { id: animatedHao; source: "qrc:/hao.gif"; asynchronous: true; width: parent.width; height: parent.height }
                }
            }


            // This item is a container for graphic elements attached to
            // one of the tags
            // Inside this item, coordinates are in the tag referential
            // i.e. in mm, where 0,0,0 is the top left corner of the tag
            Item {
                transform: Transform { matrix: redTag.transform }
                Rectangle {
                    color: "white"
                    width: 20; height: 20
                    visible: redTag.visible
                    Text {
                        text: "好"
                        visible: redTag.visible
                        width: parent.width
                        horizontalAlignment: Text.AlignHCenter
                    }

                }
            }

            // Same for the other tag
            Item {
                transform: Transform { matrix: blueTag.transform }
                Rectangle {
                    id: blueTagBackground
                    color: "white"
                    width: 20; height: 20
                    visible: blueTag.visible

                    Text {
                        text: "吗"
                        visible: blueTag.visible
                        width: parent.width
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
            }

            // This is the containter for graphic elements attached to the sheet
            // Inside this item, coordinates are in the sheet referential
            // i.e. in mm, where 0,0,0 is the top left corner of the tag
            // TODO: find some way of getting more accurate positions by using the four sheet tags
            Item {
                transform: Transform { matrix: sheetTopLeft.transform }

                Text {
                    id: dummy
                    text: "a"
                    visible: (sheetTopLeft.visible || sheetTopRight.visible || sheetDownLeft.visible || sheetDownRight.visible)
                    z: 0.1
                    x: -300
                    y: -300
                }

                // Some title text with instructions
                Text {
                    id: sheetTitleDecomposition
                    text: "What are the components of this character?"
                    visible: (sheetTopLeft.visible || sheetTopRight.visible || sheetDownLeft.visible || sheetDownRight.visible) && !constructCard.visible && !deconstructCard.visible
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    x: 125
                    y: -25
                    z: 1
                    font.pointSize: 6; font.bold: true
                }
                Text {
                    id: sheetTitleComposition
                    text: ""
                    visible: (sheetTopLeft.visible || sheetTopRight.visible || sheetDownLeft.visible || sheetDownRight.visible) && !constructCard.visible && deconstructCard.visible
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    x: 125
                    y: -25
                    z: 1
                    font.pointSize: 6; font.bold: true
                }
                Text {
                    id: sheetTitleComposition2
                    text: "Select which components form a valid symbol"
                    visible: (sheetTopLeft.visible || sheetTopRight.visible || sheetDownLeft.visible || sheetDownRight.visible) && constructCard.visible && deconstructCard.visible
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    x: 125
                    y: -25
                    z: 1
                    font.pointSize: 6; font.bold: true
                }

                // Rectangle around the base symbol
                Rectangle {
                    id: rectangleSymbol
                    color: "transparent"
                    border.color: "blue"
                    border.width: 3
                    x: 125
                    y: 4
                    width: 30
                    height: 30
                    z: 1
                    visible: sheetTitleDecomposition.visible
                }


                // The symbols at the decomposition stage
                Text {
                    text: "女"
                    visible: sheetTitleComposition.visible || sheetTitleComposition2.visible
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    x: 55
                    y: 50
                    z: 1
                    color: "#660000"
                }
                Text {
                    text: "Radical\nSemantic component"
                    visible: sheetTitleComposition.visible
                    width: parent.width
                    horizontalAlignment: Text.AlignLeft
                    x: 65
                    y: 45
                    z: 1
                    color: "#660000"
                    font.pointSize: 4
                }
                Text {
                    text: "马"
                    visible: sheetTitleComposition.visible || sheetTitleComposition2.visible
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    z: 1
                    x: 220
                    y: 45
                }
                Text {
                    text: "Component\nPhonetic component"
                    visible: sheetTitleComposition.visible
                    width: parent.width
                    horizontalAlignment: Text.AlignRight
                    x: 210
                    y: 45
                    z: 1
                    color: "#000000"
                    font.pointSize: 4
                }

                //Messages for the construction activity
                Text {
                    text: "Correct!\n对"
                    visible: sheetTitleComposition2.visible && correctSymbol.visible
                    width: parent.width
                    horizontalAlignment: Text.AlignRight
                    x: 13
                    y: 77
                    z: 1
                    color: "#006600"
                    font.pointSize: 6
                }
                Text {
                    text: "姐"
                    visible: sheetTitleComposition2.visible && correctSymbol.visible
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    x: 17
                    y: 97
                    z: 1
                    font.pointSize: 16
                }
                Text {
                    text: "Try again!\n再试一次"
                    visible: sheetTitleComposition2.visible && wrongSymbol.visible
                    width: parent.width
                    horizontalAlignment: Text.AlignRight
                    x: 13
                    y: 77
                    z: 1
                    color: "#AA0000"
                    font.pointSize: 6
                }
                Text {
                    text: "x"
                    visible: sheetTitleComposition2.visible && wrongSymbol.visible
                    width: parent.width
                    color: "#AA0000"
                    horizontalAlignment: Text.AlignHCenter
                    x: 17
                    y: 85
                    z: 1
                    font.pointSize: 30
                }

            }

            // Additional hints, displayed on cards
            Item {
                transform: Transform { matrix: pinyinCard.transform }
                Text {
                    id: pinyinhint
                    visible: pinyinCard.visible
                    text: "jie (3)"
                    horizontalAlignment: Text.AlignLeft
                    x: 7
                    y: 27
                    z: 1
                    font.pointSize: 6
                }
            }
            // Additional hints, displayed on cards
            Item {
                transform: Transform { matrix: wordCombinationCard.transform }
                Text {
                    id: wordhint
                    visible: wordCombinationCard.visible
                    text: "姐姐"
                    horizontalAlignment: Text.AlignLeft
                    x: 7
                    y: 27
                    z: 1
                    font.pointSize: 8
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
            z: 0
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
