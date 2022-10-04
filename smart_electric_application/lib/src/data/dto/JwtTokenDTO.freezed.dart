// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'JwtTokenDTO.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

JwtTokenDTO _$JwtTokenDTOFromJson(Map<String, dynamic> json) {
  return _JwtTokenDTO.fromJson(json);
}

/// @nodoc
mixin _$JwtTokenDTO {
  @JsonKey(name: "access-token")
  String get accessToken => throw _privateConstructorUsedError;
  @JsonKey(name: "refresh-token")
  String get refreshToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JwtTokenDTOCopyWith<JwtTokenDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JwtTokenDTOCopyWith<$Res> {
  factory $JwtTokenDTOCopyWith(
          JwtTokenDTO value, $Res Function(JwtTokenDTO) then) =
      _$JwtTokenDTOCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "access-token") String accessToken,
      @JsonKey(name: "refresh-token") String refreshToken});
}

/// @nodoc
class _$JwtTokenDTOCopyWithImpl<$Res> implements $JwtTokenDTOCopyWith<$Res> {
  _$JwtTokenDTOCopyWithImpl(this._value, this._then);

  final JwtTokenDTO _value;
  // ignore: unused_field
  final $Res Function(JwtTokenDTO) _then;

  @override
  $Res call({
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_value.copyWith(
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_JwtTokenDTOCopyWith<$Res>
    implements $JwtTokenDTOCopyWith<$Res> {
  factory _$$_JwtTokenDTOCopyWith(
          _$_JwtTokenDTO value, $Res Function(_$_JwtTokenDTO) then) =
      __$$_JwtTokenDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "access-token") String accessToken,
      @JsonKey(name: "refresh-token") String refreshToken});
}

/// @nodoc
class __$$_JwtTokenDTOCopyWithImpl<$Res> extends _$JwtTokenDTOCopyWithImpl<$Res>
    implements _$$_JwtTokenDTOCopyWith<$Res> {
  __$$_JwtTokenDTOCopyWithImpl(
      _$_JwtTokenDTO _value, $Res Function(_$_JwtTokenDTO) _then)
      : super(_value, (v) => _then(v as _$_JwtTokenDTO));

  @override
  _$_JwtTokenDTO get _value => super._value as _$_JwtTokenDTO;

  @override
  $Res call({
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
  }) {
    return _then(_$_JwtTokenDTO(
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_JwtTokenDTO implements _JwtTokenDTO {
  _$_JwtTokenDTO(
      {@JsonKey(name: "access-token") required this.accessToken,
      @JsonKey(name: "refresh-token") required this.refreshToken});

  factory _$_JwtTokenDTO.fromJson(Map<String, dynamic> json) =>
      _$$_JwtTokenDTOFromJson(json);

  @override
  @JsonKey(name: "access-token")
  final String accessToken;
  @override
  @JsonKey(name: "refresh-token")
  final String refreshToken;

  @override
  String toString() {
    return 'JwtTokenDTO(accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JwtTokenDTO &&
            const DeepCollectionEquality()
                .equals(other.accessToken, accessToken) &&
            const DeepCollectionEquality()
                .equals(other.refreshToken, refreshToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(accessToken),
      const DeepCollectionEquality().hash(refreshToken));

  @JsonKey(ignore: true)
  @override
  _$$_JwtTokenDTOCopyWith<_$_JwtTokenDTO> get copyWith =>
      __$$_JwtTokenDTOCopyWithImpl<_$_JwtTokenDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_JwtTokenDTOToJson(
      this,
    );
  }
}

abstract class _JwtTokenDTO implements JwtTokenDTO {
  factory _JwtTokenDTO(
          {@JsonKey(name: "access-token") required final String accessToken,
          @JsonKey(name: "refresh-token") required final String refreshToken}) =
      _$_JwtTokenDTO;

  factory _JwtTokenDTO.fromJson(Map<String, dynamic> json) =
      _$_JwtTokenDTO.fromJson;

  @override
  @JsonKey(name: "access-token")
  String get accessToken;
  @override
  @JsonKey(name: "refresh-token")
  String get refreshToken;
  @override
  @JsonKey(ignore: true)
  _$$_JwtTokenDTOCopyWith<_$_JwtTokenDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
