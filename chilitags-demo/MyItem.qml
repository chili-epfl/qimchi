import QtQuick 2.0
import "Coordinates.js" as Coordinates


//This file describes MyItem object which is useful to easily draw a character on the sheet
//To use MyItem object you need to write in main.qml :
//MyItem{
//      x_cm: ...
//      y_cm: ...
//      character: ...
//      ...
//}
//
//x_cm and y_cm are the coordinates on the sheet in cm.
//The values are set in the file Coordinates.js
//We then computes the coordinates on the screen in pixels.
//
//MyItem is a very small rectangle with a bigger character Text in its center
Item {
    property double x_cm: 0
    property double y_cm: 0
    property alias child: asdf


    visible: false
    x: video.x + getX(x_cm,y_cm)
    y: video.y + getY(x_cm,y_cm)
    width: 1; height: 1
    rotation: getRotation()
    transformOrigin: Item.TopLeft

    Text {
        id: asdf
        font.pointSize: 60
        horizontalAlignment: Text.AlignHCenter
        text: ""
        anchors.centerIn: parent
        visible: true
    }



    //Here are the functions needed to compute pixel coordinates from centimeters
    //
    //Variable names follow the rules :
    //t = top           b = bottom
    //l = left          r = right
    //v = vertical      h = horizontal
    property vector3d tl : sheetTopLeft.center
    property vector3d bl : sheetBottomLeft.center
    property vector3d tr : sheetTopRight.center
    property vector3d br : sheetBottomRight.center

    function getCenter(x_cm,y_cm) {
        var h = x_cm / Coordinates.horizontal_length
        var v = y_cm / Coordinates.vertical_length
        return detection.projectionMatrix.times(
                                  tl
                                  .plus(tr.minus(tl).times(h).times(1-v))
                                  .plus(br.minus(bl).times(h).times(v))
                                  .plus(bl.minus(tl).times(v))
                              )
    }

    function getX(x_cm,y_cm) { return getCenter(x_cm,y_cm).x }

    function getY(x_cm,y_cm) { return getCenter(x_cm,y_cm).y }

    function getRotation() {
        return Math.atan2(detection.projectionMatrix.times(tr).y-detection.projectionMatrix.times(tl).y,
                          detection.projectionMatrix.times(tr).x-detection.projectionMatrix.times(tl).x)*180.0/Math.PI;
    }

}
