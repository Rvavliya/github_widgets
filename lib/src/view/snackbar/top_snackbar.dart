import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/widgets/fx_files/button.dart';
import 'package:flutter_gallery/src/widgets/snackbar/top_snackbar/top_snackbar_path.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class TopSnackBarExample extends StatefulWidget {
  const TopSnackBarExample({super.key});

  @override
  State<TopSnackBarExample> createState() => _TopSnackBarExampleState();
}

class _TopSnackBarExampleState extends State<TopSnackBarExample> {
  late AnimationController localAnimationController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Top SnackBar"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstButton(
              color: Colors.green,
              buttonName: "Success",
              onTap: () {
                showTopSnackBar(
                  Overlay.of(context),
                  const CustomSnackBar.success(
                    message:
                        "Good job, your release is successful. Have a nice day",
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            ConstButton(
              color: Colors.indigo,
              buttonName: "Info",
              onTap: () {
                showTopSnackBar(
                  Overlay.of(context),
                  const CustomSnackBar.info(
                    message:
                        "There is some information. You need to do something with that",
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            ConstButton(
              color: Colors.red,
              buttonName: "Error",
              onTap: () {
                showTopSnackBar(
                  Overlay.of(context),
                  const CustomSnackBar.error(
                    message:
                        "Something went wrong. Please check your credentials and try again",
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            TapBounceContainer(
              onTap: () {
                showTopSnackBar(
                  Overlay.of(context),
                  const CustomSnackBar.info(
                    message: "Persistent SnackBar",
                  ),
                  persistent: true,
                  onAnimationControllerInit: (controller) =>
                      localAnimationController = controller,
                );
              },
              child: buildButton(text: "Show persistent SnackBar"),
            ),
            const SizedBox(height: 20),
            TapBounceContainer(
              onTap: () => localAnimationController.reverse(),
              child: buildButton(text: "Dismiss"),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton({
    String? text,
    IconData? icon,
    VoidCallback? onClicked,
  }) =>
      ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
        ),
        icon: Icon(icon, size: 26),
        label: Text(
          text!,
          style: const TextStyle(fontSize: 20),
        ),
        onPressed: onClicked,
      );
}
