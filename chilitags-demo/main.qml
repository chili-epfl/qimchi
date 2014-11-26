import QtQuick 2.3
import QtQuick.Window 2.0
import QtMultimedia 5.1
import QtQuick.Controls 1.0
import Chilitags 1.0
import "Coordinates.js" as Coordinates

//We decide which language to use
//import "StringFr.js" as Str
import "StringEn.js" as Str

ApplicationWindow {
    visible: true
    id:app
    //visibility: "FullScreen"
    color: "black"
    //Settings for a "normal" window
    width: 1280
    height: 960

    ExerciseSelector{
        id:exercise
    }

    title: exercise.getCurrent().main_character

    function reset(){
        main.state = "INITIAL"
        characters.component1.visible = false
        characters.component2.visible = false
        characters.component3.visible = false
        characters.component4.visible = false
        characters.component5.visible = false
        characters.component6.visible = false
        characters.component7.visible = false
        characters.component8.visible = false
        characters.component9.visible = false
        characters.component10.visible = false
        characters.component11.visible = false
        characters.component12.visible = false
        characters.radical1.visible = false
        characters.radical2.visible = false
        characters.radical3.visible = false
        characters.radical4.visible = false
        characters.radical5.visible = false
        characters.radical6.visible = false
        characters.radical7.visible = false
        characters.radical8.visible = false
        componentbox.component1_constructed = false
        componentbox.component2_constructed = false
        componentbox.component3_constructed = false
        componentbox.component4_constructed = false
        componentbox.component5_constructed = false
        componentbox.component6_constructed = false
        componentbox.component7_constructed = false
        componentbox.component8_constructed = false
        componentbox.component9_constructed = false
        componentbox.component10_constructed = false
        componentbox.component11_constructed = false
        componentbox.component12_constructed = false
        radicalbox.radical1_constructed = false
        radicalbox.radical2_constructed = false
        radicalbox.radical3_constructed = false
        radicalbox.radical4_constructed = false
        radicalbox.radical5_constructed = false
        radicalbox.radical6_constructed = false
        radicalbox.radical7_constructed = false
        radicalbox.radical8_constructed = false
        mistakes.count = 0
        success.count = 0
    }


    menuBar: MenuBar {
        Menu {
            title: Str.file
            MenuItem {
                text: Str.start
                onTriggered: camera.start()
            }
            MenuItem {
                text: Str.stop
                onTriggered: camera.stop()
            }
            MenuItem {
                text: Str.reset
                onTriggered: {reset()}
            }
            MenuItem {
                text: Str.exit
                visible:true
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

        //We define Chilitags objects for the topleft corner of each different exercise
        //with onVisibilityChanged function that changes the state of ExerciseSelector
        ChilitagsObject {
            id: red1_top_left
            name: exercise.red1.top_left_tag
            onVisibilityChanged: {if(red1_top_left.visible){exercise.state="RED1"}}
            property vector3d center : transform.times(parent.tagCenter)
        }

        ChilitagsObject {
            id: red2_top_left
            name: exercise.red2.top_left_tag
            onVisibilityChanged: {if(red2_top_left.visible){exercise.state="RED2"}}
            property vector3d center : transform.times(parent.tagCenter)
        }

        ChilitagsObject {
            id: red3_top_left
            name: exercise.red3.top_left_tag
            onVisibilityChanged: {if(red3_top_left.visible){exercise.state="RED3"}}
            property vector3d center : transform.times(parent.tagCenter)
        }



        // We declare tags for the function cards
        ChilitagsObject {
            id: constructionCardRecto
            name: "tag_0"
            property vector3d center : transform.times(parent.tagCenter)
            onVisibilityChanged: {
                if(constructionCardVerso.visible & constructionCardRecto.visible){
                    if(main.state === "CONSTRUCTION_LEFT"){componentbox.flip()}
                    if(main.state === "CONSTRUCTION_RIGHT"){radicalbox.flip()}
                }
            }
        }
        ChilitagsObject {
            id: constructionCardVerso
            name: "tag_1"
            property vector3d center : transform.times(parent.tagCenter)
            onVisibilityChanged: {
                if(constructionCardVerso.visible & constructionCardRecto.visible){
                    if(main.state === "CONSTRUCTION_LEFT"){componentbox.flip()}
                    if(main.state === "CONSTRUCTION_RIGHT"){radicalbox.flip()}
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
        ChilitagsObject {
            id: strokeOrderCard
            name: "tag_9"
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: startCard
            name: "tag_5"
            property vector3d center : transform.times(parent.tagCenter)
            onVisibilityChanged: {
                if(main.state == "INITIAL"){
                    if(startCard.visible){main.state = "CONSTRUCTION_LEFT"}
                }
            }
        }
        ChilitagsObject {
            id: resetCard
            name: "tag_6"
            property vector3d center : transform.times(parent.tagCenter)
            onVisibilityChanged: {
                if(resetCard.visible){
                    reset()
                }
            }
        }
        ChilitagsObject {
            id: switchToComponent
            name: "tag_7"
            property vector3d center : transform.times(parent.tagCenter)
            onVisibilityChanged: {
                if(main.state == "CONSTRUCTION_RIGHT"){
                    if(switchToComponent.visible){main.state = "CONSTRUCTION_LEFT"}
                }
            }
        }

        ChilitagsObject {
            id: switchToRadicals
            name: "tag_8"
            property vector3d center : transform.times(parent.tagCenter)
            onVisibilityChanged: {
                if(main.state == "CONSTRUCTION_LEFT"){
                    if(switchToRadicals.visible){main.state = "CONSTRUCTION_RIGHT"}
                }
            }
        }

        // We declare tags for the at most 12 components (orange cards)
        ChilitagsObject {
            id: component1
            name: exercise.getCurrent().component1_tag
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: component2
            name: exercise.getCurrent().component2_tag
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: component3
            name: exercise.getCurrent().component3_tag
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: component4
            name: exercise.getCurrent().component4_tag
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: component5
            name: exercise.getCurrent().component5_tag
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: component6
            name: exercise.getCurrent().component6_tag
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: component7
            name: exercise.getCurrent().component7_tag
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: component8
            name: exercise.getCurrent().component8_tag
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: component9
            name: exercise.getCurrent().component9_tag
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: component10
            name: exercise.getCurrent().component10_tag
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: component11
            name: exercise.getCurrent().component11_tag
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: component12
            name: exercise.getCurrent().component12_tag
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
        }


        // We declare tags for the basic sheet
        ChilitagsObject {
            id: sheetTopLeft
            name: exercise.getCurrent().top_left_tag
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: sheetTopRight
            name: exercise.getCurrent().top_right_tag
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: sheetBottomRight
            name: exercise.getCurrent().bottom_right_tag
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: sheetBottomLeft
            name: exercise.getCurrent().bottom_left_tag
            property vector3d center : transform.times(parent.tagCenter)
        }

    }

    // This Item is the main graphic container, where AR happens.
    // Inside this item, coordinates are in the input image referential,
    // i.e. in pixels, where 0,0 is the top left corner of the video
    Item {
        id: main
        anchors.fill:parent
        visible:true
        // Reduce everything inside to half size.
        transform: Scale {xScale: .5; yScale:.5}

        state: "INITIAL"

        //We define states for the different parts of the exercise
        //In chronological order :
        //  INITIAL
        //  CONSTRUCTION_LEFT
        //  LEFT_COMPLETED
        //  CONSTRUCTION_RIGHT
        //  RIGHT_COMPLETED
        states: [
            State {
                name: "INITIAL"
                PropertyChanges {
                    target: maintitle.child; text: Str.maintitle_initial
                }
                PropertyChanges {
                    target: chright; visible:false
                }
                PropertyChanges {
                    target: chleft; visible:false
                }
            },
            State {
                name: "CONSTRUCTION_LEFT"
                PropertyChanges {
                    target: maintitle.child; text: {
                        (characters.component1.visible & characters.component2.visible & characters.component3.visible & characters.component4.visible & characters.component5.visible)?
                            "Good ! You found all the components. \nChange exercise or use reset card.":
                            Str.maintitle_construction_left
                    }
                }
                PropertyChanges {
                    target: chleft.child
                    color: "blue"
                    font.pointSize: 64
                }
            },
            State {
                name: "LEFT_COMPLETED"
                PropertyChanges {
                    target: maintitle.child; text: Str.maintitle_left_completed
                }
            },
            State {
                name: "CONSTRUCTION_RIGHT"
                PropertyChanges {
                    target: maintitle.child;
                    text: {
                        (characters.component6.visible & characters.component7.visible)?
                            "Good ! You found all the radicals. \nChange exercise or use reset card.":
                            Str.maintitle_construction_right
                    }
                }
                PropertyChanges {
                    target: chright.child
                    color: "blue"
                    font.pointSize: 64
                }
            },
            State {
                name: "RIGHT_COMPLETED"
                PropertyChanges {
                    target: maintitle.child; text: Str.maintitle_right_completed
                }
            }
        ]

        // A video feedback of the camera
        VideoOutput {
            visible: true
            anchors.top: parent.top
            anchors.left: parent.left
            // The feedback has to be forwarded by the detection, because
            // cameras expect to have only one output surface
            source: detection
        }


        //This text displays "Ready" on the current selected component
        ComponentBox {
            visible: false
            id: componentbox
        }

        RadicalBox {
            visible: false
            id : radicalbox
        }

        HintBox {
            visible: false
            id: hintbox
        }

        //mainTitle is the text at the top of the sheet
        MyItem {
            id: maintitle
            visible: true
            x_cm: Coordinates.maintitle_X
            y_cm: Coordinates.maintitle_Y
            child.color: "blue"
            child.font.pointSize: 32
        }

        //chleft is the left part of the main character
        MyItem {
            id: chleft
            visible: true
            x_cm: exercise.getCurrent().left_part_X
            y_cm: exercise.getCurrent().left_part_Y
            child.font.pointSize: 42
            child.text: exercise.getCurrent().left_part_character
        }


        //chright is the right part of the main character
        MyItem {
            id: chright
            visible: true
            x_cm: exercise.getCurrent().right_part_X
            y_cm: exercise.getCurrent().right_part_Y
            child.font.pointSize: 42
            child.text: exercise.getCurrent().right_part_character
        }

        Characters {
            id : characters
        }

        MyItem {
            id: display
            visible:true
            x_cm: 9.5
            y_cm: 11.5
            height: 250; width: 250
            child.text:{
                main.state=="CONSTRUCTION_LEFT"?
                    componentbox.state=="NONE"?"<- Use a component card":
                    componentbox.state=="TOOMUCH"?"<- Chose only one component":
                    hintbox.state=="WAITING_HINT"?"Good ! \nUse an hint card ->\nor\n<- change component":
                    hintbox.state=="WAITING_CONSTRUCTION"?"Use the construction card ->":
                    hintbox.state=="CONSTRUCTION"?"Flip the card to construct ->":
                    hintbox.state=="PINYIN_PRONUNCIATION"?componentbox.getPinyin():
                    hintbox.state=="WORD_COMBINATION"?componentbox.getWord():
                    hintbox.state=="STROKE_ORDER"?"":
                "Wrong":
                main.state=="CONSTRUCTION_RIGHT"?
                    radicalbox.state=="NO_SELECTOR"?"Use the radical selector":
                    hintbox.state=="WAITING_HINT"?"Good ! \nUse an hint card ->\nor\n<- change component":
                    hintbox.state=="WAITING_CONSTRUCTION"?"Use the construction card ->":
                    hintbox.state=="CONSTRUCTION"?"Flip the card to construct ->":
                    hintbox.state=="PINYIN_PRONUNCIATION"?radicalbox.getPinyin():
                    hintbox.state=="WORD_COMBINATION"?radicalbox.getWord():
                    hintbox.state=="STROKE_ORDER"?"":
                "Wrong":
                "Welcome"
            }
            child.font.pointSize:24
            AnimatedImage {
                source: {
                    hintbox.state=="STROKE_ORDER"?
                    main.state=="CONSTRUCTION_LEFT"?
                        componentbox.getStrokes():
                        radicalbox.getStrokes():
                    ""
                }
                visible: hintbox.state==="STROKE_ORDER"
                asynchronous: true
                anchors.fill: parent
            }
        }


        //We define three texts to show #success, #mistakes and %rate
        MyItem {
            visible:true
            id: success
            x_cm: 32;y_cm: 3
            property int count:0
            child.text: "success : " + count
            child.font.pointSize: 32
            child.color: "green"
        }

        MyItem {
            visible:true
            id: mistakes
            x_cm:32;y_cm:6
            property int count:0
            child.text: "mistakes : " + count
            child.font.pointSize: 32
            child.color: "red"
        }

        MyItem {
            visible:true
            x_cm:32; y_cm:9
            property int rate : 100 * (success.count+2) / (2+success.count+mistakes.count)
            child.text: "rate : " + rate + "%"
            child.font.pointSize: 32
            child.color: {return rate<30?"red":rate<60?"orange":rate<80?"yellow":"green"}
        }

    }

}
