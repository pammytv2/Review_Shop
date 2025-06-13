<!DOCTYPE html>
<html lang="th">

<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="{{ url('frontend/css/shop.css') }}" />
    <link rel="stylesheet" href="{{ url('frontend/css/review-styles.css') }}" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>สินค้าคุณภาพ - Product Showcase</title>
</head>
<body>
    <div class="container">
    <div class="header">
            <h1>ร้านสินค้าคุณภาพ</h1>
        </div>
        <div class="product-grid">
            <div id="product-list"></div>
        </div>
        <script src="{{ url('frontend/js/shop.js') }}"></script>
</body>
</html>
