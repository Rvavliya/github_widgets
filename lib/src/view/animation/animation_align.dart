import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class AnimatedAlignExample extends StatefulWidget {
  const AnimatedAlignExample({super.key});

  @override
  State<AnimatedAlignExample> createState() => _AnimatedAlignExampleState();
}

class _AnimatedAlignExampleState extends State<AnimatedAlignExample> {
  final ValueNotifier<bool> _selected = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: Text("Animated Align")),
      body: ValueListenableBuilder(
        valueListenable: _selected,
        builder: (BuildContext context, value, Widget? child) =>
            GestureDetector(
          onTap: () {
            _selected.value = !_selected.value;
          },
          child: Center(
            child: Container(
              width: 250.0,
              height: 250.0,
              color: Colors.red,
              child: AnimatedAlign(
                alignment:
                    _selected.value ? Alignment.topRight : Alignment.bottomLeft,
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                child: const FlutterLogo(size: 50.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
