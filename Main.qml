import QtQuick 2.4

import "sysui/views"
import "sysui/stores"
import "sysui/controls"

Rectangle {
    id: root
    width: 1280
    height: 680

    color: "black"

    MainView {
        anchors.fill: parent
        rootStore: RootStore { }
    }
}


