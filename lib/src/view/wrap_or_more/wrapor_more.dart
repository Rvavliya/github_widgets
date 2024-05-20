import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/constant/const.dart';
import 'package:flutter_gallery/src/view/wrap_or_more/wrap_and_more.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class WrapOrMoreExample extends StatefulWidget {
  const WrapOrMoreExample({super.key});

  @override
  State<WrapOrMoreExample> createState() => _WrapOrMoreExampleState();
}

class _WrapOrMoreExampleState extends State<WrapOrMoreExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Wrap or mor ex:-+4"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          WrapAndMore(
            maxRow: 2,
            spacing: 8.0,
            runSpacing: 8.0,
            overflowWidget: (restChildrenCount) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '+ $restChildrenCount more',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
            children: list
                .map((e) => Text(
                      e,
                      style: const TextStyle(color: Colors.indigo),
                    ))
                .toList(),
          )
        ]),
      ),
    );
  }
}
