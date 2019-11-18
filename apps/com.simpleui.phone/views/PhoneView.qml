import QtQuick 2.4
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "../panels"
import "../stores"

Item {
    id: root

    property RootStore rootStore

    TabView {
        id: frame
        anchors.fill: parent
        anchors.margins: 4
        currentIndex: 3
        visible: !rootStore.onCall
        Tab {
            property string img: "../assets/ic-favorite.png"
            title: "favorites"
            FavoritesPanel {
                anchors.fill: parent
                model: rootStore.favoritesModel
                onItemClicked: {
                    rootStore.call(index, phone)
                }
            }
        }
        Tab {
            title: "recents"
            RecentsPanel {
                anchors.fill: parent
                model: rootStore.recentCallsModel
                onItemClicked: {
                    rootStore.call(index, phone)
                }
            }
        }
        Tab {
            title: "contacts"
            ContactsPanel {
                anchors.fill: parent
                model: rootStore.contactsModel
                onItemClicked: {
                    rootStore.call(index, phone)
                }
            }
        }
        Tab {
            title: "keypad"
            KeypadPanel {
                anchors.fill: parent
                onRequestToCall: rootStore.numberCall(number)
            }
        }
        Tab {
            title: "voicemail"
            VoiceMailPanel {
                anchors.fill: parent
                model: rootStore.voiceMailModel
                onItemClicked: {
                    rootStore.call(index, phone)
                }
            }
        }

        style: TabViewStyle {
            frameOverlap: 1
            tab: Rectangle {
                color: styleData.selected ? "#000000" :"#404040"
                implicitWidth: root.width / 5
                implicitHeight: 120
                radius: 2

                Image {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 20
                    width: 40
                    height: width
                    fillMode: Image.PreserveAspectFit
                    source: "../assets/ic-" + styleData.title
                }

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 20
                    text: styleData.title
                    font.capitalization: Font.Capitalize
                    color: "white"
                    font.pixelSize: 35
                }
            }
            frame: Rectangle { color: "#000000" }
        }
    }

    OnCallPanel {
        anchors.fill: parent
        firstName: rootStore.activeFirstName
        lastName: rootStore.activeLastName
        phoneNumber: rootStore.activePhoneNumber
        buttonModel: rootStore.buttonModel
        timer.running: rootStore.onCall
        visible: opacity > 0.1
        opacity: rootStore.onCall ? 1.0 : 0.0
        Behavior on opacity { NumberAnimation { duration: 200 } }
        onRequestToDropCall: rootStore.dropCall()
        onRequestToMuteCall: rootStore.muteCall()
        onRequestToShowKeypad: rootStore.showKeypad()
    }

    KeypadOnCallPanel {
        anchors.fill: parent
        visible: opacity > 0.1
        opacity: rootStore.showKeypadOnCall ? 1.0 : 0.0
        Behavior on opacity { NumberAnimation { duration: 200 } }
    }
}
