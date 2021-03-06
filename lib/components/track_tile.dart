import 'package:flutter/material.dart';
import 'package:spotify_clone/components/explicit_widget.dart';
import 'package:spotify_clone/models/track.dart';

class TrackTile extends StatelessWidget {
  final Track track;
  bool showAlbumArt;
  final textStyle = TextStyle(fontSize: 12, color: Colors.grey);
  TrackTile(this.track, {this.showAlbumArt = false, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: showAlbumArt
          ? Container(
              color: Colors.white,
              width: 50,
              height: 50,
            )
          : null,
      title: Text(
        track.name,
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Row(
        children: [
          if (track.isExplicit) ExplicitWidget(),
          Text(
            track.artist.name,
            style: textStyle,
          ),
        ],
      ),
      trailing: !showAlbumArt
          ? IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert_outlined,
                color: Colors.grey,
              ))
          : null,
    );
  }
}
