import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioControllers extends StatefulWidget {
  final AudioPlayer audioPlayer;
  const AudioControllers({super.key, required this.audioPlayer});

  @override
  State<AudioControllers> createState() => _AudioControllersState();
}

class _AudioControllersState extends State<AudioControllers> {
  bool isSliderVisible = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          iconSize: 55,
          onPressed: widget.audioPlayer.seekToPrevious,
          color: Colors.white,
          icon: const Icon(Icons.skip_previous_rounded),
        ),
        StreamBuilder<PlayerState>(
          stream: widget.audioPlayer.playerStateStream,
          builder: (context, snapshot) {
            final playerState = snapshot.data;
            final processingState = playerState?.processingState;
            final playing = playerState?.playing;
            if (!(playing ?? false)) {
              return IconButton(
                onPressed: () {
                  widget.audioPlayer.play();
                },
                color: Colors.white,
                iconSize: 55,
                icon: const Icon(
                  Icons.play_arrow_rounded,
                ),
              );
            } else if (processingState != ProcessingState.completed) {
              return IconButton(
                onPressed: () {
                  widget.audioPlayer.pause();
                },
                color: Colors.white,
                iconSize: 55,
                icon: const Icon(
                  Icons.pause_rounded,
                ),
              );
            }
            return const Icon(
              Icons.play_arrow_rounded,
              size: 55,
              color: Colors.white,
            );
          },
        ),
        // Stack(
        //   alignment: Alignment.center,
        //   children: [
        //     // IconButton(
        //     //   icon: const Icon(Icons.volume_up_rounded),
        //     //   onPressed: () {
        //     //     isSliderVisible = true;
        //     //     setState(() {});
        //     //     log("tapp");
        //     //     showSliderDialog(
        //     //       context: context,
        //     //       title: "Adjust volume",
        //     //       min: 0.0,
        //     //       max: 10.0,
        //     //       stream: widget.audioPlayer.volumeStream,
        //     //       onChanged: widget.audioPlayer.setVolume,
        //     //     );
        //     //   },
        //     // ),
        //   ],
        // ),
        IconButton(
            iconSize: 55,
            onPressed: widget.audioPlayer.seekToNext,
            color: Colors.white,
            icon: const Icon(Icons.skip_next_rounded)),
      ],
    );
  }

  showSliderDialog({
    required void Function(double) onChanged,
    required double max,
    required double min,
    required BuildContext context,
    required Stream<double> stream,
    required String title,
  }) {
    return AnimatedContainer(
      height: isSliderVisible ? 100 : 0,
      // height: 50,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: Container(
        height: 100,
        width: 50,
        color: Colors.white,
        child: StreamBuilder(
          stream: stream,
          builder: (BuildContext context, AsyncSnapshot<double> snapshot) =>
              Slider(
            value: snapshot.data?.toDouble() ?? 0.0,
            onChanged: onChanged,
            max: max,
          ),
        ),
      ),
    );
  }
}
