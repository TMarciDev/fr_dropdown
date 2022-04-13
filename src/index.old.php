<?php
    // connect: port, username, user_passwd, db name
    $connection = mysqli_connect('localhost', 'fr_dropdown', 'test1234', 'fr_dropdown');

    // check connection success
    if(!$connection) {
        echo 'ERROR: CONNECTION REFUSED: ' . mysqli_connect_error();
    }

    // query
    $sql_category = 'SELECT *, action FROM main_menu';

    // execute query
    $categories_result = mysqli_query($connection, $sql_category);

    // extract the rows to an array. It is not an array yet
    $categories = mysqli_fetch_all($categories_result, MYSQLI_ASSOC);

    //removing the query result because we saved it in an array
    mysqli_free_result($categories_result);
    
    //closing the connection after fetch
    mysqli_close($connection);

    // check if result is correctly fetched and it is an array
    //print_r($items);

?>

<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="index.css">
</head>
<body>
    <nav class="all-dropdown-container">
    <?php foreach($categories as $cat) { ?>
    <div class="row-container">
        
        <div class="category">
            <?php if(strlen(htmlspecialchars($cat['action'])) > 0):?>
                <a class="category-label cat-label-action" href="<?php echo htmlspecialchars($cat['action']);?>.php">
            <?php else: ?>
                <a class="category-label cat-label-action">
            <?php endif ?>

                <?php if(strlen(htmlspecialchars($cat['icon_img'])) > 0) { ?>
                    <button class="cat-label-action"><img class="cat-label-action" src="../images/<?php echo htmlspecialchars($cat['icon_img']); ?>" /></button>
                <?php } ?>
                <button class="label-text cat-label-action"><?php echo htmlspecialchars($cat['category']); ?></button>
            </a>
            <button class="list-opener list-opener-button"><img class="list-opener list-opener-image" src="images/items.png"/></button>
        </div>
        <div class="subcategory-container invisible">
            <?php foreach($items as $item) { ?>
            <?php if(strcmp(strtolower(htmlspecialchars($item['category'])),
                    strtolower(htmlspecialchars($cat['category']))) == 0) { ?>
                <div class="subcategory subcat-item">
                    <div class="subcat-item">
                        <?php echo htmlspecialchars($item['label']); ?>
                    </div>
                    <?php if(strlen(htmlspecialchars($item['icon_img'])) > 0) { ?>
                        <img class="subcat-item" src="images/<?php echo htmlspecialchars($item['icon_img']); ?>" />
                    <?php } ?>
                </div>
            <?php } ?>
            <?php } ?>
        </div>
    </div>
    <div class= "vertical-divider"></div>
    <?php } ?>
    </nav>
    <section class="page-content">
        <h1>Lorem ipsum dolor sit amet</h1>
        <p>
        Fusce malesuada nibh in neque tristique venenatis. Cras tincidunt nisi nibh, hendrerit ultricies nunc euismod vel. Morbi malesuada felis at lacus pretium, quis pulvinar nibh pulvinar. Ut eleifend, elit a auctor elementum, magna massa eleifend risus, nec tempus quam metus cursus lorem. Vestibulum aliquet tortor suscipit, egestas lorem id, congue sem. Cras sit amet varius erat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Duis odio lectus, auctor sit amet tincidunt vel, iaculis eu ex. Integer a semper arcu.
        </p>
        <h3>Consectetur adipiscing elit.</h3>
        <p>   
        Pellentesque sagittis egestas ipsum, a gravida nibh rutrum ut. Donec vel tellus massa. Nulla facilisi. Nulla scelerisque dolor a libero tristique, et accumsan sem maximus. In aliquam magna nec vestibulum sagittis. Fusce a consectetur nunc, sed varius felis. Mauris ornare pharetra accumsan. Vivamus auctor malesuada est, nec hendrerit ex varius et. Duis ac luctus nulla. Pellentesque feugiat, arcu vitae molestie accumsan, mi metus fringilla lorem, vitae placerat neque lorem at mauris. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec gravida venenatis tempor. Integer eget ligula tempor, accumsan purus venenatis, molestie odio.
        </p>
        <h3>Lorem ipsum</h3>
        <p>
        In pulvinar interdum ante. Proin ipsum neque, finibus vel blandit eget, pretium a justo. Quisque ac massa at libero blandit placerat vitae quis massa. Mauris facilisis consectetur libero, vel posuere lorem faucibus sed. Ut pellentesque varius diam id eleifend. Nunc vel diam sollicitudin, dictum elit in, rutrum elit. Sed ac purus eu massa elementum eleifend. Nam hendrerit purus a porttitor maximus.
        </p>
        <h3>Ddipiscing elit.</h3>
        <p>
        <h4>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</h4>
        <p>
        Donec quis viverra massa. Fusce ut elit ut magna mollis iaculis posuere ut ligula. Phasellus risus odio, tristique ac laoreet a, mollis a lacus. Proin eget suscipit magna. Phasellus id sapien luctus, facilisis dolor ac, posuere justo. Mauris non nisl vestibulum, suscipit nibh nec, dapibus nisl. Donec aliquam pellentesque eleifend. Donec molestie porta dolor eget consectetur. Donec a dignissim est. Nunc placerat porttitor arcu vel tincidunt.
        </p>
    </section>
</body>
<script src="index.js"></script>
</html>