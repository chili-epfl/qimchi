import QtQuick 2.0

Item {

    function getCurrent(){
        if(state==="RED1"){return red1}
        if(state==="RED2"){return red2}
        if(state==="RED3"){return red3}
        return empty
    }

    property alias red1: red1
    property alias red2: red2
    property alias red3: red3

    state: "EMPTY"

    states: [
        State {name: "EMPTY"; StateChangeScript {script: app.reset()}},
        State {name: "RED1"; StateChangeScript {script: app.reset()}},
        State {name: "RED2"; StateChangeScript {script: app.reset()}},
        State {name: "RED3"; StateChangeScript {script: app.reset()}}
    ]

    ExerciseEmptyTemplate { id: empty }
    ExerciseRed1 { id: red1 }
    ExerciseRed2 { id: red2 }
    ExerciseRed3 { id: red3 }

}
