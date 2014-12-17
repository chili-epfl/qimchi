import QtQuick 2.2
import QtQuick.Window 2.1
import QtMultimedia 5.0
import Qt3D 2.0
import Qt3D.Shapes 2.0
import CVCamera 1.0
import Chilitags 1.0
import IMU 1.0

Window {
    visible: true

    //Inertial measurement unit
    IMU{
        id: imu
        accBias: Qt.vector3d(0.397, -0.008, -0.005)
        targetTranslation: Qt.vector3d(0,0.04,0) //Camera frame translation from local inertial frame
        targetRotation: Qt.quaternion(0,1,0,0)   //Camera frame rotation in local inertial frame
    }

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
        imu: imu
        persistence: 30

        ChilitagsObject{ id: tag0; name: "tag_0" }
        ChilitagsObject{ id: tag1; name: "tag_1" }
        ChilitagsObject{ id: tag2; name: "tag_2" }
        ChilitagsObject{ id: tag3; name: "tag_3" }
    }

    //Set up visual output
    VideoOutput{
        id: visual
        source: camera //"Background" is the camera image
        anchors.fill: parent

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

            //Draw a cube that's green when detected and red when not detected
            Cube{
                id: cube0
                scale: 20               //Default tag size
                effect: Effect { color: tag0.visible ? "green" : "red" }
                transform: [ Translation3D{ translate: Qt.vector3d(10,10,-10)}, MatrixTransform3D{ matrix: tag0.transform }] //We can center the cube like this
            }
            Cube{
                id: cube1
                scale: 20               //Default tag size
                effect: Effect { color: tag1.visible ? "green" : "red" }
                transform: [ Translation3D{ translate: Qt.vector3d(10,10,-10)}, MatrixTransform3D{ matrix: tag1.transform }] //We can center the cube like this
            }
            Cube{
                id: cube2
                scale: 20               //Default tag size
                effect: Effect { color: tag2.visible ? "green" : "red" }
                transform: [ Translation3D{ translate: Qt.vector3d(10,10,-10)}, MatrixTransform3D{ matrix: tag2.transform }] //We can center the cube like this
            }
            Cube{
                id: cube3
                scale: 20               //Default tag size
                effect: Effect { color: tag3.visible ? "green" : "red" }
                transform: [ Translation3D{ translate: Qt.vector3d(10,10,-10)}, MatrixTransform3D{ matrix: tag3.transform }] //We can center the cube like this
            }
        }
    }
}
