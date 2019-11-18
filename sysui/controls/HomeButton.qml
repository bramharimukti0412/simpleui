import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import utils 1.0

RoundButton {
    id: root
    implicitWidth: 60
    implicitHeight: 60

    background: Rectangle {
        width: parent.width
        height: parent.height
        radius: height / 2
        color: "black"
    }

    contentItem: Item {
        Image {
            anchors.centerIn: parent
            width: 40
            height: 40
            fillMode: Image.PreserveAspectFit
            source: "../../imports/assets/ic-menu-home.png"
        }
    }
}
