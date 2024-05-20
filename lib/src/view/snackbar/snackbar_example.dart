import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/provider/home/screens.dart';
import 'package:flutter_gallery/src/view/snackbar/awsome_snackbar_example.dart';
import 'package:flutter_gallery/src/view/snackbar/elegant_notification.dart';
import 'package:flutter_gallery/src/view/snackbar/top_snackbar.dart';
import 'package:flutter_gallery/src/widgets/fx_files/gridview.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class SnackBarExample extends StatefulWidget {
  const SnackBarExample({super.key});

  @override
  State<SnackBarExample> createState() => _SnackBarExampleState();
}

class _SnackBarExampleState extends State<SnackBarExample> {
  final List<Screens> _snackBar = [
    const Screens(fileName: "Top SnackBar", navigation: TopSnackBarExample()),
    const Screens(
        fileName: "Awsome SnackBar", navigation: AwsomeSnackBarExample()),
    const Screens(
        fileName: "Elegant Notification",
        navigation: ElegantNotificationExample()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Snack Bar"),
      ),
      body: FxGridView(screens: _snackBar),
    );
  }
}
