import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class WrapWidgetExample extends StatefulWidget {
  const WrapWidgetExample({super.key});

  @override
  State<WrapWidgetExample> createState() => _WrapWidgetExampleState();
}

class _WrapWidgetExampleState extends State<WrapWidgetExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Wrap Widget"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Wrap(
            runAlignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            textDirection:
                TextDirection.ltr, // move to left to right and right to left.
            // verticalDirection: VerticalDirection.up,
            alignment: WrapAlignment.start,
            clipBehavior: Clip.none,
            direction: Axis.horizontal,
            spacing: 8.0, // gap between adjacent chips
            runSpacing: 4.0, // gap between lines

            children: List.generate(
              10,
              (index) => Chip(
                avatar: CircleAvatar(
                  backgroundColor: Colors.blue.shade900,
                  child: const Text('AH'),
                ),
                label: Text((index + 1).toString()),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
