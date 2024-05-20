import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class BackDropEffectExample extends StatefulWidget {
  const BackDropEffectExample({super.key});

  @override
  State<BackDropEffectExample> createState() => _BackDropEffectExampleState();
}

class _BackDropEffectExampleState extends State<BackDropEffectExample> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showModelBottemSheetWidget(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Back Drop Effect"),
      ),
      body: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: const Center(
          child: Text("Back Drop Effect Example"),
        ),
      ),
    );
  }

  Future<void> showModelBottemSheetWidget({required BuildContext context}) {
    return showModalBottomSheet(
      enableDrag: false,
      useSafeArea: true,
      isScrollControlled: true,
      showDragHandle: true,
      context: context,
      isDismissible: true,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height / 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Specify Your Role",
                    ),
                    SizedBox(
                      height: 40,
                      width: double.maxFinite,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Login As Employee',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      width: double.maxFinite,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Login As HR',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
