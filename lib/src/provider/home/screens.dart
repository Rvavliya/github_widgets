// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'screens.freezed.dart';
part 'screens.g.dart';

@freezed
class Screens with _$Screens {
  const factory Screens({
    @JsonKey(name: "fileName") required String fileName,
    @JsonKey(name: "navigation") required dynamic navigation,
  }) = _Screens;

  factory Screens.fromJson(Map<String, dynamic> json) =>
      _$ScreensFromJson(json);
}
