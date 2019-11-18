import QtQuick 2.4
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../panels"
import "../stores"

Item {
    id: root

    width: 1000
    height: 550

    property AbstractStore mockStore: AbstractStore {
        id: mockStore

        function setTargetTemp(index, newValue) {
            switch(index) {
            case 0:
                roomModel.setProperty(0, "actualTempLevel", newValue)
                roomModel.setProperty(0, "targetTempLevel", newValue)
                break;
            case 1:
                roomModel.setProperty(1, "actualTempLevel", newValue)
                roomModel.setProperty(1, "targetTempLevel", newValue)
                break;
            case 2:
                roomModel.setProperty(2, "actualTempLevel", newValue)
                roomModel.setProperty(2, "targetTempLevel", newValue)
                break;
            case 3:
                roomModel.setProperty(3, "actualTempLevel", newValue)
                roomModel.setProperty(3, "targetTempLevel", newValue)
                break;
            default:
                console.log("index is not found")
            }
        }

        function setAutoHeating(newValue) {
            switch(index) {
            case 0:
                roomModel.setProperty(0, "autoHeating", newValue)
                break;
            case 1:
                roomModel.setProperty(1, "autoHeating", newValue)
                break;
            case 2:
                roomModel.setProperty(2, "autoHeating", newValue)
                break;
            case 3:
                roomModel.setProperty(3, "autoHeating", newValue)
                break;
            default:
                console.log("index is not found")
            }
        }
    }

    Rectangle {
        color: "black"
        anchors.fill: parent
    }

    HeatingPanel {
        anchors.fill: parent
        roomModel: mockStore.roomModel
        onSetTargetTemp: mockStore.setTargetTemp(index, value)
    }
}
