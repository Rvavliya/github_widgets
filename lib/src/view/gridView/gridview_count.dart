import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class GridviewCount extends StatefulWidget {
  const GridviewCount({super.key});

  @override
  State<GridviewCount> createState() => _GridviewCountState();
}

class _GridviewCountState extends State<GridviewCount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("GridView Count"),
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: List.generate(
          8,
          (index) => Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[100],
            child: const Center(
              child: Text("He'd have you all unravel at the"),
            ),
          ),
        ),
      ),
    );
  }
}
