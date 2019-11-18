import QtQuick 2.4

QtObject {
    id: root

    // Room Model
    readonly property ListModel roomModel: ListModel {
        id: roomModel

        ListElement {
            name: "Bed Room A"
            actualTempLevel: 0.0
            targetTempLevel: 0.0
            autoHeating: false
        }
        ListElement {
            name: "Bed Room B"
            actualTempLevel: 0.0
            targetTempLevel: 0.0
            autoHeating: false
        }
        ListElement {
            name: "Living Room"
            actualTempLevel: 0.0
            targetTempLevel: 0.0
            autoHeating: false
        }
        ListElement {
            name: "Bath Room"
            actualTempLevel: 0.0
            targetTempLevel: 0.0
            autoHeating: false
        }
    }
}
