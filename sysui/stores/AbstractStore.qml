import QtQuick 2.12
import QtQml 2.13

QtObject {
    id: root

    property ListModel recentAppsModel: ListModel {}
    property var locale: Qt.locale()
    property date currentTime: new Date()
    property string timeString

    // ApplicationManager APIs
    property var applicationModel

    // Current Active Window
    property var currentAppWindow

    Component.onCompleted: {
        timeString = currentTime.toLocaleTimeString(locale, Locale.ShortFormat);
    }

    function insertRecentApp(appName, appIcon) {
        if (root.recentAppsModel.count !== 0) {
            for (var x = 0; x < root.recentAppsModel.count; ++x) {
                if (root.recentAppsModel.get(x).name === appName) {
                    return
                }
            }
        }

        if (root.recentAppsModel.count < 3) {
            root.recentAppsModel.insert(0, {"name": appName, "appIcon": appIcon.toString()})
        } else {
            root.recentAppsModel.remove(2);
            root.recentAppsModel.insert(0, {"name": appName, "appIcon": appIcon.toString()})
        }
    }
}

