import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Projects {
  final int id;
  final String name;
  final String imagePath;
  final String category;
  final String description;
  final double price;
  late final bool isFavorit;

  Projects({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.category,
    required this.description,
    required this.price,
    required this.isFavorit,
  });
}

class Items {
  final int id;
  final String name;
  final String imagePath;
  final String description;
  final bool isFavorit;
  final bool cart;

  Items({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.description,
    required this.isFavorit,
    required this.cart,
  });
  void adding() {
    late Items productModel;
    List<Items> newitems = [];
    fechitemsdata() async {
      List<Items> newList = [];
      QuerySnapshot value =
          await FirebaseFirestore.instance.collection("cpp_projects").get();
      value.docs.forEach(
        (element) {
          productModel = Items(
              id: element.get('id'),
              imagePath: element.get('imagepath'),
              description: element.get('description'),
              isFavorit: element.get('wishlist'),
              cart: element.get('cart'),
              name: element.get('name'));
          newList.add(productModel);
        },
      );
    }
  }
}
