import QtQuick 2.4

Item {
    id: root

    height: 90

    property alias text: text.text
    property bool highlighted: false

    signal itemClicked()

    Rectangle {
        anchors.fill: parent
        color: "grey"
        opacity: root.highlighted ? 0.2 : 0.0
        Behavior on opacity {
            NumberAnimation { duration: 200 }
        }
    }

    Text {
        id: text
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 40
        color: "white"
        font.pixelSize: 50
    }

    Rectangle {
        anchors.bottom: parent.bottom
        height: 1
        width: parent.width
        opacity: 0.2
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.itemClicked()
        onPressed: root.highlighted = true
        onReleased: root.highlighted = false
    }
}
