import QtQuick 2.12
import QtApplicationManager.SystemUI 2.0

AbstractStore {
    id: root

    readonly property var windowObjectNoSurface: WindowObject.NoSurface

    // ApplicationManager APIs
    applicationModel: ApplicationManager

    // Handler for WindowManager signals
    property Connections windowManagerConn: Connections {
        target: WindowManager
        onWindowAdded:  currentAppWindow = window
        onWindowPropertyChanged: console.log("SystemUI: OnWindowPropertyChanged [" + window + "] - "
                                                       + name + ": " + value);
    }

    property Connections currentAppWindowConn: Connections {
        target: root.currentAppWindow
        onContentStateChanged: root.cleanCurrentAppWindow()
    }

    function releaseAppWindow() {
        if (root.currentAppWindow) {
            root.currentAppWindow.close()
        }
    }

    function cleanCurrentAppWindow() {
        if (root.currentAppWindow.contentState === root.windowObjectNoSurface)
            root.currentAppWindow = null
    }
}

