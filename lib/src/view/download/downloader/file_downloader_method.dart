// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DownloadMethod {
  final progressNotifier = ValueNotifier<double?>(0);

  void startDownloading(
      {required String url, required BuildContext context}) async {
    progressNotifier.value = null;

    final request = Request('GET', Uri.parse(url));
    final StreamedResponse response = await Client().send(request);

    final contentLength = response.contentLength;

    progressNotifier.value = 0.0;

    List<int> bytes = [];

    final String fileName = url.split("/").last;
    final file = await getFile(fileName);
    if (Platform.isAndroid) {
      if (file.existsSync()) {
        progressNotifier.value = 0.0;
        Fluttertoast.showToast(
            msg: 'File already downloaded',
            backgroundColor: Colors.red,
            textColor: Colors.white);
        Navigator.pop(context);
        return;
      }
    }
    response.stream.listen(
      (List<int> newBytes) {
        bytes.addAll(newBytes);
        final downloadedLength = bytes.length;
        progressNotifier.value = (downloadedLength / contentLength!) * 100;
      },
      
      onDone: () async {
        progressNotifier.value = 100.0;

        Fluttertoast.showToast(
            msg: 'File Downloaded SuccessFully',
            backgroundColor: Colors.red,
            textColor: Colors.white);
        Navigator.pop(context);
        if (Platform.isIOS) {
          await OpenFilex.open(file.path);
        } else {
          await file.writeAsBytes(bytes);
        }
        return;
      },
      onError: (e) {
        debugPrint("Downloading error: $e");
        Fluttertoast.showToast(
            msg: 'Download Failed',
            backgroundColor: Colors.red,
            textColor: Colors.white);
        Navigator.pop(context);
      },
      cancelOnError: true,
    );
  }

  Future<File> getFile(String filename) async {
    if (Platform.isAndroid) {
      Directory downloadsDirectory = Directory('/storage/emulated/0/Download/');
      return File(join(downloadsDirectory.path, filename));
    } else {
      Directory tempDir = await getApplicationDocumentsDirectory();
      return File(join(tempDir.path, filename));
    }
  }
}
