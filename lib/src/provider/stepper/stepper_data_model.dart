// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'stepper_data_model.freezed.dart';
part 'stepper_data_model.g.dart';

@freezed
class StepperItemData with _$StepperItemData {
  const factory StepperItemData({
    @JsonKey(name: "id") required String id,
    @JsonKey(name: "avtar") required String avtar,
    @JsonKey(name: "title") required String title,
    @JsonKey(name: "subTitle") required String subTitle,
  }) = _StepperItemData;

  factory StepperItemData.fromJson(Map<String, dynamic> json) =>
      _$StepperItemDataFromJson(json);
}
