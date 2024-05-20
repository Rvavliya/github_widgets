// ignore_for_file: library_private_types_in_public_api, invalid_use_of_visible_for_testing_member
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interactive_slider/interactive_slider.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class AnimatedSliderExample extends StatefulWidget {
  const AnimatedSliderExample({super.key});

  @override
  _AnimatedSliderExampleState createState() => _AnimatedSliderExampleState();
}

class _AnimatedSliderExampleState extends State<AnimatedSliderExample>
    with TickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;
  bool isAnimating = false;
  double _progress = 0;
  bool isShowe = false;
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController!);

    // Start the animation
    _animationController!.forward();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  void _playSound() async {
    await audioPlayer.play(AssetSource("demo.mp3"), volume: 5, balance: 1);
  }

  void _onSliderChange(double value) {
    setState(() {
      _progress = value;
      _animationController!.reset();
      _animationController!.forward();
      _playSound();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Animated Slider With sound and Gif"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            InteractiveSlider(
              startIcon: const Icon(CupertinoIcons.volume_down),
              // centerIcon: const Text('Center'),
              endIcon: const Icon(CupertinoIcons.volume_up),
              min: 0,
              max: 100,

              initialProgress: _progress,
              onChanged: _onSliderChange,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                AnimatedContainer(
                  decoration: BoxDecoration(
                    color: Colors
                        .blue, // Container color    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  duration: const Duration(seconds: 2), // Animation duration
                  curve: Curves.easeInOut, // Animation curve
                  width: double.maxFinite, // Container width
                  height: 25.0, // Container height

                  child: Stack(
                    children: [
                      // Background progress bar
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20)),
                        width: double.maxFinite,
                        height: 50.0,
                      ),
                      // Animated progress bar
                      AnimatedContainer(
                        alignment: Alignment.centerRight,
                        decoration: BoxDecoration(
                          color: Colors.teal, // Animated progress bar color
                          borderRadius: BorderRadius.circular(20),
                        ),

                        duration:
                            const Duration(seconds: 2), // Animation duration
                        curve: Curves.bounceOut, // Animation curve
                        width:
                            200 * _progress, // Dynamic width based on progress
                        height: 50.0,
                      ),

                      isShowe
                          ? Padding(
                              padding: EdgeInsets.only(
                                  left: _progress != 0.0
                                      ? (200 * _progress) - 20
                                      : 0),
                              child: Image.asset(
                                "assets/giphy-2--unscreen.gif",
                                fit: BoxFit.contain,
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              ],
            ),
            InteractiveSlider(
              initialProgress: _progress,
              onChanged: _onSliderChange,
              unfocusedOpacity: 1,
              unfocusedHeight: 30,
              focusedHeight: 40,
              gradient:
                  const LinearGradient(colors: [Colors.green, Colors.red]),
              gradientSize: GradientSize.progressWidth,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: AnimatedBuilder(
                animation: _animation!,
                builder: (context, child) {
                  return Container(
                    height: 15,
                    width: _progress,
                    color: Colors.black,
                    child: child,
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            LinearProgressIndicator(
              value: _progress,
              backgroundColor: Colors.grey,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            const SizedBox(height: 20),
            Text(_progress.toString()),
            const SizedBox(height: 20),
            MaterialButton(
              onPressed: () async {
                // setState(() {
                //   _progress += 20;
                //   _animationController!.forward();
                //   _playSound();
                // });
                // setState(() {});
                // if (!isAnimating) {
                //   setState(() {
                //     isAnimating = true;
                //     _progress = 0.0; // Reset progress before animation
                //   });
                // }
                // if (isAnimating) {
                _progress += 0.1; // Increase progress value
                _playSound();
                // if (_progress >= 1.0) {
                setState(() {
                  isAnimating = false;
                  isShowe = true;
                });
                await Future.delayed(const Duration(seconds: 1)).then((value) {
                  setState(() {
                    isShowe = false;
                  });
                });
                // }
                // }
              },
              animationDuration: const Duration(seconds: 1),
              color: Colors.indigo,
              elevation: 2,
              height: 60,
              minWidth: 150,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              textColor: Colors.white,
              disabledElevation: 12,
              child: const Text("Press"),
            ),
          ],
        ),
      ),
    );
  }
}
