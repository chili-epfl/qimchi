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
                text: qsTr("Debug")
                onTriggered: debug.debugging = !debug.debugging
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

        // We declare tags for the function cards
        ChilitagsObject {
            id: constructionCard
            name: "tag_0"
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: deconstructionCard
            name: "tag_1"
            property vector3d center : transform.times(parent.tagCenter)
        }


        // We declare tags for the components
        ChilitagsObject {
            id: component1
            name: "tag_104"
            property string character : "子"
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: component2
            name: "tag_105"
            property string character : "生"
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: component3
            name: "tag_106"
            property string character : "且"
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: component4
            name: "tag_107"
            property string character : "也"
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: component5
            name: "tag_108"
            property string character : "西"
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: component6
            name: "tag_109"
            property string character : ""
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: component7
            name: "tag_110"
            property string character : ""
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: component8
            name: "tag_111"
            property string character : ""
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
        // Reduce everything inside to half size.
        transform: Scale {xScale: .5; yScale:.5}

        // A video feedback of the camera
        VideoOutput {
            anchors.top: parent.top
            anchors.left: parent.left
            // The feedback has to be forwarded by the detection, because
            // cameras expect to have only one output surface
            source: detection

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("click")
                    console.log("tl = (" + sheetTopLeft.center.x + "," + sheetTopLeft.center.y + "," + sheetTopLeft.center.z + ")")
                    console.log("theta = " + mega_dot.theta)
                    console.log(detection.projectionMatrix)
                }
            }

        }


        Item {
            id: debug
            property bool debugging: true
            property bool show_blue_rectangles: true
            property bool show_yellows_corners: true

        }

        // This item is a container for the 3D objects to be projected on
        // the video input image.
        // Inside this item, coodinates are in the world referential,
        // i.e. in mm, where 0,0,0 is the position of the camera in the real world
        Item {
            // It uses the projection matrix from Chilitags
            transform: Transform { matrix: detection.projectionMatrix }

            Item {
                transform: Transform { matrix: sheetTopLeft.transform }
                Rectangle {
                    color: "yellow"
                    width: 20; height: 20
                    visible: debug.debugging & debug.show_yellows_corners & sheetTopLeft.visible
                }
            }
            Item {
                transform: Transform { matrix: sheetTopRight.transform }
                Rectangle {
                    color: "yellow"
                    width: 20; height: 20
                    visible: debug.debugging & debug.show_yellows_corners & sheetTopRight.visible
                }
            }
            Item {
                transform: Transform { matrix: sheetDownLeft.transform }
                Rectangle {
                    color: "yellow"
                    width: 20; height: 20
                    visible: debug.debugging & debug.show_yellows_corners & sheetDownLeft.visible
                }
            }
            Item {
                transform: Transform { matrix: sheetDownRight.transform }
                Rectangle {
                    color: "yellow"
                    width: 20; height: 20
                    visible: debug.debugging & debug.show_yellows_corners & sheetDownRight.visible
                }
            }
            Item {
                transform: Transform { matrix: component1.transform }
                Rectangle {
                    color: {
                        return "orange"
                    }
                    width: 20; height: 20
                    visible: debug.debugging & debug.show_yellows_corners & component1.visible
                }
            }
            Item {
                transform: Transform { matrix: component2.transform }
                Rectangle {
                    color: {
                        return "orange"
                    }
                    width: 20; height: 20
                    visible: debug.debugging & debug.show_yellows_corners & component2.visible
                }
            }
            Item {
                transform: Transform { matrix: component3.transform }
                Rectangle {
                    color: {
                        return "orange"
                    }
                    width: 20; height: 20
                    visible: debug.debugging & debug.show_yellows_corners & component3.visible
                }
            }
            Item {
                transform: Transform { matrix: component4.transform }
                Rectangle {
                    color: {
                        ch4.visible = true
                        return "orange"
                    }
                    width: 20; height: 20
                    visible: debug.debugging & debug.show_yellows_corners & component4.visible
                }
            }

        }

        Item {
            id: sc
            property vector3d tl : sheetTopLeft.center
            property vector3d dl : sheetDownLeft.center
            property vector3d tr : sheetTopRight.center
            property vector3d dr : sheetDownRight.center

            function getX(h,v) {
                return detection.projectionMatrix.times(
                                          tl
                                          .plus(tr.minus(tl).times(h).times(1-v))
                                          .plus(dr.minus(dl).times(h).times(v))
                                          .plus(dl.minus(tl).times(v))
                                      ).x
            }

            function getY(h,v) {
                return detection.projectionMatrix.times(
                                          tl
                                          .plus(tr.minus(tl).times(h).times(1.-v))
                                          .plus(dr.minus(dl).times(h).times(v))
                                          .plus(dl.minus(tl).times(v))
                                      ).y
            }

            function getRotation() {
                return Math.atan2(detection.projectionMatrix.times(tr).y-detection.projectionMatrix.times(tl).y,
                                  detection.projectionMatrix.times(tr).x-detection.projectionMatrix.times(tl).x)*180.0/Math.PI;
            }

            function getWidth(tlh,tlv,drh,drv) {
                return Math.sqrt(
                            (getX(tlh,tlv)-getX(drh,tlv))*(getX(tlh,tlv)-getX(drh,tlv))
                            +
                            (getY(tlh,tlv)-getY(drh,tlv))*(getY(tlh,tlv)-getY(drh,tlv))
                            )
            }

            function getHeight(tlh,tlv,drh,drv) {
                return Math.sqrt(
                            (getX(tlh,tlv)-getX(tlh,drv))*(getX(tlh,tlv)-getX(tlh,drv))
                            +
                            (getY(tlh,tlv)-getY(tlh,drv))*(getY(tlh,tlv)-getY(tlh,drv))
                            )
            }

        }

        Item {
            id: titleText
            visible: true

            property double tlh: 0.
            property double tlv: -0.1
            property double drh: 1.
            property double drv: 0.
            x: sc.getX(tlh,tlv)
            y: sc.getY(tlh,tlv)
            width: sc.getWidth(tlh,tlv,drh,drv)
            height: sc.getHeight(tlh,tlv,drh,drv)
            rotation: sc.getRotation()
            transformOrigin: Item.TopLeft

            Rectangle {
                color: "transparent"
                border.color: "blue"
                border.width: 4
                anchors.fill: parent
                visible: debug.debugging & debug.show_blue_rectangles
            }

            Text {
                font.pointSize: 24
                text: "Deconstruct the character"
                anchors.centerIn: parent
                visible: !deconstructionCard.visible
            }

            Text {
                font.pointSize: 24
                text: "Find which components go whith 女"
                anchors.centerIn: parent
                visible: deconstructionCard.visible
            }

        }

        Item {
            id: mainCharacter

            property double tlh: 0.46
            property double tlv: -0.02
            property double drh: 0.57
            property double drv: 0.12
            x: sc.getX(tlh,tlv)
            y: sc.getY(tlh,tlv)
            width: sc.getWidth(tlh,tlv,drh,drv)
            height: sc.getHeight(tlh,tlv,drh,drv)
            rotation: sc.getRotation()
            transformOrigin: Item.TopLeft

            Rectangle {
                color: "transparent"
                border.color: "blue"
                border.width: 4
                anchors.fill: parent
                visible: debug.debugging & debug.show_blue_rectangles
            }

        }

        Item {
            id: leftCharacter
            visible: deconstructionCard.visible

            property double tlh: 0.15
            property double tlv: 0.2
            property double drh: 0.2
            property double drv: 0.3
            x: sc.getX(tlh,tlv)
            y: sc.getY(tlh,tlv)
            width: sc.getWidth(tlh,tlv,drh,drv)
            height: sc.getHeight(tlh,tlv,drh,drv)
            rotation: sc.getRotation()
            transformOrigin: Item.TopLeft

            Rectangle {
                color: "transparent"
                border.color: "blue"
                border.width: 4
                anchors.fill: parent
                visible: debug.debugging & debug.show_blue_rectangles
            }

            Text {
                font.pointSize: 42
                text: "女"
                anchors.centerIn: parent
                visible: parent.visible
            }

        }



        Item {
            id: rightCharacter
            visible: deconstructionCard.visible

            property double tlh: 0.83
            property double tlv: 0.2
            property double drh: 0.88
            property double drv: 0.3
            x: sc.getX(tlh,tlv)
            y: sc.getY(tlh,tlv)
            width: sc.getWidth(tlh,tlv,drh,drv)
            height: sc.getHeight(tlh,tlv,drh,drv)
            rotation: sc.getRotation()
            transformOrigin: Item.TopLeft

            Rectangle {
                color: "transparent"
                border.color: "blue"
                border.width: 4
                anchors.fill: parent
                visible: debug.debugging & debug.show_blue_rectangles
            }

            Text {
                font.pointSize: 42
                text: "马"
                anchors.centerIn: parent
                visible: parent.visible
            }

        }

        Item {
            id: leftCharacterChild1
            visible: true
            property double tlh: -0.03
            property double tlv: 0.51
            property double drh: 0.07
            property double drv: 0.67
            x: sc.getX(tlh,tlv)
            y: sc.getY(tlh,tlv)
            width: sc.getWidth(tlh,tlv,drh,drv)
            height: sc.getHeight(tlh,tlv,drh,drv)
            rotation: sc.getRotation()
            transformOrigin: Item.TopLeft

            Rectangle {
                color: "transparent"
                border.color: "blue"
                border.width: 4
                anchors.fill: parent
                visible: debug.debugging & debug.show_blue_rectangles
            }

            Text {
                id: ch1
                color: "green"
                font.pointSize: 64
                text: "好"
                anchors.centerIn: parent
                visible: false
            }

        }

        Item {
            id: leftCharacterChild2
            visible: true
            property double tlh: 0.1
            property double tlv: 0.51
            property double drh: 0.20
            property double drv: 0.67
            x: sc.getX(tlh,tlv)
            y: sc.getY(tlh,tlv)
            width: sc.getWidth(tlh,tlv,drh,drv)
            height: sc.getHeight(tlh,tlv,drh,drv)
            rotation: sc.getRotation()
            transformOrigin: Item.TopLeft

            Rectangle {
                color: "transparent"
                border.color: "blue"
                border.width: 4
                anchors.fill: parent
                visible: debug.debugging & debug.show_blue_rectangles
            }

            Text {
                id: ch2
                color: "green"
                font.pointSize: 64
                text: "姐"
                anchors.centerIn: parent
                visible: false
            }

        }

        Item {
            id: leftCharacterChild3
            visible: true
            property double tlh: 0.23
            property double tlv: 0.51
            property double drh: 0.33
            property double drv: 0.67
            x: sc.getX(tlh,tlv)
            y: sc.getY(tlh,tlv)
            width: sc.getWidth(tlh,tlv,drh,drv)
            height: sc.getHeight(tlh,tlv,drh,drv)
            rotation: sc.getRotation()
            transformOrigin: Item.TopLeft

            Rectangle {
                color: "transparent"
                border.color: "blue"
                border.width: 4
                anchors.fill: parent
                visible: debug.debugging & debug.show_blue_rectangles
            }

            Text {
                id: ch3
                color: "green"
                font.pointSize: 64
                text: "她"
                anchors.centerIn: parent
                visible: false
            }

        }

        Item {
            id: leftCharacterChild4
            visible: true
            property double tlh: 0.35
            property double tlv: 0.51
            property double drh: 0.45
            property double drv: 0.67
            x: sc.getX(tlh,tlv)
            y: sc.getY(tlh,tlv)
            width: sc.getWidth(tlh,tlv,drh,drv)
            height: sc.getHeight(tlh,tlv,drh,drv)
            rotation: sc.getRotation()
            transformOrigin: Item.TopLeft

            Rectangle {
                color: "transparent"
                border.color: "blue"
                border.width: 4
                anchors.fill: parent
                visible: debug.debugging & debug.show_blue_rectangles
            }

            Text {
                id: ch4
                color: "green"
                font.pointSize: 64
                text: "姓"
                anchors.centerIn: parent
                visible: false
            }

        }

        Item {
            id: leftCharacterChild5
            visible: true
            property double tlh: 0.47
            property double tlv: 0.51
            property double drh: 0.57
            property double drv: 0.67
            x: sc.getX(tlh,tlv)
            y: sc.getY(tlh,tlv)
            width: sc.getWidth(tlh,tlv,drh,drv)
            height: sc.getHeight(tlh,tlv,drh,drv)
            rotation: sc.getRotation()
            transformOrigin: Item.TopLeft

            Rectangle {
                color: "transparent"
                border.color: "blue"
                border.width: 4
                anchors.fill: parent
                visible: debug.debugging & debug.show_blue_rectangles
            }

            Text {
                id: ch5
                color: "green"
                font.pointSize: 64
                text: "要"
                anchors.centerIn: parent
                visible: false
            }

        }

        Item {
            id: dot

            property vector3d tl : sheetTopLeft.center
            property vector3d dl : sheetDownLeft.center
            property vector3d tr : sheetTopRight.center
            property vector3d dr : sheetDownRight.center

            property double h: 0
            property double v: 0.5

            property vector3d e : detection.projectionMatrix.times(
                                      tl
                                      .plus(tr.minus(tl).times(h).times(1-v))
                                      .plus(dr.minus(dl).times(h).times(v))
                                      .plus(dl.minus(tl).times(v))
                                  )
            x: e.x
            y: e.y
            width: 10
            height: 10

            Rectangle {
                color: "magenta"
                anchors.fill: parent
                visible: debug.debugging & debug.show_blue_rectangles
            }
        }

    }


}
