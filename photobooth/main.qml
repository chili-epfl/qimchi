import QtQuick 2.2
import QtQuick.Window 2.1
import Print 1.0
import QtMultimedia 5.0

Window {
    visible: true; visibility: "FullScreen"
    color: "black"

    Camera {
        id: camera
        imageCapture.onImageCaptured: {
            photoPreview.source = preview
        }
    }

    ImagePrinter {
        id: printer
        imagePath: camera.imageCapture.capturedImagePath
        property real margin: 4
        boundingRect: Qt.rect(52, margin, 150-2*margin, 100-2*margin)
    }


    Item {
        id: ui
        anchors.fill: parent

        state: "FINDVIEW"
        states: [
            State {
                name: "FINDVIEW"
                PropertyChanges {target: findviewUI; visible: true}
                PropertyChanges {target: captureTrigger; visible: true}
                PropertyChanges {target: previewUI; visible: false}
            }
            ,
            State {
                name: "COUNTDOWN"
                PropertyChanges {target: findviewUI; visible: true}
                PropertyChanges {target: captureTrigger; visible: false}
                PropertyChanges {target: previewUI; visible: false}
                StateChangeScript {
                    name: "startCountdown"
                    script: countdown.start()
                }
            }
            ,
            State {
                name: "PREVIEW"
                PropertyChanges {target: findviewUI; visible: false}
                PropertyChanges {target: previewUI; visible: true}
            }
        ]

        //Text {
        //    text: "quit"
        //    color: "white"
        //    anchors.top: parent.top
        //    anchors.right: parent.right
        //    MouseArea { anchors.fill: parent; onClicked: {Qt.quit()} }
        //}

        Item {
            id: findviewUI
            anchors.fill: parent

            VideoOutput {
                id: cameraImage
                source: camera
                anchors.fill: parent
            }

            Image {
                id: captureTrigger
                source: "qrc:/img/capture.png"
                anchors.top: parent.top
                anchors.left: parent.left
                width: 100; height: 100
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        ui.state = "COUNTDOWN"
                    }
                }
            }
        }

        Item {
            id: previewUI
            anchors.fill: parent

            Image {
                id: photoPreview
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
            }

            Item {
                width: parent.width/2
                height: parent.height
                anchors.left: parent.left

                Image {
                    source: "qrc:/img/trash.png"
                    anchors.centerIn: parent
                    width: 100; height: 100
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            ui.state = "FINDVIEW"
                        }
                    }
                }
            }

            Item {
                width: parent.width/2
                height: parent.height
                anchors.right: parent.right

                Image {
                    source: "qrc:/img/print.png"
                    anchors.centerIn: parent
                    width: 100; height: 100
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            printer.print()
                            ui.state = "FINDVIEW"
                        }
                    }
                }
            }
        }

        Text {
            id: three; text: "3"
            scale: 20
            opacity: 0.0
            anchors.centerIn: parent
        }
        Text {
            id: two; text: "2"
            scale: 20
            opacity: 0.0
            anchors.centerIn: parent
        }
        Text {
            id: one; text: "1"
            scale: 20
            opacity: 0.0
            anchors.centerIn: parent
        }

        SequentialAnimation {
            id: countdown
            PropertyAnimation {
                target: three; property: "opacity"
                from: 1.0; to: 0.0; duration: 1000
            }
            PropertyAnimation {
                target: two; property: "opacity"
                from: 1.0; to: 0.0; duration: 1000
            }
            PropertyAnimation {
                target: one; property: "opacity"
                from: 1.0; to: 0.0; duration: 1000
            }
            onStopped: {
                camera.imageCapture.captureToLocation("./"+Date.now()+".jpg")
                ui.state = "PREVIEW"
            }
        }
    }
}
