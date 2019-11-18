import QtQuick 2.13
import QtQuick.Controls 2.12
import QtQml.Models 2.13
import utils 1.0
import "../controls"

Item {
    id: root

    property int currentIndex: 0
    property string currentArtist
    property alias model: gridView.model

    signal itemClicked(var index, var albumName, var albumArt)
    signal showArtistList()

    Row {
        id: backButton
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 20
        spacing: 25

        MusicButton {
            width: 60
            height: width

            anchors.verticalCenter: parent.verticalCenter
            iconSource: "../assets/ic_skipprevious.png"
            onButtonClicked: root.showArtistList()
        }

        Label {
            anchors.verticalCenter: parent.verticalCenter
            text: qsTr("Show Artists")
            font.pixelSize: 25
            color: "white"
            MouseArea {
                anchors.fill: parent
                onClicked: root.showArtistList()
            }
        }
    }

    Label {
        id: currentArtistLabel
        anchors.top: backButton.bottom
        anchors.topMargin: 40
        anchors.left: parent.left
        anchors.leftMargin: 20
        text: qsTr("Album By: %1").arg(root.currentArtist)
        font.pixelSize: 25
        color: "white"
    }

    GridView {
        id: gridView
        height: 450
        width: root.width
        anchors.top: currentArtistLabel.bottom
        anchors.topMargin: 30
        anchors.left: parent.left
        anchors.leftMargin: 30
        cellWidth: root.width / 2
        cellHeight: 150
        clip: true
        delegate: Item {
            id: delegated
            width: 400
            height: 150

            Row {
                Image {
                    width: 150
                    height: width
                    fillMode: Image.PreserveAspectFit
                    scale: 0.7
                    source: "/Users/bramastyoharimuktisantoso/media/music/covers/" + modelData.name
                }

                Column {
                    anchors.top: parent.top
                    anchors.topMargin: 30
                    Label {
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignLeft
                        text: modelData.name
                        font.pixelSize: 25
                        color: "white"
                    }
                    Label {
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignLeft
                        text: root.currentArtist
                        font.pixelSize: 22
                        color: "grey"
                    }
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    root.itemClicked(index,
                                     modelData.name,
                                     "/Users/bramastyoharimuktisantoso/media/music/covers/" + modelData.name)
                }
            }
        }
    }
}
