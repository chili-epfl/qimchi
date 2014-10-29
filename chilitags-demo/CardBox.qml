import QtQuick 2.0
import "Coordinates.js" as Coordinates


//This Item is a box on the left side of the sheet used to place cards
Item {

    property double x_cm: 0
    property double y_cm: 0
    property double height_cm: 0
    property double width_cm: 0
    //This alias are needed to access the properties of the inner text and rectangle
    //in main.qml when we instanciate a CardBox object
    property alias boxtext: t
    property alias boxrectangle: r

    x: getX(x_cm,y_cm)
    y: getY(x_cm,y_cm)
    width:1
    height:1
    rotation: getRotation()
    transformOrigin: Item.TopLeft

    Text {
        id: t
        anchors.bottom: r.top
        anchors.bottomMargin: 10
        anchors.left: r.left
        anchors.leftMargin: 10
        text: getDistance(detection.projectionMatrix.times(constructionCard.center),getCenter(x_cm,y_cm))
        color: "white"
        font.pixelSize: 32




            }

            Rectangle {
                id: r
                anchors.centerIn:parent
                height: getHeight(height_cm)
                width: getWidth(width_cm)
                color: "transparent"
                border.color: "pink"
                border.width: 5
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
                                          .plus(tr.minus(tl).times(h))//.times(1-v))
                                          //.plus(br.minus(bl).times(h).times(v))
                                          .plus(bl.minus(tl).times(v))
                                      )
            }

            function getX(x_cm,y_cm) { return getCenter(x_cm,y_cm).x }

            function getY(x_cm,y_cm) { return getCenter(x_cm,y_cm).y }

            function getHeight(height_cm) {
                return getDistance(detection.projectionMatrix.times(bl),detection.projectionMatrix.times(tl)) * height_cm / Coordinates.vertical_length
            }

            function getWidth(width_cm) {
                return getDistance(detection.projectionMatrix.times(tr),detection.projectionMatrix.times(tl)) * width_cm / Coordinates.horizontal_length
            }

            function getRotation() {
                return Math.atan2(detection.projectionMatrix.times(tr).y-detection.projectionMatrix.times(tl).y,
                                  detection.projectionMatrix.times(tr).x-detection.projectionMatrix.times(tl).x)*180.0/Math.PI;
            }

            function getDistance(v,w) {
                return v.minus(w).length()
            }

            function isIn(tag) {
                return tag.visible & getDistance(detection.projectionMatrix.times(tag.center),getCenter(x_cm,y_cm))<(r.height+r.width)/4
            }

        }
