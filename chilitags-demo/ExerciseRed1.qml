import QtQuick 2.0


//We describe all necessary elements for an exercise
Item {
    visible:false

    property string name : "ExerciseRed1"

    //The main character for the exercise
    property string main_character : "妈"

    //The code of the four corners of the sheet
    property string top_left_tag: "tag_100"
    property string top_right_tag: "tag_101"
    property string bottom_right_tag: "tag_102"
    property string bottom_left_tag: "tag_103"

    //The left part of the main caracter and its coordinates
    property string left_part_character: "女"
    property double left_part_X: 4.5
    property double left_part_Y: 4

    //The right part of the main character and its coordinates
    property string right_part_character: "马"
    property double right_part_X: 22.4
    property double right_part_Y: 4

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

    //All necessary information about the result of constructing a character with component1
    MyComponent {
        id: component1
        component : "子"
        correct : true
        character : "好"
        pinyin : "hao (3)"
        word : "你好"
        stroke : "qrc:/strokes/stroke_好.gif"
        sound : "qrc:/sound/translate_好.wav"
        x_cm : 0.7
        y_cm : 9.5
        tag : "tag_104"
    }

    MyComponent {
        id: component2
        component : "生"
        correct : true
        character : "姓"
        pinyin : "xing (4)"
        word : "姓名"
        stroke : "qrc:/strokes/stroke_姓.gif"
        sound : "qrc:/sound/translate_姓.wav"
        x_cm : 4.1
        y_cm : 9.5
        tag : "tag_105"
    }

    MyComponent {
        id: component3
        component : "且"
        correct : true
        character : "姐"
        pinyin : "jie (3)"
        word : "姐姐"
        stroke : "qrc:/strokes/stroke_姐.gif"
        sound : "qrc:/sound/translate_姐.wav"
        x_cm : 7.6
        y_cm : 9.5
        tag : "tag_106"
    }

    MyComponent {
        id: component4
        component : "也"
        correct : true
        character : "她"
        pinyin : "ta (1)"
        word : "她们"
        stroke : "qrc:/strokes/stroke_她.gif"
        sound : "qrc:/sound/translate_她.wav"
        x_cm : 11.1
        y_cm : 9.5
        tag : "tag_107"
    }

    MyComponent {
        id : component5
        component : "西"
        correct : true
        character : "要"
        pinyin : "yao (4)"
        word : "不要"
        stroke : "qrc:/strokes/stroke_要.gif"
        sound : "qrc:/sound/translate_要.wav"
        x_cm : 14.3
        y_cm : 9.5
        tag : "tag_108"
    }

    MyComponent {
        id:component6
        component : "反"
        tag : "tag_109"
    }

    MyComponent {
        id : component7
        component : "玉"
        tag : "tag_110"
    }

    MyComponent {
        id : component8
        component : "冬"
        tag : "tag_111"
    }

    MyComponent {id : component9}

    MyComponent {id : component10}

    MyComponent {id : component11}

    MyComponent {id : component12}

    MyComponent {id : component13}

    //RADICAL1
    MyRadical{ id: radical1; radical : "夕" }

    MyRadical{ id: radical2; radical : " 车" }

    MyRadical{
        id: radical3
        radical : "口"
        correct : true
        character : "吗"
        pinyin : "Ma"
        word : "好吗"
        stroke : "qrc:/strokes/stroke_吗.gif"
        sound : "qrc:/sound/translate_吗.wav"
        property double x_cm : 21
        property double y_cm : 9.5

    }

    MyRadical{ id: radical4; radical : "女"}

    MyRadical{ id: radical5; radical : "木"}

    MyRadical{ id: radical6; radical : "心"}

    MyRadical{ id: radical7; radical : "父"}

    MyRadical{
        id: radical8
        radical : "石"
        correct : true
        character : "码"
        pinyin : "Ma (3)"
        word : "号码"
        sound : "qrc:/sound/translate_码.wav"
        property double x_cm : 24.3
        property double y_cm : 9.5
    }
}
