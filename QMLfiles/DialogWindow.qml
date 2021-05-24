import QtQuick 2.0
import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.15


ApplicationWindow {
    id: dialogWindow
    flags: Qt.Window | Qt.FramelessWindowHint

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
        color: "#141926"
        anchors.fill: parent

        Button {
            id: buttonUndo
            y: 220
            width: 120
            height: 50
            text: qsTr("Undo")
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.leftMargin: 40
            anchors.bottomMargin: 30
            font.capitalization: Font.AllUppercase
            background: Rectangle {
                color: parent.down ? "#777B86" :
                                     (parent.hovered ? "#404656" : "#333948")
                border.color: "#ffffff"
            }
            font.pointSize: 11
            Layout.fillWidth: true
            palette.buttonText: "#ffffff"
            Layout.fillHeight: true
            Layout.preferredWidth: 65
            Layout.preferredHeight: 90
            onClicked: backend.onDialogUndo()
        }

        RowLayout {
            id: rowLayout
            y: 41
            height: 61
            anchors.left: parent.left
            anchors.right: parent.right
            spacing: 10
            anchors.rightMargin: 40
            anchors.leftMargin: 40

            Label {
                id: textWhoWon
                color: "#ffffff"
                text: qsTr("Krzysiek77")
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                Layout.fillHeight: true
                Layout.fillWidth: true
                font.pointSize: 19
                font.family: "Verdana"
            }

            Label {
                id: textWon
                color: "#ffffff"
                text: qsTr("won the game!")
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                Layout.fillHeight: true
                Layout.fillWidth: true
                font.pointSize: 19
                font.family: "Verdana"
            }

        }

        Label {
            id: textInfo
            y: 118
            height: 75
            color: "#ffffff"
            text: qsTr("Do you want to undo the last throw? If you end the game you won't be able to come back to it!")
            anchors.left: parent.left
            anchors.right: parent.right
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            font.pointSize: 11
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
        text: qsTr("End game")
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 40
        anchors.bottomMargin: 30
        font.capitalization: Font.AllUppercase
        font.pointSize: 11
        id: buttonEndGame
        x: 360
        y: 220
        width: 120
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
        onClicked: backend.onDialogEndGame()
    }

    Connections{
        target: backend

        function onEndGame(winner){
           textWhoWon.text = winner

        }

    }

}





/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

