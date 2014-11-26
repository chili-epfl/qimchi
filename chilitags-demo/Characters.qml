import QtQuick 2.0

Item {


    //We define 12(component) + 8(radical) characters,
    //but most of them will never become visible.

    //When componentX is used and is correct the character called componentX will become visible
    property alias component1 : component1
    property alias component2 : component2
    property alias component3 : component3
    property alias component4 : component4
    property alias component5 : component5
    property alias component6 : component6
    property alias component7 : component7
    property alias component8 : component8
    property alias component9 : component9
    property alias component10 : component10
    property alias component11 : component11
    property alias component12 : component12
    property alias radical1 : radical1
    property alias radical2 : radical2
    property alias radical3 : radical3
    property alias radical4 : radical4
    property alias radical5 : radical5
    property alias radical6 : radical6
    property alias radical7 : radical7
    property alias radical8 : radical8


    MyItem {
        id: component1
        x_cm: exercise.getCurrent().component1_X
        y_cm: exercise.getCurrent().component1_Y
        child.text: exercise.getCurrent().component1_character
        Image {anchors.centerIn: parent; source: "frame.png"; z:-1}
    }

    MyItem {
        id: component2
        x_cm: exercise.getCurrent().component2_X
        y_cm: exercise.getCurrent().component2_Y
        child.text: exercise.getCurrent().component2_character
        Image {
            anchors.centerIn: parent
            source: "frame.png"
            z:-1
        }
    }

    MyItem {
        id: component3
        x_cm: exercise.getCurrent().component3_X
        y_cm: exercise.getCurrent().component3_Y
        child.text: exercise.getCurrent().component3_character
        Image {
            anchors.centerIn: parent
            source: "frame.png"
            z:-1
        }
    }

    MyItem {
        id: component4
        x_cm: exercise.getCurrent().component4_X
        y_cm: exercise.getCurrent().component4_Y
        child.text: exercise.getCurrent().component4_character
        Image {
            anchors.centerIn: parent
            source: "frame.png"
            z:-1
        }
    }

    MyItem {
        id: component5
        x_cm: exercise.getCurrent().component5_X
        y_cm: exercise.getCurrent().component5_Y
        child.text: exercise.getCurrent().component5_character
        Image {
            anchors.centerIn: parent
            source: "frame.png"
            z:-1
        }
    }

    MyItem {
        id: component6
        x_cm: exercise.getCurrent().component6_X
        y_cm: exercise.getCurrent().component6_Y
        child.text: exercise.getCurrent().component6_character
        Image {
            anchors.centerIn: parent
            source: "frame.png"
            z:-1
        }
    }

    MyItem {
        id: component7
        x_cm: exercise.getCurrent().component7_X
        y_cm: exercise.getCurrent().component7_Y
        child.text: exercise.getCurrent().component7_character
        Image {
            anchors.centerIn: parent
            source: "frame.png"
            z:-1
        }
    }

    MyItem {
        id: component8
        x_cm: exercise.getCurrent().component8_X
        y_cm: exercise.getCurrent().component8_Y
        child.text: exercise.getCurrent().component8_character
        Image {
            anchors.centerIn: parent
            source: "frame.png"
            z:-1
        }
    }

    MyItem {
        id: component9
        x_cm: exercise.getCurrent().component9_X
        y_cm: exercise.getCurrent().component9_Y
        child.text: exercise.getCurrent().component9_character
        Image {
            anchors.centerIn: parent
            source: "frame.png"
            z:-1
        }
    }

    MyItem {
        id: component10
        x_cm: exercise.getCurrent().component10_X
        y_cm: exercise.getCurrent().component10_Y
        child.text: exercise.getCurrent().component10_character
        Image {
            anchors.centerIn: parent
            source: "frame.png"
            z:-1
        }
    }

    MyItem {
        id: component11
        x_cm: exercise.getCurrent().component11_X
        y_cm: exercise.getCurrent().component11_Y
        child.text: exercise.getCurrent().component11_character
        Image {
            anchors.centerIn: parent
            source: "frame.png"
            z:-1
        }
    }

    MyItem {
        id: component12
        x_cm: exercise.getCurrent().component12_X
        y_cm: exercise.getCurrent().component12_Y
        child.text: exercise.getCurrent().component12_character
        Image {
            anchors.centerIn: parent
            source: "frame.png"
            z:-1
        }
    }



    MyItem {
        id: radical1
        x_cm: exercise.getCurrent().radical1_X
        y_cm: exercise.getCurrent().radical1_Y
        child.text: exercise.getCurrent().radical1_character
        Image {
            anchors.centerIn: parent
            source: "frame.png"
            z:-1
        }
    }

    MyItem {
        id: radical2
        x_cm: exercise.getCurrent().radical2_X
        y_cm: exercise.getCurrent().radical2_Y
        child.text: exercise.getCurrent().radical2_character
        Image {
            anchors.centerIn: parent
            source: "frame.png"
            z:-1
        }
    }

    MyItem {
        id: radical3
        x_cm: exercise.getCurrent().radical3_X
        y_cm: exercise.getCurrent().radical3_Y
        child.text: exercise.getCurrent().radical3_character
        Image {
            anchors.centerIn: parent
            source: "frame.png"
            z:-1
        }
    }

    MyItem {
        id: radical4
        x_cm: exercise.getCurrent().radical4_X
        y_cm: exercise.getCurrent().radical4_Y
        child.text: exercise.getCurrent().radical4_character
        Image {
            anchors.centerIn: parent
            source: "frame.png"
            z:-1
        }
    }

    MyItem {
        id: radical5
        x_cm: exercise.getCurrent().radical5_X
        y_cm: exercise.getCurrent().radical5_Y
        child.text: exercise.getCurrent().radical5_character
        Image {
            anchors.centerIn: parent
            source: "frame.png"
            z:-1
        }
    }

    MyItem {
        id: radical6
        x_cm: exercise.getCurrent().radical6_X
        y_cm: exercise.getCurrent().radical6_Y
        child.text: exercise.getCurrent().radical6_character
        Image {
            anchors.centerIn: parent
            source: "frame.png"
            z:-1
        }
    }

    MyItem {
        id: radical7
        x_cm: exercise.getCurrent().radical7_X
        y_cm: exercise.getCurrent().radical7_Y
        child.text: exercise.getCurrent().radical7_character
        Image {
            anchors.centerIn: parent
            source: "frame.png"
            z:-1
        }
    }

    MyItem {
        id: radical8
        x_cm: exercise.getCurrent().radical8_X
        y_cm: exercise.getCurrent().radical8_Y
        child.text: exercise.getCurrent().radical8_character
        Image {
            anchors.centerIn: parent
            source: "frame.png"
            z:-1
        }
    }




}
