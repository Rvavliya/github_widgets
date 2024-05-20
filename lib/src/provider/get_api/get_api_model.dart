import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_api_model.freezed.dart';
part 'get_api_model.g.dart';

@freezed
class GetapiModel with _$GetapiModel {
  const factory GetapiModel({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) = _GetapiModel;

  factory GetapiModel.fromJson(Map<String, dynamic> json) =>
      _$GetapiModelFromJson(json);
}
