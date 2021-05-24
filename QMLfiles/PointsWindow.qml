import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Item {
    id: window
    width: 520
    height: 600
    visible: true
    anchors.fill: parent
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
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0



        ColumnLayout {
            id: columnLayout
            anchors.fill: parent
            anchors.bottomMargin: 44
            spacing: 5
            anchors.topMargin: 80


            RowLayout {
                id: firstRow
                width: 100
                height: 100
                Layout.leftMargin: 3
                Layout.rightMargin: 3
                Layout.preferredHeight: 100
                Layout.fillHeight: true
                Layout.fillWidth: true

                Button {
                    id: buttonNo1
                    text: qsTr("1")
                    font.pointSize: 20
                    width: 65
                    height: 100
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

                    onPressed: {
                        backend.onClickNumber(1)
                        disableDouble()
                        disableTriple()
                    }
                }

                Button {
                    text: qsTr("2")
                    font.pointSize: 20
                    id: buttonNo2
                    x: 7
                    width: 65
                    height: 100
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
                    onPressed: {
                        backend.onClickNumber(2)
                        disableDouble()
                        disableTriple()
                    }
                }

                Button {
                    text: qsTr("3")
                    font.pointSize: 20
                    id: buttonNo3
                    width: 65
                    height: 100
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
                    onPressed: {
                        backend.onClickNumber(3)
                        disableDouble()
                        disableTriple()
                    }
                }

                Button {
                    text: qsTr("4")
                    font.pointSize: 20
                    id: buttonNo4
                    width: 65
                    height: 100
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
                    onPressed: {
                        backend.onClickNumber(4)
                        disableDouble()
                        disableTriple()
                    }
                }


                Button {
                    text: qsTr("5")
                    font.pointSize: 20
                    id: buttonNo5
                    width: 65
                    height: 100
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
                    onPressed: {
                        backend.onClickNumber(5)
                        disableDouble()
                        disableTriple()
                    }
                }


                Button {
                    text: qsTr("6")
                    font.pointSize: 20
                    id: buttonNo6
                    width: 65
                    height: 100
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
                    onPressed: {
                        backend.onClickNumber(6)
                        disableDouble()
                        disableTriple()
                    }
                }

                Button {
                    text: qsTr("7")
                    font.pointSize: 20
                    id: buttonNo7
                    width: 65
                    height: 100
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.preferredHeight: 100
                    Layout.preferredWidth: 65
                    background: Rectangle {
                        border.color: "#FFFFFF"
                        color: parent.down ? "#777B86" :
                                             (parent.hovered ? "#404656" : "#333948")
                    }

                    palette.buttonText: "white"
                    onPressed: {
                        backend.onClickNumber(7)
                        disableDouble()
                        disableTriple()
                    }
                }


            }



            RowLayout {
                id: secondRow
                width: 100
                height: 100
                Layout.leftMargin: 3
                Layout.rightMargin: 3
                Layout.fillHeight: true
                Layout.fillWidth: true

                Button {
                    id: buttonNo8
                    width: 65
                    height: 100
                    text: qsTr("8")
                    Layout.fillWidth: true
                    font.pointSize: 20
                    background: Rectangle {
                        color: parent.down ? "#777B86" :
                                             (parent.hovered ? "#404656" : "#333948")
                        border.color: "#ffffff"
                    }
                    Layout.fillHeight: true
                    Layout.preferredHeight: 100
                    palette.buttonText: "#ffffff"
                    Layout.preferredWidth: 65
                    onPressed: {
                        backend.onClickNumber(8)
                        disableDouble()
                        disableTriple()
                    }
                }

                Button {
                    id: buttonNo9
                    width: 65
                    height: 100
                    text: qsTr("9")
                    Layout.fillWidth: true
                    font.pointSize: 20
                    background: Rectangle {
                        color: parent.down ? "#777B86" :
                                             (parent.hovered ? "#404656" : "#333948")
                        border.color: "#ffffff"
                    }
                    Layout.fillHeight: true
                    Layout.preferredHeight: 100
                    palette.buttonText: "#ffffff"
                    Layout.preferredWidth: 65
                    onPressed: {
                        backend.onClickNumber(9)
                        disableDouble()
                        disableTriple()
                    }
                }

                Button {
                    id: buttonNo10
                    width: 65
                    height: 100
                    text: qsTr("10")
                    Layout.fillWidth: true
                    font.pointSize: 20
                    background: Rectangle {
                        color: parent.down ? "#777B86" :
                                             (parent.hovered ? "#404656" : "#333948")
                        border.color: "#ffffff"
                    }
                    Layout.fillHeight: true
                    Layout.preferredHeight: 100
                    palette.buttonText: "#ffffff"
                    Layout.preferredWidth: 65
                    onPressed: {
                        backend.onClickNumber(10)
                        disableDouble()
                        disableTriple()
                    }
                }

                Button {
                    id: buttonNo11
                    width: 65
                    height: 100
                    text: qsTr("11")
                    Layout.fillWidth: true
                    font.pointSize: 20
                    background: Rectangle {
                        color: parent.down ? "#777B86" :
                                             (parent.hovered ? "#404656" : "#333948")
                        border.color: "#ffffff"
                    }
                    Layout.fillHeight: true
                    Layout.preferredHeight: 100
                    palette.buttonText: "#ffffff"
                    Layout.preferredWidth: 65
                    onPressed: {
                        backend.onClickNumber(11)
                        disableDouble()
                        disableTriple()
                    }
                }

                Button {
                    id: buttonNo12
                    width: 65
                    height: 100
                    text: qsTr("12")
                    Layout.fillWidth: true
                    font.pointSize: 20
                    background: Rectangle {
                        color: parent.down ? "#777B86" :
                                             (parent.hovered ? "#404656" : "#333948")
                        border.color: "#ffffff"
                    }
                    Layout.fillHeight: true
                    Layout.preferredHeight: 100
                    palette.buttonText: "#ffffff"
                    Layout.preferredWidth: 65
                    onPressed: {
                        backend.onClickNumber(12)
                        disableDouble()
                        disableTriple()
                    }
                }

                Button {
                    id: buttonNo13
                    width: 65
                    height: 100
                    text: qsTr("13")
                    Layout.fillWidth: true
                    font.pointSize: 20
                    background: Rectangle {
                        color: parent.down ? "#777B86" :
                                             (parent.hovered ? "#404656" : "#333948")
                        border.color: "#ffffff"
                    }
                    Layout.fillHeight: true
                    Layout.preferredHeight: 100
                    palette.buttonText: "#ffffff"
                    Layout.preferredWidth: 65
                    onPressed: {
                        backend.onClickNumber(13)
                        disableDouble()
                        disableTriple()
                    }
                }

                Button {
                    id: buttonNo14
                    width: 65
                    height: 100
                    text: qsTr("14")
                    Layout.fillWidth: true
                    font.pointSize: 20
                    background: Rectangle {
                        color: parent.down ? "#777B86" :
                                             (parent.hovered ? "#404656" : "#333948")
                        border.color: "#ffffff"
                    }
                    Layout.fillHeight: true
                    Layout.preferredHeight: 100
                    palette.buttonText: "#ffffff"
                    Layout.preferredWidth: 65
                    onPressed: {
                        backend.onClickNumber(14)
                        disableDouble()
                        disableTriple()
                    }
                }
            }



            RowLayout {
                id: thirdRow
                width: 100
                height: 100
                Layout.leftMargin: 3
                Layout.rightMargin: 3
                Layout.fillHeight: true
                Layout.fillWidth: true

                Button {
                    id: buttonNo15
                    width: 65
                    height: 100
                    text: qsTr("15")
                    Layout.fillWidth: true
                    font.pointSize: 20
                    background: Rectangle {
                        color: parent.down ? "#777B86" :
                                             (parent.hovered ? "#404656" : "#333948")
                        border.color: "#ffffff"
                    }
                    Layout.fillHeight: true
                    Layout.preferredHeight: 100
                    palette.buttonText: "#ffffff"
                    Layout.preferredWidth: 65
                    onPressed: {
                        backend.onClickNumber(15)
                        disableDouble()
                        disableTriple()
                    }
                }

                Button {
                    id: buttonNo16
                    width: 65
                    height: 100
                    text: qsTr("16")
                    Layout.fillWidth: true
                    font.pointSize: 20
                    background: Rectangle {
                        color: parent.down ? "#777B86" :
                                             (parent.hovered ? "#404656" : "#333948")
                        border.color: "#ffffff"
                    }
                    Layout.fillHeight: true
                    Layout.preferredHeight: 100
                    palette.buttonText: "#ffffff"
                    Layout.preferredWidth: 65
                    onPressed: {
                        backend.onClickNumber(16)
                        disableDouble()
                        disableTriple()
                    }
                }

                Button {
                    id: buttonNo17
                    width: 65
                    height: 100
                    text: qsTr("17")
                    Layout.fillWidth: true
                    font.pointSize: 20
                    background: Rectangle {
                        color: parent.down ? "#777B86" :
                                             (parent.hovered ? "#404656" : "#333948")
                        border.color: "#ffffff"
                    }
                    Layout.fillHeight: true
                    Layout.preferredHeight: 100
                    palette.buttonText: "#ffffff"
                    Layout.preferredWidth: 65
                    onPressed: {
                        backend.onClickNumber(17)
                        disableDouble()
                        disableTriple()
                    }
                }

                Button {
                    id: buttonNo18
                    width: 65
                    height: 100
                    text: qsTr("18")
                    Layout.fillWidth: true
                    font.pointSize: 20
                    background: Rectangle {
                        color: parent.down ? "#777B86" :
                                             (parent.hovered ? "#404656" : "#333948")
                        border.color: "#ffffff"
                    }
                    Layout.fillHeight: true
                    Layout.preferredHeight: 100
                    palette.buttonText: "#ffffff"
                    Layout.preferredWidth: 65
                    onPressed: {
                        backend.onClickNumber(18)
                        disableDouble()
                        disableTriple()
                    }
                }

                Button {
                    id: buttonNo19
                    width: 65
                    height: 100
                    text: qsTr("19")
                    Layout.fillWidth: true
                    font.pointSize: 20
                    background: Rectangle {
                        color: parent.down ? "#777B86" :
                                             (parent.hovered ? "#404656" : "#333948")
                        border.color: "#ffffff"
                    }
                    Layout.fillHeight: true
                    Layout.preferredHeight: 100
                    palette.buttonText: "#ffffff"
                    Layout.preferredWidth: 65
                    onPressed: {
                        backend.onClickNumber(19)
                        disableDouble()
                        disableTriple()
                    }
                }

                Button {
                    id: buttonNo20
                    width: 65
                    height: 100
                    text: qsTr("20")
                    Layout.fillWidth: true
                    font.pointSize: 20
                    background: Rectangle {
                        color: parent.down ? "#777B86" :
                                             (parent.hovered ? "#404656" : "#333948")
                        border.color: "#ffffff"
                    }
                    Layout.fillHeight: true
                    Layout.preferredHeight: 100
                    palette.buttonText: "#ffffff"
                    Layout.preferredWidth: 65
                    onPressed: {
                        backend.onClickNumber(20)
                        disableDouble()
                        disableTriple()
                    }
                }

                Button {
                    id: buttonNo25
                    width: 65
                    height: 100
                    text: qsTr("25")
                    Layout.fillWidth: true
                    font.pointSize: 20
                    background: Rectangle {
                        id: buttonNo25Bg
                        color: parent.down ? "#777B86" :
                                             (parent.hovered ? "#404656" : "#333948")
                        border.color: "#ffffff"
                    }
                    Layout.fillHeight: true
                    Layout.preferredHeight: 100
                    palette.buttonText: "#ffffff"
                    Layout.preferredWidth: 65
                    onPressed: {
                        backend.onClickNumber(25)
                        disableDouble()
                    }
                    states: [
                        State {
                            name: "nonActive"
                            PropertyChanges {
                                target: buttonNo25Bg
                                color:  "#3F3F40"
                                border.color: "#ffffff"

                            }
                        },

                        State {
                            name: "active"
                            PropertyChanges {
                                target: buttonNo25Bg
                                color: parent.down ? "#777B86" :
                                                       (parent.hovered ? "#404656" : "#333948")
                                border.color: "#ffffff"

                            }
                        }
                    ]
                }
            }



            RowLayout {
                id: fourthRow
                width: 100
                height: 100
                Layout.bottomMargin: 10
                Layout.leftMargin: 3
                Layout.rightMargin: 3
                Layout.fillHeight: true
                Layout.fillWidth: true

                Button {
                    id: buttonNo0
                    height: 90
                    text: qsTr("0")
                    Layout.columnSpan: 1
                    Layout.rowSpan: 1
                    Layout.fillWidth: true
                    font.pointSize: 20
                    background: Rectangle {
                        id: buttonNo0Bg
                        color: parent.down ? "#777B86" :
                                             (parent.hovered ? "#404656" : "#333948")
                        border.color: "#ffffff"
                    }
                    Layout.fillHeight: true
                    Layout.preferredHeight: 100
                    palette.buttonText: "#ffffff"
                    Layout.preferredWidth: 65
                    onPressed: {
                        backend.onClickNumber(0)
                    }
                    states: [
                        State {
                            name: "nonActive"
                            PropertyChanges {
                                target: buttonNo0Bg
                                color:  "#3F3F40"
                                border.color: "#ffffff"

                            }
                        },

                        State {
                            name: "active"
                            PropertyChanges {
                                target: buttonNo0Bg
                                color: parent.down ? "#777B86" :
                                                       (parent.hovered ? "#404656" : "#333948")
                                border.color: "#ffffff"

                            }
                        }
                    ]
                }

                Button {
                    id: buttonDouble
                    width: 130
                    height: 100
                    text: qsTr("DOUBLE")
                    Layout.leftMargin: 0
                    Layout.fillWidth: true
                    font.pointSize: 17
                    background: Rectangle {
                        id: buttonDoubleBg
                        color: parent.down ? "#777B86" :
                                             (parent.hovered ? "#404656" : "#333948")
                        border.color: "#F2EE11"
                    }
                    Layout.fillHeight: true
                    Layout.preferredHeight: 100
                    palette.buttonText: "#F2EE11"
                    Layout.preferredWidth: 130
                    onClicked:{
                        backend.onClickDouble()
                        disableTriple()
                        if(state == "active"){
                            state = "nonActive"
                            buttonNo0.enabled = true
                            buttonNo0.state = "active"
                        } else{
                            state = "active"
                            buttonNo0.enabled = false
                            buttonNo0.state = "nonActive"
                        }
                    }


                    states: [
                        State {
                            name: "nonActive"

                            PropertyChanges {
                                target: buttonDoubleBg
                                color: parent.down ? "#777B86":
                                                     (parent.hovered ? "#404656" : "#333948")
                                border.color: "#F2EE11"

                            }
                        },

                        State {
                            name: "active"
                            PropertyChanges {
                                target: buttonDoubleBg
                                color: parent.down ? "#777B86":
                                                     (parent.hovered ? "#242832" : "#191C23")
                                border.color: "#F2EE11"

                            }
                        }
                    ]
                }



                Button {
                    id: buttonTriple
                    width: 130
                    height: 100
                    text: qsTr("TRIPLE")
                    Layout.fillWidth: true
                    font.pointSize: 17
                    background: Rectangle {
                        id: buttonTripleBg
                        color: parent.down ? "#777B86":
                                             (parent.hovered ? "#404656" : "#333948")
                        border.color: "#F29911"

                    }
                    Layout.fillHeight: true
                    Layout.preferredHeight: 100
                    palette.buttonText: "#F29911"
                    Layout.preferredWidth: 130
                    onClicked:{
                        backend.onClickTriple()
                        disableDouble()
                        if(state == "active"){
                            state = "nonActive"
                            buttonNo25.enabled = true
                            buttonNo25.state = "active"
                            buttonNo0.enabled = true
                            buttonNo0.state = "active"
                        } else{
                            state = "active"
                            buttonNo25.enabled = false
                            buttonNo25.state = "nonActive"
                            buttonNo0.enabled = false
                            buttonNo0.state = "nonActive"
                        }
                    }
                    states: [
                        State {
                            name: "nonActive"

                            PropertyChanges {
                                target: buttonTripleBg
                                color: parent.down ? "#777B86":
                                                     (parent.hovered ? "#404656" : "#333948")
                                border.color: "#F29911"

                            }
                        },

                        State {
                            name: "active"
                            PropertyChanges {
                                target: buttonTripleBg
                                color: parent.down ? "#777B86":
                                                     (parent.hovered ? "#242832" : "#191C23")
                                border.color: "#F29911"

                            }
                        }
                    ]
                }




                Button {
                    id: buttonUndo
                    width: 130
                    height: 100
                    text: qsTr("UNDO")
                    Layout.fillWidth: true
                    font.pointSize: 17
                    background: Rectangle {
                        color: parent.down ? "#777B86" :
                                             (parent.hovered ? "#404656" : "#333948")
                        border.color: "#E90000"
                    }
                    Layout.fillHeight: true
                    Layout.preferredHeight: 100
                    palette.buttonText: "#E90000"
                    Layout.preferredWidth: 130
                     onPressed: {
                        backend.onClickUndo()
                        disableDouble()
                        disableTriple()
                    }
                }



            }

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

        Button {
            id: closeButton
            x: 480
            y: 0
            width: 40
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
           onClicked: attached = !attached
        }
    }

    Connections{
        target: backend
    }

    function disableTriple(){
        if(buttonTriple.state === "active"){
            buttonTriple.state = "nonActive"
            buttonNo25.state = "active"
            buttonNo25.enabled = true
            buttonNo0.state = "active"
            buttonNo0.enabled = true
        }
    }

    function disableDouble(){
        if(buttonDouble.state === "active"){
            buttonDouble.state = "nonActive"
            buttonNo0.state = "active"
            buttonNo0.enabled = true
           }
    }



}





/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}
}
##^##*/
