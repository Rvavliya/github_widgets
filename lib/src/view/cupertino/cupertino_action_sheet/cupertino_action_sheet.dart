import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoActionSheerExample extends StatefulWidget {
  const CupertinoActionSheerExample({super.key});

  @override
  State<CupertinoActionSheerExample> createState() =>
      _CupertinoActionSheerExampleState();
}

class _CupertinoActionSheerExampleState
    extends State<CupertinoActionSheerExample> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("ActionSheet"),
      ),
      child: Center(
        child: ElevatedButton(
          // autofocus: true,
          // clipBehavior: Clip.none,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo,
            elevation: 2,
          ),
          onPressed: () {
            _showActionSheet(context);
          },
          child: const Text(
            "Cupertino ActionSheet",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  void _showActionSheet(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Title'),
        message: const Text('Message'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            /// This parameter indicates the action would be a default
            /// default behavior, turns the action's text to bold text.
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Default Action'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Action'),
          ),
          CupertinoActionSheetAction(
            isDefaultAction: true,
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Destructive Action'),
          ),
        ],
      ),
    );
  }
}
