class Product {
  final String name;
  final int price;
  final String description;
  final String image;
  int quantity;

  Product({
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.quantity,
  });

  // Factory method to create a Product from a Map
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] as String,
      price: map['price'] as int,
      description: map['description'] as String,
      image: map['image'] as String,
      quantity: map['quantity'] as int,
    );
  }

  // Convert a Product instance to a Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'description': description,
      'image': image,
      'quantity': quantity,
    };
  }
}
