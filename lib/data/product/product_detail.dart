import 'package:ecommerceapp/data/model/category_model.dart';
import 'package:ecommerceapp/data/model/product_model.dart';

List<Product> wishListItems = [];

List<Product> addCartItems = [];

List<Product> electronic = [
  {
    'name': 'Smart TV',
    'price': 500,
    'description':
        '55-inch 4K UHD Smart TV\nEnjoy crystal-clear visuals and streaming.',
    "image": "asset/images/smart_tv.png"
  },
  {
    'name': 'Laptop',
    'price': 850,
    'description':
        'Core i5, 8GB RAM, 256GB SSD\nIdeal for work, study, and entertainment.',
    "image": "asset/images/laptop.png"
  },
  {
    'name': 'Bluetooth Speaker',
    'price': 120,
    'description':
        'Portable with powerful bass\nClear sound with deep bass, easy to carry.',
    "image": "asset/images/speaker.png"
  },
  {
    'name': 'Smart Watch',
    'price': 150,
    'description':
        'Tracks fitness and notifications\nStay connected and monitor your health.',
    "image": "asset/images/smart_watch.png"
  },
  {
    'name': 'Headphones',
    'price': 80,
    'description':
        'Wireless, noise-cancelling\nEnjoy music without distractions.',
    "image": "asset/images/headphones.webp"
  },
  {
    'name': 'Gaming Console',
    'price': 400,
    'description':
        'Supports 4K gaming\nPlay your favorite games in high resolution.',
    "image": "asset/images/ps4.webp"
  },
].map((item) => Product.fromMap(item)).toList();

List<Product> accessories = [
  {
    'name': 'Wristwatch',
    'price': 70,
    'description':
        'Classic analog design\nStylish timepiece for every occasion.',
    "image": "asset/images/watch.png"
  },
  {
    'name': 'Backpack',
    'price': 50,
    'description':
        'Water-resistant and spacious\nStore your essentials safely and conveniently.',
    "image": "asset/images/bag.png"
  },
  {
    'name': 'Wallet',
    'price': 30,
    'description':
        'Leather, slim design\nSleek, practical wallet for everyday use.',
    "image": "asset/images/valed.webp"
  },
  {
    'name': 'Belt',
    'price': 20,
    'description': 'Adjustable, durable\nPerfect fit, designed to last.',
    "image": "asset/images/balt.webp"
  },
  {
    'name': 'Cap',
    'price': 10,
    'description':
        'Adjustable, breathable\nComfortable and stylish for sunny days.',
    "image": "asset/images/cap.png"
  },
  {
    'name': 'Gloves',
    'price': 18,
    'description':
        'Warm and touchscreen compatible\nKeep hands warm without losing touch.',
    "image": "asset/images/hand_gloves.png"
  },
].map((item) => Product.fromMap(item)).toList();

List<Product> fashion = [
  {
    'name': 'T-Shirt',
    'price': 15,
    'description':
        'Cotton, breathable fabric\nComfortable and casual for all-day wear.',
    "image": "asset/images/shirt.png"
  },
  {
    'name': 'Jeans',
    'price': 40,
    'description':
        'Slim-fit, durable material\nA stylish wardrobe essential for every look.',
    "image": "asset/images/jeans.png"
  },
  {
    'name': 'Jacket',
    'price': 60,
    'description':
        'Waterproof, stylish design\nStay dry and fashionable in any weather.',
    "image": "asset/images/jaket.png"
  },
  {
    'name': 'Sneakers',
    'price': 50,
    'description':
        'Comfortable for daily wear\nPerfect for everyday adventures and comfort.',
    "image": "asset/images/shoes.webp"
  },
  {
    'name': 'Dress',
    'price': 80,
    'description': 'Elegant evening wear\nA chic dress for special occasions.',
    "image": "asset/images/dress.png"
  },
  {
    'name': 'Hoodie',
    'price': 35,
    'description': 'Warm and cozy\nA comfortable layer for chilly days.',
    "image": "asset/images/hoddie.png"
  },
].map((item) => Product.fromMap(item)).toList();

