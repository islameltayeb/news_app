import 'package:flutter/material.dart';
import 'package:news_app/MyTheme/theme_data.dart';
import 'package:news_app/models/taps_response.dart';

class TabWidget extends StatelessWidget {
  MyTab tab;
  bool isSelected;

  TabWidget(this.tab, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        border: Border.all(color: MyThemeData.primaryColor, width: 2),
        borderRadius: BorderRadius.circular(15),
        color: isSelected ? MyThemeData.primaryColor : Colors.transparent,
      ),
      child: Text(tab.name ?? "", style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: isSelected ? Colors.white : MyThemeData.primaryColor,
      ),),
    );
  }
}
