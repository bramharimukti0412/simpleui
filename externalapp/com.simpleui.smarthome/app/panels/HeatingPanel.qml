import QtQuick 2.4
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../panels"
import "../controls"

Item {
    id: root
    property alias roomModel: view.model
    signal setTargetTemp(var index, var value)

    GridView {
        id: view
        anchors.centerIn: parent
        width: 1000; height: 550
        cellWidth: 500; cellHeight: 275

        delegate: DelegatedRoomPanel {
            width: 480
            height: 260
            title: name
            actualValue: actualTempLevel
            targetValue: targetTempLevel

            onSetTargetTemp: root.setTargetTemp(index, value)
        }
    }
}
