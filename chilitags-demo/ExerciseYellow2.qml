import QtQuick 2.0

Item {
    visible:false

    property string name : "ExerciseYellow2"
    property string main_character : "宜"

    property string top_left_tag: "tag_148"
    property string top_right_tag: "tag_149"
    property string bottom_right_tag: "tag_150"
    property string bottom_left_tag: "tag_151"

    property string left_part_character: "宀"
    property double left_part_X: 5.8
    property double left_part_Y: 4.3

    property string right_part_character: "且"
    property double right_part_X: 21.5
    property double right_part_Y: 4.3

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
        correct: true
        character: "字"
        word: "写字"
        pinyin: "Zi (4)"
        stroke : "qrc:/strokes/stroke_字.gif"
        sound: "qrc:/sound/translate_字.wav"
        x_cm: 3.2
        y_cm: 9.5
        tag: "tag_162"
    }

    MyComponent {
        id : component8
        component: " "
        nonwritable : "qrc:/non-writable/componentyellow8.png"
        correct: true
        character: "家"
        word: "家人"
        pinyin: "Jia (1)"
        stroke : "qrc:/strokes/stroke_家.gif"
        sound: "qrc:/sound/translate_家.wav"
        x_cm: 8.1
        y_cm: 9.5
        tag: "tag_163"
    }

    MyComponent {
        id : component9
        component: "至"
        correct: true
        character: "室"
        word: "教室"
        pinyin: "Shi (4)"
        stroke : "qrc:/strokes/stroke_室.gif"
        sound: "qrc:/sound/translate_室.wav"
        x_cm: 12.9
        y_cm: 9.5
        tag: "tag_164"
    }

    MyComponent {
        id : component10
        component: "山"
        tag: "tag_165"
    }

    MyComponent {id : component11}

    MyComponent {id : component12}

    MyComponent {id : component13}

    MyRadical{ id: radical1; radical : "夕" }

    MyRadical{ id: radical2; radical : "车" }

    MyRadical{id: radical3; radical : "口"}

    MyRadical{
        id: radical4
        radical : "女"
        correct: true
        character: "姐"
        word: "姐姐"
        pinyin: "Jie (3)"
        stroke : "qrc:/strokes/stroke_姐.gif"
        sound: "qrc:/sound/translate_.wav"
        x_cm: 24.2
        y_cm: 9.5
    }

    MyRadical{ id: radical5; radical : "木"}

    MyRadical{ id: radical6; radical : "心"}

    MyRadical{ id: radical7; radical : "父"}

    MyRadical{ id: radical8; radical : "石" }

}
