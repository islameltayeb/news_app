import 'package:flutter/material.dart';
import 'package:news_app/MyTheme/theme_data.dart';
import 'package:news_app/models/category_dm.dart';
import 'package:news_app/ui/screens/home/Fragment/Categories/widget_category.dart';

class CategoriesFragment extends StatelessWidget {
  Function onCategoryClick;
  CategoriesFragment(this.onCategoryClick);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            """Pick your category \n of interest""",
            style: MyThemeData.themeData.textTheme.bodyText2,
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      onCategoryClick(CategoryDm.categories[index]);
                    },
                    child: WidgetCategory(CategoryDm.categories[index]));
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 18, mainAxisSpacing: 18),
            ),
          )
        ],
      ),
    );
  }
}
