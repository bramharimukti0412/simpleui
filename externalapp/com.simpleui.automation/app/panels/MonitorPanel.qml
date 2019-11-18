import QtQuick 2.4
import QtQuick.Controls 1.4

import "../controls"

Rectangle {
    id: root

    width: 500
    height: 350
    color: "transparent"
    border.color: "white"
    border.width: 2
    radius: 4

    property int tank1Value: 0
    property int tank2Value: 0
    property int tank3Value: 0

    Label {
        text: "Filling Level"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 30
        font.pixelSize: 30
    }

    Rectangle {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 30
        anchors.horizontalCenter: parent.horizontalCenter
        width: 400
        height: 200
        color: "transparent"
        border.color: "white"


        Column {
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 70
            spacing: 35

            Row {
                spacing: 150
                Label {
                    text: "Tank 1"
                    font.pixelSize: 30
                }

                Label {
                    text: root.tank1Value + " %"
                    font.pixelSize: 30
                }
            }

            Row {
                spacing: 150
                Label {
                    text: "Tank 2"
                    font.pixelSize: 30
                }

                Label {
                    text: root.tank2Value + " %"
                    font.pixelSize: 30
                }
            }

            Row {
                spacing: 150
                Label {
                    text: "Tank 3"
                    font.pixelSize: 30
                }

                Label {
                    text: root.tank3Value + " %"
                    font.pixelSize: 30
                }
            }
        }
    }
}
