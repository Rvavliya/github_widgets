import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/widgets/fx_files/button.dart';
import 'package:flutter_gallery/src/widgets/snackbar/elegant_notification/elegant_notification.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class ElegantNotificationExample extends StatefulWidget {
  const ElegantNotificationExample({super.key});

  @override
  State<ElegantNotificationExample> createState() =>
      _ElegantNotificationExampleState();
}

class _ElegantNotificationExampleState
    extends State<ElegantNotificationExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Elegant Notification"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstButton(
              buttonName: "Success",
              onTap: () {
                ElegantNotification.success(
                  title: const Text("Success"),
                  description: const Text("Your data has been updated"),
                  onDismiss: () {
                    log('Message when the notification is dismissed');
                  },
                  onTap: () {
                    log('Message when the notification is pressed');
                  },
                  closeOnTap: true,
                ).show(context);
              },
            ),
            const SizedBox(height: 20),
            ConstButton(
              buttonName: "Error",
              onTap: () {
                ElegantNotification.error(
                  title: const Text("Error"),
                  description: const Text("Please verifiy your data"),
                  onDismiss: () {
                    log('Message when the notification is dismissed');
                  },
                  onTap: () {
                    log('Message when the notification is pressed');
                  },
                  closeOnTap: true,
                ).show(context);
              },
            ),
            const SizedBox(height: 20),
            ConstButton(
              buttonName: "info",
              onTap: () {
                ElegantNotification.info(
                  title: const Text("Info"),
                  description: const Text(
                      "A new version is available to you please update."),
                  onDismiss: () {
                    log('Message when the notification is dismissed');
                  },
                  onTap: () {
                    log('Message when the notification is pressed');
                  },
                  closeOnTap: true,
                ).show(context);
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
