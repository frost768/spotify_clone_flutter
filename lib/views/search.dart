import 'package:flutter/material.dart';
import 'package:spotify_clone/components/searchbar_placeholder_sliver.dart';
import 'package:spotify_clone/views/views.dart';

class SearchView extends StatelessWidget {
  SearchView({Key? key}) : super(key: key);
  final dec =
      BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(5));
  final boxDecoration = BoxDecoration(
      gradient: RadialGradient(
    center: Alignment.topLeft,
    radius: 3,
    stops: [0, 0.3],
    colors: [Colors.white10, kMainBackColor],
  ));
  final gridTitleStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
  final gridTitleMargin = const EdgeInsets.symmetric(vertical: 20);
  final searchViewSliverSearchStyle =
      TextStyle(fontSize: 50, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            flexibleSpace: Container(
              decoration: boxDecoration,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    searchViewSliverSearch,
                    style: searchViewSliverSearchStyle,
                  )
                ],
              ),
            ),
            expandedHeight: 140,
          )
        ];
      },
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                  pinned: true, delegate: SearchBarPlaceholderSliver()),
              SliverToBoxAdapter(
                child: Container(
                  margin: gridTitleMargin,
                  child: Text(
                    searchViewYourTopGenres,
                    style: gridTitleStyle,
                  ),
                ),
              ),
              SliverGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 3 / 2,
                children: List.generate(
                    4,
                    (index) => Container(
                          decoration: dec,
                        )),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: gridTitleMargin,
                  child: Text(
                    searchViewBrowseAll,
                    style: gridTitleStyle,
                  ),
                ),
              ),
              SliverGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 3 / 2,
                children: List.generate(
                    10,
                    (index) => Container(
                          decoration: dec,
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
