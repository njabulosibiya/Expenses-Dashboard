import QtQuick 2.15
import "qrc:/qml/"

Item {
    id: root

    property alias itemName: item.text
    property alias itemAmount: amount.text
    property alias itemIndicator: progressBar.value
    Rectangle {
        width: 240
        height: 37
        color: "transparent"

        Text {
            id: item
            font {
                family: "poppins"
                pixelSize: 13
                letterSpacing: 0.46
            }
            lineHeight: 24
            color: "#273240"
            text: "item name"
            anchors.top: parent.top
            anchors.left: parent.left
        }

        Text {
            id: amount
            font {
                family: "poppins"
                pixelSize: 13
                letterSpacing: 0.46
            }
            lineHeight: 24
            color: "#273240"
            text: "amount"
            anchors.right: parent.right
            anchors.top: parent.top
        }

        ProgressBar {
            id: progressBar
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width
        }
    }

}
