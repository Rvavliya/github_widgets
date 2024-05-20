// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/view/textFileds/text_form_fileds.dart';

class MyExpandableContainer extends StatefulWidget {
  const MyExpandableContainer({super.key});

  @override
  _MyExpandableContainerState createState() => _MyExpandableContainerState();
}

class _MyExpandableContainerState extends State<MyExpandableContainer> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            height:
                isExpanded ? MediaQuery.sizeOf(context).height - 150 : 300.0,
            color: Colors.blue, // Set your desired background color
            child: const Center(child: TextFormFieldsScreen()),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Text(isExpanded ? 'Collapse' : 'Expand'),
          ),
        ],
      ),
    );
  }
}
