import QtQuick 2.0

Item {
    visible:false

    property string name : "ExerciseEmptyTemplate"
    property string main_character : "Hello !"

    property string top_left_tag: ""
    property string top_right_tag: ""
    property string bottom_right_tag: ""
    property string bottom_left_tag: ""

    property string left_part_character: ""
    property double left_part_X: 0
    property double left_part_Y: 0

    property string right_part_character: ""
    property double right_part_X: 0
    property double right_part_Y: 0

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

    MyComponent {id: component1}

    MyComponent {id:component2}

    MyComponent {id: component3}

    MyComponent {id: component4}

    MyComponent {id : component5}

    MyComponent {id:component6}

    MyComponent {id : component7}

    MyComponent {id : component8}

    MyComponent {id : component9}

    MyComponent {id : component10}

    MyComponent {id : component11}

    MyComponent {id : component12}

    MyComponent {id : component13}

    MyRadical{ id: radical1; radical : "夕" }

    MyRadical{ id: radical2; radical : "车" }

    MyRadical{id: radical3; radical : "口"}

    MyRadical{ id: radical4; radical : "女"}

    MyRadical{ id: radical5; radical : "木"}

    MyRadical{ id: radical6; radical : "心"}

    MyRadical{ id: radical7; radical : "父"}

    MyRadical{ id: radical8; radical : "石" }

}
