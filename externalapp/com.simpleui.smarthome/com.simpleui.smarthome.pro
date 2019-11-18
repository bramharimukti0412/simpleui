TEMPLATE = subdirs
SUBDIRS += app \
           frontend \
           backend_simulator \
           imports \

app.depends = frontend
backend_simulator.depends = frontend
imports.depends = frontend

AM_MANIFEST = $$PWD/app/info.yaml
AM_PACKAGE_DIR = /app/com.simpleui.smarthome

load(am-app)
