import QtQuick 2.0
import QtMultimedia 5.0

CameraButton {
    property Camera camera

    onClicked: {
        if (camera.lockStatus == Camera.Unlocked)
            camera.searchAndLock();
        else
            camera.unlock();
    }

    text: {
        if (camera.lockStatus == Camera.Unlocked)
            "Focus";
        else if (camera.lockStatus == Camera.Searching)
            "Focusing"
        else
            "Unlock"
    }
}
