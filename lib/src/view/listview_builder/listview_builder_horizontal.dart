import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class ListViewBuilderExample extends StatefulWidget {
  const ListViewBuilderExample({super.key});

  @override
  State<ListViewBuilderExample> createState() => _ListViewBuilderExampleState();
}

class _ListViewBuilderExampleState extends State<ListViewBuilderExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("ListView Builder"),
      ),
      body: ListView.builder(
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
