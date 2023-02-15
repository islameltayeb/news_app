import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/models/category_dm.dart';
import 'package:news_app/models/taps_response.dart';
import 'package:news_app/ui/screens/home/Fragment/News/tabs_list.dart';

class NewsFragment extends StatelessWidget {
String tab ;
NewsFragment(this.tab);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TabsResponse>(
      future: ApiManager.getTabs(tab),
      builder: (_, snapShot) {
        if (snapShot.hasError) {
          return Text(snapShot.error.toString());
        } else if (snapShot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          return TabsList(snapShot.data!.sources!);
        }
      },
    );
  }
}
