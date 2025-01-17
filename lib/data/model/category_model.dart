import 'package:ecommerceapp/data/model/product_model.dart';

class Category {
  final String image;
  final String title;
  final List<Product> products;

  Category({
    required this.image,
    required this.title,
    required this.products,
  });

  // Factory constructor to create a Category instance from a map
  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      image: map['image'],
      title: map['title'],
      products: (map['products'] as List<dynamic>)
          .map((product) => Product.fromMap(product))
          .toList(),
    );
  }

  // Convert Category instance to a map
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'title': title,
      'products': products.map((product) => product.toMap()).toList(),
    };
  }
}
