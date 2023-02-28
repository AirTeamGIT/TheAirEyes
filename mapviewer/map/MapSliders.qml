import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 2.0 as C2



Row {

    Register {
            id: firstWindow


            // Обработчик сигнала на открытие основного окна
            onSignalExit: {
                firstWindow.close()     // Закрываем первое окно
                mainWindow.show()       // Показываем основное окно
            }
        }
    id: containerRow


    property var mapSource
    property real fontSize : 14
    property color labelBackground : "black"
    property int edge: Qt.RightEdge
    property alias expanded: sliderToggler.checked


    function rightEdge() {
        return (containerRow.edge === Qt.RightEdge);
    }

    layoutDirection: rightEdge() ? Qt.LeftToRight : Qt.RightToLeft

    Column {
        id: sliderColumns
        spacing: 0
        topPadding: 0
        bottomPadding: 0

            Rectangle{

                Label {
                    anchors.top:  parent.top
                    anchors.left: parent.left
                    Button {
                        id: sliderToggler
                        x: 10
                        y: 10

                        smooth: true  // smoother image
                        Image {
                                anchors.fill: parent
                                source: "../resources/Layers.png"
                                fillMode: Image.PreserveAspectFit
                            }
                            checkable: true
                            checked: true
                        text: ""
                        width: 50
                        height: 50


                        style: ButtonStyle {

                            background: Rectangle {

                               // color: "#669FBE"
                               // border.color: "#4898C3"
                                radius: 15

                            }
                        }

                    }
                    Button {
                        id: sliderToggler1
                        x: 350
                        y: 10

                        smooth: true  // smoother image
                        Image {
                                anchors.fill: parent
                                source: "../resources/Loopa.png"
                                fillMode: Image.PreserveAspectFit
                            }
                            checkable: true
                            checked: true
                        text: ""
                        width: 50
                        height: 50


                        style: ButtonStyle {

                            background: Rectangle {

                               // color: "#669FBE"
                                //border.color: "#4898C3"
                                radius: 15

                            }
                        }

                    }
                    Rectangle {
                        x:75
                        y:10
                        width: 260
                        height: 50
                       // color: "#DCEFEB"
                       // border.color: "#4898C3"

                        radius: 15

                        Image {
                                anchors.fill: parent
                                source: "../resources/topper.png"
                                fillMode: Image.PreserveAspectFit
                            }
                        TextInput {
                            id: input1
                            x: 20; y: 16
                            width: 120; height: 20
                            focus: true
                            font.pointSize: 10
                            color: "black"

                            text: "Поиск геоточки"
                        }


                   }
                    Rectangle {
                        x:0
                        y:740
                        width: 412
                        height: 100
                        color: "#DCEFEB"
                        border.color: "#4898C3"

                        radius: 0
                        Image {
                                anchors.fill: parent
                                source: "../resources/weather_wind.png"
                                fillMode: Image.fill
                            }

                        Button {
                            id: input11
                            x: 0; y: 0
                            width: 412; height: 100
                            focus: true
                            text: ""
                        }


                   }
                }
                Label {

                    Button {
                        id: plusButton
                        x: 350
                        y: 340
                        smooth: true  // smoother image
                        Image {
                                anchors.fill: parent
                                source: "../resources/plus.png"
                                fillMode: Image.fill
                            }
                            checkable: true
                            checked: true
                        width: 50
                        height: 50
                        text: "+"
                        onClicked: containerRow.mapSource.zoomLevel += 1
                        style: ButtonStyle {

                            background: Rectangle {


                                border.color: "#4898C3"
                                radius: 15
                                color: "#79b0ce"
                            }
                        }

                    }
                    Button {
                        id: minusButton
                        x: 350
                        y: 410
                        smooth: true  // smoother image
                        Image {
                                anchors.fill: parent
                                source: "../resources/minus.png"
                                fillMode: Image.fill
                            }
                            checkable: true
                            checked: true
                        width: 50
                        height: 50
                        text: "-"
                        onClicked: containerRow.mapSource.zoomLevel -= 1
                        style: ButtonStyle {


                            background: Rectangle {


                                border.color: "#4898C3"
                                radius: 15
                                color: "#79b0ce"
                            }
                        }

                    }

                }

            }

            }







    Rectangle {

        id: sliderContainer
        height: parent.height
        width: sliderRow.width
        visible: sliderToggler.checked
        color: Qt.rgba( 0, 191 / 255.0, 255 / 255.0, 0.07)

        property var labelBorderColor: "black"
        property var slidersHeight : sliderContainer.height
                                     - rowSliderValues.height
                                     - rowSliderLabels.height
                                     - sliderColumn.spacing
                                     - sliderColumn.topPadding
                                     - sliderColumn.bottomPadding

        Column {
            id: sliderColumn
            spacing: 0
            topPadding: 0
            bottomPadding: 0
            anchors.centerIn: parent

            // the sliders value labels
            Row {
                id: rowSliderValues
                width: 0
                height: 0
                property real entryWidth: zoomSlider.width



                Rectangle{
                    color: labelBackground
                    height: parent.height
                    width: parent.Width
                    border.color: sliderContainer.labelBorderColor
                    Label {
                        anchors.left: parent.left
                        anchors.bottom: parent.bottom


                        Button {
                            id: аfButton
                            x: 10
                            y: 50

                            anchors.bottom: parent.bottom
                            anchors.left: parent.left
                            checkable: true
                            checked: true
                            style: ButtonStyle {

                                background: Rectangle {


                                    border.color: "#4898C3"
                                    radius: 15
                                    color: "#79b0ce"
                                }
                            }

                            width :50
                            height: 50
                            text: ""
                            smooth: true  // smoother image
                            Image {
                                    anchors.fill: parent
                                    source: "../resources/samolet.png"
                                    fillMode: Image.fill
                                    opacity: 0.9
                                }
                            onClicked:  containerRow.mapSource.bearing = 0
                        }
                        Button {
                            id: vаfButton
                            x: 10
                            y: 170
                            smooth: true  // smoother image

                                checkable: true
                                checked: true
                            style: ButtonStyle {

                               background: Rectangle {
                                   Image {
                                          // anchors.fill: parent
                                        x:-4
                                           source: "../resources/Pos.png"
                                           fillMode: Image.PreserveAspectFit
                                           opacity: 0.9
                                       }

                                    //border.color: "#4898C3"
                                    radius: 15
                                    //color: "#79b0ce"
                                }
                            }

                            width: 50
                            height: 50

                            text: ""
                            onClicked:  containerRow.mapSource.bearing = 0
                        }
                        Button {
                            id: zаfButton
                            x: 10
                            y: 230
                            smooth: true  // smoother image

                                checkable: true
                                checked: true
                            style: ButtonStyle {

                                background: Rectangle {

                                    Image {
                                            x:-4
                                            source: "../resources/Comp.png"
                                            fillMode: Image.PreserveAspectFit
                                            opacity: 0.8
                                        }

                                   // border.color: "#4898C3"
                                    radius: 15
                                   // color: "#79b0ce"
                                }
                            }


                            width: 50
                            height: 50
                            text: ""
                            onClicked:  containerRow.mapSource.bearing = 0
                        }


                        Button {
                            id: zаfButtong
                            x: 10
                            y: 290
                            smooth: true  // smoother image
                            Image {
                                    anchors.fill: parent
                                    source: "../resources/home.svg"
                                    fillMode: Image.PreserveAspectFit
                                }
                                checkable: true
                                checked: true
                            style: ButtonStyle {

                                background: Rectangle {


                                    border.color: "#4898C3"
                                    radius: 15
                                    color: "#79b0ce"
                                }
                            }

                            width: 50
                            height: 50
                            text: "3"
                            onClicked:  containerRow.mapSource.bearing = 0
                        }
                        Button {
                            id: zzvаfButton
                            x: 10
                            y: 350
                            smooth: true  // smoother image
                            Image {
                                    anchors.fill: parent
                                    source: "../resources/layers.svg"
                                    fillMode: Image.PreserveAspectFit
                                }
                                checkable: true
                                checked: true
                            width: 50
                            height: 50

                                text: ""
                                style: ButtonStyle {

                                    background: Rectangle {


                                        border.color: "#4898C3"
                                        radius: 15
                                        color: "#79b0ce"
                                    }
                                }

                            onClicked: containerRow.mapSource.zoomLevel -= 1
                        }
                        Button {
                            id: vvvzаfButton
                            x: 10
                            y: 350
                            smooth: true  // smoother image

                                checkable: true
                                checked: true
                            style: ButtonStyle {
                                background: Rectangle {
                                    Image {
                                            x:-4
                                            source: "../resources/Prof.png"
                                            fillMode: Image.Fill
                                        }

                                    //border.color: "#4898C3"
                                    radius: 15
                                  //  color: "#79b0ce"
                                }


                            }

                            onClicked:  {
                                firstWindow.show() // Открываем второе окно
                                mainWindow.hide()
                            }
                            width: 50
                            height: 50
                            text: ""

                        }
                        Button {
                            id: jjzаfButton
                            x: 10
                            y: 290
                            smooth: true  // smoother image

                                checkable: true
                                checked: true
                            style: ButtonStyle {

                                background: Rectangle {


                                  //  border.color: "#4898C3"
                                    radius: 15
                                   // color: "#79b0ce"
                                    Image {
                                            x:-4
                                            source: "../resources/Setting.png"
                                            fillMode: Image.fill
                                        }
                                }
                            }

                            width: 50
                            height: 50
                            text: ""
                            onClicked:  containerRow.mapSource.bearing = 0
                        }

                    }

                }


                }


            }


        }
}
