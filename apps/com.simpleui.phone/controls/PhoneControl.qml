import QtQuick 2.8

Rectangle {
    id: root
    width: 100
    height: 100
    radius: width / 2
    color: "green"

    property alias backgroundColor: root.color
    property alias iconSource: icon.source

    signal clicked()

    Image {
        id: icon
        anchors.centerIn: parent
        anchors.horizontalCenter: parent.horizontalCenter
        source: "../assets/ic-call-contrast.png"
    }
    MouseArea {
        anchors.fill: parent
        onPressed: root.scale = 0.9
        onReleased: root.scale = 1.0
        onClicked: root.clicked()
    }
}
