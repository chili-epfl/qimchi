import QtQuick 2.0
//import "test.js" as Exercise

//We decide which language to use
import "StringFr.js" as Str
//import "StringEn.js" as Str

Box {
    visible: (main.state == "CONSTRUCTION_RIGHT")

    property bool radical1_constructed : false
    property bool radical2_constructed : false
    property bool radical3_constructed : false
    property bool radical4_constructed : false
    property bool radical5_constructed : false
    property bool radical6_constructed : false
    property bool radical7_constructed : false
    property bool radical8_constructed : false

    x_cm: -10
    y_cm: 4
    height_cm: 12
    width_cm: 12

    state: {
        var r = getRatio()
        selectorCursor.visible?
        (r<0.19)?"RADICAL1":
        (r<0.29)?"RADICAL2":
        (r<0.40)?"RADICAL3":
        (r<0.51)?"RADICAL4":
        (r<0.63)?"RADICAL5":
        (r<0.74)?"RADICAL6":
        (r<0.84)?"RADICAL7":
                 "RADICAL8":
        "NO_SELECTOR"

    }


    property vector3d stl: detection.projectionMatrix.times(selectorTopLeft.center)
    property vector3d str: detection.projectionMatrix.times(selectorTopRight.center)
    property vector3d cursor: detection.projectionMatrix.times(selectorCursor.center)

    function getRatio(){
        //We compute the length from top left corner to top right corner (using the center of the tags)
        var totalLength = str.minus(stl).length()
        //We compute the length from top left corner to moving selector
        var selectedLength = cursor.minus(stl).length()
        //We compute the ratio of the projected length over the total length
        //We use dotproduct because x.y = cos(t)|x||y|
        //where cos(t)|x| is exactly the projected length of x on y
        var ratio = (str.minus(stl)).dotProduct(cursor.minus(stl))/(totalLength*totalLength)

        //Uncomment for debugging
        //console.log("total :"+totalLength+"  selected :"+ selectedLength +  "   ratio : " + ratio + " state : " + selected_radical.state)

        return ratio
    }

    function flip(){
        if(boxfunction.state=="CONSTRUCTION"){
            if(state=="RADICAL1"){radical1_constructed = true; characters.radical1.visible = isCorrect() & !getRadical().ismain}
            if(state=="RADICAL2"){radical2_constructed = true; characters.radical2.visible = isCorrect() & !getRadical().ismain}
            if(state=="RADICAL3"){radical3_constructed = true; characters.radical3.visible = isCorrect() & !getRadical().ismain}
            if(state=="RADICAL4"){radical4_constructed = true; characters.radical4.visible = isCorrect() & !getRadical().ismain}
            if(state=="RADICAL5"){radical5_constructed = true; characters.radical5.visible = isCorrect() & !getRadical().ismain}
            if(state=="RADICAL6"){radical6_constructed = true; characters.radical6.visible = isCorrect() & !getRadical().ismain}
            if(state=="RADICAL7"){radical7_constructed = true; characters.radical7.visible = isCorrect() & !getRadical().ismain}
            if(state=="RADICAL8"){radical8_constructed = true; characters.radical8.visible = isCorrect() & !getRadical().ismain}

            if(isCorrect()){success.count += 1}else{mistakes.count += 1}
        }
    }



    function alreadyConstructed(){
        if(state==="RADICAL1"){return radical1_constructed}
        if(state==="RADICAL2"){return radical2_constructed}
        if(state==="RADICAL3"){return radical3_constructed}
        if(state==="RADICAL4"){return radical4_constructed}
        if(state==="RADICAL5"){return radical5_constructed}
        if(state==="RADICAL6"){return radical6_constructed}
        if(state==="RADICAL7"){return radical7_constructed}
        if(state==="RADICAL8"){return radical8_constructed}
        return false
    }

    function notEmpty(){
        return (state != "NO_SELECTOR")
    }

    function getRadical(){
        if(state==="RADICAL1"){return exercise.getCurrent().radical1}
        if(state==="RADICAL2"){return exercise.getCurrent().radical2}
        if(state==="RADICAL3"){return exercise.getCurrent().radical3}
        if(state==="RADICAL4"){return exercise.getCurrent().radical4}
        if(state==="RADICAL5"){return exercise.getCurrent().radical5}
        if(state==="RADICAL6"){return exercise.getCurrent().radical6}
        if(state==="RADICAL7"){return exercise.getCurrent().radical7}
        if(state==="RADICAL8"){return exercise.getCurrent().radical8}
        return exercise.empty.radical1
    }

    function isCorrect(){
        return alreadyConstructed() & getRadical().correct
    }

    function isWrong(){
        return alreadyConstructed() & !getRadical().correct
    }

    function getPinyin(){
        return getRadical().pinyin
    }

    function getSound(){
        return getRadical().sound
    }

    function getSelection(){
        if(isCorrect()){return Str.correct}
        if(isWrong()){return Str.wrong}
        if(state=="NO_SELECTOR"){return ""}
        return getRadical().radical
    }

    function getWord(){
        return getRadical().word
    }

    function getStrokes(){
        return getRadical().stroke
    }

    function allFound(){
        var b = true
        b = b & (!exercise.getCurrent().radical1.correct | radical1_constructed)
        b = b & (!exercise.getCurrent().radical2.correct | radical2_constructed)
        b = b & (!exercise.getCurrent().radical3.correct | radical3_constructed)
        b = b & (!exercise.getCurrent().radical4.correct | radical4_constructed)
        b = b & (!exercise.getCurrent().radical5.correct | radical5_constructed)
        b = b & (!exercise.getCurrent().radical6.correct | radical6_constructed)
        b = b & (!exercise.getCurrent().radical7.correct | radical7_constructed)
        b = b & (!exercise.getCurrent().radical8.correct | radical8_constructed)
        return b;
    }

    states: [
        State {name: "NO_SELECTOR"},
        State {name: "RADICAL1"; PropertyChanges {target: characters.radical1.child; color: {main.state=="CONSTRUCTION_RIGHT"?"green":"black"}}},
        State {name: "RADICAL2"; PropertyChanges {target: characters.radical2.child; color: {main.state=="CONSTRUCTION_RIGHT"?"green":"black"}}},
        State {name: "RADICAL3"; PropertyChanges {target: characters.radical3.child; color: {main.state=="CONSTRUCTION_RIGHT"?"green":"black"}}},
        State {name: "RADICAL4"; PropertyChanges {target: characters.radical4.child; color: {main.state=="CONSTRUCTION_RIGHT"?"green":"black"}}},
        State {name: "RADICAL5"; PropertyChanges {target: characters.radical5.child; color: {main.state=="CONSTRUCTION_RIGHT"?"green":"black"}}},
        State {name: "RADICAL6"; PropertyChanges {target: characters.radical6.child; color: {main.state=="CONSTRUCTION_RIGHT"?"green":"black"}}},
        State {name: "RADICAL7"; PropertyChanges {target: characters.radical7.child; color: {main.state=="CONSTRUCTION_RIGHT"?"green":"black"}}},
        State {name: "RADICAL8"; PropertyChanges {target: characters.radical8.child; color: {main.state=="CONSTRUCTION_RIGHT"?"green":"black"}}}
    ]
}

