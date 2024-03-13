#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QLabel>

class MainWindow : public QMainWindow
{
    public:
    Q_OBJECT
    public:
    MainWindow(QWidget *parent = nullptr);
    virtual ~MainWindow() {};
};

#endif