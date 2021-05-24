import QtQuick 2.13
import QtQuick.Window 2.2
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15


ApplicationWindow {
    id: rootWindow
    visible: true
    width: 1600
    height: 800
    minimumWidth: 1600
    minimumHeight: 700
    flags: Qt.Window | Qt.FramelessWindowHint


    Rectangle {
        id: manuBar
        width: 130
        color: "#0c111e"
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.topMargin: 0
        anchors.leftMargin: 0

        Button {
            id: buttonPlay
            height: 100
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 50

            background: Rectangle {
                color: parent.down ? "#777B86" :
                                     (parent.hovered ? "#404656" : "#141926")

                Image{
                    id: imgDart
                    source: "images/dartButton.svg"
                    anchors.fill: parent
                    anchors.margins: 0
                    fillMode: Image.PreserveAspectFit




                }
                ColorOverlay{
                    anchors.fill: imgDart
                    source: imgDart
                    color: "#ffffff"

                }

            }


            Rectangle{
                id: buttonPlayActiveIndicator
                x: 125
                width: 8
                color: "#ffffff"
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.topMargin: 0
                anchors.bottomMargin: 0
                anchors.rightMargin: 0

            }

            states: [
                State {
                    name: "nonActive"

                    PropertyChanges {
                        target: buttonPlayActiveIndicator
                        color: "#141926"
                    }
                },

                State {
                    name: "active"
                    PropertyChanges {
                        target: buttonPlayActiveIndicator
                        color: "#ffffff"

                    }
                }
            ]

            onClicked: {
                state = "active"
                buttonPlayers.state = "nonActive"
                buttonStats.state = "nonActive"
                statsWindow.visible = false
                prepareGameWindow.visible = true
                gameWindow.visible = false
                playersWindow.visible = false

            }

        }

        Button {
            id: buttonPlayers
            height: 100
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: buttonPlay.bottom
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            background: Rectangle {
                color: parent.down ? "#777B86" :
                                     (parent.hovered ? "#404656" : "#141926")
                Image {
                    id: imgPlayers
                    anchors.fill: parent
                    anchors.margins: 0
                    source: "images/playersButton.svg"
                    fillMode: Image.PreserveAspectFit
                }

                ColorOverlay {
                    color: "#ffffff"
                    anchors.fill: imgPlayers
                    source: imgPlayers
                }
            }
            anchors.topMargin: 30


            Rectangle{
                id: buttonPlayersActiveIndicator
                x: 125
                width: 8
                color: "#141926"
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.topMargin: 0
                anchors.bottomMargin: 0
                anchors.rightMargin: 0

            }

            states: [
                State {
                    name: "nonActive"

                    PropertyChanges {
                        target: buttonPlayersActiveIndicator
                        color: "#141926"
                    }
                },

                State {
                    name: "active"
                    PropertyChanges {
                        target: buttonPlayersActiveIndicator
                        color: "#ffffff"

                    }
                }
            ]

            onClicked: {
                state = "active"
                buttonPlay.state = "nonActive"
                buttonStats.state = "nonActive"
                prepareGameWindow.visible = false
                statsWindow.visible = false
                gameWindow.visible = false
                playersWindow.visible = true

            }


        }


        Button {
            id: buttonStats
            height: 100
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: buttonPlayers.bottom
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            background: Rectangle {
                color: parent.down ? "#777B86" :
                                     (parent.hovered ? "#404656" : "#141926")
                Image {
                    id: imgStats
                    anchors.fill: parent
                    anchors.rightMargin: 20
                    source: "images/statsButton.svg"
                    fillMode: Image.PreserveAspectFit
                }

                ColorOverlay {
                    color: "#ffffff"
                    anchors.fill: imgStats
                    source: imgStats
                }
            }
            anchors.topMargin: 30


            Rectangle{
                id: buttonStatsActiveIndicator
                x: 125
                width: 8
                color: "#141926"
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.topMargin: 0
                anchors.bottomMargin: 0
                anchors.rightMargin: 0

            }

            states: [
                State {
                    name: "nonActive"

                    PropertyChanges {
                        target: buttonStatsActiveIndicator
                        color: "#141926"
                    }
                },

                State {
                    name: "active"
                    PropertyChanges {
                        target: buttonStatsActiveIndicator
                        color: "#ffffff"

                    }
                }
            ]

            onClicked: {
                listBackend.onGetPlayersList()
                state = "active"
                buttonPlay.state = "nonActive"
                buttonPlayers.state = "nonActive"
                prepareGameWindow.visible = false
                statsWindow.visible = true
                gameWindow.visible = false
                playersWindow.visible = false


            }


        }

        Label {
            id: textAppName
            x: 1074
            y: 147
            color: "#ffffff"
            text: qsTr("PYDART")
            anchors.left: parent.left
            anchors.top: parent.top
            horizontalAlignment: Text.AlignLeft
            font.bold: false
            font.pointSize: 20
            font.family: "Courier"
            anchors.leftMargin: 8
            anchors.topMargin: 8
        }





    }

    Rectangle {
        id: main
        width: 1600
        color: "#141926"
        anchors.left: manuBar.right
        anchors.right: parent.right
        anchors.top: toolBar.bottom
        anchors.bottom: parent.bottom
        anchors.topMargin: 0
        anchors.leftMargin: 0


        StatsWindow{
            id: statsWindow
            visible: false
            anchors.fill: parent
        }

        GameWindow{
            id: gameWindow
            visible: false
            anchors.fill: parent
        }

        PrepareGameWindow{
            id: prepareGameWindow
            visible: true
            anchors.fill: parent
        }


        DialogWindow{
                id: endGameDialog
                width: 520
                height: 300
                visible: false
            }

        PlayersWindow{
            id: playersWindow
            visible: false
            anchors.fill: parent
        }

    }

    Rectangle {
        id: toolBar
        height: 50
        color: "#0c111e"
        anchors.left: manuBar.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0

        Button {
            id: buttonClose
            x: 1406
            width: 60
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            palette.buttonText: "#ffffff"
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            anchors.rightMargin: 0
            background: Rectangle {
                color: parent.down ? "#DF3939" :

                                     (parent.hovered ? "#CD0000" : "#0c111e")


                Image{
                    id: imgClose
                    source: "images/closeButton.svg"
                    anchors.fill: parent
                    anchors.margins: 10
                    fillMode: Image.PreserveAspectFit




                }
                ColorOverlay{
                    anchors.fill: imgClose
                    source: imgClose
                    color: "#ffffff"

                }
            }
            onClicked: rootWindow.close()



        }

        Button {
            id: buttonMinimalize
            x: 1349
            width: 60
            anchors.right: buttonClose.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.topMargin: 0
            anchors.bottomMargin: 0
            anchors.rightMargin: 0
            background: Rectangle {
                color: parent.down ? "#777B86" :
                                     (parent.hovered ? "#404656" : "#0c111e")

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
            onClicked: rootWindow.showMinimized()
        }


    }

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

                                 rootWindow.startSystemResize(Qt.LeftEdge);
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
                                 rootWindow.startSystemMove();
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
            onActiveChanged: if (active) { rootWindow.startSystemResize(Qt.BottomEdge);}
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
            onActiveChanged: if (active) { rootWindow.startSystemResize(Qt.RightEdge);}
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
            onActiveChanged: if (active) { rootWindow.startSystemResize(Qt.LeftEdge | Qt.BottomEdge);}
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
            onActiveChanged: if (active) { rootWindow.startSystemResize(Qt.RightEdge | Qt.BottomEdge);}
        }
    }




    Connections{
        target: listBackend

        function onStartGame(){
            prepareGameWindow.visible = false
            gameWindow.visible = true

        }
    }

    Connections{
        target: backend

        function onEndGame(){
            gameWindow.visible = false
            endGameDialog.visible = true
        }

        function onUndoLastThrow(){
            gameWindow.visible = true
            endGameDialog.visible = false
        }

        function onFinishAndSaveGame(){
            endGameDialog.visible = false
            prepareGameWindow.visible = true
        }
    }
}


/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}
}
##^##*/
