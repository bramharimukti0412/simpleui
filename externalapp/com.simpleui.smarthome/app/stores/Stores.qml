import QtQuick 2.4
import Example.SmartHome 1.0

AbstractStore {
    id: root

    readonly property HeatingValues heatingValues: HeatingValues {
        id: heatingValues
    }

    /*
     * Bedroom A
     */
    readonly property real actualHeatingTempBRA: heatingValues.actualHeatingTempBRA
    readonly property real targetHeatingTempBRA: heatingValues.targetHeatingTempBRA

    onActualHeatingTempBRAChanged: roomModel.setProperty(0, "actualTempLevel", actualHeatingTempBRA)
    onTargetHeatingTempBRAChanged: roomModel.setProperty(0, "targetTempLevel", targetHeatingTempBRA)

    /*
     * Bedroom B
     */
    readonly property real actualHeatingTempBRB: heatingValues.actualHeatingTempBRB
    readonly property real targetHeatingTempBRB: heatingValues.targetHeatingTempBRB

    onActualHeatingTempBRBChanged: roomModel.setProperty(1, "actualTempLevel", actualHeatingTempBRB)
    onTargetHeatingTempBRBChanged: roomModel.setProperty(1, "targetTempLevel", targetHeatingTempBRB)

    /*
     * Living Room
     */
    readonly property real actualHeatingTempLR: heatingValues.actualHeatingTempLR
    readonly property real targetHeatingTempLR: heatingValues.targetHeatingTempLR

    onActualHeatingTempLRChanged: roomModel.setProperty(2, "actualTempLevel", actualHeatingTempLR)
    onTargetHeatingTempLRChanged: roomModel.setProperty(2, "targetTempLevel", targetHeatingTempLR)

    /*
     * Bathroom
     */
    readonly property real actualHeatingTempBTR: heatingValues.actualHeatingTempBTR
    readonly property real targetHeatingTempBTR: heatingValues.targetHeatingTempBTR

    onActualHeatingTempBTRChanged: roomModel.setProperty(3, "actualTempLevel", actualHeatingTempBTR)
    onTargetHeatingTempBTRChanged: roomModel.setProperty(3, "targetTempLevel", targetHeatingTempBTR)

    function setTargetTemp(index, newValue) {
        switch(index) {
        case 0:
            heatingValues.targetHeatingTempBRA = newValue;
            break;
        case 1:
            heatingValues.targetHeatingTempBRB = newValue;
            break;
        case 2:
            heatingValues.targetHeatingTempLR = newValue;
            break;
        case 3:
            heatingValues.targetHeatingTempBTR = newValue;
            break;
        default:
            console.log("index is not found")
        }
    }

    function setAutoHeating(newValue) {
        switch(index) {
        case 0:
            heatingValues.autoHeatingBRA = newValue;
            break;
        case 1:
            heatingValues.autoHeatingBRB = newValue;
            break;
        case 2:
            heatingValues.autoHeatingLR = newValue;
            break;
        case 3:
            heatingValues.autoHeatingBTR = newValue;
            break;
        default:
            console.log("index is not found")
        }
    }
}
