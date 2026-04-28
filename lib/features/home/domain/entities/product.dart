class Product {
  final String id;
  final String title;
  final String price;
  final String description;
  final String imageUrl;
  final String category;
  final String condition;
  final String location;
  final String views;
  final String messages;
  final Seller seller;
  final bool isLiked;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.condition,
    required this.location,
    required this.views,
    required this.messages,
    required this.seller,
    this.isLiked = false,
  });
}

class Seller {
  final String name;
  final String avatarUrl;
  final String major;
  final String rating;
  final bool isVerified;

  Seller({
    required this.name,
    required this.avatarUrl,
    required this.major,
    required this.rating,
    this.isVerified = false,
  });
}
