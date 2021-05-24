import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.11
import QtQuick.Controls.Imagine 2.3
import QtQml.Models 2.15


Item {
    width: 1470
    height: 750
    anchors.fill: parent
    visible: true

   PlayerCreatedDialog{
       id: playerCreatedDialog
   }

   PlayerDeletedDialog{
       id: playerDeletedDialog
   }

    Rectangle {
        id: main
        color: "#141926"
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0

        RowLayout {
            id: operationsLayout
            anchors.fill: parent
            spacing: 20
            anchors.rightMargin: 57
            anchors.leftMargin: 60
            anchors.bottomMargin: 150
            anchors.topMargin: 150

            Rectangle {
                id: rectangleCreatePlayer
                width: 200
                height: 200
                color: "#00000000"
                border.color: "#ffffff"
                Layout.fillHeight: true
                Layout.fillWidth: true

                TextField {
                    id: textInputPlayerNickname
                    height: 104
                    color: "#ffffff"
                    text: qsTr("")
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: textEnterName.bottom
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.NoWrap
                    anchors.topMargin: 40
                    anchors.leftMargin: 120
                    anchors.rightMargin: 120
                    font.pointSize: 20
                    selectionColor: "#a604cd"
                    font.family: "Verdana"
                    background:  Rectangle{
                        color: "#0c111e"
                    }
                }

                Label {
                    id: textEnterName
                    height: 47
                    color: "#ffffff"
                    text: qsTr("Enter new player's nickname")
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.topMargin: 20
                    font.pointSize: 17
                    font.family: "Verdana"
                    anchors.rightMargin: 120
                    anchors.leftMargin: 120
                }


                Button {
                    id: buttonCreatePlayer
                    y: 343
                    height: 65
                    text: qsTr("Create Player")
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 70
                    anchors.leftMargin: 188
                    anchors.rightMargin: 188
                    font.capitalization: Font.AllUppercase
                    font.pointSize: 14
                    Layout.preferredHeight: 60
                    Layout.rightMargin: 450
                    Layout.leftMargin: 450
                    Layout.topMargin: 0
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    background: Rectangle {
                        border.color: "#FFFFFF"
                        color: parent.down ? "#777B86" :
                                             (parent.hovered ? "#404656" : "#333948")
                    }

                    palette.buttonText: "white"
                    onClicked: {
                                listBackend.addNewPlayer(textInputPlayerNickname.text)
                                playerCreatedDialog.visible = true
                               }

                }

            }

            Rectangle {
                id: rectangleDeletePlayer
                width: 200
                height: 200
                color: "#00000000"
                border.color: "#ffffff"
                Layout.fillHeight: true
                Layout.fillWidth: true

                Label {
                    id: textDeletePlayer
                    height: 47
                    color: "#ffffff"
                    text: qsTr("Choose player you want to delete")
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.topMargin: 20
                    anchors.leftMargin: 60
                    anchors.rightMargin: 60
                    font.family: "Verdana"
                    font.pointSize: 17
                }

                ComboBox {
                    id: comboBoxPlayerToDelete
                    height: 74
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: textDeletePlayer.bottom
                    anchors.topMargin: 60
                    anchors.leftMargin: 100
                    anchors.rightMargin: 100
                    Layout.preferredWidth: 35
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    background: Rectangle {
                        color: "#0c111e"
                    }
                    model: listBackend.model
                    textRole: "name"
                    palette.text: "#000000"
                    contentItem: Text{
                        text: comboBoxPlayerToDelete.displayText
                        color: "#ffffff"
                        font.pointSize: 16
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Verdana"
                    }
                }

               Button {
                   id: buttonDeletePlayer
                   y: 343
                   height: 65
                   text: qsTr("delete Player")
                   anchors.left: parent.left
                   anchors.right: parent.right
                   anchors.bottom: parent.bottom
                   background: Rectangle {
                       color: parent.down ? "#777B86" :
                                                            (parent.hovered ? "#404656" : "#333948")
                       border.color: "#ffffff"
                   }
                   palette.buttonText: "#ffffff"
                   anchors.bottomMargin: 70
                   Layout.fillWidth: true
                   anchors.rightMargin: 188
                   Layout.rightMargin: 450
                   anchors.leftMargin: 188
                   font.capitalization: Font.AllUppercase
                   Layout.preferredHeight: 60
                   Layout.topMargin: 0
                   font.pointSize: 14
                   Layout.fillHeight: true
                   Layout.leftMargin: 450
                   onClicked: {
                       listBackend.deletePlayer(comboBoxPlayerToDelete.currentText)
                       playerDeletedDialog.visible = true
                  }
               }

            }
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}D{i:4}D{i:6}D{i:7}D{i:10}D{i:11}D{i:14}D{i:9}D{i:2}
}
##^##*/
