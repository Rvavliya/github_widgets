import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/constant/const.dart';

/// dropdown_button2 package

class SimpaleStyleDropDown extends StatelessWidget {
  const SimpaleStyleDropDown({super.key});
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<String?> dropDownBtn = ValueNotifier<String?>(null);
    return Column(
      children: [
        const Text(
          "Simple style DropDown Button",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        ValueListenableBuilder(
          valueListenable: dropDownBtn,
          builder: (BuildContext context, value, Widget? child) {
            return DropdownButtonHideUnderline(
              child: DropdownButton2<String?>(
                isExpanded: true,
                hint: Text(
                  'Select Item',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                value: dropDownBtn.value,
                items: list
                    .map((String item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                onChanged: (String? value) {
                  dropDownBtn.value = value;
                },
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 40,
                  width: 140,
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
