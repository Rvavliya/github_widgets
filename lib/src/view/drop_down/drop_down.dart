import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/constant/const.dart';
import 'package:flutter_gallery/src/utils/extentaion.dart';
import 'package:flutter_gallery/src/view/drop_down/form_dropdown.dart';
import 'package:flutter_gallery/src/view/drop_down/image_dropdown.dart';
import 'package:flutter_gallery/src/view/drop_down/multiselect_dropdown_with_checkboxes.dart';
import 'package:flutter_gallery/src/view/drop_down/searchable_dropdown.dart';
import 'package:flutter_gallery/src/view/drop_down/simpale_style_dropdown.dart';
import 'package:flutter_gallery/src/view/drop_down/styling_customization_dropdown.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({super.key});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  final ValueNotifier<String> _filter = ValueNotifier<String>("open");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("DropDown"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _dropDownBtn(),
              sizedBox(),
              _dropdownButtonFormFiled(),
              sizedBox(),
              const SimpaleStyleDropDown(),
              sizedBox(),
              const StylingCustomization(),
              sizedBox(),
              const MultiselectDropdownwithCheckboxes(),
              sizedBox(),
              const SearchableDropDown(),
              sizedBox(),
              const ImageDropdown(),
              sizedBox(),
              const FormDropDown(),
            ],
          ),
        ),
      ),
    );
  }

  /// dropdown button
  Widget _dropDownBtn() {
    return Column(
      children: [
        const Text(
          "DropDown Button",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        ValueListenableBuilder<String>(
          valueListenable: _filter,
          builder: (BuildContext context, String value, Widget? child) {
            return DropdownButton<String>(
              value: value,
              items: list
                  .map((item) =>
                      DropdownMenuItem<String>(value: item, child: Text(item)))
                  .toList(),
              onChanged: (value) {
                _filter.value = value!;
              },
            );
          },
        ),
      ],
    );
  }

  ///Sized box
  Widget sizedBox() {
    return const SizedBox(height: 40);
  }

  /// dropdownButtonFomrFiled
  Widget _dropdownButtonFormFiled() {
    return Column(
      children: [
        const Text(
          "Dropdown Button FormFiled",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(border: InputBorder.none),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return "GloablString.selectTagName";
              }
              return null;
            },
            value: list.first,
            items: list.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value.capitalizeFirst()),
              );
            }).toList(),
            onChanged: (String? value) {
              // _priorityController.text = value ?? _priority.first;
            },
          ),
        ),
      ],
    );
  }
}
