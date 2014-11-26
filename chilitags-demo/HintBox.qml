import QtQuick 2.0



//This text displays "ready" on one of the visible component card
//Only the component card with ready on it will be activated by the function cards
//When two are visible at the same time the selected one will be the smallest rank
//
//This item also makes the character of the selected component appear green
//and manages the right text on pinyinCards and wordCombinationCard
CardBox {

    x_cm: 20.5
    y_cm: 14
    height_cm: 8.5
    width_cm: 8.5

    state: {
        main.state=="CONSTRUCTION_LEFT"?
            componentbox.notEmpty()?
            componentbox.alreadyConstructed()?
                        isIn(pinyinCard)?"PINYIN_PRONUNCIATION":
                        isIn(wordCombinationCard)?"WORD_COMBINATION":
                        isIn(strokeOrderCard)?"STROKE_ORDER":
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
                                isIn(strokeOrderCard)?"STROKE_ORDER":
                                radicalbox.isCorrect()?"WAITING_HINT":
                                "WRONG":
             isIn(constructionCardVerso)?"CONSTRUCTION":
             isIn(constructionCardRecto)?"CONSTRUCTION":
             "WAITING_CONSTRUCTION":
             "NO_COMPONENT":
        "NONE"
    }

    states: [
        State { name: "CONSTRUCTION" },
        State { name: "PINYIN_PRONUNCIATION" },
        State { name: "WORD_COMBINATION" },
        State { name: "STROKE_ORDER" },
        State {
            name: "NONE"
            PropertyChanges {
                target: hintbox
                visible: false
            }
        },
        State { name: "WAITING_HINT" },
        State { name: "WAITING_CONSTRUCTION" },
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
