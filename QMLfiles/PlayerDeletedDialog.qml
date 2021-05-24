import QtQuick 2.0

import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.15


ApplicationWindow {
    id: dialogWindow
    flags: Qt.Window | Qt.FramelessWindowHint
    width: 500
    height: 230
    visible: false

    MouseArea {
        id: mouseAreaTop
        width: 0
        height: 50
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        cursorShape: Qt.ArrowCursor
        anchors.rightMargin: 0
        anchors.topMargin: 0
        anchors.leftMargin: 0


        DragHandler {
            id: resizeHandlerTop
            target: null
            onActiveChanged: if (active) {
                                 dialogWindow.startSystemMove();
                             }
        }

    }


    Rectangle {
        id: main
        height: 230
        color: "#141926"
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.bottomMargin: 0

        Label {
            id: textInfo
            y: 55
            height: 75
            color: "#ffffff"
            text: qsTr("Player successfully deleted.")
            anchors.left: parent.left
            anchors.right: parent.right
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            font.pointSize: 18
            font.family: "Verdana"
            anchors.rightMargin: 40
            anchors.leftMargin: 40
        }
    }

    Rectangle {
        id: windowBar
        height: 40
        color: "#333948"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
    }

    Button {

        text: qsTr("OK!")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.leftMargin: 190
        anchors.rightMargin: 190
        anchors.bottomMargin: 26
        font.capitalization: Font.AllUppercase
        font.pointSize: 11
        id: buttonEndGame
        y: 154
        height: 50
        Layout.fillHeight: true
        Layout.fillWidth: true
        Layout.preferredHeight: 90
        Layout.preferredWidth: 65
        background: Rectangle {
            border.color: "#FFFFFF"
            color: parent.down ? "#777B86" :
                                 (parent.hovered ? "#404656" : "#333948")
        }

        palette.buttonText: "white"
        onClicked: {
            listBackend.onGetPlayersList()
            dialogWindow.visible = false
        }
    }
}







/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}D{i:6}
}
##^##*/

