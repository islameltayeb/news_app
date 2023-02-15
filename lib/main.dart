import 'package:flutter/material.dart';
import 'package:news_app/ui/screens/home/Fragment/News/news_details.dart';
import 'package:news_app/ui/screens/home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "News App",
      routes: {
        Home.routeName: (_) => Home(),
        NewsDetails.routName:(_)=>NewsDetails(),
      },
      initialRoute: Home.routeName,
    );
  }
}
