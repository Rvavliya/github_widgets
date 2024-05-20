import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});

  @override
  State<AnimatedContainerExample> createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  final ValueNotifier<bool> _selected = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: Text('AnimatedContainer Sample')),
      body: ValueListenableBuilder(
        valueListenable: _selected,
        builder: (BuildContext context, bool value, Widget? child) =>
            GestureDetector(
          onTap: () {
            _selected.value = !_selected.value;
          },
          child: Center(
            child: AnimatedContainer(
              width: _selected.value ? 200.0 : 100.0,
              height: _selected.value ? 100.0 : 200.0,
              color: _selected.value ? Colors.red : Colors.blue,
              alignment: _selected.value
                  ? Alignment.center
                  : AlignmentDirectional.topCenter,
              duration: const Duration(seconds: 2),
              curve: Curves.ease,
              child: const FlutterLogo(size: 75),
            ),
          ),
        ),
      ),
    );
  }
}
