import 'package:ecommerceapp/data/model/category_model.dart';
import 'package:ecommerceapp/data/model/product_model.dart';

List<Product> electronic = [
  {
    'name': 'Smart TV',
    'price': 500,
    'description':
        '55-inch 4K UHD Smart TV Enjoy crystal-clear visuals and streaming.',
    "image": "asset/images/smart_tv.png",
    'quantity': 4
  },
  {
    'name': 'Laptop',
    'price': 850,
    'description':
        'Core i5, 8GB RAM, 256GB SSD Ideal for work, study, and entertainment.',
    "image": "asset/images/laptop.png",
    'quantity': 4
  },
  {
    'name': 'Bluetooth Speaker',
    'price': 120,
    'description':
        'Portable with powerful bass Clear sound with deep bass, easy to carry.',
    "image": "asset/images/speaker.png",
    'quantity': 4
  },
  {
    'name': 'Smart Watch',
    'price': 150,
    'description':
        'Tracks fitness and notifications Stay connected and monitor your health.',
    "image": "asset/images/smart_watch.png",
    'quantity': 4
  },
  {
    'name': 'Headphones',
    'price': 80,
    'description':
        'Wireless, noise-cancelling Enjoy music without distractions.',
    "image": "asset/images/headphones.webp",
    'quantity': 4
  },
  {
    'name': 'Gaming Console',
    'price': 400,
    'description':
        'Supports 4K gaming Play your favorite games in high resolution.',
    "image": "asset/images/ps4.webp",
    'quantity': 4
  },
].map((item) => Product.fromMap(item)).toList();

List<Product> accessories = [
  {
    'name': 'Wristwatch',
    'price': 70,
    'description':
        'Classic analog design Stylish timepiece for every occasion.',
    "image": "asset/images/watch.png",
    'quantity': 4
  },
  {
    'name': 'Backpack',
    'price': 50,
    'description':
        'Water-resistant and spacious Store your essentials safely and conveniently.',
    "image": "asset/images/bag.png",
    'quantity': 4
  },
  {
    'name': 'Wallet',
    'price': 30,
    'description':
        'Leather, slim design Sleek, practical wallet for everyday use.',
    "image": "asset/images/valed.webp",
    'quantity': 4
  },
  {
    'name': 'Belt',
    'price': 20,
    'description': 'Adjustable, durable Perfect fit, designed to last.',
    "image": "asset/images/balt.webp",
    'quantity': 4
  },
  {
    'name': 'Cap',
    'price': 10,
    'description':
        'Adjustable, breathable Comfortable and stylish for sunny days.',
    "image": "asset/images/cap.png",
    'quantity': 4
  },
  {
    'name': 'Gloves',
    'price': 18,
    'description':
        'Warm and touchscreen compatible Keep hands warm without losing touch.',
    "image": "asset/images/hand_gloves.png",
    'quantity': 4
  },
].map((item) => Product.fromMap(item)).toList();

List<Product> fashion = [
  {
    'name': 'T-Shirt',
    'price': 15,
    'description':
        'Cotton, breathable fabric Comfortable and casual for all-day wear.',
    "image": "asset/images/shirt.png",
    'quantity': 4
  },
  {
    'name': 'Jeans',
    'price': 40,
    'description':
        'Slim-fit, durable material A stylish wardrobe essential for every look.',
    "image": "asset/images/jeans.png",
    'quantity': 4
  },
  {
    'name': 'Jacket',
    'price': 60,
    'description':
        'Waterproof, stylish design Stay dry and fashionable in any weather.',
    "image": "asset/images/jaket.png",
    'quantity': 4
  },
  {
    'name': 'Sneakers',
    'price': 50,
    'description':
        'Comfortable for daily wear Perfect for everyday adventures and comfort.',
    "image": "asset/images/shoes.webp",
    'quantity': 4
  },
  {
    'name': 'Dress',
    'price': 80,
    'description': 'Elegant evening wear A chic dress for special occasions.',
    "image": "asset/images/dress.png",
    'quantity': 4
  },
  {
    'name': 'Hoodie',
    'price': 35,
    'description': 'Warm and cozy A comfortable layer for chilly days.',
    "image": "asset/images/hoddie.png",
    'quantity': 4
  },
].map((item) => Product.fromMap(item)).toList();

