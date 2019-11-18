import QtQuick 2.4

Item {
    id: root

    property alias iconSource: buttonIcon.source
    property alias iconWidth: buttonIcon.width

    signal buttonClicked()

    Image {
        id: buttonIcon
        width: 40
        height: width
        anchors.centerIn: parent
        fillMode: Image.PreserveAspectFit
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.buttonClicked()
        onPressed: root.scale = 0.7
        onReleased: root.scale = 1.0
    }
}
