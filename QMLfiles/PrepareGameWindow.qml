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


    Rectangle {
        id: main
        color: "#141926"
        anchors.fill: parent

        ColumnLayout {
            id: layoutRules
            anchors.fill: parent
            anchors.margins: 100
            spacing: 55
            anchors.topMargin: 70
            anchors.rightMargin: 146
            anchors.bottomMargin: 130
            anchors.leftMargin: 10

            RowLayout {
                id: firstPlayerLayout
                width: 100
                height: 100
                Layout.topMargin: 0
                Layout.bottomMargin: 0
                Layout.fillHeight: true
                Layout.fillWidth: true
                spacing: 15

                Label {
                    id: textChooseFirstPlayer
                    color: "#ffffff"
                    text: qsTr("Choose first player: ")
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Verdana"
                    Layout.preferredWidth: 60
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    font.pointSize: 22
                }

                ComboBox {
                    id: comboBoxFirstPlayer
                    width: 185
                    height: 63
                    Layout.preferredWidth: 35
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    background: Rectangle{
                        color: "#0c111e"
                    }
                    model: listBackend.model
                    textRole: "name"
                    palette.text: "#000000"
                    contentItem: Text{
                        text: comboBoxFirstPlayer.displayText
                        color: "#ffffff"
                        font.pointSize: 16
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Verdana"
                    }
                }



            }

            RowLayout {
                id: secondPlayerLayout
                width: 100
                height: 100
                Layout.topMargin: 0

                Label {
                    id: textChooseSecondPlayer
                    color: "#ffffff"
                    text: qsTr("Choose second player: ")
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Verdana"
                    Layout.preferredWidth: 60
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    font.pointSize: 22
                }

                ComboBox {
                    id: comboBoxSecondPlayer
                    width: 185
                    height: 63
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
                        text: comboBoxSecondPlayer.displayText
                        color: "#ffffff"
                        font.pointSize: 16
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Verdana"
                    }
               }

            }

            RowLayout {
                id: setsLegsLayout
                width: 100
                height: 100
                Layout.rightMargin: 0
                spacing: 20
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.bottomMargin: 0
                Layout.topMargin: 0

                Label {
                    id: textChooseSets
                    color: "#ffffff"
                    text: qsTr("Choose number of sets:")
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Verdana"
                    Layout.fillWidth: true
                    Layout.preferredWidth: 40
                    font.pointSize: 22
                }

                ComboBox {
                    id: comboBoxSets
                    width: 185
                    height: 63
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.preferredWidth: 15
                    background: Rectangle {
                        color: "#0c111e"
                    }
                    model: [1, 2, 3, 4, 5, 6, 7, 8, 9]

                    contentItem: Text{
                        text: comboBoxSets.displayText
                        color: "#ffffff"
                        font.pointSize: 16
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Verdana"
                    }
                }

                Label {
                    id: textChooseLegs
                    color: "#ffffff"
                    text: qsTr("Choose number of legs:")
                    verticalAlignment: Text.AlignVCenter
                    font.family: "Verdana"
                    Layout.fillWidth: true
                    Layout.preferredWidth: 40
                    font.pointSize: 22
                }

                ComboBox {
                    id: comboBoxLegs
                    width: 185
                    height: 63
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.preferredWidth: 15
                    background: Rectangle {
                        color: "#0c111e"
                    }
                    model: [1, 2, 3, 4, 5, 6, 7, 8, 9]

                    contentItem: Text{
                        text: comboBoxLegs.displayText
                        color: "#ffffff"
                        font.pointSize: 16
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Verdana"
                    }
                }
            }

            RowLayout {
                id: startScoreLayout
                width: 100
                height: 100
                Layout.fillHeight: true
                Layout.fillWidth: true
                spacing: 20
                Layout.rightMargin: 650

                Label {
                    id: textChooseStartScore
                    color: "#ffffff"
                    text: qsTr("Choose start score:")
                    verticalAlignment: Text.AlignVCenter
                    Layout.preferredWidth: 60
                    font.family: "Verdana"
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    font.pointSize: 22
                }

                ComboBox {
                    id: comboBoxStartScore
                    width: 185
                    height: 63
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.preferredWidth: 40
                    background: Rectangle {
                        color: "#0c111e"
                    }
                    model: [301, 501, 701]

                    contentItem: Text{
                        text: comboBoxStartScore.displayText
                        color: "#ffffff"
                        font.pointSize: 16
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Verdana"
                    }
                }

            }

            Button {
                id: buttonStartGame
                text: qsTr("Start game")
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
                onClicked: listBackend.checkIfPlayersAreValid(comboBoxFirstPlayer.currentText, comboBoxSecondPlayer.currentText)
            }



        }
    }
    Connections{
        target: listBackend

        function onStartGame(){
            var player1 = comboBoxFirstPlayer.currentText
            var player2 = comboBoxSecondPlayer.currentText
            var legs = comboBoxLegs.currentValue
            var sets = comboBoxSets.currentValue
            var startScore = comboBoxStartScore.currentValue

            backend.onStartNewGame(player1, player2, legs, sets, startScore)
        }
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}
}
##^##*/
