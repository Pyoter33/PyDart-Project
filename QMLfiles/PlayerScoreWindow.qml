import QtQuick 2.13
import QtQuick.Window 2.3
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15


Item {
    id: window
    width: 900
    height: 600
    anchors.fill: parent
    visible: true

    property bool attached: true
    property int attachedX
    property int attachedY


    Component.onCompleted: {
        attachedX = window.x
        attachedY = window.y
    }



    onAttachedChanged: {
        if (attached) {
            window.x = attachedX
            window.y = attachedY
        } else {
            window.x = 0
            window.y = 0;
        }
    }


    Rectangle {
        id: main
        width: 520
        color: "#141926"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.fill: parent
        anchors.bottomMargin: 0
        anchors.rightMargin: 0

        ColumnLayout {
            id: mainColumnLayout
            anchors.fill: parent
            spacing: 50
            anchors.rightMargin: 73
            Rectangle {
                id: firstPlayerLayout
                color: "#333948"
                border.color: "#f29911"
                border.width: 4
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.fillHeight: true

                ColumnLayout {
                    id: firstPlayerColumnLayout
                    anchors.fill: parent
                    spacing: 0
                    anchors.rightMargin: 4

                    RowLayout {
                        id: firstPlayerFirstRow
                        Layout.fillWidth: true
                        spacing: 0
                        Layout.fillHeight: true

                        Rectangle {
                            id: rectangleFirstPlayerName
                            width: 200
                            height: 200
                            color: "#00000000"
                            border.color: "#ffffff"
                            border.width: 2
                            Layout.fillWidth: true
                            Layout.preferredWidth: 205
                            Layout.fillHeight: true
                            Layout.preferredHeight: 70

                            Label {
                                id: textFirstPlayerName
                                width: 220
                                color: "#ffffff"
                                text: qsTr("")
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.top: parent.top
                                anchors.bottom: parent.bottom
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                anchors.rightMargin: 10
                                font.bold: true
                                fontSizeMode: Text.Fit
                                anchors.leftMargin: 10
                                anchors.topMargin: 15
                                anchors.bottomMargin: 15
                                font.pointSize: 30
                            }
                        }

                        Rectangle {
                            id: rectangleFirstPlayerPartialScore1
                            width: 200
                            height: 200
                            color: "#00000000"
                            border.color: "#ffffff"
                            border.width: 2
                            Layout.fillWidth: true
                            Layout.preferredWidth: 79
                            Layout.fillHeight: true
                            Layout.preferredHeight: 70

                            Label {
                                id: textFirstPlayerPartialScore1
                                color: "#ffffff"
                                text: qsTr("")
                                anchors.fill: parent
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                anchors.rightMargin: 15
                                fontSizeMode: Text.Fit
                                anchors.leftMargin: 15
                                anchors.topMargin: 15
                                anchors.bottomMargin: 15
                                font.pointSize: 30
                            }
                        }

                        Rectangle {
                            id: rectangleFirstPlayerPartialScore2
                            width: 200
                            height: 200
                            color: "#00000000"
                            border.color: "#ffffff"
                            border.width: 2
                            Layout.fillWidth: true
                            Layout.preferredWidth: 79
                            Layout.fillHeight: true
                            Layout.preferredHeight: 70
                            Layout.bottomMargin: 0
                            Layout.rightMargin: -2

                            Label {
                                id: textFirstPlayerPartialScore2
                                color: "#ffffff"
                                text: qsTr("")
                                anchors.fill: parent
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                anchors.rightMargin: 15
                                fontSizeMode: Text.Fit
                                anchors.leftMargin: 15
                                anchors.topMargin: 15
                                anchors.bottomMargin: 15
                                font.pointSize: 30
                            }
                            Layout.leftMargin: -2
                        }

                        Rectangle {
                            id: rectangleFirstPlayerPartialScore3
                            width: 200
                            height: 200
                            color: "#00000000"
                            border.color: "#ffffff"
                            border.width: 2
                            Layout.fillWidth: true
                            Layout.preferredWidth: 79
                            Layout.fillHeight: true
                            Layout.preferredHeight: 70
                            Layout.rightMargin: 0

                            Label {
                                id: textFirstPlayerPartialScore3
                                color: "#ffffff"
                                anchors.fill: parent
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                anchors.rightMargin: 15
                                fontSizeMode: Text.Fit
                                anchors.leftMargin: 15
                                anchors.topMargin: 15
                                anchors.bottomMargin: 15
                                font.pointSize: 30
                            }
                        }

                        Rectangle {
                            id: rectangleFirstPlayerTriples
                            width: 200
                            height: 200
                            color: "#00000000"
                            border.color: "#ffffff"
                            border.width: 2
                            Layout.fillWidth: true
                            Layout.preferredWidth: 110
                            Layout.fillHeight: true
                            Layout.preferredHeight: 70
                            Label {
                                id: textFirstPlayerTriples
                                color: "#ffffff"
                                anchors.fill: parent
                                horizontalAlignment: Text.AlignLeft
                                verticalAlignment: Text.AlignVCenter
                                anchors.rightMargin: 15
                                fontSizeMode: Text.Fit
                                anchors.leftMargin: 15
                                anchors.topMargin: 15
                                anchors.bottomMargin: 15
                                font.pointSize: 30
                            }
                            Layout.leftMargin: 0
                        }

                        Rectangle {
                            id: rectangleFirstPlayerSets
                            width: 200
                            height: 200
                            color: "#00000000"
                            border.color: "#ffffff"
                            border.width: 2
                            Layout.fillWidth: true
                            Layout.preferredWidth: 110
                            Layout.fillHeight: true
                            Layout.preferredHeight: 70
                            Layout.rightMargin: 0
                            Label {
                                id: textFirstPlayerSets
                                color: "#ffffff"
                                anchors.fill: parent
                                horizontalAlignment: Text.AlignLeft
                                verticalAlignment: Text.AlignVCenter
                                anchors.rightMargin: 15
                                fontSizeMode: Text.Fit
                                anchors.leftMargin: 15
                                anchors.topMargin: 15
                                anchors.bottomMargin: 15
                                font.pointSize: 30
                            }
                        }
                    }

                    RowLayout {
                        id: firstPlayerSecondRow
                        Layout.fillWidth: true
                        spacing: 0
                        Layout.fillHeight: true
                        RowLayout {
                            id: firstPlayerScoresRow
                            width: 491
                            spacing: 0
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Layout.rightMargin: 0
                            Rectangle {
                                id: rectangleFirstPlayerMainScore
                                color: "#00000000"
                                border.color: "#ffffff"
                                border.width: 2
                                Layout.fillWidth: true
                                Layout.preferredWidth: 224
                                Layout.fillHeight: true
                                Layout.preferredHeight: 135
                                Label {
                                    id: textFirstPlayerMainScore
                                    color: "#ffffff"
                                    anchors.fill: parent
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                    anchors.rightMargin: 30
                                    font.bold: true
                                    fontSizeMode: Text.Fit
                                    anchors.leftMargin: 30
                                    anchors.topMargin: 30
                                    anchors.bottomMargin: 30
                                    font.pointSize: 40
                                }
                            }

                            Rectangle {
                                id: rectangleFirstPlayerRoundScore
                                color: "#00000000"
                                border.color: "#ffffff"
                                border.width: 2
                                Layout.fillWidth: true
                                Layout.preferredWidth: 255
                                Layout.fillHeight: true
                                Layout.preferredHeight: 135
                                Layout.rightMargin: 0
                                Label {
                                    id: textFirstPlayerRoundScore
                                    color: "#ffffff"
                                    anchors.fill: parent
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                    anchors.rightMargin: 40
                                    font.bold: true
                                    fontSizeMode: Text.Fit
                                    anchors.leftMargin: 40
                                    anchors.topMargin: 40
                                    anchors.bottomMargin: 40
                                    font.pointSize: 40
                                }
                                Layout.leftMargin: 0
                            }
                            anchors.leftMargin: 2
                            anchors.topMargin: 0
                            anchors.bottomMargin: 2
                        }

                        GridLayout {
                            id: firstPlayerStatsRow
                            Layout.fillWidth: true
                            columnSpacing: 0
                            columns: 2
                            Layout.fillHeight: true
                            rows: 2
                            rowSpacing: 0
                            anchors.rightMargin: 2
                            Layout.rightMargin: 0
                            Rectangle {
                                id: rectangleFirstPlayerDoubles
                                width: 200
                                height: 200
                                color: "#00000000"
                                border.color: "#ffffff"
                                border.width: 2
                                Layout.fillWidth: true
                                Layout.preferredWidth: 120
                                Layout.fillHeight: true
                                Layout.preferredHeight: 70
                                Label {
                                    id: textFirstPlayerDoubles
                                    color: "#ffffff"
                                    anchors.fill: parent
                                    horizontalAlignment: Text.AlignLeft
                                    verticalAlignment: Text.AlignVCenter
                                    anchors.rightMargin: 15
                                    fontSizeMode: Text.Fit
                                    anchors.leftMargin: 15
                                    anchors.topMargin: 15
                                    anchors.bottomMargin: 15
                                    font.pointSize: 30
                                }
                            }

                            Rectangle {
                                id: rectangleFirstPlayerLegs
                                width: 200
                                height: 200
                                color: "#00000000"
                                border.color: "#ffffff"
                                border.width: 2
                                Layout.fillWidth: true
                                Layout.preferredWidth: 120
                                Layout.fillHeight: true
                                Layout.preferredHeight: 70
                                Label {
                                    id: textFirstPlayerLegs
                                    color: "#ffffff"
                                    anchors.fill: parent
                                    horizontalAlignment: Text.AlignLeft
                                    verticalAlignment: Text.AlignVCenter
                                    anchors.rightMargin: 15
                                    fontSizeMode: Text.Fit
                                    anchors.leftMargin: 15
                                    anchors.topMargin: 15
                                    anchors.bottomMargin: 15
                                    font.pointSize: 30
                                }
                            }

                            Rectangle {
                                id: rectangleFirstPlayerAverage
                                width: 200
                                height: 200
                                color: "#00000000"
                                border.color: "#ffffff"
                                border.width: 2
                                Layout.fillWidth: true
                                Layout.preferredWidth: 240
                                Layout.fillHeight: true
                                Layout.preferredHeight: 70
                                Label {
                                    id: textFirstPlayerAverage
                                    color: "#ffffff"
                                    anchors.fill: parent
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                    anchors.rightMargin: 15
                                    fontSizeMode: Text.Fit
                                    anchors.leftMargin: 15
                                    anchors.topMargin: 15
                                    anchors.bottomMargin: 15
                                    font.pointSize: 30
                                }
                                Layout.columnSpan: 2
                            }
                            anchors.bottomMargin: 2
                            Layout.leftMargin: 0
                        }
                        anchors.topMargin: -2
                    }
                    anchors.leftMargin: 4
                    anchors.topMargin: 4
                    anchors.bottomMargin: 4
                }
                anchors.leftMargin: 87
                anchors.topMargin: 55
                anchors.bottomMargin: 335
            }

            Rectangle {
                id: secondPlayerLayout
                color: "#333948"
                border.color: "#ffffff"
                border.width: 4
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.fillHeight: true

                ColumnLayout {
                    id: secondPlayerColumnLayout
                    anchors.fill: parent
                    spacing: 0
                    anchors.rightMargin: 4

                    RowLayout {
                        id: secondPlayerFirstRow
                        Layout.fillWidth: true
                        spacing: 0
                        Layout.fillHeight: true

                        Rectangle {
                            id: rectangleSecondPlayerName
                            width: 200
                            height: 200
                            color: "#00000000"
                            border.color: "#ffffff"
                            border.width: 2
                            Layout.fillWidth: true
                            Layout.preferredWidth: 205
                            Layout.fillHeight: true
                            Layout.preferredHeight: 71

                            Label {
                                id: textSecondPlayerName
                                width: 220
                                color: "#ffffff"
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.top: parent.top
                                anchors.bottom: parent.bottom
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                anchors.rightMargin: 10
                                font.bold: true
                                fontSizeMode: Text.Fit
                                anchors.leftMargin: 10
                                anchors.topMargin: 15
                                anchors.bottomMargin: 15
                                font.pointSize: 30
                            }
                        }

                        Rectangle {
                            id: rectangleSecondPlayerPartialScore1
                            width: 200
                            height: 200
                            color: "#00000000"
                            border.color: "#ffffff"
                            border.width: 2
                            Layout.fillWidth: true
                            Layout.preferredWidth: 79
                            Layout.fillHeight: true
                            Layout.preferredHeight: 70

                            Label {
                                id: textSecondPlayerPartialScore1
                                color: "#ffffff"
                                anchors.fill: parent
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                anchors.rightMargin: 15
                                fontSizeMode: Text.Fit
                                anchors.leftMargin: 15
                                anchors.topMargin: 15
                                anchors.bottomMargin: 15
                                font.pointSize: 30
                            }
                        }

                        Rectangle {
                            id: rectangleSecondPlayerPartialScore2
                            width: 200
                            height: 200
                            color: "#00000000"
                            border.color: "#ffffff"
                            border.width: 2
                            Layout.fillWidth: true
                            Layout.preferredWidth: 79
                            Layout.fillHeight: true
                            Layout.bottomMargin: 0
                            Layout.preferredHeight: 70
                            Layout.rightMargin: -2

                            Label {
                                id: textSecondPlayerPartialScore2
                                color: "#ffffff"
                                anchors.fill: parent
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                anchors.rightMargin: 15
                                fontSizeMode: Text.Fit
                                anchors.leftMargin: 15
                                anchors.topMargin: 15
                                anchors.bottomMargin: 15
                                font.pointSize: 30
                            }
                            Layout.leftMargin: -2
                        }

                        Rectangle {
                            id: rectangleSecondPlayerPartialScore3
                            width: 200
                            height: 200
                            color: "#00000000"
                            border.color: "#ffffff"
                            border.width: 2
                            Layout.fillWidth: true
                            Layout.preferredWidth: 79
                            Layout.fillHeight: true
                            Layout.preferredHeight: 70
                            Layout.rightMargin: 0

                            Label {
                                id: textSecondPlayerPartialScore3
                                color: "#ffffff"
                                anchors.fill: parent
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                anchors.rightMargin: 15
                                fontSizeMode: Text.Fit
                                anchors.leftMargin: 15
                                anchors.topMargin: 15
                                anchors.bottomMargin: 15
                                font.pointSize: 30
                            }
                        }

                        Rectangle {
                            id: rectangleSecondPlayerTriples
                            width: 200
                            height: 200
                            color: "#00000000"
                            border.color: "#ffffff"
                            border.width: 2
                            Layout.fillWidth: true
                            Layout.preferredWidth: 110
                            Layout.fillHeight: true
                            Layout.preferredHeight: 70

                            Label {
                                id: textSecondPlayerTriples
                                color: "#ffffff"
                                anchors.fill: parent
                                horizontalAlignment: Text.AlignLeft
                                verticalAlignment: Text.AlignVCenter
                                anchors.rightMargin: 15
                                fontSizeMode: Text.Fit
                                anchors.leftMargin: 15
                                anchors.topMargin: 15
                                anchors.bottomMargin: 15
                                font.pointSize: 30
                            }
                            Layout.leftMargin: 0
                        }

                        Rectangle {
                            id: rectangleSecondPlayerSets
                            width: 200
                            height: 200
                            color: "#00000000"
                            border.color: "#ffffff"
                            border.width: 2
                            Layout.fillWidth: true
                            Layout.preferredWidth: 110
                            Layout.fillHeight: true
                            Layout.preferredHeight: 70
                            Layout.rightMargin: 0

                            Label {
                                id: textSecondPlayerSets
                                color: "#ffffff"
                                anchors.fill: parent
                                horizontalAlignment: Text.AlignLeft
                                verticalAlignment: Text.AlignVCenter
                                anchors.rightMargin: 15
                                fontSizeMode: Text.Fit
                                anchors.leftMargin: 15
                                anchors.topMargin: 15
                                anchors.bottomMargin: 15
                                font.pointSize: 30
                            }
                        }
                    }

                    RowLayout {
                        id: secondPlayerSecondRow
                        Layout.fillWidth: true
                        spacing: 0
                        Layout.fillHeight: true

                        RowLayout {
                            id: secondPlayerScoresRow
                            width: 491
                            Layout.fillWidth: true
                            spacing: 0
                            Layout.fillHeight: true
                            Layout.rightMargin: 0

                            Rectangle {
                                id: rectangleSecondPlayerMainScore
                                width: 226
                                height: 138
                                color: "#00000000"
                                border.color: "#ffffff"
                                border.width: 2
                                Layout.fillWidth: true
                                Layout.preferredWidth: 224
                                Layout.fillHeight: true
                                Layout.preferredHeight: 135

                                Label {
                                    id: textSecondPlayerMainScore
                                    color: "#ffffff"
                                    anchors.fill: parent
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                    font.bold: true
                                    anchors.rightMargin: 30
                                    fontSizeMode: Text.Fit
                                    anchors.leftMargin: 30
                                    anchors.topMargin: 30
                                    anchors.bottomMargin: 30
                                    font.pointSize: 40
                                }
                            }

                            Rectangle {
                                id: rectangleSecondPlayerRoundScore
                                width: 226
                                height: 138
                                color: "#00000000"
                                border.color: "#ffffff"
                                border.width: 2
                                Layout.fillWidth: true
                                Layout.preferredWidth: 255
                                Layout.fillHeight: true
                                Layout.preferredHeight: 135
                                Layout.rightMargin: 0

                                Label {
                                    id: textSecondPlayerRoundScore
                                    color: "#ffffff"
                                    anchors.fill: parent
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                    anchors.rightMargin: 40
                                    font.bold: true
                                    fontSizeMode: Text.Fit
                                    anchors.leftMargin: 40
                                    anchors.topMargin: 40
                                    anchors.bottomMargin: 40
                                    font.pointSize: 40
                                }
                                Layout.leftMargin: 0
                            }
                            anchors.leftMargin: 2
                            anchors.topMargin: 0
                            anchors.bottomMargin: 2
                        }

                        GridLayout {
                            id: secondPlayerStatsRow
                            Layout.fillWidth: true
                            columnSpacing: 0
                            columns: 2
                            Layout.fillHeight: true
                            rows: 2
                            rowSpacing: 0
                            anchors.rightMargin: 2
                            Layout.rightMargin: 0

                            Rectangle {
                                id: rectangleSecondPlayerDoubles
                                width: 200
                                height: 200
                                color: "#00000000"
                                border.color: "#ffffff"
                                border.width: 2
                                Layout.fillWidth: true
                                Layout.preferredWidth: 120
                                Layout.fillHeight: true
                                Layout.preferredHeight: 70

                                Label {
                                    id: textSecondPlayerDoubles
                                    color: "#ffffff"
                                    anchors.fill: parent
                                    horizontalAlignment: Text.AlignLeft
                                    verticalAlignment: Text.AlignVCenter
                                    anchors.rightMargin: 15
                                    fontSizeMode: Text.Fit
                                    anchors.leftMargin: 15
                                    anchors.topMargin: 15
                                    anchors.bottomMargin: 15
                                    font.pointSize: 30
                                }
                            }

                            Rectangle {
                                id: rectangleSecondPlayerLegs
                                width: 200
                                height: 200
                                color: "#00000000"
                                border.color: "#ffffff"
                                border.width: 2
                                Layout.fillWidth: true
                                Layout.preferredWidth: 120
                                Layout.fillHeight: true
                                Layout.preferredHeight: 70

                                Label {
                                    id: textSecondPlayerLegs
                                    color: "#ffffff"
                                    anchors.fill: parent
                                    horizontalAlignment: Text.AlignLeft
                                    verticalAlignment: Text.AlignVCenter
                                    anchors.rightMargin: 15
                                    fontSizeMode: Text.Fit
                                    anchors.leftMargin: 15
                                    anchors.topMargin: 15
                                    anchors.bottomMargin: 15
                                    font.pointSize: 30
                                }
                            }

                            Rectangle {
                                id: rectangleSecondPlayerAverage
                                width: 200
                                height: 200
                                color: "#00000000"
                                border.color: "#ffffff"
                                border.width: 2
                                Layout.fillWidth: true
                                Layout.preferredWidth: 240
                                Layout.fillHeight: true
                                Layout.preferredHeight: 70

                                Label {
                                    id: textSecondPlayerAverage
                                    color: "#ffffff"
                                    anchors.fill: parent
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                    anchors.rightMargin: 15
                                    fontSizeMode: Text.Fit
                                    anchors.leftMargin: 15
                                    anchors.topMargin: 15
                                    anchors.bottomMargin: 15
                                    font.pointSize: 30
                                }
                                Layout.columnSpan: 2
                            }
                            Layout.leftMargin: 0
                            anchors.bottomMargin: 2
                        }
                        anchors.topMargin: -2
                    }
                    anchors.leftMargin: 4
                    anchors.topMargin: 4
                    anchors.bottomMargin: 4
                }
            }
            anchors.leftMargin: 73
            anchors.topMargin: 85
            anchors.bottomMargin: 85
        }



    }

    Rectangle {
        id: windowBar
        height: 40
        color: "#333948"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.leftMargin: 0

        Button {
            id: closeButton
            x: 480
            y: 0
            onClicked: attached = !attached
            width: 50
            height: 35
            palette.buttonText: "#ffffff"
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.rightMargin: 0
            background: Rectangle {
                color: parent.down ? "#777B86" :
                                     (parent.hovered ? "#404656" : "#141926")

                Image{
                    id: imgMinimze
                    source: "images/minimizeButton.svg"
                    anchors.fill: parent
                    anchors.margins: 10
                    fillMode: Image.PreserveAspectFit




                }
                ColorOverlay{
                    anchors.fill: imgMinimze
                    source: imgMinimze
                    color: "#ffffff"

                }
            }

        }
    }

        Connections{
            target: backend

            function onGetFirstPlayerMainScore(score){
                textFirstPlayerMainScore.text = score
            }

            function onGetFirstPlayerRoundScore(score){
                if(score === -1)
                    textFirstPlayerRoundScore.text = " "
                else
                    textFirstPlayerRoundScore.text = score
            }

            function onGetFirstPlayerPartialScore1(score1){
                textFirstPlayerPartialScore1.text = score1

            }

            function onGetFirstPlayerPartialScore2(score2){
                textFirstPlayerPartialScore2.text = score2

            }

            function onGetFirstPlayerPartialScore3(score3){
                textFirstPlayerPartialScore3.text = score3
           }

            function onGetFirstPlayerDoublesAndTriples(doubles, triples){
                var doublesText = "Do   %1"
                var triplesText = "Tr   %1"
                textFirstPlayerDoubles.text = doublesText.arg(doubles)
                textFirstPlayerTriples.text = triplesText.arg(triples)
            }

            function onGetFirstPlayerLegsAndSets(legs, sets){
                var legsText = "L   %1"
                var setsText = "S   %1"
                textFirstPlayerLegs.text = legsText.arg(legs)
                textFirstPlayerSets.text = setsText.arg(sets)
            }

            function onGetFirstPlayerAverage(average){
                var avgText = "avg %1"


                if (average === -1.0)
                    textFirstPlayerAverage.text = "avg"
                else
                    textFirstPlayerAverage.text = avgText.arg(average)
            }


            function onChangePlayers(currentPlayer){

                if(currentPlayer === 1){
                    firstPlayerLayout.border.color = "#f29911"
                    secondPlayerLayout.border.color = "#ffffff"
                }else{
                    secondPlayerLayout.border.color = "#f29911"
                    firstPlayerLayout.border.color = "#ffffff"
                }

            }


            function onGetSecondPlayerMainScore(score){
                textSecondPlayerMainScore.text = score
            }

            function onGetSecondPlayerRoundScore(score){
                if(score === -1)
                    textSecondPlayerRoundScore.text = " "
                else
                    textSecondPlayerRoundScore.text = score
            }

            function onGetSecondPlayerPartialScore1(score1){
                textSecondPlayerPartialScore1.text = score1
            }

            function onGetSecondPlayerPartialScore2(score2){
                textSecondPlayerPartialScore2.text = score2
            }

            function onGetSecondPlayerPartialScore3(score3){
                textSecondPlayerPartialScore3.text = score3
            }


            function onGetSecondPlayerDoublesAndTriples(doubles, triples){
                var doublesText = "Do   %1"
                var triplesText = "Tr   %1"
                textSecondPlayerDoubles.text = doublesText.arg(doubles)
                textSecondPlayerTriples.text = triplesText.arg(triples)
            }

            function onGetSecondPlayerLegsAndSets(legs, sets){
                var legsText = "L   %1"
                var setsText = "S   %1"
                textSecondPlayerLegs.text = legsText.arg(legs)
                textSecondPlayerSets.text = setsText.arg(sets)
            }

            function onGetSecondPlayerAverage(average){
                var avgText = "avg %1"

                if (average === -1.0)
                    textSecondPlayerAverage.text = "avg"
                else
                    textSecondPlayerAverage.text = avgText.arg(average)
            }

            function onChangePlayerNames(player1, player2){
                textFirstPlayerName.text = player1
                textSecondPlayerName.text = player2
            }
        }
    }












