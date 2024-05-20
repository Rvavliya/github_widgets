import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class ListViewBuilderVertical extends StatefulWidget {
  const ListViewBuilderVertical({super.key});

  @override
  State<ListViewBuilderVertical> createState() =>
      _ListViewBuilderVerticalState();
}

class _ListViewBuilderVerticalState extends State<ListViewBuilderVertical> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("ListView Builder"),
      ),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Container(
              height: 100,
              width: 100,
              color: Colors.amber,
              child: Center(
                child: Text(
                  index.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