List<Product> phone = [
  {
    'name': 'iPhone 14',
    'price': 999,
    'description':
        '128GB, A15 Bionic chip\nPowerful performance and smooth experience.',
    "image": "asset/images/iphone.png"
  },
  {
    'name': 'Samsung Galaxy S23',
    'price': 899,
    'description': 'AMOLED display, 256GB\nStunning visuals and ample storage.',
    "image": "asset/images/galaxys23.webp"
  },
  {
    'name': 'OnePlus 11',
    'price': 699,
    'description':
        'Snapdragon 8 Gen 2, 12GB RAM\nHigh performance for gaming and multitasking.',
    "image": "asset/images/oneplus-11.webp"
  },
  {
    'name': 'Google Pixel 8',
    'price': 799,
    'description':
        '128GB, excellent camera\nCapture stunning photos with ease.',
    "image": "asset/images/GooglePixel8.png"
  },
  {
    'name': 'Redmi Note 12',
    'price': 250,
    'description':
        'Affordable, long battery life\nBudget-friendly with lasting performance.',
    "image": "asset/images/redmi.png"
  },
  {
    'name': 'Realme GT Neo 5',
    'price': 300,
    'description':
        'Flagship specs at budget price\nPerformance-packed, value-for-money smartphone.',
    "image": "asset/images/realmegtneo.webp"
  },
].map((item) => Product.fromMap(item)).toList();

List<Product> sports = [
  {
    'name': 'Football',
    'price': 25,
    'description':
        'Official size and weight\nPerfect for serious play and training.',
    "image": "asset/images/footballs.png"
  },
  {
    'name': 'Cricket Bat',
    'price': 50,
    'description':
        'Made of Kashmir willow\nLightweight and perfect for cricket enthusiasts.',
    "image": "asset/images/bat.png"
  },
  {
    'name': 'Basketball',
    'price': 30,
    'description':
        'Indoor/outdoor use\nDurable ball for high-performance play.',
    "image": "asset/images/backet_ball.png"
  },
  {
    'name': 'Running Shoes',
    'price': 80,
    'description':
        'Comfortable and durable\nBuilt for long-lasting comfort during runs.',
    "image": "asset/images/sports_shoes.png"
  },
].map((item) => Product.fromMap(item)).toList();

List<Product> allProduct = [
  ...electronic,
  ...phone,
  ...sports,
  ...fashion,
  ...accessories
];

