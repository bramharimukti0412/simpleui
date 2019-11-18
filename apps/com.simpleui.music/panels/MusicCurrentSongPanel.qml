import QtQuick 2.4
import "../controls"
import "../panels"

Item {
    id: root

    property string currentArtist
    property string currentTitle
    property string currentAlbum
    property string currentAlbumArtSource

    property real currentTrackPosition
    property string elapsedTime
    property string totalTime

    property bool isPlaying

    signal previousTrack()
    signal nextTrack()
    signal play()
    signal showPlaylist()

    Image {
        id: albumArt
        anchors.left: musicControls.left
        anchors.top: parent.top
        anchors.topMargin: height / 2
        width: 250
        height: width
        opacity: 0.5
        fillMode: Image.PreserveAspectFit
        source: root.currentAlbumArtSource
    }

    MusicTitlePanel {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 170
        anchors.left: albumArt.right
        anchors.leftMargin: 25

        title: root.currentTitle
        album: root.currentAlbum
        artist: root.currentArtist
    }

    MusicProgress {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: musicControls.top
        elapsedTime: root.elapsedTime
        totalTime: root.totalTime
        value: root.currentTrackPosition
    }

    MusicControlsPanel {
        id: musicControls
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: root.bottom
        anchors.bottomMargin: 70
        isPlaying: root.isPlaying
        onPrevClicked: root.previousTrack()
        onNextClicked: root.nextTrack()
        onPlayClicked: root.play()
        onShowPlaylistClicked: root.showPlaylist()
    }
}
