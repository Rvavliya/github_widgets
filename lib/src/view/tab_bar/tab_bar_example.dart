import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/provider/home/screens.dart';
import 'package:flutter_gallery/src/view/tab_bar/defult_tab_bar.dart';
import 'package:flutter_gallery/src/view/tab_bar/inner_tab_bar.dart';
import 'package:flutter_gallery/src/widgets/fx_files/gridview.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class TabBarExample extends StatefulWidget {
  const TabBarExample({super.key});

  @override
  State<TabBarExample> createState() => _HomePageState();
}

class _HomePageState extends State<TabBarExample> {
  List<Screens> tabBar = [
    const Screens(
        fileName: "Defult TabBar", navigation: DefualtTabBarExample()),
    const Screens(fileName: "Inner TabBar", navigation: InnerTabBarExample()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Tab bar"),
      ),
      body: FxGridView(screens: tabBar),
    );
  }
}
