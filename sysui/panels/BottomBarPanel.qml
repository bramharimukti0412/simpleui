import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQml 2.13
import utils 1.0
import "../controls"

Item {
    id: root

    property ListModel recentAppModel

    signal homeButtonClicked()
    signal appButtonClicked(var index, var color)

    RowLayout {
        anchors.left: parent.left
        anchors.leftMargin: 50
        anchors.verticalCenter: parent.verticalCenter
        Layout.fillHeight: true
        spacing: 100

        HomeButton {
            onClicked: root.homeButtonClicked()
        }

        Repeater {
            model: root.recentAppModel
            AppButton {
                width: 60
                height: 60
                text: name
                appIconSource: appIcon
                showLabel: false
                showShadow: false
                //onClicked: root.appButtonClicked(index, buttonColor)
            }
        }

        // spacer
        Item {
            width: 150
            height: 30
        }
    }

    Rectangle {
        width: 1
        height: root.height
        anchors.right: parent.right
    }
}
