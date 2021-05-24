import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.11

Item {
    id: statsWindow
    width: 1470
    height: 750
    anchors.fill: parent
    visible: true

    Rectangle {
        id: main
        color: "#141926"
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0

        RowLayout {
            id: rowLayout
            anchors.fill: parent
            anchors.leftMargin: 30
            anchors.topMargin: 100
            anchors.rightMargin: 10
            anchors.bottomMargin: 39

            Rectangle {
                id: rectanglePlayersList
                width: 687
                height: 536
                Layout.preferredWidth: 1030
                Layout.fillHeight: true
                Layout.fillWidth: false
                color: "#0c111e"



                    ListView {
                        id: playersList
                        anchors.fill: parent
                        anchors.margins: 25
                        model: listBackend.model
                        bottomMargin: 10
                        spacing: 10
                        delegate:

                            Rectangle{
                            width: 1000
                            height: 50
                            color: "#333948"
                            border.color: "#ffffff"

                                    RowLayout{
                                        anchors.fill: parent
                                        spacing: 20

                                    Text {
                                        color: "#ffffff"
                                        text: name
                                        verticalAlignment: Text.AlignVCenter
                                        font.pointSize: 20
                                        font.family: "Verdana"
                                        Layout.preferredWidth: 100

                                    }
                                    Text {
                                        color: "#ffffff"
                                        text: gwon
                                        verticalAlignment: Text.AlignVCenter
                                        font.pointSize: 20
                                        font.family: "Verdana"
                                        Layout.preferredWidth: 40
                                    }
                                    Text {
                                        color: "#ffffff"
                                        text: glost
                                        verticalAlignment: Text.AlignVCenter
                                        font.pointSize: 20
                                        font.family: "Verdana"
                                        Layout.preferredWidth: 40
                                    }
                                    Text {
                                        color: "#ffffff"
                                        text: lwon
                                        verticalAlignment: Text.AlignVCenter
                                        font.pointSize: 20
                                        font.family: "Verdana"
                                        Layout.preferredWidth: 40
                                    }
                                    Text {
                                        color: "#ffffff"
                                        text: llost
                                        verticalAlignment: Text.AlignVCenter
                                        font.pointSize: 20
                                        font.family: "Verdana"
                                        Layout.preferredWidth: 40
                                    }
                                    Text {
                                        color: "#ffffff"
                                        text: pdiff
                                        verticalAlignment: Text.AlignVCenter
                                        font.pointSize: 20
                                        font.family: "Verdana"
                                        Layout.preferredWidth: 40
                                    }

                                    }
                            }
                    }


            }

            Rectangle {
                id: rectangleSort
                width: 200
                height: 200
                color: "#0c111e"
                Layout.minimumHeight: 400
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.preferredWidth: 100

                ColumnLayout {
                    id: layoutButtons
                    anchors.fill: parent

                    Label {
                        id: textSortBy
                        height: 71
                        text:  qsTr("SORT BY:")
                        color: "#ffffff"
                        horizontalAlignment: Text.AlignHCenter
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        font.pointSize: 25
                        font.family: "Verdana"
                    }

                    Button {
                        id: buttonName
                        text: qsTr("NAME")
                        Layout.rightMargin: 40
                        Layout.leftMargin: 40
                        font.family: "Verdana"
                        font.pointSize: 15
                        Layout.preferredHeight: 80
                        Layout.preferredWidth: 200
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        Layout.fillWidth: true
                        Layout.fillHeight: false
                        background: Rectangle {
                            border.color: "#FFFFFF"
                            color: parent.down ? "#777B86" :
                                                 (parent.hovered ? "#404656" : "#333948")
                        }

                        palette.buttonText: "white"
                        onPressed: listBackend.onGetListNames()

                    }

                    Button {
                        id: buttonGamesWon
                        text: qsTr("WON GAMES")
                        Layout.rightMargin: 40
                        Layout.leftMargin: 40
                        font.family: "Verdana"
                        font.pointSize: 15
                        Layout.preferredHeight: 80
                        Layout.preferredWidth: 200
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        Layout.fillWidth: true
                        Layout.fillHeight: false
                        background: Rectangle {
                            border.color: "#FFFFFF"
                            color: parent.down ? "#777B86" :
                                                 (parent.hovered ? "#404656" : "#333948")
                        }

                        palette.buttonText: "white"
                        onPressed: listBackend.onGetListGamesWon()

                    }

                    Button {
                        id: buttonLegsWon
                        text: qsTr("WON LEGS")
                        Layout.rightMargin: 40
                        Layout.leftMargin: 40
                        font.family: "Verdana"
                        font.pointSize: 15
                        Layout.preferredHeight: 80
                        Layout.preferredWidth: 200
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        Layout.fillWidth: true
                        Layout.fillHeight: false
                        background: Rectangle {
                            border.color: "#FFFFFF"
                            color: parent.down ? "#777B86" :
                                                 (parent.hovered ? "#404656" : "#333948")
                        }

                        palette.buttonText: "white"
                        onPressed: listBackend.onGetListLegsWon()

                    }

                    Button {
                        id: buttonPointsDifference
                        text: qsTr("POINTS DIFFERENCE")
                        Layout.rightMargin: 40
                        Layout.leftMargin: 40
                        font.family: "Verdana"
                        font.pointSize: 15
                        Layout.preferredHeight: 80
                        Layout.preferredWidth: 200
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        Layout.fillWidth: true
                        Layout.fillHeight: false
                        background: Rectangle {
                            border.color: "#FFFFFF"
                            color: parent.down ? "#777B86" :
                                                 (parent.hovered ? "#404656" : "#333948")
                        }

                        palette.buttonText: "white"
                        onPressed: listBackend.onGetListPointsDiff()

                    }
                }
            }
        }

        RowLayout {
            id: descriptionLayout
            width: 992
            height: 38
            anchors.left: parent.left
            anchors.top: parent.top
            spacing: 10
            anchors.topMargin: 59
            anchors.leftMargin: 51

            Label {
                id: textName
                color: "#ffffff"
                text: qsTr("player's name")
                horizontalAlignment: Text.AlignHCenter
                Layout.preferredWidth: 200
                font.capitalization: Font.AllUppercase
                font.family: "Verdana"
                font.pointSize: 15
                Layout.fillHeight: true
                Layout.fillWidth: true
            }

            Label {
                id: textGamesWon
                color: "#ffffff"
                text: qsTr("wins")
                horizontalAlignment: Text.AlignHCenter
                Layout.leftMargin: 50
                font.capitalization: Font.AllUppercase
                Layout.fillWidth: true
                font.family: "Verdana"
                font.pointSize: 15
                Layout.fillHeight: true
            }

            Label {
                id: textGamesLost
                color: "#ffffff"
                text: qsTr("losses")
                horizontalAlignment: Text.AlignHCenter
                Layout.leftMargin: 20
                font.capitalization: Font.AllUppercase
                Layout.fillWidth: true
                font.family: "Verdana"
                font.pointSize: 15
                Layout.fillHeight: true
            }

            Label {
                id: textLegsWon
                color: "#ffffff"
                text: qsTr("won legs")
                horizontalAlignment: Text.AlignRight
                font.capitalization: Font.AllUppercase
                Layout.fillWidth: true
                font.family: "Verdana"
                font.pointSize: 15
                Layout.fillHeight: true
            }

            Label {
                id: textLegsLost
                color: "#ffffff"
                text: qsTr("lost legs")
                horizontalAlignment: Text.AlignHCenter
                font.capitalization: Font.AllUppercase
                Layout.fillWidth: true
                font.family: "Verdana"
                font.pointSize: 15
                Layout.fillHeight: true
            }

            Label {
                id: textPointsDiff
                color: "#ffffff"
                text: qsTr("pts diff")
                horizontalAlignment: Text.AlignHCenter
                font.capitalization: Font.AllUppercase
                Layout.fillWidth: true
                font.family: "Verdana"
                font.pointSize: 15
                Layout.fillHeight: true
            }
        }
    }

    Connections{
        target: listBackend
    }

}



/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}D{i:14}
}
##^##*/
