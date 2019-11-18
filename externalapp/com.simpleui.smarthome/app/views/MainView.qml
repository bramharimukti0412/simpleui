import QtQuick 2.4

import "../stores"
import "../panels"

Item {
    id: root
    property Stores rootStore

    HeatingPanel {
        anchors.fill: parent
        roomModel: rootStore.roomModel
        onSetTargetTemp: {
            rootStore.setTargetTemp(index, value)
        }
    }
}
