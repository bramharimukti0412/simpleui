import QtQuick 2.4
import QtQuick.Controls 2.12
import utils 1.0
import "../controls"

Item {
    id: root

    property int currentIndex: 0
    property alias model: gridViewModel.model

    signal itemClicked(var index)

    GridView {
        id: gridViewModel
        height: root.height
        width: root.width
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 30
        cellWidth: root.width / 3
        cellHeight: 300

        delegate: Rectangle {
            id: delegated
            width: 300
            height: 240
            color: "transparent"
            radius: 20
            border.color: "white"

            Label {
                width: 280
                anchors.centerIn: parent
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                text: modelData.name
                font.pixelSize: 25
                color: "white"
            }

            Image {
                width: parent.width
                fillMode: Image.PreserveAspectFit
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                source: "../assets/bottom-shadow.png"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    root.itemClicked(index)
                }
            }
        }
    }
}
