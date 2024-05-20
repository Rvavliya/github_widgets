import 'dart:developer';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:home_widget/home_widget.dart';
import 'package:flutter_gallery/src/constant/string.dart';

class HomeWidgets extends StatefulWidget {
  const HomeWidgets({super.key});

  @override
  State<HomeWidgets> createState() => _HomeWidgetsState();
}

class _HomeWidgetsState extends State<HomeWidgets> {
  @override
  void initState() {
    super.initState();
    HomeWidget.setAppGroupId(Strings.appGroupId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _updateWidget(),
          child: const Text("Update"),
        ),
      ),
    );
  }
}

_updateWidget() {
  HomeWidget.saveWidgetData<String>("title", 'Flutter');
  HomeWidget.saveWidgetData<String>("description", 'Home Widget');
  HomeWidget.updateWidget(iOSName: Strings.iOSWidgetName);
  log("press");
}
