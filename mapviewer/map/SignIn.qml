import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Window 2.2

Window {
    id: jjj
    signal signalExit   // Задаём сигнал
    width: 410
    height: 800

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
            anchors.bottomMargin: win.height/6*4.3
            anchors.horizontalCenter: win.horizontalCenter
            id: text_reg
            font.pointSize: 40
            text: qsTr("Войти")
            color: "#FFFFFF"
        }

        Rectangle{
            height: win.height/15
            width: win.width/2*1.5
            anchors.bottom:win.bottom
            anchors.bottomMargin: win.height/6*3.4

            anchors.horizontalCenter: win.horizontalCenter
            color:"#DCEFEB"
            radius:10
            border.width: 1
            border.color: "#000000"
            TextEdit {
                anchors.top: parent.top
                anchors.topMargin: win.height/60
                anchors.left: parent.left
                anchors.leftMargin:parent.width/20
                text: "login"
                height: win.height/15
                width: win.width/2*1.5
                focus: true
                wrapMode: TextEdit.Wrap
            }
        }
        Rectangle{
            height: win.height/15
            width: win.width/2*1.5
            anchors.bottom:win.bottom
            anchors.bottomMargin: win.height/6*2.7

            anchors.horizontalCenter: win.horizontalCenter
            color:"#3A8EB7"
            radius:10
            border.width: 1
            border.color: "#000000"
            TextEdit {
                anchors.top: parent.top
                anchors.topMargin: win.height/60
                anchors.left: parent.left
                anchors.leftMargin:parent.width/20
                text: "password"
                height: win.height/15
                width: win.width/2*1.5
                focus: true
                wrapMode: TextEdit.Wrap
            }
        }

        Button{
            id: signI

            height: win.height/15
            width: win.width/2.5

            property color background_color: "#A6E9D5"
            property color background_color_pressed: Qt.darker(background_color,1.2)
            Rectangle{
                anchors.fill: parent
                color:reg_b.down ? signI.background_color : signI.background_color_pressed
                radius:10
                border.width: 1
                border.color: "#000000"
            }

            Text {
                anchors.centerIn: signI
                text: qsTr("войти")
                font.pointSize:15
                color: "#000000"
            }


            anchors.bottom:win.bottom
            anchors.bottomMargin: win.height/6*1.7

            anchors.horizontalCenter: win.horizontalCenter

            onClicked :{
                jjj.signalExit()
            }

        }
    }
}
