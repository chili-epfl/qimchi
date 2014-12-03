import QtQuick 2.0

Item {
    visible:false

    property string name : "ExerciseBlue3"
    property string main_character : "还"

    property string top_left_tag: "tag_128"
    property string top_right_tag: "tag_129"
    property string bottom_right_tag: "tag_130"
    property string bottom_left_tag: "tag_131"

    property string left_part_character: "辶"
    property double left_part_X: 3.8
    property double left_part_Y: 4.2

    property string right_part_character: "不"
    property double right_part_X: 20.3
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

    //COMPONENT1
    MyComponent {
        id : component1
        component : "尼"
        tag : "tag_132"
    }

    MyComponent {
        id: component2
        component: "马"
        tag : "tag_133"
    }

    MyComponent {
        id :component3
        component : "X"
        tag : "tag_134"
    }

    MyComponent {
        id: component4
        component: "那"
        tag : "tag_135"
    }

    MyComponent {
        id : component5
        component : "X"
        tag : "tag_136"
    }

    MyComponent {
        id:component6
        component: "乞"
        tag : "tag_137"
    }

    MyComponent {
        id: component7
        component: "X"
        tag : "tag_138"
    }

    MyComponent {
        id:component8
        component: "八"
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
        correct : true
        character : "进"
        pinyin : "Jin (4)"
        word : "进口"
        stroke : ""
        sound: "qrc:/sound/translate_进.wav"
        x_cm : 2.5
        y_cm : 9
        tag : "tag_141"
    }

    MyComponent {
        id:component12
        component: "文"
        correct : true
        character : "这"
        pinyin : "Zhe (4)"
        word : "这里"
        stroke : ""
        sound: "qrc:/sound/translate_这.wav"
        x_cm : 8
        y_cm : 9
        tag : "tag_142"
    }

    MyComponent {
        id:component13
        component: "首"
        correct : true
        character : "道"
        pinyin : "Dao (4)"
        word : "知道"
        stroke : ""
        sound: "qrc:/sound/translate_道.wav"
        x_cm : 13
        y_cm : 9
        tag : "tag_143"
    }

    MyRadical{ id: radical1; radical : "夕" }

    MyRadical{ id: radical2; radical : "车" }

    MyRadical{ id: radical3; radical : "口"}

    MyRadical{ id: radical4; radical : "女"}

    MyRadical{ id: radical5; radical : "木"}

    MyRadical{ id: radical6; radical : "心"}

    MyRadical{ id: radical7; radical : "父"}

    MyRadical{ id: radical8;radical : "石" }

}
