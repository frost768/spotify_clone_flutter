import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify_clone/components/albumlist_tile.dart';
import 'package:spotify_clone/components/playlist_tile.dart';
import 'package:spotify_clone/controllers/user_controller.dart';
import 'package:spotify_clone/data/artists.dart';
import 'package:spotify_clone/views/views.dart';

class LibraryView extends StatelessWidget {
  LibraryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: UserController(),
      builder: (UserController user) => DefaultTabController(
        length: 3,
        child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  title: Row(
                    children: [
                      Text(
                        libraryHeaderMusic,
                        style: kLibraryHeaderTabStyle,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        libraryHeaderPodcasts,
                        style: kLibraryHeaderTabStyle,
                      )
                    ],
                  ),
                  expandedHeight: 70,
                ),
              ];
            },
            body: SafeArea(
              child: Container(
                margin: kMarginLeft10,
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      child: TabBar(indicatorColor: Colors.green, tabs: [
                        Tab(
                          child: Text(
                            libraryTabPlaylists,
                            style: kLibraryTabStyle,
                          ),
                        ),
                        Tab(
                          child: Text(
                            libraryTabArtists,
                            style: kLibraryTabStyle,
                          ),
                        ),
                        Tab(
                          child: Text(
                            libraryTabAlbums,
                            style: kLibraryTabStyle,
                          ),
                        )
                      ]),
                    ),
                    Expanded(
                      child: TabBarView(children: [
                        ListView(children: [
                          PlaylistTile(
                            libraryListTileCreatePlaylist,
                            isCreatePlaylist: true,
                            onTap: () => Get.toNamed('CreatePlaylist'),
                          ),
                          PlaylistTile(
                            libraryListTileLikedSongs,
                            isFavoriteList: true,
                            subtitle: '${user.favorites.length} şarkı',
                            onTap: () => Get.toNamed('FavoriteSongs'),
                          ),
                          ...user.playlists
                              .map((p) => PlaylistTile(p.name,
                                  subtitle: 'oluşturan ${p.createdBy?.name}'))
                              .toList()
                        ]),
                        ListView(
                            children: artists
                                .map((e) => AlbumListTile(e.name))
                                .toList()),
                        ListView(
                          children: user.favoriteAlbums
                              .map((e) => PlaylistTile(e.name))
                              .toList(),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
