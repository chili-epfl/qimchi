import QtQuick 2.3
import QtQuick.Window 2.0
import QtMultimedia 5.1
import QtQuick.Controls 1.0
import Chilitags 1.0
import "Coordinates.js" as Coordinates

//We decide which language to use
import "StringFr.js" as Str
//import "StringEn.js" as Str

ApplicationWindow {
    visible: true
    id:app
    visibility: "FullScreen"
    color: "black"
    //Settings for a "normal" window
    //width: 1280
    //height: 960

    ExerciseSelector{
        id:exercise
    }

    title: { exercise.getCurrent().name + " : " + exercise.getCurrent().main_character }

    //The menu bar with two options
    //reset : for restarting the Exercise
    //exit : to close the application
    menuBar: MenuBar {
        Menu {
            title: Str.file
            MenuItem {
                text: Str.reset
                onTriggered: {exercise.reset()}
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

        ChilitagsObject {
            id: blue1_top_left
            name: exercise.blue1.top_left_tag
            onVisibilityChanged: {if(blue1_top_left.visible){exercise.state="BLUE1"}}
            property vector3d center : transform.times(parent.tagCenter)
        }

        ChilitagsObject {
            id: blue2_top_left
            name: exercise.blue2.top_left_tag
            onVisibilityChanged: {if(blue2_top_left.visible){exercise.state="BLUE2"}}
            property vector3d center : transform.times(parent.tagCenter)
        }

        ChilitagsObject {
            id: blue3_top_left
            name: exercise.blue3.top_left_tag
            onVisibilityChanged: {if(blue3_top_left.visible){exercise.state="BLUE3"}}
            property vector3d center : transform.times(parent.tagCenter)
        }

        ChilitagsObject {
            id: yellow1_top_left
            name: exercise.yellow1.top_left_tag
            onVisibilityChanged: {if(yellow1_top_left.visible){exercise.state="YELLOW1"}}
            property vector3d center : transform.times(parent.tagCenter)
        }

        ChilitagsObject {
            id: yellow2_top_left
            name: exercise.yellow2.top_left_tag
            onVisibilityChanged: {if(yellow2_top_left.visible){exercise.state="YELLOW2"}}
            property vector3d center : transform.times(parent.tagCenter)
        }

        ChilitagsObject {
            id: yellow3_top_left
            name: exercise.yellow3.top_left_tag
            onVisibilityChanged: {if(yellow3_top_left.visible){exercise.state="YELLOW3"}}
            property vector3d center : transform.times(parent.tagCenter)
        }



        // We declare tags for the function cards
        ChilitagsObject {
            id: constructionCardRecto
            name: "tag_0"
            property vector3d center : transform.times(parent.tagCenter)
            onVisibilityChanged: {
                //The detection of a filp uses the latency of the tag detection.
                //We consider a flip occured when the two faces of the construction
                //card are visible at the same time. As for now chilitags detection
                //of disappearance is always slower.
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
                    exercise.reset()
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
            name: exercise.getCurrent().component1.tag
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: component2
            name: exercise.getCurrent().component2.tag
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: component3
            name: exercise.getCurrent().component3.tag
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: component4
            name: exercise.getCurrent().component4.tag
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: component5
            name: exercise.getCurrent().component5.tag
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: component6
            name: exercise.getCurrent().component6.tag
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: component7
            name: exercise.getCurrent().component7.tag
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: component8
            name: exercise.getCurrent().component8.tag
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: component9
            name: exercise.getCurrent().component9.tag
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: component10
            name: exercise.getCurrent().component10.tag
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: component11
            name: exercise.getCurrent().component11.tag
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: component12
            name: exercise.getCurrent().component12.tag
            property vector3d center : transform.times(parent.tagCenter)
        }
        ChilitagsObject {
            id: component13
            name: exercise.getCurrent().component13.tag
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
        anchors.centerIn:parent
        visible:true
        // Reduce everything inside to half size.
        transform: Scale {xScale: .5; yScale:.5}
        x:50;y:50
        rotation: 180
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
                    target: chright; visible:false
                }
                PropertyChanges {
                    target: chleft; visible:false
                }
            },
            State {
                name: "CONSTRUCTION_LEFT"
                PropertyChanges {
                    target: chleft.child
                    color: "blue"
                    font.pointSize: 48
                }
            },
            State {
                name: "CONSTRUCTION_RIGHT"
                PropertyChanges {
                    target: chright.child
                    color: "blue"
                    font.pointSize: 48
                }
            }
        ]

        // A video feedback of the camera
        VideoOutput {
            visible: true
            id: video
            anchors.centerIn: parent
            //anchors.top: parent.top
            //anchors.left: parent.left
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
            child.text: {
                main.state=="INITIAL"?Str.main_initial:
                main.state=="CONSTRUCTION_LEFT"?Str.main_left + exercise.getCurrent().left_part_character + " ?":
                main.state=="CONSTRUCTION_RIGHT"?Str.main_right + exercise.getCurrent().right_part_character + " ?":
                ""
            }
            child.color: "blue"
            child.font.pointSize: 28
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

        //We give instruction about whih card to use at all time
        MyItem {
            id: displayInstruction
            visible:true
            x_cm: 9.2
            y_cm: 11.5
            height: 250; width: 250
            child.text:{
                main.state=="CONSTRUCTION_LEFT"?
                    componentbox.state=="NONE"?componentbox.allFound()?Str.well_done:Str.use_component:
                    componentbox.state=="TOOMUCH"?componentbox.allFound()?Str.well_done:Str.too_much:
                    hintbox.state=="WAITING_HINT"?componentbox.allFound()?Str.well_done:Str.correct_choice:
                    hintbox.state=="WAITING_CONSTRUCTION"?componentbox.allFound()?Str.well_done:Str.use_construction:
                    hintbox.state=="CONSTRUCTION"?componentbox.allFound()?Str.well_done:Str.flip_card:
                    hintbox.state=="WRONG"?componentbox.allFound()?Str.well_done:Str.change_component:
                "":
                main.state=="CONSTRUCTION_RIGHT"?
                    radicalbox.state=="NO_SELECTOR"?radicalbox.allFound()?Str.well_done:Str.use_radical:
                    hintbox.state=="WAITING_HINT"?
                        radicalbox.getRadical().ismain?Str.ismain:
                        radicalbox.allFound()?Str.well_done:
                        Str.correct_choice:
                    hintbox.state=="WAITING_CONSTRUCTION"?radicalbox.allFound()?Str.well_done:Str.use_construction:
                    hintbox.state=="CONSTRUCTION"?radicalbox.allFound()?Str.well_done:Str.flip_card:
                    hintbox.state=="WRONG"?radicalbox.allFound()?Str.well_done:Str.change_radical:
                "":
                Str.use_start
            }
            child.font.pointSize:24
        }

        //We give feedback about which component is selected for construction or
        //whether the component is correct or not if already constructed
        MyItem {
            id: displaySelection
            visible: {
                main.state=="CONSTRUCTION_LEFT"?!componentbox.allFound():
                main.state=="CONSTRUCTION_RIGHT"?!radicalbox.allFound():
                true
            }
            x_cm: 9.2
            y_cm: 9
            height: 250; width: 250
            child.font.pointSize: 42
            child.text:{
                main.state=="CONSTRUCTION_LEFT"?componentbox.getSelection():
                main.state=="CONSTRUCTION_RIGHT"?radicalbox.getSelection():
                ""
            }
            Image {
                anchors.centerIn:parent
                visible: parent.child.text==" "
                source: {
                    visible?
                    main.state=="CONSTRUCTION_LEFT"?
                        componentbox.getComponent().nonwritable:
                        radicalbox.getComponent().nonwritable:
                    ""
                }
            }

        }

        //We display word combination, pinyin or stroke order when one of
        //the hint card is used
        MyItem {
            id: displayHint
            visible:true
            x_cm: 9.2
            y_cm: 11.5
            height: 250; width: 250
            child.text:{
                main.state=="CONSTRUCTION_LEFT"?
                    hintbox.state=="PINYIN_PRONUNCIATION"?componentbox.getPinyin():
                    hintbox.state=="WORD_COMBINATION"?componentbox.getWord():
                "":
                main.state=="CONSTRUCTION_RIGHT"?
                    hintbox.state=="PINYIN_PRONUNCIATION"?radicalbox.getPinyin():
                    hintbox.state=="WORD_COMBINATION"?radicalbox.getWord():
                "":
                ""
            }
            child.font.pointSize:42
            //We use Audio to play the pronunciation of the characters
            Audio {
                id: playSound
                source: {
                    hintbox.state=="PINYIN_PRONUNCIATION"?
                    main.state=="CONSTRUCTION_LEFT"?
                        componentbox.getSound():
                        radicalbox.getSound():
                    ""
                }
                //onStopped: {source = ""}
                autoPlay: true
            }
            //We use AnimatedImage to display the stroke order with a gif file
            AnimatedImage {
                z:2
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
            child.text: Str.success + count
            child.font.pointSize: 32
            child.color: "green"
        }

        MyItem {
            visible:true
            id: mistakes
            x_cm:32;y_cm:6
            property int count:0
            child.text: Str.mistakes + count
            child.font.pointSize: 32
            child.color: "red"
        }

        MyItem {
            visible:true
            x_cm:32; y_cm:9
            property int rate : 100 * (success.count+2) / (2+success.count+mistakes.count)
            child.text: Str.rate + rate + "%"
            child.font.pointSize: 32
            child.color: {return rate<30?"red":rate<60?"orange":rate<80?"yellow":"green"}
        }

    }

}
