import QtQuick 2.0



//This text displays "ready" on one of the visible component card
//Only the component card with ready on it will be activated by the function cards
//When two are visible at the same time the selected one will be the smallest rank
//
//This item also makes the character of the selected component appear green
//and manages the right text on pinyinCards and wordCombinationCard
CardBox {
    visible: main.state != "INITIAL"
    boxtext.text: {
        state=="WAITING_HINT"?"Use an hint card \nor change component":
        state=="WAITING_CONSTRUCTION"?"Use the construction card":
        state=="CONSTRUCTION"?"Flip the card to construct":
        state=="PINYIN_PRONUNCIATION"?
            main.state=="CONSTRUCTION_LEFT"?componentbox.getPinyin():radicalbox.getPinyin():
        state=="WORD_COMBINATION"?
            main.state=="CONSTRUCTION_LEFT"?componentbox.getWord():radicalbox.getWord():
        ""
    }
    boxrectangle.border.color: {
        state=="WAITING_HINT"?"yellow":
        state=="WAITING_CONSTRUCTION"?"yellow":
        "green"
    }

    x_cm: -8
    y_cm: 16
    height_cm: 8
    width_cm: 8



    state: {
        main.state=="CONSTRUCTION_LEFT"?
            componentbox.notEmpty()?
            componentbox.alreadyConstructed()?
                        isIn(pinyinCard)?"PINYIN_PRONUNCIATION":
                        isIn(wordCombinationCard)?"WORD_COMBINATION":
                        componentbox.isCorrect()?"WAITING_HINT":
                        "WRONG":
            isIn(constructionCardVerso)?"CONSTRUCTION":
            isIn(constructionCardRecto)?"CONSTRUCTION":
            "WAITING_CONSTRUCTION":
            "NO_COMPONENT":
        main.state=="CONSTRUCTION_RIGHT"?
             radicalbox.notEmpty()?
             radicalbox.alreadyConstructed()?
                                isIn(pinyinCard)?"PINYIN_PRONUNCIATION":
                                isIn(wordCombinationCard)?"WORD_COMBINATION":
                                radicalbox.isCorrect()?"WAITING_HINT":
                                "WRONG":
             isIn(constructionCardVerso)?"CONSTRUCTION":
             isIn(constructionCardRecto)?"CONSTRUCTION":
             "WAITING_CONSTRUCTION":
             "NO_COMPONENT":
        "NONE"
    }

    states: [
        State {
            name: "CONSTRUCTION"
        },
        State {
            name: "PINYIN_PRONUNCIATION"
        },
        State {
            name: "WORD_COMBINATION"
        },
        State {
            name: "STROKE_ORDER"
        },
        State {
            name: "NONE"
            PropertyChanges {
                target: hintbox
                visible: false
            }
        },
        State {
            name: "WAITING_HINT"
        },
        State {
            name: "WAITING_CONSTRUCTION"
        },
        State {
            name: "WRONG"
            PropertyChanges {
                target: hintbox
                visible: false
            }
        },
        State {
            name: "NO_COMPONENT"
            PropertyChanges {
                target: hintbox
                visible: false
            }
        }

    ]
}
