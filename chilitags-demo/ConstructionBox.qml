import QtQuick 2.0

CardBox {
    visible: (main.state == "CONSTRUCTION_LEFT" & componentbox.state!="NONE" & componentbox.state!="TOOMUCH")

    boxtext.text: {
        state==="WRONG"?"Wrong !!!":
        state==="READY"?"Use construction card":"Good"
    }

    boxrectangle.border.color: {
        state==="READY"?"yellow":
        state==="GOOD"?"green":"red"
    }

    x_cm: -8
    y_cm: 14
    height_cm: 8
    width_cm: 8

    state: {
        isIn(constructionCard)?
                    componentbox.state==="COMPONENT1"?"GOOD":
                    componentbox.state==="COMPONENT2"?"GOOD":
                    componentbox.state==="COMPONENT3"?"GOOD":
                    componentbox.state==="COMPONENT4"?"GOOD":
                    componentbox.state==="COMPONENT5"?"GOOD":"WRONG":
        "READY"
    }

    states: [
        State {
            name: "GOOD"
            StateChangeScript {
                script:{
                    componentbox.state==="COMPONENT1"?ch1.visible=true:
                    componentbox.state==="COMPONENT2"?ch2.visible=true:
                    componentbox.state==="COMPONENT3"?ch3.visible=true:
                    componentbox.state==="COMPONENT4"?ch4.visible=true:
                    componentbox.state==="COMPONENT5"?ch5.visible=true:0
                }
            }
        },
        State {
            name: "READY"
        },
        State {
            name: "WRONG"
        }
    ]
}
