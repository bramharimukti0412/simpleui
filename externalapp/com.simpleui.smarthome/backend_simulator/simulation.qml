import QtQuick 2.10
import Example.SmartHome.simulation 1.0

QtObject {
    property var settings : IviSimulator.findData(IviSimulator.simulationData, "HeatingValues")
    property bool defaultInitialized: false
    property LoggingCategory qLcHeatingValues: LoggingCategory {
        name: "example.smarthome.simulation.heatingvaluesbackend"
    }
    property var backend : HeatingValuesBackend {

        function initialize() {
            console.log(qLcSmartHomeValues, "INITIALIZE")
            if (!defaultInitialized) {
                IviSimulator.initializeDefault(settings, backend)
                defaultInitialized = true
            }
            Base.initialize()
        }

        Behavior on actualHeatingTempBRA { NumberAnimation { duration: 3000 } }
        Behavior on actualHeatingTempBRB { NumberAnimation { duration: 3000 } }
        Behavior on actualHeatingTempLR { NumberAnimation { duration: 3000 } }
        Behavior on actualHeatingTempBTR { NumberAnimation { duration: 3000 } }

        property var timer1: Timer {
            interval: 1000
            running: true
            repeat: true
            onTriggered: {
                if ((backend.actualHeatingTempBRA !== backend.targetHeatingTempBRA) && !backend.autoHeatingBRA) {
                    backend.actualHeatingTempBRA = backend.targetHeatingTempBRA;
                }
            }
        }

        property var timer2: Timer {
            interval: 1000
            running: true
            repeat: true
            onTriggered: {
                if ((backend.actualHeatingTempBRB !== backend.targetHeatingTempBRB) && !backend.autoHeatingBRB) {
                    backend.actualHeatingTempBRB = backend.targetHeatingTempBRB;
                }
            }
        }

        property var timer3: Timer {
            interval: 1000
            running: true
            repeat: true
            onTriggered: {
                if ((backend.actualHeatingTempLR !== backend.targetHeatingTempLR) && !backend.autoHeatingLR) {
                    backend.actualHeatingTempLR = backend.targetHeatingTempLR;
                }
            }
        }

        property var timer4: Timer {
            interval: 1000
            running: true
            repeat: true
            onTriggered: {
                if ((backend.actualHeatingTempBTR !== backend.targetHeatingTempBTR) && !backend.autoHeatingBTR) {
                    backend.actualHeatingTempBTR = backend.targetHeatingTempBTR;
                }
            }
        }
    }
}


