import 'package:tokoku/models/rating_model.dart';

class ProdukModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;

ProdukModel({
  required this.id,
  required this.title,
  required this.price,
  required this.description,
  required this.category,
  required this.image,
  required this.rating,

  });

  factory ProdukModel.fromJson(Map<String, dynamic> json) {
    return ProdukModel(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num). toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: RatingModel.fromJson(json['rating']),
    );
  }
}