List<Category> categories = [
  {
    "image": "asset/images/iphone.png",
    "title": "Phones",
    "products": [
      {
        'name': 'iPhone 14',
        'price': 999,
        'description':
            '128GB, A15 Bionic chip\nPowerful performance and smooth experience.',
        "image": "asset/images/iphone.png"
      },
      {
        'name': 'Samsung Galaxy S23',
        'price': 899,
        'description':
            'AMOLED display, 256GB\nStunning visuals and ample storage.',
        "image": "asset/images/galaxys23.webp"
      },
      {
        'name': 'OnePlus 11',
        'price': 699,
        'description':
            'Snapdragon 8 Gen 2, 12GB RAM\nHigh performance for gaming and multitasking.',
        "image": "asset/images/oneplus-11.webp"
      },
      {
        'name': 'Google Pixel 8',
        'price': 799,
        'description':
            '128GB, excellent camera\nCapture stunning photos with ease.',
        "image": "asset/images/GooglePixel8.png"
      },
      {
        'name': 'Redmi Note 12',
        'price': 250,
        'description':
            'Affordable, long battery life\nBudget-friendly with lasting performance.',
        "image": "asset/images/redmi.png"
      },
      {
        'name': 'Realme GT Neo 5',
        'price': 300,
        'description':
            'Flagship specs at budget price\nPerformance-packed, value-for-money smartphone.',
        "image": "asset/images/realmegtneo.webp"
      },
    ]
  },
  {
    "image": "asset/images/bag.png",
    "title": "Accessories",
    "products": [
      {
        'name': 'Wristwatch',
        'price': 70,
        'description':
            'Classic analog design\nStylish timepiece for every occasion.',
        "image": "asset/images/watch.png"
      },
      {
        'name': 'Backpack',
        'price': 50,
        'description':
            'Water-resistant and spacious\nStore your essentials safely and conveniently.',
        "image": "asset/images/bag.png"
      },
      {
        'name': 'Wallet',
        'price': 30,
        'description':
            'Leather, slim design\nSleek, practical wallet for everyday use.',
        "image": "asset/images/valed.webp"
      },
      {
        'name': 'Belt',
        'price': 20,
        'description': 'Adjustable, durable\nPerfect fit, designed to last.',
        "image": "asset/images/balt.webp"
      },
      {
        'name': 'Cap',
        'price': 10,
        'description':
            'Adjustable, breathable\nComfortable and stylish for sunny days.',
        "image": "asset/images/cap.png"
      },
      {
        'name': 'Gloves',
        'price': 18,
        'description':
            'Warm and touchscreen compatible\nKeep hands warm without losing touch.',
        "image": "asset/images/hand_gloves.png"
      },
    ]
  },
  {
    "image": "asset/images/shirt.png",
    "title": "Fashion",
    "products": [
      {
        'name': 'T-Shirt',
        'price': 15,
        'description':
            'Cotton, breathable fabric\nComfortable and casual for all-day wear.',
        "image": "asset/images/shirt.png"
      },
      {
        'name': 'Jeans',
        'price': 40,
        'description':
            'Slim-fit, durable material\nA stylish wardrobe essential for every look.',
        "image": "asset/images/jeans.png"
      },
      {
        'name': 'Jacket',
        'price': 60,
        'description':
            'Waterproof, stylish design\nStay dry and fashionable in any weather.',
        "image": "asset/images/jaket.png"
      },
      {
        'name': 'Sneakers',
        'price': 50,
        'description':
            'Comfortable for daily wear\nPerfect for everyday adventures and comfort.',
        "image": "asset/images/shoes.webp"
      },
      {
        'name': 'Dress',
        'price': 80,
        'description':
            'Elegant evening wear\nA chic dress for special occasions.',
        "image": "asset/images/dress.png"
      },
      {
        'name': 'Hoodie',
        'price': 35,
        'description': 'Warm and cozy\nA comfortable layer for chilly days.',
        "image": "asset/images/hoddie.png"
      },
    ]
  },
  {
    "image": "asset/images/smart_tv.png",
    "title": "Electronics",
    "products": [
      {
        'name': 'Smart TV',
        'price': 500,
        'description':
            '55-inch 4K UHD Smart TV\nEnjoy crystal-clear visuals and streaming.',
        "image": "asset/images/smart_tv.png"
      },
      {
        'name': 'Laptop',
        'price': 850,
        'description':
            'Core i5, 8GB RAM, 256GB SSD\nIdeal for work, study, and entertainment.',
        "image": "asset/images/laptop.png"
      },
      {
        'name': 'Bluetooth Speaker',
        'price': 120,
        'description':
            'Portable with powerful bass\nClear sound with deep bass, easy to carry.',
        "image": "asset/images/speaker.png"
      },
      {
        'name': 'Smart Watch',
        'price': 150,
        'description':
            'Tracks fitness and notifications\nStay connected and monitor your health.',
        "image": "asset/images/smart_watch.png"
      },
      {
        'name': 'Headphones',
        'price': 80,
        'description':
            'Wireless, noise-cancelling\nEnjoy music without distractions.',
        "image": "asset/images/headphones.webp"
      },
      {
        'name': 'Gaming Console',
        'price': 400,
        'description':
            'Supports 4K gaming\nPlay your favorite games in high resolution.',
        "image": "asset/images/ps4.webp"
      },
    ]
  },
  {
    "image": "asset/images/footballs.png",
    "title": "Sports",
    "products": [
      {
        'name': 'Football',
        'price': 25,
        'description':
            'Official size and weight\nPerfect for serious play and training.',
        "image": "asset/images/footballs.png"
      },
      {
        'name': 'Cricket Bat',
        'price': 50,
        'description':
            'Made of Kashmir willow\nLightweight and perfect for cricket enthusiasts.',
        "image": "asset/images/bat.png"
      },
      {
        'name': 'Basketball',
        'price': 30,
        'description':
            'Indoor/outdoor use\nDurable ball for high-performance play.',
        "image": "asset/images/backet_ball.png"
      },
      {
        'name': 'Running Shoes',
        'price': 80,
        'description':
            'Comfortable and durable\nBuilt for long-lasting comfort during runs.',
        "image": "asset/images/sports_shoes.png"
      },
    ]
  },
].map((item) => Category.fromMap(item)).toList();
