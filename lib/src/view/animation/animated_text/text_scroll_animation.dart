import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class TextScrollAnimation extends StatefulWidget {
  const TextScrollAnimation({super.key});

  @override
  State<TextScrollAnimation> createState() => _TextScrollAnimationState();
}

class _TextScrollAnimationState extends State<TextScrollAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    _scrollController = ScrollController()
      ..addListener(() {
        _animationController.value = _scrollController.offset / 1000;
      });
    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Text animation with Scroll"),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollUpdateNotification) {
            _animationController.forward();
          }
          return false;
        },
        child: FadeTransition(
          opacity: _animation,
          child: Center(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              controller: _scrollController,
              child: const Column(
                children: [
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                  Text("check scroll controller "),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
