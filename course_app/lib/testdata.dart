import 'package:flutter/material.dart';

class Product {
  static int currentID = 0;
  String image;
  String productName;
  int productId = currentID;

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
      image: "testimage.png",
      productName: "Groowii High Neck Pullover Top For Unisex",
    ),
    Product(
      image: "testimage.png",
      productName: "Clear Magnetic Case Designed for iPhone 13 Pro Max",
    ),
    Product(
      image: "testimage.png",
      productName: 'Manager Medical Office Chair - Black Mesh',
    ),
    Product(
      image: "testimage.png",
      productName: 'SKMEI 1025 Black Waterproof Mens Digital Watch',
    ),
  ];
}
