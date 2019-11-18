TARGET = $$qtLibraryTarget(Automation)
TEMPLATE = lib
DESTDIR = ..

QT += ivicore ivicore-private qml quick
CONFIG += unversioned_libname unversioned_soname

DEFINES += QT_BUILD_EXAMPLE_AUTOMATION_LIB
CONFIG += ivigenerator
QFACE_SOURCES = ../automation.qface

macos: QMAKE_SONAME_PREFIX = @rpath

target.path = /app/com.simpleui.automation/
INSTALLS += target
