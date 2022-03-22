import 'package:flutter/material.dart';

class Product {
  static int currentID = 0;
  String image;
  String productName;
  int productId = currentID;

  bool fav = false;
  Product({
    required this.image,
    required this.productName,
  }) {
    currentID = currentID + 1;
  }
}

class DummyData {
  List<Product> product = [
    Product(
      image: "assets/1.jpg",
      productName: "Groowii High Neck Pullover Top For Unisex",
    ),
    Product(
      image: "assets/2.jpg",
      productName: "Clear Magnetic Case Designed for iPhone 13 Pro Max",
    ),
    Product(
      image: "assets/3.jpg",
      productName: 'Manager Medical Office Chair - Black Mesh',
    ),
    Product(
      image: "assets/4.jpg",
      productName: 'SKMEI 1025 Black Waterproof Mens Digital Watch',
    ),
  ];
}
