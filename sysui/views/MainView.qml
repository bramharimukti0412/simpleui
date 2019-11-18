import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import utils 1.0
import "../stores"
import "../panels"

Item {
    id: root

    property AbstractStore rootStore

    Image {
        id: background
        anchors.fill: parent
        opacity: 0.3
        source: "../../imports/assets/bg.jpg"
    }

    TopBarPanel {
        id: topBar
        anchors.top: parent.top
        height: 30
        width: parent.width
        timeString: rootStore.timeString
    }

    BottomBarPanel {
        id: bottomBar
        anchors.bottom: parent.bottom
        width: root.width
        height: 80
        recentAppModel: rootStore.recentAppsModel
        onHomeButtonClicked: {
            root.state = "homeView";
            homePanel.currentIndex = 1;
        }
    }

    HomePanel {
        id: homePanel
        anchors.top: topBar.bottom
        width: root.width
        height: root.height - bottomBar.height - topBar.height
        clip: true
        applicationModel: rootStore.applicationModel
        onAppButtonClicked: {
            rootStore.insertRecentApp(appName, appIcon);
            root.state = "appView"
        }
    }

    AppPanel {
        id: appPanel
        anchors.top: topBar.bottom
        width: root.width
        height: root.height - bottomBar.height - topBar.height
        appWindow: rootStore.currentAppWindow
        Behavior on opacity { NumberAnimation { duration: 270 } }
        Behavior on scale { NumberAnimation { duration: 170 } }

        onOpacityChanged: {
            if (opacity === 0.0) {
                rootStore.releaseAppWindow();
            }
        }
    }

// Notification
    Rectangle {
        anchors.fill: homePanel
        color: "black"
        opacity: 0.5
        visible: notificationPanel.showNotificationCenter

        MouseArea {
            anchors.fill: parent
            onClicked: notificationPanel.showNotificationCenter = !notificationPanel.showNotificationCenter
        }
    }

    NotificationPanel {
        id: notificationPanel
        width: parent.width
        anchors.horizontalCenter: homePanel.horizontalCenter
    }

    state: "homeView"
    states: [
        State {
            name: "homeView"
            PropertyChanges { target: appPanel; opacity: 0.0 }
            PropertyChanges { target: appPanel; scale: 0.6 }
            PropertyChanges { target: homePanel; visible: true }
        },

        State {
            name: "appView"
            PropertyChanges { target: appPanel; opacity: 1.0 }
            PropertyChanges { target: appPanel; scale: 1.0 }
            PropertyChanges { target: homePanel; visible: false }
        }
    ]
}
