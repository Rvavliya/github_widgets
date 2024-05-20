import 'package:hive/hive.dart';
import 'dart:convert';

part 'store_image.g.dart';

@HiveType(typeId: 1)
class ImageInHive {
  @HiveField(1)
  final List<String>? imagePath;
  ImageInHive({
    this.imagePath,
  });

  factory ImageInHive.fromRawJson(String str) =>
      ImageInHive.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ImageInHive.fromJson(Map<String, dynamic> json) => ImageInHive(
        imagePath: json["image_path"],
      );

  Map<String, dynamic> toJson() => {
        "image_path": imagePath,
      };
}
