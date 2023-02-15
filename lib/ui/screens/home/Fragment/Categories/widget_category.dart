import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/category_dm.dart';

class WidgetCategory extends StatelessWidget {
  CategoryDm categoryDm;

  WidgetCategory(this.categoryDm);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft:
                categoryDm.isLiftSide ? Radius.circular(16) : Radius.zero,
            bottomRight:
                categoryDm.isLiftSide ? Radius.zero : Radius.circular(16)),
        color: categoryDm.backgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Image.asset(categoryDm.imagePath),
          Spacer(),
          Text(
            categoryDm.title,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
