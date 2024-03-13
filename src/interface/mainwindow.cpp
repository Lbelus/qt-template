#include "../../include/mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
{
    QLabel *label = new QLabel("Hello, Qt", this);
    setCentralWidget(label);
}

// MainWindow::~MainWindow() = default;