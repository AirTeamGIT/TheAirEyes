import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4


ApplicationWindow {
    id: mainWindow
    visible: true
    width: 410
    height: 800

    Item {

        id: win

        anchors.fill: parent

        Rectangle{
            anchors.fill: parent
            color: "#71A2F2"
        }

        Button{
            id:reg_b

            height: win.height/10

            property color background_color: "#DCEFEB"
            property color background_color_pressed: Qt.darker(background_color,1.2)
            Rectangle{
                anchors.fill: parent
                color:reg_b.down ? reg_b.background_color : reg_b.background_color_pressed
                radius:10
                border.width: 1
                border.color: "#000000"
            }

            Text {
                anchors.centerIn: reg_b
                text: qsTr("регистрация")
                font.pointSize:15
                color: "#000000"

            }
            anchors.top: win.top
            anchors.topMargin: win.height/5*2.5

            anchors.right: win.horizontalCenter
            anchors.rightMargin: win.width/20
            onClicked: {
                firstWindow.show()  // Открываем первое окно
                mainWindow.hide()   // Скрываем основное окно
            }


        }
        Button{
            id:in_b
            property color background_color: "#3A8EB7"
            property color background_color_pressed: Qt.darker(background_color,1.2)
            height: win.height/10

            Rectangle{
                anchors.fill: parent
                color:reg_b.down ? in_b.background_color : in_b.background_color_pressed
                radius:10
                border.width: 1
                border.color: "#000000"

            }
            Text {
                anchors.centerIn: in_b
                text: qsTr("войти")
                font.pointSize:15
                color: "#FFFFFF"
            }
            anchors.top: win.top
            anchors.topMargin: win.height/5*2.5

            anchors.left: win.horizontalCenter
            anchors.leftMargin: win.width/20
            onClicked: {
                numberthree.show() // Открываем второе окно
                mainWindow.hide()   // Скрываем основное окно
            }


        }
        Text {
            anchors.bottom: win.verticalCenter
            anchors.bottomMargin: win.height/5*0.5
            anchors.horizontalCenter: win.horizontalCenter
            id: text_name
            font.pointSize: 40
            text: qsTr("Air Team")
            color: "#FFFFFF"
        }
    }


    Register {
        id: firstWindow


        // Обработчик сигнала на открытие основного окна
        onSignalExit: {
            firstWindow.close()     // Закрываем первое окно
            mainWindow.show()       // Показываем основное окно
        }
    }


    SignIn{
        id: numberthree


        // Обработчик сигнала на открытие основного окна
        onSignalExit: {
            numberthree.close()    // Закрываем второе окно
            mainWindow.show()       // Показываем основное окно
        }
    }
}

