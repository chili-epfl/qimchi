import QtQuick 2.0



//This text displays "ready" on one of the visible component card
//Only the component card with ready on it will be activated by the function cards
//When two are visible at the same time the selected one will be the smallest rank
//
//This item also makes the character of the selected component appear green
//and manages the right text on pinyinCards and wordCombinationCard
CardBox {
    visible: (main.state == "CONSTRUCTION_LEFT")
    boxtext.text: {
        state==="NONE"?"Choose a component":
        state==="TOOMUCH"?"Too much components in the box":
        state==="WRONG"?"wrong":
        state==="COMPONENT1"?component1_constructed?"Good ! Use hint cards now.":"Component : 子":
        state==="COMPONENT2"?component2_constructed?"Good ! Use hint cards now.":"Component : 生":
        state==="COMPONENT3"?component3_constructed?"Good ! Use hint cards now.":"Component : 且":
        state==="COMPONENT4"?component4_constructed?"Good ! Use hint cards now.":"Component : 也":
        state==="COMPONENT5"?component5_constructed?"Good ! Use hint cards now.":"Component : 西":
        state==="COMPONENT6"?component6_constructed?"Wrong":"Component : 反":
        state==="COMPONENT7"?component7_constructed?"Wrong":"Component : 彡":
        state==="COMPONENT8"?component8_constructed?"Wrong":"Component : 库":""
    }

    property bool component1_constructed : false
    property bool component2_constructed : false
    property bool component3_constructed : false
    property bool component4_constructed : false
    property bool component5_constructed : false
    property bool component6_constructed : false
    property bool component7_constructed : false
    property bool component8_constructed : false


    boxrectangle.border.color: {
        state==="NONE"?"yellow":
        state==="TOOMUCH"?"red":
        state==="COMPONENT1"?"green":
        state==="COMPONENT2"?"green":
        state==="COMPONENT3"?"green":
        state==="COMPONENT4"?"green":
        state==="COMPONENT5"?"green":
        state==="COMPONENT6"?component6_constructed?"red":"green":
        state==="COMPONENT7"?component7_constructed?"red":"green":
        state==="COMPONENT8"?component8_constructed?"red":"green":""
    }

    x_cm: -8
    y_cm: 4
    height_cm: 8
    width_cm: 8

    state: {
        var count = 0
        var new_state = "NONE"
        isIn(component1)?count++:0
        isIn(component2)?count++:0
        isIn(component3)?count++:0
        isIn(component4)?count++:0
        isIn(component5)?count++:0
        isIn(component6)?count++:0
        isIn(component7)?count++:0
        isIn(component8)?count++:0

        isIn(component1)?new_state = "COMPONENT1":0
        isIn(component2)?new_state = "COMPONENT2":0
        isIn(component3)?new_state = "COMPONENT3":0
        isIn(component4)?new_state = "COMPONENT4":0
        isIn(component5)?new_state = "COMPONENT5":0
        isIn(component6)?new_state = "COMPONENT6":0
        isIn(component7)?new_state = "COMPONENT7":0
        isIn(component8)?new_state = "COMPONENT8":0

        return count>1?"TOOMUCH":new_state

    }

    function flip(){
        if(hintbox.state=="CONSTRUCTION"){
            if(state=="COMPONENT1"){ch1.visible=true; component1_constructed = true}
            if(state=="COMPONENT2"){ch2.visible=true; component2_constructed = true}
            if(state=="COMPONENT3"){ch3.visible=true; component3_constructed = true}
            if(state=="COMPONENT4"){ch4.visible=true; component4_constructed = true}
            if(state=="COMPONENT5"){ch5.visible=true; component5_constructed = true}
            if(state=="COMPONENT6"){mistakes.count += 1; component6_constructed = true}
            if(state=="COMPONENT7"){mistakes.count += 1; component7_constructed = true}
            if(state=="COMPONENT8"){mistakes.count += 1; component8_constructed = true}
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
        if(state==="COMPONENT1"){return component1_constructed}
        if(state==="COMPONENT2"){return component2_constructed}
        if(state==="COMPONENT3"){return component3_constructed}
        if(state==="COMPONENT4"){return component4_constructed}
        if(state==="COMPONENT5"){return component5_constructed}
        return false
    }

    function getPinyin(){
        if(state==="COMPONENT1"){return "hao (3)"}
        if(state==="COMPONENT2"){return "xing (4)"}
        if(state==="COMPONENT3"){return "jie (3)"}
        if(state==="COMPONENT4"){return "ta (1)"}
        if(state==="COMPONENT5"){return "yao (4)"}
    }

    function getWord(){
        if(state==="COMPONENT1"){return "你好"}
        if(state==="COMPONENT2"){return "姓名"}
        if(state==="COMPONENT3"){return "姐姐"}
        if(state==="COMPONENT4"){return "她们"}
        if(state==="COMPONENT5"){return "不要"}
    }

    states: [
        State {name: "NONE"},
        State {name: "TOOMUCH"},
        State {
            name: "COMPONENT1"
            PropertyChanges {
                target: ch1.child
                color:"green"
            }
        },
        State {
            name: "COMPONENT2"
            PropertyChanges {
                target: ch2.child
                color:"green"
            }
        },
        State {
            name: "COMPONENT3"
            PropertyChanges {
                target: ch3.child
                color:"green"
            }
        },
        State {
            name: "COMPONENT4"
            PropertyChanges {
                target: ch4.child
                color: "green"
            }
        },
        State {
            name: "COMPONENT5"
            PropertyChanges {
                target: ch5.child
                color:"green"
            }
        },
        State {name: "COMPONENT6"},
        State {name: "COMPONENT7"},
        State {name: "COMPONENT8"}
    ]
}
