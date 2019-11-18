import QtQuick 2.4
import Example.Automation 1.0

QtObject {
    id: root

    property int tank1Value: tankValues.tankValue1
    property int tank2Value: tankValues.tankValue2
    property int tank3Value: tankValues.tankValue3

    readonly property TankValues tankValues: TankValues {
        id: tankValues
    }

//    property SequentialAnimation seqAnimation: SequentialAnimation {
//        running: true
//        loops: Animation.Infinite
//        PropertyAnimation {
//                target: root;
//                property: "tank1Value";
//                to: 100;
//                duration: 10000
//                running: root.tank1Value < 101
//            }
//        PropertyAnimation {
//                target: root;
//                property: "tank1Value";
//                to: 0;
//                duration: 10000
//                running: root.tank1Value > 0
//            }
//    }

//    property SequentialAnimation seqAnimation2: SequentialAnimation {
//        running: true
//        loops: Animation.Infinite
//        PropertyAnimation {
//                target: root;
//                property: "tank2Value";
//                to: 100;
//                duration: 8000
//                running: root.tank2Value < 101
//            }
//        PropertyAnimation {
//                target: root;
//                property: "tank2Value";
//                to: 0;
//                duration: 9000
//                running: root.tank2Value > 0
//            }
//    }

//    property SequentialAnimation seqAnimation3: SequentialAnimation {
//        running: true
//        loops: Animation.Infinite
//        PropertyAnimation {
//                target: root;
//                property: "tank3Value";
//                to: 100;
//                duration: 11000
//                running: root.tank3Value < 101
//            }
//        PropertyAnimation {
//                target: root;
//                property: "tank3Value";
//                to: 0;
//                duration: 10000
//                running: root.tank3Value > 0
//            }
//    }
}
