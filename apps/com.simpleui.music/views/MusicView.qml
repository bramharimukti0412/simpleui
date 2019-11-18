import QtQuick 2.4
import QtQuick.Controls 2.12
import utils 1.0
import "../stores"
import "../controls"
import "../panels"

Item {
    id: root

    property MusicStore musicStore

    StackView {
        id: stack
        initialItem: artists
        anchors.fill: parent
    }

    Component {
        id: currentSong
        MusicCurrentSongPanel {
            currentArtist: musicStore.currentArtist
            currentAlbum: musicStore.currentAlbum
            currentTitle: musicStore.currentTitle
            currentAlbumArtSource: musicStore.currentAlbumArtSource

            currentTrackPosition: musicStore.currentTrackPosition
            elapsedTime: musicStore.elapsedTime
            totalTime: musicStore.totalTime

            isPlaying: musicStore.isPlaying

            onPreviousTrack: musicStore.previousTrack()
            onNextTrack: musicStore.nextTrack()
            onPlay: musicStore.play()
            onShowPlaylist: {
                stack.replace(tracks)
            }
        }
    }

    Component {
        id: tracks
        MusicTrackPanel {
            model: musicStore.musicModel
            currentTitle: musicStore.currentTitle
            currentArtist: musicStore.currentArtist
            currentAlbum: musicStore.currentAlbum
            currentAlbumArtSource: musicStore.currentAlbumArtSource
            currentIndex: musicStore.currentSongIndex
            onShowCurrentSong: {
                stack.replace(currentSong)
            }
            onPlaySong: musicStore.currentSongIndex = index
            isPlaying: musicStore.isPlaying

            onPreviousTrack: musicStore.previousTrack()
            onNextTrack: musicStore.nextTrack()
            onPlay: musicStore.play()
            onShowAlbumList: {
                stack.replace(albums)
            }
        }
    }

    Component {
        id: albums
        MusicAlbumPanel {
            model: musicStore.albumModel
            currentArtist: musicStore.currentArtist
            onItemClicked: {
                musicStore.currentSelectedAlbumIndex = index;
                musicStore.currentAlbumArtSource = albumArt;
                musicStore.selectAlbum();
                stack.replace(tracks);
            }
            onShowArtistList: {
                stack.replace(artists)
            }
        }
    }

    Component {
        id: artists
        MusicArtistPanel {
            model: musicStore.artistModel
            currentIndex: musicStore.currentSelectedArtistIndex
            onItemClicked: {
                musicStore.currentSelectedArtistIndex = index;
                stack.replace(albums)
            }
        }
    }
}
