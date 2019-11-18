import QtQuick 2.4

import "../views"
import "../stores"
import "../controls"

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


