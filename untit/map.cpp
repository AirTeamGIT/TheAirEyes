#include "map.h"
#include "ui_map.h"
#include <QPixmap>
#include <QMessageBox>
map::map(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::map)
{
    ui->setupUi(this);
    QPixmap pix(":/img/IMG/Снимок.PNG");

}

map::~map()
{
    delete ui;
}

void map::on_pushButton_clicked()
{
    if(ui->pushButton_2->isVisible()){
        ui->pushButton_2->setVisible(false);
        ui->pushButton_3->setVisible(false);
        ui->pushButton_4->setVisible(false);
    }
    else{
        ui->pushButton_2->setVisible(true);
        ui->pushButton_3->setVisible(true);
        ui->pushButton_4->setVisible(true);
    }
}

