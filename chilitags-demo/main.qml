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
                text: qsTr("Reset")
                onTriggered: {
                    main.state = "INITIAL"
                    ch1.visible = false
                    ch2.visible = false
                    ch3.visible = false
                    ch4.visible = false
                    ch5.visible = false
            }
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
        // When this card appears we reveals the new constructions
        // If the five possibilities have been found we change state to
        //continue the exercise on the right side
        ChilitagsObject {
            id: constructionCard
            name: "tag_0"
            property vector3d center : transform.times(parent.tagCenter)
            onVisibilityChanged: {
                if(main.state == "CONSTRUCTION_LEFT"){
                    if(constructionCard.visible){
                        console.log("constructionCard visible")
                        if(selected_component.state == "CH1") {
                            ch1.visible = true
                        }
                        if(selected_component.state == "CH2") {
                            ch2.visible = true
                        }
                        if(selected_component.state == "CH3") {
                            ch3.visible = true
                        }
                        if(selected_component.state == "CH4") {
                            ch4.visible = true
                        }
                        if(selected_component.state == "CH5") {
                            ch5.visible = true
                        }

                        if(ch1.visible &
                                ch2.visible &
                                ch3.visible &
                                ch4.visible &
                                ch5.visible) {
                            main.state = "EXERCISE_1_COMPLETE"
                        }
                    }
                }
            }
        }
        ChilitagsObject {
            id: deconstructionCard
            name: "tag_1"
            property vector3d center : transform.times(parent.tagCenter)
            onVisibilityChanged: {
                if(main.state == "INITIAL"){
                    if(deconstructionCard.visible){
                        main.state = "CONSTRUCTION_LEFT"
                        console.log("deconstructionCard visible")
                    }
                }
            }
        }
        ChilitagsObject {
            id: wordCombinationCard
            name: "tag_2"
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: pinyinCard
            name: "tag_3"
            property vector3d center : transform.times(parent.tagCenter)
        }


        // We declare tags for the components (orange cards)
        // We use the onVisibilityChanged method to change the display
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


        //We declare the tags for the radicals selector
        ChilitagsObject {
            id: selectorTopLeft
            name: "tag_167"
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: selectorTopRight
            name: "tag_168"
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: selectorBottomLeft
            name: "tag_170"
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: selectorBottomRight
            name: "tag_169"
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: selectorCursor
            name: "tag_171"
            property vector3d center : transform.times(parent.tagCenter)
            onVisibilityChanged: {
                if(true) { //main.state == "INITIAL"){
                    if(selectorCursor.visible){
                        main.state = "CONSTRUCTION_RIGHT"
                        console.log("selectorCursor visible")
                    }
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
        id: main

        // Reduce everything inside to half size.
        transform: Scale {xScale: .5; yScale:.5}


        state: "INITIAL"




        //We define states for the exercise
        states: [
            State {
                name: "INITIAL"
                PropertyChanges {
                    target: titleText
                    text: "Deconstruct the character"
                }
            },
            State {
                name: "CONSTRUCTION_LEFT"
                PropertyChanges {
                    target: titleText
                    text: "Find which components go whith 女"
                }
                PropertyChanges {
                    target: leftCharacter
                    visible:true
                    color: "blue"
                    font.pointSize: 64
                }
                PropertyChanges {
                    target: rightCharacter
                    visible:true
                }
            },
            State {
                name: "EXERCISE_1_COMPLETE"
                PropertyChanges {
                    target: titleText
                    text: "You have completed the first exercise"
                }
                PropertyChanges {
                    target: rightCharacter
                    visible:true
                }
                PropertyChanges {
                    target: leftCharacter
                    visible:true
                }
            },
            State {
                name: "CONSTRUCTION_RIGHT"
                PropertyChanges {
                    target: titleText
                    text: "Find which radicals go whith 马"
                }
                PropertyChanges {
                    target: rightCharacter
                    visible:true
                    color: "blue"
                    font.pointSize: 64
                }
                PropertyChanges {
                    target: leftCharacter
                    visible:true
                }
            }
        ]






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

            Text {
                id: text_pinyin
                visible: pinyinCard.visible
                transform: Transform { matrix: pinyinCard.transform }
                x:0; y:20
                text: ""

            }




            //This text displays "ready" on one of the visible component card
            //Only the component card with ready on it will be activated by the function cards
            //When two are visible at the same time the selected one will be the smallest rank
            //
            //This item also makes the character of the selected component appear green
            //and manages the right text on pinyinCards and wordCombinationCard
            Text {
                id: selected_component
                visible: main.state == "CONSTRUCTION_LEFT"
                text: "ready"
                color: "blue"
                font.pointSize: 8
                x: 0; y: 20
                state: "NORMAL"
                transform: Transform {
                    id: selected_component_transform
                }

                states: [
                    State {
                        name: "NORMAL"
                        PropertyChanges{
                            target: selected_component
                            visible: false
                        }
                    },
                    State {
                        name: "CH1"
                        when: component1.visible
                        PropertyChanges {
                            target: selected_component_transform
                            matrix: component1.transform
                        }
                        PropertyChanges {
                            target: ch1
                            color: "green"
                        }
                        PropertyChanges {
                            target: text_pinyin
                            text: "hao (3)"
                        }
                    },
                    State {
                        name: "CH2"
                        when: component2.visible
                        PropertyChanges {
                            target: selected_component_transform
                            matrix: component2.transform
                        }
                        PropertyChanges {
                            target: ch2
                            color: "green"
                        }
                        PropertyChanges {
                            target: text_pinyin
                            text: "xing (4)"
                        }
                    },
                    State {
                        name: "CH3"
                        when: component3.visible
                        PropertyChanges {
                            target: selected_component_transform
                            matrix: component3.transform
                        }
                        PropertyChanges {
                            target: ch3
                            color: "green"
                        }
                        PropertyChanges {
                            target: text_pinyin
                            text: "jie (3)"
                        }
                    },
                    State {
                        name: "CH4"
                        when: component4.visible
                        PropertyChanges {
                            target: selected_component_transform
                            matrix: component4.transform
                        }
                        PropertyChanges {
                            target: ch4
                            color: "green"
                        }
                        PropertyChanges {
                            target: text_pinyin
                            text: "ta (1)"
                        }
                    },
                    State {
                        name: "CH5"
                        when: component5.visible
                        PropertyChanges {
                            target: selected_component_transform
                            matrix: component5.transform
                        }
                        PropertyChanges {
                            target: ch5
                            color: "green"
                        }
                        PropertyChanges {
                            target: text_pinyin
                            text: "yao (4)"
                        }
                    },
                    State {
                        name: "CH6"
                        when: component6.visible
                        PropertyChanges {
                            target: selected_component_transform
                            matrix: component5.transform
                        }
                    },
                    State {
                        name: "CH7"
                        when: component7.visible
                        PropertyChanges {
                            target: selected_component_transform
                            matrix: component5.transform
                        }
                    },
                    State {
                        name: "CH8"
                        when: component8.visible
                        PropertyChanges {
                            target: selected_component_transform
                            matrix: component5.transform
                        }
                    }
                ]
            }

            Text {
                id: selected_radical
                color: "blue"
                visible: selectorCursor.visible

                property vector3d stl: selectorTopLeft.center
                property vector3d str: selectorTopRight.center
                property vector3d cursor: selectorCursor.center

                function f(){
                    return ((cursor.minus(stl)).dotProduct(str.minus(stl))/(str.minus(stl)).length())
                }


                text: {
                    //Compute position of the cursor

                    //console.log("cursor : " + f())

                    return "X"
                }
                transform: Transform { matrix: selectorTopLeft.transform }
                x:50; y:0
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
                id: titleText
                color: "blue"
                font.pointSize: 32
                text: ""
                anchors.centerIn: parent
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
                id: leftCharacter
                font.pointSize: 42
                text: "女"
                anchors.centerIn: parent
                visible: false
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
                id: rightCharacter
                font.pointSize: 42
                text: "马"
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
                font.pointSize: 64
                text: "要"
                anchors.centerIn: parent
                visible: false
            }

        }

    }


}
