import QtQuick 2.4
import "../controls"


Item {
    id: root

    width: 800
    height: 100

    property bool isPlaying: false
    property bool showPlaylistButton: true

    signal playClicked()
    signal nextClicked()
    signal prevClicked()
    signal showPlaylistClicked()

    Rectangle {
        anchors.fill: parent
        color: "#2E2E2E"
        radius: 10
        opacity: 0.5
    }

    Row {
        anchors.centerIn: parent
        spacing: 175

        MusicButton {
            width: 60
            height: width
            anchors.verticalCenter: parent.verticalCenter
            iconSource: "../assets/ic_skipprevious.png"
            onButtonClicked: root.prevClicked()
        }

        Rectangle {
            width: 75
            height: width
            radius: width / 2
            color: "#FF8000"
            MusicButton {
                anchors.centerIn: parent
                width: 60
                height: width
                iconSource: isPlaying ? "../assets/ic_pause.png" : "../assets/ic_play.png"
                onButtonClicked: root.playClicked()
            }

        }

        MusicButton {
            width: 60
            height: width
            anchors.verticalCenter: parent.verticalCenter
            iconSource: "../assets/ic_skipnext.png"
            onButtonClicked: root.nextClicked()
        }
    }

    MusicButton {
        width: 60
        height: width
        anchors.right: parent.right
        anchors.rightMargin: 30
        anchors.verticalCenter: parent.verticalCenter
        iconSource: "../assets/ic-playlists"
        visible: root.showPlaylistButton
        onButtonClicked: root.showPlaylistClicked()
    }
}

