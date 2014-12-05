import QtQuick 2.0
//import "test.js" as exercise



//This text displays "ready" on one of the visible component card
//Only the component card with ready on it will be activated by the function cards
//When two are visible at the same time the selected one will be the smallest rank
//
//This item also makes the character of the selected component appear green
//and manages the right text on pinyinCards and wordCombinationCard
CardBox {
    visible: (main.state == "CONSTRUCTION_LEFT")

    x_cm: 4.5
    y_cm: 15
    height_cm: 8
    width_cm: 8

    property bool component1_constructed : false
    property bool component2_constructed : false
    property bool component3_constructed : false
    property bool component4_constructed : false
    property bool component5_constructed : false
    property bool component6_constructed : false
    property bool component7_constructed : false
    property bool component8_constructed : false
    property bool component9_constructed : false
    property bool component10_constructed : false
    property bool component11_constructed : false
    property bool component12_constructed : false
    property bool component13_constructed : false

    state: {
        var count = 0
        var new_state = "NONE"
        if(isIn(component1)){new_state = "COMPONENT1";count++}
        if(isIn(component2)){new_state = "COMPONENT2";count++}
        if(isIn(component3)){new_state = "COMPONENT3";count++}
        if(isIn(component4)){new_state = "COMPONENT4";count++}
        if(isIn(component5)){new_state = "COMPONENT5";count++}
        if(isIn(component6)){new_state = "COMPONENT6";count++}
        if(isIn(component7)){new_state = "COMPONENT7";count++}
        if(isIn(component8)){new_state = "COMPONENT8";count++}
        if(isIn(component9)){new_state = "COMPONENT9";count++}
        if(isIn(component10)){new_state = "COMPONENT10";count++}
        if(isIn(component11)){new_state = "COMPONENT11";count++}
        if(isIn(component12)){new_state = "COMPONENT12";count++}
        if(isIn(component13)){new_state = "COMPONENT13";count++}
        return count>1?"TOOMUCH":new_state
    }

    function flip(){
        if(hintbox.state=="CONSTRUCTION"){
            if(state=="COMPONENT1"){component1_constructed = true; characters.component1.visible=isCorrect()}
            if(state=="COMPONENT2"){component2_constructed = true; characters.component2.visible=isCorrect()}
            if(state=="COMPONENT3"){component3_constructed = true; characters.component3.visible=isCorrect()}
            if(state=="COMPONENT4"){component4_constructed = true; characters.component4.visible=isCorrect()}
            if(state=="COMPONENT5"){component5_constructed = true; characters.component5.visible=isCorrect()}
            if(state=="COMPONENT6"){component6_constructed = true; characters.component6.visible=isCorrect()}
            if(state=="COMPONENT7"){component7_constructed = true; characters.component7.visible=isCorrect()}
            if(state=="COMPONENT8"){component8_constructed = true; characters.component8.visible=isCorrect()}
            if(state=="COMPONENT9"){component9_constructed = true; characters.component9.visible=isCorrect()}
            if(state=="COMPONENT10"){component10_constructed = true; characters.component10.visible=isCorrect()}
            if(state=="COMPONENT11"){component11_constructed = true; characters.component11.visible=isCorrect()}
            if(state=="COMPONENT12"){component12_constructed = true; characters.component12.visible=isCorrect()}
            if(state=="COMPONENT13"){component13_constructed = true; characters.component13.visible=isCorrect()}
            if(isCorrect()){success.count += 1}else{mistakes.count += 1}
        }
    }

    function alreadyConstructed(){
        if(state==="COMPONENT1"){return component1_constructed}
        if(state==="COMPONENT2"){return component2_constructed}
        if(state==="COMPONENT3"){return component3_constructed}
        if(state==="COMPONENT4"){return component4_constructed}
        if(state==="COMPONENT5"){return component5_constructed}
        if(state==="COMPONENT6"){return component6_constructed}
        if(state==="COMPONENT7"){return component7_constructed}
        if(state==="COMPONENT8"){return component8_constructed}
        if(state==="COMPONENT9"){return component9_constructed}
        if(state==="COMPONENT10"){return component10_constructed}
        if(state==="COMPONENT11"){return component11_constructed}
        if(state==="COMPONENT12"){return component12_constructed}
        if(state==="COMPONENT13"){return component13_constructed}
        return false
    }

    function notEmpty(){
        return (state != "NONE" & state != "TOOMUCH")
    }

    function isCorrect(){
        return alreadyConstructed() & getComponent().correct
    }

    function isWrong(){
        return alreadyConstructed() & !getComponent().correct
    }

    function getComponent(){
        if(state==="COMPONENT1"){return exercise.getCurrent().component1}
        if(state==="COMPONENT2"){return exercise.getCurrent().component2}
        if(state==="COMPONENT3"){return exercise.getCurrent().component3}
        if(state==="COMPONENT4"){return exercise.getCurrent().component4}
        if(state==="COMPONENT5"){return exercise.getCurrent().component5}
        if(state==="COMPONENT6"){return exercise.getCurrent().component6}
        if(state==="COMPONENT7"){return exercise.getCurrent().component7}
        if(state==="COMPONENT8"){return exercise.getCurrent().component8}
        if(state==="COMPONENT9"){return exercise.getCurrent().component9}
        if(state==="COMPONENT10"){return exercise.getCurrent().component10}
        if(state==="COMPONENT11"){return exercise.getCurrent().component11}
        if(state==="COMPONENT12"){return exercise.getCurrent().component12}
        if(state==="COMPONENT13"){return exercise.getCurrent().component13}
        else return exercise.empty.component1
    }

    function getPinyin(){
        return getComponent().pinyin
    }

    function getSound(){
        return getComponent().sound
    }

    function getSelection(){
        if(isCorrect()){return "Correct !"}
        else if(isWrong()){return "Wrong"}
        else{return getComponent().component}
    }

    function getWord(){
        return getComponent().word
    }

    function getStrokes(){
        return getComponent().stroke
    }

    states: [
        State {name: "NONE"},
        State {name: "TOOMUCH"},
        State {name: "COMPONENT1"; PropertyChanges { target: characters.component1.child; color:{main.state=="CONSTRUCTION_LEFT"?"green":"black"} }},
        State {name: "COMPONENT2"; PropertyChanges { target: characters.component2.child; color:{main.state=="CONSTRUCTION_LEFT"?"green":"black"} }},
        State {name: "COMPONENT3"; PropertyChanges { target: characters.component3.child; color:{main.state=="CONSTRUCTION_LEFT"?"green":"black"} }},
        State {name: "COMPONENT4"; PropertyChanges { target: characters.component4.child; color: {main.state=="CONSTRUCTION_LEFT"?"green":"black"} }},
        State {name: "COMPONENT5"; PropertyChanges { target: characters.component5.child; color:{main.state=="CONSTRUCTION_LEFT"?"green":"black"} }},
        State {name: "COMPONENT6"; PropertyChanges { target: characters.component6.child; color:{main.state=="CONSTRUCTION_LEFT"?"green":"black"} }},
        State {name: "COMPONENT7"; PropertyChanges { target: characters.component7.child; color:{main.state=="CONSTRUCTION_LEFT"?"green":"black"} }},
        State {name: "COMPONENT8"; PropertyChanges { target: characters.component8.child; color:{main.state=="CONSTRUCTION_LEFT"?"green":"black"} }},
        State {name: "COMPONENT9"; PropertyChanges { target: characters.component9.child; color:{main.state=="CONSTRUCTION_LEFT"?"green":"black"} }},
        State {name: "COMPONENT10"; PropertyChanges { target: characters.component10.child; color:{main.state=="CONSTRUCTION_LEFT"?"green":"black"} }},
        State {name: "COMPONENT11"; PropertyChanges { target: characters.component11.child; color:{main.state=="CONSTRUCTION_LEFT"?"green":"black"} }},
        State {name: "COMPONENT12"; PropertyChanges { target: characters.component12.child; color:{main.state=="CONSTRUCTION_LEFT"?"green":"black"} }},
        State {name: "COMPONENT13"; PropertyChanges { target: characters.component13.child; color:{main.state=="CONSTRUCTION_LEFT"?"green":"black"} }}
    ]
}
