import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick 2.12

ProgressBar {
    id: root

    orientation: Qt.Vertical
    style: ProgressBarStyle {
        background: Rectangle {
            radius: 2
            color: "lightgray"
            border.color: "gray"
            border.width: 1
            implicitWidth: 200
            implicitHeight: 24
        }
        progress: Rectangle {
            color: "green"
            border.color: "white"
        }
    }
}
