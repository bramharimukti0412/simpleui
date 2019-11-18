# simpleui
A Simple UI that uses Qt Application Manager

This project includes the system UI and some built-in applications

Some application required to have the go-service as their backends (e.g. music and phone apps).

TODO:
make it possible to also use other backends

In the "external apps" folder, there are two apps which can be run independently using its harness. It can be modified by changing the path to your qmllive, or simply use qmlscene if you don't have the qmllive in place.
Those apps are meant to be installed to the system UI and run just like other apps.

In order to install it to your system UI, you need to have the Qt Creator AMP (Application Manager Plugin). It will do the installation by simply build and run the external apps using Qt Creator.

