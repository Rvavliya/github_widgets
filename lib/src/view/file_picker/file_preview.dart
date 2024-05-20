import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter_gallery/src/constant/color.dart';
import 'package:flutter_gallery/src/constant/string.dart';

final download = ValueNotifier<double>(0);

class FilePreview extends StatefulWidget {
  final int imageIndex;
  final String imagePath;
  const FilePreview(
      {super.key, required this.imageIndex, required this.imagePath});

  @override
  State<FilePreview> createState() => _FilePreviewState();
}

class _FilePreviewState extends State<FilePreview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: const Text(Strings.filePreview),
        actions: [
          IconButton(
            onPressed: () async {},
            icon: const Icon(Icons.download),
          ),
        ],
      ),
      body: Hero(
        tag: widget.imageIndex,
        child: PhotoView(
          imageProvider: FileImage(File.fromUri(Uri.parse(widget.imagePath))),
          backgroundDecoration: const BoxDecoration(
            color: ConstColor.transparent,
          ),
        ),
      ),
    );
  }
}
