import QtQuick 2.0

Item {
    visible:false

    property string name : "ExerciseYellow1"
    property string main_character : "作"

    property string top_left_tag: "tag_144"
    property string top_right_tag: "tag_145"
    property string bottom_right_tag: "tag_146"
    property string bottom_left_tag: "tag_147"

    property string left_part_character: "亻"
    property double left_part_X: 4.6
    property double left_part_Y: 4.3

    property string right_part_character: "乍"
    property double right_part_X: 21.3
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
        correct: true
        character: "你"
        word: "你好"
        pinyin: "Ni (3)"
        stroke : "qrc:/strokes/stroke_你.gif"
        sound: "qrc:/sound/translate_你.wav"
        x_cm: 0.7
        y_cm: 9.5
        tag: "tag_156"
    }

    MyComponent {
        id:component2
        component: "也"
        correct: true
        character: "他"
        word: "他们"
        pinyin: "Ta (1)"
        stroke : "qrc:/strokes/stroke_他.gif"
        sound: "qrc:/sound/translate_他.wav"
        x_cm: 3.8
        y_cm: 9.5
        tag: "tag_157"
    }

    MyComponent {
        id: component3
        component: "门"
        correct: true
        character: "们"
        word: "我们，同学们"
        pinyin: "Men"
        stroke : "qrc:/strokes/stroke_们.gif"
        sound: "qrc:/sound/translate_们.wav"
        x_cm: 6.9
        y_cm: 9.5
        tag: "tag_158"
    }

    MyComponent {
        id: component4
        component: "十"
        correct: true
        character: "什"
        word: "什么"
        pinyin: "Shen (2)"
        stroke : "qrc:/strokes/stroke_什.gif"
        sound: "qrc:/sound/translate_什.wav"
        x_cm: 10
        y_cm: 9.5
        tag: "tag_159"
    }

    MyComponent {
        id : component5
        component: "牛"
        correct: true
        character: "件"
        word: "邮件"
        pinyin: "Jian (4)"
        stroke : "qrc:/strokes/stroke_件.gif"
        sound: "qrc:/sound/translate_件.wav"
        x_cm: 13.1
        y_cm: 9.5
        tag: "tag_160"
    }

    MyComponent {
        id:component6
        component: "更"
        correct: true
        character: "便"
        word: "方便 , 便宜"
        pinyin: "Bian (4)\nPian (2)"
        stroke : "qrc:/strokes/stroke_便.gif"
        sound: "qrc:/sound/translate_便.wav"
        x_cm: 16.2
        y_cm: 9.5
        tag: "tag_161"
    }

    MyComponent {
        id : component7
        component: "子"
        tag: "tag_162"
    }

    MyComponent {
        id : component8
        component: " "
        nonwritable : "qrc:/non-writable/componentyellow8.png"
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
        tag: "tag_165"
    }

    MyComponent {id : component11}

    MyComponent {id : component12}

    MyComponent {id : component13}

    MyRadical{ id: radical1; radical : "夕" }

    MyRadical{ id: radical2; radical : "车" }

    MyRadical{id: radical3; radical : "口"}

    MyRadical{ id: radical4; radical : "女"}

    MyRadical{ id: radical5; radical : "木"}

    MyRadical{
        id: radical6
        radical : "心"
        correct: true
        character: "怎"
        word: "怎样"
        pinyin: "Zen (3)"
        sound: "qrc:/sound/translate_怎.wav"
        x_cm: 25
        y_cm: 9.5
    }

    MyRadical{ id: radical7; radical : "父"}

    MyRadical{ id: radical8; radical : "石" }

}