List<Product> phone = [
  {
    'name': 'iPhone 14',
    'price': 999,
    'description':
        '128GB, A15 Bionic chip Powerful performance and smooth experience.',
    "image": "asset/images/iphone.png",
    'quantity': 4
  },
  {
    'name': 'Samsung Galaxy S23',
    'price': 899,
    'description': 'AMOLED display, 256GB Stunning visuals and ample storage.',
    "image": "asset/images/galaxys23.webp",
    'quantity': 4
  },
  {
    'name': 'OnePlus 11',
    'price': 699,
    'description':
        'Snapdragon 8 Gen 2, 12GB RAM High performance for gaming and multitasking.',
    "image": "asset/images/oneplus-11.webp",
    'quantity': 4
  },
  {
    'name': 'Google Pixel 8',
    'price': 799,
    'description': '128GB, excellent camera Capture stunning photos with ease.',
    "image": "asset/images/GooglePixel8.png",
    'quantity': 4
  },
  {
    'name': 'Redmi Note 12',
    'price': 250,
    'description':
        'Affordable, long battery life Budget-friendly with lasting performance.',
    "image": "asset/images/redmi.png",
    'quantity': 4
  },
  {
    'name': 'Realme GT Neo 5',
    'price': 300,
    'description':
        'Flagship specs at budget price Performance-packed, value-for-money smartphone.',
    "image": "asset/images/realmegtneo.webp",
    'quantity': 4
  },
].map((item) => Product.fromMap(item)).toList();

