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
        return count>1?"TOOMUCH":new_state
    }

    function flip(){
        if(hintbox.state=="CONSTRUCTION"){
            if(state=="COMPONENT1"){component1_constructed = true; characters.component1.visible=isCorrect()}
            if(state=="COMPONENT2"){component2_constructed = true;characters.component2.visible=isCorrect()}
            if(state=="COMPONENT3"){component3_constructed = true;characters.component3.visible=isCorrect()}
            if(state=="COMPONENT4"){component4_constructed = true;characters.component4.visible=isCorrect()}
            if(state=="COMPONENT5"){component5_constructed = true;characters.component5.visible=isCorrect()}
            if(state=="COMPONENT6"){component6_constructed = true;characters.component6.visible=isCorrect()}
            if(state=="COMPONENT7"){component7_constructed = true;characters.component7.visible=isCorrect()}
            if(state=="COMPONENT8"){component8_constructed = true;characters.component8.visible=isCorrect()}
            if(state=="COMPONENT9"){component9_constructed = true;characters.component9.visible=isCorrect()}
            if(state=="COMPONENT10"){component10_constructed = true;characters.component10.visible=isCorrect()}
            if(state=="COMPONENT11"){component11_constructed = true;characters.component11.visible=isCorrect()}
            if(state=="COMPONENT12"){component12_constructed = true;characters.component12.visible=isCorrect()}
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
        return false
    }

    function notEmpty(){
        return (state != "NONE" & state != "TOOMUCH")
    }

    function isCorrect(){
        if(state==="COMPONENT1"){return component1_constructed & exercise.getCurrent().component1_correct}
        if(state==="COMPONENT2"){return component2_constructed & exercise.getCurrent().component2_correct}
        if(state==="COMPONENT3"){return component3_constructed & exercise.getCurrent().component3_correct}
        if(state==="COMPONENT4"){return component4_constructed & exercise.getCurrent().component4_correct}
        if(state==="COMPONENT5"){return component5_constructed & exercise.getCurrent().component5_correct}
        if(state==="COMPONENT6"){return component6_constructed & exercise.getCurrent().component6_correct}
        if(state==="COMPONENT7"){return component7_constructed & exercise.getCurrent().component7_correct}
        if(state==="COMPONENT8"){return component8_constructed & exercise.getCurrent().component8_correct}
        if(state==="COMPONENT9"){return component9_constructed & exercise.getCurrent().component9_correct}
        if(state==="COMPONENT10"){return component10_constructed & exercise.getCurrent().component10_correct}
        if(state==="COMPONENT11"){return component11_constructed & exercise.getCurrent().component11_correct}
        if(state==="COMPONENT12"){return component12_constructed & exercise.getCurrent().component12_correct}
        return false
    }

    function getPinyin(){
        if(state==="COMPONENT1"){return exercise.getCurrent().component1_pinyin}
        if(state==="COMPONENT2"){return exercise.getCurrent().component2_pinyin}
        if(state==="COMPONENT3"){return exercise.getCurrent().component3_pinyin}
        if(state==="COMPONENT4"){return exercise.getCurrent().component4_pinyin}
        if(state==="COMPONENT5"){return exercise.getCurrent().component5_pinyin}
        if(state==="COMPONENT6"){return exercise.getCurrent().component6_pinyin}
        if(state==="COMPONENT7"){return exercise.getCurrent().component7_pinyin}
        if(state==="COMPONENT8"){return exercise.getCurrent().component8_pinyin}
        if(state==="COMPONENT9"){return exercise.getCurrent().component9_pinyin}
        if(state==="COMPONENT10"){return exercise.getCurrent().component10_pinyin}
        if(state==="COMPONENT11"){return exercise.getCurrent().component11_pinyin}
        if(state==="COMPONENT12"){return exercise.getCurrent().component12_pinyin}
    }

    function getWord(){
        if(state==="COMPONENT1"){return exercise.getCurrent().component1_word}
        if(state==="COMPONENT2"){return exercise.getCurrent().component2_word}
        if(state==="COMPONENT3"){return exercise.getCurrent().component3_word}
        if(state==="COMPONENT4"){return exercise.getCurrent().component4_word}
        if(state==="COMPONENT5"){return exercise.getCurrent().component5_word}
        if(state==="COMPONENT6"){return exercise.getCurrent().component6_word}
        if(state==="COMPONENT7"){return exercise.getCurrent().component7_word}
        if(state==="COMPONENT8"){return exercise.getCurrent().component8_word}
        if(state==="COMPONENT9"){return exercise.getCurrent().component9_word}
        if(state==="COMPONENT10"){return exercise.getCurrent().component10_word}
        if(state==="COMPONENT11"){return exercise.getCurrent().component11_word}
        if(state==="COMPONENT12"){return exercise.getCurrent().component12_word}
    }

    function getStrokes(){
        if(state==="COMPONENT1"){return exercise.getCurrent().component1_stroke}
        if(state==="COMPONENT2"){return exercise.getCurrent().component2_stroke}
        if(state==="COMPONENT3"){return exercise.getCurrent().component3_stroke}
        if(state==="COMPONENT4"){return exercise.getCurrent().component4_stroke}
        if(state==="COMPONENT5"){return exercise.getCurrent().component5_stroke}
        if(state==="COMPONENT6"){return exercise.getCurrent().component6_stroke}
        if(state==="COMPONENT7"){return exercise.getCurrent().component7_stroke}
        if(state==="COMPONENT8"){return exercise.getCurrent().component8_stroke}
        if(state==="COMPONENT9"){return exercise.getCurrent().component9_stroke}
        if(state==="COMPONENT10"){return exercise.getCurrent().component10_stroke}
        if(state==="COMPONENT11"){return exercise.getCurrent().component11_stroke}
        if(state==="COMPONENT12"){return exercise.getCurrent().component12_stroke}
    }

    states: [
        State {name: "NONE"},
        State {name: "TOOMUCH"},
        State {name: "COMPONENT1"; PropertyChanges { target: characters.component1.child; color:"green" }},
        State {name: "COMPONENT2"; PropertyChanges { target: characters.component2.child; color:"green" }},
        State {name: "COMPONENT3"; PropertyChanges { target: characters.component3.child; color:"green" }},
        State {name: "COMPONENT4"; PropertyChanges { target: characters.component4.child; color: "green" }},
        State {name: "COMPONENT5"; PropertyChanges { target: characters.component5.child; color:"green" }},
        State {name: "COMPONENT6"; PropertyChanges { target: characters.component6.child; color:"green" }},
        State {name: "COMPONENT7"; PropertyChanges { target: characters.component7.child; color:"green" }},
        State {name: "COMPONENT8"; PropertyChanges { target: characters.component8.child; color:"green" }},
        State {name: "COMPONENT9"; PropertyChanges { target: characters.component9.child; color:"green" }},
        State {name: "COMPONENT10"; PropertyChanges { target: characters.component10.child; color:"green" }},
        State {name: "COMPONENT11"; PropertyChanges { target: characters.component11.child; color:"green" }},
        State {name: "COMPONENT12"; PropertyChanges { target: characters.component12.child; color:"green" }}
    ]
}