<?php


namespace app\controllers;


use Yii;
use yii\web\Controller;
use app\models\Good;

class CategoryController extends Controller
{
    public function actionIndex()
    {
        $goods = new Good(); // создаем экземпляр модели Good
        $goods = $goods->getAllGoods(); // все эти товары попадают в controller
        return $this->render('index', compact('goods'));

//        return $this->render('index', ['good'=> $good]); // передаем все товары во view
    }

    public function actionView($id)
    {
        $catGoods = new Good();
        $catGoods = $catGoods->getGoodsCategories($id);
        return $this->render('view', compact('catGoods'));
    }

    public function actionSearch()
    {
        $search = Yii::$app->request->get('search'); // получаем данные из формы алтернатива $_GET['name']
        $goods = new Good();
        $goods = $goods->getSearchResults($search);
        return $this->render('search', compact('goods', 'search'));
    }

}

