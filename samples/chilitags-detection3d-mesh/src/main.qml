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

    //Set up chilitags detection
    Chilitags{
        id: chilitags
        sourceImage: camera.cvImage

        ChilitagsObject{
            id: tag
            name: "tag_0"
        }
    }

    //Set up visual output
    VideoOutput{
        id: output
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

            //Draw our 3D model
            Item3D{
                id: suzanne
                mesh: Mesh{ source: "/models/suzanne.dae" }
                transform: [ Translation3D{ translate: Qt.vector3d(10,10,-10)}, MatrixTransform3D{ matrix: tag.transform }] //We can center the mesh like this
                visible: tag.visible
            }
        }
    }
}
