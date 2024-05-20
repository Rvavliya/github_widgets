import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gallery/src/constant/images.dart';
import 'package:flutter_gallery/src/view/audio/just_audio/audio_controllers.dart';
import 'package:flutter_gallery/src/view/audio/just_audio/medial_meta_data.dart';
import 'package:flutter_gallery/src/view/audio/just_audio/position_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class JustAudioPlayerExample extends StatefulWidget {
  const JustAudioPlayerExample({super.key});

  @override
  State<JustAudioPlayerExample> createState() => _JustAudioPlayerExampleState();
}

class _JustAudioPlayerExampleState extends State<JustAudioPlayerExample> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  final _playList = ConcatenatingAudioSource(children: [
    AudioSource.uri(
      Uri.parse(
          "https://drive.google.com/uc?download=view&id=1fXw1H42Pv9bI-vNoCVxKS7NM_VJE9eAr"),
      tag: const MediaItem(
        artist: "Audio PlayList",
        id: '0',
        title: "Baground Music1",
      ),
    ),
    AudioSource.uri(
      Uri.parse(
          "https://drive.google.com/uc?download=view&id=1UYxYEYGy-SOzv2YeXaPgD-gXa3ELij-3"),
      tag: const MediaItem(
        artist: "Audio PlayList",
        id: '1',
        title: "Baground Music1",
      ),
    ),
    AudioSource.uri(
      Uri.parse(
          "https://drive.google.com/uc?download=view&id=1Hoy3Nq43OFcj-yjN5iJ9gmg3Psm6DndB"),
      tag: const MediaItem(
        artist: "Audio PlayList",
        id: '2',
        title: "Baground Music1",
      ),
    ),
    AudioSource.uri(
      Uri.parse(
          "https://drive.google.com/uc?download=view&id=1VAHugkLq1VEc5K7BAzd-ShTVxrizxWIr"),
      tag: const MediaItem(
        artist: "Audio PlayList",
        id: '3',
        title: "Baground Music1",
      ),
    ),
    AudioSource.uri(
      Uri.parse(
          "https://drive.google.com/uc?download=view&id=1mlK4-AfcX7VibOFni0-cz_b310CEW013"),
      tag: const MediaItem(
        artist: "Audio PlayList",
        id: '4',
        title: "Baground Music1",
      ),
    ),
  ]);

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        _audioPlayer.positionStream,
        _audioPlayer.bufferedPositionStream,
        _audioPlayer.durationStream,
        (position, bufferedPosition, duration) => PositionData(
          position,
          bufferedPosition,
          duration ?? Duration.zero,
        ),
      );
  @override
  void initState() {
    super.initState();
    _loadingAudio();
  }

  _loadingAudio() async {
    await _init().then((value) {
      _audioPlayer.positionStream;
      _audioPlayer.bufferedPositionStream;
      _audioPlayer.durationStream;
    });
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _audioPlayer.stop();
    }
    if (state == AppLifecycleState.resumed) {
      _audioPlayer.play();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.light,
        ),
        foregroundColor: Colors.white,
        title: Text(
          "Audio Example",
          style: TextStyle(color: Colors.white),
        ),
        shadowColor: Color(0xff071A2C),
        backgroundColor: Color(0xff144771),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff144771),
              Color(0xff071A2C),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<SequenceState?>(
              stream: _audioPlayer.sequenceStateStream,
              builder: (context, snapshot) {
                final state = snapshot.data;
                if (state?.sequence.isEmpty ?? false) {
                  return const SizedBox.shrink();
                }
                final tag = state?.currentSource?.tag;

                if (tag is MediaItem) {
                  final metaData = tag;
                  return MedialMetaData(
                    imageUrl: ConstImages.musicImage,
                    artist: metaData.artist?.toString() ?? 'Unknown Artist',
                    title: metaData.title,
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
            SizedBox(height: 18.h),
            StreamBuilder(
              stream: _positionDataStream,
              builder: (context, snapshot) {
                final positionData = snapshot.data;
                return ProgressBar(
                  thumbCanPaintOutsideBar: false,
                  barHeight: 7,
                  baseBarColor: Colors.grey.withOpacity(0.2),
                  bufferedBarColor: Colors.grey,
                  timeLabelPadding: 10,
                  timeLabelTextStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  progressBarColor: Colors.red,
                  thumbColor: Colors.red,
                  progress: positionData?.position ?? Duration.zero,
                  total: positionData?.duration ?? Duration.zero,
                  buffered: positionData?.bufferedPosition ?? Duration.zero,
                  onSeek: _audioPlayer.seek,
                );
              },
            ),
            AudioControllers(
              audioPlayer: _audioPlayer,
            )
          ],
        ),
      ),
    );
  }

  Future<void> _init() async {
    await _audioPlayer.setLoopMode(LoopMode.all);
    await _audioPlayer.setAudioSource(_playList);
  }
}
