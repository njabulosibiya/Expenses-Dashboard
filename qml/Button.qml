import QtQuick 2.15
import QtQuick.Controls 2.15 as T

T.Button {
    text: "text"

    contentItem: Text {
        text: parent.text
        font {
            family: "poppins"
            pixelSize: 13
            letterSpacing: 1.5
        }
        //opacity: enabled ? 1.0 : 0.3
        //color: control.down ? "#17a81a" : "#21be2b"
        color: "white"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        //elide: Text.ElideRight
    }

    background: Rectangle {
        radius: 8
        implicitHeight: 45
        implicitWidth: 200
        color: "#101010"
    }
}
