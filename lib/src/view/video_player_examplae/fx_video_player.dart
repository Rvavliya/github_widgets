import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterx/flutterx.dart';

class FxVideoPlayerExample extends StatefulWidget {
  const FxVideoPlayerExample({super.key});

  @override
  State<FxVideoPlayerExample> createState() => _FxVideoPlayerExampleState();
}

class _FxVideoPlayerExampleState extends State<FxVideoPlayerExample> {
  final List<String> urls = [
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4',
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4',
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4'
  ];

  TextStyle textStyle = const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Wrap(
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          runSpacing: 20,
          spacing: 20,
          children: [
            Text("Single Video", style: textStyle),
            SizedBox(height: 20.sp),
            // _listedVideoUrl(),
            // IntrinsicHeight(
            //   child: IntrinsicHeight(
            //     child: FxVideoPlayer(
            //       videoList: [urls[0]],
            //       initialVideoIndex: 0,
            //       videoAspectRatio: 1 / 1,
            //       videoFrom: VideoFrom.network,
            //     ),
            //   ),
            // ),
            _listedVideoUrl(),
            SizedBox(height: 20.sp),
            Text("Video Player", style: textStyle),
            SizedBox(height: 20.sp),
            // IntrinsicHeight(
            //   child: FxVideoPlayer(
            //     videoList: urls,
            //     initialVideoIndex: 0,
            //     videoAspectRatio: 1 / 1,
            //     videoFrom: VideoFrom.network,
            //   ),
            // ),
            _multiVideoUrl(),
            SizedBox(height: 16.sp),
          ],
        ),
      ),
    );
  }

  Widget _listedVideoUrl() {
    try {
      return IntrinsicHeight(
        child: FxVideoPlayer(
          videoList: urls,
          initialVideoIndex: 0,
          videoAspectRatio: 1 / 1,
          videoFrom: VideoFrom.network,
        ),
      );
    } catch (e) {
      log("error in video call: $e");
      return const Placeholder();
    }
  }

  Widget _multiVideoUrl() {
    try {
      return IntrinsicHeight(
        child: FxVideoPlayer(
          videoList: urls,
          initialVideoIndex: 0,
          videoAspectRatio: 1 / 1,
          videoFrom: VideoFrom.network,
        ),
      );
    } catch (e) {
      log("Multi video error: $e");
      return const Placeholder();
    }
  }
}
