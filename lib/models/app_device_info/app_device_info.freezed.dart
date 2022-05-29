// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_device_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppDeviceInfo {
  String get platform => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;
  String get buildNumber => throw _privateConstructorUsedError;
  String? get deviceModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppDeviceInfoCopyWith<AppDeviceInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppDeviceInfoCopyWith<$Res> {
  factory $AppDeviceInfoCopyWith(
          AppDeviceInfo value, $Res Function(AppDeviceInfo) then) =
      _$AppDeviceInfoCopyWithImpl<$Res>;
  $Res call(
      {String platform,
      String version,
      String buildNumber,
      String? deviceModel});
}

/// @nodoc
class _$AppDeviceInfoCopyWithImpl<$Res>
    implements $AppDeviceInfoCopyWith<$Res> {
  _$AppDeviceInfoCopyWithImpl(this._value, this._then);

  final AppDeviceInfo _value;
  // ignore: unused_field
  final $Res Function(AppDeviceInfo) _then;

  @override
  $Res call({
    Object? platform = freezed,
    Object? version = freezed,
    Object? buildNumber = freezed,
    Object? deviceModel = freezed,
  }) {
    return _then(_value.copyWith(
      platform: platform == freezed
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      buildNumber: buildNumber == freezed
          ? _value.buildNumber
          : buildNumber // ignore: cast_nullable_to_non_nullable
              as String,
      deviceModel: deviceModel == freezed
          ? _value.deviceModel
          : deviceModel // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_AppDeviceInfoCopyWith<$Res>
    implements $AppDeviceInfoCopyWith<$Res> {
  factory _$$_AppDeviceInfoCopyWith(
          _$_AppDeviceInfo value, $Res Function(_$_AppDeviceInfo) then) =
      __$$_AppDeviceInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String platform,
      String version,
      String buildNumber,
      String? deviceModel});
}

/// @nodoc
class __$$_AppDeviceInfoCopyWithImpl<$Res>
    extends _$AppDeviceInfoCopyWithImpl<$Res>
    implements _$$_AppDeviceInfoCopyWith<$Res> {
  __$$_AppDeviceInfoCopyWithImpl(
      _$_AppDeviceInfo _value, $Res Function(_$_AppDeviceInfo) _then)
      : super(_value, (v) => _then(v as _$_AppDeviceInfo));

  @override
  _$_AppDeviceInfo get _value => super._value as _$_AppDeviceInfo;

  @override
  $Res call({
    Object? platform = freezed,
    Object? version = freezed,
    Object? buildNumber = freezed,
    Object? deviceModel = freezed,
  }) {
    return _then(_$_AppDeviceInfo(
      platform: platform == freezed
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      buildNumber: buildNumber == freezed
          ? _value.buildNumber
          : buildNumber // ignore: cast_nullable_to_non_nullable
              as String,
      deviceModel: deviceModel == freezed
          ? _value.deviceModel
          : deviceModel // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AppDeviceInfo implements _AppDeviceInfo {
  const _$_AppDeviceInfo(
      {required this.platform,
      required this.version,
      required this.buildNumber,
      this.deviceModel});

  @override
  final String platform;
  @override
  final String version;
  @override
  final String buildNumber;
  @override
  final String? deviceModel;

  @override
  String toString() {
    return 'AppDeviceInfo(platform: $platform, version: $version, buildNumber: $buildNumber, deviceModel: $deviceModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppDeviceInfo &&
            const DeepCollectionEquality().equals(other.platform, platform) &&
            const DeepCollectionEquality().equals(other.version, version) &&
            const DeepCollectionEquality()
                .equals(other.buildNumber, buildNumber) &&
            const DeepCollectionEquality()
                .equals(other.deviceModel, deviceModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(platform),
      const DeepCollectionEquality().hash(version),
      const DeepCollectionEquality().hash(buildNumber),
      const DeepCollectionEquality().hash(deviceModel));

  @JsonKey(ignore: true)
  @override
  _$$_AppDeviceInfoCopyWith<_$_AppDeviceInfo> get copyWith =>
      __$$_AppDeviceInfoCopyWithImpl<_$_AppDeviceInfo>(this, _$identity);
}

abstract class _AppDeviceInfo implements AppDeviceInfo {
  const factory _AppDeviceInfo(
      {required final String platform,
      required final String version,
      required final String buildNumber,
      final String? deviceModel}) = _$_AppDeviceInfo;

  @override
  String get platform => throw _privateConstructorUsedError;
  @override
  String get version => throw _privateConstructorUsedError;
  @override
  String get buildNumber => throw _privateConstructorUsedError;
  @override
  String? get deviceModel => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AppDeviceInfoCopyWith<_$_AppDeviceInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
