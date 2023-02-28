import QtQuick 2.5
import QtQuick.Controls 1.4

Menu {
    property variant coordinate
    property int markersCount
    property int mapItemsCount
    signal itemClicked(string item)

    function update() {
        clear()
        addItem(qsTr("Добавить маркер")).triggered.connect(function(){itemClicked("addMarker")})
        //addItem(qsTr("Получить координаты")).triggered.connect(function(){itemClicked("getCoordinate")})

        if (markersCount > 0) {
            addItem(qsTr("Удалить все маркеры")).triggered.connect(function(){itemClicked("deleteMarkers")})
        }

        if (mapItemsCount > 0) {
            addItem(qsTr("Удалить все схемы")).triggered.connect(function(){itemClicked("deleteItems")})
        }
    }
}
