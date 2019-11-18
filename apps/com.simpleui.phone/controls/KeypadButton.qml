import QtQuick 2.8
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2

Item {
    id: root
    width: 80
    height: 80

    property alias primaryText: primaryLabel.text
    property alias secondaryText: secondaryLabel.text
    property alias iconSource: img.source

    signal clicked()

    Rectangle {
        id: bg
        color: "transparent"
        border.color: "white"
        border.width: 2
        anchors.fill: parent
        radius: width / 2
    }

    MouseArea {
        id: mouseArea
        enabled: root.enabled
        anchors.fill: parent
        onReleased: root.clicked()
    }

    ColumnLayout {
        id: column
        anchors.centerIn: parent
        visible: root.primaryText

        Label {
            id: primaryLabel
            Layout.alignment: Qt.AlignHCenter
            font.weight: Font.Light
            font.pixelSize: 25
            color: "white"
        }

        Label {
            id: secondaryLabel
            Layout.alignment: Qt.AlignHCenter
            visible: text
            font.pixelSize: 15
            color: "white"
        }
    }

    Image {
        id: img
        anchors.centerIn: parent
        visible: root.iconSource
    }

    transformOrigin: Item.Top
    scale: mouseArea.containsPress ? 0.95 : 1.0
}
