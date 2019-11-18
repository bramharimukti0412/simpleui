TEMPLATE = lib
CONFIG += plugin
QT += ivicore

LIBS += -L$$OUT_PWD/../ -l$$qtLibraryTarget(Automation)
INCLUDEPATH += $$OUT_PWD/../frontend
QMAKE_RPATHDIR += $$QMAKE_REL_RPATH_BASE/../../../

QFACE_FORMAT = qmlplugin
QFACE_SOURCES = ../automation.qface

load(ivigenerator)

DESTDIR = $$OUT_PWD/$$replace(URI, \\., /)

exists($$OUT_PWD/qmldir) {
    cpqmldir.files = $$OUT_PWD/qmldir \
                     $$OUT_PWD/plugins.qmltypes
    cpqmldir.path = $$DESTDIR
    cpqmldir.CONFIG = no_check_exist
    COPIES += cpqmldir

    installPath = /app/com.simpleui.automation/imports/$$replace(URI, \\., /)
    qmldir.files = $$OUT_PWD/qmldir \
                   $$OUT_PWD/plugins.qmltypes
    qmldir.path = $$installPath
    target.path = $$installPath
    INSTALLS += target qmldir
}
