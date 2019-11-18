import QtQuick 2.12
import utils 1.0
import "../controls"

Rectangle {
    id: root

    color: "black"
    opacity: 0.9
    Text {
        anchors.centerIn: parent
        text: qsTr("No Notification")
        font.pixelSize: 20
        color: "white"
    }
}
