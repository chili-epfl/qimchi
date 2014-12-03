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
        return empty
    }

    property alias empty: empty
    property alias red1: red1
    property alias red2: red2
    property alias red3: red3
    property alias blue1: blue1
    property alias blue2: blue2
    property alias blue3: blue3

    //We define a state to know which exercise is being used.
    //The state changes when a new sheet appears
    state: "EMPTY"

    states: [
        State {name: "EMPTY"; StateChangeScript {script: app.reset()}},
        State {name: "RED1"; StateChangeScript {script: app.reset()}},
        State {name: "RED2"; StateChangeScript {script: app.reset()}},
        State {name: "RED3"; StateChangeScript {script: app.reset()}},
        State {name: "BLUE1"; StateChangeScript {script: app.reset()}},
        State {name: "BLUE2"; StateChangeScript {script: app.reset()}},
        State {name: "BLUE3"; StateChangeScript {script: app.reset()}}
    ]

    ExerciseEmptyTemplate { id: empty }
    ExerciseRed1 { id: red1 }
    ExerciseRed2 { id: red2 }
    ExerciseRed3 { id: red3 }
    ExerciseBlue1 { id: blue1 }
    ExerciseBlue2 { id: blue2 }
    ExerciseBlue3 { id: blue3 }

}
