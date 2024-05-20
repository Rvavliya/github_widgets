// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stepper_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StepperItemData _$StepperItemDataFromJson(Map<String, dynamic> json) {
  return _StepperItemData.fromJson(json);
}

/// @nodoc
mixin _$StepperItemData {
  @JsonKey(name: "id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "avtar")
  String get avtar => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: "subTitle")
  String get subTitle => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StepperItemDataCopyWith<StepperItemData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepperItemDataCopyWith<$Res> {
  factory $StepperItemDataCopyWith(
          StepperItemData value, $Res Function(StepperItemData) then) =
      _$StepperItemDataCopyWithImpl<$Res, StepperItemData>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") String id,
      @JsonKey(name: "avtar") String avtar,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "subTitle") String subTitle});
}

/// @nodoc
class _$StepperItemDataCopyWithImpl<$Res, $Val extends StepperItemData>
    implements $StepperItemDataCopyWith<$Res> {
  _$StepperItemDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? avtar = null,
    Object? title = null,
    Object? subTitle = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      avtar: null == avtar
          ? _value.avtar
          : avtar // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subTitle: null == subTitle
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StepperItemDataImplCopyWith<$Res>
    implements $StepperItemDataCopyWith<$Res> {
  factory _$$StepperItemDataImplCopyWith(_$StepperItemDataImpl value,
          $Res Function(_$StepperItemDataImpl) then) =
      __$$StepperItemDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") String id,
      @JsonKey(name: "avtar") String avtar,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "subTitle") String subTitle});
}

/// @nodoc
class __$$StepperItemDataImplCopyWithImpl<$Res>
    extends _$StepperItemDataCopyWithImpl<$Res, _$StepperItemDataImpl>
    implements _$$StepperItemDataImplCopyWith<$Res> {
  __$$StepperItemDataImplCopyWithImpl(
      _$StepperItemDataImpl _value, $Res Function(_$StepperItemDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? avtar = null,
    Object? title = null,
    Object? subTitle = null,
  }) {
    return _then(_$StepperItemDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      avtar: null == avtar
          ? _value.avtar
          : avtar // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subTitle: null == subTitle
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StepperItemDataImpl implements _StepperItemData {
  const _$StepperItemDataImpl(
      {@JsonKey(name: "id") required this.id,
      @JsonKey(name: "avtar") required this.avtar,
      @JsonKey(name: "title") required this.title,
      @JsonKey(name: "subTitle") required this.subTitle});

  factory _$StepperItemDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$StepperItemDataImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final String id;
  @override
  @JsonKey(name: "avtar")
  final String avtar;
  @override
  @JsonKey(name: "title")
  final String title;
  @override
  @JsonKey(name: "subTitle")
  final String subTitle;

  @override
  String toString() {
    return 'StepperItemData(id: $id, avtar: $avtar, title: $title, subTitle: $subTitle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StepperItemDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.avtar, avtar) || other.avtar == avtar) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, avtar, title, subTitle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StepperItemDataImplCopyWith<_$StepperItemDataImpl> get copyWith =>
      __$$StepperItemDataImplCopyWithImpl<_$StepperItemDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StepperItemDataImplToJson(
      this,
    );
  }
}

abstract class _StepperItemData implements StepperItemData {
  const factory _StepperItemData(
          {@JsonKey(name: "id") required final String id,
          @JsonKey(name: "avtar") required final String avtar,
          @JsonKey(name: "title") required final String title,
          @JsonKey(name: "subTitle") required final String subTitle}) =
      _$StepperItemDataImpl;

  factory _StepperItemData.fromJson(Map<String, dynamic> json) =
      _$StepperItemDataImpl.fromJson;

  @override
  @JsonKey(name: "id")
  String get id;
  @override
  @JsonKey(name: "avtar")
  String get avtar;
  @override
  @JsonKey(name: "title")
  String get title;
  @override
  @JsonKey(name: "subTitle")
  String get subTitle;
  @override
  @JsonKey(ignore: true)
  _$$StepperItemDataImplCopyWith<_$StepperItemDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
