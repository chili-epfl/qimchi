import QtQuick 2.0

Text {
    color: "blue"
    font.pixelSize: 64

    property vector3d stl: detection.projectionMatrix.times(selectorTopLeft.center)
    property vector3d str: detection.projectionMatrix.times(selectorTopRight.center)
    property vector3d cursor: detection.projectionMatrix.times(selectorCursor.center)

    function getRatio(){
        //We compute the length from top left corner to top right corner (using the center of the tags)
        var totalLength = str.minus(stl).length()
        //We compute the length from top left corner to moving selector
        var selectedLength = cursor.minus(stl).length()
        //We compute the ratio of the projected length over the total length
        //We use dotproduct because x.y = cos(t)|x||y|
        //where cos(t)|x| is exactly the projected length of x on y
        var ratio = (str.minus(stl)).dotProduct(cursor.minus(stl))/(totalLength*totalLength)

        //Uncomment for debugging
        //console.log("total :"+totalLength+"  selected :"+ selectedLength +  "   ratio : " + ratio + " state : " + selected_radical.state)

        return ratio
    }

    property double ratio: getRatio()

    state: "NORMAL"

    states: [
        State {
            name: "NORMAL"
            PropertyChanges{
                target: selected_radical
                //visible: false
            }
        },
        State {
            name: "RADICAL1"
            when: (selected_radical.ratio < 0.25)
        },
        State {
            name: "RADICAL2"
            when: (selected_radical.ratio < 0.35)
        },
        State {
            name: "RADICAL3"
            when: (selected_radical.ratio < 0.45)
        },
        State {
            name: "RADICAL4"
            when: selected_radical.ratio < 0.55
        },
        State {
            name: "RADICAL5"
            when: selected_radical.ratio < 0.65
        },
        State {
            name: "RADICAL6"
            when: selected_radical.ratio < 0.75
        },
        State {
            name: "RADICAL7"
            when: selected_radical.ratio < 0.85
        },
        State {
            name: "RADICAL8"
            when: selected_radical.ratio < 0.95
        }
    ]

    text: {
        var r = getRatio()
        return (r<0.25)?"夕":
               (r<0.35)?"车":
               (r<0.45)?"口":
               (r<0.55)?"女":
               (r<0.65)?"木":
               (r<0.75)?"心":
               (r<0.85)?"父":
               (r<0.95)?"石":"X"
    }
    //transform: Transform { matrix: selectorTopLeft.transform }
    anchors.centerIn: parent
    x:42; y:0
}
