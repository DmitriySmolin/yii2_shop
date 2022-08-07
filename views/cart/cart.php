<h2 style="...">Корзина</h2>
<?php if ($session['cart']) { ?>
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">Фото</th>
            <th scope="col">Наименование</th>
            <th scope="col">Количество</th>
            <th scope="col">Цена</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <?php foreach ($session['cart'] as $id => $good) { ?>
            <tr>
                <td style="..." width="150"><img src="/web/img/<?= $good['img'] ?>" alt="<?= $good['name'] ?>"></td>
                <td style="..."><?= $good['name'] ?></td>
                <td style="..."><?= $good['goodQuantity'] ?></td>
                <td style="..."><?= $good['price'] * $good['goodQuantity'] ?> рублей</td>
                <td class="delete" style="test-align:center;cursor:pointer;vertical-align: middle;color:red"
                    data-id="<?= $id ?>">
                    <span>&#10006;</span>
                </td>
            </tr>
        <?php } ?>
        <tr style="border-top: 4px solid black">
            <td colspan="4">Всего товаров</td>
            <td class="total-quantity"><?= $session['cart.totalQuantity'] ?></td>
        </tr>
        <tr>
            <td colspan="4">На сумму</td>
            <td style="font-weight: 700"><?= $session['cart.totalSum'] ?> рублей</td>
        </tr>
        </tbody>
    </table>
    <div class="modal-buttons" style="...">
        <button type="button" class="btn btn-danger" onclick="clearCart(event)">Очистить корзину</button>
        <button type="button" class="btn btn-secondary btn-close">Продолжить покупки</button>
        <button type="button" class="btn btn-success btn-next">Оформить заказ</button>
    </div>

<?php } else { ?>
    <h3>В вашей корзине ничено нет:(</h3>
    <button type="button" class="btn btn-secondary btn-close" style="width:200px">Начать покупки</button>

<?php } ?>