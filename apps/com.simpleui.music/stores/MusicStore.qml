import QtQuick 2.4
import QtMultimedia 5.13

import GraphQL 1.0

QtObject {
    id: root

    property MediaPlayer mediaPlayer: MediaPlayer {
        id: mediaPlayer
        source: "http://localhost:8080/media/" + root.album.tracks[root.currentSongIndex].mediaSource
    }

    property int currentSelectedArtistIndex: 0
    onCurrentSelectedArtistIndexChanged: {
        console.log("currentSelectedArtistIndex:: ", currentSelectedArtistIndex)
        root.albumModel.source = root.artist[root.currentSelectedArtistIndex].albums;
        root.currentArtist = root.artist[root.currentSelectedArtistIndex].name
    }

    property int currentSelectedAlbumIndex: 0

    property int currentSongIndex: 0
    onCurrentSongIndexChanged: {
        root.currentArtist = root.artist[root.currentSelectedArtistIndex].name
        root.currentAlbum = root.album.name
        root.currentTitle = root.album.tracks[currentSongIndex].name
    }

    property string currentArtist
    property string currentAlbum
    property string currentTitle
    property string currentAlbumArtSource: "assets/album-art-placeholder.png"

    property bool isPlaying: mediaPlayer.playbackState === MediaPlayer.PlayingState
    property bool wasPlaying: false
    property string elapsedTime: Qt.formatTime(new Date(mediaPlayer.position), 'mm:ss')
    property string totalTime: Qt.formatTime(new Date(mediaPlayer.duration), 'mm:ss')
    property real currentTrackPosition : mediaPlayer.position / mediaPlayer.duration

    property var artist
    property var album
    onAlbumChanged: {
        root.currentArtist = root.album.artist.name
        root.currentAlbum = root.album.name
        root.currentTitle = root.album.tracks[currentSongIndex].name
    }


    // Data sources
    property GraphQLQuery client: GraphQLQuery {
        id: query
        name: "album"
        query: 'musicArtistPage (offset:0, limit:10) { entries { name albums { name  tracks { name mediaSource } } } }'
        isActive: true

        onResultChanged: {
            artistModel.source = result.musicArtistPage.entries
            root.artist = result.musicArtistPage.entries;
        }
    }

    property GraphQLModel musicModel: GraphQLModel {
        id: musicModel
        fields: ["name", "mediaSource", "coverSource" ]
    }

    property GraphQLModel albumModel: GraphQLModel {
        id: albumModel
        fields: ["name", "tracks", "coverSource"]
    }

    property GraphQLModel artistModel: GraphQLModel {
        id: artistModel
        fields: ["name", "album"]
    }

    function selectAlbum() {
        root.musicModel.source = root.artist[root.currentSelectedArtistIndex].albums[currentSelectedAlbumIndex].tracks;
        root.album = root.artist[root.currentSelectedArtistIndex].albums[root.currentSelectedAlbumIndex];
        root.currentArtist = root.artist[root.currentSelectedArtistIndex].name
        root.currentAlbum = root.album.name
        root.currentTitle = root.album.tracks[currentSongIndex].name
    }

    function previousTrack() {
        if (root.currentSongIndex > 0) {
            root.currentSongIndex = root.currentSongIndex - 1;
        } else {
            root.currentSongIndex = root.album.tracks.length - 1;
        }

        if (root.wasPlaying) {
            mediaPlayer.play();
        }
    }

    function play() {
        if (root.isPlaying) {
            mediaPlayer.pause();
            root.wasPlaying = false;
        } else {
            mediaPlayer.play();
            root.wasPlaying = true;
        }
    }

    function nextTrack() {
        if (root.currentSongIndex < root.album.tracks.length - 1) {
            root.currentSongIndex = root.currentSongIndex + 1;
        } else {
            root.currentSongIndex = 0;
        }

        if (root.wasPlaying) {
            mediaPlayer.play();
        }
    }
}

