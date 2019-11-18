import QtQuick 2.12
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.12
import utils 1.0

Item {
    id: root

    property alias text: buttonLabel.text
    //property alias buttonColor: button.color
    property alias buttonWidth: button.width
    property alias buttonHeight: button.height
    property alias appIconSource: appIcon.source
    property bool showShadow: true
    property bool showLabel: true

    signal clicked()

    Item {
        id: button
        anchors.centerIn: parent
        width: 100
        height: 100
        //radius: 30
        //color: "transparent"
        //border.width: 1
        //border.color: "white"

        Image {
            width: parent.width
            fillMode: Image.PreserveAspectFit
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            source: "../../imports/assets/bottom-shadow.png"
            visible: showShadow
        }

        Image {
            id: appIcon
            anchors.centerIn: parent
            width: button.width * 0.4
            height: width
            fillMode: Image.PreserveAspectFit
        }

        Label {
            id: buttonLabel
            anchors.top: appIcon.bottom
            anchors.topMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 20
            color: Config.white
            visible: root.showLabel
        }

        MouseArea {
            anchors.fill: parent
            onPressed: appIcon.scale = 0.9
            onReleased: appIcon.scale = 1.0
            onClicked: root.clicked()
        }
    }
}
