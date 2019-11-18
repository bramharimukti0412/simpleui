TEMPLATE = lib
TARGET = $$qtLibraryTarget(smarthome_simulation)
DESTDIR = ../qtivi

QT += core ivicore
CONFIG += ivigenerator plugin

LIBS += -L$$OUT_PWD/../ -l$$qtLibraryTarget(SmartHome)
INCLUDEPATH += $$OUT_PWD/../frontend
QMAKE_RPATHDIR += $$QMAKE_REL_RPATH_BASE/../

QFACE_FORMAT = backend_simulator
QFACE_SOURCES = ../smarthome.qface
PLUGIN_TYPE = qtivi

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = $$OUT_PWD/../frontend/qml

target.path = /app/com.simpleui.smarthome/qtivi
INSTALLS += target

RESOURCES += \
    simulation.qrc
