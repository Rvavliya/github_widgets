import 'dart:math' as math;
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';
import 'package:flutter/material.dart';

class AnimatedBuilderExample extends StatefulWidget {
  const AnimatedBuilderExample({super.key});

  @override
  State<AnimatedBuilderExample> createState() => _AnimatedBuilderExampleState();
}

/// AnimationControllers can be created with `vsync: this` because of
/// TickerProviderStateMixin.
class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Animated Builder"),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                const Text("Transform Rotate"),
                const SizedBox(height: 40),
                AnimatedBuilder(
                  animation: _controller,
                  child: Container(
                    width: 200.0,
                    height: 200.0,
                    color: Colors.green,
                    child: const Center(
                      child: Text('Whee!'),
                    ),
                  ),
                  builder: (BuildContext context, Widget? child) {
                    return Transform.rotate(
                      angle: _controller.value * 2.0 * math.pi,
                      transformHitTests: true,
                      child: child,
                    );
                  },
                ),
                const SizedBox(height: 40),
                const Text("Transform Scale"),
                const SizedBox(height: 20),
                AnimatedBuilder(
                  animation: _controller,
                  child: Container(
                    width: 200.0,
                    height: 200.0,
                    color: Colors.green,
                    child: const Center(
                      child: Text('Whee!'),
                    ),
                  ),
                  builder: (BuildContext context, Widget? child) {
                    return Transform.scale(
                      scale: _controller.value,
                      alignment: Alignment.center,
                      origin: const Offset(50.0, 50.0),
                      transformHitTests: true,
                      child: child,
                    );
                  },
                ),
                const SizedBox(height: 40),
                const Text("Transform Translate"),
                const SizedBox(height: 20),
                AnimatedBuilder(
                  animation: _controller,
                  child: Container(
                    width: 200.0,
                    height: 200.0,
                    color: Colors.green,
                    child: const Center(
                      child: Text('Whee!'),
                    ),
                  ),
                  builder: (BuildContext context, Widget? child) {
                    return Transform.translate(
                      transformHitTests: true,
                      // offset: Offset(_controller.value * 50.0, 0.0),
                      offset: Offset(_controller.value * 100.0, 0.0),
                      child: child,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
