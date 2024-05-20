// use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/utils/database/hive/hive_utils.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gallery/src/constant/color.dart';
import 'package:flutter_gallery/src/constant/string.dart';
import 'package:flutter_gallery/src/utils/database/hive/hive_keys.dart';
import 'package:flutter_gallery/src/view/file_picker/file_preview.dart';
import 'package:image_cropper/image_cropper.dart';

class MultiFilePicker extends StatefulWidget {
  const MultiFilePicker({super.key});

  @override
  State<MultiFilePicker> createState() => _MultiFilePickerState();
}

class _MultiFilePickerState extends State<MultiFilePicker> {
  List<String> _images = [];
  final List<String> _imagesFromHive = [];

  @override
  void initState() {
    super.initState();
    // HiveUtils.clear();
    if (HiveUtils.isContainKey(HiveKeys.file) == true) {
      debugPrint("image length${_images.length}");
      debugPrint("hive files ${HiveUtils.get(HiveKeys.file)}");
    }

    if (HiveUtils.isContainKey(HiveKeys.file) == true) {
      _images = List.from(HiveUtils.get(HiveKeys.file));
    }

    debugPrint("init list$_images");
  }

  List<String> fileTypes = [
    "Single File",
    "Maltiple File",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _selectOption();
        },
        child: const Icon(Icons.add),
      ),
      appBar: const CommonAppBar(
        title: Text(Strings.images),
      ),
      body: GridView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: _images.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FilePreview(
                    imageIndex: index,
                    imagePath: _images[index],
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Hero(
                tag: index,
                child: Card(
                  elevation: 7,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child:
                          // FancyShimmerImage(
                          //   errorWidget: const SizedBox.shrink(),
                          //   imageUrl: json.encode(_images[index]),
                          //   boxFit: BoxFit.cover,
                          //   height: 70.0,
                          //   width: 70.0,
                          // ),

                          Image.file(
                        File(_images[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// pick multiple file
  // Future _pickImage() async {
  //   FilePickerResult? result =
  //       await FilePicker.platform.pickFiles(allowMultiple: true);

  //   if (result != null) {
  //     setState(() {
  //       for (var platformFile in result.files) {
  //         File file = _convertPlatformFileToFile(platformFile);
  //         _images.add(file.path);
  //       }
  //       debugPrint("image picker:: $_images");
  //     });
  //   }
  // }
  Future _pickImage() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      for (var platformFile in result.files) {
        File file = _convertPlatformFileToFile(platformFile);
        // Launch image cropper
        _cropImage(pickedFile: file);
      }
      setState(() {});
    }
  }

  /// stor multiple file in hive databse
  Future _storeImagesToHive() async {
    // HiveUtils.put(HiveKeys.file, _images);
    if (HiveUtils.get(HiveKeys.file) == true) {
      debugPrint("set file ${HiveKeys.file}");
    }
  }

  /// display file in a hive database
  Future _displayImagesFromHive() async {
    for (var key in HiveUtils.get(HiveKeys.file)) {
      _imagesFromHive.add(key);
    }

    setState(() {
      _images = _imagesFromHive;
    });
  }

  /// convert file acording to platform (android and ios)
  File _convertPlatformFileToFile(PlatformFile platformFile) {
    return File(platformFile.path!);
  }

  Future _selectOption() {
    return showAdaptiveDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog.adaptive(
          elevation: 0,
          title: Text(
            "Select file picker types",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          content: Padding(
            padding: const EdgeInsets.only(top: 10).r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                fileTypes.length,
                (index) => GestureDetector(
                  onTap: () async {
                    index == 1
                        ? {
                            Navigator.pop(context),
                            await _pickImage(),
                            await _storeImagesToHive(),
                            await _displayImagesFromHive(),
                          }
                        : Navigator.pop(context);
                    await _singlePickImage();
                    await _singleStoreImagesToHive();
                    await _singleDisplayImagesFromHive();
                  },
                  child: Container(
                    height: 30.h,
                    width: 80.w,
                    decoration: const BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Center(
                        child: Text(
                      fileTypes[index],
                      style: const TextStyle(color: ConstColor.white),
                    )),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// single file picker
  Future _singlePickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      onFileLoading: (value) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Wait for Loading..."),
          ),
        );
      },

      /// add extention name
      // allowedExtensions: ['jpg', 'pdf', 'doc'],
    );

    if (result != null) {
      setState(() {
        for (var platformFile in result.files) {
          File file = _singleConvertPlatformFileToFile(platformFile);
          _images.add(file.path);
        }
        debugPrint(" image file:- $_images");
      });
    }
  }

  /// stor file in hive databse
  Future _singleStoreImagesToHive() async {
    if (HiveUtils.get(HiveKeys.file) == true) {
      for (var i = 0; i < _images.length; i++) {
        if (_images[i] == _images[i]) {
          log("same:: ${_images[i]}");
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("File already exists"),
            ),
          );
        } else {
          HiveUtils.set(HiveKeys.file, _images);
        }
      }
    } else {
      debugPrint("selected reject");
    }
    debugPrint("file get :- ${HiveUtils.get(HiveKeys.file)}");
  }

  /// display file in a hive database
  Future _singleDisplayImagesFromHive() async {
    setState(
      () {
        if (HiveUtils.get(HiveKeys.file) == true) {
          _images = List.from(HiveUtils.get(HiveKeys.file));
        }
      },
    );
    debugPrint("display file :: $_images");
  }

  /// convert file acording to platform (android and ios)
  File _singleConvertPlatformFileToFile(PlatformFile platformFile) {
    return File(platformFile.path!);
  }

  Future<String> encodeFile(File file) async {
    final bytes = await file.readAsBytes();
    return base64.encode(bytes);
  }

  String base64ImageUrl(File file) {
    final encodedData = encodeFile(file);
    return 'data:image/${file.path.split('.').last};base64,$encodedData';
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
