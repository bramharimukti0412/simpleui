import QtQuick 2.8
import QtQuick.Controls 2.2

Item {
    id: root

    width: 750
    height: 50

    property string elapsedTime
    property string totalTime
    property real value: 0.0

    signal updatePosition(var value)

    Text {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        font.pixelSize: 20
        color: "white"
        text: root.elapsedTime
    }

    ProgressBar {
        id: progressBar
        implicitWidth: 500
        implicitHeight: 8
        anchors.centerIn: parent
        value: root.value

        background: Rectangle {
                implicitWidth: 200
                implicitHeight: 6
                color: "#e6e6e6"
                radius: 3
            }

            contentItem: Item {
                implicitWidth: 200
                implicitHeight: 4

                Rectangle {
                    width: progressBar.visualPosition * parent.width
                    height: parent.height
                    radius: 2
                    color: "red"
                }
            }
    }

    Text {
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        font.pixelSize: 20
        color: "white"
        text: root.totalTime
    }

    MouseArea {
        width: parent.width
        height: 50
        anchors.centerIn: root
        onPressed: {
            var newValue = LayoutMirroring.enabled ? ((1 - mouseX / root.width)) : (mouseX / root.width);
            root.updatePosition(newValue);
        }
    }
}
