<?php


namespace app\models;


use Yii;
use yii\db\ActiveRecord;

class Good extends ActiveRecord
{
    public static function tableName() //если название модели и таблицы в БД совпадает, то это этот метод необязателен
    {
        return 'good';
    }

    public function getAllGoods()
    {
        $goods = Yii::$app->cache->get('good'); // получаем все товары БД из кэша | позволяет кэшировать запросы к бд
        if (!$goods) {
            $goods = Good::find()->asArray()->all(); //обращаемся к базе данных и берем все товары
            Yii::$app->cache->set('good', $goods, 10); // записываем данные из БД в кэш
        }
        return $goods;
    }

    public function getGoodsCategories($id)
    {
        $catGoods = Good::find()->where(['category' => $id])->asArray()->all();
        return $catGoods;
    }

    public function getOneGood($name)
    {
        return Good::find()->where(['link_name' => $name])->one();
    }

    public function getSearchResults($search)
    {
        // like - позволяет находить все совпадения, name - по какому полю в таблице ищем совпадения
        $searchResults = Good::find()->where(['like', 'name', $search])->asArray()->all();
        return $searchResults;
    }
}