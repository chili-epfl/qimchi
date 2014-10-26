import QtQuick 2.2
import QtQuick.Window 2.1
import QtMultimedia 5.0
import CVCamera 1.0
import Chilitags 1.0
import Qt3D 2.0
import Qt3D.Shapes 2.0

Window {
    visible: true
    width: camera.size.width
    height: camera.size.height
    maximumWidth: camera.size.width
    maximumHeight: camera.size.height

    //Set up physical camera
    CVCamera{
        id: camera
        device: 0
        size: "640x480"
    }

    // Set up chilitags detection
    Chilitags{
        id: chilitags
        sourceImage: camera.cvImage

        ChilitagsObject{
            id: redTag
            name: "tag_0"
        }
        ChilitagsObject{
            id: blueTag
            name: "tag_1"
        }
    }

    //Set up visual output
    VideoOutput{
        id: visual
        source: camera //"Background" is the camera image

        //This item is necessary for drawing with Qt3D
        Viewport {
            id: threeDItems
            width: parent.width
            height: parent.height
            navigation: false //Disable turning the camera by clicking and dragging

            //Our default camera conforms to the Chilitags frame
            camera: Camera {
                eye:        Qt.vector3d(0, 0,0) //Camera position
                center:     Qt.vector3d(0, 0,1) //Camera looks towards this position
                upVector:   Qt.vector3d(0,-1,0) //Camera's up (+Y axis) is towards this position
                fieldOfView: 38                 //In degrees, this needs to be calibrated/measured
            }

            //Our default light is from the camera towards the scene, might not be accurate for true AR scenes
            light: Light{
                position:  Qt.vector3d(0,0,0)
                direction: Qt.vector3d(0,0,-1) //There's something wrong here, this should point towards +Z, but doesn't work like that
            }

            //Draw a red cube
            Cube{
                id: redCube
                visible: redTag.visible //This doesn't work somehow
                scale: 20               //Default tag size
                effect: Effect { color: "red" }
                transform: [ Translation3D{ translate: Qt.vector3d(10,10,-10)}, MatrixTransform3D{ matrix: redTag.transform }] //We can center the cube like this
            }
        }

        //This item describes the camera frame, hence its transform is the camera matrix, i.e the projection matrix
        //Its children will have transform relative to this frame, so we can give them transforms coming directly from Chilitags
        //We could have put this outside the VideoOutput but this is semantically more elegant
        //We put regular QML items here, i.e "2D items"
        Item{
            id: twoDItems
            transform: MatrixTransform{ matrix: chilitags.projectionMatrix }

            // Same for the other tag
            Rectangle{
                id: blueRectangle
                color: "blue"
                width: 20
                height: 20
                transform: MatrixTransform{ matrix: blueTag.transform }
                visible: blueTag.visible
            }
        }
    }
}
