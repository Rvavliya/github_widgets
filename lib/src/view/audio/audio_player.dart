// // ignore_for_file: invalid_use_of_visible_for_testing_member

// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';

// class AudioPlayerExample extends StatefulWidget {
//   const AudioPlayerExample({super.key});

//   @override
//   State<AudioPlayerExample> createState() => _AudioPlayerExampleState();
// }

// class _AudioPlayerExampleState extends State<AudioPlayerExample>
//     with TickerProviderStateMixin {
//   AnimationController? _animationIconController1;
//   AudioCache? audioCache;
//   AudioPlayer? audioPlayer;
//   Duration _position = const Duration();
//   final Duration _duration = const Duration();
//   final Duration _slider = const Duration(seconds: 0);
//   double? durationvalue;
//   bool issongplaying = false;

//   @override
//   void initState() {
//     super.initState();
//     _position = _slider;
//     _animationIconController1 = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 750),
//       reverseDuration: const Duration(milliseconds: 750),
//     );
//     audioPlayer = AudioPlayer();
//     // audioCache = AudioCache(fixedPlayer: audioPlayer);
//     // audioPlayer.durationHandler = (d) => setState(() {
//     //       _duration = d;
//     //     });

//     // audioPlayer.positionHandler = (p) => setState(() {
//     //       _position = p;
//     //     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CommonAppBar(
//         title: const Text("Audio Player"),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           color: Colors.grey.shade100.withOpacity(0.55),
//         ),
//         child: SizedBox(
//           width: (MediaQuery.of(context).size.width),
//           height: (MediaQuery.of(context).size.height),
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Slider(
//                   activeColor: Colors.white,
//                   inactiveColor: Colors.grey,
//                   value: _position.inSeconds.toDouble(),
//                   max: _duration.inSeconds.toDouble(),
//                   onChanged: (double value) {
//                     // Add code to track the music duration.
//                   },
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     const Icon(
//                       Icons.navigate_before,
//                       size: 55,
//                       color: Colors.white,
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         setState(
//                           () {
//                             if (!issongplaying) {
//                               audioCache!.loadAsset("music/music1.mp3");
//                             } else {
//                               audioPlayer!.pause();
//                             }
//                             issongplaying
//                                 ? _animationIconController1!.reverse()
//                                 : _animationIconController1!.forward();
//                             issongplaying = !issongplaying;
//                           },
//                         );
//                       },
//                       child: ClipOval(
//                         child: Container(
//                           color: Colors.pink[600],
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: AnimatedIcon(
//                               icon: AnimatedIcons.play_pause,
//                               size: 55,
//                               progress: _animationIconController1!,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const Icon(
//                       Icons.navigate_next,
//                       size: 55,
//                       color: Colors.white,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
