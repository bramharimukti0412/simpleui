import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQml 2.13
import utils 1.0
import "../controls"

Item {
    id: root

    property string timeString

    RowLayout {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: root.left
        anchors.leftMargin: 20
        Layout.fillHeight: true
        spacing: 30

        Image {
            fillMode: Image.PreserveAspectFit
            source: "../../imports/assets/ic-statusbar-reception.png"
        }

        Image {
            fillMode: Image.PreserveAspectFit
            source: "../../imports/assets/ic-statusbar-wifi.png"
        }

        Image {
            fillMode: Image.PreserveAspectFit
            source: "../../imports/assets/ic-statusbar-bluetooth.png"
        }

        Image {
            fillMode: Image.PreserveAspectFit
            source: "../../imports/assets/ic-statusbar-battery.png"
        }
    }

    Label {
        anchors.right: root.right
        anchors.rightMargin: 20
        Layout.alignment: Qt.AlignHCenter
        color: Config.white
        text: root.timeString
        font.pixelSize: 28
    }
}
