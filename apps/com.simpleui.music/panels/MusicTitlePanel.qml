import QtQuick 2.4

Column {
    id: root

    property alias title: title.text
    property alias album: album.text
    property alias artist: artist.text

    spacing: 20
    Text {
        id: title
        width: 800
        color: "white"
        font.pixelSize: 40
    }

    Text {
        id: album
        width: 800
        color: "white"
        font.pixelSize: 20
    }

    Text {
        id: artist
        width: 800
        color: "white"
        font.pixelSize: 20
    }
}
