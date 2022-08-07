<?php


namespace app\widgets;


use app\models\Category;
use yii\base\Widget;

class MenuWidget extends Widget
{
    public $data;

    public function run() // запуск виджета
    {
        $this->data = new Category(); // создание нового объекта класса Category
        $this->data = $this->data->getCategories(); // получаем данные  из таблицы category
        $this->data = $this->categoryToTemplate($this->data); // полученные данные связываем с template (menu.php)

        return $this->data; // возвращаем шаблон и данные
    }

    public function categoryToTemplate($data)
    {
        ob_start();

        include __DIR__ . '/template/menu.php';

        return ob_get_clean();
    }
}