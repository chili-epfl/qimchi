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

    //All necessary information about the result of constructing a character zwith component1
    property string component1 : "子"
    property bool component1_correct : true
    property string component1_character : "好"
    property string component1_pinyin : "hao (3)"
    property string component1_word : "你好"
    property string component1_stroke : "qrc:/gifs/hao3.gif"
    property double component1_X : 0.7
    property double component1_Y : 9.5
    property string component1_tag : "tag_104"

    //COMPONENT2
    property string component2 : "生"
    property bool component2_correct : true
    property string component2_character : "姓"
    property string component2_pinyin : "xing (4)"
    property string component2_word : "姓名"
    property string component2_stroke : "qrc:/gifs/xing4.gif"
    property double component2_X : 4.1
    property double component2_Y : 9.5
    property string component2_tag : "tag_105"

    //COMPONENT3
    property string component3 : "且"
    property bool component3_correct : true
    property string component3_character : "姐"
    property string component3_pinyin : "jie (3)"
    property string component3_word : "姐姐"
    property string component3_stroke : "qrc:/gifs/jie3.gif"
    property double component3_X : 7.6
    property double component3_Y : 9.5
    property string component3_tag : "tag_106"

    //COMPONENT4
    property string component4 : "也"
    property bool component4_correct : true
    property string component4_character : "她"
    property string component4_pinyin : "ta (1)"
    property string component4_word : "她们"
    property string component4_stroke : "qrc:/gifs/ta1.gif"
    property double component4_X : 11.1
    property double component4_Y : 9.5
    property string component4_tag : "tag_107"

    //COMPONENT5
    property string component5 : "西"
    property bool component5_correct : true
    property string component5_character : "要"
    property string component5_pinyin : "yao (4)"
    property string component5_word : "不要"
    property string component5_stroke : "qrc:/gifs/yao4.gif"
    property double component5_X : 14.3
    property double component5_Y : 9.5
    property string component5_tag : "tag_108"

    //COMPONENT6
    property string component6 : "反"
    property bool component6_correct : false
    property string component6_character : ""
    property string component6_pinyin : ""
    property string component6_word : ""
    property string component6_stroke : ""
    property double component6_X : 0
    property double component6_Y : 0
    property string component6_tag : "tag_109"

    //COMPONENT7
    property string component7 : "玉"
    property bool component7_correct : false
    property string component7_character : ""
    property string component7_pinyin : ""
    property string component7_word : ""
    property string component7_stroke : ""
    property double component7_X : 0
    property double component7_Y : 0
    property string component7_tag : "tag_110"

    //COMPONENT8
    property string component8 : "冬"
    property bool component8_correct : false
    property string component8_character : ""
    property string component8_pinyin : ""
    property string component8_word : ""
    property string component8_stroke : ""
    property double component8_X : 0
    property double component8_Y : 0
    property string component8_tag : "tag_111"

    //COMPONENT9
    property string component9 : ""
    property bool component9_correct : false
    property string component9_character : ""
    property string component9_pinyin : ""
    property string component9_word : ""
    property string component9_stroke : ""
    property double component9_X : 0
    property double component9_Y : 0
    property string component9_tag : ""

    //COMPONENT10
    property string component10 : ""
    property bool component10_correct : false
    property string component10_character : ""
    property string component10_pinyin : ""
    property string component10_word : ""
    property string component10_stroke : ""
    property double component10_X : 0
    property double component10_Y : 0
    property string component10_tag : ""

    //COMPONENT11
    property string component11 : ""
    property bool component11_correct : false
    property string component11_character : ""
    property string component11_pinyin : ""
    property string component11_word : ""
    property string component11_stroke : ""
    property double component11_X : 0
    property double component11_Y : 0
    property string component11_tag : ""

    //COMPONENT12
    property string component12 : ""
    property bool component12_correct : false
    property string component12_character : ""
    property string component12_pinyin : ""
    property string component12_word : ""
    property string component12_stroke : ""
    property double component12_X : 0
    property double component12_Y : 0
    property string component12_tag : ""

    //COMPONENT13
    property string component13 : ""
    property bool component13_correct : false
    property string component13_character : ""
    property string component13_pinyin : ""
    property string component13_word : ""
    property string component13_stroke : ""
    property double component13_X : 0
    property double component13_Y : 0
    property string component13_tag : ""

    //RADICAL1
    property string radical1 : "夕"
    property bool radical1_correct : false
    property string radical1_character : ""
    property string radical1_pinyin : ""
    property string radical1_word : ""
    property string radical1_stroke : ""
    property double radical1_X : 0
    property double radical1_Y : 0

    //RADICAL2
    property string radical2 : " 车"
    property bool radical2_correct : false
    property string radical2_character : ""
    property string radical2_pinyin : ""
    property string radical2_word : ""
    property string radical2_stroke : ""
    property double radical2_X : 0
    property double radical2_Y : 0

    //RADICAL3
    property string radical3 : "口"
    property bool radical3_correct : true
    property string radical3_character : "吗"
    property string radical3_pinyin : "Ma"
    property string radical3_word : "好吗"
    property string radical3_stroke : "qrc:/gifs/ma.gif"
    property double radical3_X : 21
    property double radical3_Y : 9.5

    //RADICAL4
    property string radical4 : "女"
    property bool radical4_correct : false
    property string radical4_character : ""
    property string radical4_pinyin : ""
    property string radical4_word : ""
    property string radical4_stroke : ""
    property double radical4_X : 0
    property double radical4_Y : 0

    //RADICAL5
    property string radical5 : "木"
    property bool radical5_correct : false
    property string radical5_character : ""
    property string radical5_pinyin : ""
    property string radical5_word : ""
    property string radical5_stroke : ""
    property double radical5_X : 0
    property double radical5_Y : 0

    //RADICAL6
    property string radical6 : "心"
    property bool radical6_correct : false
    property string radical6_character : ""
    property string radical6_pinyin : ""
    property string radical6_word : ""
    property string radical6_stroke : ""
    property double radical6_X : 0
    property double radical6_Y : 0

    //RADICAL7
    property string radical7 : "父"
    property bool radical7_correct : false
    property string radical7_character : ""
    property string radical7_pinyin : ""
    property string radical7_word : ""
    property string radical7_stroke : ""
    property double radical7_X : 0
    property double radical7_Y : 0

    //RADICAL8
    property string radical8 : "石"
    property bool radical8_correct : true
    property string radical8_character : "码"
    property string radical8_pinyin : "Ma (3)"
    property string radical8_word : "号码"
    property string radical8_stroke : ""
    property double radical8_X : 24.3
    property double radical8_Y : 9.5

}
