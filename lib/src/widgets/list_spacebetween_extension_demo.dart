import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/utils/extentaion.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class ListSpaceBetweenExtensionExample extends StatefulWidget {
  const ListSpaceBetweenExtensionExample({super.key});

  @override
  State<ListSpaceBetweenExtensionExample> createState() =>
      _ListSpaceBetweenExtensionExampleState();
}

class _ListSpaceBetweenExtensionExampleState
    extends State<ListSpaceBetweenExtensionExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text('List Space Between Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              radius: 100,
              onTap: () async {},
              child: Container(
                height: 100.0,
                width: 100.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text('Enter your name'),
              ),
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text('Enter your phone number'),
              ),
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text('Enter your age'),
              ),
              textInputAction: TextInputAction.next,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Save'),
            )
          ].withSpaceBetween(height: 18),
        ),
      ),
    );
  }
}
