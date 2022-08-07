<h2>Оформление заказа</h2>

<?php use yii\widgets\ActiveForm; ?>

<?php $form = ActiveForm::begin() ?>

<?= $form->field($order, 'name') ?>
<?= $form->field($order, 'email') ?>
<?= $form->field($order, 'phone') ?>
<?= $form->field($order, 'address') ?>
<button class="btn btn-success">Оформить заказ</button>

<?php ActiveForm::end() ?>

