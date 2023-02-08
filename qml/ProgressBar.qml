import QtQuick 2.15
import QtQuick.Controls 2.15 as C

C.ProgressBar {
    id: control
    value: 0.1
    background: Rectangle {
        radius: 5
        color: "#ECEFF5"
        implicitHeight: 5
        implicitWidth: 250
    }

    contentItem: Item {
        implicitWidth: 250
        implicitHeight: 5

        Rectangle {
            width: control.visualPosition * parent.width
            height: parent.height
            radius: 5
            color: "#31BA96"
        }
    }
}
