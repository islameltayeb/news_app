import 'package:flutter/material.dart';
import 'package:news_app/MyTheme/theme_data.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/ui/screens/home/Fragment/News/news_details.dart';

class NewsWidget extends StatelessWidget {
  Article article;

  NewsWidget(this.article);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context,NewsDetails.routName,arguments: article );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                ),
                child: Image.network(
                  article.urlToImage ?? "",
                )),
            SizedBox(
              height: 10,
            ),
            Text(
              article.author ?? "",
              style: MyThemeData.themeData.textTheme.headline2,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              article.description ?? "",
              style: MyThemeData.themeData.textTheme.headline3,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              article.publishedAt ?? "",
              style: MyThemeData.themeData.textTheme.headline4,
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }
}
