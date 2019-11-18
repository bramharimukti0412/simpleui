import QtQuick 2.4
import "../controls"

Item {
    id: root

    property alias model: listView.model
    signal itemClicked(var index, var phone)

    ListView {
        id: listView
        anchors.fill: parent
        delegate: ListItemContact {
            width: root.width
            text: firstName + " " + lastName
            onItemClicked: root.itemClicked(index, phone)
        }
    }

    Text {
        text: qsTr("No Favorite Contacts")
        font.pixelSize: 25
        anchors.centerIn: parent
        visible: listView.count < 1
        color: "white"
    }
}
