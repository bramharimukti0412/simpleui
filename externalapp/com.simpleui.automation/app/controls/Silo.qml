import QtQuick 2.4
import QtQuick.Controls 1.4

Image {
    id: root
    source: "../assets/Silo.png"

    property int tank1Value: 0
    property int tank2Value: 0
    property int tank3Value: 0

    function barConverter(value) {
        return value * 0.01
    }

    Row {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 60
        spacing: 140
        ProgressBar {
            width: 30
            height: 125
            value: root.barConverter(root.tank1Value)
            orientation: Qt.Vertical
        }

        ProgressBar {
            width: 30
            height: 125
            value: root.barConverter(root.tank2Value)
            orientation: Qt.Vertical
        }

        ProgressBar {
            width: 30
            height: 125
            value: root.barConverter(root.tank3Value)
            orientation: Qt.Vertical
        }
    }
}
