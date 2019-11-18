import QtQuick 2.4
import QtApplicationManager.Application 2.0
import "views"
import "stores"

ApplicationManagerWindow {
    id: root

    PhoneView {
        anchors.fill: parent
        rootStore: RootStore {}
    }
}
