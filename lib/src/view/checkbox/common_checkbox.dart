import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class CommonCheckBox extends StatefulWidget {
  const CommonCheckBox({super.key});

  @override
  State<CommonCheckBox> createState() => _CommonCheckBoxState();
}

class _CommonCheckBoxState extends State<CommonCheckBox> {
  final ValueNotifier<bool> _simpleCheckBox = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _checkboxListTile = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _checkboxListTile1 = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _checkBoxButton = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("CheckBox"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _checkBoxWidgets(),
            const SizedBox(height: 40),
            _checkBoxListTile(),
            const SizedBox(height: 40),
            _checkBoxButtonWidget(),
          ],
        ),
      ),
    );
  }

  Widget _checkBoxWidgets() {
    return Column(
      children: [
        const Text(
          "CheckBox",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        ValueListenableBuilder(
          valueListenable: _simpleCheckBox,
          builder: (BuildContext context, value, Widget? child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox.adaptive(
                  autofocus: true,
                  // isError: true,
                  // tristate: true, when on change funcation is null
                  activeColor: Colors.amberAccent,
                  checkColor: Colors.white,
                  value: value,
                  onChanged: (bool? value) {
                    _simpleCheckBox.value = value ?? false;
                  },
                ),
                const Text("Select Value"),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _checkBoxListTile() {
    return Column(
      children: [
        const Text(
          "CheckBox ListTile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        ValueListenableBuilder(
          valueListenable: _checkboxListTile,
          builder: (BuildContext context, value, Widget? child) {
            return CheckboxListTile.adaptive(
              // contentPadding: EdgeInsets.zero,
              subtitle: const Text("Select Box"),
              checkboxSemanticLabel: "Select Gender",
              title: const Text("Select Gender"),
              // autofocus: true,
              // isError: true,
              // tristate: true, //when on change funcation is null
              activeColor: Colors.amberAccent,
              checkColor: Colors.white,
              value: value,
              onChanged: (bool? value) {
                _checkboxListTile.value = value ?? false;
              },
            );
          },
        ),
        ValueListenableBuilder(
          valueListenable: _checkboxListTile1,
          builder: (BuildContext context, value, Widget? child) {
            return CheckboxListTile.adaptive(
              // contentPadding: EdgeInsets.zero,
              subtitle: const Text("Select Box"),
              checkboxSemanticLabel: "Select Gender",
              title: const Text("Select Gender"),
              // autofocus: true,
              // isError: true,
              // tristate: true, //when on change funcation is null
              activeColor: Colors.amberAccent,
              checkColor: Colors.white,
              value: value,
              onChanged: (bool? value) {
                _checkboxListTile1.value = value ?? false;
              },
            );
          },
        ),
      ],
    );
  }

  Widget _checkBoxButtonWidget() {
    return Column(
      children: [
        const Text(
          "CheckBox Button",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        ValueListenableBuilder(
          valueListenable: _checkBoxButton,
          builder: (BuildContext context, value, Widget? child) {
            return CheckboxMenuButton(
              value: value,
              onChanged: (value) {
                _checkBoxButton.value = value ?? false;
              },
              child: const Text("data"),
            );
          },
        ),
      ],
    );
  }
}
