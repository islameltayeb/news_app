import 'package:flutter/material.dart';
import 'package:news_app/models/taps_response.dart';
import 'package:news_app/ui/screens/home/Fragment/News/tab_details.dart';
import 'package:news_app/ui/screens/home/Fragment/News/tab_wediget.dart';

class TabsList extends StatefulWidget {
  List<MyTab> tabs;

  TabsList(this.tabs);

  @override
  State<TabsList> createState() => _TabsListState();
}

class _TabsListState extends State<TabsList> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.tabs.length,
        child: Column(
          children: [
            TabBar(
                onTap: (index) {
                  currentIndex = index;
                  setState(() {});
                },
                isScrollable: true,
                indicatorColor: Colors.transparent,
                tabs: widget.tabs.map((tab) {
                  return TabWidget(
                      tab, currentIndex == widget.tabs.indexOf(tab));
                }).toList()),
            Expanded(
              child: TabBarView(
                  children:widget.tabs.map((tab){
                    return TabDetails(tab);
                  }).toList() ),
            ),
          ],
        ));
  }
}
