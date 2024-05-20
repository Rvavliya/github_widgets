import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/view/chip/chip_tag/chip_tag.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class ChipExample extends StatefulWidget {
  const ChipExample({super.key});

  @override
  State<ChipExample> createState() => _ChipExampleState();
}

class _ChipExampleState extends State<ChipExample> {
  final ValueNotifier<bool> _favourit = ValueNotifier<bool>(false);
  List<String> data = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Chip"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _chipWidgets(),
              const SizedBox(height: 20),
              _favouritChip(),
              const SizedBox(height: 20),
              _textFiledChip(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  /// remove chip
  Widget _chipWidgets() {
    return Row(
      children: [
        const Text(
          "Remove Chip:",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 10),
        Chip(
          deleteIcon: const Icon(Icons.close),
          onDeleted: () {
            log("delete");
          },
          label: const Text("Example"),
        ),
      ],
    );
  }

  Widget _favouritChip() {
    return Row(
      children: [
        const Text(
          "Add Remove Chip:",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 10),
        ValueListenableBuilder(
          valueListenable: _favourit,
          builder: (BuildContext context, value, Widget? child) {
            return ActionChip(
              avatar: Icon(
                  _favourit.value ? Icons.favorite : Icons.favorite_border),
              label: const Text('Save to favorites'),
              onPressed: () {
                _favourit.value = !_favourit.value;
              },
            );
          },
        ),
      ],
    );
  }

  Widget _textFiledChip() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "TextFiled To add Chip:",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 10),
        ChipTags(
          // chipPosition: ChipPosition.below,
          list: data,
          chipColor: Colors.indigo,
          iconColor: Colors.white,
          textColor: Colors.white,
          decoration: const InputDecoration(hintText: "Add To Chips"),
          keyboardType: TextInputType.text,
          createTagOnSubmit: true,
        ),
      ],
    );
  }
}
