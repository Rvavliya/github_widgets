import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gallery/src/utils/database/hive/hive_utils.dart'
    as hive_utils;
import 'package:flutter_gallery/firebase_options.dart';
import 'package:flutter_gallery/src/app.dart';
import 'package:just_audio_background/just_audio_background.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// initilzation firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // initilzation hive

  // Hive.registerAdapter<ImageInHive>(ImageInHiveAdapter());
  // final appDocumentDirectory = await getApplicationDocumentsDirectory();
  // Hive.init(appDocumentDirectory.path);
  // hiveImageBox = await Hive.openBox<ImageInHive>(HiveKeys.imageBoxName);

  // baground audio initilzation
  await JustAudioBackground.init(
    androidNotificationChannelId:
        "com.ryanheise.audioservice.AudioServiceActivity",
    androidNotificationChannelName: "Audio PlayBack",
    androidNotificationOngoing: true,
  );
  await hive_utils.HiveUtils.init();
  SystemChrome.setApplicationSwitcherDescription(
    const ApplicationSwitcherDescription(
      label: 'PDF Viewer',
    ),
  );
  runApp(const MyApp());
}
