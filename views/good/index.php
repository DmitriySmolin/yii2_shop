<div class="container">
    <div class="row justify-content-md-center">

        <div class="col-8 justify-self-center">
            <h2>
                <div class="product-title"><?= $good['name'] ?></div>
            </h2>
            <div class="product">
                <div class="product-img">
                    <img src="/web/img/<?= $good['img'] ?>" alt="Филадельфия">
                </div>
                <div class="product-name"><?= $good['name'] ?></div>
                <div class="product-descr">Состав: <?= $good['composition'] ?></div>
                <div class="product-descr">Описание: <?= $good['descr'] ?>
                </div>
                <div class="product-price">Цена: <?= $good['price'] ?> рублей</div>
                <div class="product-buttons">
                    <a href="#" data-name="<?= $good['link_name'] ?>"
                       class="product-button__add btn btn-success">Заказать</a>
                </div>
            </div>
        </div>
    </div>
</div>
