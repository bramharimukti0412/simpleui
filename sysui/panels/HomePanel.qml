import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Qt.labs.folderlistmodel 2.12
import utils 1.0
import "../controls"

Item {
    id: root

    property var applicationModel
    property alias currentIndex: view.currentIndex

    signal appButtonClicked(var appName, var appIcon)

    SwipeView {
        id: view

        currentIndex: 1
        anchors.fill: parent

        Rectangle {
            id: firstpage
            color: "red"
        }
        GridView {
            id: appGridView

            anchors.verticalCenter: parent.verticalCenter
            cellWidth: appGridView.width / 4; cellHeight: appGridView.height / 2
            model: root.applicationModel
            interactive: false
            delegate:  AppButton {
                width: appGridView.cellWidth
                height: appGridView.cellHeight
                buttonWidth: 215
                buttonHeight: buttonWidth
                appIconSource: icon
                text: name
                onClicked: {
                    root.appButtonClicked(name, icon);
                    application.start("documentUrl");
                }
            }
        }
        Rectangle {
            id: thirdPage
            color: "blue"
        }
    }

    PageIndicator {
        id: control
        count: view.count
        currentIndex: view.currentIndex
        anchors.bottom: view.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        delegate: Rectangle {
            implicitWidth: 8
            implicitHeight: 8

            radius: width / 2
            color: Config.white

            opacity: index === control.currentIndex ? 0.95 : 0.45

            Behavior on opacity {
                OpacityAnimator {
                    duration: 100
                }
            }
        }
    }
}
