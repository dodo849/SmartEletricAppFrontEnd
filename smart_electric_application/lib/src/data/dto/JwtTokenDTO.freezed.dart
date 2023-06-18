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
      _$JwtTokenDTOCopyWithImpl<$Res, JwtTokenDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: "access-token") String accessToken,
      @JsonKey(name: "refresh-token") String refreshToken});
}

/// @nodoc
class _$JwtTokenDTOCopyWithImpl<$Res, $Val extends JwtTokenDTO>
    implements $JwtTokenDTOCopyWith<$Res> {
  _$JwtTokenDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_JwtTokenDTOCopyWith<$Res>
    implements $JwtTokenDTOCopyWith<$Res> {
  factory _$$_JwtTokenDTOCopyWith(
          _$_JwtTokenDTO value, $Res Function(_$_JwtTokenDTO) then) =
      __$$_JwtTokenDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "access-token") String accessToken,
      @JsonKey(name: "refresh-token") String refreshToken});
}

/// @nodoc
class __$$_JwtTokenDTOCopyWithImpl<$Res>
    extends _$JwtTokenDTOCopyWithImpl<$Res, _$_JwtTokenDTO>
    implements _$$_JwtTokenDTOCopyWith<$Res> {
  __$$_JwtTokenDTOCopyWithImpl(
      _$_JwtTokenDTO _value, $Res Function(_$_JwtTokenDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_$_JwtTokenDTO(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
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
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
