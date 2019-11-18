TARGET = $$qtLibraryTarget(SmartHome)
TEMPLATE = lib
DESTDIR = ..

QT += ivicore ivicore-private qml quick
CONFIG += unversioned_libname unversioned_soname

DEFINES += QT_BUILD_EXAMPLE_SMARTHOME_LIB
CONFIG += ivigenerator
QFACE_SOURCES = ../smarthome.qface

macos: QMAKE_SONAME_PREFIX = @rpath

target.path = /app/com.simpleui.smarthome/
INSTALLS += target
