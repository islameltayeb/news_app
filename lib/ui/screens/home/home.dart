import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/MyTheme/theme_data.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/models/category_dm.dart';
import 'package:news_app/models/taps_response.dart';
import 'package:news_app/ui/screens/home/Fragment/Categories/categories_fragment.dart';
import 'package:news_app/ui/screens/home/Fragment/News/news_fragment.dart';
import 'package:news_app/ui/screens/home/Fragment/News/tabs_list.dart';
import 'package:news_app/ui/screens/home/search/news_search.dart';

import 'Fragment/Settings/setting_fragment.dart';

class Home extends StatefulWidget {
  static String routeName = "home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Widget selectFragment;

  CategoryDm? selectedCategory;

  onCategoriesClick(CategoryDm newSelectedCategory) {
    setState(() {});
    selectedCategory = newSelectedCategory;

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectFragment = CategoriesFragment(onCategoriesClick);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News App",
          style: MyThemeData.themeData.textTheme.bodyText1,
        ),
        centerTitle: true,
        backgroundColor: MyThemeData.primaryColor,
        toolbarHeight: MediaQuery.of(context).size.height * .1,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
          right: Radius.circular(35),
          left: Radius.circular(35),
        )),
        actions: [
          IconButton(onPressed: (){
            showSearch(context: context, delegate: NewsSearch());
          }, icon: Icon(Icons.search))
        ],
      ),
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Center(
                  child: Text(
                "News App!",
                style: MyThemeData.themeData.textTheme.subtitle1,
              )),
              color: MyThemeData.primaryColor,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, right: 8, bottom: 8, top: 20),
              child: InkWell(
                onTap: () {
                  selectFragment = CategoriesFragment(onCategoriesClick);
                  selectedCategory = null;
                  Navigator.pop(context);
                  setState(() {});
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.list_outlined,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Category",
                      style: MyThemeData.themeData.textTheme.subtitle2,
                    )
                  ],
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    selectFragment = SettingFragment();
                    selectedCategory = null;
                    Navigator.pop(context);
                    setState(() {});
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Settings",
                        style: MyThemeData.themeData.textTheme.subtitle2,
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
      body: selectedCategory == null ? selectFragment : NewsFragment(selectedCategory!.id),
    );
  }
}
