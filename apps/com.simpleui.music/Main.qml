import QtQuick 2.4
import QtApplicationManager.Application 2.0
import "views"
import "stores"

ApplicationManagerWindow {
    id: root

    Rectangle {
        anchors.fill: parent
        color: "black"
    }

    MusicView {
        anchors.fill: parent
        musicStore: MusicStore {}
    }
}
