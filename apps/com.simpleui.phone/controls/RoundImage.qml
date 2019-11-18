import QtQuick 2.8
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0

import shared.Sizes 1.0

Item {
    id: root
    implicitWidth: Sizes.dp(img.sourceSize.width)
    implicitHeight: Sizes.dp(img.sourceSize.height)

    property alias source: img.source

    signal clicked()

    Rectangle {
        id: mask
        anchors.fill: parent
        radius: width/2
        visible: false
    }
    Image {
        id: img
        anchors.fill: mask
        fillMode: Image.PreserveAspectCrop
        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: mask
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked()
    }
}
