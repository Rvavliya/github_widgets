// ignore_for_file: library_private_types_in_public_api

import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';
import 'package:image_cropper/image_cropper.dart';

class ImageCropperExample extends StatelessWidget {
  const ImageCropperExample({super.key});

  @override
  Widget build(BuildContext context) {
    final pickedFileNotifier = ValueNotifier<File?>(null);

    return Scaffold(
      appBar: const CommonAppBar(
        title: Text('File Picker and Image Cropper'),
      ),
      body: Center(
        child: ValueListenableBuilder<File?>(
          valueListenable: pickedFileNotifier,
          builder: (context, pickedFile, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                pickedFile == null
                    ? const Text('No file picked.')
                    : Image.file(
                        pickedFile,
                        height: 200,
                        width: 200,
                      ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    final result = await FilePicker.platform
                        .pickFiles(allowMultiple: false, type: FileType.image);

                    if (result != null) {
                      File? pickedFile = File(result.files.single.path!);
                      pickedFile = await _cropImage(pickedFile: pickedFile);
                      pickedFileNotifier.value = pickedFile;
                    }
                  },
                  child: const Text('Pick a File'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<File?> _cropImage({required File pickedFile}) async {
    try {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        maxWidth: 512,
        maxHeight: 512,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: Colors.indigo,
            toolbarWidgetColor: Colors.white,
            // Customize as needed
          ),
          IOSUiSettings(
            title: 'Crop Image',
            // Customize as needed
          ),
        ],
      );

      if (croppedFile != null) {
        return File(croppedFile.path);
      } else {
        return pickedFile;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
