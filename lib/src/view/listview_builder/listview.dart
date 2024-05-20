import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/provider/home/screens.dart';
import 'package:flutter_gallery/src/view/listview_builder/listview_builder_horizontal.dart';
import 'package:flutter_gallery/src/view/listview_builder/listview_builder_vertical.dart';
import 'package:flutter_gallery/src/widgets/fx_files/gridview.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class ListViewExample extends StatefulWidget {
  const ListViewExample({super.key});

  @override
  State<ListViewExample> createState() => _ListViewExampleState();
}

class _ListViewExampleState extends State<ListViewExample> {
  final List<Screens> listview = [
    const Screens(
        fileName: "ListView Builder Horizontal",
        navigation: ListViewBuilderExample()),
    const Screens(
        fileName: "ListView Builder Vertical",
        navigation: ListViewBuilderVertical()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CommonAppBar(
          title: Text("ListView"),
        ),
        body: FxGridView(screens: listview));
  }
}
