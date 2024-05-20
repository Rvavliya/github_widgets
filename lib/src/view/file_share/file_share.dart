// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';
import 'package:share_plus/share_plus.dart';

class FileShare extends StatelessWidget {
  const FileShare({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Share Files & Text"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () async {
                    await ShareImage._shareText();
                  },
                  icon: const Icon(Icons.share),
                ),
                const Text("Share Text"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () async {
                    await ShareImage._shareTextWithSubject();
                  },
                  icon: const Icon(Icons.share),
                ),
                const Text("Share Text With SibTitle"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () async {
                    await ShareImage._shareUri();
                  },
                  icon: const Icon(Icons.share),
                ),
                const Text("Share Uri"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () async {
                    await ShareImage._shareResult(context: context);
                  },
                  icon: const Icon(Icons.share),
                ),
                const Text("Share Result"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () async {
                    await ShareImage._shareXFile();
                  },
                  icon: const Icon(Icons.share),
                ),
                const Text("Share XFile"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ShareImage {
  static Future<void> _shareText() async {
    // share text
    Share.share("https://www.google.com/");
  }

  static Future<void> _shareTextWithSubject() async {
    //  share text with subject
    Share.share("https://www.google.com/", subject: "Hello");
  }

  static Future<void> _shareUri() async {
    // share uri
    Share.shareUri(Uri.parse("https://www.google.com/"));
  }

  static Future<void> _shareResult({required BuildContext context}) async {
    // share with result status and snackbar
    final result = await Share.shareWithResult('This is a message to share');

    if (result.status == ShareResultStatus.success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Sharing successful!'),
        ),
      );
    } else if (result.status == ShareResultStatus.dismissed) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Sharing failed with error: ${result.status.name}'),
        ),
      );
    } else if (result.status == ShareResultStatus.unavailable) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Sharing canceled'),
        ),
      );
    }
  }

  static Future<void> _shareXFile() async {
    // image with text
    final result = await Share.shareXFiles([
      XFile(
          "/Users/sarvadhi/Documents/Flutte Data/flutter authantication/flutter_gallery/assets/1.png")
    ], text: 'Great picture');

    if (result.status == ShareResultStatus.success) {
      log('Thank you for sharing the picture!');
    }
  }
}
