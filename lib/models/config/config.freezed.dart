// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Config _$ConfigFromJson(Map<String, dynamic> json) {
  return _Config.fromJson(json);
}

/// @nodoc
class _$ConfigTearOff {
  const _$ConfigTearOff();

  _Config call(
      {required Flavor env, required bool production, required String apiUrl}) {
    return _Config(
      env: env,
      production: production,
      apiUrl: apiUrl,
    );
  }

  Config fromJson(Map<String, Object?> json) {
    return Config.fromJson(json);
  }
}

/// @nodoc
const $Config = _$ConfigTearOff();

/// @nodoc
mixin _$Config {
  Flavor get env => throw _privateConstructorUsedError;
  bool get production => throw _privateConstructorUsedError;
  String get apiUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConfigCopyWith<Config> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigCopyWith<$Res> {
  factory $ConfigCopyWith(Config value, $Res Function(Config) then) =
      _$ConfigCopyWithImpl<$Res>;
  $Res call({Flavor env, bool production, String apiUrl});
}

/// @nodoc
class _$ConfigCopyWithImpl<$Res> implements $ConfigCopyWith<$Res> {
  _$ConfigCopyWithImpl(this._value, this._then);

  final Config _value;
  // ignore: unused_field
  final $Res Function(Config) _then;

  @override
  $Res call({
    Object? env = freezed,
    Object? production = freezed,
    Object? apiUrl = freezed,
  }) {
    return _then(_value.copyWith(
      env: env == freezed
          ? _value.env
          : env // ignore: cast_nullable_to_non_nullable
              as Flavor,
      production: production == freezed
          ? _value.production
          : production // ignore: cast_nullable_to_non_nullable
              as bool,
      apiUrl: apiUrl == freezed
          ? _value.apiUrl
          : apiUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ConfigCopyWith<$Res> implements $ConfigCopyWith<$Res> {
  factory _$ConfigCopyWith(_Config value, $Res Function(_Config) then) =
      __$ConfigCopyWithImpl<$Res>;
  @override
  $Res call({Flavor env, bool production, String apiUrl});
}

/// @nodoc
class __$ConfigCopyWithImpl<$Res> extends _$ConfigCopyWithImpl<$Res>
    implements _$ConfigCopyWith<$Res> {
  __$ConfigCopyWithImpl(_Config _value, $Res Function(_Config) _then)
      : super(_value, (v) => _then(v as _Config));

  @override
  _Config get _value => super._value as _Config;

  @override
  $Res call({
    Object? env = freezed,
    Object? production = freezed,
    Object? apiUrl = freezed,
  }) {
    return _then(_Config(
      env: env == freezed
          ? _value.env
          : env // ignore: cast_nullable_to_non_nullable
              as Flavor,
      production: production == freezed
          ? _value.production
          : production // ignore: cast_nullable_to_non_nullable
              as bool,
      apiUrl: apiUrl == freezed
          ? _value.apiUrl
          : apiUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Config implements _Config {
  _$_Config(
      {required this.env, required this.production, required this.apiUrl});

  factory _$_Config.fromJson(Map<String, dynamic> json) =>
      _$$_ConfigFromJson(json);

  @override
  final Flavor env;
  @override
  final bool production;
  @override
  final String apiUrl;

  @override
  String toString() {
    return 'Config(env: $env, production: $production, apiUrl: $apiUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Config &&
            const DeepCollectionEquality().equals(other.env, env) &&
            const DeepCollectionEquality()
                .equals(other.production, production) &&
            const DeepCollectionEquality().equals(other.apiUrl, apiUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(env),
      const DeepCollectionEquality().hash(production),
      const DeepCollectionEquality().hash(apiUrl));

  @JsonKey(ignore: true)
  @override
  _$ConfigCopyWith<_Config> get copyWith =>
      __$ConfigCopyWithImpl<_Config>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConfigToJson(this);
  }
}

abstract class _Config implements Config {
  factory _Config(
      {required Flavor env,
      required bool production,
      required String apiUrl}) = _$_Config;

  factory _Config.fromJson(Map<String, dynamic> json) = _$_Config.fromJson;

  @override
  Flavor get env;
  @override
  bool get production;
  @override
  String get apiUrl;
  @override
  @JsonKey(ignore: true)
  _$ConfigCopyWith<_Config> get copyWith => throw _privateConstructorUsedError;
}
