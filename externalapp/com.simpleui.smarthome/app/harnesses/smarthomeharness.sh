#!/bin/sh
QT_PLUGIN_PATH=/Users/bramastyoharimuktisantoso/Qt/5.13.1/clang_64/plugins${QT_PLUGIN_PATH:+:$QT_PLUGIN_PATH}
export QT_PLUGIN_PATH
exec /Users/bramastyoharimuktisantoso/Qt/5.13.1/clang_64/bin/qmllivebench /Users/bramastyoharimuktisantoso/Pelagicore/Project/QtProject/simpleui/gitlab/externalapp/com.simpleui.smarthome/app/ /Users/bramastyoharimuktisantoso/Pelagicore/Project/QtProject/simpleui/gitlab/externalapp/com.simpleui.smarthome/app/harnesses/DelegatedRoomHarness.qml
