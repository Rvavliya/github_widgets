import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class ChewieVideoPlayer extends StatefulWidget {
  const ChewieVideoPlayer({super.key});

  @override
  State<ChewieVideoPlayer> createState() => _ChewieVideoPlayerState();
}

class _ChewieVideoPlayerState extends State<ChewieVideoPlayer> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;
  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4"),
    );
    _chewieController?.addListener(() {
      if (!_chewieController!.isFullScreen) {
        SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp],
        );
      }
    });
    _chewieController = ChewieController(
      allowFullScreen: true,
      allowMuting: true,
      allowedScreenSleep: true,
      autoPlay: true,
      allowPlaybackSpeedChanging: true,
      isLive: false,
      zoomAndPan: true,
      useRootNavigator: true,
      videoPlayerController: _videoPlayerController!,
      aspectRatio: 16 / 9,
      // Prepare the video to be played and display the first frame
      autoInitialize: true,
      looping: true,
      // Errors can occur for example when trying to play a video
      // from a non-existent URL
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController!.dispose();
    _chewieController?.dispose();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Flick Video Player"),
      ),
      body: Chewie(
        controller: _chewieController!,
      ),
    );
  }
}
