import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/constant/string.dart';
import 'package:flutter_gallery/src/widgets/fx_files/text_form_filed.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class DiloagBoxExample extends StatefulWidget {
  const DiloagBoxExample({super.key});

  @override
  State<DiloagBoxExample> createState() => _DiloagBoxExampleState();
}

class _DiloagBoxExampleState extends State<DiloagBoxExample> {
  // ProgressDialog pd = ProgressDialog(context: BuildContext);
  final TextEditingController _feedBack = TextEditingController();
  final GlobalKey<FormState> _feedBackKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("DiloagBox"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              textColor: Colors.white,
              color: Colors.indigo,
              onPressed: () {
                showDiloagWidget();
              },
              child: const Text("Open DiloagBox"),
            ),
            const SizedBox(height: 20),
            MaterialButton(
              textColor: Colors.white,
              color: Colors.indigo,
              onPressed: () {
                showDiloagWithFormWidget();
              },
              child: const Text("Show DiloagWith Form"),
            ),
            const SizedBox(height: 20),
            MaterialButton(
              textColor: Colors.white,
              color: Colors.indigo,
              onPressed: () {
                conformationDilog();
              },
              child: const Text("Conformation DiloagBox"),
            ),
            const SizedBox(height: 20),
            MaterialButton(
              textColor: Colors.white,
              color: Colors.indigo,
              onPressed: () {
                congratulationDilog();
              },
              child: const Text("Congratulation Diloag"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showDiloagWidget() {
    return showAdaptiveDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          title: const Text('Dialog Title'),
          content: const Text('This is the content of the dialog.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> showDiloagWithFormWidget() {
    return showAdaptiveDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          title: const Text('Dialog With Form'),
          content: Form(
            key: _feedBackKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                const Text("FeedBack",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Material(
                  color: Colors.transparent,
                  child: CommonTextFormField(
                    onChanged: (value) {},
                    // inputFormatters: [PriceTextInputFormatter()],
                    hintText: "FeedBack!",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return Strings.enterFirsttName;
                      } else {
                        return null;
                      }
                    },
                    controller: _feedBack,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            MaterialButton(
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              disabledColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                if (_feedBackKey.currentState!.validate()) {
                  Navigator.of(context).pop();
                }
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> conformationDilog() {
    return showAdaptiveDialog(
      barrierColor: Colors.amber,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          title: const Text('Dialog Title'),
          content: const Text('This is the content of the dialog.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancle'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> congratulationDilog() {
    return showAdaptiveDialog(
      barrierColor: Colors.amber,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          title: const Text('Congratulation'),
          content: Image.asset(
            "assets/gif/Confetti.gif",
            height: 100,
            width: 100,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Done'),
            ),
          ],
        );
      },
    );
  }
}
