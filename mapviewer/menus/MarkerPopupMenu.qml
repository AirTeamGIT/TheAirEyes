import QtQuick 2.5
import QtQuick.Controls 1.4

Menu {
    property int currentMarker
    property int markersCount
    signal itemClicked(string item)

    function update() {
        clear()
        addItem(qsTr("Удалить")).triggered.connect(function(){itemClicked("deleteMarker")})
      //  addItem(qsTr("Координаты")).triggered.connect(function(){itemClicked("getMarkerCoordinate")})
      //  addItem(qsTr("Перейти")).triggered.connect(function(){itemClicked("moveMarkerTo")})
       // if (currentMarker == markersCount-2){
    //       addItem(qsTr("Маршрут к следующему маркеру")).triggered.connect(function(){itemClicked("routeToNextPoint")});
      //      addItem(qsTr("Дистанцию к следующуму маркеру")).triggered.connect(function(){itemClicked("distanceToNextPoint")});
        //}
        //if (currentMarker < markersCount-2){
          //  addItem(qsTr("Маршрут к следующуму маркеру")).triggered.connect(function(){itemClicked("routeToNextPoints")});
            //addItem(qsTr("Дистанцию к следующуму маркеру")).triggered.connect(function(){itemClicked("distanceToNextPoint")});
       // }

        var menu = addMenu(qsTr("Нарисовать"))


        if (currentMarker <= markersCount-2){

            menu.addItem(qsTr("Линия")).triggered.connect(function(){itemClicked("drawPolyline")})
        }

        if (currentMarker < markersCount-2){
            menu.addItem(qsTr("Полигон")).triggered.connect(function(){itemClicked("drawPolygonMenu")})
        }
    }
}
