import QtQuick 2.4
import "../views"
import "../stores"

Item {
    id: root
    width: 1130
    height: 640

    PhoneView {
        anchors.fill: parent
        rootStore: RootStore {}
    }
}
