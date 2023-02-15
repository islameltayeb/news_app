import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/models/news_response.dart';

import '../../../../../MyTheme/theme_data.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatelessWidget {
  static const String routName = 'newsdetails';

  String formatDateNews(Article article) {
    DateFormat input = DateFormat(article.publishedAt);
    DateFormat output = DateFormat('hh:mm a');

    DateTime inputDate = input.parse(article.publishedAt ?? "");
    String outputDate = output.format(inputDate);
    return outputDate;
  }



  @override
  Widget build(BuildContext context) {
    var article = ModalRoute.of(context)?.settings.arguments as Article;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News Title",
          style: MyThemeData.themeData.textTheme.bodyText1,
        ),
        centerTitle: true,
        backgroundColor: MyThemeData.primaryColor,
        toolbarHeight: MediaQuery.of(context).size.height * .1,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
          right: Radius.circular(35),
          left: Radius.circular(35),
        )),
      ),
      body: Container(
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
              formatDateNews(article),
              style: MyThemeData.themeData.textTheme.headline4,
              textAlign: TextAlign.right,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              article.content ?? "",
              style: MyThemeData.themeData.textTheme.headline3,
            ),
            InkWell(
              onTap: () => _launchURL(Uri.parse(article.url ?? "")),
              child: const Text(
                "View Full Article",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff42505C),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
_launchURL(Uri url) async {
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}