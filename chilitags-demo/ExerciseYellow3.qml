import QtQuick 2.0

Item {
    visible:false

    property string name : "ExerciseYellow3"
    property string main_character : "作"

    property string top_left_tag: "tag_152"
    property string top_right_tag: "tag_153"
    property string bottom_right_tag: "tag_154"
    property string bottom_left_tag: "tag_155"

    property string left_part_character: "山"
    property double left_part_X: 3.6
    property double left_part_Y: 4.2

    property string right_part_character: "夕"
    property double right_part_X: 20.2
    property double right_part_Y: 4.2

    //We define aliases to build links from this components to the main
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

    MyComponent {
        id: component1
        component: "尔"
        tag: "tag_156"
    }

    MyComponent {
        id:component2
        component: "也"
        tag: "tag_157"
    }

    MyComponent {
        id: component3
        component: "门"
        tag: "tag_158"
    }

    MyComponent {
        id: component4
        component: "十"
        tag: " tag_159"
    }

    MyComponent {
        id : component5
        component: "牛"
        tag: "tag_160"
    }

    MyComponent {
        id:component6
        component: "更"
        tag: "tag_161"
    }

    MyComponent {
        id : component7
        component: "子"
        tag: "tag_162"
    }

    MyComponent {
        id : component8
        component: "X"
        tag: "tag_163"
    }

    MyComponent {
        id : component9
        component: "至"
        tag: "tag_164"
    }

    MyComponent {
        id : component10
        component: "山"
        correct: true
        character: "出"
        word: "进出"
        pinyin: "Chu (1)"
        stroke : "qrc:/strokes/stroke_出.gif"
        sound: "qrc:/sound/translate_出.wav"
        x_cm: 1.9
        y_cm: 9.5
        tag: "tag_165"
    }

    MyComponent {id : component11}

    MyComponent {id : component12}

    MyComponent {id : component13}

    MyRadical{
        id: radical1
        radical : "夕"
        correct: true
        character: "多"
        word: "Duo (1)"
        pinyin: "多少"
        stroke : "qrc:/strokes/stroke_多.gif"
        sound: "qrc:/sound/translate_多.wav"
        x_cm: 17.6
        y_cm: 9.5
    }

    MyRadical{ id: radical2; radical : "车" }

    MyRadical{
        id: radical3
        radical : "口"
        correct: true
        character: "名"
        word: "Ming (2)"
        pinyin: "姓名"
        stroke : "qrc:/strokes/stroke_名.gif"
        sound: "qrc:/sound/translate_名.wav"
        x_cm: 23.7
        y_cm: 9.5
    }

    MyRadical{ id: radical4; radical : "女"}

    MyRadical{ id: radical5; radical : "木"}

    MyRadical{ id: radical6; radical : "心"}

    MyRadical{ id: radical7; radical : "父"}

    MyRadical{ id: radical8; radical : "石" }

}
