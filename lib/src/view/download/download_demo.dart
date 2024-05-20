// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

class ImageDownload extends StatefulWidget {
  const ImageDownload({super.key});

  @override
  State<ImageDownload> createState() => _ImageDownloadState();
}

class _ImageDownloadState extends State<ImageDownload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Image Download"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Prees To Download File"),
            IconButton(
              onPressed: () {
                // Example of Downloaded
                if (Platform.isAndroid) {
                  fileDownloadAndSaveForAndroid(
                      context: context,
                      fileUrl:
                          "https://st2.depositphotos.com/1265075/11464/i/450/depositphotos_114649452-stock-photo-demo-sign-on-red-cubes.jpg");
                } else {
                  downloadFileForIos(
                      context: context,
                      url:
                          "https://st2.depositphotos.com/1265075/11464/i/450/depositphotos_114649452-stock-photo-demo-sign-on-red-cubes.jpg");
                }
              },
              icon: const Icon(Icons.download),
            ),
          ],
        ),
      ),
    );
  }
}

/// download and store file for android

Future<void> fileDownloadAndSaveForAndroid(
    {required String fileUrl, required BuildContext context}) async {
  final response = await http.get(Uri.parse(fileUrl));
  if (response.contentLength == 0) {
    return Future.value(null);
  }
  try {
    if (response.statusCode == 200) {
      // Get the downloads directory
      Directory downloadsDirectory = Directory('/storage/emulated/0/Download/');
      final fileName = fileUrl.split("/").last;
      final File file = File('${downloadsDirectory.path}/$fileName');
      if (file.existsSync()) {
        Navigator.pop(context);
        Fluttertoast.showToast(
            msg: 'File already downloaded',
            backgroundColor: Colors.red,
            textColor: Colors.white);

        return;
      }
      // Write the PDF content to the file
      await file.writeAsBytes(response.bodyBytes);
      Navigator.pop(context);

      Fluttertoast.showToast(
          msg: 'File downloaded',
          backgroundColor: Colors.green,
          textColor: Colors.white);
    } else {
      Fluttertoast.showToast(
          msg: 'Something went Wrong',
          backgroundColor: Colors.green,
          textColor: Colors.white);
    }
  } catch (e) {
    Navigator.pop(context);
    Fluttertoast.showToast(
        msg: 'Something went Wrong',
        backgroundColor: Colors.green,
        textColor: Colors.white);
  }
}

/// ios file open for http
Future<File> downloadFileForIos(
    {required String url, required BuildContext context}) async {
  try {
    Uri uri = Uri.parse(url); // Parse the full URL
    Directory tempDir = await getApplicationDocumentsDirectory();
    String tempPath = tempDir.path;
    final downloadedFile = File('$tempPath/${uri.pathSegments.last}');
    if (await downloadedFile.exists()) {
      Navigator.pop(context);
      await OpenFilex.open(downloadedFile.path);
      return downloadedFile;
    }
    final http.Response response = await http.get(uri);
    if (response.contentLength == 0) {
      // Handle case where content length is 0 if needed
    }
    File file = File('$tempPath/${uri.pathSegments.last}');
    await file.writeAsBytes(response.bodyBytes);
    Navigator.pop(context);
    await OpenFilex.open(file.path);
    return file;
  } catch (e) {
    log(e.toString());
    // Handle the error if needed
    rethrow; // Rethrow the exception to propagate it further
  }
}
