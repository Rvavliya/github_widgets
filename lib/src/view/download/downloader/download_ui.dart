import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/view/download/downloader/file_downloader_method.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class DownloadedFile extends StatefulWidget {
  const DownloadedFile({super.key});

  @override
  State<DownloadedFile> createState() => _DownloadedFileState();
}

class _DownloadedFileState extends State<DownloadedFile> {
  final manager = DownloadMethod();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          manager.startDownloading(
              url:
                  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
              context: context);
        },
        child: const Icon(Icons.download),
      ),
      appBar: const CommonAppBar(
        title: Text("Download"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ValueListenableBuilder<double?>(
          valueListenable: manager.progressNotifier,
          builder: (context, percent, child) {
            final progress = (percent ?? 0 * 1).toStringAsFixed(2);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$progress%",
                  style: const TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 10),
                LinearProgressIndicator(
                  semanticsValue: percent.toString(),
                  semanticsLabel: percent.toString(),
                  value: double.parse(progress) / 100,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
