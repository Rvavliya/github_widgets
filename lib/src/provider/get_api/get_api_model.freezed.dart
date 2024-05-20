// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetapiModel _$GetapiModelFromJson(Map<String, dynamic> json) {
  return _GetapiModel.fromJson(json);
}

/// @nodoc
mixin _$GetapiModel {
  int? get userId => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get body => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetapiModelCopyWith<GetapiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetapiModelCopyWith<$Res> {
  factory $GetapiModelCopyWith(
          GetapiModel value, $Res Function(GetapiModel) then) =
      _$GetapiModelCopyWithImpl<$Res, GetapiModel>;
  @useResult
  $Res call({int? userId, int? id, String? title, String? body});
}

/// @nodoc
class _$GetapiModelCopyWithImpl<$Res, $Val extends GetapiModel>
    implements $GetapiModelCopyWith<$Res> {
  _$GetapiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? id = freezed,
    Object? title = freezed,
    Object? body = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetapiModelImplCopyWith<$Res>
    implements $GetapiModelCopyWith<$Res> {
  factory _$$GetapiModelImplCopyWith(
          _$GetapiModelImpl value, $Res Function(_$GetapiModelImpl) then) =
      __$$GetapiModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? userId, int? id, String? title, String? body});
}

/// @nodoc
class __$$GetapiModelImplCopyWithImpl<$Res>
    extends _$GetapiModelCopyWithImpl<$Res, _$GetapiModelImpl>
    implements _$$GetapiModelImplCopyWith<$Res> {
  __$$GetapiModelImplCopyWithImpl(
      _$GetapiModelImpl _value, $Res Function(_$GetapiModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? id = freezed,
    Object? title = freezed,
    Object? body = freezed,
  }) {
    return _then(_$GetapiModelImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetapiModelImpl implements _GetapiModel {
  const _$GetapiModelImpl({this.userId, this.id, this.title, this.body});

  factory _$GetapiModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetapiModelImplFromJson(json);

  @override
  final int? userId;
  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? body;

  @override
  String toString() {
    return 'GetapiModel(userId: $userId, id: $id, title: $title, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetapiModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, id, title, body);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetapiModelImplCopyWith<_$GetapiModelImpl> get copyWith =>
      __$$GetapiModelImplCopyWithImpl<_$GetapiModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetapiModelImplToJson(
      this,
    );
  }
}

abstract class _GetapiModel implements GetapiModel {
  const factory _GetapiModel(
      {final int? userId,
      final int? id,
      final String? title,
      final String? body}) = _$GetapiModelImpl;

  factory _GetapiModel.fromJson(Map<String, dynamic> json) =
      _$GetapiModelImpl.fromJson;

  @override
  int? get userId;
  @override
  int? get id;
  @override
  String? get title;
  @override
  String? get body;
  @override
  @JsonKey(ignore: true)
  _$$GetapiModelImplCopyWith<_$GetapiModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
