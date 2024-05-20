import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';
import 'package:flutter_gallery/src/view/bottem_navigationbar_example/salmon_bottem_navigationbar/salmon_bottem_navigationbar_package.dart';

class SalmonBottemNavigationbar extends StatefulWidget {
  const SalmonBottemNavigationbar({super.key});

  @override
  State<SalmonBottemNavigationbar> createState() =>
      _BottemNavigatorBarExampleState();
}

class _BottemNavigatorBarExampleState extends State<SalmonBottemNavigationbar> {
  final ValueNotifier<int> _isTrue = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Bottem Navigatation Bar"),
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: _isTrue,
        builder: (BuildContext context, value, Widget? child) {
          return SalomonBottomBar(
            items: [
              SalomonBottomBarItem(
                icon: const Icon(Icons.home),
                title: const Text("Home"),
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.account_circle_sharp),
                title: const Text("Contact"),
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.notifications),
                title: const Text("Notification"),
              ),
            ],
            currentIndex: _isTrue.value,
            onTap: (value) {
              _isTrue.value = value;
            },
          );
        },
      ),
    );
  }
}
