import QtQuick 2.0

import QtQuick 2.0

Item {
    visible:false

    property string name : "ExerciseRed2"
    property string main_character : "因"

    property string top_left_tag: "tag_124"
    property string top_right_tag: "tag_125"
    property string bottom_right_tag: "tag_126"
    property string bottom_left_tag: "tag_127"

    property string left_part_character: "口"
    property double left_part_X: 5.9
    property double left_part_Y: 4.1

    property string right_part_character: "大"
    property double right_part_X: 21.5
    property double right_part_Y: 4.1


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
        tag : "tag_104"
    }

    MyComponent {
        id: component2
        component : "生"
        tag : "tag_105"
    }

    MyComponent {
        id: component3
        component : "且"
        tag : "tag_106"
    }

    MyComponent {
        id: component4
        component : "也"
        tag : "tag_107"
    }

    MyComponent {
        id : component5
        component : "西"
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
        correct : true
        character : "国"
        pinyin : "Guo (2)"
        word : "国家"
        stroke : ""
        sound : "qrc:/sound/translate_国.wav"
        x_cm : 3.5
        y_cm : 9.5
        tag : "tag_110"
    }

    MyComponent {
        id : component8
        component : "冬"
        correct : true
        character : "图"
        pinyin : "Tu (2)"
        word : "地图"
        stroke : ""
        sound : "qrc:/sound/translate_图.wav"
        x_cm : 8.9
        y_cm : 9.5
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

    MyRadical{ id: radical3; radical : "口"}

    MyRadical{ id: radical4; radical : "女"}

    MyRadical{ id: radical5; radical : "木"}

    MyRadical{ id: radical6; radical : "心"}

    MyRadical{ id: radical7; radical : "父"}

    MyRadical{ id: radical8; radical : "石"}

}
