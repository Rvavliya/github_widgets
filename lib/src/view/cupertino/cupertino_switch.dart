import 'package:flutter/cupertino.dart';

class CupertinoSwitchExample extends StatefulWidget {
  const CupertinoSwitchExample({super.key});

  @override
  State<CupertinoSwitchExample> createState() => _CupertinoSwitchExampleState();
}

class _CupertinoSwitchExampleState extends State<CupertinoSwitchExample> {
  ValueNotifier<bool> switchValue = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('CupertinoSwitch'),
      ),
      child: ValueListenableBuilder(
        valueListenable: switchValue,
        builder: (BuildContext context, bool value, Widget? child) => Center(
          child: CupertinoSwitch(
            // This bool value toggles the switch.
            value: switchValue.value,
            activeColor: CupertinoColors.activeBlue,
            onChanged: (bool? value) {
              // This is called when the user toggles the switch.

              switchValue.value = value!;
            },
          ),
        ),
      ),
    );
  }
}
