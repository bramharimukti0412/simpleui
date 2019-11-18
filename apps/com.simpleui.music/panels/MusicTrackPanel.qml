import QtQuick 2.4
import QtQuick.Controls 2.12
import utils 1.0
import "../controls"

Item {
    id: root

    property string currentTitle
    property string currentArtist
    property string currentAlbum
    property string currentAlbumArtSource
    property int currentIndex: 0
    property alias model: listView.model

    property bool isPlaying

    signal showAlbumList()
    signal showCurrentSong()
    signal playSong(var index)
    signal previousTrack()
    signal nextTrack()
    signal play()

    Item {
        id: albumContainer
        width: root.width
        height: 200

        anchors.top: parent.top
        anchors.topMargin: 20

        Row {
            anchors.left: parent.left
            anchors.leftMargin: 20
            spacing: 50

            Image {
                width: 180
                height: 180
                fillMode: Image.PreserveAspectFit
                opacity: 0.8
                source: root.currentAlbumArtSource
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        root.showAlbumList()
                    }
                }
            }

            Column {
                spacing: 15
                Label {
                    text: qsTr("ALBUM")
                    font.pixelSize: 15
                    color: "white"
                }

                Label {
                    text: root.currentAlbum
                    font.pixelSize: 35
                    color: "white"
                }

                Label {
                    text: qsTr("By ") + root.currentArtist
                    font.pixelSize: 25
                    color: "white"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            root.showAlbumList()
                        }
                    }
                }

                Label {
                    text: listView.count + " " + qsTr("tracks")
                    font.pixelSize: 25
                    color: "white"
                }
            }
        }

        Row {
            anchors.right: parent.right
            anchors.rightMargin: 20
            spacing: 25

            Label {
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("Show Current Song")
                font.pixelSize: 25
                color: "white"
                MouseArea {
                    anchors.fill: parent
                    onClicked: root.showCurrentSong()
                }
            }

            MusicButton {
                width: 60
                height: width

                anchors.verticalCenter: parent.verticalCenter
                iconSource: "../assets/ic_skipnext.png"
                onButtonClicked: root.showCurrentSong()
            }
        }
    }

    ListView {
        id: listView
        width: root.width - 40
        height: 225
        anchors.top: albumContainer.bottom
        anchors.left: parent.left
        anchors.leftMargin: 20
        clip: true
        delegate: ItemDelegate {
            id: delegated
            width: ListView.view.width
            text: modelData.name
            font.pixelSize: 20
            highlighted: index === root.currentIndex

            contentItem: Text {
                text: delegated.text
                font: delegated.font
                color: delegated.highlighted ? "orange" : "white"
                elide: Text.ElideRight
                verticalAlignment: Text.AlignVCenter
            }

            background: Rectangle {
                implicitWidth: delegated.width
                implicitHeight: 40
                opacity: enabled ? 1 : 0.3
                color: delegated.down ? "grey" : "black"

                Rectangle {
                    width: parent.width
                    height: 1
                    color: "white"
                    anchors.bottom: parent.bottom
                }
            }

            onClicked: {
                root.playSong(index);
                listView.currentIndex = index;
                root.play()
            }
        }
    }

    Column {
        anchors.left: parent.left
        anchors.leftMargin: 30
        anchors.top: listView.bottom
        anchors.topMargin: 30
        spacing: 15
        Label {
            width: 100
            text: root.currentTitle
            font.pixelSize: 18
            font.bold: true
            color: "white"
        }

        Label {
            width: 100
            text: root.currentArtist
            font.pixelSize: 15
            color: "white"
        }
    }

    MusicControlsPanel {
        id: musicControls
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.top: listView.bottom
        anchors.topMargin: 10
        showPlaylistButton: false
        isPlaying: root.isPlaying
        onPrevClicked: root.previousTrack()
        onNextClicked: root.nextTrack()
        onPlayClicked: root.play()
    }
}
