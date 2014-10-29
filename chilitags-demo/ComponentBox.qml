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
        state==="COMPONENT1"?"Component : 子":
        state==="COMPONENT2"?"Component : 生":
        state==="COMPONENT3"?"Component : 且":
        state==="COMPONENT4"?"Component : 也":
        state==="COMPONENT5"?"Component : 西":
        state==="COMPONENT6"?"Component : 反":
        state==="COMPONENT7"?"Component : 彡":
        state==="COMPONENT8"?"Component : 库":""
    }



    boxrectangle.border.color: {
        state=="NONE"?"yellow":state=="TOOMUCH"?"red":"green"
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

    states: [
        State {
            name: "NONE"
        },
        State {
            name: "TOOMUCH"
        },
        State {
            name: "COMPONENT1"
            PropertyChanges {
                visible: ch1.visible & pinyinCard.visible
                target: text_pinyin
                text: "hao (3)"
            }
            PropertyChanges {
                visible: ch1.visible & wordCombinationCard.visible
                target: text_word
                text: "你好"
            }
        },
        State {
            name: "COMPONENT2"
            PropertyChanges {
                visible: ch2.visible & pinyinCard.visible
                target: text_pinyin
                text: "xing (4)"
            }
            PropertyChanges {
                visible: ch2.visible & wordCombinationCard.visible
                target: text_word
                text: "姓名"
            }
        },
        State {
            name: "COMPONENT3"
            PropertyChanges {
                visible: ch3.visible & pinyinCard.visible
                target: text_pinyin
                text: "jie (3)"
            }
            PropertyChanges {
                visible: ch3.visible & wordCombinationCard.visible
                target: text_word
                text: "姐姐"
            }
        },
        State {
            name: "COMPONENT4"
            PropertyChanges {
                visible: ch4.visible & pinyinCard.visible
                target: text_pinyin
                text: "ta (1)"
            }
            PropertyChanges {
                visible: ch4.visible & wordCombinationCard.visible
                target: text_word
                text: "她们"
            }
        },
        State {
            name: "COMPONENT5"
            PropertyChanges {
                visible: ch5.visible & pinyinCard.visible
                target: text_pinyin
                text: "yao (4)"
            }
            PropertyChanges {
                visible: ch5.visible & wordCombinationCard.visible
                target: text_word
                text: "不要"
            }
        },
        State {
            name: "COMPONENT6"
        },
        State {
            name: "COMPONENT7"
        },
        State {
            name: "COMPONENT8"
        }
    ]
}
