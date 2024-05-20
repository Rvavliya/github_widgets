import 'package:flutter/cupertino.dart';
import 'package:flutter_gallery/src/provider/home/screens.dart';
import 'package:flutter_gallery/src/view/cupertino/cupertino_action_sheet/cupertino_action_sheet.dart';
import 'package:flutter_gallery/src/view/cupertino/cupertino_alert_diloag.dart';
import 'package:flutter_gallery/src/view/cupertino/cupertino_buttons.dart';
import 'package:flutter_gallery/src/view/cupertino/cupertino_contextmenu.dart';
import 'package:flutter_gallery/src/view/cupertino/cupertino_list_section.dart';
import 'package:flutter_gallery/src/view/cupertino/cupertino_picker.dart';
import 'package:flutter_gallery/src/view/cupertino/cupertino_switch.dart';
import 'package:flutter_gallery/src/view/cupertino/searchfiled/cupertino_searchfiled.dart';
import 'package:flutter_gallery/src/widgets/fx_files/gridview.dart';

class CupertinoExample extends StatefulWidget {
  const CupertinoExample({super.key});

  @override
  State<CupertinoExample> createState() => _CupertinoExampleState();
}

class _CupertinoExampleState extends State<CupertinoExample> {
  final List<Screens> _cupertinoExample = [
    const Screens(
      fileName: "ActionSheet",
      navigation: CupertinoActionSheerExample(),
    ),
    const Screens(
        fileName: "SearchTextFiled",
        navigation: CupertinoSearchTextFiledExample()),
    const Screens(
        fileName: "AlertDilog Box",
        navigation: CupertinoAlertDilogBoxExample()),
    const Screens(fileName: "Buttons", navigation: CupertinoButtonsExample()),
    const Screens(
        fileName: "Context Menu", navigation: CupertinoContextMenuExample()),
    const Screens(
        fileName: "List Section", navigation: CupertinoListSectionExample()),
    const Screens(
        fileName: "Cupertino Picker", navigation: CupertinoPickerExample()),
    const Screens(fileName: "Switch", navigation: CupertinoSwitchExample()),
  ];
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Cupertino Example"),
      ),
      child: FxGridView(screens: _cupertinoExample),
    );
  }
}
