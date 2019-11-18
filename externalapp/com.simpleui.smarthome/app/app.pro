TEMPLATE = aux

FILES += info.yaml \
         icon.png \
         Main.qml \


assets.files += assets/*
assets.path = /app/com.simpleui.smarthome/assets

app.files = $$FILES
app.path = /app/com.simpleui.smarthome

qml.files = controls harnesses panels stores views Main.qml \
qml.path = /app/com.simpleui.smarthome/

if(!debug_and_release | !build_pass) {
    # Copy all QML files during the build time
    DIRECTORIES = controls harnesses panels stores views
    for (d , DIRECTORIES) {
        win32: do_copydata.commands += $(COPY_DIR) $$shell_path($$PWD/$${d}) $$shell_path($$OUT_PWD/com.simpleui.smarthome/$${d}) $$escape_expand(\n\t)
        else: do_copydata.commands += $(COPY_DIR) $$shell_path($$PWD/$${d}) $$shell_path($$OUT_PWD/com.simpleui.smarthome/) $$escape_expand(\n\t)
    }
    first.depends = do_copydata
    !equals(PWD, $$OUT_PWD):QMAKE_EXTRA_TARGETS += first do_copydata
}

INSTALLS += app assets qml

OTHER_FILES += $$FILES
OTHER_FILES += $$files($$PWD/*.qml, true)
OTHER_FILES += $$files($$PWD/*.qmldir, true)

