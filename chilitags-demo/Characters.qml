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
    property alias component13 : component13
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
        x_cm: exercise.getCurrent().component1.x_cm
        y_cm: exercise.getCurrent().component1.y_cm
        child.text: exercise.getCurrent().component1.character
        Image {anchors.centerIn: parent; source: "frame.png"; z:-1}
    }

    MyItem {
        id: component2
        x_cm: exercise.getCurrent().component2.x_cm
        y_cm: exercise.getCurrent().component2.y_cm
        child.text: exercise.getCurrent().component2.character
        Image {
            anchors.centerIn: parent
            source: "frame.png"
            z:-1
        }
    }

    MyItem {
        id: component3
        x_cm: exercise.getCurrent().component3.x_cm
        y_cm: exercise.getCurrent().component3.y_cm
        child.text: exercise.getCurrent().component3.character
        Image {
            anchors.centerIn: parent
            source: "frame.png"
            z:-1
        }
    }

    MyItem {
        id: component4
        x_cm: exercise.getCurrent().component4.x_cm
        y_cm: exercise.getCurrent().component4.y_cm
        child.text: exercise.getCurrent().component4.character
        Image {
            anchors.centerIn: parent
            source: "frame.png"
            z:-1
        }
    }

    MyItem {
        id: component5
        x_cm: exercise.getCurrent().component5.x_cm
        y_cm: exercise.getCurrent().component5.y_cm
        child.text: exercise.getCurrent().component5.character
        Image {
            anchors.centerIn: parent
            source: "frame.png"
            z:-1
        }
    }

    MyItem {
        id: component6
        x_cm: exercise.getCurrent().component6.x_cm
        y_cm: exercise.getCurrent().component6.y_cm
        child.text: exercise.getCurrent().component6.character
        Image {
            anchors.centerIn: parent
            source: "frame.png"
            z:-1
        }
    }

    MyItem {
        id: component7
        x_cm: exercise.getCurrent().component7.x_cm
        y_cm: exercise.getCurrent().component7.y_cm
        child.text: exercise.getCurrent().component7.character
        Image {
            anchors.centerIn: parent
            source: "frame.png"
            z:-1
        }
    }

    MyItem {
        id: component8
        x_cm: exercise.getCurrent().component8.x_cm
        y_cm: exercise.getCurrent().component8.y_cm
        child.text: exercise.getCurrent().component8.character
        Image {
            anchors.centerIn: parent
            source: "frame.png"
            z:-1
        }
    }

    MyItem {
        id: component9
        x_cm: exercise.getCurrent().component9.x_cm
        y_cm: exercise.getCurrent().component9.y_cm
        child.text: exercise.getCurrent().component9.character
        Image {
            anchors.centerIn: parent
            source: "frame.png"
            z:-1
        }
    }

    MyItem {
        id: component10
        x_cm: exercise.getCurrent().component10.x_cm
        y_cm: exercise.getCurrent().component10.y_cm
        child.text: exercise.getCurrent().component10.character
        Image {
            anchors.centerIn: parent
            source: "frame.png"
            z:-1
        }
    }

    MyItem {
        id: component11
        x_cm: exercise.getCurrent().component11.x_cm
        y_cm: exercise.getCurrent().component11.y_cm
        child.text: exercise.getCurrent().component11.character
        Image {
            anchors.centerIn: parent
            source: "frame.png"
            z:-1
        }
    }

    MyItem {
        id: component12
        x_cm: exercise.getCurrent().component12.x_cm
        y_cm: exercise.getCurrent().component12.y_cm
        child.text: exercise.getCurrent().component12.character
        Image {
            anchors.centerIn: parent
            source: "frame.png"
            z:-1
        }
    }

    MyItem {
        id: component13
        x_cm: exercise.getCurrent().component13.x_cm
        y_cm: exercise.getCurrent().component13.y_cm
        child.text: exercise.getCurrent().component13.character
        Image {
            anchors.centerIn: parent
            source: "frame.png"
            z:-1
        }
    }

    MyItem {
        id: radical1
        x_cm: exercise.getCurrent().radical1.x_cm
        y_cm: exercise.getCurrent().radical1.y_cm
        child.text: exercise.getCurrent().radical1.character
        Image {
            anchors.centerIn: parent
            source: "frame.png"
            z:-1
        }
    }

    MyItem {
        id: radical2
        x_cm: exercise.getCurrent().radical2.x_cm
        y_cm: exercise.getCurrent().radical2.y_cm
        child.text: exercise.getCurrent().radical2.character
        Image {
            anchors.centerIn: parent
            source: "frame.png"
            z:-1
        }
    }

    MyItem {
        id: radical3
        x_cm: exercise.getCurrent().radical3.x_cm
        y_cm: exercise.getCurrent().radical3.y_cm
        child.text: exercise.getCurrent().radical3.character
        Image {
            anchors.centerIn: parent
            source: "frame.png"
            z:-1
        }
    }

    MyItem {
        id: radical4
        x_cm: exercise.getCurrent().radical4.x_cm
        y_cm: exercise.getCurrent().radical4.y_cm
        child.text: exercise.getCurrent().radical4.character
        Image {
            anchors.centerIn: parent
            source: "frame.png"
            z:-1
        }
    }

    MyItem {
        id: radical5
        x_cm: exercise.getCurrent().radical5.x_cm
        y_cm: exercise.getCurrent().radical5.y_cm
        child.text: exercise.getCurrent().radical5.character
        Image {
            anchors.centerIn: parent
            source: "frame.png"
            z:-1
        }
    }

    MyItem {
        id: radical6
        x_cm: exercise.getCurrent().radical6.x_cm
        y_cm: exercise.getCurrent().radical6.y_cm
        child.text: exercise.getCurrent().radical6.character
        Image {
            anchors.centerIn: parent
            source: "frame.png"
            z:-1.
        }
    }

    MyItem {
        id: radical7
        x_cm: exercise.getCurrent().radical7.x_cm
        y_cm: exercise.getCurrent().radical7.y_cm
        child.text: exercise.getCurrent().radical7.character
        Image {
            anchors.centerIn: parent
            source: "frame.png"
            z:-1
        }
    }

    MyItem {
        id: radical8
        x_cm: exercise.getCurrent().radical8.x_cm
        y_cm: exercise.getCurrent().radical8.y_cm
        child.text: exercise.getCurrent().radical8.character
        Image {
            anchors.centerIn: parent
            source: "frame.png"
            z:-1
        }
    }




}
