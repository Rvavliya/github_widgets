import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class FadeTransitionExample extends StatefulWidget {
  const FadeTransitionExample({super.key});

  @override
  State<FadeTransitionExample> createState() => _FadeTransitionExampleState();
}

class _FadeTransitionExampleState extends State<FadeTransitionExample>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Fade-in Transition"),
      ),
      body: Center(
        child: ColoredBox(
          color: Colors.white,
          child: FadeTransition(
            opacity: _animation,
            child: const Padding(
                padding: EdgeInsets.all(8),
                child: FlutterLogo(
                  size: 200,
                )),
          ),
        ),
      ),
    );
  }
}
