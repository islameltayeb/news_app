import 'package:flutter/cupertino.dart';

class CategoryDm {
  String id;
  String title;
  String imagePath;
  bool isLiftSide;
  Color backgroundColor;

  CategoryDm({required this.id,
    required this.title,
    required this.imagePath,
    required this.isLiftSide,
    required this.backgroundColor});

  static List<CategoryDm> categories = [
    CategoryDm(id: "sports",
        title: "sports",
        imagePath: "assets/ball.png",
        isLiftSide: true,
        backgroundColor: Color(0xffC91C22)),
    CategoryDm(id: "technology",
        title: "technology",
        imagePath: "assets/Politics.png",
        isLiftSide: false,
        backgroundColor: Color(0xffC91C22)),
    CategoryDm(id: "health",
        title: "health",
        imagePath: "assets/health.png",
        isLiftSide: true,
        backgroundColor: Color(0xffC91C22)),
    CategoryDm(id: "business",
        title: "business",
        imagePath: "assets/bussines.png",
        isLiftSide: false,
        backgroundColor: Color(0xffC91C22)),
    CategoryDm(id: "entertainment",
        title: "entertainment",
        imagePath: "assets/ball.png",
        isLiftSide: true,
        backgroundColor: Color(0xffC91C22)),
    CategoryDm(id: "science",
        title: "science",
        imagePath: "assets/science.png",
        isLiftSide: true,
        backgroundColor: Color(0xffC91C22)),

  ];
}
