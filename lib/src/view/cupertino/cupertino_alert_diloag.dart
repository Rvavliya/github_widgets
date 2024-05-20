import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoAlertDilogBoxExample extends StatefulWidget {
  const CupertinoAlertDilogBoxExample({super.key});

  @override
  State<CupertinoAlertDilogBoxExample> createState() =>
      CupertinoAlertDilogBoxExampleState();
}

class CupertinoAlertDilogBoxExampleState
    extends State<CupertinoAlertDilogBoxExample> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Alert Dialog"),
      ),
      child: Center(
        child: ElevatedButton(
          autofocus: true,
          // clipBehavior: Clip.none,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo,
            elevation: 2,
          ),
          onPressed: () {
            _showAlertDialog(context);
          },
          child: const Text(
            "Alert Dialog",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Alert'),
        content: const Text('Proceed with destructive action?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }
}
