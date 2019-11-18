import QtQuick 2.4
import "../stores"
import "../panels"

Item {
    id: root
    property Stores rootStore

    MainSiloPanel {
        width: 300
        height: 100
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 50

        tank1Value: rootStore.tank1Value
        tank2Value: rootStore.tank2Value
        tank3Value: rootStore.tank3Value
    }

    MonitorPanel {
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.verticalCenter: parent.verticalCenter

        tank1Value: rootStore.tank1Value
        tank2Value: rootStore.tank2Value
        tank3Value: rootStore.tank3Value
    }
}
