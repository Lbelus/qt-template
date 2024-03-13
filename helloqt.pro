QT += core gui widgets

CONFIG += c++11

TARGET = helloqt
CONFIG += console
CONFIG -= app_bundle

SOURCES += \
        src/main.cpp \
        ./src/interface/mainwindow.cpp

HEADERS += \
        include/mainwindow.h