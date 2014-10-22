import QtQuick 2.3
import QtQuick.Window 2.1
import Chilitags 1.0
import QtMultimedia 5.0
import QtQuick.Controls 1.2


//This text displays "ready" on one of the visible component card
//Only the component card with ready on it will be activated by the function cards
//When two are visible at the same time the selected one will be the smallest rank
//
//This item also makes the character of the selected component appear green
//and manages the right text on pinyinCards and wordCombinationCard
Text {
    visible: (main.state == "CONSTRUCTION_LEFT")
    text: "ready"
    color: "blue"
    font.pointSize: 8
    x: 0; y: 20
    state: "NORMAL"
    transform: Transform {
        id: selected_component_transform
    }

    states: [
        State {
            name: "NORMAL"
            PropertyChanges{
                target: selected_component
                visible: false
            }
        },
        State {
            name: "CH1"
            when: component1.visible
            PropertyChanges {
                target: selected_component_transform
                matrix: component1.transform
            }
            PropertyChanges {
                target: ch1.child
                color: "green"
            }
            PropertyChanges {
                target: text_pinyin
                text: "hao (3)"
            }
        },
        State {
            name: "CH2"
            when: component2.visible
            PropertyChanges {
                target: selected_component_transform
                matrix: component2.transform
            }
            PropertyChanges {
                target: ch2.child
                color: "green"
            }
            PropertyChanges {
                target: text_pinyin
                text: "xing (4)"
            }
        },
        State {
            name: "CH3"
            when: component3.visible
            PropertyChanges {
                target: selected_component_transform
                matrix: component3.transform
            }
            PropertyChanges {
                target: ch3.child
                color: "green"
            }
            PropertyChanges {
                target: text_pinyin
                text: "jie (3)"
            }
        },
        State {
            name: "CH4"
            when: component4.visible
            PropertyChanges {
                target: selected_component_transform
                matrix: component4.transform
            }
            PropertyChanges {
                target: ch4.child
                color: "green"
            }
            PropertyChanges {
                target: text_pinyin
                text: "ta (1)"
            }
        },
        State {
            name: "CH5"
            when: component5.visible
            PropertyChanges {
                target: selected_component_transform
                matrix: component5.transform
            }
            PropertyChanges {
                target: ch5.child
                color: "green"
            }
            PropertyChanges {
                target: text_pinyin
                text: "yao (4)"
            }
        },
        State {
            name: "CH6"
            when: component6.visible
            PropertyChanges {
                target: selected_component_transform
                matrix: component6.transform
            }
        },
        State {
            name: "CH7"
            when: component7.visible
            PropertyChanges {
                target: selected_component_transform
                matrix: component7.transform
            }
        },
        State {
            name: "CH8"
            when: component8.visible
            PropertyChanges {
                target: selected_component_transform
                matrix: component8.transform
            }
        }
    ]
}
