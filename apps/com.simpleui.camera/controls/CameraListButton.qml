import QtQuick 2.0

Item {
    id: cameraListButton
    property alias value : popup.currentValue
    property alias model : popup.model

    width : 144
    height: 70
    visible: model.length > 0

    BorderImage {
        id: buttonImage
        source: "../assets/toolbutton.sci"
        width: cameraListButton.width; height: cameraListButton.height
    }

    CameraButton {
        anchors.fill: parent
        text: popup.currentItem != null ? popup.currentItem.displayName : ""

        onClicked: popup.toggle()
    }

    CameraListPopup {
        id: popup
        anchors.right: parent.left
        anchors.rightMargin: 16
        anchors.top: parent.top
        visible: opacity > 0

        onSelected: popup.toggle()
    }
}
