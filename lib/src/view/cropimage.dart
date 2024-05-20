// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:file_picker/file_picker.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   File? _imageFile;

//   Future<void> _pickImage() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.image,
//     );

//     if (result != null && result.files.isNotEmpty) {
//       _cropImage(File(result.files.single.path!));
//     }
//   }

//   Future<void> _cropImage(File imageFile) async {
//     CroppedFile? croppedFile = await ImageCropper.platform.cropImage(
//       sourcePath: imageFile.path,
//       aspectRatioPresets: [
//         CropAspectRatioPreset.square,
//         CropAspectRatioPreset.ratio3x2,
//         CropAspectRatioPreset.original,
//         CropAspectRatioPreset.ratio4x3,
//         CropAspectRatioPreset.ratio16x9,
//       ],
//       uiSettings: [
//         AndroidUiSettings(
//           toolbarTitle: 'Crop Image',
//           toolbarColor: Colors.deepOrange,
//           toolbarWidgetColor: Colors.white,
//           initAspectRatio: CropAspectRatioPreset.original,
//           lockAspectRatio: false,
//         ),
//         IOSUiSettings(
//           minimumAspectRatio: 1.0,
//         ),
//       ],
//     );

//     if (croppedFile != null) {
//       setState(() {
//         _imageFile = croppedFile;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CommonAppBar(
//         title: const Text('Image Cropper'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             _imageFile != null
//                 ? Image.file(_imageFile!)
//                 : const Text('Pick an image and crop it.'),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 _pickImage();
//               },
//               child: const Text('Pick Image'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
