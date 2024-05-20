// ignore_for_file: unused_field

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';
import 'package:flutter_gallery/src/view/video_player_examplae/youtub_player/player_controllers.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubePlayerIframe extends StatefulWidget {
  const YoutubePlayerIframe({super.key});

  @override
  State<YoutubePlayerIframe> createState() => _YoutubePlayerIframeState();
}

class _YoutubePlayerIframeState extends State<YoutubePlayerIframe> {
  late YoutubePlayerController _playerController;
  @override
  void initState() {
    super.initState();
    const List<String> videoIds = [
      'ZNMz2hOrddo',
      'xYgIY_1ulhw',
    ];
    _playerController = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showControls: true,
        mute: false,
        showFullscreenButton: true,
        loop: false,
      ),
    );
    _playerController.setFullScreenListener(
      (isFullScreen) {
        log('${isFullScreen ? 'Entered' : 'Exited'} Fullscreen.');
      },
    );

    _playerController.loadPlaylist(
      list: videoIds,
      listType: ListType.playlist,
      startSeconds: 136,
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerScaffold(
      controller: _playerController,
      builder: (context, player) {
        return Scaffold(
          appBar: const CommonAppBar(
            leading: BackButton(),
            title: Text('Youtube Player IFrame Demo'),
            actions: [VideoPlaylistIconButton()],
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              if (kIsWeb && constraints.maxWidth > 750) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          player,
                          const VideoPositionIndicator(),
                        ],
                      ),
                    ),
                    const Expanded(
                      flex: 2,
                      child: SingleChildScrollView(
                        child: YoutubPlayerControllers(),
                      ),
                    ),
                    const BackButton(),
                    const SizedBox(
                      height: 200,
                    ),
                    const Text(
                      "data",
                      style: TextStyle(color: Colors.amber),
                    ),
                  ],
                );
              }

              return ListView(
                children: [
                  player,
                  const VideoPositionIndicator(),
                  // const YoutubPlayerControllers(),
                  BackButton(
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _playerController.close();
    super.dispose();
  }
}
