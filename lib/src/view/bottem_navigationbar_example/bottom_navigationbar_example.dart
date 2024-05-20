import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class BottemNavigatorBarExample extends StatefulWidget {
  const BottemNavigatorBarExample({super.key});

  @override
  State<BottemNavigatorBarExample> createState() =>
      _BottemNavigatorBarExampleState();
}

class _BottemNavigatorBarExampleState extends State<BottemNavigatorBarExample> {
  final ValueNotifier<int> _isTrue = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Bottem Navigatation Bar"),
      ),
      body: const Column(children: []),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: _isTrue,
        builder: (BuildContext context, value, Widget? child) {
          return BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_sharp),
                label: "Contact",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: "Notification",
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
