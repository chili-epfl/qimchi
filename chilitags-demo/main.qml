import QtQuick 2.3
import QtQuick.Window 2.1
import Chilitags 1.0
import QtMultimedia 5.0
import QtQuick.Controls 1.2
import "Global.js" as Global


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


        // We declare tags for the components (orange cards)
        // We use the onVisibilityChanged method to change the display
        ChilitagsObject {
            id: component1
            name: "tag_104"
            property string character : "子"
            property vector3d center : transform.times(parent.tagCenter)
            onVisibilityChanged: {
                if(component1.visible) {
                    ch1.visible = true
                    text_good.visible = true
                    timer_good.start()
                }
            }
        }
        ChilitagsObject {
            id: component2
            name: "tag_105"
            property string character : "生"
            property vector3d center : transform.times(parent.tagCenter)
            onVisibilityChanged: {
                if(component2.visible) {
                    ch2.visible = true
                    text_good.visible = true
                    timer_good.start()
                }
            }
        }
        ChilitagsObject {
            id: component3
            name: "tag_106"
            property string character : "且"
            property vector3d center : transform.times(parent.tagCenter)
            onVisibilityChanged: {
                if(component3.visible) {
                    ch3.visible = true
                    text_good.visible = true
                    timer_good.start()
                }
            }
        }
        ChilitagsObject {
            id: component4
            name: "tag_107"
            property string character : "也"
            property vector3d center : transform.times(parent.tagCenter)
            onVisibilityChanged: {
                if(component4.visible) {
                    ch4.visible = true
                    text_good.visible = true
                    timer_good.start()
                }
            }
        }
        ChilitagsObject {
            id: component5
            name: "tag_108"
            property string character : "西"
            property vector3d center : transform.times(parent.tagCenter)
            onVisibilityChanged: {
                if(component5.visible) {
                    ch5.visible = true
                    text_good.visible = true
                    timer_good.start()
                }
            }
        }
        ChilitagsObject {
            id: component6
            name: "tag_109"
            property string character : ""
            property vector3d center : transform.times(parent.tagCenter)
            onVisibilityChanged: {
                if(component6.visible) {
                    text_tryagain.visible = true
                    timer_tryagain.start()
                }
            }
        }
        ChilitagsObject {
            id: component7
            name: "tag_110"
            property string character : ""
            property vector3d center : transform.times(parent.tagCenter)
            onVisibilityChanged: {
                if(component7.visible) {
                    text_tryagain.visible = true
                    timer_tryagain.start()
                }
            }
        }
        ChilitagsObject {
            id: component8
            name: "tag_111"
            property string character : ""
            property vector3d center : transform.times(parent.tagCenter)
            onVisibilityChanged: {
                if(component8.visible) {
                    text_tryagain.visible = true
                    timer_tryagain.start()
                }
            }
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
            id: sheetBottomRight
            name: "tag_102"
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: sheetBottomLeft
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
                    console.log(detection.projectionMatrix)
                }
            }


            //A text (GOOD) to be displayed when a good component appears.
            //It stays on screen for three seconds
            Item {
                anchors.fill: parent
                Timer {
                    id: timer_good
                    interval: 3000;repeat: false;running: false
                    onTriggered: {
                        console.log("timer ends")
                        text_good.visible = false
                    }
                }

                Text {
                    id: text_good
                    text: "GOOD";font.pointSize: 64;color: "green"
                    visible: false
                    anchors.centerIn: parent
                }
            }


            //A text (COMPLETE) to be displayed when all five components have been found.
            Item {
                anchors.fill: parent
                Text {
                    text: "COMPLETE";font.pointSize: 64;color: "green"
                    visible: ch1.visible & ch2.visible & ch3.visible & ch4.visible & ch5.visible & !text_good.visible
                    anchors.centerIn: parent
                }
            }

            //A text (TRY AGAIN) to be displayed when a bad component appears.
            //It stays on screen for three seconds
            Item {
                anchors.fill: parent
                Timer {
                    id: timer_tryagain
                    interval: 3000;repeat: false;running: false
                    onTriggered: {
                        console.log("timer ends")
                        text_tryagain.visible = false
                    }
                }

                Text {
                    id: text_tryagain
                    text: "TRY AGAIN";font.pointSize: 64;color: "red"
                    visible: false
                    anchors.centerIn: parent
                }
            }

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
                    visible: Global.debugging & Global.show_tags & sheetTopLeft.visible
                }
            }
            Item {
                transform: Transform { matrix: sheetTopRight.transform }
                Rectangle {
                    color: "yellow"
                    width: 20; height: 20
                    visible: Global.debugging & Global.show_tags & sheetTopRight.visible
                }
            }
            Item {
                transform: Transform { matrix: sheetBottomLeft.transform }
                Rectangle {
                    color: "yellow"
                    width: 20; height: 20
                    visible: Global.debugging & Global.show_tags & sheetBottomLeft.visible
                }
            }
            Item {
                transform: Transform { matrix: sheetBottomRight.transform }
                Rectangle {
                    color: "yellow"
                    width: 20; height: 20
                    visible: Global.debugging & Global.show_tags & sheetBottomRight.visible
                }
            }
            Item {
                transform: Transform { matrix: component1.transform }
                Rectangle {
                    color: "orange"
                    width: 20; height: 20
                    visible: Global.debugging & Global.show_tags & component1.visible
                }
            }
            Item {
                transform: Transform { matrix: component2.transform }
                Rectangle {
                    color: "orange"
                    width: 20; height: 20
                    visible: Global.debugging & Global.show_tags & component2.visible
                }
            }
            Item {
                transform: Transform { matrix: component3.transform }
                Rectangle {
                    color: "orange"
                    width: 20; height: 20
                    visible: Global.debugging & Global.show_tags & component3.visible
                }
            }
            Item {
                transform: Transform { matrix: component4.transform }
                Rectangle {
                    color: "orange"
                    width: 20; height: 20
                    visible: Global.debugging & Global.show_tags & component4.visible
                }
            }
            Item {
                transform: Transform { matrix: component5.transform }
                Rectangle {
                    color: "orange"
                    width: 20; height: 20
                    visible: Global.debugging & Global.show_tags & component5.visible
                }
            }

        }


        //This Item just contains methods used to place elements on the sheet
        //
        //The name of variables follow the rules :
        //t = top           b = bottom
        //l = left          r = right
        //v = vertical      h = horizontal
        Item {
            id: coordinates
            property vector3d tl : sheetTopLeft.center
            property vector3d bl : sheetBottomLeft.center
            property vector3d tr : sheetTopRight.center
            property vector3d br : sheetBottomRight.center

            function getX(h,v) {
                return detection.projectionMatrix.times(
                                          tl
                                          .plus(tr.minus(tl).times(h).times(1-v))
                                          .plus(br.minus(bl).times(h).times(v))
                                          .plus(bl.minus(tl).times(v))
                                      ).x
            }

            function getY(h,v) {
                return detection.projectionMatrix.times(
                                          tl
                                          .plus(tr.minus(tl).times(h).times(1.-v))
                                          .plus(br.minus(bl).times(h).times(v))
                                          .plus(bl.minus(tl).times(v))
                                      ).y
            }

            function getRotation() {
                return Math.atan2(detection.projectionMatrix.times(tr).y-detection.projectionMatrix.times(tl).y,
                                  detection.projectionMatrix.times(tr).x-detection.projectionMatrix.times(tl).x)*180.0/Math.PI;
            }

            function getWidth(tlh,tlv,brh,brv) {
                return Math.sqrt(
                            (getX(tlh,tlv)-getX(brh,tlv))*(getX(tlh,tlv)-getX(brh,tlv))
                            +
                            (getY(tlh,tlv)-getY(brh,tlv))*(getY(tlh,tlv)-getY(brh,tlv))
                            )
            }

            function getHeight(tlh,tlv,brh,brv) {
                return Math.sqrt(
                            (getX(tlh,tlv)-getX(tlh,brv))*(getX(tlh,tlv)-getX(tlh,brv))
                            +
                            (getY(tlh,tlv)-getY(tlh,brv))*(getY(tlh,tlv)-getY(tlh,brv))
                            )
            }

        }

        //Title on the top of the sheet
        //
        //The name of variables follow the rules :
        //t = top           b = bottom
        //l = left          r = right
        //v = vertical      h = horizontal
        //
        //The item is placed by giving the horizontal and vertical coordinates of top left corner and bottom right corner
        Item {
            id: titleText
            visible: true

            property double tlh: 0.
            property double tlv: -0.1
            property double brh: 1.
            property double brv: 0.
            x: coordinates.getX(tlh,tlv)
            y: coordinates.getY(tlh,tlv)
            width: coordinates.getWidth(tlh,tlv,brh,brv)
            height: coordinates.getHeight(tlh,tlv,brh,brv)
            rotation: coordinates.getRotation()
            transformOrigin: Item.TopLeft

            Rectangle {
                color: "transparent"
                border.color: "blue"
                border.width: 4
                anchors.fill: parent
                visible: Global.debugging & Global.show_blue_rectangles
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

        //Blue rectangle around the main character
        //
        //The name of variables follow the rules :
        //t = top           b = bottom
        //l = left          r = right
        //v = vertical      h = horizontal
        //
        //The item is placed by giving the horizontal and vertical coordinates of top left corner and bottom right corner
        Item {
            id: mainCharacter

            property double tlh: 0.46
            property double tlv: -0.02
            property double brh: 0.57
            property double brv: 0.12
            x: coordinates.getX(tlh,tlv)
            y: coordinates.getY(tlh,tlv)
            width: coordinates.getWidth(tlh,tlv,brh,brv)
            height: coordinates.getHeight(tlh,tlv,brh,brv)
            rotation: coordinates.getRotation()
            transformOrigin: Item.TopLeft

            Rectangle {
                color: "transparent"
                border.color: "blue"
                border.width: 4
                anchors.fill: parent
                visible: Global.debugging & Global.show_blue_rectangles
            }

        }

        //The left half of the main character
        //
        //The name of variables follow the rules :
        //t = top           b = bottom
        //l = left          r = right
        //v = vertical      h = horizontal
        //
        //The item is placed by giving the horizontal and vertical coordinates of top left corner and bottom right corner
        Item {
            id: leftCharacter
            visible: deconstructionCard.visible

            property double tlh: 0.15
            property double tlv: 0.2
            property double brh: 0.2
            property double brv: 0.3
            x: coordinates.getX(tlh,tlv)
            y: coordinates.getY(tlh,tlv)
            width: coordinates.getWidth(tlh,tlv,brh,brv)
            height: coordinates.getHeight(tlh,tlv,brh,brv)
            rotation: coordinates.getRotation()
            transformOrigin: Item.TopLeft

            Rectangle {
                color: "transparent"
                border.color: "blue"
                border.width: 4
                anchors.fill: parent
                visible: Global.debugging & Global.show_blue_rectangles
            }

            Text {
                font.pointSize: 42
                text: "女"
                anchors.centerIn: parent
                visible: parent.visible
            }

        }


        //The right half of the  main character
        //
        //The name of variables follow the rules :
        //t = top           b = bottom
        //l = left          r = right
        //v = vertical      h = horizontal
        //
        //The item is placed by giving the horizontal and vertical coordinates of top left corner and bottom right corner
        Item {
            id: rightCharacter
            visible: deconstructionCard.visible

            property double tlh: 0.83
            property double tlv: 0.2
            property double brh: 0.88
            property double brv: 0.3
            x: coordinates.getX(tlh,tlv)
            y: coordinates.getY(tlh,tlv)
            width: coordinates.getWidth(tlh,tlv,brh,brv)
            height: coordinates.getHeight(tlh,tlv,brh,brv)
            rotation: coordinates.getRotation()
            transformOrigin: Item.TopLeft

            Rectangle {
                color: "transparent"
                border.color: "blue"
                border.width: 4
                anchors.fill: parent
                visible: Global.debugging & Global.show_blue_rectangles
            }

            Text {
                font.pointSize: 42
                text: "马"
                anchors.centerIn: parent
                visible: parent.visible
            }

        }

        //A possible composition
        //
        //The name of variables follow the rules :
        //t = top           b = bottom
        //l = left          r = right
        //v = vertical      h = horizontal
        //
        //The item is placed by giving the horizontal and vertical coordinates of top left corner and bottom right corner
        Item {
            id: leftCharacterChild1
            visible: true
            property double tlh: -0.03
            property double tlv: 0.51
            property double brh: 0.07
            property double brv: 0.67
            x: coordinates.getX(tlh,tlv)
            y: coordinates.getY(tlh,tlv)
            width: coordinates.getWidth(tlh,tlv,brh,brv)
            height: coordinates.getHeight(tlh,tlv,brh,brv)
            rotation: coordinates.getRotation()
            transformOrigin: Item.TopLeft

            Rectangle {
                color: "transparent"
                border.color: "blue"
                border.width: 4
                anchors.fill: parent
                visible: Global.debugging & Global.show_blue_rectangles
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


        //A possible composition
        //
        //The name of variables follow the rules :
        //t = top           b = bottom
        //l = left          r = right
        //v = vertical      h = horizontal
        //
        //The item is placed by giving the horizontal and vertical coordinates of top left corner and bottom right corner
        Item {
            id: leftCharacterChild2
            visible: true
            property double tlh: 0.1
            property double tlv: 0.51
            property double brh: 0.20
            property double brv: 0.67
            x: coordinates.getX(tlh,tlv)
            y: coordinates.getY(tlh,tlv)
            width: coordinates.getWidth(tlh,tlv,brh,brv)
            height: coordinates.getHeight(tlh,tlv,brh,brv)
            rotation: coordinates.getRotation()
            transformOrigin: Item.TopLeft

            Rectangle {
                color: "transparent"
                border.color: "blue"
                border.width: 4
                anchors.fill: parent
                visible: Global.debugging & Global.show_blue_rectangles
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


        //A possible composition
        //
        //The name of variables follow the rules :
        //t = top           b = bottom
        //l = left          r = right
        //v = vertical      h = horizontal
        //
        //The item is placed by giving the horizontal and vertical coordinates of top left corner and bottom right corner
        Item {
            id: leftCharacterChild3
            visible: true
            property double tlh: 0.23
            property double tlv: 0.51
            property double brh: 0.33
            property double brv: 0.67
            x: coordinates.getX(tlh,tlv)
            y: coordinates.getY(tlh,tlv)
            width: coordinates.getWidth(tlh,tlv,brh,brv)
            height: coordinates.getHeight(tlh,tlv,brh,brv)
            rotation: coordinates.getRotation()
            transformOrigin: Item.TopLeft

            Rectangle {
                color: "transparent"
                border.color: "blue"
                border.width: 4
                anchors.fill: parent
                visible: Global.debugging & Global.show_blue_rectangles
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


        //A possible composition
        //
        //The name of variables follow the rules :
        //t = top           b = bottom
        //l = left          r = right
        //v = vertical      h = horizontal
        //
        //The item is placed by giving the horizontal and vertical coordinates of top left corner and bottom right corner
        Item {
            id: leftCharacterChild4
            visible: true
            property double tlh: 0.35
            property double tlv: 0.51
            property double brh: 0.45
            property double brv: 0.67
            x: coordinates.getX(tlh,tlv)
            y: coordinates.getY(tlh,tlv)
            width: coordinates.getWidth(tlh,tlv,brh,brv)
            height: coordinates.getHeight(tlh,tlv,brh,brv)
            rotation: coordinates.getRotation()
            transformOrigin: Item.TopLeft

            Rectangle {
                color: "transparent"
                border.color: "blue"
                border.width: 4
                anchors.fill: parent
                visible: Global.debugging & Global.show_blue_rectangles
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


        //A possible composition
        //
        //The name of variables follow the rules :
        //t = top           b = bottom
        //l = left          r = right
        //v = vertical      h = horizontal
        //
        //The item is placed by giving the horizontal and vertical coordinates of top left corner and bottom right corner
        Item {
            id: leftCharacterChild5
            property double tlh: 0.47
            property double tlv: 0.51
            property double brh: 0.57
            property double brv: 0.67
            x: coordinates.getX(tlh,tlv)
            y: coordinates.getY(tlh,tlv)
            width: coordinates.getWidth(tlh,tlv,brh,brv)
            height: coordinates.getHeight(tlh,tlv,brh,brv)
            rotation: coordinates.getRotation()
            transformOrigin: Item.TopLeft


            Rectangle {
                color: "transparent"
                border.color: "blue"
                border.width: 4
                anchors.fill: parent
                visible: Global.debugging & Global.show_blue_rectangles
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

    }


}
