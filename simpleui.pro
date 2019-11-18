TEMPLATE = app
CONFIG += am-systemui

OTHER_FILES += \
    am-config.yaml \
    simpleui.qmlproject \
    doc/src/*.qdoc \
    doc/images/*.png \
    sysui/*.qml \
    sysui/views/*.qml \
    sysui/panels/*.qml \
    sysui/controls/*.qml \
    apps/apps.1/*.yaml \
    apps/apps.1/*.qml \
    apps/apps.1/*.png \
    apps/apps.2/*.yaml \
    apps/apps.2/*.qml \
    apps/apps.2/*.png \

AM_COPY_DIRECTORIES += apps sysui
AM_COPY_FILES += am-config.yaml

prefix_build:tpath = $$target.path
else:tpath = $$_PRO_FILE_PWD_

QML_IMPORT_PATH += sysui

AM_DEFAULT_ARGS = -c $$tpath/am-config.yaml --verbose

example_sources.path = $$target.path
example_sources.files = $$AM_COPY_FILES $$AM_COPY_DIRECTORIES doc
INSTALLS += example_sources
