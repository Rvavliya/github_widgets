import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/view/animation/scroll_animation/animated_item.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class ScrollAnimation extends StatefulWidget {
  const ScrollAnimation({super.key});

  @override
  State<ScrollAnimation> createState() => _ScrollAnimationState();
}

class _ScrollAnimationState extends State<ScrollAnimation> {
  final List<String> items = List.generate(50, (index) => 'Item $index');
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Scroll Animation"),
      ),
      body: ListView.builder(
        controller:
            _controller, // Associate the ScrollController with the ListView
        itemCount: items.length,
        itemBuilder: (context, index) {
          return AnimatedItemWidget(
            index: index,
            item: items[index],
          );
        },
      ),
    );
  }
}
