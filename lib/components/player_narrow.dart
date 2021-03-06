import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify_clone/components/player_scroller.dart';
import 'package:spotify_clone/controllers/player_controller.dart';
import 'package:spotify_clone/views/views.dart';

class PlayerNarrow extends StatelessWidget {
  PlayerNarrow({Key? key}) : super(key: key);

  final TextStyle kSongNameStyle =
      TextStyle(fontSize: 13, fontWeight: FontWeight.bold);
  final TextStyle kArtistStyle =
      TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.grey);
  final EdgeInsets _margin = const EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: PlayerController(),
      builder: (PlayerController player) => Container(
        height: kPlayerNarrowHeight,
        color: kMainColor,
        child: Column(
          children: [
            Row(
              children: [
                Obx(
                  () => Container(
                    height: kPlayerElapsedTimeNarrowHeight,
                    width: player.time.value *
                        (Get.size.width / player.track.duration.inSeconds),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.purple, Colors.pink])),
                  ),
                ),
              ],
            ),
            Container(
              height: kPlayerNarrowHeight - kPlayerElapsedTimeNarrowHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed('PlayerFull');
                      },
                      child: Row(
                        children: [
                          // Album Art
                          Container(
                            width: kPlayerNarrowHeight,
                            color: Colors.white,
                          ),
                          // Song Info
                          Expanded(
                            flex: 2,
                            child: PlayerScroller(Container(
                              margin: _margin,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      children: [
                                        Text(
                                          player.track.name,
                                          style: kSongNameStyle,
                                        ),
                                        Text(' '),
                                        Text(
                                          '???',
                                          style: kArtistStyle.copyWith(
                                              fontSize: 15),
                                        ),
                                        Text(' '),
                                        Text(
                                          player.track.artist.name,
                                          style: kArtistStyle,
                                        )
                                      ],
                                    ),
                                  ),
                                  Offstage(
                                    offstage: true,
                                    child: Text(
                                      playerNarrowAvaiableDevices,
                                      style: kSongNameStyle,
                                    ),
                                  )
                                ],
                              ),
                            )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Like And Play
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            player.toggleLike();
                          },
                          icon: Icon(
                              player.track.liked
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              color: player.track.liked
                                  ? Colors.green
                                  : Colors.white),
                        ),
                        IconButton(
                          onPressed: () {
                            player.togglePlay();
                          },
                          icon: Icon(
                            player.isPlaying ? Icons.pause : Icons.play_arrow,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
