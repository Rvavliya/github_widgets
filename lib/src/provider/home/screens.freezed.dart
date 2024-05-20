// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'screens.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Screens _$ScreensFromJson(Map<String, dynamic> json) {
  return _Screens.fromJson(json);
}

/// @nodoc
mixin _$Screens {
  @JsonKey(name: "fileName")
  String get fileName => throw _privateConstructorUsedError;
  @JsonKey(name: "navigation")
  dynamic get navigation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScreensCopyWith<Screens> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScreensCopyWith<$Res> {
  factory $ScreensCopyWith(Screens value, $Res Function(Screens) then) =
      _$ScreensCopyWithImpl<$Res, Screens>;
  @useResult
  $Res call(
      {@JsonKey(name: "fileName") String fileName,
      @JsonKey(name: "navigation") dynamic navigation});
}

/// @nodoc
class _$ScreensCopyWithImpl<$Res, $Val extends Screens>
    implements $ScreensCopyWith<$Res> {
  _$ScreensCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = null,
    Object? navigation = freezed,
  }) {
    return _then(_value.copyWith(
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      navigation: freezed == navigation
          ? _value.navigation
          : navigation // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScreensImplCopyWith<$Res> implements $ScreensCopyWith<$Res> {
  factory _$$ScreensImplCopyWith(
          _$ScreensImpl value, $Res Function(_$ScreensImpl) then) =
      __$$ScreensImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "fileName") String fileName,
      @JsonKey(name: "navigation") dynamic navigation});
}

/// @nodoc
class __$$ScreensImplCopyWithImpl<$Res>
    extends _$ScreensCopyWithImpl<$Res, _$ScreensImpl>
    implements _$$ScreensImplCopyWith<$Res> {
  __$$ScreensImplCopyWithImpl(
      _$ScreensImpl _value, $Res Function(_$ScreensImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = null,
    Object? navigation = freezed,
  }) {
    return _then(_$ScreensImpl(
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      navigation: freezed == navigation
          ? _value.navigation
          : navigation // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScreensImpl implements _Screens {
  const _$ScreensImpl(
      {@JsonKey(name: "fileName") required this.fileName,
      @JsonKey(name: "navigation") required this.navigation});

  factory _$ScreensImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScreensImplFromJson(json);

  @override
  @JsonKey(name: "fileName")
  final String fileName;
  @override
  @JsonKey(name: "navigation")
  final dynamic navigation;

  @override
  String toString() {
    return 'Screens(fileName: $fileName, navigation: $navigation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScreensImpl &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            const DeepCollectionEquality()
                .equals(other.navigation, navigation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, fileName, const DeepCollectionEquality().hash(navigation));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScreensImplCopyWith<_$ScreensImpl> get copyWith =>
      __$$ScreensImplCopyWithImpl<_$ScreensImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScreensImplToJson(
      this,
    );
  }
}

abstract class _Screens implements Screens {
  const factory _Screens(
          {@JsonKey(name: "fileName") required final String fileName,
          @JsonKey(name: "navigation") required final dynamic navigation}) =
      _$ScreensImpl;

  factory _Screens.fromJson(Map<String, dynamic> json) = _$ScreensImpl.fromJson;

  @override
  @JsonKey(name: "fileName")
  String get fileName;
  @override
  @JsonKey(name: "navigation")
  dynamic get navigation;
  @override
  @JsonKey(ignore: true)
  _$$ScreensImplCopyWith<_$ScreensImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
