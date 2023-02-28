import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Window 2.2

Window {
    id: ooo
    signal signalExit   // Задаём сигнал
    width: 410
    height: 810

        // Кнопка для открытия главного окна приложения
    Item {
        id: win
        anchors.fill: parent

        Rectangle{
            anchors.fill: parent
            color: "#71A2F2"
        }

        Text {
            anchors.bottom:win.bottom
            anchors.bottomMargin: win.height/6*4.8
            anchors.horizontalCenter: win.horizontalCenter
            id: text_reg
            font.pointSize: 40
            text: qsTr("Air Team")
            color: "#FFFFFF"
        }

        Rectangle {
            x:75
            y:200
            width: 260
            height: 50
           // color: "#DCEFEB"
            border.color: "#4898C3"

            radius: 15


            TextInput {
                id: input1
                x: 20; y: 16
                width: 120; height: 20
                focus: true
                font.pointSize: 10
                color: "black"

                text: "Логин"
            }


       }
        Rectangle {
            x:75
            y:280
            width: 260
            height: 50
           // color: "#DCEFEB"
            border.color: "#4898C3"

            radius: 15


            TextInput {
                id: input12
                x: 20; y: 16
                width: 120; height: 20
                focus: true
                font.pointSize: 10
                color: "black"

                text: "Пароль"
            }


       }



        Button{
            id: reg_but

            height: win.height/15
            width: win.width/3

            property color background_color: "#A6E9D5"
            property color background_color_pressed: Qt.darker(background_color,1.2)
            Rectangle{
                anchors.fill: parent
                color:"#DCEFEB"
                radius:10
                border.width: 1

                border.color: "#000000"
            }

            Text {
                anchors.centerIn: reg_but
                text: qsTr("Войти")
                font.pointSize:15
                color: "#000000"
            }

            anchors.bottom:win.bottom
            anchors.bottomMargin: win.height/4

            anchors.right: win.horizontalCenter
            anchors.rightMargin: win.width/20

            onClicked :{
                ooo.signalExit()
            }
        }

        Button{
            id: reg_back

            height: win.height/15
            width: win.width/3

            property color background_color: "#FFFFFF"
            property color background_color_pressed: Qt.darker(background_color,1.2)
            Rectangle{
                anchors.fill: parent
                color:"#5698D4"
                radius:10
                border.width: 1
                border.color: "#000000"
            }

            Text {
                anchors.centerIn: reg_back
                text: qsTr("Регистрация")
                font.pointSize:15
                color: "#000000"
            }


            anchors.bottom:win.bottom
            anchors.bottomMargin: win.height/4

            anchors.left: win.horizontalCenter
            anchors.leftMargin: win.width/20

            onClicked :{
                ooo.signalExit()
            }

        }
        Button{
            id: remember

            height: win.height/20
            width: win.width/3

            property color background_color: "#FFFFFF"
            property color background_color_pressed: Qt.darker(background_color,1.2)
            Rectangle{
                anchors.fill: parent
                color:"#A6E9D5"
                radius:10
                border.width: 1
                border.color: "#000000"
            }

            Text {
                anchors.centerIn: remember
                text: qsTr("Востановление")
                font.pointSize:15
                color: "#000000"
            }


            anchors.bottom:win.bottom
            anchors.bottomMargin: win.height/2
            x: 140




            onClicked :{
                ooo.signalExit()
            }

        }
    }
}
