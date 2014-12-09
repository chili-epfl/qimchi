import QtQuick 2.0

Item {
    visible:false

    property string name : "ExerciseBlue1"
    property string main_character : "吧"

    property string top_left_tag: "tag_120"
    property string top_right_tag: "tag_121"
    property string bottom_right_tag: "tag_122"
    property string bottom_left_tag: "tag_123"

    property string left_part_character: "口"
    property double left_part_X: 4
    property double left_part_Y: 4.4

    property string right_part_character: "巴"
    property double right_part_X: 24
    property double right_part_Y: 4.4


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


    //COMPONENT1
    MyComponent {
        id : component1
        component : "尼"
        correct : true
        character : "呢"
        pinyin : "Ne"
        word : "你呢"
        stroke : "qrc:/strokes/stroke_呢.gif"
        sound : "qrc:/sound/translate_呢.wav"
        x_cm : 0.2
        y_cm : 9.6
        tag : "tag_132"
    }

    MyComponent {
        id: component2
        component: "马"
        correct : true
        character : "吗"
        pinyin : "Ma"
        word : "是吗"
        stroke : "qrc:/strokes/stroke_吗.gif"
        sound : "qrc:/sound/translate_吗.wav"
        x_cm : 3.2
        y_cm : 9.6
        tag : "tag_133"
    }

    MyComponent {
        id :component3
        component : " "
        nonwritable : "qrc:/non-writable/componentblue3.png"
        correct : true
        character : "叫"
        pinyin : "Jiao (4)"
        word : "叫人"
        stroke : "qrc:/strokes/stroke_叫.gif"
        sound : "qrc:/sound/translate_叫.wav"
        x_cm : 6.3
        y_cm : 9.6
        tag : "tag_134"
    }

    MyComponent {
        id: component4
        component: "那"
        correct : true
        character : "哪"
        pinyin : "Na (3)"
        word : "哪里"
        stroke : "qrc:/strokes/stroke_哪.gif"
        sound : "qrc:/sound/translate_哪.wav"
        x_cm : 9.4
        y_cm : 9.6
        tag : "tag_135"
    }

    MyComponent {
        id : component5
        component : " "
        nonwritable : "qrc:/non-writable/componentblue5.png"
        correct : true
        character : "喝"
        pinyin : "He (1)"
        word : "喝水、喝茶"
        sound : "qrc:/sound/translate_喝.wav"
        x_cm : 12.5
        y_cm : 9.6
        tag : "tag_136"
    }

    MyComponent {
        id:component6
        component: "乞"
        correct : true
        character : "吃"
        pinyin : "Chi (1)"
        word : "吃饭、好吃"
        stroke : "qrc:/strokes/stroke_吃.gif"
        sound : "qrc:/sound/translate_吃.wav"
        x_cm : 15.6
        y_cm : 9.6
        tag : "tag_137"
    }

    MyComponent {
        id: component7
        component: " "
        nonwritable : "qrc:/non-writable/componentblue7.png"
        correct : true
        character : "号"
        pinyin : "Hao (4)"
        word : "号码"
        stroke : "qrc:/strokes/stroke_号.gif"
        sound : "qrc:/sound/translate_号.wav"
        x_cm : 18.8
        y_cm : 9.6
        tag : "tag_138"
    }

    MyComponent {
        id:component8
        component: "八"
        correct : true
        character : "只"
        pinyin : "Zhi (1)"
        word : "只会"
        stroke : "qrc:/strokes/stroke_只.gif"
        sound : "qrc:/sound/translate_只.wav"
        x_cm : 21.9
        y_cm : 9.6
        tag : "tag_20"
    }

    MyComponent {
       id: component9
       component : "彡"
       tag : "tag_139"
    }

    MyComponent {
        id: component10
        component: "库"
        tag : "tag_140"
    }

    MyComponent {
        id: component11
        component: "井"
        tag : "tag_141"
    }

    MyComponent {
        id:component12
        component: "文"
        tag : "tag_142"
    }

    MyComponent {
        id:component13
        component: "首"
        tag : "tag_143"
    }

    MyRadical{ id: radical1; radical : "夕" }

    MyRadical{ id: radical2; radical : "车" }

    MyRadical{id: radical3; radical : "口"}

    MyRadical{ id: radical4; radical : "女"}

    MyRadical{ id: radical5; radical : "木"}

    MyRadical{ id: radical6; radical : "心"}

    MyRadical{
        id: radical7
        radical : "父"
        correct: true
        character : "爸"
        pinyin : "Ba (4)"
        word : "爸爸"
        stroke : "qrc:/strokes/stroke_爸.gif"
        sound : "qrc:/sound/translate_爸.wav"
        x_cm: 25.1
        y_cm: 9
    }

    MyRadical{ id: radical8;radical : "石" }

}
