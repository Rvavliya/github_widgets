import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/constant/const.dart';

class MultiselectDropdownwithCheckboxes extends StatefulWidget {
  const MultiselectDropdownwithCheckboxes({super.key});

  /// dropdown_button2 package
  @override
  State<MultiselectDropdownwithCheckboxes> createState() =>
      _MultiselectDropdownwithCheckboxesState();
}

class _MultiselectDropdownwithCheckboxesState
    extends State<MultiselectDropdownwithCheckboxes> {
  final List<String> _selectedItems = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "DropDownButton with checkbox",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: Text(
              'Select Items',
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).hintColor,
              ),
            ),
            items: list.map((item) {
              return DropdownMenuItem(
                value: item,
                //disable default onTap to avoid closing menu when selecting an item
                enabled: false,
                child: StatefulBuilder(
                  builder: (context, menuSetState) {
                    final isSelected = _selectedItems.contains(item);
                    return InkWell(
                      onTap: () {
                        isSelected
                            ? _selectedItems.remove(item)
                            : _selectedItems.add(item);
                        //This rebuilds the StatefulWidget to update the button's text
                        setState(() {});
                        //This rebuilds the dropdownMenu Widget to update the check mark
                        menuSetState(() {});
                      },
                      child: Container(
                        height: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            if (isSelected)
                              const Icon(Icons.check_box_outlined)
                            else
                              const Icon(Icons.check_box_outline_blank),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }).toList(),
            //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
            value: _selectedItems.isEmpty ? null : _selectedItems.last,
            onChanged: (value) {},
            selectedItemBuilder: (context) {
              return list.map(
                (item) {
                  return Container(
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      _selectedItems.join(', '),
                      style: const TextStyle(
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                  );
                },
              ).toList();
            },
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.only(left: 16, right: 8),
              height: 40,
              width: 140,
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
              padding: EdgeInsets.zero,
            ),
          ),
        ),
      ],
    );
  }
}
