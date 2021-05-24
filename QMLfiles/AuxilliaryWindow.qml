import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.15

ApplicationWindow {
    id: auxiliaryWindow
    flags: Qt.Window | Qt.FramelessWindowHint


    MouseArea {
        id: mouseAreaLeft
        width: 10
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        cursorShape: Qt.SizeHorCursor
        anchors.topMargin: 0
        anchors.bottomMargin: 10
        anchors.leftMargin: 0


        DragHandler {
            id: resizeHandlerLeft
            target: null
            onActiveChanged: if (active) {
                                 auxiliaryWindow.startSystemResize(Qt.LeftEdge);
                             }
        }

    }

    MouseArea {
        id: mouseAreaTop
        width: 0
        height: 50
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        cursorShape: Qt.ArrowCursor
        anchors.rightMargin: 120
        anchors.topMargin: 0
        anchors.leftMargin: 0


        DragHandler {
            id: resizeHandlerTop
            target: null
            onActiveChanged: if (active) {
                                 auxiliaryWindow.startSystemMove();
                             }
        }

    }

    MouseArea {
        id: mouseAreaBottom
        x: 0
        y: 470
        width: 0
        height: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        cursorShape: Qt.SizeVerCursor
        anchors.rightMargin: 10
        anchors.bottomMargin: 0
        anchors.leftMargin: 10


        DragHandler {
            id: resizeHandlerBottom
            target: null
            onActiveChanged: if (active) { auxiliaryWindow.startSystemResize(Qt.BottomEdge);}
        }

    }

    MouseArea {
        id: mouseAreaRight
        x: 630
        y: 0
        width: 10
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        cursorShape: Qt.SizeHorCursor
        anchors.rightMargin: 0
        anchors.bottomMargin: 10
        anchors.topMargin: 0


        DragHandler {
            id: resizeHandlerRight
            target: null
            onActiveChanged: if (active) { auxiliaryWindow.startSystemResize(Qt.RightEdge);}
        }

    }

    MouseArea {
        id: mouseAreaLeftCorner
        y: 700
        width: 10
        height: 10
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        cursorShape: Qt.SizeBDiagCursor
        anchors.bottomMargin: 0
        anchors.leftMargin: 0

        DragHandler {
            id: resizeHandlerLeftCorner
            target: null
            onActiveChanged: if (active) { auxiliaryWindow.startSystemResize(Qt.LeftEdge | Qt.BottomEdge);}
        }
    }

    MouseArea {
        id: mouseAreaRightCorner
        y: 700
        width: 10
        height: 10
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        cursorShape: Qt.SizeFDiagCursor

        DragHandler {
            id: resizeHandlerRightCorner
            target: null
            onActiveChanged: if (active) { auxiliaryWindow.startSystemResize(Qt.RightEdge | Qt.BottomEdge);}
        }
    }


}

