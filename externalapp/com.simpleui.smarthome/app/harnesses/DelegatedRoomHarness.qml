import QtQuick 2.4
import "../panels"

Item {
    id: root

    width: 500
    height: 275

    //background
    Rectangle {
        color: "black"
        anchors.fill: parent
    }

    DelegatedRoomPanel {
        width: 480
        height: 260
        title: "Dummy Room"
        actualValue: 0.0
        targetValue: 0.0

        Behavior on actualValue { NumberAnimation { duration: 3000 } }

        onSetTargetTemp: {
            actualValue = value;
            targetValue = value;
        }
    }
}
