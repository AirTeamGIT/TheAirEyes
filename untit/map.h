#ifndef MAP_H
#define MAP_H

#include <QDialog>

namespace Ui {
class map;
}

class map : public QDialog
{
    Q_OBJECT

public:
    explicit map(QWidget *parent = nullptr);
    ~map();

private slots:
    void on_pushButton_clicked();

private:
    Ui::map *ui;
};

#endif // MAP_H
