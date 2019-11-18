import QtQuick 2.4
import utils 1.0
import "../controls"

Item {
    id: root

    property alias buttonModel: buttonDelegate.model

    property string firstName
    property string lastName
    property string phoneNumber
    property alias timer: callTimer

    property real currentTime: 0000
    property string callDuration: Qt.formatTime(new Date(root.currentTime), 'mm:ss')

    signal requestToDropCall()
    signal requestToMuteCall()
    signal requestToShowKeypad()

    Rectangle {
        color: "black"
        anchors.fill: parent
    }

    Timer {
        id: callTimer
        interval: 1000; repeat: true
        onTriggered: root.currentTime = root.currentTime + 1000
    }

    Column {
        anchors.top: parent.top
        anchors.topMargin: 120
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 90

        Column {
            spacing: 10
            Text {
                width: 1000
                horizontalAlignment: Text.AlignHCenter
                text: root.firstName + " " + root.lastName
                font.pixelSize: 60
                color: "white"
            }

            Text {
                width: 1000
                horizontalAlignment: Text.AlignHCenter
                text: root.phoneNumber
                font.pixelSize: 30
                color: "grey"
            }

            Text {
                width: 1000
                horizontalAlignment: Text.AlignHCenter
                text: root.callDuration
                font.pixelSize: 30
                color: "white"
            }
        }

        Row {
            anchors.left: parent.left
            anchors.leftMargin: 40
            spacing: 50

            Repeater {
                id: buttonDelegate
                delegate: Item {
                    width: 200
                    height: width
                    PhoneControl {
                        width: 150
                        height: 150
                        property bool active: false
                        anchors.horizontalCenter: parent.horizontalCenter
                        backgroundColor: active ? "green" : buttonColor
                        border.color: "white"
                        border.width: 2
                        iconSource: icon
                        onClicked: {
                            if (index === 0) {
                                root.currentTime = 0;
                                root.requestToDropCall();
                            } else if (index === 1) {
                                active = !active;
                            }
                        }
                    }
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottom: parent.bottom
                        text: name
                        font.pixelSize: 30
                        color: "white"
                    }
                }
            }
        }
    }
}
