import QtQuick 2.12
import utils 1.0
import "../controls"

Item {
    id: root

    property bool showNotificationCenter: false
    height: 150

    y: root.showNotificationCenter ? 0 : -root.height

    Behavior on y { NumberAnimation { duration: 200 } }

    NotificationCenterPanel {
        anchors.fill: parent
    }

    MouseArea {
        width: 250
        height: 30

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.bottom

        Rectangle {
            anchors.centerIn: parent
            width: 200
            height: 3
            radius: 5
        }
        onClicked: root.showNotificationCenter = !root.showNotificationCenter
    }
}