List<Product> sports = [
  {
    'name': 'Football',
    'price': 25,
    'description':
        'Official size and weight Perfect for serious play and training.',
    "image": "asset/images/footballs.png",
    'quantity': 4
  },
  {
    'name': 'Cricket Bat',
    'price': 50,
    'description':
        'Made of Kashmir willow Lightweight and perfect for cricket enthusiasts.',
    "image": "asset/images/bat.png",
    'quantity': 4
  },
  {
    'name': 'Basketball',
    'price': 30,
    'description': 'Indoor/outdoor use Durable ball for high-performance play.',
    "image": "asset/images/backet_ball.png",
    'quantity': 4
  },
  {
    'name': 'Running Shoes',
    'price': 80,
    'description':
        'Comfortable and durable Built for long-lasting comfort during runs.',
    "image": "asset/images/sports_shoes.png",
    'quantity': 4
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
            '128GB, A15 Bionic chip Powerful performance and smooth experience.',
        "image": "asset/images/iphone.png",
        'quantity': 4
      },
      {
        'name': 'Samsung Galaxy S23',
        'price': 899,
        'description':
            'AMOLED display, 256GB Stunning visuals and ample storage.',
        "image": "asset/images/galaxys23.webp",
        'quantity': 4
      },
      {
        'name': 'OnePlus 11',
        'price': 699,
        'description':
            'Snapdragon 8 Gen 2, 12GB RAM High performance for gaming and multitasking.',
        "image": "asset/images/oneplus-11.webp",
        'quantity': 4
      },
      {
        'name': 'Google Pixel 8',
        'price': 799,
        'description':
            '128GB, excellent camera Capture stunning photos with ease.',
        "image": "asset/images/GooglePixel8.png",
        'quantity': 4
      },
      {
        'name': 'Redmi Note 12',
        'price': 250,
        'description':
            'Affordable, long battery life Budget-friendly with lasting performance.',
        "image": "asset/images/redmi.png",
        'quantity': 4
      },
      {
        'name': 'Realme GT Neo 5',
        'price': 300,
        'description':
            'Flagship specs at budget price Performance-packed, value-for-money smartphone.',
        "image": "asset/images/realmegtneo.webp",
        'quantity': 4
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
            'Classic analog design Stylish timepiece for every occasion.',
        "image": "asset/images/watch.png",
        'quantity': 4
      },
      {
        'name': 'Backpack',
        'price': 50,
        'description':
            'Water-resistant and spacious Store your essentials safely and conveniently.',
        "image": "asset/images/bag.png",
        'quantity': 4
      },
      {
        'name': 'Wallet',
        'price': 30,
        'description':
            'Leather, slim design Sleek, practical wallet for everyday use.',
        "image": "asset/images/valed.webp",
        'quantity': 4
      },
      {
        'name': 'Belt',
        'price': 20,
        'description': 'Adjustable, durable Perfect fit, designed to last.',
        "image": "asset/images/balt.webp",
        'quantity': 4
      },
      {
        'name': 'Cap',
        'price': 10,
        'description':
            'Adjustable, breathable Comfortable and stylish for sunny days.',
        "image": "asset/images/cap.png",
        'quantity': 4
      },
      {
        'name': 'Gloves',
        'price': 18,
        'description':
            'Warm and touchscreen compatible Keep hands warm without losing touch.',
        "image": "asset/images/hand_gloves.png",
        'quantity': 4
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
            'Cotton, breathable fabric Comfortable and casual for all-day wear.',
        "image": "asset/images/shirt.png",
        'quantity': 4
      },
      {
        'name': 'Jeans',
        'price': 40,
        'description':
            'Slim-fit, durable material A stylish wardrobe essential for every look.',
        "image": "asset/images/jeans.png",
        'quantity': 4
      },
      {
        'name': 'Jacket',
        'price': 60,
        'description':
            'Waterproof, stylish design Stay dry and fashionable in any weather.',
        "image": "asset/images/jaket.png",
        'quantity': 4
      },
      {
        'name': 'Sneakers',
        'price': 50,
        'description':
            'Comfortable for daily wear Perfect for everyday adventures and comfort.',
        "image": "asset/images/shoes.webp",
        'quantity': 4
      },
      {
        'name': 'Dress',
        'price': 80,
        'description':
            'Elegant evening wear A chic dress for special occasions.',
        "image": "asset/images/dress.png",
        'quantity': 4
      },
      {
        'name': 'Hoodie',
        'price': 35,
        'description': 'Warm and cozy A comfortable layer for chilly days.',
        "image": "asset/images/hoddie.png",
        'quantity': 4
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
            '55-inch 4K UHD Smart TV Enjoy crystal-clear visuals and streaming.',
        "image": "asset/images/smart_tv.png",
        'quantity': 4
      },
      {
        'name': 'Laptop',
        'price': 850,
        'description':
            'Core i5, 8GB RAM, 256GB SSD Ideal for work, study, and entertainment.',
        "image": "asset/images/laptop.png",
        'quantity': 4
      },
      {
        'name': 'Bluetooth Speaker',
        'price': 120,
        'description':
            'Portable with powerful bass Clear sound with deep bass, easy to carry.',
        "image": "asset/images/speaker.png",
        'quantity': 4
      },
      {
        'name': 'Smart Watch',
        'price': 150,
        'description':
            'Tracks fitness and notifications Stay connected and monitor your health.',
        "image": "asset/images/smart_watch.png",
        'quantity': 4
      },
      {
        'name': 'Headphones',
        'price': 80,
        'description':
            'Wireless, noise-cancelling Enjoy music without distractions.',
        "image": "asset/images/headphones.webp",
        'quantity': 4
      },
      {
        'name': 'Gaming Console',
        'price': 400,
        'description':
            'Supports 4K gaming Play your favorite games in high resolution.',
        "image": "asset/images/ps4.webp",
        'quantity': 4
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
            'Official size and weight Perfect for serious play and training.',
        "image": "asset/images/footballs.png",
        'quantity': 4
      },
      {
        'name': 'Cricket Bat',
        'price': 50,
        'description':
            'Made of Kashmir willow Lightweight and perfect for cricket enthusiasts.',
        "image": "asset/images/bat.png",
        'quantity': 4
      },
      {
        'name': 'Basketball',
        'price': 30,
        'description':
            'Indoor/outdoor use Durable ball for high-performance play.',
        "image": "asset/images/backet_ball.png",
        'quantity': 4
      },
      {
        'name': 'Running Shoes',
        'price': 80,
        'description':
            'Comfortable and durable Built for long-lasting comfort during runs.',
        "image": "asset/images/sports_shoes.png",
        'quantity': 4
      },
    ]
  },
].map((item) => Category.fromMap(item)).toList();
