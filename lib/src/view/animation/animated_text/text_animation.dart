import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gallery/src/constant/string.dart';
import 'package:flutter_gallery/src/constant/theme.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class TextAnimation extends StatefulWidget {
  const TextAnimation({super.key});

  @override
  State<TextAnimation> createState() => _TextAnimationState();
}

class _TextAnimationState extends State<TextAnimation> {
  // AnimationController? animationController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: Text(
          Strings.textAnimation,
          style: ConstTheme.appBarTitleText(context),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              Animate(
                effects: const [
                  FadeEffect(),
                ],
                child: const Center(
                  child: Text(
                    "FadeEffect",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              Animate(
                effects: const [
                  ScaleEffect(),
                ],
                child: const Center(
                  child: Text(
                    "ScaleEffect",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              const Text(
                "Animate",
                style: TextStyle(
                  fontSize: 30,
                ),
              ).animate(autoPlay: true),
              const Text(
                "Shimmer",
                style: TextStyle(
                  fontSize: 50,
                ),
              )
                  .animate(
                    onPlay: (controller) => controller..repeat(),
                  )
                  .then(delay: 3.seconds)
                  .shimmer(duration: 1.seconds),
              const Text(
                "Fade",
                style: TextStyle(
                  fontSize: 30,
                ),
              ).animate().fade(duration: const Duration(seconds: 1)),
              const Text(
                "Scale",
                style: TextStyle(
                  fontSize: 30,
                ),
              )
                  .animate(
                    onPlay: (controller) => controller.repeat(),
                  )
                  .then(delay: 1.seconds)
                  .scale(duration: 3.seconds),
              const Text(
                "Move",
                style: TextStyle(
                  fontSize: 30,
                ),
              ).animate().move(
                    duration: const Duration(seconds: 1),
                    transformHitTests: true,
                  ),
              const Text(
                "BlurXY",
                style: TextStyle(
                  fontSize: 30,
                ),
              ).animate().blurXY(
                    duration: const Duration(seconds: 1),
                  ),
              const Text(
                "FadeIn",
                style: TextStyle(
                  fontSize: 30,
                ),
              ).animate().fadeIn(
                    duration: const Duration(seconds: 1),
                  ),
              const Text(
                "tint",
                style: TextStyle(
                  fontSize: 30,
                ),
              ).animate().tint(
                    duration: const Duration(seconds: 1),
                    color: Colors.purple,
                  ),
              const Text(
                "Slider",
                style: TextStyle(
                  fontSize: 30,
                ),
              ).animate().slide(
                    duration: const Duration(seconds: 1),
                  ),
              const Text(
                "Then",
                style: TextStyle(
                  fontSize: 30,
                ),
              )
                  .animate()
                  .fadeIn(duration: 600.ms)
                  .then(delay: 200.ms) // baseline=800ms
                  .slide(),
              const Text(
                "Custom",
                style: TextStyle(
                  fontSize: 30,
                ),
              ).animate().custom(
                    duration: 300.ms,
                    builder: (context, value, child) => Container(
                      color: Color.lerp(Colors.red, Colors.blue, value),
                      padding: const EdgeInsets.all(8),
                      child: child, // child is the Text widget being animated
                    ),
                  ),
              Animate().toggle(
                duration: 2.seconds,
                builder: (_, value, __) => Text(
                  value ? "Before" : "After",
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              const Text(
                "Before",
                style: TextStyle(
                  fontSize: 30,
                ),
              ).animate().swap(
                    duration: 900.ms,
                    builder: (_, __) => const Text(
                      "After",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
              const Text(
                "Rotate",
                style: TextStyle(
                  fontSize: 30,
                ),
              ).animate().rotate(
                    duration: 900.ms,
                  ),
              const Text(
                "BoxShadow",
                style: TextStyle(
                  fontSize: 30,
                ),
              ).animate().boxShadow(
                    duration: 900.ms,
                  ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // animationController?.dispose();
  }
}
