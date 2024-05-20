import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class AnimatedPhysicalModelExample extends StatefulWidget {
  const AnimatedPhysicalModelExample({super.key});

  @override
  State<AnimatedPhysicalModelExample> createState() =>
      _AnimatedPhysicalModelExampleState();
}

class _AnimatedPhysicalModelExampleState
    extends State<AnimatedPhysicalModelExample> {
  final ValueNotifier<double> _isElevated = ValueNotifier<double>(10.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text('Animated PhysicalModel'),
      ),
      body: ValueListenableBuilder(
        valueListenable: _isElevated,
        builder: (BuildContext context, double value, Widget? child) => Center(
          child: GestureDetector(
            onTap: () {
              log("tapp!!");
            },
            child: Listener(
              onPointerUp: (_) => _isElevated.value = 10.0,
              onPointerDown: (_) => _isElevated.value = 0.0,
              child: AnimatedPhysicalModel(
                animateShadowColor: true,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                elevation: _isElevated.value,
                shape: BoxShape.rectangle,
                color: Colors.blue,
                shadowColor: Colors.black,
                child: const SizedBox(
                  width: 200,
                  height: 200,
                  child: Center(
                    child: Text(
                      'Tap me!',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
