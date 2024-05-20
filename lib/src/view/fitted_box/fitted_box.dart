import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class FittedBoxExample extends StatelessWidget {
  const FittedBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text('Fitted Box'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Without FittedBox Example
            const Text("Without FittedBox Example"),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.green)),
              width: 80,
              height: 20,
              child: const Text('This is exeedefeefeuheuyyuplanation'),
            ),

            const SizedBox(height: 12),

            // With FittedBox
            // use : FittedBox is a very useful widget that scales and positions its child within itself according to fit and alignment.
            const Text("FittedBox Example"),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.green),
              ),
              width: 360,
              height: 500,
              child: const FittedBox(
                child: Text(
                  'This is explajnjwebjbjbkjbbjbin',
                  locale: Locale("en", "gu"),
                  maxLines: 1,
                  softWrap: false,
                ),
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
