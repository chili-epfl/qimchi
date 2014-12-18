import QtQuick 2.0

Item {

    //We implement the function giving the id of the current exercise
    function getCurrent(){
        if(state==="RED1"){return red1}
        if(state==="RED2"){return red2}
        if(state==="RED3"){return red3}
        if(state==="BLUE1"){return blue1}
        if(state==="BLUE2"){return blue2}
        if(state==="BLUE3"){return blue3}
        if(state==="YELLOW1"){return yellow1}
        if(state==="YELLOW2"){return yellow2}
        if(state==="YELLOW3"){return yellow3}
        return empty
    }


    property alias empty: empty
    property alias red1: red1
    property alias red2: red2
    property alias red3: red3
    property alias blue1: blue1
    property alias blue2: blue2
    property alias blue3: blue3
    property alias yellow1: yellow1
    property alias yellow2: yellow2
    property alias yellow3: yellow3

    //We define a state to know which exercise is being used.
    //The state changes when a new sheet appears
    state: "EMPTY"

    states: [
        State {name: "EMPTY"; StateChangeScript {script: reset()}},
        State {name: "RED1"; StateChangeScript {script: reset()}},
        State {name: "RED2"; StateChangeScript {script: reset()}},
        State {name: "RED3"; StateChangeScript {script: reset()}},
        State {name: "BLUE1"; StateChangeScript {script: reset()}},
        State {name: "BLUE2"; StateChangeScript {script: reset()}},
        State {name: "BLUE3"; StateChangeScript {script: reset()}},
        State {name: "YELLOW1"; StateChangeScript {script: reset()}},
        State {name: "YELLOW2"; StateChangeScript {script: reset()}},
        State {name: "YELLOW3"; StateChangeScript {script: reset()}}
    ]

    ExerciseEmptyTemplate { id: empty }
    ExerciseRed1 { id: red1 }
    ExerciseRed2 { id: red2 }
    ExerciseRed3 { id: red3 }
    ExerciseBlue1 { id: blue1 }
    ExerciseBlue2 { id: blue2 }
    ExerciseBlue3 { id: blue3 }
    ExerciseYellow1 { id: yellow1 }
    ExerciseYellow2 { id: yellow2 }
    ExerciseYellow3 { id: yellow3 }

    function reset(){
        main.state = "CONSTRUCTION_LEFT"
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
        characters.component13.visible = false
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
        componentbox.component13_constructed = false
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


}
