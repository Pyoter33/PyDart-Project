# This Python file uses the following encoding: utf-8
import sys

from QObjects.ListManager import ListManager
from QObjects.GameManager import GameManager

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QUrl

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)

    gameManager = GameManager()
    listManager = ListManager()

    engine = QQmlApplicationEngine()
    engine.rootContext().setContextProperty("backend", gameManager)
    engine.rootContext().setContextProperty("listBackend", listManager)
    engine.load(QUrl("QMLfiles/MainWindow.qml"))

    sys.exit(app.exec_())
