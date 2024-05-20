import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class AnimatedCrossFadExample extends StatefulWidget {
  const AnimatedCrossFadExample({super.key});

  @override
  State<AnimatedCrossFadExample> createState() =>
      _AnimatedCrossFadExampleState();
}

class _AnimatedCrossFadExampleState extends State<AnimatedCrossFadExample> {
  final ValueNotifier<bool> _showFirstText = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Animated CrossFad"),
      ),
      body: ValueListenableBuilder(
        valueListenable: _showFirstText,
        builder: (BuildContext context, bool value, Widget? child) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: AnimatedCrossFade(
                excludeBottomFocus: true,
                reverseDuration: const Duration(milliseconds: 600),
                sizeCurve: Curves.bounceOut,
                firstCurve: Curves.easeOut,
                secondCurve: Curves.easeIn,
                duration: const Duration(milliseconds: 600),
                firstChild: const Text(
                  'Hello, Flutter!',
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
                secondChild: const Text(
                  'Welcome to AnimatedCrossFade!',
                  style: TextStyle(fontSize: 20, color: Colors.green),
                ),
                crossFadeState: _showFirstText.value
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _showFirstText.value = !_showFirstText.value;
              },
              child: const Text('Toggle Text'),
            ),
          ],
        ),
      ),
    );
  }
}
