import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/provider/home/screens.dart';
import 'package:flutter_gallery/src/view/video_player_examplae/chewie_video_player.dart';
import 'package:flutter_gallery/src/view/video_player_examplae/fx_video_player.dart';
import 'package:flutter_gallery/src/view/video_player_examplae/video_player_example.dart';
import 'package:flutter_gallery/src/view/video_player_examplae/youtub_player/youtube_player_iframe_example.dart';
import 'package:flutter_gallery/src/widgets/fx_files/gridview.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class VideoPlayerExample extends StatefulWidget {
  const VideoPlayerExample({super.key});

  @override
  State<VideoPlayerExample> createState() => _VideoPlayerExampleState();
}

class _VideoPlayerExampleState extends State<VideoPlayerExample> {
  List<Screens> videoPlayer = [
    const Screens(fileName: "Video player", navigation: VideoPlayerExample1()),
    const Screens(
        fileName: "Chewie VideoPlayer", navigation: ChewieVideoPlayer()),
    const Screens(
        fileName: "Fx Video Player", navigation: FxVideoPlayerExample()),
    const Screens(
        fileName: "Youtube Player", navigation: YoutubePlayerIframe()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("VideoPlayer"),
      ),
      body: FxGridView(screens: videoPlayer),
    );
  }
}
