import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/provider/home/screens.dart';
import 'package:flutter_gallery/src/view/gridView/gridview_builder.dart';
import 'package:flutter_gallery/src/view/gridView/gridview_count.dart';
import 'package:flutter_gallery/src/widgets/fx_files/gridview.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class GridviewExample extends StatefulWidget {
  const GridviewExample({super.key});

  @override
  State<GridviewExample> createState() => _GridviewExampleState();
}

class _GridviewExampleState extends State<GridviewExample> {
  List<Screens> gridView = [
    const Screens(fileName: "GridView Count", navigation: GridviewCount()),
    const Screens(
        fileName: "Gridview Builder", navigation: GridviewBuilderExample()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("GridView"),
      ),
      body: FxGridView(screens: gridView),
    );
  }
}
