import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class AnimatedContainerWithIcon extends StatefulWidget {
  const AnimatedContainerWithIcon({super.key});

  @override
  State<AnimatedContainerWithIcon> createState() =>
      _AnimatedContainerWithIconState();
}

class _AnimatedContainerWithIconState extends State<AnimatedContainerWithIcon>
    with SingleTickerProviderStateMixin {
  double turns = 0.0;
  ValueNotifier<bool> isCliked = ValueNotifier<bool>(false);
  Color customBlackColor = const Color.fromARGB(255, 53, 53, 53);
  Color customWhitekColor = const Color.fromARGB(255, 237, 237, 237);
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(
        title: Text("Animated Container with Icon"),
      ),
      body: ValueListenableBuilder(
        valueListenable: isCliked,
        builder: (BuildContext context, value, Widget? child) => Center(
          child: AnimatedRotation(
            curve: Curves.easeOutExpo,
            duration: const Duration(seconds: 1),
            turns: turns,
            child: GestureDetector(
              onTap: () {
                if (value) {
                  turns -= 1 / 4;
                  _controller.reverse();
                } else {
                  turns += 1 / 4;
                  _controller.forward();
                }
                isCliked.value = !isCliked.value;
              },
              child: AnimatedContainer(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: customWhitekColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 30,
                      offset: isCliked.value
                          ? const Offset(20, -20)
                          : const Offset(20, 20),
                    ),
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 30,
                      offset: isCliked.value
                          ? const Offset(-20, 20)
                          : const Offset(-20, -20),
                    ),
                  ],
                ),
                duration: const Duration(seconds: 1),
                curve: Curves.easeOutExpo,
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Center(
                    child: AnimatedIcon(
                      size: 30,
                      color: customBlackColor,
                      icon: AnimatedIcons.menu_close,
                      progress: _controller,
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
