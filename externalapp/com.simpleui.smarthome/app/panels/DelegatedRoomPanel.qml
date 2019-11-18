import QtQuick 2.4
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../panels"
import "../controls"

Rectangle {
    id: root

    property string title
    property real actualValue
    property real targetValue

    signal setTargetTemp(var value)

    color: "transparent"
    radius: 4
    border.width: 2
    border.color: "white"

    Text {
        id: title
        text: root.title
        font.pixelSize: 20
        color: "white"
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
    }

    SmartHomeSwitch {
        id: autoSwitch
        anchors.top: parent.top
        anchors.topMargin: 4
        anchors.right: parent.right
        anchors.rightMargin: 10
    }

    Rectangle {
        width: parent.width
        height: 1
        anchors.top: title.bottom
        anchors.topMargin: 10
    }

    Column {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 20
        spacing: 10

        Label {
            text: "Target"
            color: "white"
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 20
        }

        SmartHomeProgressBar {
            width: 10
            height: 150
            anchors.horizontalCenter: parent.horizontalCenter
            value: root.targetValue
        }
    }

    SmartHomeDial {
        Layout.preferredWidth: 150
        Layout.preferredHeight: 150
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        enabled: autoSwitch.position === 0.0

        onValueChanged: root.setTargetTemp(value)
    }

    Column {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.right: parent.right
        anchors.rightMargin: 20
        spacing: 10

        Label {
            text: "Actual"
            color: "white"
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 20
        }

        SmartHomeProgressBar {
            width: 10
            height: 150
            anchors.horizontalCenter: parent.horizontalCenter
            value: root.actualValue
        }
    }
}
