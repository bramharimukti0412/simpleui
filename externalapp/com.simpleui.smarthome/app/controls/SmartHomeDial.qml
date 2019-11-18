import QtQuick.Controls 2.12
import QtQuick 2.12

Dial {
    id: root
    background: Rectangle {
        x: root.width / 2 - width / 2
        y: root.height / 2 - height / 2
        width: Math.max(64, Math.min(root.width, root.height))
        height: width
        color: "transparent"
        radius: width / 2
        border.color: root.pressed ? "red" : "green"
        border.width: 10
        opacity: root.enabled ? 1 : 0.3
    }

    handle: Rectangle {
        id: handleItem
        x: root.background.x + root.background.width / 2 - width / 2
        y: root.background.y + root.background.height / 2 - height / 2
        width: 16
        height: 16
        color: root.pressed ? "green" : "white"
        radius: 8
        antialiasing: true
        opacity: root.enabled ? 1 : 0.3
        transform: [
            Translate {
                y: -Math.min(root.background.width, root.background.height) * 0.4 + handleItem.height / 2
            },
            Rotation {
                angle: root.angle
                origin.x: handleItem.width / 2
                origin.y: handleItem.height / 2
            }
        ]
    }
}
