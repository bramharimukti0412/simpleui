import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Qt.labs.folderlistmodel 2.12
import utils 1.0
import "../controls"

Item {
    id: appPanel

    property alias appWindow: windowItem.window

    SysUIWindowItem {
        id: windowItem
        anchors.fill: parent
    }
}
