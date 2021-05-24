import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.15

Item {
    RowLayout {
        id: rowLayout
        x: 40
        y: 100
        anchors.fill: parent
        anchors.leftMargin: 60
        anchors.topMargin: 80
        anchors.rightMargin: 30
        anchors.bottomMargin: 80
        spacing: 40

        Rectangle {
            id: rectangleScoreWindow
            width: 200
            height: 200
            color: "#00000000"
            border.color: "#ffffff"
            border.width: 2
            Layout.rowSpan: 1
            Layout.preferredHeight: -1
            Layout.preferredWidth: 900
            Layout.fillHeight: true
            Layout.fillWidth: true

            PlayerScoreWindow {
                id: playerScoreWindow
                width: 600
                anchors.fill: parent
                anchors.bottomMargin: 0
                anchors.topMargin: 0
                objectName: "PlayerScoreWindow"

                onAttachedChanged: {
                    if (attached) {
                        pushItem(objectName, auxiliaryWindowScore, rectangleScoreWindow)
                        auxiliaryWindowScore.close()
                        checkWindows()
                    } else {
                        pushItem(objectName, rectangleScoreWindow, auxiliaryWindowScore)
                        auxiliaryWindowScore.setGeometry(x, y, width, height)
                        auxiliaryWindowScore.show()
                        checkWindows()
                    }
                }
            }
        }


        Rectangle {
            id: rectanglePointsWindow
            width: 200
            height: 200
            color: "#00000000"
            border.color: "#ffffff"
            border.width: 2
            Layout.preferredWidth: 520
            Layout.fillWidth: true
            Layout.fillHeight: true

            PointsWindow {
                id: pointsWindow
                anchors.right: parent.right
                anchors.fill: parent
                objectName: "PointsWindow"




                onAttachedChanged: {
                    if (attached) {
                        pushItem(objectName, auxiliaryWindowPoints, rectanglePointsWindow)
                        auxiliaryWindowPoints.close()
                        checkWindows()
                    } else {
                        pushItem(objectName, rectanglePointsWindow, auxiliaryWindowPoints)
                        auxiliaryWindowPoints.setGeometry(x, y, width, height)
                        auxiliaryWindowPoints.show()
                        checkWindows()
                    }
                }
            }
        }

    }




AuxilliaryWindow{
    id: auxiliaryWindowScore
    width: 900
    height: 600
    visible: false
    minimumWidth: 900
    minimumHeight: 600
    maximumWidth: 1800
    maximumHeight: 1000

}

AuxilliaryWindow{
    id: auxiliaryWindowPoints
    visible: false
    width: 520
    height: 600
    minimumWidth: 520
    minimumHeight: 600


}

function pushItem(objName, parent, newParent) {
    var index = indexOfObject(objName, parent)
    if (index === -1) {
        console.debug("Couldn't find object with name \"" + objName + "\"")
        return
    } else {
        newParent.data.push(parent.data[index])
    }
}


function indexOfObject(objName, parent) {
    for (var i = 0 ; i < parent.data.length; i++) {
        if (parent.data[i].objectName === objName)
            return i
    }
    return -1
}

function checkWindows(){
    if(!pointsWindow.attached && !playerScoreWindow.attached){
        rootWindow.width = 0
        rootWindow.height = 0
    } else if(rootWindow.width === 0 && rootWindow.height === 0){
        rootWindow.width = 1600
        rootWindow.height = 800
    }
}


}
