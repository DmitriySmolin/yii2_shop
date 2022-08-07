<?php


namespace app\controllers;

use app\models\Cart;
use app\models\Good;
use app\models\Order;
use app\models\OrderGood;
use Yii;
use yii\web\Controller;

class CartController extends Controller

{
    public function actionOrder()
    {
        $session = Yii::$app->session; // создание сессии
        $session->open(); // открытие сессии для работы с ней
        $order = new Order();
        if ($order->load(Yii::$app->request->post())) { // проверка была ли форма отправлена
            $order->date = date('Y-m-d:H:i:s'); // добавляем дату заказа
            $order->sum = $_SESSION['cart.totalSum']; // добавляем сумму заказа
            if ($order->save()) { // если все успешно сохраняется в БД
                Yii::$app->mailer->compose()
                    ->setFrom(['aaa@aaa' => 'test test'])
                    ->setTo('asadasd@asdasdasd.ru')
                    ->setSubject('Ваш заказ принят')
                    ->send();
                $session->remove('cart');
                $session->remove('cart.totalQuantity');
                $session->remove('cart.totalSum');
                return $this->render('success', compact('session'));
            }
        }
        $this->layout = 'empty-layout';
        return $this->render('order', compact('session', 'order'));
    }

    public function actionDelete($id)
    {
        $session = Yii::$app->session; // создание сессии
        $session->open(); // открытие сессии для работы с ней
        $cart = new Cart();
        $cart->recalCart($id);
        return $this->renderPartial('cart', compact('session'));
    }

    public function actionClear()
    {
        $session = Yii::$app->session; // создание сессии
        $session->open(); // открытие сессии для работы с ней
        $session->remove('cart');
        $session->remove('cart.totalQuantity');
        $session->remove('cart.totalSum');
        return $this->renderPartial('cart', compact('session'));
    }

    public function actionOpen()
    {
        $session = Yii::$app->session; // создание сессии
        $session->open(); // открытие сессии для работы с ней

        return $this->renderPartial('cart', compact('session'));
    }

    public function actionAdd($name)
    {
        $good = new Good();
        $good = $good->getOneGood($name);
        $session = Yii::$app->session; // создание сессии
        $session->open(); // открытие сессии для работы с ней
//      $session->remove('cart');
        $cart = new Cart();
        $cart->addToCart($good);
        return $this->renderPartial('cart', compact('good', 'session'));
    }

}