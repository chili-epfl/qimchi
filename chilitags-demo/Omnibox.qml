import QtQuick 2.0


//This text displays "ready" on one of the visible component card
//Only the component card with ready on it will be activated by the function cards
//When two are visible at the same time the selected one will be the smallest rank
//
//This item also makes the character of the selected component appear green
//and manages the right text on pinyinCards and wordCombinationCard
CardBox {
    boxtext.text: ""

    boxrectangle.border.color: "blue"

    x_cm: 7
    y_cm: 15.5
    height_cm: 7.5
    width_cm: 6

    state: "NONE"

    states: [
        State {name: "NONE"},
        State {name: "SOME"}
    ]
}
