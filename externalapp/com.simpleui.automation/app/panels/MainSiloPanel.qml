import QtQuick 2.4
import "../controls"

Item {
    id: root

    property alias tank1Value: siloPanel.tank1Value
    property alias tank2Value: siloPanel.tank2Value
    property alias tank3Value: siloPanel.tank3Value

    Silo {
        id: siloPanel
        anchors.verticalCenter: parent.verticalCenter
    }
}
