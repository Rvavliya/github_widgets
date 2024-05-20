import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class AnimationButton extends StatefulWidget {
  const AnimationButton({super.key});

  @override
  State<AnimationButton> createState() => _AnimationButtonState();
}

ValueNotifier<bool> isPressed = ValueNotifier<bool>(true);
ValueNotifier<bool> isDarkMode = ValueNotifier<bool>(false);

class _AnimationButtonState extends State<AnimationButton> {
  // final backgroundColor =
  //     isDarkMode.value ? const Color(0xff2E3239) : Colors.white;
  Offset distance =
      isPressed.value ? const Offset(10, 10) : const Offset(10, 10);
  double blur = 10;
  double blurEffect = isPressed.value ? 5.0 : 10.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Press Effect"),
      ),
      // backgroundColor: backgroundColor,
      body: ValueListenableBuilder(
        valueListenable: isDarkMode,
        builder: (BuildContext context, bool value, Widget? child) =>
            ValueListenableBuilder(
          valueListenable: isPressed,
          builder: (BuildContext context, bool value1, Widget? child) => Center(
            child: Listener(
              onPointerUp: (_) {
                isPressed.value = false;
              },
              onPointerDown: (_) {
                isPressed.value = true;
              },
              child: AnimatedContainer(
                decoration: BoxDecoration(
                  // color: backgroundColor,
                  color: Colors.white, borderRadius: BorderRadius.circular(10),
                  boxShadow: isPressed.value
                      ? []
                      : [
                          BoxShadow(
                            blurRadius: blur,
                            offset: -distance,
                            color: isDarkMode.value
                                ? const Color(0xff35393F)
                                : Colors.white,
                            inset: isPressed.value,
                          ),
                          BoxShadow(
                            blurRadius: blur,
                            offset: distance,
                            color: isDarkMode.value
                                ? const Color(0xff23262A)
                                : const Color(0xffA7A9AF),
                            inset: isPressed.value,
                          ),
                        ],
                ),
                duration: const Duration(milliseconds: 100),
                child: const SizedBox(
                  height: 50,
                  width: 150,
                  child: Center(
                    child: Text(
                      "Press",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
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
