// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class OnTapEffectButton extends StatefulWidget {
  const OnTapEffectButton({super.key});

  @override
  _OnTapEffectButtonState createState() => _OnTapEffectButtonState();
}

class _OnTapEffectButtonState extends State<OnTapEffectButton>
    with TickerProviderStateMixin {
  static const clickAnimationDurationMillis = 100;

  double _scaleTransformValue = 1;

  // needed for the "click" tap effect
  late final AnimationController animationController;
  late final AnimationController animationController1;
// Transform.translate
  Offset _translateOffset = Offset.zero; // Initialize to 0.0, 0.0

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: clickAnimationDurationMillis),
      lowerBound: 0.0,
      upperBound: 0.05,
    )..addListener(() {
        setState(() => _scaleTransformValue = 1 - animationController.value);
      });

    animationController1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: clickAnimationDurationMillis),
      lowerBound: 0.0,
      upperBound: 0.05,
    )..addListener(
        () {
          setState(() {
            // Update offset with animation value and desired movement
            _translateOffset = Offset(0.0, animationController1.value * 20);
          });
        },
      );
  }

  @override
  void dispose() {
    animationController.dispose();
    animationController1.dispose();
    super.dispose();
  }

  void _shrinkButtonSize() {
    animationController.forward();
  }

  void _shrinkButtonSize1() {
    animationController1.forward();
  }

  void _restoreButtonSize() {
    Future.delayed(
      const Duration(milliseconds: clickAnimationDurationMillis),
      () => animationController.reverse(),
    );
  }

  void _restoreButtonSize1() {
    Future.delayed(
      const Duration(milliseconds: clickAnimationDurationMillis),
      () => animationController1.reverse(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Tap Button Effect"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buttonAnimationPressffect(),
            const SizedBox(height: 20),
            _buttonAnimationUpToDown(),
          ],
        ),
      ),
    );
  }

  Widget _buttonAnimationPressffect() {
    return GestureDetector(
      onTap: () {
        _shrinkButtonSize();
        _restoreButtonSize();
      },
      onTapDown: (_) => _shrinkButtonSize(),
      onTapCancel: _restoreButtonSize,
      child: Transform.scale(
        scale: _scaleTransformValue,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 60,
          width: 140,
          child: const Center(
            child: Text(
              "Press Me",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonAnimationUpToDown() {
    return GestureDetector(
      onTap: () {
        _shrinkButtonSize1();
        _restoreButtonSize1();
      },
      onTapDown: (_) => _shrinkButtonSize1(),
      onTapCancel: _restoreButtonSize1,
      child: Transform.translate(
        offset: _translateOffset,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 60,
          width: 140,
          child: const Center(
            child: Text(
              "Press Me",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
