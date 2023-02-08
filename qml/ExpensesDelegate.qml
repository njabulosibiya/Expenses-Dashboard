import QtQuick 2.15

Item {
    property alias title: expenseName.text
    property alias time: time.text
    property alias place: place.text
    property alias amount: deductedAmount.text
    width: root.width
    height: root.height
    Rectangle {
        id: root
        width: 500
        height: 49

        Rectangle {
            id: icon
            width: 48
            height: 48
            color: "red"
            radius: 50
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
        }

        Text {
            id: expenseName
            text: "Expense Title"
            anchors.left: icon.right
            anchors.bottom: parent.verticalCenter
            anchors.leftMargin: 15
            font {
                family: "poppins"
                pixelSize: 16
                //medium: true
                letterSpacing: 0.34
            }
            color: "#273240"
        }

        Text {
            id: time
            text: "00:00 am - "
            anchors.top: parent.verticalCenter
            anchors.left: icon.right
            anchors.leftMargin: 15
            font {
                family: "poppins"
                pixelSize: 14
                //regular: true
                letterSpacing: 0.5
            }
            color: "#404852"
        }

        Text {
            id: place
            text: "place"
            anchors.top: parent.verticalCenter
            anchors.left: time.right
            font {
                family: "poppins"
                pixelSize: 14
                //regular: true
                letterSpacing: 0.5
            }
            color: "#404852"
        }

        Text {
            id: deductedAmount
            text: "-0,00"
            anchors.top: parent.top
            anchors.right: parent.right
            font {
                family: "poppins"
                pixelSize: 16
                //medium: true
                letterSpacing: 0.34
            }
            color: "#273240"
        }
    }
}
