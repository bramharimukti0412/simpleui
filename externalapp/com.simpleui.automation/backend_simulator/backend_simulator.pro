TEMPLATE = lib
TARGET = $$qtLibraryTarget(automation_simulation)
DESTDIR = ../qtivi

QT += core ivicore
CONFIG += ivigenerator plugin

LIBS += -L$$OUT_PWD/../ -l$$qtLibraryTarget(Automation)
INCLUDEPATH += $$OUT_PWD/../frontend
QMAKE_RPATHDIR += $$QMAKE_REL_RPATH_BASE/../

QFACE_FORMAT = backend_simulator
QFACE_SOURCES = ../automation.qface
PLUGIN_TYPE = qtivi

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = $$OUT_PWD/../frontend/qml

target.path = /app/com.simpleui.automation/qtivi
INSTALLS += target

RESOURCES += \
    simulation.qrc
