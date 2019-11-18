import QtQuick 2.4
import QtQuick.Layouts 1.3
import "../controls"

Item {
    id: root

    signal requestToCall(var number)
    Row {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 100
        spacing: 100
        GridLayout {
            id: gridlayout

            width: 300
            height: 340
            anchors.verticalCenter: parent.verticalCenter
            columns: 3

            KeypadButton {
                primaryText: "1"
                secondaryText: " " // to keep the "1" above
                onClicked: textedit.text += primaryText
            }
            KeypadButton {
                primaryText: "2"
                secondaryText: "ABC"
                onClicked: textedit.text += primaryText
            }
            KeypadButton {
                primaryText: "3"
                secondaryText: "DEF"
                onClicked: textedit.text += primaryText
            }
            KeypadButton {
                primaryText: "4"
                secondaryText: "GHI"
                onClicked: textedit.text += primaryText
            }
            KeypadButton {
                primaryText: "5"
                secondaryText: "JKL"
                onClicked: textedit.text += primaryText
            }
            KeypadButton {
                primaryText: "6"
                secondaryText: "MNO"
                onClicked: textedit.text += primaryText
            }
            KeypadButton {
                primaryText: "7"
                secondaryText: "PQRS"
                onClicked: textedit.text += primaryText
            }
            KeypadButton {
                primaryText: "8"
                secondaryText: "TUV"
                onClicked: textedit.text += primaryText
            }
            KeypadButton {
                primaryText: "9"
                secondaryText: "WXYZ"
                onClicked: textedit.text += primaryText
            }
            KeypadButton {
                primaryText: "*"
                onClicked: textedit.text += primaryText
            }
            KeypadButton {
                primaryText: "0"
                secondaryText: "+"
                onClicked: textedit.text += primaryText
            }
            KeypadButton {
                primaryText: "#"
                onClicked: textedit.text += primaryText
            }
        }

        Column {
            anchors.verticalCenter: parent.verticalCenter
            spacing: 100
            TextEdit {
                id: textedit
                width: root.width / 2
                height: 50

                readOnly: true
                color: "white"
                inputMethodHints: Qt.ImhDialableCharactersOnly
                font.pixelSize: 25
                font.weight: Font.Light
                horizontalAlignment: TextEdit.AlignHCenter
                verticalAlignment: TextEdit.AlignVCenter
                Keys.onEscapePressed: clear()

                Rectangle {
                    anchors.fill: parent
                    color: "transparent"
                    border.color: "white"
                    radius: 10

                    Image {
                        id: eraseButton
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 10
                        source: "../assets/ic-erase.png"

                        MouseArea {
                            anchors.fill: parent
                            onPressed: eraseButton.scale = 0.9
                            onReleased: eraseButton.scale = 1.0
                            onClicked: textedit.remove(textedit.length - 1, textedit.length);
                        }
                    }
                }
            }

            PhoneControl {
                id: callButton
                anchors.horizontalCenter: parent.horizontalCenter
                backgroundColor: "green"
                iconSource: "../assets/ic-call-contrast.png"
                onClicked: root.requestToCall(textedit.text)
            }
        }
    }
}
