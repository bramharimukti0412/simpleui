import QtQuick 2.4
import QtMultimedia 5.4
import "../stores"
import "../panels"

Item {
    id: root
    property Stores rootStore

    state: "PhotoCapture"

    states: [
        State {
            name: "PhotoCapture"
            StateChangeScript {
                script: {
                    camera.captureMode = Camera.CaptureStillImage
                    camera.start()
                }
            }
        },
        State {
            name: "PhotoPreview"
        },
        State {
            name: "VideoCapture"
            StateChangeScript {
                script: {
                    camera.captureMode = Camera.CaptureVideo
                    camera.start()
                }
            }
        },
        State {
            name: "VideoPreview"
            StateChangeScript {
                script: {
                    camera.stop()
                }
            }
        }
    ]

    Camera {
        id: camera
        captureMode: Camera.CaptureStillImage

        imageCapture {
            onImageCaptured: {
                photoPreview.source = preview
                stillControls.previewAvailable = true
                root.state = "PhotoPreview"
            }
        }

        videoRecorder {
            resolution: "640x480"
            frameRate: 30
        }
    }

    PhotoPreviewPanel {
        id : photoPreview
        anchors.fill : parent
        onClosed: root.state = "PhotoCapture"
        visible: root.state === "PhotoPreview"
        focus: visible
    }

    VideoPreviewPanel {
        id : videoPreview
        anchors.fill : parent
        onClosed: root.state = "VideoCapture"
        visible: root.state === "VideoPreview"
        focus: visible

        //don't load recorded video if preview is invisible
        source: visible ? camera.videoRecorder.actualLocation : ""
    }

    VideoOutput {
        id: viewfinder
        visible: root.state === "PhotoCapture" || root.state === "VideoCapture"

        x: 0
        y: 0
        width: parent.width - stillControls.buttonsPanelWidth
        height: parent.height

        source: camera
        autoOrientation: true
    }

    PhotoCaptureControlPanel {
        id: stillControls
        anchors.fill: parent
        camera: camera
        visible: root.state === "PhotoCapture"
        onPreviewSelected: root.state = "PhotoPreview"
        onVideoModeSelected: root.state = "VideoCapture"
    }

    VideoCaptureControlPanel {
        id: videoControls
        anchors.fill: parent
        camera: camera
        visible: root.state === "VideoCapture"
        onPreviewSelected: root.state = "VideoPreview"
        onPhotoModeSelected: root.state = "PhotoCapture"
    }
}
