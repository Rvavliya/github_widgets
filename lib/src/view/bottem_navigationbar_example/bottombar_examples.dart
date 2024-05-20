import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';
import 'package:flutter_gallery/src/provider/home/screens.dart';
import 'package:flutter_gallery/src/view/bottem_navigationbar_example/bottom_navigationbar_example.dart';
import 'package:flutter_gallery/src/view/bottem_navigationbar_example/salmon_bottem_navigationbar/salmon_bottem_navigationbar.dart';
import 'package:flutter_gallery/src/widgets/fx_files/gridview.dart';

class BottemNavigationBarExampleFile extends StatefulWidget {
  const BottemNavigationBarExampleFile({super.key});

  @override
  State<BottemNavigationBarExampleFile> createState() =>
      _BottemNavigationBarExampleFileState();
}

class _BottemNavigationBarExampleFileState
    extends State<BottemNavigationBarExampleFile> {
  List<Screens> bottemNavigation = [
    const Screens(
        fileName: "BottemNavigationBar",
        navigation: BottemNavigatorBarExample()),
    const Screens(
        fileName: "SalmonBottemNavigationbar",
        navigation: SalmonBottemNavigationbar()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CommonAppBar(
          title: Text("Bottem Navigationbar"),
        ),
        body: FxGridView(
          screens: bottemNavigation,
        ));
  }
}
