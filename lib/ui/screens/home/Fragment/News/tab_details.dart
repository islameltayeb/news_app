import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/models/taps_response.dart';
import 'package:news_app/ui/screens/home/Fragment/News/news_widget.dart';

class TabDetails extends StatefulWidget {
  MyTab tab;

  TabDetails(this.tab);

  @override
  State<TabDetails> createState() => _TabDetailsState();
}

class _TabDetailsState extends State<TabDetails> {
  List<Article> newsList = [];
  final scrollController = ScrollController();
  bool showLoadNextPage = false;
  int pageNumber = 1;

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          showLoadNextPage = true;
          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoadNextPage) {
      ApiManager.getNews(tabId: widget.tab.id ?? "", page: ++pageNumber)
          .then((NewsResponse) {
        newsList.addAll(NewsResponse.articles ?? []);
        showLoadNextPage = false;
        setState(() {});
      });
    }
    return FutureBuilder<NewsResponse>(
        future: ApiManager.getNews(tabId: widget.tab.id ?? ""),
        builder: (context, snapShot) {
          if (snapShot.hasError) {
            return Text(snapShot.error.toString());
          } else if (snapShot.hasData) {
            if (newsList.isEmpty) {
              newsList= snapShot.data?.articles ?? [];
            } else if (snapShot.data?.articles?[0].title == newsList[0].title) {
              scrollController.jumpTo(0);
              newsList = snapShot.data?.articles ?? [];
            }

            return ListView.builder(
                controller: scrollController,
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  return NewsWidget(newsList[index]);
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
