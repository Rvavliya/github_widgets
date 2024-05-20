import 'package:flutter/cupertino.dart';

class CupertinoButtonsExample extends StatefulWidget {
  const CupertinoButtonsExample({super.key});

  @override
  State<CupertinoButtonsExample> createState() =>
      _CupertinoButtonsExampleState();
}

class _CupertinoButtonsExampleState extends State<CupertinoButtonsExample> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(

        middle: Text(
          'CupertinoButton',
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const CupertinoButton(
              onPressed: null,
              child: Text('Disabled'),
            ),
            const SizedBox(height: 30),
            const CupertinoButton.filled(
              onPressed: null,
              child: Text('Disabled'),
            ),
            const SizedBox(height: 30),
            CupertinoButton(
              onPressed: () {},
              child: const Text('Enabled'),
            ),
            const SizedBox(height: 30),
            CupertinoButton.filled(
              onPressed: () {},
              child: const Text('Enabled'),
            ),
          ],
        ),
      ),
    );
  }
}
