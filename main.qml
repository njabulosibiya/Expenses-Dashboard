import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "qrc:/qml/"
import "qrc:/assets/icons/"

ApplicationWindow {
    minimumWidth: 640
    minimumHeight: 480
    visible: true
    visibility: "Maximized"
    title: qsTr("Dashboard")

    background: Rectangle {
        color: "#101010"
    }

    property string defaultFont: "poppins"
    property int sideBarSpacing: 30
    property int windowMargin: 15
    property string sideBarFontColor: "white"
    property int contentRadius: 30
    property int topMargin: 40

    //main layout

    //sidebar
    Rectangle {
        id: sideBar
        anchors.margins: windowMargin + topMargin
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: topMargin
        anchors.leftMargin: topMargin
        width: 320
        color: "transparent"

        Column {
            spacing: 100
            anchors.leftMargin: topMargin
            anchors.fill: parent

            Item {
                width:sideBar.width
                height: 200
                Image {
                    id: profileImage
                    source: "qrc:/assets/images/about.png"
                    width: 102
                    height: 102
                }

                Rectangle {
                    id: notification
                    width: 29
                    height: 29
                    radius: 50
                    color: "#DC3434"
                    anchors.right: profileImage.right
                    anchors.top: profileImage.top
                    Text {
                        id: notificationCount
                        text: "4"
                        anchors.centerIn: parent
                        font {
                            family: defaultFont
                            pixelSize: 13
                        }
                        color: "white"
                    }
                }

                Text {
                    id: profileName
                    text: "Njabulo Sibiya"
                    font {
                        bold: true
                        pixelSize: 30
                        family: "poppins"
                    }
                    color: "white"
                    anchors.top: profileImage.bottom
                    anchors.left: parent.left
                }

                Text {
                    id: profileEmail
                    text: "njabs@ilovenjabs.com"
                    font {
                        pixelSize: 17
                        family: "poppins"
                    }
                    color: "white"
                    anchors.top: profileName.bottom
                    anchors.left: parent.left
                }

            }

            Item {
                width: parent.width
                height: 800

                ListView {
                    anchors.fill: parent
                    spacing: 3
                    model: sideBarModel
                    delegate: sideBarDelegate
                }

                ListModel {
                    id: sideBarModel

                    ListElement {
                        textB: "Dashboard"
                    }

                    ListElement {
                        textB: "Expenses"
                    }

                    ListElement {
                        textB: "Wallets"
                    }

                    ListElement {
                        textB: "Summary"
                    }

                    ListElement {
                        textB: "Accounts"
                    }

                    ListElement {
                        textB: "Settings"
                    }
                }

                Component {
                    id: sideBarDelegate

                    Text {
                        font {
                            family: defaultFont
                            pixelSize: 25
                            bold: true
                        }
                        color: "white"
                        text: textB
                    }
                }
            }
        }
    }

    //mainContent
    Rectangle {
        id: content
        anchors.left: sideBar.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.margins: windowMargin
        radius: contentRadius

        //left content
        Rectangle {
            id: mainContent
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: rightContent.left
            color: "White"
            radius: contentRadius

            Rectangle {
                id: titleContainer
                width: 510
                height: 84
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: topMargin
                Text {
                    id: pageTitle
                    text: "Expenses"
                    font {
                        pixelSize: 40
                        family: "poppins"
                        bold: true
                        letterSpacing: 0.67
                    }
                    anchors.top: parent.top
                    anchors.left: parent.left
                    color: "#262A41"
                }//end_title

                Text {
                    id: date
                    text: "01 - 25 March, 2022"
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    font {
                        family: "poppins"
                        pixelSize: 16
                        letterSpacing: 0.34
                    }
                    color: "#101010"
                }

                Rectangle {
                    id: users
                    width: 122.96
                    height: 31.2
                    anchors.verticalCenter: pageTitle.verticalCenter
                    anchors.right: parent.right

                    Rectangle {
                        id: addUser
                        width: 23.96
                        height: 24
                        radius: 50
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        border {
                            color: "#D2DCE8"
                            width: 1
                        }
                        Text {
                            text: "+"
                            anchors.centerIn: parent
                            color: "#D2DCE8"
                        }
                    }

                    Rectangle {
                        id: user1
                        width: 31.14
                        height: 31.2
                        radius: 50
                        color: "red"
                        anchors.right: addUser.left
                        border {
                            width: 1
                            color: "white"
                        }
                        anchors.rightMargin: 5
                        z:2
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    Rectangle {
                        id: user2
                        width: 31.14
                        height: 31.2
                        radius: 50
                        color: "green"
                        anchors.right: user1.horizontalCenter
                        border {
                            width: 1
                            color: "white"
                        }
                        z:3
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    Rectangle {
                        id: user3
                        width: 31.14
                        height: 31.2
                        radius: 50
                        color: "blue"
                        border {
                            width: 1
                            color: "white"
                        }
                        anchors.right: user2.horizontalCenter
                        x: 600
                        z: 4
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            }

            ListView {
                id: list1
                anchors.top: titleContainer.bottom
                anchors.margins: 20
                anchors.horizontalCenter: parent.horizontalCenter
                width: 510
                height: 224.5
                model: mainContentModel
                spacing: 10
                clip: true
                ScrollBar.vertical: ScrollBar{}
                delegate: ExpensesDelegate {
                    title: titleM
                    time: timeM
                    place: placeM
                    amount: amountM
                }
                header: Rectangle {
                    color: "white"
                    width: parent.width - 10
                    height: 52.5
                    z: 2
                    Text {
                        text: qsTr("Today")
                        anchors.top: parent.top
                        anchors.left: parent.left
                        font {
                            family: defaultFont
                            pixelSize: 18
                            letterSpacing: 0.3
                        }
                        color: "#262A41"
                    }//end _text

                    Rectangle {
                        color: "transparent"
                        width: parent.width
                        height: 14
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter

                        Rectangle {
                            color: "#D8D8D8"
                            width: parent.width
                            height: 1
                            anchors.top: parent.top
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                }
                headerPositioning: ListView.OverlayHeader
                snapMode: ListView.SnapToItem
            }

            ListModel {
                id: mainContentModel
                ListElement {
                    titleM: "Grocery"
                    timeM: "5:12pm"
                    placeM: "Wilrogate"
                    amountM: "-326.00"
                }

                ListElement {
                    titleM: "Transportation"
                    timeM: "5:12pm"
                    placeM: "Johannesburg"
                    amountM: "-15.00"
                }

                ListElement {
                    titleM: "Housing"
                    timeM: "5:12pm"
                    placeM: "Umlazi"
                    amountM: "-185.750"
                }

                ListElement {
                    titleM: "Grocery"
                    timeM: "5:12pm"
                    placeM: "Wilrogate"
                    amountM: "-326.00"
                }

                ListElement {
                    titleM: "Transportation"
                    timeM: "5:12pm"
                    placeM: "Johannesburg"
                    amountM: "-15.00"
                }

                ListElement {
                    titleM: "Housing"
                    timeM: "5:12pm"
                    placeM: "Umlazi"
                    amountM: "-185.750"
                }
            }

            ListView {
                anchors.top: list1.bottom
                anchors.margins: 20
                anchors.horizontalCenter: parent.horizontalCenter
                width: 510
                height: 224.5
                model: mondayMarch
                spacing: 10
                clip: true
                ScrollBar.vertical: ScrollBar{}
                delegate: ExpensesDelegate {
                    title: titleM
                    time: timeM
                    place: placeM
                    amount: amountM
                }
                header: Rectangle {
                    color: "white"
                    width: parent.width - 10
                    height: 52.5
                    z: 2
                    Text {
                        text: qsTr("Monday, 23 March 2022")
                        anchors.top: parent.top
                        anchors.left: parent.left
                        font {
                            family: defaultFont
                            pixelSize: 18
                            letterSpacing: 0.3
                        }
                        color: "#262A41"
                    }//end _text

                    Rectangle {
                        color: "transparent"
                        width: parent.width
                        height: 14
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter

                        Rectangle {
                            color: "#D8D8D8"
                            width: parent.width
                            height: 1
                            anchors.top: parent.top
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                }
                headerPositioning: ListView.OverlayHeader
                snapMode: ListView.SnapToItem
            }

            ListModel {
                id: mondayMarch
                ListElement {
                    titleM: "Food and Drink"
                    timeM: "5:12pm"
                    placeM: "Wilrogate"
                    amountM: "-7226.00"
                }

                ListElement {
                    titleM: "Entertainment"
                    timeM: "5:12pm"
                    placeM: "Cosmo"
                    amountM: "-195.00"
                }

                ListElement {
                    titleM: "Shopping"
                    timeM: "5:12pm"
                    placeM: "Umlazi"
                    amountM: "-185.750"
                }

                ListElement {
                    titleM: "Grocery"
                    timeM: "5:12pm"
                    placeM: "Wilrogate"
                    amountM: "-326.00"
                }

                ListElement {
                    titleM: "Transportation"
                    timeM: "5:12pm"
                    placeM: "Johannesburg"
                    amountM: "-15.00"
                }

                ListElement {
                    titleM: "Housing"
                    timeM: "5:12pm"
                    placeM: "Umlazi"
                    amountM: "-185.750"
                }
            }

        }

        Rectangle {
            id: rightContent
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            radius: contentRadius
            width: 350
            color: "#F9FAFC"

            Rectangle {
                width: parent.radius
                height: parent.height
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                color: parent.color
            }

            Rectangle {
                id: stats
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                width: 250
                height: 385
                anchors.topMargin: topMargin
                color: "transparent"

                ListView {
                    anchors.fill: parent
                    spacing: 60
                    model: listModel
                    clip: true
                    header: Rectangle {
                        width: parent.width
                        height: text.height
                        color: "#F9FAFC"
                        Text {
                            id: text
                            text: "Where your money go?"
                            font {
                                family: defaultFont
                                pixelSize: 20
                                letterSpacing: 0.33
                            }
                            lineHeight: 1.3
                            color: "#262A41"
                        }//end_text
                        anchors.bottomMargin: 5
                        z: 2
                    }

                    ScrollBar.vertical: ScrollBar{}
                    delegate: StatsDelegate {
                        itemName: name
                        itemAmount: amount
                        itemIndicator: indicator
                    }
                    headerPositioning: ListView.OverlayHeader
                }

                ListModel {
                    id: listModel
                    ListElement {
                        name: "Food and Drinks"
                        amount: "872,400"
                        indicator: 0.25
                    }


                    ListElement {
                        name: "Shopping"
                        amount: "1,376,200"
                        indicator: 0.4
                    }


                    ListElement {
                        name: "Housing"
                        amount: "928,500"
                        indicator: 0.3
                    }


                    ListElement {
                        name: "Vehicle"
                        amount: "520,000"
                        indicator: 0.2
                    }


                    ListElement {
                        name: "Food and Drinks"
                        amount: "872,400"
                        indicator: 0.3
                    }

                    ListElement {
                        name: "Vehicle"
                        amount: "520,000"
                        indicator: 0.2
                    }


                    ListElement {
                        name: "Food and Drinks"
                        amount: "872,400"
                        indicator: 0.3
                    }

                    ListElement {
                        name: "Vehicle"
                        amount: "520,000"
                        indicator: 0.2
                    }


                    ListElement {
                        name: "Food and Drinks"
                        amount: "872,400"
                        indicator: 0.3
                    }
                }
            }

            Rectangle {
                id: boxTipsContainer
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: topMargin
                width: 250
                height: 292
                color: "transparent"

                Rectangle {
                    id: boxTips
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    width: 250
                    height: 259
                    color: "#979791"
                    radius: 15

                    Image {
                        id: boxes
                        source: "qrc:/assets/icons/package.png"
                        anchors.bottom: label.top
                        anchors.right: parent.right
                        width: 119
                        height: 119
                    }


                    Text {
                        id: label
                        text: "Save more money"
                        font{
                            family: "poppins"
                            pixelSize: 16
                            letterSpacing: 0.34
                            bold: true
                        }
                        color: "#273240"
                        anchors.bottom: boxTipsContent.top
                        anchors.left: boxTipsContent.left
                        anchors.bottomMargin: 5
                    }

                    Text {
                        id: boxTipsContent
                        width: button.width
                        text: "eiusmod tempor incididunt ut \nlabore et dolore magna aliqua.\nUt enim ad minim."
                        font{
                            family: defaultFont
                            pixelSize: 12
                        }
                        anchors.bottom: button.top
                        anchors.margins: 10
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: "#404852"
                    }

                    Button {
                        id: button
                        text: "VIEW TIPS"
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottomMargin: 10
                    }


                }
            }
        }
    }
}
