import 'package:flutter/material.dart';

class AnimatedItemWidget extends StatefulWidget {
  final int index;
  final String item;

  const AnimatedItemWidget(
      {super.key, required this.index, required this.item});

  @override
  _AnimatedItemWidgetState createState() => _AnimatedItemWidgetState();
}

// Create the state for an individual item
class _AnimatedItemWidgetState extends State<AnimatedItemWidget>
    with SingleTickerProviderStateMixin {
  // Define an AnimationController for controlling animations
  late AnimationController _animationController;

  // Define an Animation to interpolate values between 0 and 1
  late Animation<double> _animation;
  late Animation<Offset> _animationOffset;

  @override
  void initState() {
    super.initState();

    // Create an AnimationController with a 4-second duration
    _animationController = AnimationController(
      vsync:
          this, // Associate the AnimationController with the widget's lifecycle
      duration: const Duration(seconds: 1),
    );

    _animationOffset = Tween<Offset>(
      begin: const Offset(0.0, 1.0), // Start from outside the bottom
      end: const Offset(0.0, 0.0), // Move to its final position
    ).animate(_animationController);
    // Create a linear Tween animation from 0 to 1
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);

    // Trigger the animation when the widget is first built
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: SlideTransition(
        position: _animationOffset,
        child: Card(
          elevation: 2,
          margin: const EdgeInsets.all(8),
          child: ListTile(
            title: Text(widget.item),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of the AnimationController to free resources
    _animationController.dispose();
    super.dispose();
  }
}
